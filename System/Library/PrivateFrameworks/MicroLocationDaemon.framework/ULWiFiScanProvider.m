@implementation ULWiFiScanProvider

- (ULWiFiScanProvider)initWithDelegate:(id)a3 andQueue:(id)a4
{
  id v6;
  id v7;
  ULWiFiScanProvider *v8;
  ULWiFiScanProvider *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ULWiFiScanProvider;
  v8 = -[ULWiFiScanProvider init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ULWiFiScanProvider setDelegate:](v8, "setDelegate:", v6);
    -[ULWiFiScanProvider setQueue:](v9, "setQueue:", v7);
    -[ULWiFiScanProvider _createAndStartWifiBridge](v9, "_createAndStartWifiBridge");
  }

  return v9;
}

- (void)startScanWithStrategyType:(id)a3 initialDelay:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ULWiFiScanProvider queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[ULWiFiScanProvider wiFiBridge](self, "wiFiBridge");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[ULWiFiScanProvider _createAndStartWifiBridge](self, "_createAndStartWifiBridge");
  -[ULWiFiScanProvider wiFiBridge](self, "wiFiBridge");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isWifiEnabled");

  if ((v10 & 1) != 0)
  {
    if (-[ULWiFiScanProvider isScanInProgress](self, "isScanInProgress"))
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
      v11 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "wifi-provider, Attempting wifi scan while scan in progress, returning";
LABEL_13:
        _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      }
    }
    else
    {
      -[ULWiFiScanProvider setIsScanInProgress:](self, "setIsScanInProgress:", 1);
      v13 = (void *)objc_msgSend(v6, "copy");
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
      v14 = (id)logObject_MicroLocation_Default;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v15;
        _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_DEFAULT, "wifi-provider, Starting WiFi scan timer with delay: %@", buf, 0xCu);

      }
      objc_initWeak((id *)buf, self);
      v18 = MEMORY[0x24BDAC760];
      v19 = 3221225472;
      v20 = __61__ULWiFiScanProvider_startScanWithStrategyType_initialDelay___block_invoke;
      v21 = &unk_2511D8FA8;
      objc_copyWeak(&v23, (id *)buf);
      v16 = v13;
      v22 = v16;
      +[ULTimerFactory timerOnPrimaryQueueWithInterval:repeats:block:](ULTimerFactory, "timerOnPrimaryQueueWithInterval:repeats:block:", 0, &v18, a4 + 0.000000001);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ULWiFiScanProvider setInternalTimer:](self, "setInternalTimer:", v17, v18, v19, v20, v21);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);

    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
    v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "wifi-provider, Start Scan While wifi is off, returning";
      goto LABEL_13;
    }
  }

}

void __61__ULWiFiScanProvider_startScanWithStrategyType_initialDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
    v3 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "wifi-provider, Starting WiFi scan with strategy: %@", (uint8_t *)&v6, 0xCu);
    }
    objc_msgSend(WeakRetained, "wiFiBridge");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startScanWithStrategy:", *(_QWORD *)(a1 + 32));

  }
}

- (void)issueNextScanIterrationOrStopScan:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  uint8_t v13[16];

  v4 = a3;
  -[ULWiFiScanProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "decrementScanIterationsOnWiFiScanComplete");
  if (objc_msgSend(v4, "scanIterations"))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
    v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "wifi-provider, issuing next scan iteration", v13, 2u);
    }
    +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultsDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULRecordingDelayBetweenScanIterations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      objc_msgSend(v10, "floatValue");
    else
      objc_msgSend(&unk_2511ECEF8, "floatValue");
    v12 = v11;

    -[ULWiFiScanProvider startScanWithStrategyType:initialDelay:](self, "startScanWithStrategyType:initialDelay:", v4, v12);
  }
  else
  {
    -[ULWiFiScanProvider stopScanTimer](self, "stopScanTimer");
  }

}

- (void)stopScan
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  -[ULWiFiScanProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
  v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "wifi-provider, Stopping wifi scan", v9, 2u);
  }
  -[ULWiFiScanProvider internalTimer](self, "internalTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[ULWiFiScanProvider wiFiBridge](self, "wiFiBridge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopScan");

  -[ULWiFiScanProvider timer](self, "timer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[ULWiFiScanProvider delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didStopWifiRssiScanning");

  -[ULWiFiScanProvider setIsScanInProgress:](self, "setIsScanInProgress:", 0);
}

