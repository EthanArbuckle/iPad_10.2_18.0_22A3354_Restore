@implementation NWSInterfaceSnapshot

- (id)provider
{
  return CFSTR("Interface");
}

- (unsigned)interfaceType
{
  return self->_descriptor.type;
}

- (NSString)interfaceName
{
  NSString *interfaceName;
  NSString *v4;
  NSString *v5;

  interfaceName = self->_interfaceName;
  if (!interfaceName)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.16s"), self->_descriptor.name);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_interfaceName;
    self->_interfaceName = v4;

    interfaceName = self->_interfaceName;
  }
  return interfaceName;
}

- (NSString)interfaceDescription
{
  NSString *interfaceDescription;
  NSString *v4;
  NSString *v5;

  interfaceDescription = self->_interfaceDescription;
  if (!interfaceDescription)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.128s"), self->_descriptor.description);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_interfaceDescription;
    self->_interfaceDescription = v4;

    interfaceDescription = self->_interfaceDescription;
  }
  return interfaceDescription;
}

- (unsigned)interfaceIndex
{
  return self->_descriptor.ifindex;
}

- (unint64_t)threshold
{
  return self->_descriptor.threshold;
}

- (void)_invalidateCommonCounts
{
  self->_linkQualityMetric = -1;
  self->_ulMaxBandwidth = -1;
  self->_ulEffectiveBandwidth = -1;
  self->_ulBytesLost = -1;
  self->_ulMinLatency = -1;
  self->_ulEffectiveLatency = -1;
  self->_ulMaxLatency = -1;
  self->_dlMaxBandwidth = -1;
  self->_dlEffectiveBandwidth = -1;
}

- (void)_invalidateCellCounts
{
  self->_cellUlMinQueueSize = -1;
  self->_cellUlAvgQueueSize = -1;
  self->_cellUlMaxQueueSize = -1;
  self->_cellConfigInactivityTime = -1;
  self->_cellConfigBackoffTime = -1;
}

- (void)_invalidateWifiCounts
{
  self->_wifiUlErrorRate = -1;
  self->_wifiDlMinLatency = -1;
  self->_wifiDlEffectiveLatency = -1;
  self->_wifiDlMaxLatency = -1;
  self->_wifiDlErrorRate = -1;
  self->_wifiConfigFrequency = -1;
  self->_wifiConfigMulticastRate = -1;
  self->_wifiScanCount = -1;
  self->_wifiScanDuration = -1;
}

- (void)_invalidateAllExtraCounts
{
  -[NWSInterfaceSnapshot _invalidateCommonCounts](self, "_invalidateCommonCounts");
  -[NWSInterfaceSnapshot _invalidateCellCounts](self, "_invalidateCellCounts");
  -[NWSInterfaceSnapshot _invalidateWifiCounts](self, "_invalidateWifiCounts");
}

