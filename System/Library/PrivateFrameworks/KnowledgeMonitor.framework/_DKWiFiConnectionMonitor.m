@implementation _DKWiFiConnectionMonitor

+ (id)entitlements
{
  return &unk_24DA70E08;
}

+ (BOOL)writeToBiome
{
  return _os_feature_enabled_impl() ^ 1;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKWiFiConnectionMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v5, sel_instantMonitorNeedsActivation))
  {
    -[_DKMonitor queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33___DKWiFiConnectionMonitor_start__block_invoke;
    block[3] = &unk_24DA66D10;
    block[4] = self;
    dispatch_sync(v3, block);

  }
}

- (void)_handleWiFiEvent:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[_DKMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = objc_msgSend(v6, "type");
  if (v5 == 30)
  {
    -[_DKWiFiConnectionMonitor _handleKnownNetworkProfileChangedEvent:](self, "_handleKnownNetworkProfileChangedEvent:", v6);
  }
  else if (v5 == 2)
  {
    -[_DKWiFiConnectionMonitor _handleWiFiStateChangeEvent:](self, "_handleWiFiStateChangeEvent:", v6);
  }

}

- (void)_handleWiFiStateChangeEvent:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *currentSSID;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;

  v27 = a3;
  v4 = self->_currentSSID;
  -[CWFInterface networkName](self->_interface, "networkName");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  currentSSID = self->_currentSSID;
  self->_currentSSID = v5;

  if (v4 != self->_currentSSID && (-[NSString isEqual:](v4, "isEqual:") & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BE1B098];
    v8 = self->_currentSSID;
    objc_msgSend(MEMORY[0x24BE1AFF8], "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifierWithString:type:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BE1B080];
    objc_msgSend(MEMORY[0x24BE1B130], "wifiConnectionStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "eventWithStream:startDate:endDate:value:", v12, v13, v14, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DKMonitor currentEvent](self, "currentEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v15, v16 != 0);

    v17 = self->_currentSSID;
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForWiFiConnectionSSID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

    if (+[_DKWiFiConnectionMonitor writeToBiome](_DKWiFiConnectionMonitor, "writeToBiome"))
    {
      objc_msgSend(v27, "timestamp");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceReferenceDate");
      v22 = v21;

      if (v4)
      {
        v23 = objc_alloc(MEMORY[0x24BE0C398]);
        v24 = (void *)objc_msgSend(v23, "initWithSSID:starting:", v4, MEMORY[0x24BDBD1C0]);
        -[BMSource sendEvent:timestamp:](self->_source, "sendEvent:timestamp:", v24, v22);

      }
      if (self->_currentSSID)
      {
        v25 = objc_alloc(MEMORY[0x24BE0C398]);
        v26 = (void *)objc_msgSend(v25, "initWithSSID:starting:", self->_currentSSID, MEMORY[0x24BDBD1C8]);
        -[BMSource sendEvent:timestamp:](self->_source, "sendEvent:timestamp:", v26, v22);

      }
    }
  }

}

- (void)_handleKnownNetworkProfileChangedEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[2];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE29EE0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", &unk_24DA70FA8);

  if (v7)
  {
    objc_msgSend(v4, "info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE29EE8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "networkName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v10;
      _os_log_impl(&dword_219056000, v11, OS_LOG_TYPE_INFO, "Forgetting wifi networks with SSID: %@", buf, 0xCu);
    }

    v12 = (void *)MEMORY[0x24BE1B0F8];
    objc_msgSend(MEMORY[0x24BE1B130], "wifiConnectionStream");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateForEventsWithStreamName:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForEventsWithStringValue:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD14C0];
    v29[0] = v15;
    v29[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "andPredicateWithSubpredicates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DKWiFiConnectionMonitor historicalDeletingHandler](self, "historicalDeletingHandler");
    v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v20)[2](v20, v19);

    BiomeLibrary();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "Device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "Wireless");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "WiFi");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pruner");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __67___DKWiFiConnectionMonitor__handleKnownNetworkProfileChangedEvent___block_invoke;
    v27[3] = &unk_24DA67138;
    v28 = v10;
    v26 = v10;
    objc_msgSend(v25, "deleteWithPolicy:eventsPassingTest:", CFSTR("forget-this-network"), v27);

  }
}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKWiFiConnectionMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v5, sel_instantMonitorNeedsDeactivation))
  {
    -[_DKMonitor queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32___DKWiFiConnectionMonitor_stop__block_invoke;
    block[3] = &unk_24DA66D10;
    block[4] = self;
    dispatch_sync(v3, block);

  }
}

- (id)historicalDeletingHandler
{
  return self->historicalDeletingHandler;
}

- (void)setHistoricalDeletingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->historicalDeletingHandler, 0);
  objc_storeStrong((id *)&self->_currentSSID, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
