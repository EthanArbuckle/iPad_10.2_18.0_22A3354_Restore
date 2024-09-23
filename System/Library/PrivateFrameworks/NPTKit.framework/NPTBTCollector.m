@implementation NPTBTCollector

- (void)startCollectingWithCompletion:(id)a3
{
  void (**v4)(id, id, void *);
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
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
  _QWORD v24[4];
  id v25;
  id location;
  id v27;

  v4 = (void (**)(id, id, void *))a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_alloc_init(MEMORY[0x24BEC2A70]);
  -[NPTBTCollector setClient:](self, "setClient:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTBTCollector setCachedMetadata:](self, "setCachedMetadata:", v8);

  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTBTCollector cachedMetadata](self, "cachedMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("initial_state"));

  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NPTBTCollector cachedMetadata](self, "cachedMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("events"));

  -[NPTBTCollector client](self, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v13, "queryStatusForPeer:error:", 0, &v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v27;

  objc_msgSend(v14, "bluetooth");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v14, "bluetooth");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v18);

  }
  objc_initWeak(&location, self);
  -[NPTBTCollector client](self, "client");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __48__NPTBTCollector_startCollectingWithCompletion___block_invoke;
  v24[3] = &unk_24C991628;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v19, "setEventCallback:", v24);

  -[NPTBTCollector setEventsToMonitor:](self, "setEventsToMonitor:", &unk_24C9A7D68);
  -[NPTBTCollector client](self, "client");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTBTCollector eventsToMonitor](self, "eventsToMonitor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "startMonitoringEvents:", v21);

  -[NPTBTCollector cachedMetadata](self, "cachedMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v5, CFSTR("initial_state"));

  if (v15)
    objc_msgSend(v7, "addObject:", v15);
  if (v4)
  {
    v23 = (void *)objc_msgSend(v7, "copy");
    v4[2](v4, v5, v23);

  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __48__NPTBTCollector_startCollectingWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  -[NPTMetadataEvent setEventType:](v5, "setEventType:", 7);
  v7 = objc_alloc_init(MEMORY[0x24BEC2A70]);
  v18 = 0;
  objc_msgSend(v7, "queryStatusForPeer:error:", 0, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;

  if (v8)
  {
    objc_msgSend(v8, "bluetooth");
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

  -[NPTBTCollector client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTBTCollector eventsToMonitor](self, "eventsToMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopMonitoringEvents:", v4);

  -[NPTBTCollector setClient:](self, "setClient:", 0);
}

+ (id)collectorName
{
  return CFSTR("bluetooth");
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