- (id)traditionalDictionary
{
  void *v3;
  void *v4;
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
  id v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)NWSInterfaceSnapshot;
  -[NWSSnapshot _createCountsForProvider:](&v38, sel__createCountsForProvider_, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", kNStatProviderInterface, kNStatSrcKeyProvider);
    -[NWSInterfaceSnapshot interfaceName](self, "interfaceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NWSInterfaceSnapshot interfaceName](self, "interfaceName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, kNStatSrcKeyInterfaceName);

    }
    -[NWSInterfaceSnapshot interfaceDescription](self, "interfaceDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NWSInterfaceSnapshot interfaceDescription](self, "interfaceDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, kNStatSrcKeyInterfaceDescription);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.type);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, kNStatSrcKeyInterfaceType);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.ifindex);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, kNStatSrcKeyInterface);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_descriptor.threshold);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, kNStatSrcKeyInterfaceThreshold);

    if (-[NWSInterfaceSnapshot linkQualityMetric](self, "linkQualityMetric") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot linkQualityMetric](self, "linkQualityMetric"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v12, kNStatSrcKeyInterfaceLinkQualityMetric);

    }
    if (-[NWSInterfaceSnapshot ulMaxBandwidth](self, "ulMaxBandwidth") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot ulMaxBandwidth](self, "ulMaxBandwidth"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v13, kNStatSrcKeyInterfaceUlMaxBandwidth);

    }
    if (-[NWSInterfaceSnapshot ulEffectiveBandwidth](self, "ulEffectiveBandwidth") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot ulEffectiveBandwidth](self, "ulEffectiveBandwidth"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v14, kNStatSrcKeyInterfaceUlCurrentBandwidth);

    }
    if (-[NWSInterfaceSnapshot ulBytesLost](self, "ulBytesLost") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot ulBytesLost](self, "ulBytesLost"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v15, kNStatSrcKeyInterfaceUlBytesLost);

    }
    if (-[NWSInterfaceSnapshot ulMinLatency](self, "ulMinLatency") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot ulMinLatency](self, "ulMinLatency"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v16, kNStatSrcKeyInterfaceUlMinLatency);

    }
    if (-[NWSInterfaceSnapshot ulEffectiveLatency](self, "ulEffectiveLatency") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot ulEffectiveLatency](self, "ulEffectiveLatency"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v17, kNStatSrcKeyInterfaceUlEffectiveLatency);

    }
    if (-[NWSInterfaceSnapshot ulMaxLatency](self, "ulMaxLatency") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot ulMaxLatency](self, "ulMaxLatency"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v18, kNStatSrcKeyInterfaceUlMaxLatency);

    }
    if (-[NWSInterfaceSnapshot ulReTxtLevel](self, "ulReTxtLevel") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot ulReTxtLevel](self, "ulReTxtLevel"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v19, kNStatSrcKeyInterfaceUlReTxtLevel);

    }
    if (-[NWSInterfaceSnapshot dlMaxBandwidth](self, "dlMaxBandwidth") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot dlMaxBandwidth](self, "dlMaxBandwidth"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v20, kNStatSrcKeyInterfaceDlMaxBandwidth);

    }
    if (-[NWSInterfaceSnapshot dlEffectiveBandwidth](self, "dlEffectiveBandwidth") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot dlEffectiveBandwidth](self, "dlEffectiveBandwidth"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v21, kNStatSrcKeyInterfaceDlCurrentBandwidth);

    }
    if (-[NWSInterfaceSnapshot cellUlMinQueueSize](self, "cellUlMinQueueSize") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot cellUlMinQueueSize](self, "cellUlMinQueueSize"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v22, kNStatSrcKeyInterfaceCellUlMinQueueSize);

    }
    if (-[NWSInterfaceSnapshot cellUlAvgQueueSize](self, "cellUlAvgQueueSize") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot cellUlAvgQueueSize](self, "cellUlAvgQueueSize"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v23, kNStatSrcKeyInterfaceCellUlAvgQueueSize);

    }
    if (-[NWSInterfaceSnapshot cellUlMaxQueueSize](self, "cellUlMaxQueueSize") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot cellUlMaxQueueSize](self, "cellUlMaxQueueSize"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v24, kNStatSrcKeyInterfaceCellUlMaxQueueSize);

    }
    if (-[NWSInterfaceSnapshot cellConfigInactivityTime](self, "cellConfigInactivityTime") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot cellConfigInactivityTime](self, "cellConfigInactivityTime"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v25, kNStatSrcKeyInterfaceCellConfigInactivityTime);

    }
    if (-[NWSInterfaceSnapshot cellConfigBackoffTime](self, "cellConfigBackoffTime") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot cellConfigBackoffTime](self, "cellConfigBackoffTime"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v26, kNStatSrcKeyInterfaceCellConfigBackoffTime);

    }
    if (-[NWSInterfaceSnapshot wifiDlMinLatency](self, "wifiDlMinLatency") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiDlMinLatency](self, "wifiDlMinLatency"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v27, kNStatSrcKeyInterfaceWifiDlMinLatency);

    }
    if (-[NWSInterfaceSnapshot wifiDlEffectiveLatency](self, "wifiDlEffectiveLatency") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiDlEffectiveLatency](self, "wifiDlEffectiveLatency"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v28, kNStatSrcKeyInterfaceWifiDlEffectiveLatency);

    }
    if (-[NWSInterfaceSnapshot wifiDlMaxLatency](self, "wifiDlMaxLatency") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiDlMaxLatency](self, "wifiDlMaxLatency"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v29, kNStatSrcKeyInterfaceWifiDlMaxLatency);

    }
    if (-[NWSInterfaceSnapshot wifiDlErrorRate](self, "wifiDlErrorRate") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiDlErrorRate](self, "wifiDlErrorRate"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v30, kNStatSrcKeyInterfaceWifiDlErrorRate);

    }
    if (-[NWSInterfaceSnapshot wifiUlErrorRate](self, "wifiUlErrorRate") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiUlErrorRate](self, "wifiUlErrorRate"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v31, kNStatSrcKeyInterfaceWifiUlErrorRate);

    }
    if (-[NWSInterfaceSnapshot wifiConfigFrequency](self, "wifiConfigFrequency") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiConfigFrequency](self, "wifiConfigFrequency"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v32, kNStatSrcKeyInterfaceWifiConfigFrequency);

    }
    if (-[NWSInterfaceSnapshot wifiConfigMulticastRate](self, "wifiConfigMulticastRate") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiConfigMulticastRate](self, "wifiConfigMulticastRate"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v33, kNStatSrcKeyInterfaceWifiConfigMulticastRate);

    }
    if (-[NWSInterfaceSnapshot wifiScanCount](self, "wifiScanCount") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiScanCount](self, "wifiScanCount"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v34, kNStatSrcKeyInterfaceWifiScanCount);

    }
    if (-[NWSInterfaceSnapshot wifiScanDuration](self, "wifiScanDuration") != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiScanDuration](self, "wifiScanDuration"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v35, kNStatSrcKeyInterfaceWifiScanDuration);

    }
    v36 = v4;
  }

  return v4;
}

