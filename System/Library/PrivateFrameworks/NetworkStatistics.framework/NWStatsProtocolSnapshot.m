@implementation NWStatsProtocolSnapshot

- (unint64_t)deltaAccountingRxWiFiBytes
{
  unint64_t v3;
  unint64_t rxWiFiBytes;
  BOOL v5;
  unint64_t result;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = -[NWStatsProtocolSnapshot deltaRxWiFiBytes](self, "deltaRxWiFiBytes");
  rxWiFiBytes = self->_adjustment_bytes.rxWiFiBytes;
  v5 = v3 >= rxWiFiBytes;
  result = v3 - rxWiFiBytes;
  if (!v5)
  {
    NStatGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = -[NWStatsProtocolSnapshot deltaRxWiFiBytes](self, "deltaRxWiFiBytes");
      v9 = self->_adjustment_bytes.rxWiFiBytes;
      v10 = 134218240;
      v11 = v8;
      v12 = 2048;
      v13 = v9;
      _os_log_impl(&dword_211429000, v7, OS_LOG_TYPE_ERROR, "VPN adjustment bytecounts > actual deltas in the snapshot. deltaRxWiFiBytes = %llu, adjustmentRxWiFiBytes = %llu", (uint8_t *)&v10, 0x16u);
    }

    return 0;
  }
  return result;
}

- (unint64_t)deltaAccountingRxCellularBytes
{
  unint64_t v3;
  unint64_t rxCellularBytes;
  BOOL v5;
  unint64_t result;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = -[NWStatsProtocolSnapshot deltaRxCellularBytes](self, "deltaRxCellularBytes");
  rxCellularBytes = self->_adjustment_bytes.rxCellularBytes;
  v5 = v3 >= rxCellularBytes;
  result = v3 - rxCellularBytes;
  if (!v5)
  {
    NStatGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = -[NWStatsProtocolSnapshot deltaRxCellularBytes](self, "deltaRxCellularBytes");
      v9 = self->_adjustment_bytes.rxCellularBytes;
      v10 = 134218240;
      v11 = v8;
      v12 = 2048;
      v13 = v9;
      _os_log_impl(&dword_211429000, v7, OS_LOG_TYPE_ERROR, "VPN adjustment bytecounts > actual deltas in the snapshot. deltaRxCellularBytes = %llu, adjustmentRxCellularBytes = %llu", (uint8_t *)&v10, 0x16u);
    }

    return 0;
  }
  return result;
}

- (unint64_t)_deltaForCurrentBytes:(unint64_t)a3 otherBytes:(unint64_t)a4 packets:(unint64_t)a5 prevBytes:(unint64_t)a6 prevOtherBytes:(unint64_t)a7 prevPackets:(unint64_t)a8
{
  uint64_t v11;
  void *v14;
  unint64_t result;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  NSObject *v21;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (a3 < a6)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Flow anomaly: flow %lld has negative bytecount delta, old count %lld new count %lld"), -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier"), a6, a3);
LABEL_5:
    v14 = (void *)v11;
    +[NWStatsProtocolSnapshot logFlowAnomaly:anomaly:](NWStatsProtocolSnapshot, "logFlowAnomaly:anomaly:", self, v11);

    return 0;
  }
  if (a5 < a8)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Flow anomaly: flow %lld has negative packet count delta, old count %lld new count %lld"), -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier"), a8, a5);
    goto LABEL_5;
  }
  v18 = -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:](self, "_adjustedByteCount:otherBytes:packets:", a3, a4, a5);
  v19 = -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:](self, "_adjustedByteCount:otherBytes:packets:", a6, a7, a8);
  v20 = v18 >= v19;
  result = v18 - v19;
  if (!v20)
  {
    NStatGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134219520;
      v23 = -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier");
      v24 = 2048;
      v25 = a3;
      v26 = 2048;
      v27 = a4;
      v28 = 2048;
      v29 = a5;
      v30 = 2048;
      v31 = a6;
      v32 = 2048;
      v33 = a7;
      v34 = 2048;
      v35 = a8;
      _os_log_impl(&dword_211429000, v21, OS_LOG_TYPE_ERROR, "Inverted numbers in delta calculations for flow %lld, current bytes %lld other bytes %lld pkts %lld when previous bytes %lld other %lld pkts %lld", buf, 0x48u);
    }

    return 0;
  }
  return result;
}

- (unint64_t)_adjustedByteCount:(unint64_t)a3 otherBytes:(unint64_t)a4 packets:(unint64_t)a5
{
  unint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!a3 || (self->_flags & 0x10) == 0 && -[NWStatsSnapshot snapshotReason](self, "snapshotReason") != 2)
    goto LABEL_19;
  v9 = -[NWStatsProtocolSnapshot _byteOverheadForPacketCount:](self, "_byteOverheadForPacketCount:", a5);
  if (a4)
  {
    if ((self->_flags & 0x10) == 0)
    {
      v9 = (unint64_t)((double)a3 / (double)(a4 + a3) * (double)v9);
      goto LABEL_7;
    }
    NStatGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v16 = -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier");
      _os_log_impl(&dword_211429000, v11, OS_LOG_TYPE_ERROR, "Unexpected multiple interface usage for TCP flow %lld", buf, 0xCu);
    }

    NStatGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[NWStatsProtocolSnapshot verboseDescription](self, "verboseDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = (unint64_t)v13;
      _os_log_impl(&dword_211429000, v12, OS_LOG_TYPE_ERROR, "Flow details %@", buf, 0xCu);

    }
LABEL_19:
    v9 = 0;
    return v9 + a3;
  }
LABEL_7:
  if (a5 >= 0x65 && v9 > 16 * a3)
  {
    if ((self->_flags & 0x1000000) == 0)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Possible flow anomaly, flow %lld has minimal average payload when packet counts %lld byte count %lld"), -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier"), a5, a3);
      +[NWStatsProtocolSnapshot logFlowAnomaly:anomaly:](NWStatsProtocolSnapshot, "logFlowAnomaly:anomaly:", self, v10);
      self->_flags |= 0x1000000u;

    }
    v9 = -[NWStatsProtocolSnapshot _byteOverheadForPacketCount:](self, "_byteOverheadForPacketCount:", 100);
    if (16 * a3 > v9)
      v9 = 16 * a3;
  }
  return v9 + a3;
}

- (unint64_t)_byteOverheadForPacketCount:(unint64_t)a3
{
  unsigned int flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  flags = self->_flags;
  LODWORD(v4) = (flags >> 2) & 8;
  if ((flags & 0x10) != 0)
    v4 = 20;
  else
    v4 = v4;
  v5 = v4 + 40;
  if ((flags & 8) == 0)
    v5 = v4;
  v6 = v4 + 20;
  if ((flags & 4) != 0)
    v7 = v6;
  else
    v7 = v5;
  return v7 * a3;
}

- (unint64_t)sourceIdentifier
{
  return self->_nstat_update.hdr.srcref;
}

- (unint64_t)deltaRxCellularBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:](self, "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:", self->_nstat_update.hdr.counts.nstat_cell_rxbytes, self->_nstat_update.hdr.counts.nstat_wired_rxbytes+ self->_nstat_update.hdr.counts.nstat_wifi_rxbytes+ self->_bluetooth_counts.nstat_rxbytes, self->_nstat_update.hdr.counts.nstat_rxpackets, self->_prev_items.savedRxCellularBytes, self->_prev_items.savedRxWiredBytes+ self->_prev_items.savedRxWiFiBytes+ self->_prev_items.savedRxCompanionLinkBluetoothBytes, self->_prev_items.savedRxPackets);
}

- (unint64_t)deltaAccountingTxCellularBytes
{
  unint64_t v3;
  unint64_t txCellularBytes;
  BOOL v5;
  unint64_t result;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = -[NWStatsProtocolSnapshot deltaTxCellularBytes](self, "deltaTxCellularBytes");
  txCellularBytes = self->_adjustment_bytes.txCellularBytes;
  v5 = v3 >= txCellularBytes;
  result = v3 - txCellularBytes;
  if (!v5)
  {
    NStatGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = -[NWStatsProtocolSnapshot deltaTxCellularBytes](self, "deltaTxCellularBytes");
      v9 = self->_adjustment_bytes.txCellularBytes;
      v10 = 134218240;
      v11 = v8;
      v12 = 2048;
      v13 = v9;
      _os_log_impl(&dword_211429000, v7, OS_LOG_TYPE_ERROR, "VPN adjustment bytecounts > actual deltas in the snapshot. deltaTxCellularBytes = %llu, adjustmentTxCellularBytes = %llu", (uint8_t *)&v10, 0x16u);
    }

    return 0;
  }
  return result;
}

- (unint64_t)deltaTxCellularBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:](self, "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:", self->_nstat_update.hdr.counts.nstat_cell_txbytes, self->_nstat_update.hdr.counts.nstat_wired_txbytes+ self->_nstat_update.hdr.counts.nstat_wifi_txbytes+ self->_bluetooth_counts.nstat_txbytes, self->_nstat_update.hdr.counts.nstat_txpackets, self->_prev_items.savedTxCellularBytes, self->_prev_items.savedTxWiredBytes+ self->_prev_items.savedTxWiFiBytes+ self->_prev_items.savedTxCompanionLinkBluetoothBytes, self->_prev_items.savedTxPackets);
}

- (unint64_t)deltaRxWiFiBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:](self, "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:", self->_nstat_update.hdr.counts.nstat_wifi_rxbytes, self->_nstat_update.hdr.counts.nstat_wired_rxbytes+ self->_nstat_update.hdr.counts.nstat_cell_rxbytes+ self->_bluetooth_counts.nstat_rxbytes, self->_nstat_update.hdr.counts.nstat_rxpackets, self->_prev_items.savedRxWiFiBytes, self->_prev_items.savedRxWiredBytes+ self->_prev_items.savedRxCellularBytes+ self->_prev_items.savedRxCompanionLinkBluetoothBytes, self->_prev_items.savedRxPackets);
}

+ (double)_referenceIntervalWithContinuousTime:(unint64_t)a3
{
  int v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v12;
  double v13;
  double v15;

  v5 = 9;
  do
  {
    v6 = mach_continuous_time();
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v8 = v7;
    v9 = mach_continuous_time() - v6;
    objc_msgSend(a1, "_intervalWithContinuousTime:", v9);
  }
  while (v10 * 1000000.0 >= 50.0 && v5-- != 0);
  v12 = v6 + (v9 >> 1);
  if (v12 <= a3)
  {
    objc_msgSend(a1, "_intervalWithContinuousTime:", a3 - v12);
    return v8 + v15;
  }
  else
  {
    objc_msgSend(a1, "_intervalWithContinuousTime:", v12 - a3);
    return v8 - v13;
  }
}

+ (double)_intervalWithContinuousTime:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;

  LODWORD(v3) = timebase_info_0;
  LODWORD(v4) = *(_DWORD *)algn_253D924CC;
  return (double)a3 * (double)v3 / (double)v4 / 1000000000.0;
}

- (id)_createNSUUIDForBytes:(unsigned __int8)a3[16]
{
  void *v4;

  if (uuid_is_null(a3))
    v4 = 0;
  else
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  return v4;
}

- (unint64_t)rxCellularBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:](self, "_adjustedByteCount:otherBytes:packets:", self->_nstat_update.hdr.counts.nstat_cell_rxbytes, self->_nstat_update.hdr.counts.nstat_wired_rxbytes+ self->_nstat_update.hdr.counts.nstat_wifi_rxbytes+ self->_bluetooth_counts.nstat_rxbytes, self->_nstat_update.hdr.counts.nstat_rxpackets);
}

- (unint64_t)txCellularBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:](self, "_adjustedByteCount:otherBytes:packets:", self->_nstat_update.hdr.counts.nstat_cell_txbytes, self->_nstat_update.hdr.counts.nstat_wired_txbytes+ self->_nstat_update.hdr.counts.nstat_wifi_txbytes+ self->_bluetooth_counts.nstat_txbytes, self->_nstat_update.hdr.counts.nstat_txpackets);
}

- (unint64_t)rxWiFiBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:](self, "_adjustedByteCount:otherBytes:packets:", self->_nstat_update.hdr.counts.nstat_wifi_rxbytes, self->_nstat_update.hdr.counts.nstat_wired_rxbytes+ self->_nstat_update.hdr.counts.nstat_cell_rxbytes+ self->_bluetooth_counts.nstat_rxbytes, self->_nstat_update.hdr.counts.nstat_rxpackets);
}

