@implementation CWFLinkQualityMetric(Dictionary)

- (id)dictionary
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
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

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(a1, "linkQualityMetricData");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "bytes");

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSxxx"));
    objc_msgSend(a1, "updatedAt");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("wifi_updated_at"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "RSSI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("wifi_rssi"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "noise"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("wifi_noise"));

    v10 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1, "txRate");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("wifi_tx_rate"));

    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1, "rxRate");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("wifi_rx_rate"));

    if (*(_BYTE *)(v4 + 11))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", *(__int16 *)(v4 + 12));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("wifi_snr"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v4 + 20));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("wifi_tx_fail"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v4 + 24));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("wifi_tx_retrans"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v4 + 28));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("wifi_tx_frames"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v4 + 32));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v18, CFSTR("wifi_rx_retry_frames"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v4 + 36));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("wifi_rx_frames"));

    if (*(_BYTE *)(v4 + 48))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v4 + 40));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v20, CFSTR("wifi_beacon_recv"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v4 + 44));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, CFSTR("wifi_beacon_sched"));

    }
    if (*(_BYTE *)(v4 + 49))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v4 + 52));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("wifi_tx_fw_fail"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v4 + 56));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, CFSTR("wifi_tx_fw_retrans"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v4 + 60));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v24, CFSTR("wifi_tx_fw_frames"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v4 + 68));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v25, CFSTR("wifi_tx_fallback_rate"));

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2);
    v4 = objc_claimAutoreleasedReturnValue();

  }
  return (id)v4;
}

@end
