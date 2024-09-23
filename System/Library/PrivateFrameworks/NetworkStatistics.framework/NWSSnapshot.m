@implementation NWSSnapshot

- (id)_initWithCounts:(const nstat_counts *)a3 sourceIdent:(unint64_t)a4 seqno:(unint64_t)a5
{
  id result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NWSSnapshot;
  result = -[NWSSnapshot init](&v14, sel_init);
  if (result)
  {
    v9 = *(_OWORD *)&a3->nstat_rxpackets;
    v10 = *(_OWORD *)&a3->nstat_txpackets;
    *(_OWORD *)((char *)result + 40) = *(_OWORD *)&a3->nstat_cell_rxbytes;
    *(_OWORD *)((char *)result + 24) = v10;
    *(_OWORD *)((char *)result + 8) = v9;
    v11 = *(_OWORD *)&a3->nstat_wifi_rxbytes;
    v12 = *(_OWORD *)&a3->nstat_wired_rxbytes;
    v13 = *(_OWORD *)&a3->nstat_rxduplicatebytes;
    *(_OWORD *)((char *)result + 104) = *(_OWORD *)&a3->nstat_connectsuccesses;
    *(_OWORD *)((char *)result + 88) = v13;
    *(_OWORD *)((char *)result + 72) = v12;
    *(_OWORD *)((char *)result + 56) = v11;
    *((_QWORD *)result + 15) = a5;
    *((_QWORD *)result + 16) = a4;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traditionalDictionary, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

- (unint64_t)txPackets
{
  return self->_counts.nstat_txpackets;
}

- (unint64_t)txBytes
{
  return self->_counts.nstat_txbytes;
}

- (unint64_t)rxPackets
{
  return self->_counts.nstat_rxpackets;
}

- (unint64_t)rxBytes
{
  return self->_counts.nstat_rxbytes;
}

- (unsigned)_txRetransmittedBytes
{
  return self->_counts.nstat_txretransmit;
}

- (unsigned)_rxOutOfOrderBytes
{
  return self->_counts.nstat_rxoutoforderbytes;
}

- (unsigned)_rxDuplicateBytes
{
  return self->_counts.nstat_rxduplicatebytes;
}

- (double)_rttVariation
{
  unint64_t v2;

  LODWORD(v2) = self->_counts.nstat_var_rtt;
  return (double)v2 / 32000.0;
}

- (double)_rttMinimum
{
  unint64_t v2;

  LODWORD(v2) = self->_counts.nstat_min_rtt;
  return (double)v2 / 32000.0;
}

- (double)_rttAverage
{
  unint64_t v2;

  LODWORD(v2) = self->_counts.nstat_avg_rtt;
  return (double)v2 / 32000.0;
}

- (unsigned)_connectSuccesses
{
  return self->_counts.nstat_connectsuccesses;
}

- (unsigned)_connectAttempts
{
  return self->_counts.nstat_connectattempts;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("pkts rx %lld tx %lld, bytes %lld %lld cell %lld %lld wifi %lld %lld wired %lld %lld"), -[NWSSnapshot rxPackets](self, "rxPackets"), -[NWSSnapshot txPackets](self, "txPackets"), -[NWSSnapshot rxBytes](self, "rxBytes"), -[NWSSnapshot txBytes](self, "txBytes"), -[NWSSnapshot rxCellularBytes](self, "rxCellularBytes"), -[NWSSnapshot txCellularBytes](self, "txCellularBytes"), -[NWSSnapshot rxWiFiBytes](self, "rxWiFiBytes"), -[NWSSnapshot txWiFiBytes](self, "txWiFiBytes"), -[NWSSnapshot rxWiredBytes](self, "rxWiredBytes"), -[NWSSnapshot txWiredBytes](self, "txWiredBytes"));
}

- (unint64_t)rxCellularBytes
{
  return self->_counts.nstat_cell_rxbytes;
}

- (unint64_t)rxWiFiBytes
{
  return self->_counts.nstat_wifi_rxbytes;
}

- (unint64_t)rxWiredBytes
{
  return self->_counts.nstat_wired_rxbytes;
}

- (unint64_t)txCellularBytes
{
  return self->_counts.nstat_cell_txbytes;
}

- (unint64_t)txWiFiBytes
{
  return self->_counts.nstat_wifi_txbytes;
}

- (unint64_t)txWiredBytes
{
  return self->_counts.nstat_wired_txbytes;
}

- (id)_createCountsForProvider:(int)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
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
  id v27;

  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (v5)
  {
    if ((a3 - 1) < 3)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_counts.nstat_connectattempts);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, kNStatSrcKeyConnectAttempt);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_counts.nstat_connectsuccesses);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, kNStatSrcKeyConnectSuccess);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_counts.nstat_rxduplicatebytes);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, kNStatSrcKeyRxDupeBytes);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_counts.nstat_rxoutoforderbytes);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, kNStatSrcKeyRxOOOBytes);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_counts.nstat_txretransmit);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, kNStatSrcKeyTxReTx);

    }
    else
    {
      if ((a3 - 4) < 2)
      {
LABEL_8:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_counts.nstat_cell_rxbytes);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, kNStatSrcKeyRxCellularBytes);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_counts.nstat_cell_txbytes);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, kNStatSrcKeyTxCellularBytes);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_counts.nstat_wifi_rxbytes);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, kNStatSrcKeyRxWiFiBytes);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_counts.nstat_wifi_txbytes);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, kNStatSrcKeyTxWiFiBytes);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_counts.nstat_wired_rxbytes);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, kNStatSrcKeyRxWiredBytes);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_counts.nstat_wired_txbytes);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, kNStatSrcKeyTxWiredBytes);

LABEL_9:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_counts.nstat_rxpackets);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, kNStatSrcKeyRxPackets);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_counts.nstat_rxbytes);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, kNStatSrcKeyRxBytes);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_counts.nstat_txpackets);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, kNStatSrcKeyTxPackets);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_counts.nstat_txbytes);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, kNStatSrcKeyTxBytes);

        v27 = v5;
        goto LABEL_10;
      }
      if (a3 != 8)
        goto LABEL_9;
    }
    LODWORD(v6) = self->_counts.nstat_min_rtt;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v6 / 32000.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, kNStatSrcKeyMinRTT);

    LODWORD(v13) = self->_counts.nstat_avg_rtt;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v13 / 32000.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, kNStatSrcKeyAvgRTT);

    LODWORD(v15) = self->_counts.nstat_var_rtt;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v15 / 16000.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, kNStatSrcKeyVarRTT);

    goto LABEL_8;
  }
LABEL_10:

  return v5;
}

- (unint64_t)changeSeqno
{
  return self->_changeSeqno;
}

- (unint64_t)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)provider
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSDictionary)traditionalDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

@end