- (unint64_t)txWiFiBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:](self, "_adjustedByteCount:otherBytes:packets:", self->_nstat_update.hdr.counts.nstat_wifi_txbytes, self->_nstat_update.hdr.counts.nstat_wired_txbytes+ self->_nstat_update.hdr.counts.nstat_cell_txbytes+ self->_bluetooth_counts.nstat_txbytes, self->_nstat_update.hdr.counts.nstat_txpackets);
}

- (id)briefDescription
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  unint64_t v11;
  id v12;

  v12 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[NWStatsSnapshot processName](self, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsProtocolSnapshot flowType](self, "flowType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier");
  -[NWStatsProtocolSnapshot snapshotReasonString](self, "snapshotReasonString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NWStatsProtocolSnapshot failedConsistencyChecks](self, "failedConsistencyChecks"))
    v6 = CFSTR("-inconsistent");
  else
    v6 = &stru_24CBD3FC0;
  -[NWStatsProtocolSnapshot _interfaceCellularViaFallbackConciseString](self, "_interfaceCellularViaFallbackConciseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NWStatsProtocolSnapshot flowUsesChannels](self, "flowUsesChannels"))
    v8 = CFSTR("ch");
  else
    v8 = CFSTR("so");
  v9 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@ %@ flow id %lld (%@%@) %@%@ pkts rx %lld tx %lld, bytes %lld %lld"), v3, v4, v11, v5, v6, v7, v8, -[NWStatsProtocolSnapshot rxPackets](self, "rxPackets"), -[NWStatsProtocolSnapshot txPackets](self, "txPackets"), -[NWStatsProtocolSnapshot rxBytes](self, "rxBytes"), -[NWStatsProtocolSnapshot txBytes](self, "txBytes"));

  return v9;
}

- (unint64_t)rxBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxbytes;
}

- (unint64_t)txBytes
{
  return self->_nstat_update.hdr.counts.nstat_txbytes;
}

- (BOOL)failedConsistencyChecks
{
  return (self->_flags & 0xF00) != 0;
}

- (unint64_t)txPackets
{
  return self->_nstat_update.hdr.counts.nstat_txpackets;
}

- (unint64_t)rxPackets
{
  return self->_nstat_update.hdr.counts.nstat_rxpackets;
}

- (NSString)verboseDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[NWStatsProtocolSnapshot briefDescription](self, "briefDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsProtocolSnapshot countsDescription](self, "countsDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsProtocolSnapshot savedCountsDescription](self, "savedCountsDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsProtocolSnapshot savedAccumulatorCountsDescription](self, "savedAccumulatorCountsDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsProtocolSnapshot descriptorDescription](self, "descriptorDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n    %@\n    %@\n    %@\n    %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)snapshotReasonString
{
  int v2;

  v2 = -[NWStatsSnapshot snapshotReason](self, "snapshotReason") - 1;
  if (v2 > 3)
    return CFSTR("unknown");
  else
    return *(&off_24CBD2D68 + v2);
}

- (NSString)savedCountsDescription
{
  const update_subset_for_deltas *v2;

  v2 = -[NWStatsProtocolSnapshot _update_delta_ptr](self, "_update_delta_ptr");
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("saved rx/tx pkts %lld %lld bytes %lld %lld cell %lld %lld wifi %lld %lld wired %lld %lld dup %d ooo %d retx %d"), v2->savedRxPackets, v2->savedTxPackets, v2->savedRxBytes, v2->savedTxBytes, v2->savedRxCellularBytes, v2->savedTxCellularBytes, v2->savedRxWiFiBytes, v2->savedTxWiFiBytes, v2->savedRxWiredBytes, v2->savedTxWiredBytes, v2->savedRxDuplicateBytes, v2->savedRxOutOfOrderBytes, v2->savedTxRetransmittedBytes);
}

- (NSString)savedAccumulatorCountsDescription
{
  accumulator_bytes *v2;

  v2 = -[NWStatsProtocolSnapshot _update_adjustment_bytes](self, "_update_adjustment_bytes");
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("saved rx/tx cell %lld %lld wifi %lld %lld wired %lld %lld"), v2->rxCellularBytes, v2->txCellularBytes, v2->rxWiFiBytes, v2->txWiFiBytes, v2->rxWiredBytes, v2->txWiredBytes);
}

- (NSString)flowType
{
  unsigned int flags;
  unsigned int v4;

  flags = self->_flags;
  if ((flags & 0x10) != 0)
  {
    if ((flags & 4) != 0)
    {
      return (NSString *)CFSTR("TCP4");
    }
    else if ((flags & 8) != 0)
    {
      return (NSString *)CFSTR("TCP6");
    }
    else
    {
      return (NSString *)CFSTR("TCP??");
    }
  }
  else
  {
    if ((flags & 0x20) == 0)
      return (NSString *)CFSTR("???");
    v4 = self->_flags & 0xCC;
    if (v4 > 0x47)
    {
      switch(v4)
      {
        case 0x48u:
          return (NSString *)CFSTR("QUIC6");
        case 0x84u:
          return (NSString *)CFSTR("UDPSUBFLOW4");
        case 0x88u:
          return (NSString *)CFSTR("UDPSUBFLOW6");
      }
    }
    else
    {
      switch(v4)
      {
        case 4u:
          return (NSString *)CFSTR("UDP4");
        case 8u:
          return (NSString *)CFSTR("UDP6");
        case 0x44u:
          return (NSString *)CFSTR("QUIC4");
      }
    }
    return (NSString *)CFSTR("UDP??");
  }
}

- (NSString)countsDescription
{
  const nstat_msg_src_update_convenient *v2;

  v2 = -[NWStatsProtocolSnapshot _update_ptr](self, "_update_ptr");
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("count rx/tx pkts %lld %lld bytes %lld %lld cell %lld %lld wifi %lld %lld wired %lld %lld dup %d ooo %d retx %d"), v2->hdr.counts.nstat_rxpackets, v2->hdr.counts.nstat_txpackets, v2->hdr.counts.nstat_rxbytes, v2->hdr.counts.nstat_txbytes, v2->hdr.counts.nstat_cell_rxbytes, v2->hdr.counts.nstat_cell_txbytes, v2->hdr.counts.nstat_wifi_rxbytes, v2->hdr.counts.nstat_wifi_txbytes, v2->hdr.counts.nstat_wired_rxbytes, v2->hdr.counts.nstat_wired_txbytes, v2->hdr.counts.nstat_rxduplicatebytes, v2->hdr.counts.nstat_rxoutoforderbytes, v2->hdr.counts.nstat_txretransmit);
}

- (accumulator_bytes)_update_adjustment_bytes
{
  return &self->_adjustment_bytes;
}

- (id)_interfaceCellularViaFallbackConciseString
{
  __CFString *v3;

  if (-[NWStatsProtocolSnapshot interfaceCellularViaFastFallback](self, "interfaceCellularViaFastFallback"))
  {
    v3 = CFSTR("fastRNF ");
  }
  else if (-[NWStatsProtocolSnapshot interfaceCellularViaSlowFallback](self, "interfaceCellularViaSlowFallback"))
  {
    v3 = CFSTR("slowRNF ");
  }
  else if (-[NWStatsProtocolSnapshot interfaceCellularViaPreferredFallback](self, "interfaceCellularViaPreferredFallback"))
  {
    v3 = CFSTR("prefRNF ");
  }
  else if (-[NWStatsProtocolSnapshot interfaceCellularViaIndependentFallback](self, "interfaceCellularViaIndependentFallback"))
  {
    v3 = CFSTR("indRNF ");
  }
  else if (-[NWStatsProtocolSnapshot interfaceCellularViaAnyFallback](self, "interfaceCellularViaAnyFallback"))
  {
    v3 = CFSTR("unqualifiedRNF ");
  }
  else
  {
    v3 = &stru_24CBD3FC0;
  }
  return v3;
}

- (BOOL)attributedEntityIsBundleName
{
  return attributionReasonImpliesBundleName(-[NWStatsSnapshot attributionReason](self, "attributionReason"));
}

- (BOOL)attributedEntityIsProcessName
{
  return attributionReasonImpliesProcessName(-[NWStatsSnapshot attributionReason](self, "attributionReason"));
}

- (void)setAppStateIsForeground:(BOOL)a3 screenStateOn:(BOOL)a4 startAppStateIsForeground:(BOOL)a5 startScreenStateOn:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  -[NWStatsSnapshot setSnapshotAppStateIsForeground:](self, "setSnapshotAppStateIsForeground:", a3);
  -[NWStatsSnapshot setSnapshotScreenStateOn:](self, "setSnapshotScreenStateOn:", v8);
  -[NWStatsSnapshot setStartAppStateIsForeground:](self, "setStartAppStateIsForeground:", v7);
  -[NWStatsSnapshot setStartScreenStateOn:](self, "setStartScreenStateOn:", v6);
}

- (void)setDomainName:(id)a3 owner:(id)a4 context:(id)a5 attributedBundleId:(id)a6 isTracker:(BOOL)a7 isNonAppInitiated:(BOOL)a8 isSilent:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v9 = a8;
  v10 = a7;
  v22 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (v22)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v22);
    -[NWStatsSnapshot setDomainName:](self, "setDomainName:", v18);

    if (v15)
      goto LABEL_3;
  }
  else
  {
    -[NWStatsSnapshot setDomainName:](self, "setDomainName:", 0);
    if (v15)
    {
LABEL_3:
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v15);
      -[NWStatsSnapshot setDomainOwner:](self, "setDomainOwner:", v19);

      if (v16)
        goto LABEL_4;
LABEL_8:
      -[NWStatsSnapshot setDomainTrackerContext:](self, "setDomainTrackerContext:", 0);
      if (v17)
        goto LABEL_5;
LABEL_9:
      -[NWStatsSnapshot setDomainAttributedBundleId:](self, "setDomainAttributedBundleId:", 0);
      goto LABEL_10;
    }
  }
  -[NWStatsSnapshot setDomainOwner:](self, "setDomainOwner:", 0);
  if (!v16)
    goto LABEL_8;
LABEL_4:
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v16);
  -[NWStatsSnapshot setDomainTrackerContext:](self, "setDomainTrackerContext:", v20);

  if (!v17)
    goto LABEL_9;
LABEL_5:
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v17);
  -[NWStatsSnapshot setDomainAttributedBundleId:](self, "setDomainAttributedBundleId:", v21);

LABEL_10:
  -[NWStatsSnapshot setIsTracker:](self, "setIsTracker:", v10);
  -[NWStatsSnapshot setIsNonAppInitiated:](self, "setIsNonAppInitiated:", v9);
  -[NWStatsSnapshot setIsSilent:](self, "setIsSilent:", a9);

}

