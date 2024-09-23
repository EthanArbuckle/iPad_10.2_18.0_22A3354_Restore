@implementation ULWiFiBridge

- (ULWiFiBridge)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  ULWiFiBridge *v8;
  ULWiFiBridge *v9;
  ULScanProviderMutableBool *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ULWiFiBridge;
  v8 = -[ULWiFiBridge init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ULWiFiBridge setQueue:](v8, "setQueue:", v7);
    -[ULWiFiBridge setDelegate:](v9, "setDelegate:", v6);
    v10 = -[ULScanProviderMutableBool initWithBool:]([ULScanProviderMutableBool alloc], "initWithBool:", 0);
    -[ULWiFiBridge setDoSendResultsToClient:](v9, "setDoSendResultsToClient:", v10);

  }
  return v9;
}

- (void)start
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[ULWiFiBridge queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_4);
  v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "#wifi-bridge, Creating WiFi interface", buf, 2u);
  }
  v5 = (void *)objc_opt_new();
  -[ULWiFiBridge setWifiInterface:](self, "setWifiInterface:", v5);

  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __21__ULWiFiBridge_start__block_invoke;
  v24[3] = &unk_2511D2C80;
  objc_copyWeak(&v25, &location);
  -[ULWiFiBridge wifiInterface](self, "wifiInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInvalidationHandler:", v24);

  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __21__ULWiFiBridge_start__block_invoke_3;
  v22[3] = &unk_2511D2CD0;
  objc_copyWeak(&v23, &location);
  -[ULWiFiBridge wifiInterface](self, "wifiInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEventHandler:", v22);

  -[ULWiFiBridge wifiInterface](self, "wifiInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activate");

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_4);
  v10 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[ULWiFiBridge wifiInterface](self, "wifiInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "interfaceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v12;
    _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_DEFAULT, "#wifi-bridge, WiFi interface activated, name:%@", buf, 0xCu);

  }
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_4);
  v13 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)MEMORY[0x24BDD16E0];
    -[ULWiFiBridge wifiInterface](self, "wifiInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "powerOn"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v16;
    _os_log_impl(&dword_2419D9000, v13, OS_LOG_TYPE_DEFAULT, "#wifi-bridge, Is WiFi On, :%@", buf, 0xCu);

  }
  -[ULWiFiBridge wifiInterface](self, "wifiInterface");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v17, "startMonitoringEventType:error:", 3, &v21);
  v18 = v21;

  if (v18)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_4);
    v19 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v18;
      _os_log_impl(&dword_2419D9000, v19, OS_LOG_TYPE_ERROR, "Error starting BSSID monitoring: %@", buf, 0xCu);
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULWiFiBridge _onBSSIDChanged:](self, "_onBSSIDChanged:", v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __21__ULWiFiBridge_start__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __21__ULWiFiBridge_start__block_invoke_2;
    block[3] = &unk_2511D2C58;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __21__ULWiFiBridge_start__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onInterfaceInvalidation");
}

void __21__ULWiFiBridge_start__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  void *v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __21__ULWiFiBridge_start__block_invoke_4;
    v7[3] = &unk_2511D2CA8;
    v8 = v3;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

void __21__ULWiFiBridge_start__block_invoke_4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "type") == 3)
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "timestamp");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_onBSSIDChanged:");

  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_4);
    v3 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v7 = v4;
      _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_ERROR, "#wifi-bridge, Unexpected CWFEvent: %@", buf, 0xCu);
    }
  }
}

- (void)startScanWithStrategy:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  ULScanProviderMutableBool *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  ULScanProviderMutableBool *v12;
  _QWORD v13[4];
  id v14;
  ULScanProviderMutableBool *v15;
  id v16;
  id buf[2];

  v4 = a3;
  -[ULWiFiBridge queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[ULWiFiBridge isScanInProgress](self, "isScanInProgress"))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_4);
    v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_ERROR, "#wifi-bridge, WiFi scan already in progress, skipping scan", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    v7 = -[ULScanProviderMutableBool initWithBool:]([ULScanProviderMutableBool alloc], "initWithBool:", 1);
    -[ULWiFiBridge setDoSendResultsToClient:](self, "setDoSendResultsToClient:", v7);
    -[ULWiFiBridge setIsScanInProgress:](self, "setIsScanInProgress:", 1);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(buf, self);
    -[ULWiFiBridge wifiInterface](self, "wifiInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ULWiFiBridge _wiFiScanParametersFromStrategy:](ULWiFiBridge, "_wiFiScanParametersFromStrategy:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __38__ULWiFiBridge_startScanWithStrategy___block_invoke;
    v13[3] = &unk_2511D2D20;
    objc_copyWeak(&v16, buf);
    v11 = v8;
    v14 = v11;
    v12 = v7;
    v15 = v12;
    objc_msgSend(v9, "performScanWithParameters:reply:", v10, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);

  }
}