- (void)_handleCellExtra:(nstat_ifnet_desc_cellular_status *)a3
{
  unsigned int valid_bitmask;
  uint64_t link_quality_metric;
  uint64_t ul_effective_bandwidth;
  uint64_t ul_max_bandwidth;
  uint64_t ul_min_latency;
  uint64_t ul_max_latency;
  uint64_t ul_retxt_level;
  uint64_t ul_bytes_lost;
  uint64_t ul_min_queue_size;
  uint64_t ul_avg_queue_size;
  uint64_t ul_max_queue_size;
  uint64_t dl_effective_bandwidth;
  uint64_t dl_max_bandwidth;
  uint64_t config_inactivity_time;
  uint64_t config_backoff_time;

  valid_bitmask = a3->valid_bitmask;
  -[NWSInterfaceSnapshot _invalidateWifiCounts](self, "_invalidateWifiCounts");
  if ((valid_bitmask & 1) != 0)
    link_quality_metric = a3->link_quality_metric;
  else
    link_quality_metric = -1;
  -[NWSInterfaceSnapshot setLinkQualityMetric:](self, "setLinkQualityMetric:", link_quality_metric);
  if ((valid_bitmask & 2) != 0)
    ul_effective_bandwidth = a3->ul_effective_bandwidth;
  else
    ul_effective_bandwidth = -1;
  -[NWSInterfaceSnapshot setUlEffectiveBandwidth:](self, "setUlEffectiveBandwidth:", ul_effective_bandwidth);
  if ((valid_bitmask & 4) != 0)
    ul_max_bandwidth = a3->ul_max_bandwidth;
  else
    ul_max_bandwidth = -1;
  -[NWSInterfaceSnapshot setUlMaxBandwidth:](self, "setUlMaxBandwidth:", ul_max_bandwidth);
  if ((valid_bitmask & 8) != 0)
    ul_min_latency = a3->ul_min_latency;
  else
    ul_min_latency = -1;
  -[NWSInterfaceSnapshot setUlMinLatency:](self, "setUlMinLatency:", ul_min_latency);
  if ((valid_bitmask & 0x20) != 0)
  {
    -[NWSInterfaceSnapshot setUlEffectiveLatency:](self, "setUlEffectiveLatency:", a3->ul_effective_latency);
    ul_max_latency = a3->ul_max_latency;
  }
  else
  {
    ul_max_latency = -1;
    -[NWSInterfaceSnapshot setUlEffectiveLatency:](self, "setUlEffectiveLatency:", -1);
  }
  -[NWSInterfaceSnapshot setUlMaxLatency:](self, "setUlMaxLatency:", ul_max_latency);
  if ((valid_bitmask & 0x40) != 0)
    ul_retxt_level = a3->ul_retxt_level;
  else
    ul_retxt_level = -1;
  -[NWSInterfaceSnapshot setUlReTxtLevel:](self, "setUlReTxtLevel:", ul_retxt_level);
  if ((valid_bitmask & 0x80) != 0)
    ul_bytes_lost = a3->ul_bytes_lost;
  else
    ul_bytes_lost = -1;
  -[NWSInterfaceSnapshot setUlBytesLost:](self, "setUlBytesLost:", ul_bytes_lost);
  if ((valid_bitmask & 0x100) != 0)
    ul_min_queue_size = a3->ul_min_queue_size;
  else
    ul_min_queue_size = -1;
  -[NWSInterfaceSnapshot setCellUlMinQueueSize:](self, "setCellUlMinQueueSize:", ul_min_queue_size);
  if ((valid_bitmask & 0x200) != 0)
    ul_avg_queue_size = a3->ul_avg_queue_size;
  else
    ul_avg_queue_size = -1;
  -[NWSInterfaceSnapshot setCellUlAvgQueueSize:](self, "setCellUlAvgQueueSize:", ul_avg_queue_size);
  if ((valid_bitmask & 0x400) != 0)
    ul_max_queue_size = a3->ul_max_queue_size;
  else
    ul_max_queue_size = -1;
  -[NWSInterfaceSnapshot setCellUlMaxQueueSize:](self, "setCellUlMaxQueueSize:", ul_max_queue_size);
  if ((valid_bitmask & 0x800) != 0)
    dl_effective_bandwidth = a3->dl_effective_bandwidth;
  else
    dl_effective_bandwidth = -1;
  -[NWSInterfaceSnapshot setDlEffectiveBandwidth:](self, "setDlEffectiveBandwidth:", dl_effective_bandwidth);
  if ((valid_bitmask & 0x1000) != 0)
    dl_max_bandwidth = a3->dl_max_bandwidth;
  else
    dl_max_bandwidth = -1;
  -[NWSInterfaceSnapshot setDlMaxBandwidth:](self, "setDlMaxBandwidth:", dl_max_bandwidth);
  if ((valid_bitmask & 0x2000) != 0)
    config_inactivity_time = a3->config_inactivity_time;
  else
    config_inactivity_time = -1;
  -[NWSInterfaceSnapshot setCellConfigInactivityTime:](self, "setCellConfigInactivityTime:", config_inactivity_time);
  if ((valid_bitmask & 0x4000) != 0)
    config_backoff_time = a3->config_backoff_time;
  else
    config_backoff_time = -1;
  -[NWSInterfaceSnapshot setCellConfigBackoffTime:](self, "setCellConfigBackoffTime:", config_backoff_time);
}