- (void)runConsistencyChecks
{
  const nstat_msg_src_update_convenient *v3;
  const update_subset_for_deltas *v4;
  unint64_t nstat_rxbytes;
  unint64_t nstat_cell_rxbytes;
  unint64_t nstat_wifi_rxbytes;
  unint64_t nstat_wired_rxbytes;
  unint64_t nstat_cell_txbytes;
  _BOOL4 v10;
  unsigned int flags;
  NSObject *v12;
  unsigned int v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  int v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = -[NWStatsProtocolSnapshot _update_ptr](self, "_update_ptr");
  v4 = -[NWStatsProtocolSnapshot _update_delta_ptr](self, "_update_delta_ptr");
  nstat_rxbytes = v3->hdr.counts.nstat_rxbytes;
  if (v3->hdr.counts.nstat_rxpackets < v4->savedRxPackets
    || nstat_rxbytes < v4->savedRxBytes
    || v3->hdr.counts.nstat_txpackets < v4->savedTxPackets
    || v3->hdr.counts.nstat_txbytes < v4->savedTxBytes
    || (nstat_cell_rxbytes = v3->hdr.counts.nstat_cell_rxbytes, nstat_cell_rxbytes < v4->savedRxCellularBytes)
    || v3->hdr.counts.nstat_cell_txbytes < v4->savedTxCellularBytes
    || (nstat_wifi_rxbytes = v3->hdr.counts.nstat_wifi_rxbytes, nstat_wifi_rxbytes < v4->savedRxWiFiBytes)
    || v3->hdr.counts.nstat_wifi_txbytes < v4->savedTxWiFiBytes
    || (nstat_wired_rxbytes = v3->hdr.counts.nstat_wired_rxbytes, nstat_wired_rxbytes < v4->savedRxWiredBytes)
    || v3->hdr.counts.nstat_wired_txbytes < v4->savedTxWiredBytes
    || v3->hdr.counts.nstat_rxduplicatebytes < v4->savedRxDuplicateBytes
    || v3->hdr.counts.nstat_rxoutoforderbytes < v4->savedRxOutOfOrderBytes
    || v3->hdr.counts.nstat_txretransmit < v4->savedTxRetransmittedBytes)
  {
    self->_flags |= 0x100u;
    nstat_cell_rxbytes = v3->hdr.counts.nstat_cell_rxbytes;
    nstat_wifi_rxbytes = v3->hdr.counts.nstat_wifi_rxbytes;
    nstat_wired_rxbytes = v3->hdr.counts.nstat_wired_rxbytes;
  }
  if (nstat_wifi_rxbytes + nstat_cell_rxbytes + nstat_wired_rxbytes < nstat_rxbytes
    && !-[NWStatsProtocolSnapshot interfaceUnknown](self, "interfaceUnknown")
    && !-[NWStatsProtocolSnapshot interfaceLoopback](self, "interfaceLoopback")
    && !-[NWStatsProtocolSnapshot interfaceCompanionLink](self, "interfaceCompanionLink")
    && (self->_flags & 0x10) != 0
    && -[NWStatsProtocolSnapshot noBluetoothUseExpected:](self, "noBluetoothUseExpected:", -[NWStatsProtocolSnapshot interfaceIndex](self, "interfaceIndex"))&& v3->hdr.counts.nstat_cell_rxbytes + v3->hdr.counts.nstat_wifi_rxbytes + v3->hdr.counts.nstat_wired_rxbytes + 100 < v3->hdr.counts.nstat_rxbytes)
  {
    self->_flags |= 0x200u;
  }
  if ((self->_flags & 0x10) != 0)
  {
    if (v3->hdr.counts.nstat_cell_rxbytes || (nstat_cell_txbytes = v3->hdr.counts.nstat_cell_txbytes) != 0)
      LODWORD(nstat_cell_txbytes) = 1;
    if (v3->hdr.counts.nstat_wifi_rxbytes || v3->hdr.counts.nstat_wifi_txbytes)
      LODWORD(nstat_cell_txbytes) = nstat_cell_txbytes + 1;
    if (v3->hdr.counts.nstat_wired_rxbytes || v3->hdr.counts.nstat_wired_txbytes)
      LODWORD(nstat_cell_txbytes) = nstat_cell_txbytes + 1;
    if (nstat_cell_txbytes >= 2
      && -[NWStatsProtocolSnapshot fixedInterfaceUseExpected:](self, "fixedInterfaceUseExpected:", -[NWStatsProtocolSnapshot interfaceIndex](self, "interfaceIndex")))
    {
      self->_flags |= 0x400u;
    }
  }
  v10 = -[NWStatsProtocolSnapshot failedSkywalkAction](self, "failedSkywalkAction");
  flags = self->_flags;
  if (v10)
  {
    flags |= 0x800u;
    self->_flags = flags;
  }
  if ((flags & 0xF00) != 0)
  {
    NStatGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = self->_flags;
      v14 = &stru_24CBD3FC0;
      if ((v13 & 0x100) != 0)
        v15 = CFSTR("(negative delta) ");
      else
        v15 = &stru_24CBD3FC0;
      if ((v13 & 0x200) != 0)
        v16 = CFSTR("(inconsistent rx counts) ");
      else
        v16 = &stru_24CBD3FC0;
      if ((v13 & 0x400) != 0)
        v17 = CFSTR("(multiple TCP interfaces) ");
      else
        v17 = &stru_24CBD3FC0;
      if (-[NWStatsProtocolSnapshot failedRouteValuesLookup](self, "failedRouteValuesLookup"))
        v18 = CFSTR("(no route lookup) ");
      else
        v18 = &stru_24CBD3FC0;
      if (-[NWStatsProtocolSnapshot failedFlowswitchValuesLookup](self, "failedFlowswitchValuesLookup"))
        v14 = CFSTR("(no flowswitch lookup) ");
      -[NWStatsProtocolSnapshot verboseDescription](self, "verboseDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138413570;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      v28 = 2112;
      v29 = v14;
      v30 = 2112;
      v31 = v19;
      _os_log_impl(&dword_211429000, v12, OS_LOG_TYPE_ERROR, "failed consistency checks %@%@%@%@%@ %@", (uint8_t *)&v20, 0x3Eu);

    }
  }
}

- (const)_update_ptr
{
  return &self->_nstat_update;
}

- (BOOL)interfaceCompanionLink
{
  return self->_interfaceCompanionLink;
}

- (const)_update_delta_ptr
{
  return &self->_prev_items;
}

- (unint64_t)deltaAccountingTxWiFiBytes
{
  unint64_t v3;
  unint64_t txWiFiBytes;
  BOOL v5;
  unint64_t result;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = -[NWStatsProtocolSnapshot deltaTxWiFiBytes](self, "deltaTxWiFiBytes");
  txWiFiBytes = self->_adjustment_bytes.txWiFiBytes;
  v5 = v3 >= txWiFiBytes;
  result = v3 - txWiFiBytes;
  if (!v5)
  {
    NStatGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = -[NWStatsProtocolSnapshot deltaTxWiFiBytes](self, "deltaTxWiFiBytes");
      v9 = self->_adjustment_bytes.txWiFiBytes;
      v10 = 134218240;
      v11 = v8;
      v12 = 2048;
      v13 = v9;
      _os_log_impl(&dword_211429000, v7, OS_LOG_TYPE_ERROR, "VPN adjustment bytecounts > actual deltas in the snapshot. deltaTxWiFiBytes = %llu, adjustmentTxWiFiBytes = %llu", (uint8_t *)&v10, 0x16u);
    }

    return 0;
  }
  return result;
}

- (unint64_t)deltaTxWiFiBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:](self, "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:", self->_nstat_update.hdr.counts.nstat_wifi_txbytes, self->_nstat_update.hdr.counts.nstat_wired_txbytes+ self->_nstat_update.hdr.counts.nstat_cell_txbytes+ self->_bluetooth_counts.nstat_txbytes, self->_nstat_update.hdr.counts.nstat_txpackets, self->_prev_items.savedTxWiFiBytes, self->_prev_items.savedTxWiredBytes+ self->_prev_items.savedTxCellularBytes+ self->_prev_items.savedTxCompanionLinkBluetoothBytes, self->_prev_items.savedTxPackets);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAddressString, 0);
  objc_storeStrong((id *)&self->_localAddressString, 0);
  objc_storeStrong((id *)&self->_remoteAddress, 0);
  objc_storeStrong((id *)&self->_localAddress, 0);
  objc_storeStrong((id *)&self->_flowuuid, 0);
  objc_storeStrong((id *)&self->_vuuid, 0);
  objc_storeStrong((id *)&self->_flowSnapshotTimestamp, 0);
  objc_storeStrong((id *)&self->_flowStartTimestamp, 0);
}

- (unint64_t)deltaAccountingTxWiredBytes
{
  unint64_t v3;
  unint64_t txWiredBytes;
  BOOL v5;
  unint64_t result;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = -[NWStatsProtocolSnapshot deltaTxWiredBytes](self, "deltaTxWiredBytes");
  txWiredBytes = self->_adjustment_bytes.txWiredBytes;
  v5 = v3 >= txWiredBytes;
  result = v3 - txWiredBytes;
  if (!v5)
  {
    NStatGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = -[NWStatsProtocolSnapshot deltaTxWiredBytes](self, "deltaTxWiredBytes");
      v9 = self->_adjustment_bytes.txWiredBytes;
      v10 = 134218240;
      v11 = v8;
      v12 = 2048;
      v13 = v9;
      _os_log_impl(&dword_211429000, v7, OS_LOG_TYPE_ERROR, "VPN adjustment bytecounts > actual deltas in the snapshot. deltaTxWiredBytes = %llu, adjustmentTxWiredBytes = %llu", (uint8_t *)&v10, 0x16u);
    }

    return 0;
  }
  return result;
}

- (unint64_t)deltaTxWiredBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:](self, "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:", self->_nstat_update.hdr.counts.nstat_wired_txbytes, self->_nstat_update.hdr.counts.nstat_wifi_txbytes+ self->_nstat_update.hdr.counts.nstat_cell_txbytes+ self->_bluetooth_counts.nstat_txbytes, self->_nstat_update.hdr.counts.nstat_txpackets, self->_prev_items.savedTxWiredBytes, self->_prev_items.savedTxWiFiBytes+ self->_prev_items.savedTxCellularBytes+ self->_prev_items.savedTxCompanionLinkBluetoothBytes, self->_prev_items.savedTxPackets);
}

- (unint64_t)deltaAccountingRxWiredBytes
{
  unint64_t v3;
  unint64_t rxWiredBytes;
  BOOL v5;
  unint64_t result;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = -[NWStatsProtocolSnapshot deltaRxWiredBytes](self, "deltaRxWiredBytes");
  rxWiredBytes = self->_adjustment_bytes.rxWiredBytes;
  v5 = v3 >= rxWiredBytes;
  result = v3 - rxWiredBytes;
  if (!v5)
  {
    NStatGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = -[NWStatsProtocolSnapshot deltaRxWiredBytes](self, "deltaRxWiredBytes");
      v9 = self->_adjustment_bytes.rxWiredBytes;
      v10 = 134218240;
      v11 = v8;
      v12 = 2048;
      v13 = v9;
      _os_log_impl(&dword_211429000, v7, OS_LOG_TYPE_ERROR, "VPN adjustment bytecounts > actual deltas in the snapshot. deltaRxWiredBytes = %llu, adjustmentRxWiredBytes = %llu", (uint8_t *)&v10, 0x16u);
    }

    return 0;
  }
  return result;
}

- (unint64_t)deltaRxWiredBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:](self, "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:", self->_nstat_update.hdr.counts.nstat_wired_rxbytes, self->_nstat_update.hdr.counts.nstat_wifi_rxbytes+ self->_nstat_update.hdr.counts.nstat_cell_rxbytes+ self->_bluetooth_counts.nstat_rxbytes, self->_nstat_update.hdr.counts.nstat_rxpackets, self->_prev_items.savedRxWiredBytes, self->_prev_items.savedRxWiFiBytes+ self->_prev_items.savedRxCellularBytes+ self->_prev_items.savedRxCompanionLinkBluetoothBytes, self->_prev_items.savedRxPackets);
}

- (unsigned)_rxDuplicateBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxduplicatebytes;
}

- (unsigned)_txRetransmittedBytes
{
  return self->_nstat_update.hdr.counts.nstat_txretransmit;
}

- (unsigned)_rxOutOfOrderBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxoutoforderbytes;
}

- (unsigned)_deltaTxRetransmittedBytes
{
  return self->_nstat_update.hdr.counts.nstat_txretransmit - self->_prev_items.savedTxRetransmittedBytes;
}

- (unsigned)_deltaRxOutOfOrderBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxoutoforderbytes - self->_prev_items.savedRxOutOfOrderBytes;
}

- (unsigned)_deltaRxDuplicateBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxduplicatebytes - self->_prev_items.savedRxDuplicateBytes;
}

- (NSString)interfaceCellularViaFallbackString
{
  __CFString *v3;

  if (-[NWStatsProtocolSnapshot interfaceCellularViaFastFallback](self, "interfaceCellularViaFastFallback"))
  {
    v3 = CFSTR("fastFallback");
  }
  else if (-[NWStatsProtocolSnapshot interfaceCellularViaSlowFallback](self, "interfaceCellularViaSlowFallback"))
  {
    v3 = CFSTR("slowFallback");
  }
  else if (-[NWStatsProtocolSnapshot interfaceCellularViaPreferredFallback](self, "interfaceCellularViaPreferredFallback"))
  {
    v3 = CFSTR("preferredFallback");
  }
  else if (-[NWStatsProtocolSnapshot interfaceCellularViaIndependentFallback](self, "interfaceCellularViaIndependentFallback"))
  {
    v3 = CFSTR("independentFallback");
  }
  else if (-[NWStatsProtocolSnapshot interfaceCellularViaAnyFallback](self, "interfaceCellularViaAnyFallback"))
  {
    v3 = CFSTR("unqualifiedFallback");
  }
  else
  {
    v3 = &stru_24CBD3FC0;
  }
  return (NSString *)v3;
}