void __38__ULWiFiBridge_startScanWithStrategy___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_4);
    v8 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)MEMORY[0x24BDD16E0];
      v10 = v8;
      objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(a1[4], "timeIntervalSinceNow");
      objc_msgSend(v12, "numberWithDouble:", -v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v11;
      v22 = 2112;
      v23 = v5;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_INFO, "#wifi-bridge, Received Wifi scan results with length:%@ error: %@, time from request to callback:%@[sec]", buf, 0x20u);

    }
    objc_msgSend(WeakRetained, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __38__ULWiFiBridge_startScanWithStrategy___block_invoke_86;
    v16[3] = &unk_2511D2CF8;
    v16[4] = WeakRetained;
    v17 = a1[5];
    v18 = v5;
    v19 = v6;
    dispatch_async(v15, v16);

  }
}

void __38__ULWiFiBridge_startScanWithStrategy___block_invoke_86(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(*(id *)(a1 + 40), "BOOLValue"))
  {
    objc_msgSend(*(id *)(a1 + 32), "stopScan");
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v5, "onWifiScanResults:withError:", 0);
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[ULWiFiBridge _ulRawScanResultsFromCWFScanResults:receivedDate:](ULWiFiBridge, "_ulRawScanResultsFromCWFScanResults:receivedDate:", v2, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "onWifiScanResults:withError:", v4, 0);

    }
  }

}

- (void)stopScan
{
  NSObject *v3;
  id v4;

  -[ULWiFiBridge queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[ULWiFiBridge isScanInProgress](self, "isScanInProgress"))
  {
    -[ULWiFiBridge setIsScanInProgress:](self, "setIsScanInProgress:", 0);
    -[ULWiFiBridge doSendResultsToClient](self, "doSendResultsToClient");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBoolValue:", 0);

  }
}

- (BOOL)isWifiEnabled
{
  NSObject *v3;
  void *v4;

  -[ULWiFiBridge queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ULWiFiBridge wifiInterface](self, "wifiInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "powerOn");

  return (char)v3;
}

- (void)_onInterfaceInvalidation
{
  NSObject *v3;
  void *v4;
  id v5;

  -[ULWiFiBridge queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ULWiFiBridge wifiInterface](self, "wifiInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[ULWiFiBridge setWifiInterface:](self, "setWifiInterface:", 0);
  -[ULWiFiBridge delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "onInterfaceInvalidation");

}

- (void)_onBSSIDChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  ULWiFiScanChannel *v9;
  ULWiFiAssociatedState *v10;
  void *v11;
  ULWiFiAssociatedState *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[ULWiFiBridge queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ULWiFiBridge wifiInterface](self, "wifiInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "BSSID");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[ULWiFiBridge wifiInterface](self, "wifiInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "channel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = -[ULWiFiScanChannel initWithBand:andChannelNumber:]([ULWiFiScanChannel alloc], "initWithBand:andChannelNumber:", +[ULWiFiBridge _ulBandFromCWFBand:](ULWiFiBridge, "_ulBandFromCWFBand:", objc_msgSend(v8, "band")), objc_msgSend(v8, "channel"));
  else
    v9 = 0;
  v10 = [ULWiFiAssociatedState alloc];
  -[ULWiFiBridge wifiInterface](self, "wifiInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ULWiFiAssociatedState initWithChannel:BSSID:RSSI:time:](v10, "initWithChannel:BSSID:RSSI:time:", v9, v14, objc_msgSend(v11, "RSSI"), v4);

  -[ULWiFiBridge delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "onAssociatedStateChange:", v12);

}

+ (id)_wiFiScanParametersFromStrategy:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE29F28]);
  objc_msgSend(v4, "setNumberOfScans:", objc_msgSend(v3, "numberOfScans"));
  objc_msgSend(v4, "setRestTime:", objc_msgSend(v3, "restTimeInMilliSeconds"));
  objc_msgSend(v4, "setDwellTime:", objc_msgSend(v3, "dwellTimeMilliSeconds"));
  objc_msgSend(v4, "setAcceptableCacheAge:", objc_msgSend(v3, "acceptableCacheAge"));
  objc_msgSend(v4, "setMaximumAge:", objc_msgSend(v3, "maximumAge"));
  objc_msgSend(v4, "setBSSType:", 2);
  v5 = 1;
  objc_msgSend(v4, "setPHYMode:", 1);
  v6 = objc_msgSend(v3, "scanType");
  if (v6)
  {
    if (v6 != 1)
      goto LABEL_5;
    v5 = 2;
  }
  objc_msgSend(v4, "setScanType:", v5);
LABEL_5:
  objc_msgSend(v4, "setIncludeHiddenNetworks:", 1);
  objc_msgSend(v4, "setScanFlags:", objc_msgSend(v3, "isLowPriority") | objc_msgSend(v3, "isLowLatency") | objc_msgSend(v3, "doAbortOngoingScan"));
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2511EE868);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludeProperties:", v7);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v16 = v3;
  objc_msgSend(v3, "channels");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x24BE29F08], "channelWithNumber:band:width:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "channelNumber"), +[ULWiFiBridge _ulBandToCWFBand:](ULWiFiBridge, "_ulBandToCWFBand:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "band")), 20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChannels:", v14);

  return v4;
}