- (void)_handleWifiExtra:(nstat_ifnet_desc_wifi_status *)a3
{
  unsigned int valid_bitmask;
  uint64_t link_quality_metric;
  uint64_t ul_effective_bandwidth;
  uint64_t ul_max_bandwidth;
  uint64_t ul_min_latency;
  uint64_t ul_effective_latency;
  uint64_t ul_max_latency;
  uint64_t ul_retxt_level;
  uint64_t ul_bytes_lost;
  uint64_t ul_error_rate;
  uint64_t dl_effective_bandwidth;
  uint64_t dl_max_bandwidth;
  uint64_t dl_min_latency;
  uint64_t dl_effective_latency;
  uint64_t dl_max_latency;
  uint64_t dl_error_rate;
  uint64_t config_frequency;
  uint64_t config_multicast_rate;
  uint64_t scan_count;
  uint64_t scan_duration;

  valid_bitmask = a3->valid_bitmask;
  -[NWSInterfaceSnapshot _invalidateCellCounts](self, "_invalidateCellCounts");
  if ((valid_bitmask & 1) != 0)
    link_quality_metric = a3->link_quality_metric;
  else
    link_quality_metric = -1;
  -[NWSInterfaceSnapshot setLinkQualityMetric:](self, "setLinkQualityMetric:", link_quality_metric);
  if ((valid_bitmask & 2) != 0)
    ul_effective_bandwidth = a3->ul_effective_bandwidth;
  else
    ul_effective_bandwidth = -1;
  -[NWSInterfaceSnapshot setUlEffectiveBandwidth:](self, "setUlEffectiveBandwidth:", ul_effective_bandwidth);
  if ((valid_bitmask & 4) != 0)
    ul_max_bandwidth = a3->ul_max_bandwidth;
  else
    ul_max_bandwidth = -1;
  -[NWSInterfaceSnapshot setUlMaxBandwidth:](self, "setUlMaxBandwidth:", ul_max_bandwidth);
  if ((valid_bitmask & 8) != 0)
    ul_min_latency = a3->ul_min_latency;
  else
    ul_min_latency = -1;
  -[NWSInterfaceSnapshot setUlMinLatency:](self, "setUlMinLatency:", ul_min_latency);
  if ((valid_bitmask & 0x10) != 0)
    ul_effective_latency = a3->ul_effective_latency;
  else
    ul_effective_latency = -1;
  -[NWSInterfaceSnapshot setUlEffectiveLatency:](self, "setUlEffectiveLatency:", ul_effective_latency);
  if ((valid_bitmask & 0x20) != 0)
    ul_max_latency = a3->ul_max_latency;
  else
    ul_max_latency = -1;
  -[NWSInterfaceSnapshot setUlMaxLatency:](self, "setUlMaxLatency:", ul_max_latency);
  if ((valid_bitmask & 0x40) != 0)
    ul_retxt_level = a3->ul_retxt_level;
  else
    ul_retxt_level = -1;
  -[NWSInterfaceSnapshot setUlReTxtLevel:](self, "setUlReTxtLevel:", ul_retxt_level);
  if ((valid_bitmask & 0x100) != 0)
    ul_bytes_lost = a3->ul_bytes_lost;
  else
    ul_bytes_lost = -1;
  -[NWSInterfaceSnapshot setUlBytesLost:](self, "setUlBytesLost:", ul_bytes_lost);
  if ((valid_bitmask & 0x4000) != 0)
    ul_error_rate = a3->ul_error_rate;
  else
    ul_error_rate = -1;
  -[NWSInterfaceSnapshot setWifiUlErrorRate:](self, "setWifiUlErrorRate:", ul_error_rate);
  if ((valid_bitmask & 0x200) != 0)
    dl_effective_bandwidth = a3->dl_effective_bandwidth;
  else
    dl_effective_bandwidth = -1;
  -[NWSInterfaceSnapshot setDlEffectiveBandwidth:](self, "setDlEffectiveBandwidth:", dl_effective_bandwidth);
  if ((valid_bitmask & 0x400) != 0)
    dl_max_bandwidth = a3->dl_max_bandwidth;
  else
    dl_max_bandwidth = -1;
  -[NWSInterfaceSnapshot setDlMaxBandwidth:](self, "setDlMaxBandwidth:", dl_max_bandwidth);
  if ((valid_bitmask & 0x800) != 0)
    dl_min_latency = a3->dl_min_latency;
  else
    dl_min_latency = -1;
  -[NWSInterfaceSnapshot setWifiDlMinLatency:](self, "setWifiDlMinLatency:", dl_min_latency);
  if ((valid_bitmask & 0x1000) != 0)
    dl_effective_latency = a3->dl_effective_latency;
  else
    dl_effective_latency = -1;
  -[NWSInterfaceSnapshot setWifiDlEffectiveLatency:](self, "setWifiDlEffectiveLatency:", dl_effective_latency);
  if ((valid_bitmask & 0x2000) != 0)
    dl_max_latency = a3->dl_max_latency;
  else
    dl_max_latency = -1;
  -[NWSInterfaceSnapshot setWifiDlMaxLatency:](self, "setWifiDlMaxLatency:", dl_max_latency);
  if ((valid_bitmask & 0x4000) != 0)
    dl_error_rate = a3->dl_error_rate;
  else
    dl_error_rate = -1;
  -[NWSInterfaceSnapshot setWifiDlErrorRate:](self, "setWifiDlErrorRate:", dl_error_rate);
  if ((valid_bitmask & 0x8000) != 0)
    config_frequency = a3->config_frequency;
  else
    config_frequency = -1;
  -[NWSInterfaceSnapshot setWifiConfigFrequency:](self, "setWifiConfigFrequency:", config_frequency);
  if ((valid_bitmask & 0x10000) != 0)
    config_multicast_rate = a3->config_multicast_rate;
  else
    config_multicast_rate = -1;
  -[NWSInterfaceSnapshot setWifiConfigMulticastRate:](self, "setWifiConfigMulticastRate:", config_multicast_rate);
  if ((valid_bitmask & 0x20000) != 0)
    scan_count = a3->scan_count;
  else
    scan_count = -1;
  -[NWSInterfaceSnapshot setWifiScanCount:](self, "setWifiScanCount:", scan_count);
  if ((valid_bitmask & 0x40000) != 0)
    scan_duration = a3->scan_duration;
  else
    scan_duration = -1;
  -[NWSInterfaceSnapshot setWifiScanDuration:](self, "setWifiScanDuration:", scan_duration);
}