- (id)description
{
  _BOOL4 v3;
  const __CFString *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  void *v9;
  const __CFString *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[NWStatsSnapshot processName](self, "processName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsProtocolSnapshot flowType](self, "flowType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier");
  -[NWStatsProtocolSnapshot snapshotReasonString](self, "snapshotReasonString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[NWStatsProtocolSnapshot failedConsistencyChecks](self, "failedConsistencyChecks");
  v4 = &stru_24CBD3FC0;
  if (v3)
    v4 = CFSTR("-inconsistent");
  v10 = v4;
  -[NWStatsProtocolSnapshot _interfaceCellularViaFallbackConciseString](self, "_interfaceCellularViaFallbackConciseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NWStatsProtocolSnapshot flowUsesChannels](self, "flowUsesChannels");
  v6 = CFSTR("so");
  if (v5)
    v6 = CFSTR("ch");
  v7 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@ %@ flow id %lld (%@%@) %@%@ i/f %d props 0x%x first %d pkts rx %lld tx %lld, bytes %lld %lld cell %lld %lld wifi %lld %lld wired %lld %lld comp_bt %lld %lld deltas %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld acct_deltas %lld %lld %lld %lld %lld %lld"), v14, v13, v12, v11, v10, v9, v6, -[NWStatsProtocolSnapshot interfaceIndex](self, "interfaceIndex"), -[NWStatsProtocolSnapshot ifnet_properties](self, "ifnet_properties"), -[NWStatsSnapshot firstOccurrence](self, "firstOccurrence"), -[NWStatsProtocolSnapshot rxPackets](self, "rxPackets"), -[NWStatsProtocolSnapshot txPackets](self, "txPackets"), -[NWStatsProtocolSnapshot rxBytes](self, "rxBytes"), -[NWStatsProtocolSnapshot txBytes](self, "txBytes"), -[NWStatsProtocolSnapshot rxCellularBytes](self, "rxCellularBytes"), -[NWStatsProtocolSnapshot txCellularBytes](self, "txCellularBytes"),
                 -[NWStatsProtocolSnapshot rxWiFiBytes](self, "rxWiFiBytes"),
                 -[NWStatsProtocolSnapshot txWiFiBytes](self, "txWiFiBytes"),
                 -[NWStatsProtocolSnapshot rxWiredBytes](self, "rxWiredBytes"),
                 -[NWStatsProtocolSnapshot txWiredBytes](self, "txWiredBytes"),
                 -[NWStatsProtocolSnapshot rxCompanionLinkBluetoothBytes](self, "rxCompanionLinkBluetoothBytes"),
                 -[NWStatsProtocolSnapshot txCompanionLinkBluetoothBytes](self, "txCompanionLinkBluetoothBytes"),
                 -[NWStatsProtocolSnapshot deltaRxBytes](self, "deltaRxBytes"),
                 -[NWStatsProtocolSnapshot deltaTxBytes](self, "deltaTxBytes"),
                 -[NWStatsProtocolSnapshot deltaRxCellularBytes](self, "deltaRxCellularBytes"),
                 -[NWStatsProtocolSnapshot deltaTxCellularBytes](self, "deltaTxCellularBytes"),
                 -[NWStatsProtocolSnapshot deltaRxWiFiBytes](self, "deltaRxWiFiBytes"),
                 -[NWStatsProtocolSnapshot deltaTxWiFiBytes](self, "deltaTxWiFiBytes"),
                 -[NWStatsProtocolSnapshot deltaRxWiredBytes](self, "deltaRxWiredBytes"),
                 -[NWStatsProtocolSnapshot deltaTxWiredBytes](self, "deltaTxWiredBytes"),
                 -[NWStatsProtocolSnapshot deltaRxCompanionLinkBluetoothBytes](self, "deltaRxCompanionLinkBluetoothBytes"), -[NWStatsProtocolSnapshot deltaTxCompanionLinkBluetoothBytes](self, "deltaTxCompanionLinkBluetoothBytes"), -[NWStatsProtocolSnapshot deltaAccountingRxCellularBytes](self, "deltaAccountingRxCellularBytes"), -[NWStatsProtocolSnapshot deltaAccountingTxCellularBytes](self, "deltaAccountingTxCellularBytes"), -[NWStatsProtocolSnapshot deltaAccountingRxWiFiBytes](self, "deltaAccountingRxWiFiBytes"), -[NWStatsProtocolSnapshot deltaAccountingTxWiFiBytes](self, "deltaAccountingTxWiFiBytes"), -[NWStatsProtocolSnapshot deltaAccountingRxWiredBytes](self, "deltaAccountingRxWiredBytes"), -[NWStatsProtocolSnapshot deltaAccountingTxWiredBytes](self, "deltaAccountingTxWiredBytes"));

  return v7;
}

- (id)domainDescription
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v14 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[NWStatsSnapshot processName](self, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsProtocolSnapshot flowType](self, "flowType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier");
  -[NWStatsProtocolSnapshot snapshotReasonString](self, "snapshotReasonString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsProtocolSnapshot flowuuid](self, "flowuuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSnapshot domainName](self, "domainName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSnapshot domainOwner](self, "domainOwner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSnapshot domainTrackerContext](self, "domainTrackerContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSnapshot domainAttributedBundleId](self, "domainAttributedBundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@ %@ flow id %lld (%@) fuuid %@ domain name %@ owner %@ context %@ attributed %@ silent %d"), v3, v4, v5, v6, v7, v8, v9, v10, v11, -[NWStatsSnapshot isSilent](self, "isSilent"));

  return v12;
}

- (NSString)descriptorDescription
{
  return 0;
}

- (NSString)flowTypeLowerCase
{
  unsigned int flags;
  unsigned int v4;

  flags = self->_flags;
  if ((flags & 0x10) != 0)
  {
    if ((flags & 4) != 0)
    {
      return (NSString *)CFSTR("tcp4");
    }
    else if ((flags & 8) != 0)
    {
      return (NSString *)CFSTR("tcp6");
    }
    else
    {
      return (NSString *)CFSTR("tcp??");
    }
  }
  else
  {
    if ((flags & 0x20) == 0)
      return (NSString *)CFSTR("???");
    v4 = self->_flags & 0xCC;
    if (v4 > 0x47)
    {
      switch(v4)
      {
        case 0x48u:
          return (NSString *)CFSTR("quic6");
        case 0x84u:
          return (NSString *)CFSTR("udp-sflow4");
        case 0x88u:
          return (NSString *)CFSTR("udp-sflow6");
      }
    }
    else
    {
      switch(v4)
      {
        case 4u:
          return (NSString *)CFSTR("udp4");
        case 8u:
          return (NSString *)CFSTR("udp6");
        case 0x44u:
          return (NSString *)CFSTR("quic4");
      }
    }
    return (NSString *)CFSTR("udp??");
  }
}

- (BOOL)isIPv4
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (BOOL)isIPv6
{
  return (LOBYTE(self->_flags) >> 3) & 1;
}

- (BOOL)changedMetadata
{
  return (self->_flags & 0x3FF000) != 0;
}

- (BOOL)changedAddress
{
  return (self->_flags & 0x1E0000) != 0;
}

- (BOOL)changedLocalAddress
{
  return (BYTE2(self->_flags) >> 1) & 1;
}

- (BOOL)changedLocalPort
{
  return (BYTE2(self->_flags) >> 3) & 1;
}

- (BOOL)changedRemoteAddress
{
  return (BYTE2(self->_flags) >> 2) & 1;
}

- (BOOL)changedRemotePort
{
  return (BYTE2(self->_flags) >> 4) & 1;
}

- (BOOL)changedOwnership
{
  return (self->_flags & 0x21F000) != 0;
}

- (BOOL)changedUUID
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (BOOL)changedEUUID
{
  return (BYTE1(self->_flags) >> 5) & 1;
}

- (BOOL)changedEUUIDFromUUID
{
  return (BYTE1(self->_flags) >> 6) & 1;
}

- (BOOL)changedEpid
{
  return BYTE2(self->_flags) & 1;
}

- (BOOL)changedPid
{
  return BYTE1(self->_flags) >> 7;
}

- (BOOL)changedProcname
{
  return (BYTE2(self->_flags) >> 5) & 1;
}

- (unint64_t)eventFlags
{
  return self->_nstat_update.hdr.event_flags;
}

- (unint64_t)rxWiredBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:](self, "_adjustedByteCount:otherBytes:packets:", self->_nstat_update.hdr.counts.nstat_wired_rxbytes, self->_nstat_update.hdr.counts.nstat_wifi_rxbytes+ self->_nstat_update.hdr.counts.nstat_cell_rxbytes+ self->_bluetooth_counts.nstat_rxbytes, self->_nstat_update.hdr.counts.nstat_rxpackets);
}

- (unint64_t)rxCompanionLinkBluetoothBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:](self, "_adjustedByteCount:otherBytes:packets:", self->_bluetooth_counts.nstat_rxbytes, self->_nstat_update.hdr.counts.nstat_wifi_rxbytes+ self->_nstat_update.hdr.counts.nstat_cell_rxbytes+ self->_nstat_update.hdr.counts.nstat_wired_rxbytes, self->_nstat_update.hdr.counts.nstat_rxpackets);
}

- (unint64_t)rawRxCellularBytes
{
  return self->_nstat_update.hdr.counts.nstat_cell_rxbytes;
}

- (unint64_t)rawRxWiFiBytes
{
  return self->_nstat_update.hdr.counts.nstat_wifi_rxbytes;
}

- (unint64_t)rawRxWiredBytes
{
  return self->_nstat_update.hdr.counts.nstat_wired_rxbytes;
}

- (unint64_t)rawRxCompanionLinkBluetoothBytes
{
  return self->_bluetooth_counts.nstat_rxbytes;
}

- (unint64_t)txWiredBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:](self, "_adjustedByteCount:otherBytes:packets:", self->_nstat_update.hdr.counts.nstat_wired_txbytes, self->_nstat_update.hdr.counts.nstat_wifi_txbytes+ self->_nstat_update.hdr.counts.nstat_cell_txbytes+ self->_bluetooth_counts.nstat_txbytes, self->_nstat_update.hdr.counts.nstat_txpackets);
}

- (unint64_t)txCompanionLinkBluetoothBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:](self, "_adjustedByteCount:otherBytes:packets:", self->_bluetooth_counts.nstat_txbytes, self->_nstat_update.hdr.counts.nstat_wifi_txbytes+ self->_nstat_update.hdr.counts.nstat_cell_txbytes+ self->_nstat_update.hdr.counts.nstat_wired_txbytes, self->_nstat_update.hdr.counts.nstat_txpackets);
}

- (unint64_t)rawTxCellularBytes
{
  return self->_nstat_update.hdr.counts.nstat_cell_txbytes;
}

- (unint64_t)rawTxWiFiBytes
{
  return self->_nstat_update.hdr.counts.nstat_wifi_txbytes;
}

- (unint64_t)rawTxWiredBytes
{
  return self->_nstat_update.hdr.counts.nstat_wired_txbytes;
}

- (unint64_t)rawTxCompanionLinkBluetoothBytes
{
  return self->_bluetooth_counts.nstat_txbytes;
}

- (double)_rttMinimum
{
  unint64_t v2;

  LODWORD(v2) = self->_nstat_update.hdr.counts.nstat_min_rtt;
  return (double)v2 / 32000.0;
}

- (double)_rttAverage
{
  unint64_t v2;

  LODWORD(v2) = self->_nstat_update.hdr.counts.nstat_avg_rtt;
  return (double)v2 / 32000.0;
}

- (double)_rttVariation
{
  unint64_t v2;

  LODWORD(v2) = self->_nstat_update.hdr.counts.nstat_var_rtt;
  return (double)v2 / 32000.0;
}

- (unint64_t)deltaRxPackets
{
  return self->_nstat_update.hdr.counts.nstat_rxpackets - self->_prev_items.savedRxPackets;
}

- (unint64_t)deltaRxBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxbytes - self->_prev_items.savedRxBytes;
}

- (unint64_t)deltaTxPackets
{
  return self->_nstat_update.hdr.counts.nstat_txpackets - self->_prev_items.savedTxPackets;
}

- (unint64_t)deltaTxBytes
{
  return self->_nstat_update.hdr.counts.nstat_txbytes - self->_prev_items.savedTxBytes;
}

- (unint64_t)deltaRxCompanionLinkBluetoothBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:](self, "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:", self->_bluetooth_counts.nstat_rxbytes, self->_nstat_update.hdr.counts.nstat_wifi_rxbytes+ self->_nstat_update.hdr.counts.nstat_cell_rxbytes+ self->_nstat_update.hdr.counts.nstat_wired_rxbytes, self->_nstat_update.hdr.counts.nstat_rxpackets, self->_prev_items.savedRxCompanionLinkBluetoothBytes, self->_prev_items.savedRxWiFiBytes+ self->_prev_items.savedRxCellularBytes+ self->_prev_items.savedRxWiredBytes, self->_prev_items.savedRxPackets);
}