+ (unsigned)_ulBandToCWFBand:(unint64_t)a3
{
  if (a3 - 1 < 3)
    return a3;
  else
    return 0;
}

+ (unint64_t)_ulBandFromCWFBand:(unsigned int)a3
{
  uint64_t v3;

  v3 = a3 - 1;
  if (v3 < 3)
    return v3 + 1;
  else
    return 0;
}

+ (id)_ulRawScanResultsFromCWFScanResults:(id)a3 receivedDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        +[ULWiFiBridge _ulSingleRawScanResultsFromCWFScanResult:receivedDate:](ULWiFiBridge, "_ulSingleRawScanResultsFromCWFScanResult:receivedDate:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), v6, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_ulSingleRawScanResultsFromCWFScanResult:(id)a3 receivedDate:(id)a4
{
  id v4;
  ULWiFiRawScanSingleAP *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ULWiFiScanChannel *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  ULWiFiScanChannel *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  unint64_t v20;
  void *v21;
  ULWiFiRawScanSingleAP *v22;
  void *v23;
  uint64_t v24;

  v4 = a3;
  v5 = objc_alloc_init(ULWiFiRawScanSingleAP);
  objc_msgSend(v4, "networkName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULWiFiRawScanSingleAP setSSID:](v5, "setSSID:", v6);

  objc_msgSend(v4, "BSSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULWiFiRawScanSingleAP setBSSID:](v5, "setBSSID:", v7);

  -[ULWiFiRawScanSingleAP setRSSI:](v5, "setRSSI:", objc_msgSend(v4, "RSSI"));
  objc_msgSend(v4, "channel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULWiFiRawScanSingleAP setIsRssiInvalid:](v5, "setIsRssiInvalid:", (objc_msgSend(v8, "flags") >> 12) & 1);

  objc_msgSend(v4, "channel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULWiFiRawScanSingleAP setIsRssiOffChannel:](v5, "setIsRssiOffChannel:", (objc_msgSend(v9, "flags") >> 15) & 1);

  v10 = [ULWiFiScanChannel alloc];
  objc_msgSend(v4, "channel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[ULWiFiBridge _ulBandFromCWFBand:](ULWiFiBridge, "_ulBandFromCWFBand:", objc_msgSend(v11, "band"));
  objc_msgSend(v4, "channel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ULWiFiScanChannel initWithBand:andChannelNumber:](v10, "initWithBand:andChannelNumber:", v12, objc_msgSend(v13, "channel"));
  -[ULWiFiRawScanSingleAP setChannel:](v5, "setChannel:", v14);

  -[ULWiFiRawScanSingleAP setIsPersonalHotSpot:](v5, "setIsPersonalHotSpot:", objc_msgSend(v4, "isPersonalHotspot"));
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v17 = v16;

  v18 = v17 - (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0;
  v19 = (void *)MEMORY[0x24BDBCE60];
  v20 = objc_msgSend(v4, "timestamp");

  objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:", v18 + (double)v20 / 1000000000.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULWiFiRawScanSingleAP setScanTimestamp:](v5, "setScanTimestamp:", v21);

  -[ULWiFiRawScanSingleAP channel](v5, "channel");
  v22 = (ULWiFiRawScanSingleAP *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[ULWiFiRawScanSingleAP channel](v5, "channel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "band");

    if (v24)
    {
      -[ULWiFiRawScanSingleAP BSSID](v5, "BSSID");
      v22 = (ULWiFiRawScanSingleAP *)objc_claimAutoreleasedReturnValue();

      if (v22)
        v22 = v5;
    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (BOOL)isScanInProgress
{
  return self->_isScanInProgress;
}

- (void)setIsScanInProgress:(BOOL)a3
{
  self->_isScanInProgress = a3;
}

- (ULWiFiBridgeDelegate)delegate
{
  return (ULWiFiBridgeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CWFInterface)wifiInterface
{
  return self->_wifiInterface;
}

- (void)setWifiInterface:(id)a3
{
  objc_storeStrong((id *)&self->_wifiInterface, a3);
}

- (ULScanProviderMutableBool)doSendResultsToClient
{
  return self->_doSendResultsToClient;
}

- (void)setDoSendResultsToClient:(id)a3
{
  objc_storeStrong((id *)&self->_doSendResultsToClient, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_doSendResultsToClient, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