- (void)_handleDescriptor:(nstat_ifnet_descriptor *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  unsigned int link_status_type;

  v3 = *(_OWORD *)&a3->link_status.u.wifi.ul_bytes_lost;
  v5 = *(_OWORD *)&a3->threshold;
  v4 = *(_OWORD *)&a3->link_status.u.cellular.valid_bitmask;
  *(_OWORD *)&self->_descriptor.link_status.u.wifi.ul_min_latency = *(_OWORD *)&a3->link_status.u.wifi.ul_min_latency;
  *(_OWORD *)&self->_descriptor.link_status.u.wifi.ul_bytes_lost = v3;
  *(_OWORD *)&self->_descriptor.threshold = v5;
  *(_OWORD *)&self->_descriptor.link_status.u.cellular.valid_bitmask = v4;
  v6 = *(_OWORD *)&a3->description[12];
  v8 = *(_OWORD *)&a3->link_status.u.wifi.dl_min_latency;
  v7 = *(_OWORD *)&a3->link_status.u.wifi.config_frequency;
  *(_OWORD *)&self->_descriptor.type = *(_OWORD *)&a3->type;
  *(_OWORD *)&self->_descriptor.description[12] = v6;
  *(_OWORD *)&self->_descriptor.link_status.u.wifi.dl_min_latency = v8;
  *(_OWORD *)&self->_descriptor.link_status.u.wifi.config_frequency = v7;
  v9 = *(_OWORD *)&a3->description[76];
  v11 = *(_OWORD *)&a3->description[28];
  v10 = *(_OWORD *)&a3->description[44];
  *(_OWORD *)&self->_descriptor.description[60] = *(_OWORD *)&a3->description[60];
  *(_OWORD *)&self->_descriptor.description[76] = v9;
  *(_OWORD *)&self->_descriptor.description[28] = v11;
  *(_OWORD *)&self->_descriptor.description[44] = v10;
  v13 = *(_OWORD *)&a3->description[108];
  v12 = *(_OWORD *)&a3->description[124];
  v14 = *(_OWORD *)&a3->description[92];
  *(_QWORD *)&self->_descriptor.name[12] = *(_QWORD *)&a3->name[12];
  *(_OWORD *)&self->_descriptor.description[108] = v13;
  *(_OWORD *)&self->_descriptor.description[124] = v12;
  *(_OWORD *)&self->_descriptor.description[92] = v14;
  link_status_type = a3->link_status.link_status_type;
  if (link_status_type == 2)
  {
    -[NWSInterfaceSnapshot _handleWifiExtra:](self, "_handleWifiExtra:", &a3->link_status.u);
  }
  else if (link_status_type == 1)
  {
    -[NWSInterfaceSnapshot _handleCellExtra:](self, "_handleCellExtra:", &a3->link_status.u);
  }
  else
  {
    -[NWSInterfaceSnapshot _invalidateAllExtraCounts](self, "_invalidateAllExtraCounts");
  }
}