- (unint64_t)deltaTxCompanionLinkBluetoothBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:](self, "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:", self->_bluetooth_counts.nstat_txbytes, self->_nstat_update.hdr.counts.nstat_wifi_txbytes+ self->_nstat_update.hdr.counts.nstat_cell_txbytes+ self->_nstat_update.hdr.counts.nstat_wired_txbytes, self->_nstat_update.hdr.counts.nstat_txpackets, self->_prev_items.savedTxCompanionLinkBluetoothBytes, self->_prev_items.savedTxWiFiBytes+ self->_prev_items.savedTxCellularBytes+ self->_prev_items.savedTxWiredBytes, self->_prev_items.savedTxPackets);
}

- (unint64_t)rawDeltaRxCellularBytes
{
  return self->_nstat_update.hdr.counts.nstat_cell_rxbytes - self->_prev_items.savedRxCellularBytes;
}

- (unint64_t)rawDeltaRxWiFiBytes
{
  return self->_nstat_update.hdr.counts.nstat_wifi_rxbytes - self->_prev_items.savedRxWiFiBytes;
}

- (unint64_t)rawDeltaRxWiredBytes
{
  return self->_nstat_update.hdr.counts.nstat_wired_rxbytes - self->_prev_items.savedRxWiredBytes;
}

- (unint64_t)rawDeltaRxCompanionLinkBluetoothBytes
{
  return self->_bluetooth_counts.nstat_rxbytes - self->_prev_items.savedRxCompanionLinkBluetoothBytes;
}

- (unint64_t)rawDeltaTxCellularBytes
{
  return self->_nstat_update.hdr.counts.nstat_cell_txbytes - self->_prev_items.savedTxCellularBytes;
}

- (unint64_t)rawDeltaTxWiFiBytes
{
  return self->_nstat_update.hdr.counts.nstat_wifi_txbytes - self->_prev_items.savedTxWiFiBytes;
}

- (unint64_t)rawDeltaTxWiredBytes
{
  return self->_nstat_update.hdr.counts.nstat_wired_txbytes - self->_prev_items.savedTxWiredBytes;
}

- (unint64_t)rawDeltaTxCompanionLinkBluetoothBytes
{
  return self->_bluetooth_counts.nstat_txbytes - self->_prev_items.savedTxCompanionLinkBluetoothBytes;
}

- (BOOL)hasTraffic
{
  return self->_nstat_update.hdr.counts.nstat_wifi_rxbytes
      || self->_nstat_update.hdr.counts.nstat_wifi_txbytes
      || self->_nstat_update.hdr.counts.nstat_cell_rxbytes
      || self->_nstat_update.hdr.counts.nstat_cell_txbytes
      || self->_nstat_update.hdr.counts.nstat_wired_rxbytes
      || self->_nstat_update.hdr.counts.nstat_wired_txbytes != 0;
}

- (BOOL)hasTrafficDelta
{
  return -[NWStatsProtocolSnapshot hasCellTrafficDelta](self, "hasCellTrafficDelta")
      || -[NWStatsProtocolSnapshot hasWiFiTrafficDelta](self, "hasWiFiTrafficDelta")
      || -[NWStatsProtocolSnapshot hasWiredTrafficDelta](self, "hasWiredTrafficDelta");
}

- (BOOL)hasCellTraffic
{
  return self->_nstat_update.hdr.counts.nstat_cell_rxbytes || self->_nstat_update.hdr.counts.nstat_cell_txbytes != 0;
}

- (BOOL)hasCellTrafficDelta
{
  return -[NWStatsProtocolSnapshot rawDeltaRxCellularBytes](self, "rawDeltaRxCellularBytes")
      || -[NWStatsProtocolSnapshot rawDeltaTxCellularBytes](self, "rawDeltaTxCellularBytes") != 0;
}

- (BOOL)hasWiFiTraffic
{
  return self->_nstat_update.hdr.counts.nstat_wifi_rxbytes || self->_nstat_update.hdr.counts.nstat_wifi_txbytes != 0;
}

- (BOOL)hasWiFiTrafficDelta
{
  return -[NWStatsProtocolSnapshot rawDeltaRxWiFiBytes](self, "rawDeltaRxWiFiBytes")
      || -[NWStatsProtocolSnapshot rawDeltaTxWiFiBytes](self, "rawDeltaTxWiFiBytes") != 0;
}

- (BOOL)hasWiredTraffic
{
  return self->_nstat_update.hdr.counts.nstat_wired_rxbytes || self->_nstat_update.hdr.counts.nstat_wired_txbytes != 0;
}

- (BOOL)hasWiredTrafficDelta
{
  return -[NWStatsProtocolSnapshot rawDeltaRxWiredBytes](self, "rawDeltaRxWiredBytes")
      || -[NWStatsProtocolSnapshot rawDeltaTxWiredBytes](self, "rawDeltaTxWiredBytes") != 0;
}

- (BOOL)failedNegativeDeltaCheck
{
  return BYTE1(self->_flags) & 1;
}

- (BOOL)failedTCPMultipleInterfaceCheck
{
  return (BYTE1(self->_flags) >> 2) & 1;
}

- (BOOL)failedRxCountCheck
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

- (BOOL)isSimpleInterface:(unsigned int)a3
{
  ifaddrs *v4;
  ifaddrs *v5;
  sockaddr *ifa_addr;
  const char *ifa_name;
  ifaddrs *v9;

  v9 = 0;
  if (getifaddrs(&v9) < 0)
    return 0;
  v4 = v9;
  if (!v9)
  {
LABEL_11:
    MEMORY[0x212BD9E3C](v4);
    return 0;
  }
  v5 = v9;
  while (1)
  {
    ifa_addr = v5->ifa_addr;
    if (ifa_addr)
    {
      ifa_name = v5->ifa_name;
      if (ifa_name)
      {
        if (ifa_addr->sa_family == 18
          && *(unsigned __int16 *)ifa_addr->sa_data == a3
          && (!strncmp(v5->ifa_name, "en", 2uLL) || !strncmp(ifa_name, "pdp", 3uLL)))
        {
          break;
        }
      }
    }
    v5 = v5->ifa_next;
    if (!v5)
      goto LABEL_11;
  }
  MEMORY[0x212BD9E3C](v4);
  return 1;
}

- (BOOL)isKnownVPNFromKernel
{
  return LOBYTE(self->_flags) >> 7;
}

- (NWStatsProtocolSnapshot)initWithUpdate:(const nstat_msg_src_update_convenient *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5 previously:(update_subset_for_deltas *)a6 bluetoothCounts:(const nstat_interface_counts *)a7 peerEgressCellularCounts:(const nstat_interface_counts *)a8
{
  char *v12;
  NWStatsProtocolSnapshot *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unsigned int provider;
  void *v21;
  const nstat_msg_src_update_convenient *v22;
  size_t v23;
  NSObject *v25;
  unsigned int v26;
  objc_super v27;
  uint8_t buf[4];
  unsigned int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)NWStatsProtocolSnapshot;
  v12 = -[NWStatsProtocolSnapshot init](&v27, sel_init, a3, *(_QWORD *)&a5, a6, a7, a8, a4);
  v13 = (NWStatsProtocolSnapshot *)v12;
  if (v12)
  {
    *((_DWORD *)v12 + 52) = a5;
    v15 = *(_OWORD *)&a6->savedTxPackets;
    v14 = *(_OWORD *)&a6->savedRxCellularBytes;
    *(_OWORD *)(v12 + 216) = *(_OWORD *)&a6->savedRxPackets;
    *(_OWORD *)(v12 + 232) = v15;
    *(_OWORD *)(v12 + 248) = v14;
    v16 = *(_OWORD *)&a6->savedRxDuplicateBytes;
    v18 = *(_OWORD *)&a6->savedRxWiredBytes;
    v17 = *(_OWORD *)&a6->savedTxCellularBytes;
    *(_OWORD *)(v12 + 296) = *(_OWORD *)&a6->savedTxWiredBytes;
    *(_OWORD *)(v12 + 312) = v16;
    *(_OWORD *)(v12 + 264) = v18;
    *(_OWORD *)(v12 + 280) = v17;
    v12[932] = 0;
    if (a7)
    {
      v19 = *(_OWORD *)&a7->nstat_txpackets;
      *(_OWORD *)(v12 + 872) = *(_OWORD *)&a7->nstat_rxpackets;
      *(_OWORD *)(v12 + 888) = v19;
    }
    provider = a3->hdr.provider;
    if (provider <= 0xA)
    {
      if (((1 << provider) & 0x430) != 0)
      {
        v21 = v12 + 376;
        v22 = a3;
        v23 = 432;
        goto LABEL_10;
      }
      if (((1 << provider) & 0xC) != 0 || provider == 8)
      {
        v21 = v12 + 376;
        v22 = a3;
        v23 = 496;
LABEL_10:
        memcpy(v21, v22, v23);
        return v13;
      }
    }
    NStatGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = a3->hdr.provider;
      *(_DWORD *)buf = 67109120;
      v29 = v26;
      _os_log_impl(&dword_211429000, v25, OS_LOG_TYPE_ERROR, "unknown provider %d type for snapshot", buf, 8u);
    }

    return 0;
  }
  return v13;
}

- (id)_tcpDescriptorDictionaryForm:(nstat_tcp_descriptor *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->upid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("upid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->eupid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("eupid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->start_timestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("start_timestamp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->timestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("timestamp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->ifindex);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("ifindex"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->state);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("state"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->sndbufsize);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("sndbufsize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->sndbufused);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("sndbufused"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->rcvbufsize);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("rcvbufsize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->rcvbufused);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("rcvbufused"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->txunacked);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("txunacked"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->txwindow);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("txwindow"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->txcwindow);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("txcwindow"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->traffic_class);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("traffic_class"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->traffic_mgt_flags);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("traffic_mgt_flags"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->pid);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("pid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->epid);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("epid"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("tbd"), CFSTR("local"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("tbd"), CFSTR("remote"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3->cc_algo);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("cc_algo"));

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3->pname);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("pname"));

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->uuid);
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("uuid"));

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->euuid);
  objc_msgSend(v26, "UUIDString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("euuid"));

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->vuuid);
  objc_msgSend(v28, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("vuuid"));

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->fuuid);
  objc_msgSend(v30, "UUIDString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("fuuid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", LOWORD(a3->ifnet_properties));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("ifnet_properties"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3->var0.__pad_connstatus[0] & 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("probe_activated"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (a3->var0.__pad_connstatus[0] >> 1) & 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("write_probe_failed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (a3->var0.__pad_connstatus[0] >> 2) & 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("read_probe_failed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (a3->var0.__pad_connstatus[0] >> 3) & 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("conn_probe_failed"));

  return v4;
}

- (id)_udpDescriptorDictionaryForm:(nstat_udp_descriptor *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->upid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("upid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->eupid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("eupid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->start_timestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("start_timestamp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->timestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("timestamp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->ifindex);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("ifindex"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->rcvbufsize);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("rcvbufsize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->rcvbufused);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("rcvbufused"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->traffic_class);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("traffic_class"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->pid);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("pid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->epid);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("epid"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("tbd"), CFSTR("local"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("tbd"), CFSTR("remote"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3->pname);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("pname"));

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->uuid);
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("uuid"));

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->euuid);
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("euuid"));

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->vuuid);
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("vuuid"));

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->fuuid);
  objc_msgSend(v22, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("fuuid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", LOWORD(a3->ifnet_properties));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("ifnet_properties"));

  return v4;
}