- (void)startScanTimerWithInterval:(double)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[ULWiFiScanProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
  v6 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "wifi-provider, Starting wifi scan timer with interval: %@", buf, 0xCu);

  }
  -[ULWiFiScanProvider timer](self, "timer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__ULWiFiScanProvider_startScanTimerWithInterval___block_invoke;
  v10[3] = &unk_2511D4650;
  v10[4] = self;
  +[ULTimerFactory timerOnPrimaryQueueWithInterval:repeats:block:](ULTimerFactory, "timerOnPrimaryQueueWithInterval:repeats:block:", 0, v10, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULWiFiScanProvider setTimer:](self, "setTimer:", v9);

}

void __49__ULWiFiScanProvider_startScanTimerWithInterval___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didStopWifiScanTimer");

}

- (void)stopScanTimer
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  -[ULWiFiScanProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
  v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "wifi-provider, Stopping wifi scan timer", v7, 2u);
  }
  -[ULWiFiScanProvider timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[ULWiFiScanProvider delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didStopWifiScanTimer");

}

+ (void)_protoWiFiRssiFromRawScanSingleAp:(void *)a1@<X2>
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  void *__p[2];
  char v15;
  CLMacAddress v16;
  _BYTE v17[8];
  uint64_t v18;
  int v19;
  float v20;
  unint64_t v21;
  int v22;
  int v23;

  v3 = a1;
  CLMicroLocationProto::WiFiRssi::WiFiRssi((uint64_t)v17);
  if (!CLMicroLocationProto::DataType_IsValid((CLMicroLocationProto *)1))
    __assert_rtn("set_datatype", "microlocation.pb.h", 9748, "::CLMicroLocationProto::DataType_IsValid(value)");
  v23 |= 1u;
  v19 = 1;
  v4 = objc_msgSend(v3, "RSSI");
  v23 |= 4u;
  v20 = (float)v4;
  objc_msgSend(v3, "scanTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v23 |= 2u;
  v18 = v6;

  objc_msgSend(v3, "BSSID");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  v16.var0 = CLMacAddress::newFromCLStr((uint64_t *)__p);
  v8 = CLMacAddress::toUint64(&v16);
  v23 |= 8u;
  v21 = v8;
  if (v15 < 0)
    operator delete(__p[0]);

  objc_msgSend(v3, "channel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "channelNumber");
  v23 |= 0x10u;
  v22 = v10;

  LODWORD(v9) = objc_msgSend(v3, "isRssiInvalid");
  v11 = objc_msgSend(v3, "isRssiOffChannel");
  CLMicroLocationProto::WiFiRssi::WiFiRssi(a2, (const CLMicroLocationProto::WiFiRssi *)v17);
  if ((_DWORD)v9)
    v12 = 4096;
  else
    v12 = 0;
  if (v11)
    v13 = 0x8000;
  else
    v13 = 0;
  *((_DWORD *)a2 + 12) = v13 | v12;
  CLMicroLocationProto::WiFiRssi::~WiFiRssi((CLMicroLocationProto::WiFiRssi *)v17);

}

+ (id)_filterGoodAPs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (+[ULWiFiScanProvider _isGoodAp:](ULWiFiScanProvider, "_isGoodAp:", v9, (_QWORD)v12))
          objc_msgSend(v4, "addObject:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)_isGoodAp:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isRssiInvalid") & 1) != 0
    || (objc_msgSend(v3, "isRssiOffChannel") & 1) != 0
    || (objc_msgSend(v3, "isPersonalHotSpot") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = (unint64_t)objc_msgSend(v3, "RSSI") >> 63;
  }

  return v4;
}

- (void)_createAndStartWifiBridge
{
  ULWiFiBridge *v3;
  ULWiFiBridge *v4;
  id v5;
  id v6;

  v3 = [ULWiFiBridge alloc];
  -[ULWiFiScanProvider queue](self, "queue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[ULWiFiBridge initWithDelegate:queue:](v3, "initWithDelegate:queue:", self);
  -[ULWiFiScanProvider setWiFiBridge:](self, "setWiFiBridge:", v4);

  -[ULWiFiScanProvider wiFiBridge](self, "wiFiBridge");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "start");

}