- (id)description
{
  _printf_domain *v3;
  void *v4;
  char *__ret;

  __ret = 0;
  v3 = (_printf_domain *)printf_domain();
  asxprintf(&__ret, v3, 0, "NWStatisticsInterfaceSnapshot %I", self->_descriptor.ifindex);
  if (!__ret)
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", __ret, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  free(__ret);
  return v4;
}

- (NWSInterfaceSnapshot)initWithCounts:(const nstat_counts *)a3 interfaceDescriptor:(nstat_ifnet_descriptor *)a4 sourceIdent:(unint64_t)a5 seqno:(unint64_t)a6
{
  NWSInterfaceSnapshot *v7;
  NWSInterfaceSnapshot *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NWSInterfaceSnapshot;
  v7 = -[NWSSnapshot _initWithCounts:sourceIdent:seqno:](&v10, sel__initWithCounts_sourceIdent_seqno_, a3, a5, a6);
  v8 = v7;
  if (v7)
    -[NWSInterfaceSnapshot _handleDescriptor:](v7, "_handleDescriptor:", a4);
  return v8;
}

- (unint64_t)linkQualityMetric
{
  return self->_linkQualityMetric;
}

- (void)setLinkQualityMetric:(unint64_t)a3
{
  self->_linkQualityMetric = a3;
}