- (id)_quicDescriptorDictionaryForm:(nstat_tcp_descriptor *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->upid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("upid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->eupid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("eupid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->start_timestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("start_timestamp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->timestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("timestamp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->ifindex);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("ifindex"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->state);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("state"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->sndbufsize);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("sndbufsize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->sndbufused);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("sndbufused"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->rcvbufsize);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("rcvbufsize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->rcvbufused);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("rcvbufused"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->txunacked);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("txunacked"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->txwindow);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("txwindow"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->txcwindow);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("txcwindow"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->traffic_class);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("traffic_class"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->traffic_mgt_flags);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("traffic_mgt_flags"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->pid);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("pid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->epid);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("epid"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("tbd"), CFSTR("local"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("tbd"), CFSTR("remote"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3->cc_algo);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("cc_algo"));

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3->pname);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("pname"));

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->uuid);
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("uuid"));

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->euuid);
  objc_msgSend(v26, "UUIDString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("euuid"));

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->vuuid);
  objc_msgSend(v28, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("vuuid"));

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->fuuid);
  objc_msgSend(v30, "UUIDString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("fuuid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", LOWORD(a3->ifnet_properties));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("ifnet_properties"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3->var0.__pad_connstatus[0] & 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("probe_activated"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (a3->var0.__pad_connstatus[0] >> 1) & 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("write_probe_failed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (a3->var0.__pad_connstatus[0] >> 2) & 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("read_probe_failed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (a3->var0.__pad_connstatus[0] >> 3) & 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("conn_probe_failed"));

  return v4;
}

- (id)_nstatCountsDictionaryForm:(nstat_counts *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->nstat_rxpackets);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("nstat_rxpackets"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->nstat_txpackets);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("nstat_txpackets"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->nstat_rxbytes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("nstat_rxbytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->nstat_txbytes);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("nstat_txbytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->nstat_cell_rxbytes);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("nstat_cell_rxbytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->nstat_cell_txbytes);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("nstat_cell_txbytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->nstat_wifi_rxbytes);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("nstat_wifi_rxbytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->nstat_wifi_txbytes);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("nstat_wifi_txbytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->nstat_wired_rxbytes);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("nstat_wired_rxbytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->nstat_wired_txbytes);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("nstat_wired_txbytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->nstat_rxduplicatebytes);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("nstat_rxduplicatebytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->nstat_rxoutoforderbytes);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("nstat_rxoutoforderbytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->nstat_txretransmit);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("nstat_txretransmit"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->nstat_connectattempts);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("nstat_connectattempts"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->nstat_connectsuccesses);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("nstat_connectsuccesses"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->nstat_min_rtt);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("nstat_min_rtt"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->nstat_avg_rtt);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("nstat_avg_rtt"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->nstat_var_rtt);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("nstat_var_rtt"));

  return v4;
}

- (id)dictionaryForm
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  nstat_msg_src_update_convenient *p_nstat_update;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned int provider;
  NSObject *v52;
  const __CFString *v53;
  unsigned int v55;
  _DWORD v56[2];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[NWStatsProtocolSnapshot flowStartTimeIntervalSinceReferenceDate](self, "flowStartTimeIntervalSinceReferenceDate");
  *(float *)&v5 = v5;
  objc_msgSend(v4, "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("_startStamp"));

  v7 = (void *)MEMORY[0x24BDD16E0];
  -[NWStatsProtocolSnapshot flowStartTimeIntervalSinceReferenceDate](self, "flowStartTimeIntervalSinceReferenceDate");
  objc_msgSend(v7, "numberWithUnsignedLongLong:", (unint64_t)(v8 * 1000000.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("_startStampUsecs"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  -[NWStatsProtocolSnapshot flowSnapshotTimeIntervalSinceReferenceDate](self, "flowSnapshotTimeIntervalSinceReferenceDate");
  objc_msgSend(v10, "numberWithUnsignedLongLong:", (unint64_t)(v11 * 1000000.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("_snapStampUsecs"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_flags);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("_flags"));

  -[NWStatsSnapshot attributedEntity](self, "attributedEntity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("attributedEntity"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("attributedEntity"));

  }
  -[NWStatsSnapshot delegateName](self, "delegateName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("delegateName"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("delegateName"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NWStatsSnapshot attributionReason](self, "attributionReason"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("attributionReason"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NWStatsSnapshot snapshotReason](self, "snapshotReason"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("snapshotReason"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NWStatsSnapshot startAppStateIsForeground](self, "startAppStateIsForeground"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("startAppStateIsForeground"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NWStatsSnapshot snapshotAppStateIsForeground](self, "snapshotAppStateIsForeground"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("snapshotAppStateIsForeground"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NWStatsSnapshot startScreenStateOn](self, "startScreenStateOn"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("startScreenStateOn"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NWStatsSnapshot snapshotScreenStateOn](self, "snapshotScreenStateOn"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("snapshotScreenStateOn"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NWStatsSnapshot delegateAttributionReason](self, "delegateAttributionReason"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("delegateAttributionReason"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NWStatsProtocolSnapshot uiBackgroundAudioCapable](self, "uiBackgroundAudioCapable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("uiBackgroundAudioCapable"));

  v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_prev_items.savedRxPackets);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("savedRxPackets"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_prev_items.savedTxPackets);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("savedTxPackets"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_prev_items.savedRxBytes);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, CFSTR("savedRxBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_prev_items.savedTxBytes);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("savedTxBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_prev_items.savedRxCellularBytes);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v31, CFSTR("savedRxCellularBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_prev_items.savedTxCellularBytes);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v32, CFSTR("savedTxCellularBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_prev_items.savedRxWiFiBytes);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v33, CFSTR("savedRxWiFiBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_prev_items.savedTxWiFiBytes);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v34, CFSTR("savedTxWiFiBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_prev_items.savedRxWiredBytes);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v35, CFSTR("savedRxWiredBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_prev_items.savedTxWiredBytes);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v36, CFSTR("savedTxWiredBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_prev_items.savedRxDuplicateBytes);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v37, CFSTR("savedRxDuplicateBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_prev_items.savedRxOutOfOrderBytes);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v38, CFSTR("savedRxOutOfOrderBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_prev_items.savedTxRetransmittedBytes);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v39, CFSTR("savedTxRetransmittedBytes"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("_prev_items"));
  v40 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  p_nstat_update = &self->_nstat_update;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_nstat_update.hdr.srcref);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v42, CFSTR("srcref"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_nstat_update.hdr.event_flags);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v43, CFSTR("event_flags"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nstat_update.hdr.provider);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v44, CFSTR("provider"));

  v45 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_nstat_update.hdr.hdr.context);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v46, CFSTR("context"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nstat_update.hdr.hdr.type);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v47, CFSTR("type"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_nstat_update.hdr.hdr.length);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v48, CFSTR("length"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_nstat_update.hdr.hdr.flags);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v49, CFSTR("flags"));

  objc_msgSend(v40, "setObject:forKeyedSubscript:", v45, CFSTR("hdr"));
  -[NWStatsProtocolSnapshot _nstatCountsDictionaryForm:](self, "_nstatCountsDictionaryForm:", &self->_nstat_update.hdr.counts);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v50, CFSTR("counts"));

  provider = self->_nstat_update.hdr.provider;
  if (provider <= 0xA)
  {
    if (((1 << provider) & 0x430) != 0)
    {
      -[NWStatsProtocolSnapshot _udpDescriptorDictionaryForm:](self, "_udpDescriptorDictionaryForm:", &self->_nstat_update.var0);
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = CFSTR("udp_descriptor");
      goto LABEL_14;
    }
    if (((1 << provider) & 0xC) != 0)
    {
      -[NWStatsProtocolSnapshot _tcpDescriptorDictionaryForm:](self, "_tcpDescriptorDictionaryForm:", &self->_nstat_update.var0);
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = CFSTR("tcp_descriptor");
LABEL_14:
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v52, v53);
      goto LABEL_15;
    }
    if (provider == 8)
    {
      -[NWStatsProtocolSnapshot _quicDescriptorDictionaryForm:](self, "_quicDescriptorDictionaryForm:", &self->_nstat_update.var0);
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = CFSTR("quic_descriptor");
      goto LABEL_14;
    }
  }
  NStatGetLog();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    v55 = p_nstat_update->hdr.provider;
    v56[0] = 67109120;
    v56[1] = v55;
    _os_log_impl(&dword_211429000, v52, OS_LOG_TYPE_ERROR, "Unexpected provider %d when converting to dictionary form", (uint8_t *)v56, 8u);
  }
LABEL_15:

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("update"));
  return v3;
}

+ (void)logFlowAnomaly:(id)a3 anomaly:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&flowsWithAnomalousCountsLock);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "sourceIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "snapshotReason") == 2)
  {
    objc_msgSend((id)flowsWithAnomalousCounts, "removeObject:", v7);
  }
  else
  {
    if ((unint64_t)objc_msgSend((id)flowsWithAnomalousCounts, "count") > 0x64
      || (objc_msgSend((id)flowsWithAnomalousCounts, "containsObject:", v7) & 1) != 0)
    {
      goto LABEL_11;
    }
    objc_msgSend((id)flowsWithAnomalousCounts, "addObject:", v7);
  }
  NStatGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_211429000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v11, 0xCu);
  }

  NStatGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "verboseDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_211429000, v9, OS_LOG_TYPE_DEFAULT, "Flow details for anomalous flow condition: %{pubic}@", (uint8_t *)&v11, 0xCu);

  }
LABEL_11:

  os_unfair_lock_unlock((os_unfair_lock_t)&flowsWithAnomalousCountsLock);
}

+ (void)_initializeTCPDescriptor:(nstat_tcp_descriptor *)a3 fromDictionary:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  id v26;
  unsigned __int8 *v27;
  char *cc_algo;
  uint64_t v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  unsigned __int8 *v36;
  char *pname;
  uint64_t v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  char v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  char v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  char v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  char v73;
  void *v74;
  char v75;
  id v76;

  v76 = a4;
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("upid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  a3->upid = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("eupid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  a3->eupid = objc_msgSend(v6, "unsignedLongLongValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("start_timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  a3->start_timestamp = objc_msgSend(v7, "unsignedLongLongValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  a3->timestamp = objc_msgSend(v8, "unsignedLongLongValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("ifindex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  a3->ifindex = objc_msgSend(v9, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("state"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  a3->state = objc_msgSend(v10, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("sndbufsize"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  a3->sndbufsize = objc_msgSend(v11, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("sndbufused"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  a3->sndbufused = objc_msgSend(v12, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("rcvbufsize"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  a3->rcvbufsize = objc_msgSend(v13, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("rcvbufused"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  a3->rcvbufused = objc_msgSend(v14, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("txunacked"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  a3->txunacked = objc_msgSend(v15, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("txwindow"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  a3->txwindow = objc_msgSend(v16, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("txcwindow"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  a3->txcwindow = objc_msgSend(v17, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("traffic_class"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  a3->traffic_class = objc_msgSend(v18, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("traffic_mgt_flags"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  a3->traffic_mgt_flags = objc_msgSend(v19, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("pid"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  a3->pid = objc_msgSend(v20, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("epid"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  a3->epid = objc_msgSend(v21, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("cc_algo"));
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("cc_algo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("cc_algo"));
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v27 = (unsigned __int8 *)objc_msgSend(v26, "UTF8String");
      if (!v27)
        goto LABEL_47;
      cc_algo = a3->cc_algo;
      v29 = 16;
      while (1)
      {
        v30 = *v27;
        *cc_algo = v30;
        if (!v30)
          break;
        ++cc_algo;
        ++v27;
        if ((unint64_t)--v29 <= 1)
        {
          *cc_algo = 0;
          break;
        }
      }

    }
  }
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("pname"));
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("pname"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v34 = objc_opt_isKindOfClass();

    if ((v34 & 1) != 0)
    {
      objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("pname"));
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v36 = (unsigned __int8 *)objc_msgSend(v35, "UTF8String");
      if (v36)
      {
        pname = a3->pname;
        v38 = 64;
        while (1)
        {
          v39 = *v36;
          *pname = v39;
          if (!v39)
            break;
          ++pname;
          ++v36;
          if ((unint64_t)--v38 <= 1)
          {
            *pname = 0;
            break;
          }
        }

        goto LABEL_17;
      }
LABEL_47:
      __break(1u);
      return;
    }
  }
LABEL_17:
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("uuid"));
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("uuid"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = objc_opt_isKindOfClass();

    if ((v43 & 1) != 0)
    {
      v44 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("uuid"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v44, "initWithUUIDString:", v45);

      if (v46)
        objc_msgSend(v46, "getUUIDBytes:", a3->uuid);

    }
  }
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("euuid"));
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("euuid"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = objc_opt_isKindOfClass();

    if ((v50 & 1) != 0)
    {
      v51 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("euuid"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)objc_msgSend(v51, "initWithUUIDString:", v52);

      if (v53)
        objc_msgSend(v53, "getUUIDBytes:", a3->euuid);

    }
  }
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("vuuid"));
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = (void *)v54;
    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("vuuid"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = objc_opt_isKindOfClass();

    if ((v57 & 1) != 0)
    {
      v58 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("vuuid"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)objc_msgSend(v58, "initWithUUIDString:", v59);

      if (v60)
        objc_msgSend(v60, "getUUIDBytes:", a3->vuuid);

    }
  }
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("fuuid"));
  v61 = objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    v62 = (void *)v61;
    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("fuuid"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = objc_opt_isKindOfClass();

    if ((v64 & 1) != 0)
    {
      v65 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("fuuid"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)objc_msgSend(v65, "initWithUUIDString:", v66);

      if (v67)
        objc_msgSend(v67, "getUUIDBytes:", a3->fuuid);

    }
  }
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("ifnet_properties"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  a3->ifnet_properties = objc_msgSend(v68, "unsignedShortValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("probe_activated"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFE | objc_msgSend(v69, "BOOLValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("write_probe_failed"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v70, "BOOLValue"))
    v71 = 2;
  else
    v71 = 0;
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFD | v71;

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("read_probe_failed"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v72, "BOOLValue"))
    v73 = 4;
  else
    v73 = 0;
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFB | v73;

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("conn_probe_failed"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v74, "BOOLValue"))
    v75 = 8;
  else
    v75 = 0;
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xF7 | v75;

}