- (ULWiFiScanProviderDelegate)delegate
{
  return (ULWiFiScanProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ULWiFiBridge)wiFiBridge
{
  return self->_wiFiBridge;
}

- (void)setWiFiBridge:(id)a3
{
  objc_storeStrong((id *)&self->_wiFiBridge, a3);
}

- (BOOL)isScanInProgress
{
  return self->_isScanInProgress;
}

- (void)setIsScanInProgress:(BOOL)a3
{
  self->_isScanInProgress = a3;
}

- (ULTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (ULTimer)internalTimer
{
  return self->_internalTimer;
}

- (void)setInternalTimer:(id)a3
{
  objc_storeStrong((id *)&self->_internalTimer, a3);
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
  objc_storeStrong((id *)&self->_internalTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_wiFiBridge, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)onWifiScanResults:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  CLMicroLocationProto::WiFiRssi *v19;
  CLMicroLocationProto::WiFiRssi *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  CLMicroLocationProto::WiFiRssi *v27;
  unint64_t v28;
  _BYTE buf[12];
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  int v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[ULWiFiScanProvider queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[ULWiFiScanProvider setIsScanInProgress:](self, "setIsScanInProgress:", 0);
  -[ULWiFiScanProvider delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
    v10 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_ERROR, "wifi-provider, WiFi scan failed with error: %@", buf, 0xCu);
    }
    objc_msgSend(v9, "didReceiveWifiScanError");
  }
  else
  {
    +[ULWiFiScanProvider _filterGoodAPs:](ULWiFiScanProvider, "_filterGoodAPs:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
    v12 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v13;
      v30 = 2112;
      v31 = v14;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_2419D9000, v12, OS_LOG_TYPE_DEFAULT, "wifi-provider, On WiFi APS (Good:%@/Total:%@): %@", buf, 0x20u);

    }
    v26 = 0;
    v27 = 0;
    v28 = 0;
    std::vector<CLMiLoProtobufWrapper::WiFiRssi>::reserve(&v26, objc_msgSend(v6, "count"));
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v15);
          +[ULWiFiScanProvider _protoWiFiRssiFromRawScanSingleAp:](ULWiFiScanProvider, "_protoWiFiRssiFromRawScanSingleAp:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
          v19 = v27;
          if ((unint64_t)v27 >= v28)
          {
            v20 = (CLMicroLocationProto::WiFiRssi *)std::vector<CLMiLoProtobufWrapper::WiFiRssi>::__emplace_back_slow_path<CLMiLoProtobufWrapper::WiFiRssi>(&v26, (const CLMicroLocationProto::WiFiRssi *)buf);
          }
          else
          {
            CLMicroLocationProto::WiFiRssi::WiFiRssi(v27, (const CLMicroLocationProto::WiFiRssi *)buf);
            *((_DWORD *)v19 + 12) = v34;
            v20 = (CLMicroLocationProto::WiFiRssi *)((char *)v19 + 56);
          }
          v27 = v20;
          CLMicroLocationProto::WiFiRssi::~WiFiRssi((CLMicroLocationProto::WiFiRssi *)buf);
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didUpdateWifiAPs:withDate:", &v26, v21);

    *(_QWORD *)buf = &v26;
    std::vector<CLMiLoProtobufWrapper::WiFiRssi>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

  }
}

- (void)onInterfaceInvalidation
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[ULWiFiScanProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
  v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_ERROR, "wifi-provider, WiFi bridge invalidated", v6, 2u);
  }
  -[ULWiFiScanProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdateWiFiAssociatedState:", 0);

  -[ULWiFiScanProvider setWiFiBridge:](self, "setWiFiBridge:", 0);
}

- (void)onAssociatedStateChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULWiFiScanProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
  v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "wifi-provider, associatedState: %@", (uint8_t *)&v8, 0xCu);
  }
  -[ULWiFiScanProvider delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didUpdateWiFiAssociatedState:", v4);

}

@end