- (unint64_t)ulMaxBandwidth
{
  return self->_ulMaxBandwidth;
}

- (void)setUlMaxBandwidth:(unint64_t)a3
{
  self->_ulMaxBandwidth = a3;
}

- (unint64_t)ulEffectiveBandwidth
{
  return self->_ulEffectiveBandwidth;
}

- (void)setUlEffectiveBandwidth:(unint64_t)a3
{
  self->_ulEffectiveBandwidth = a3;
}

- (unint64_t)ulBytesLost
{
  return self->_ulBytesLost;
}

- (void)setUlBytesLost:(unint64_t)a3
{
  self->_ulBytesLost = a3;
}

- (unint64_t)ulMinLatency
{
  return self->_ulMinLatency;
}

- (void)setUlMinLatency:(unint64_t)a3
{
  self->_ulMinLatency = a3;
}

- (unint64_t)ulEffectiveLatency
{
  return self->_ulEffectiveLatency;
}

- (void)setUlEffectiveLatency:(unint64_t)a3
{
  self->_ulEffectiveLatency = a3;
}

- (unint64_t)ulMaxLatency
{
  return self->_ulMaxLatency;
}

- (void)setUlMaxLatency:(unint64_t)a3
{
  self->_ulMaxLatency = a3;
}

- (unint64_t)ulReTxtLevel
{
  return self->_ulReTxtLevel;
}