+ (void)_initializeUDPDescriptor:(nstat_udp_descriptor *)a3 fromDictionary:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  id v19;
  unsigned __int8 *v20;
  char *pname;
  uint64_t v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;

  v53 = a4;
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("upid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  a3->upid = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("eupid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  a3->eupid = objc_msgSend(v6, "unsignedLongLongValue");

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("start_timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  a3->start_timestamp = objc_msgSend(v7, "unsignedLongLongValue");

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  a3->timestamp = objc_msgSend(v8, "unsignedLongLongValue");

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ifindex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  a3->ifindex = objc_msgSend(v9, "unsignedIntValue");

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("rcvbufsize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  a3->rcvbufsize = objc_msgSend(v10, "unsignedIntValue");

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("rcvbufused"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  a3->rcvbufused = objc_msgSend(v11, "unsignedIntValue");

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("traffic_class"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  a3->traffic_class = objc_msgSend(v12, "unsignedIntValue");

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("pid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  a3->pid = objc_msgSend(v13, "unsignedIntValue");

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("epid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  a3->epid = objc_msgSend(v14, "unsignedIntValue");

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("pname"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("pname"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("pname"));
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = (unsigned __int8 *)objc_msgSend(v19, "UTF8String");
      if (!v20)
      {
        __break(1u);
        return;
      }
      pname = a3->pname;
      v22 = 64;
      while (1)
      {
        v23 = *v20;
        *pname = v23;
        if (!v23)
          break;
        ++pname;
        ++v20;
        if ((unint64_t)--v22 <= 1)
        {
          *pname = 0;
          break;
        }
      }

    }
  }
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("uuid"));
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("uuid"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v27 = objc_opt_isKindOfClass();

    if ((v27 & 1) != 0)
    {
      v28 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("uuid"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v28, "initWithUUIDString:", v29);

      if (v30)
        objc_msgSend(v30, "getUUIDBytes:", a3->uuid);

    }
  }
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("euuid"));
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("euuid"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v34 = objc_opt_isKindOfClass();

    if ((v34 & 1) != 0)
    {
      v35 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("euuid"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v35, "initWithUUIDString:", v36);

      if (v37)
        objc_msgSend(v37, "getUUIDBytes:", a3->euuid);

    }
  }
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("vuuid"));
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("vuuid"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v41 = objc_opt_isKindOfClass();

    if ((v41 & 1) != 0)
    {
      v42 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("vuuid"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend(v42, "initWithUUIDString:", v43);

      if (v44)
        objc_msgSend(v44, "getUUIDBytes:", a3->vuuid);

    }
  }
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("fuuid"));
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = (void *)v45;
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("fuuid"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = objc_opt_isKindOfClass();

    if ((v48 & 1) != 0)
    {
      v49 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("fuuid"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v49, "initWithUUIDString:", v50);

      if (v51)
        objc_msgSend(v51, "getUUIDBytes:", a3->fuuid);

    }
  }
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ifnet_properties"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  a3->ifnet_properties = objc_msgSend(v52, "unsignedShortValue");

}

+ (void)_initializeQUICDescriptor:(nstat_tcp_descriptor *)a3 fromDictionary:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  id v26;
  unsigned __int8 *v27;
  char *cc_algo;
  uint64_t v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  unsigned __int8 *v36;
  char *pname;
  uint64_t v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  char v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  char v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  char v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  char v73;
  void *v74;
  char v75;
  id v76;

  v76 = a4;
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("upid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  a3->upid = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("eupid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  a3->eupid = objc_msgSend(v6, "unsignedLongLongValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("start_timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  a3->start_timestamp = objc_msgSend(v7, "unsignedLongLongValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  a3->timestamp = objc_msgSend(v8, "unsignedLongLongValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("ifindex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  a3->ifindex = objc_msgSend(v9, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("state"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  a3->state = objc_msgSend(v10, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("sndbufsize"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  a3->sndbufsize = objc_msgSend(v11, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("sndbufused"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  a3->sndbufused = objc_msgSend(v12, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("rcvbufsize"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  a3->rcvbufsize = objc_msgSend(v13, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("rcvbufused"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  a3->rcvbufused = objc_msgSend(v14, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("txunacked"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  a3->txunacked = objc_msgSend(v15, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("txwindow"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  a3->txwindow = objc_msgSend(v16, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("txcwindow"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  a3->txcwindow = objc_msgSend(v17, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("traffic_class"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  a3->traffic_class = objc_msgSend(v18, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("traffic_mgt_flags"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  a3->traffic_mgt_flags = objc_msgSend(v19, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("pid"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  a3->pid = objc_msgSend(v20, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("epid"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  a3->epid = objc_msgSend(v21, "unsignedIntValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("cc_algo"));
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("cc_algo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("cc_algo"));
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v27 = (unsigned __int8 *)objc_msgSend(v26, "UTF8String");
      if (!v27)
        goto LABEL_47;
      cc_algo = a3->cc_algo;
      v29 = 16;
      while (1)
      {
        v30 = *v27;
        *cc_algo = v30;
        if (!v30)
          break;
        ++cc_algo;
        ++v27;
        if ((unint64_t)--v29 <= 1)
        {
          *cc_algo = 0;
          break;
        }
      }

    }
  }
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("pname"));
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("pname"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v34 = objc_opt_isKindOfClass();

    if ((v34 & 1) != 0)
    {
      objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("pname"));
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v36 = (unsigned __int8 *)objc_msgSend(v35, "UTF8String");
      if (v36)
      {
        pname = a3->pname;
        v38 = 64;
        while (1)
        {
          v39 = *v36;
          *pname = v39;
          if (!v39)
            break;
          ++pname;
          ++v36;
          if ((unint64_t)--v38 <= 1)
          {
            *pname = 0;
            break;
          }
        }

        goto LABEL_17;
      }
LABEL_47:
      __break(1u);
      return;
    }
  }
LABEL_17:
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("uuid"));
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("uuid"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = objc_opt_isKindOfClass();

    if ((v43 & 1) != 0)
    {
      v44 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("uuid"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v44, "initWithUUIDString:", v45);

      if (v46)
        objc_msgSend(v46, "getUUIDBytes:", a3->uuid);

    }
  }
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("euuid"));
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("euuid"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = objc_opt_isKindOfClass();

    if ((v50 & 1) != 0)
    {
      v51 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("euuid"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)objc_msgSend(v51, "initWithUUIDString:", v52);

      if (v53)
        objc_msgSend(v53, "getUUIDBytes:", a3->euuid);

    }
  }
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("vuuid"));
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = (void *)v54;
    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("vuuid"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = objc_opt_isKindOfClass();

    if ((v57 & 1) != 0)
    {
      v58 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("vuuid"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)objc_msgSend(v58, "initWithUUIDString:", v59);

      if (v60)
        objc_msgSend(v60, "getUUIDBytes:", a3->vuuid);

    }
  }
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("fuuid"));
  v61 = objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    v62 = (void *)v61;
    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("fuuid"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = objc_opt_isKindOfClass();

    if ((v64 & 1) != 0)
    {
      v65 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("fuuid"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)objc_msgSend(v65, "initWithUUIDString:", v66);

      if (v67)
        objc_msgSend(v67, "getUUIDBytes:", a3->fuuid);

    }
  }
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("ifnet_properties"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  a3->ifnet_properties = objc_msgSend(v68, "unsignedShortValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("probe_activated"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFE | objc_msgSend(v69, "BOOLValue");

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("write_probe_failed"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v70, "BOOLValue"))
    v71 = 2;
  else
    v71 = 0;
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFD | v71;

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("read_probe_failed"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v72, "BOOLValue"))
    v73 = 4;
  else
    v73 = 0;
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFB | v73;

  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("conn_probe_failed"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v74, "BOOLValue"))
    v75 = 8;
  else
    v75 = 0;
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xF7 | v75;

}

