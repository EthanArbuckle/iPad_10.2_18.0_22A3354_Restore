@implementation NPTSystemCollector

- (void)startCollectingWithCompletion:(id)a3
{
  void (**v4)(id, id, void *);
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id location;
  id v28;

  v4 = (void (**)(id, id, void *))a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_alloc_init(MEMORY[0x24BEC2A70]);
  -[NPTSystemCollector setClient:](self, "setClient:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTSystemCollector setCachedMetadata:](self, "setCachedMetadata:", v7);

  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTSystemCollector cachedMetadata](self, "cachedMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("initial_state"));

  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NPTSystemCollector cachedMetadata](self, "cachedMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("events"));

  -[NPTSystemCollector fetchDeviceData](self, "fetchDeviceData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:");
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NPTSystemCollector client](self, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v13, "queryStatusForPeer:error:", 0, &v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v28;

  objc_msgSend(v14, "power");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v14, "power");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v18);

  }
  objc_initWeak(&location, self);
  -[NPTSystemCollector client](self, "client");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __52__NPTSystemCollector_startCollectingWithCompletion___block_invoke;
  v25[3] = &unk_24C991628;
  objc_copyWeak(&v26, &location);
  objc_msgSend(v19, "setEventCallback:", v25);

  -[NPTSystemCollector setEventsToMonitor:](self, "setEventsToMonitor:", &unk_24C9A7D80);
  -[NPTSystemCollector client](self, "client");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTSystemCollector eventsToMonitor](self, "eventsToMonitor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "startMonitoringEvents:", v21);

  -[NPTSystemCollector cachedMetadata](self, "cachedMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v5, CFSTR("initial_state"));

  if (v15)
    objc_msgSend(v12, "addObject:", v15);
  if (v4)
  {
    v23 = (void *)objc_msgSend(v12, "copy");
    v4[2](v4, v5, v23);

  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __52__NPTSystemCollector_startCollectingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NPTMetadataEvent *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  id v18;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_alloc_init(NPTMetadataEvent);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetadataEvent setTimeStamp:](v5, "setTimeStamp:", v6);

  -[NPTMetadataEvent setCollectorType:](v5, "setCollectorType:", objc_opt_class());
  -[NPTMetadataEvent setEventType:](v5, "setEventType:", 8);
  v7 = objc_alloc_init(MEMORY[0x24BEC2A70]);
  v18 = 0;
  objc_msgSend(v7, "queryStatusForPeer:error:", 0, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;

  if (v8)
  {
    objc_msgSend(v8, "power");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTMetadataEvent setData:](v5, "setData:", v11);

  }
  v12 = WeakRetained;
  objc_sync_enter(v12);
  objc_msgSend(v12, "cachedMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("events"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetadataEvent asDictionary](v5, "asDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v15);

  objc_sync_exit(v12);
  objc_msgSend(v12, "metadataDidChangeHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v12, "metadataDidChangeHandler");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NPTMetadataEvent *, id))v17)[2](v17, v5, v9);

  }
}

- (void)stopCollecting
{
  void *v3;
  void *v4;

  -[NPTSystemCollector client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTSystemCollector eventsToMonitor](self, "eventsToMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopMonitoringEvents:", v4);

  -[NPTSystemCollector setClient:](self, "setClient:", 0);
}

+ (id)collectorName
{
  return CFSTR("system");
}

- (id)fetchDeviceData
{
  id v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;

  v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v2 = objc_alloc_init(MEMORY[0x24BDD1760]);
  MGCopyAnswer();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("Unknown Version");
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  MGCopyAnswer();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("Unknown Model");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  MGCopyAnswer();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("Unknown System");
  if (v11)
    v13 = (__CFString *)v11;
  v14 = v13;

  MGCopyAnswer();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  MGCopyAnswer();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  IOPSGetPercentRemaining();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", IOPSDrawingUnlimitedPower());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = CFSTR("Unknown");
  else
    v18 = CFSTR("Unplugged");
  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v6, CFSTR("system_version"));

  objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("system_battery_level"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v10, CFSTR("system_device_model"));

  objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, CFSTR("system_name"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v2, "activeProcessorCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("system_active_processor_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v2, "isLowPowerModeEnabled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("system_low_power_mode_enabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v2, "processorCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("system_processor_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v2, "physicalMemory"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("system_physical_memory"));

  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("system_battery_state"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("system_os_variant"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, CFSTR("system_device_class"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, CFSTR("system_powersource_connected"));
  objc_msgSend(v26, "addEntriesFromDictionary:", v19);

  return v26;
}

- (id)metadataDidChangeHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setMetadataDidChangeHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSMutableDictionary)cachedMetadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCachedMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (W5Client)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSArray)eventsToMonitor
{
  return self->_eventsToMonitor;
}

- (void)setEventsToMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_eventsToMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsToMonitor, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->cachedMetadata, 0);
  objc_storeStrong(&self->metadataDidChangeHandler, 0);
}

@end
