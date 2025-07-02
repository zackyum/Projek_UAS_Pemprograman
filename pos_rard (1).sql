-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jul 2025 pada 10.32
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_rard`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_fotocopy`
--

CREATE TABLE `detail_fotocopy` (
  `detail_id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `jasa_id` int(11) NOT NULL,
  `jumlah_lembar` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_fotocopy`
--

INSERT INTO `detail_fotocopy` (`detail_id`, `transaksi_id`, `jasa_id`, `jumlah_lembar`, `subtotal`) VALUES
(1, 4, 1, 10, '5000.00'),
(2, 5, 2, 1, '1000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_produk`
--

CREATE TABLE `detail_produk` (
  `detail_id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_produk`
--

INSERT INTO `detail_produk` (`detail_id`, `transaksi_id`, `produk_id`, `jumlah`, `subtotal`) VALUES
(1, 1, 1, 10, '10000.00'),
(2, 3, 2, 15, '30000.00'),
(3, 2, 3, 6, '60000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jasa_fotocopy`
--

CREATE TABLE `jasa_fotocopy` (
  `jasa_id` int(11) NOT NULL,
  `nama_layanan` varchar(100) NOT NULL,
  `harga_per_lembar` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jasa_fotocopy`
--

INSERT INTO `jasa_fotocopy` (`jasa_id`, `nama_layanan`, `harga_per_lembar`) VALUES
(1, 'Fotocopy', '500.00'),
(2, 'print_bw', '1000.00'),
(3, 'print_color', '2000.00'),
(4, 'jilid', '10000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `produk_id` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga_satuan` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`produk_id`, `nama_produk`, `stok`, `harga_satuan`) VALUES
(1, 'pensil', 100, '1000.00'),
(2, 'pulpen', 100, '2000.00'),
(3, 'spidol', 100, '10000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `total` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `user_id`, `tanggal`, `total`) VALUES
(1, 1, '2025-06-14 00:00:00', '10000.00'),
(2, 2, '2025-06-14 11:10:00', '60000.00'),
(3, 3, '2025-06-13 13:18:20', '30000.00'),
(4, 4, '2025-06-12 14:22:18', '5000.00'),
(5, 1, '2025-06-14 19:20:40', '1000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','pegawai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`) VALUES
(1, 'Ridwan', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'admin'),
(2, 'rayhan', '505ca4335f372d8da48d48eaed37d86c57337c855a566b21d6f492db73f1868a', 'pegawai'),
(3, 'zacky', 'becf77f3ec82a43422b7712134d1860e3205c6ce778b08417a7389b43f2b4661', 'admin'),
(4, 'denni', '996b029afefce8cea77db3bac776a2ddeceb7ed751fa19a559d9b5c1646588e3', 'pegawai');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_fotocopy`
--
ALTER TABLE `detail_fotocopy`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `jasa_id` (`jasa_id`);

--
-- Indeks untuk tabel `detail_produk`
--
ALTER TABLE `detail_produk`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indeks untuk tabel `jasa_fotocopy`
--
ALTER TABLE `jasa_fotocopy`
  ADD PRIMARY KEY (`jasa_id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produk_id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_fotocopy`
--
ALTER TABLE `detail_fotocopy`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `detail_produk`
--
ALTER TABLE `detail_produk`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `jasa_fotocopy`
--
ALTER TABLE `jasa_fotocopy`
  MODIFY `jasa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `produk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_fotocopy`
--
ALTER TABLE `detail_fotocopy`
  ADD CONSTRAINT `detail_fotocopy_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`transaksi_id`),
  ADD CONSTRAINT `detail_fotocopy_ibfk_2` FOREIGN KEY (`jasa_id`) REFERENCES `jasa_fotocopy` (`jasa_id`);

--
-- Ketidakleluasaan untuk tabel `detail_produk`
--
ALTER TABLE `detail_produk`
  ADD CONSTRAINT `detail_produk_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`transaksi_id`),
  ADD CONSTRAINT `detail_produk_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