+ (id)_snapshotWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  float v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  __objc2_class **v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char isKindOfClass;
  const __CFString *v62;
  void *v63;
  char v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  char v83;
  void *v84;
  double v85;
  NSObject *v86;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  _QWORD v93[12];
  int v94;
  int v95;
  uint64_t v96;
  uint8_t buf[4];
  unsigned int v98;
  uint64_t v99;
  int v100;
  __int16 v101;
  __int16 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  __int128 v121;
  _BYTE v122[336];
  uint64_t v123;
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v121 = 0u;
  memset(v122, 0, sizeof(v122));
  v123 = 0;
  v93[11] = 0;
  v93[7] = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("update"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_prev_items"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hdr"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("counts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedRxPackets"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = objc_msgSend(v9, "longLongValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedTxPackets"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v93[2] = objc_msgSend(v10, "longLongValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedRxBytes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = objc_msgSend(v11, "longLongValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedTxBytes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v93[3] = objc_msgSend(v12, "longLongValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedRxCellularBytes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v93[4] = objc_msgSend(v13, "longLongValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedTxCellularBytes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v93[8] = objc_msgSend(v14, "longLongValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedRxWiFiBytes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v93[5] = objc_msgSend(v15, "longLongValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedTxWiFiBytes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v93[9] = objc_msgSend(v16, "longLongValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedRxWiredBytes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v93[6] = objc_msgSend(v17, "longLongValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedTxWiredBytes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v93[10] = objc_msgSend(v18, "longLongValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedRxDuplicateBytes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v19, "unsignedIntValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedRxOutOfOrderBytes"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v20, "unsignedIntValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedTxRetransmittedBytes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v21, "unsignedIntValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("context"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v22, "longLongValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(v23, "unsignedIntValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("length"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v24, "unsignedShortValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("flags"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v25, "unsignedShortValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("srcref"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(v26, "longLongValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("event_flags"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v27, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_rxpackets"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(v28, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_txpackets"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v29, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_rxbytes"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v30, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_txbytes"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend(v31, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_cell_rxbytes"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v32, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_cell_txbytes"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v33, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_wifi_rxbytes"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v34, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_wifi_txbytes"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(v35, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_wired_rxbytes"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v36, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_wired_txbytes"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v37, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_rxduplicatebytes"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend(v38, "unsignedIntValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_rxoutoforderbytes"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v39, "unsignedIntValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_txretransmit"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend(v40, "unsignedIntValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_connectattempts"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend(v41, "unsignedIntValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_connectsuccesses"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v42, "unsignedIntValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_min_rtt"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend(v43, "unsignedIntValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_avg_rtt"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v121) = objc_msgSend(v44, "unsignedIntValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nstat_var_rtt"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  DWORD1(v121) = objc_msgSend(v45, "unsignedIntValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("provider"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "unsignedIntValue");
  DWORD2(v121) = v47;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_startStamp"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_startStamp"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "floatValue");
    v51 = v50;

  }
  else
  {
    v51 = 0.0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_startStampUsecs"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_startStampUsecs"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (double)(unint64_t)objc_msgSend(v53, "unsignedLongLongValue") / 1000000.0;

  }
  if (v47 > 0xA)
    goto LABEL_26;
  if (((1 << v47) & 0x430) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("udp_descriptor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_initializeUDPDescriptor:fromDictionary:", v122, v54);
    v55 = &off_24CBD2118;
    goto LABEL_13;
  }
  if (((1 << v47) & 0xC) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tcp_descriptor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_initializeTCPDescriptor:fromDictionary:", v122, v54);
    v55 = off_24CBD2110;
    goto LABEL_13;
  }
  if (v47 != 8)
  {
LABEL_26:
    NStatGetLog();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v98 = v47;
      _os_log_impl(&dword_211429000, v86, OS_LOG_TYPE_ERROR, "unknown provider %d type for snapshot", buf, 8u);
    }
    v58 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("quic_descriptor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_initializeQUICDescriptor:fromDictionary:", v122, v54);
  v55 = off_24CBD2108;
LABEL_13:

  v56 = objc_alloc(*v55);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_flags"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v56, "initWithUpdate:startTime:flowFlags:previously:bluetoothCounts:peerEgressCellularCounts:", &v99, objc_msgSend(v57, "unsignedIntValue"), v93, 0, 0, v51);

  if (v58)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("snapshotReason"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setSnapshotReason:", objc_msgSend(v59, "intValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributedEntity"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributedEntity"));
      v62 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v62 = CFSTR("<unknown>");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("delegateName"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = objc_opt_isKindOfClass();

    v89 = v6;
    v90 = v5;
    v88 = v7;
    if ((v64 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("delegateName"));
      v65 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v65 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributionReason"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "intValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("delegateAttributionReason"));
    v68 = v4;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (void *)v65;
    v92 = v62;
    objc_msgSend(v58, "setAttribution:derivation:delegateName:delegateDerivation:extensionName:", v62, v67, v65, objc_msgSend(v69, "intValue"), 0);

    objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("uiBackgroundAudioCapable"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setIsUIBackgroundAudioCapable:", objc_msgSend(v70, "BOOLValue"));

    objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("snapshotAppStateIsForeground"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "BOOLValue");
    objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("snapshotScreenStateOn"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "BOOLValue");
    objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("startAppStateIsForeground"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "BOOLValue");
    objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("startScreenStateOn"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "BOOLValue");
    v79 = v72;
    v4 = v68;
    objc_msgSend(v58, "setAppStateIsForeground:screenStateOn:startAppStateIsForeground:startScreenStateOn:", v79, v74, v76, v78);

    objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("_snapStampUsecs"));
    v80 = objc_claimAutoreleasedReturnValue();
    if (v80
      && (v81 = (void *)v80,
          objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("_snapStampUsecs")),
          v82 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          v83 = objc_opt_isKindOfClass(),
          v82,
          v81,
          (v83 & 1) != 0))
    {
      objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("_snapStampUsecs"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = (double)(unint64_t)objc_msgSend(v84, "unsignedLongLongValue") / 1000000.0;

      objc_msgSend(v58, "setFlowSnapshotTimeIntervalSinceReferenceDate:", v85);
      v6 = v89;
      v5 = v90;
      v7 = v88;
    }
    else
    {
      v6 = v89;
      v5 = v90;
      v7 = v88;
      if ((reportSnapshotWithDictionaryIssues & 1) == 0)
        reportSnapshotWithDictionaryIssues = 1;
    }
    objc_msgSend(v58, "runConsistencyChecks");

    v86 = v92;
LABEL_29:

  }
  return v58;
}

+ (id)snapshotWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  unsigned int v14;
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
      v8 = 0;
      v7 = 0;
      v6 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("update"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = 0;
        v8 = 0;
        v7 = 0;
        goto LABEL_22;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tcp_descriptor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("udp_descriptor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("quic_descriptor"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = v7 != 0;
      if (v7)
        v12 = 2;
      else
        v12 = 1;
      if (v8)
        v11 = v12;
      if (v9)
        ++v11;
      if (v11 != 1)
        goto LABEL_22;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("provider"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntValue");

      v4 = 0;
      if (v14 <= 0xA)
      {
        if (((1 << v14) & 0x430) != 0)
        {
          if (v8)
            goto LABEL_28;
        }
        else
        {
          if (((1 << v14) & 0xC) == 0)
          {
            if (v14 != 8)
              goto LABEL_23;
            if (!v10)
              goto LABEL_22;
            goto LABEL_28;
          }
          if (v7)
          {
LABEL_28:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(a1, "_snapshotWithDictionary:", v5);
              v4 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_23;
            }
          }
        }
LABEL_22:
        v4 = 0;
      }
    }
    else
    {
      v10 = 0;
      v8 = 0;
      v7 = 0;
    }
  }
  else
  {
    v10 = 0;
    v8 = 0;
    v7 = 0;
    v6 = 0;
  }
LABEL_23:
  v15 = v4;

  return v15;
}

- (id)attributionReasonString
{
  return (id)attributionReasonString(-[NWStatsSnapshot attributionReason](self, "attributionReason"));
}

- (void)applyTrafficAdjustmentFactor:(double)a3
{
  double v5;
  double v7;

  -[NWStatsProtocolSnapshot flowDuration](self, "flowDuration");
  if (a3 > 0.0 && v5 > a3)
  {
    v7 = (v5 - a3) / v5;
    self->_adjustment_bytes.rxCellularBytes = (unint64_t)(v7
                                                               * (double)-[NWStatsProtocolSnapshot deltaAccountingRxCellularBytes](self, "deltaAccountingRxCellularBytes"));
    self->_adjustment_bytes.txCellularBytes = (unint64_t)(v7
                                                               * (double)-[NWStatsProtocolSnapshot deltaAccountingTxCellularBytes](self, "deltaAccountingTxCellularBytes"));
    self->_adjustment_bytes.rxWiFiBytes = (unint64_t)(v7
                                                           * (double)-[NWStatsProtocolSnapshot deltaAccountingRxWiFiBytes](self, "deltaAccountingRxWiFiBytes"));
    self->_adjustment_bytes.txWiFiBytes = (unint64_t)(v7
                                                           * (double)-[NWStatsProtocolSnapshot deltaAccountingTxWiFiBytes](self, "deltaAccountingTxWiFiBytes"));
    self->_adjustment_bytes.rxWiredBytes = (unint64_t)(v7
                                                            * (double)-[NWStatsProtocolSnapshot deltaAccountingRxWiredBytes](self, "deltaAccountingRxWiredBytes"));
    self->_adjustment_bytes.txWiredBytes = (unint64_t)(v7
                                                            * (double)-[NWStatsProtocolSnapshot deltaAccountingTxWiredBytes](self, "deltaAccountingTxWiredBytes"));
  }
}

- (void)donateBytesToAccumulator
{
  id v3;

  +[NWStatsInterfaceRegistry sharedInstance](NWStatsInterfaceRegistry, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addVPNBytesForInterfaceIndex:fromSnapshot:", -[NWStatsProtocolSnapshot interfaceIndex](self, "interfaceIndex"), self);
  self->_isKnownVPNClient = 1;

}

- (void)removeBytesFromAccumulator
{
  void *v3;
  id v4;

  +[NWStatsInterfaceRegistry sharedInstance](NWStatsInterfaceRegistry, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NWStatsSnapshot euuid](self, "euuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtractVPNBytesForVPNProviderAppUUID:fromSnapshot:", v3, self);

  self->_isKnownVPNProvider = 1;
}

+ (void)initialize
{
  kern_return_t v2;
  kern_return_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = mach_timebase_info((mach_timebase_info_t)&timebase_info_0);
  if (v2)
  {
    v3 = v2;
    NStatGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_211429000, v4, OS_LOG_TYPE_ERROR, "mach_timebase_info failed %d", (uint8_t *)v7, 8u);
    }

  }
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v6 = (void *)flowsWithAnomalousCounts;
  flowsWithAnomalousCounts = (uint64_t)v5;

  flowsWithAnomalousCountsLock = 0;
}

- (unint64_t)flowStartContinuousTime
{
  return self->_flowStartContinuousTime;
}

- (NSDate)flowStartTimestamp
{
  return self->_flowStartTimestamp;
}

- (NSDate)flowSnapshotTimestamp
{
  return self->_flowSnapshotTimestamp;
}

- (double)flowStartTimeIntervalSinceReferenceDate
{
  return self->_flowStartTimeIntervalSinceReferenceDate;
}

- (double)flowSnapshotTimeIntervalSinceReferenceDate
{
  return self->_flowSnapshotTimeIntervalSinceReferenceDate;
}

- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3
{
  self->_flowSnapshotTimeIntervalSinceReferenceDate = a3;
}

- (double)flowStartTimeIntervalSince1970
{
  return self->_flowStartTimeIntervalSince1970;
}

- (double)flowSnapshotTimeIntervalSince1970
{
  return self->_flowSnapshotTimeIntervalSince1970;
}

- (double)flowDuration
{
  return self->_flowDuration;
}

- (unint64_t)deltaAccountingRxCompanionLinkBluetoothBytes
{
  return self->_deltaAccountingRxCompanionLinkBluetoothBytes;
}

- (unint64_t)deltaAccountingTxCompanionLinkBluetoothBytes
{
  return self->_deltaAccountingTxCompanionLinkBluetoothBytes;
}

- (unsigned)interfaceIndex
{
  return self->_interfaceIndex;
}

- (unsigned)receiveBufferSize
{
  return self->_receiveBufferSize;
}

- (unsigned)receiveBufferUsed
{
  return self->_receiveBufferUsed;
}

- (unsigned)trafficClass
{
  return self->_trafficClass;
}

- (NSUUID)vuuid
{
  return self->_vuuid;
}

- (NSUUID)flowuuid
{
  return self->_flowuuid;
}

- (BOOL)uiBackgroundAudioCapable
{
  return self->_uiBackgroundAudioCapable;
}

- (void)setUiBackgroundAudioCapable:(BOOL)a3
{
  self->_uiBackgroundAudioCapable = a3;
}

- (BOOL)failedRouteValuesLookup
{
  return self->_failedRouteValuesLookup;
}

- (BOOL)failedFlowswitchValuesLookup
{
  return self->_failedFlowswitchValuesLookup;
}

- (BOOL)failedSkywalkAction
{
  return self->_failedSkywalkAction;
}

- (NSData)localAddress
{
  return self->_localAddress;
}

- (NSData)remoteAddress
{
  return self->_remoteAddress;
}

- (unsigned)localPort
{
  return self->_localPort;
}

- (unsigned)remotePort
{
  return self->_remotePort;
}

- (NSString)localAddressString
{
  return self->_localAddressString;
}

- (NSString)remoteAddressString
{
  return self->_remoteAddressString;
}

- (BOOL)isKnownListener
{
  return self->_isKnownListener;
}

- (BOOL)isKnownInbound
{
  return self->_isKnownInbound;
}

- (BOOL)isKnownOutbound
{
  return self->_isKnownOutbound;
}

- (BOOL)interfaceUnknown
{
  return self->_interfaceUnknown;
}

- (BOOL)interfaceLoopback
{
  return self->_interfaceLoopback;
}

- (BOOL)interfaceCellular
{
  return self->_interfaceCellular;
}

- (BOOL)interfaceCellularViaFallback
{
  return self->_interfaceCellularViaFallback;
}

- (BOOL)interfaceCellularViaSlowFallback
{
  return self->_interfaceCellularViaSlowFallback;
}

- (BOOL)interfaceCellularViaFastFallback
{
  return self->_interfaceCellularViaFastFallback;
}

- (BOOL)interfaceCellularViaPreferredFallback
{
  return self->_interfaceCellularViaPreferredFallback;
}

- (BOOL)interfaceCellularViaIndependentFallback
{
  return self->_interfaceCellularViaIndependentFallback;
}

- (BOOL)interfaceCellularViaAnyFallback
{
  return self->_interfaceCellularViaAnyFallback;
}

- (BOOL)interfaceWiFi
{
  return self->_interfaceWiFi;
}

- (BOOL)interfaceWired
{
  return self->_interfaceWired;
}

- (BOOL)interfaceAWDL
{
  return self->_interfaceAWDL;
}

- (BOOL)interfaceLLW
{
  return self->_interfaceLLW;
}

- (BOOL)interfaceExpensive
{
  return self->_interfaceExpensive;
}

- (BOOL)interfaceConstrained
{
  return self->_interfaceConstrained;
}

- (BOOL)interfaceCompanionLinkBluetooth
{
  return self->_interfaceCompanionLinkBluetooth;
}

- (BOOL)isKnownVPNClient
{
  return self->_isKnownVPNClient;
}

- (void)setIsKnownVPNClient:(BOOL)a3
{
  self->_isKnownVPNClient = a3;
}

- (BOOL)flowUsesChannels
{
  return self->_flowUsesChannels;
}

- (BOOL)hasLocalDestination
{
  return self->_hasLocalDestination;
}

- (BOOL)hasNonLocalDestination
{
  return self->_hasNonLocalDestination;
}

- (unint64_t)networkActivityMapStartTime
{
  return self->_networkActivityMapStartTime;
}

- (unint64_t)networkActivityMapPart1
{
  return self->_networkActivityMapPart1;
}

- (unint64_t)networkActivityMapPart2
{
  return self->_networkActivityMapPart2;
}

- (BOOL)isKnownVPNProvider
{
  return self->_isKnownVPNProvider;
}

- (void)setIsKnownVPNProvider:(BOOL)a3
{
  self->_isKnownVPNProvider = a3;
}

- (unsigned)ifnet_properties
{
  return self->_ifnet_properties;
}

@end
