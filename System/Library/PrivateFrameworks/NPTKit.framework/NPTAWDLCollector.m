@implementation NPTAWDLCollector

- (void)startCollectingWithCompletion:(id)a3
{
  void (**v4)(id, id, void *);
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, id, void *))a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTAWDLCollector setCachedMetadata:](self, "setCachedMetadata:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTAWDLCollector cachedMetadata](self, "cachedMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("initial_state"));

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NPTAWDLCollector cachedMetadata](self, "cachedMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("events"));

  if ((os_variant_has_internal_content() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE29F18]), "initWithServiceType:", 1);
    -[NPTAWDLCollector setInterface:](self, "setInterface:", v11);

    objc_initWeak(&location, self);
    -[NPTAWDLCollector interface](self, "interface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __50__NPTAWDLCollector_startCollectingWithCompletion___block_invoke;
    v25[3] = &unk_24C9914A8;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v12, "setEventHandler:", v25);

    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NPTAWDLCollector interface](self, "interface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activate");

    -[NPTAWDLCollector interface](self, "interface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v15, "startMonitoringEventType:error:", 17, &v24);
    v16 = v24;

    -[NPTAWDLCollector fetchAWDLData](self, "fetchAWDLData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v17);
    -[NPTAWDLCollector cachedMetadata](self, "cachedMetadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v5, CFSTR("initial_state"));

    if (v16)
      objc_msgSend(v13, "addObject:", v16);
    if (v4)
    {
      v19 = (void *)objc_msgSend(v13, "copy");
      v4[2](v4, v5, v19);

    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValue:forKey:", CFSTR("AWDL Metrics only available on Internal Builds"), *MEMORY[0x24BDD0FC8]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPTKit"), -1, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v4)
    {
      v28[0] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v5, v23);

    }
  }

}

void __50__NPTAWDLCollector_startCollectingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  NPTMetadataEvent *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_alloc_init(NPTMetadataEvent);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetadataEvent setTimeStamp:](v4, "setTimeStamp:", v6);

  -[NPTMetadataEvent setCollectorType:](v4, "setCollectorType:", objc_opt_class());
  if (objc_msgSend(v17, "type") != 17)
  {
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
    v4 = 0;
LABEL_9:

    goto LABEL_10;
  }
  -[NPTMetadataEvent setEventType:](v4, "setEventType:", 17);
  objc_msgSend(WeakRetained, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "AWDLSyncState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(objc_retainAutorelease(v8), "bytes");
    W5DescriptionForAWDLSyncState();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("data"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("data"));
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetadataEvent setData:](v4, "setData:", v11);

  if (v4)
  {
    v12 = WeakRetained;
    objc_sync_enter(v12);
    objc_msgSend(v12, "cachedMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("events"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTMetadataEvent asDictionary](v4, "asDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

    objc_sync_exit(v12);
    objc_msgSend(v12, "metadataDidChangeHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v12, "metadataDidChangeHandler");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, NPTMetadataEvent *, _QWORD))v10)[2](v10, v4, 0);
      goto LABEL_9;
    }
  }
LABEL_10:

}

- (void)stopCollecting
{
  id v2;

  -[NPTAWDLCollector interface](self, "interface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

+ (id)collectorName
{
  return CFSTR("awdl");
}

- (id)fetchAWDLData
{
  id v3;
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

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[NPTAWDLCollector interface](self, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AWDL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v6, "powerOn"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("awdl_power_state"));

  -[NPTAWDLCollector interface](self, "interface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "AWDLMasterChannel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i"), *(unsigned int *)(objc_msgSend(objc_retainAutorelease(v9), "bytes") + 4));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("awdl_master_channel"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("awdl_master_channel"));
  }
  -[NPTAWDLCollector interface](self, "interface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "AWDLSecondaryMasterChannel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i"), *(unsigned int *)(objc_msgSend(objc_retainAutorelease(v12), "bytes") + 4));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("awdl_secondary_master_channel"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("awdl_secondary_master_channel"));
  }
  -[NPTAWDLCollector awdlOpModeString](self, "awdlOpModeString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("awdl_op_mode"));

  -[NPTAWDLCollector interface](self, "interface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "AWDLElectionParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i"), *(unsigned int *)(objc_msgSend(objc_retainAutorelease(v16), "bytes") + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("awdl_election_parameters"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("awdl_election_parameters"));
  }
  -[NPTAWDLCollector interface](self, "interface");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "AWDLSyncState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(objc_retainAutorelease(v19), "bytes");
    W5DescriptionForAWDLSyncState();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("awdl_sync_state"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("awdl_sync_state"));
  }
  -[NPTAWDLCollector interface](self, "interface");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "AWDLSyncChannelSequence");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(objc_retainAutorelease(v22), "bytes");
    W5DescriptionForAWDLSyncChannelSequence();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("awdl_sync_channel_sequence"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("awdl_sync_channel_sequence"));
  }
  -[NPTAWDLCollector interface](self, "interface");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "AWDLStrategy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(objc_retainAutorelease(v25), "bytes");
    W5DescriptionForAWDLScheduleState();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("awdl_schedule"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("awdl_schedule"));
  }

  return v3;
}

- (id)awdlOpModeString
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;

  -[NPTAWDLCollector interface](self, "interface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "AWDLOpMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = objc_retainAutorelease(v3);
    if (*(_DWORD *)(objc_msgSend(v5, "bytes") + 4) <= 2u)
      v6 = awdlOpModeString_modestr[*(unsigned int *)(objc_msgSend(objc_retainAutorelease(v5), "bytes") + 4)];
    else
      v6 = "Unknown";
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%s"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
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

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->cachedMetadata, 0);
  objc_storeStrong(&self->metadataDidChangeHandler, 0);
}

@end