- (void)setUlReTxtLevel:(unint64_t)a3
{
  self->_ulReTxtLevel = a3;
}

- (unint64_t)dlMaxBandwidth
{
  return self->_dlMaxBandwidth;
}

- (void)setDlMaxBandwidth:(unint64_t)a3
{
  self->_dlMaxBandwidth = a3;
}

- (unint64_t)dlEffectiveBandwidth
{
  return self->_dlEffectiveBandwidth;
}

- (void)setDlEffectiveBandwidth:(unint64_t)a3
{
  self->_dlEffectiveBandwidth = a3;
}

- (unint64_t)cellUlMinQueueSize
{
  return self->_cellUlMinQueueSize;
}

- (void)setCellUlMinQueueSize:(unint64_t)a3
{
  self->_cellUlMinQueueSize = a3;
}

- (unint64_t)cellUlAvgQueueSize
{
  return self->_cellUlAvgQueueSize;
}

- (void)setCellUlAvgQueueSize:(unint64_t)a3
{
  self->_cellUlAvgQueueSize = a3;
}

- (unint64_t)cellUlMaxQueueSize
{
  return self->_cellUlMaxQueueSize;
}

- (void)setCellUlMaxQueueSize:(unint64_t)a3
{
  self->_cellUlMaxQueueSize = a3;
}

- (unint64_t)cellConfigInactivityTime
{
  return self->_cellConfigInactivityTime;
}

- (void)setCellConfigInactivityTime:(unint64_t)a3
{
  self->_cellConfigInactivityTime = a3;
}

- (unint64_t)cellConfigBackoffTime
{
  return self->_cellConfigBackoffTime;
}

- (void)setCellConfigBackoffTime:(unint64_t)a3
{
  self->_cellConfigBackoffTime = a3;
}

- (unint64_t)wifiUlErrorRate
{
  return self->_wifiUlErrorRate;
}

- (void)setWifiUlErrorRate:(unint64_t)a3
{
  self->_wifiUlErrorRate = a3;
}

- (unint64_t)wifiDlMinLatency
{
  return self->_wifiDlMinLatency;
}

- (void)setWifiDlMinLatency:(unint64_t)a3
{
  self->_wifiDlMinLatency = a3;
}

- (unint64_t)wifiDlEffectiveLatency
{
  return self->_wifiDlEffectiveLatency;
}

- (void)setWifiDlEffectiveLatency:(unint64_t)a3
{
  self->_wifiDlEffectiveLatency = a3;
}

- (unint64_t)wifiDlMaxLatency
{
  return self->_wifiDlMaxLatency;
}

- (void)setWifiDlMaxLatency:(unint64_t)a3
{
  self->_wifiDlMaxLatency = a3;
}

- (unint64_t)wifiDlErrorRate
{
  return self->_wifiDlErrorRate;
}

- (void)setWifiDlErrorRate:(unint64_t)a3
{
  self->_wifiDlErrorRate = a3;
}

- (unint64_t)wifiConfigFrequency
{
  return self->_wifiConfigFrequency;
}

- (void)setWifiConfigFrequency:(unint64_t)a3
{
  self->_wifiConfigFrequency = a3;
}

- (unint64_t)wifiConfigMulticastRate
{
  return self->_wifiConfigMulticastRate;
}

- (void)setWifiConfigMulticastRate:(unint64_t)a3
{
  self->_wifiConfigMulticastRate = a3;
}

- (unint64_t)wifiScanCount
{
  return self->_wifiScanCount;
}

- (void)setWifiScanCount:(unint64_t)a3
{
  self->_wifiScanCount = a3;
}

- (unint64_t)wifiScanDuration
{
  return self->_wifiScanDuration;
}

- (void)setWifiScanDuration:(unint64_t)a3
{
  self->_wifiScanDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceDescription, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end
