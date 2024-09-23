@implementation CLMicroLocationLoiBridge

- (CLMicroLocationLoiBridge)initWithQueue:(id)a3
{
  id v4;
  CLMicroLocationLoiBridge *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  uint8_t v22[16];
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CLMicroLocationLoiBridge;
  v5 = -[CLMicroLocationLoiBridge init](&v23, sel_init);
  if (v5)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
    v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "#LOI Bridge, Init", v22, 2u);
    }
    -[CLMicroLocationLoiBridge setQueue:](v5, "setQueue:", v4);
    -[CLMicroLocationLoiBridge setFetchPlaceInferenceTimer:](v5, "setFetchPlaceInferenceTimer:", 0);
    v7 = objc_alloc_init(MEMORY[0x24BE27ED0]);
    -[CLMicroLocationLoiBridge setRoutineManager:](v5, "setRoutineManager:", v7);

    v8 = objc_alloc(MEMORY[0x24BDBFA88]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/System/Library/LocationBundles/Milod.bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLMicroLocationLoiBridge queue](v5, "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithEffectiveBundlePath:delegate:onQueue:", v9, v5, v10);
    -[CLMicroLocationLoiBridge setClLocationManager:](v5, "setClLocationManager:", v11);

    -[CLMicroLocationLoiBridge clLocationManager](v5, "clLocationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
      v13 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_2419D9000, v13, OS_LOG_TYPE_FAULT, "Failed to create location manager using MicroLocation bundle", v22, 2u);
      }
    }
    -[CLMicroLocationLoiBridge clLocationManager](v5, "clLocationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDesiredAccuracy:", *MEMORY[0x24BDBFB58]);

    +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "defaultsDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULEnabled");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v19 = objc_msgSend(v18, "BOOLValue");
    else
      v19 = objc_msgSend(MEMORY[0x24BDBD1C8], "BOOLValue");
    v20 = v19;

    if (v20)
      -[CLMicroLocationLoiBridge startVisitMonitoring](v5, "startVisitMonitoring");
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopMonitoringVisits");

  v4.receiver = self;
  v4.super_class = (Class)CLMicroLocationLoiBridge;
  -[CLMicroLocationLoiBridge dealloc](&v4, sel_dealloc);
}

- (void)setupRegionMonitoring
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id buf[2];

  -[CLMicroLocationLoiBridge queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[CLMicroLocationLoiBridge regionMonitorConfiguration](self, "regionMonitorConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
    v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "#LOI Bridge, setupRegionMonitoring", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    v6 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __49__CLMicroLocationLoiBridge_setupRegionMonitoring__block_invoke;
    v21[3] = &unk_2511D92C8;
    objc_copyWeak(&v22, buf);
    v7 = (void *)MEMORY[0x2426A0A38](v21);
    v16 = v6;
    v17 = 3221225472;
    v18 = __49__CLMicroLocationLoiBridge_setupRegionMonitoring__block_invoke_2;
    v19 = &unk_2511D92F0;
    objc_copyWeak(&v20, buf);
    v8 = (void *)MEMORY[0x2426A0A38](&v16);
    v9 = objc_alloc(MEMORY[0x24BDBFAB0]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULRegionMonitor", v16, v17, v18, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/var/mobile/Library/com.apple.milod/");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLMicroLocationLoiBridge queue](self, "queue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithName:path:onQueue:eventHandler:useMonitorQueueForVendingMonitor:vendingHandler:", v10, v11, v12, v8, 1, v7);
    -[CLMicroLocationLoiBridge setRegionMonitorConfiguration:](self, "setRegionMonitorConfiguration:", v13);

    -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLMicroLocationLoiBridge regionMonitorConfiguration](self, "regionMonitorConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestMonitorWithConfiguration:completion:", v15, v7);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(buf);
  }
}

void __49__CLMicroLocationLoiBridge_setupRegionMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained, "queue");
      v5 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v5);

      objc_msgSend(v4, "setRegionMonitor:", v6);
      objc_msgSend(v4, "requestBootstrapWithLastGeofenceStates");

    }
  }

}

void __49__CLMicroLocationLoiBridge_setupRegionMonitoring__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

    objc_msgSend(v7, "regionMonitor:didGenerateEvent:", v9, v5);
  }

}

- (void)setMicroLocationLoiClient:(CLMicroLocationLoiClient *)a3
{
  self->_microlocationLoiClient = a3;
}

- (CLMicroLocationLoiClient)microLocationLoiClient
{
  return self->_microlocationLoiClient;
}

- (void)requestBootstrapWithLastGeofenceStates
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  uint8_t v21[16];
  _QWORD block[4];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id buf[2];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "#LOI Bridge, Bootstrapping", (uint8_t *)buf, 2u);
  }
  -[CLMicroLocationLoiBridge regionMonitor](self, "regionMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (v5)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
    v20 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2419D9000, v20, OS_LOG_TYPE_ERROR, "#LOI Bridge, Attempted bootstraping when region monitor was not available", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    objc_initWeak(buf, self);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[CLMicroLocationLoiBridge regionMonitor](self, "regionMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "monitoredIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[CLMicroLocationLoiBridge regionMonitor](self, "regionMonitor");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v12, "monitoringRecordForIdentifier:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "lastEvent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v12) = v14 == 0;

          if ((v12 & 1) == 0)
          {
            -[CLMicroLocationLoiBridge queue](self, "queue");
            v15 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __66__CLMicroLocationLoiBridge_requestBootstrapWithLastGeofenceStates__block_invoke;
            block[3] = &unk_2511D8FA8;
            objc_copyWeak(&v24, buf);
            v23 = v13;
            dispatch_async(v15, block);

            objc_destroyWeak(&v24);
          }

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v8);
    }

    -[CLMicroLocationLoiBridge regionMonitor](self, "regionMonitor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "monitoredIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count") == 0;

    if (v18)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
      v19 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_2419D9000, v19, OS_LOG_TYPE_DEFAULT, "#LOI Bridge, No Geofences to bootstrap", v21, 2u);
      }
    }
    objc_destroyWeak(buf);
  }
}

void __66__CLMicroLocationLoiBridge_requestBootstrapWithLastGeofenceStates__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
    v3 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "lastEvent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6 = objc_msgSend(v5, "UTF8String");
      objc_msgSend(*(id *)(a1 + 32), "lastEvent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = 68289539;
      v9[1] = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2081;
      v13 = v6;
      v14 = 1025;
      v15 = objc_msgSend(v7, "state");
      _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"LOI Bridge, generating bootstrap geofence update\", \"Geofence Id\":%{private, location:escape_only}s, \"state\":%{private}d}", (uint8_t *)v9, 0x22u);

    }
    objc_msgSend(*(id *)(a1 + 32), "lastEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "generateGeofenceUpdateToClient:", v8);

  }
}

- (id)generateLocationManagerNotAvailableError
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  uint8_t v7[8];
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_ERROR, "#LOI Bridge, Attempted LOI request when location manager was not available", v7, 2u);
  }
  v3 = objc_alloc(MEMORY[0x24BDD1540]);
  v8 = *MEMORY[0x24BDD0FC8];
  v9[0] = CFSTR("Location Manager not available");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", *MEMORY[0x24BDBFB18], 2, v4);

  return v5;
}

- (id)generateRegionMonitorNotAvailableError
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  uint8_t v7[8];
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_ERROR, "#LOI Bridge, Attempted geofence request when region monitor was not available", v7, 2u);
  }
  v3 = objc_alloc(MEMORY[0x24BDD1540]);
  v8 = *MEMORY[0x24BDD0FC8];
  v9[0] = CFSTR("Routine Monitor is not active");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", *MEMORY[0x24BDBFB18], 3, v4);

  return v5;
}

- (void)generateGeofenceUpdateToClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v4 = a3;
  v5 = -[CLMicroLocationLoiBridge convertMonitoringEventToGeofenceState:](self, "convertMonitoringEventToGeofenceState:", v4);
  objc_initWeak(&location, self);
  -[CLMicroLocationLoiBridge queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__CLMicroLocationLoiBridge_generateGeofenceUpdateToClient___block_invoke;
  v8[3] = &unk_2511D9318;
  objc_copyWeak(v10, &location);
  v9 = v4;
  v10[1] = v5;
  v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __59__CLMicroLocationLoiBridge_generateGeofenceUpdateToClient___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "microLocationLoiClient");
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(*(_QWORD *)v3 + 64))(v3, v4, *(_QWORD *)(a1 + 48));

    WeakRetained = v5;
  }

}

- (unint64_t)convertMonitoringEventToGeofenceState:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "state");
  if (v3 == 1)
    return 1;
  else
    return 2 * (v3 == 2);
}

- (void)regionMonitor:(id)a3 didGenerateEvent:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[CLMicroLocationLoiBridge queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
  v7 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "identifier");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9[0] = 68289539;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2081;
    v13 = objc_msgSend(v8, "UTF8String");
    v14 = 1025;
    v15 = objc_msgSend(v5, "state");
    _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"LOI Bridge, got geofence update\", \"Geofence Id\":%{private, location:escape_only}s, \"state\":%{private}d}", (uint8_t *)v9, 0x22u);

  }
  -[CLMicroLocationLoiBridge generateGeofenceUpdateToClient:](self, "generateGeofenceUpdateToClient:", v5);

}

- (void)startVisitMonitoring
{
  NSObject *v3;
  id v4;

  -[CLMicroLocationLoiBridge queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_startLeechingVisits");

}

- (void)setupFetchPlaceInferenceTimer
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __57__CLMicroLocationLoiBridge_setupFetchPlaceInferenceTimer__block_invoke;
  v7 = &unk_2511D9340;
  objc_copyWeak(&v8, &location);
  +[ULTimerFactory timerOnPrimaryQueueWithInterval:repeats:block:](ULTimerFactory, "timerOnPrimaryQueueWithInterval:repeats:block:", 0, &v4, 5.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLMicroLocationLoiBridge setFetchPlaceInferenceTimer:](self, "setFetchPlaceInferenceTimer:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __57__CLMicroLocationLoiBridge_setupFetchPlaceInferenceTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
    v2 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"fetchPlaceInferenceAtCurrentLocation, timed out waiting for fetching place inference, this shouldn't happen\"}", buf, 0x12u);
    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
    v3 = logObject_MicroLocation_Default;
    if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
    {
      *(_DWORD *)buf = 68289026;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "fetchPlaceInferenceAtCurrentLocation, timed out waiting for fetching place inference, this shouldn't happen", "{\"msg%{public}.0s\":\"fetchPlaceInferenceAtCurrentLocation, timed out waiting for fetching place inference, this shouldn't happen\"}", buf, 0x12u);
    }
    objc_msgSend(WeakRetained, "invalidateFetchPlaceInferenceTimer");
    v4 = objc_alloc(MEMORY[0x24BDD1540]);
    v8 = *MEMORY[0x24BDD0FC8];
    v9 = CFSTR("Request to fetch place inference timed out");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", *MEMORY[0x24BDBFB18], 0, v5);

    v7 = objc_msgSend(WeakRetained, "microLocationLoiClient");
    (*(void (**)(uint64_t, _QWORD, void *))(*(_QWORD *)v7 + 8))(v7, 0, v6);

  }
}

- (void)invalidateFetchPlaceInferenceTimer
{
  void *v3;

  -[CLMicroLocationLoiBridge fetchPlaceInferenceTimer](self, "fetchPlaceInferenceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CLMicroLocationLoiBridge setFetchPlaceInferenceTimer:](self, "setFetchPlaceInferenceTimer:", 0);
}

- (void)fetchPlaceInferenceAtCurrentLocationWithPolicy:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[4];
  id v12;
  id location;

  objc_initWeak(&location, self);
  -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x24BDAC760];
  if (!v5)
  {
    -[CLMicroLocationLoiBridge queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __75__CLMicroLocationLoiBridge_fetchPlaceInferenceAtCurrentLocationWithPolicy___block_invoke;
    block[3] = &unk_2511D9340;
    objc_copyWeak(&v12, &location);
    dispatch_async(v7, block);

    objc_destroyWeak(&v12);
  }
  -[CLMicroLocationLoiBridge setupFetchPlaceInferenceTimer](self, "setupFetchPlaceInferenceTimer");
  -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __75__CLMicroLocationLoiBridge_fetchPlaceInferenceAtCurrentLocationWithPolicy___block_invoke_2;
  v9[3] = &unk_2511D9368;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "_fetchPlaceInferencesWithFidelityPolicy:handler:", a3, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __75__CLMicroLocationLoiBridge_fetchPlaceInferenceAtCurrentLocationWithPolicy___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = objc_msgSend(WeakRetained, "microLocationLoiClient");
    objc_msgSend(v4, "generateLocationManagerNotAvailableError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(*(_QWORD *)v2 + 8))(v2, 0, v3);

    WeakRetained = v4;
  }

}

void __75__CLMicroLocationLoiBridge_fetchPlaceInferenceAtCurrentLocationWithPolicy___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t buf;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    objc_msgSend(v8, "invalidateFetchPlaceInferenceTimer");
    if (v6)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
      v10 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        buf = 68289283;
        v25 = 2082;
        v26 = "";
        v27 = 2113;
        v28 = v6;
        _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"fetchPlaceInferenceAtCurrentLocation, failed to request place inference, we will start leeching and wait for next location update\", \"Error Reason\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      }
    }
    else
    {
      v18 = v8;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = v5;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v20;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
            if (onceToken_MicroLocation_Default != -1)
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
            v16 = logObject_MicroLocation_Default;
            if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
            {
              buf = 68289283;
              v25 = 2082;
              v26 = "";
              v27 = 2113;
              v28 = v15;
              _os_log_impl(&dword_2419D9000, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"fetchPlaceInferenceAtCurrentLocation, received Place Inference\", \"PI\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v12);
      }

      v6 = 0;
      v8 = v18;
    }
    v17 = objc_msgSend(v8, "microLocationLoiClient");
    (*(void (**)(uint64_t, id, id))(*(_QWORD *)v17 + 8))(v17, v5, v6);
  }

}

- (void)fetchLocationOfInterestAtLocation:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id location;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  -[CLMicroLocationLoiBridge routineManager](self, "routineManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  v7 = MEMORY[0x24BDAC760];
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x24BDD1540]);
    v23 = *MEMORY[0x24BDD0FC8];
    v24[0] = CFSTR("Routine Monitor is not active");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", *MEMORY[0x24BDBFB18], 1, v9);

    -[CLMicroLocationLoiBridge queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __62__CLMicroLocationLoiBridge_fetchLocationOfInterestAtLocation___block_invoke;
    block[3] = &unk_2511D9390;
    objc_copyWeak(&v21, &location);
    v19 = v4;
    v20 = v10;
    v12 = v10;
    dispatch_async(v11, block);

    objc_destroyWeak(&v21);
  }
  -[CLMicroLocationLoiBridge routineManager](self, "routineManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __62__CLMicroLocationLoiBridge_fetchLocationOfInterestAtLocation___block_invoke_2;
  v15[3] = &unk_2511D93E0;
  v15[4] = self;
  objc_copyWeak(&v17, &location);
  v14 = v4;
  v16 = v14;
  objc_msgSend(v13, "fetchLocationOfInterestAtLocation:withHandler:", v14, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __62__CLMicroLocationLoiBridge_fetchLocationOfInterestAtLocation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_msgSend(WeakRetained, "microLocationLoiClient");
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)v2 + 16))(v2, 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __62__CLMicroLocationLoiBridge_fetchLocationOfInterestAtLocation___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CLMicroLocationLoi *v7;
  void *v8;
  CLMicroLocationLoi *v9;
  NSObject *v10;
  id v11;
  CLMicroLocationLoi *v12;
  _QWORD v13[4];
  CLMicroLocationLoi *v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = [CLMicroLocationLoi alloc];
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CLMicroLocationLoi initWithIdentifier:andType:](v7, "initWithIdentifier:andType:", v8, objc_msgSend(v5, "type"));

  objc_msgSend(a1[4], "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__CLMicroLocationLoiBridge_fetchLocationOfInterestAtLocation___block_invoke_3;
  v13[3] = &unk_2511D93B8;
  objc_copyWeak(&v17, a1 + 6);
  v14 = v9;
  v15 = a1[5];
  v16 = v6;
  v11 = v6;
  v12 = v9;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v17);
}

void __62__CLMicroLocationLoiBridge_fetchLocationOfInterestAtLocation___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v2 = objc_msgSend(WeakRetained, "microLocationLoiClient");
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)fetchRelatedLoisForLoi:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id location;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  -[CLMicroLocationLoiBridge routineManager](self, "routineManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  v7 = MEMORY[0x24BDAC760];
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x24BDD1540]);
    v20 = *MEMORY[0x24BDD0FC8];
    v21[0] = CFSTR("Routine Monitor is not active");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", *MEMORY[0x24BDBFB18], 1, v9);

    -[CLMicroLocationLoiBridge queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __51__CLMicroLocationLoiBridge_fetchRelatedLoisForLoi___block_invoke;
    block[3] = &unk_2511D8FA8;
    objc_copyWeak(&v18, &location);
    v17 = v10;
    v12 = v10;
    dispatch_async(v11, block);

    objc_destroyWeak(&v18);
  }
  -[CLMicroLocationLoiBridge routineManager](self, "routineManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __51__CLMicroLocationLoiBridge_fetchRelatedLoisForLoi___block_invoke_2;
  v14[3] = &unk_2511D9368;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v13, "fetchDedupedLocationOfInterestIdentifiersWithIdentifier:handler:", v4, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __51__CLMicroLocationLoiBridge_fetchRelatedLoisForLoi___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_msgSend(WeakRetained, "microLocationLoiClient");
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v2 + 24))(v2, 0, *(_QWORD *)(a1 + 32));
  }

}

void __51__CLMicroLocationLoiBridge_fetchRelatedLoisForLoi___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__CLMicroLocationLoiBridge_fetchRelatedLoisForLoi___block_invoke_3;
    block[3] = &unk_2511D9390;
    objc_copyWeak(&v14, v7);
    v12 = v5;
    v13 = v6;
    dispatch_async(v10, block);

    objc_destroyWeak(&v14);
  }

}

void __51__CLMicroLocationLoiBridge_fetchRelatedLoisForLoi___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  __CFString *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = &stru_2511DC120;
    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
    v5 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "count");
      v8[0] = 68289538;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2050;
      v12 = v6;
      v13 = 2082;
      v14 = -[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
      _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"LOI Bridge, received LOI Ids from CLRoutineMonitor\", \"LOI ID Count\":%{public}ld, \"LOI List\":%{public, location:escape_only}s}", (uint8_t *)v8, 0x26u);
    }

    v7 = objc_msgSend(WeakRetained, "microLocationLoiClient");
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v7 + 24))(v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (id)retrieveAllActiveGeofences
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  CLMicroLocationGeofence *v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CLMonitor monitoredIdentifiers](self->_regionMonitor, "monitoredIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v26;
    *(_QWORD *)&v7 = 68289282;
    v24 = v7;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        -[CLMonitor monitoringRecordForIdentifier:](self->_regionMonitor, "monitoringRecordForIdentifier:", v10, v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "condition");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = objc_alloc_init(CLMicroLocationGeofence);
          -[CLMicroLocationGeofence setRegionId:](v14, "setRegionId:", v10);
          v15 = objc_alloc(MEMORY[0x24BDBFA80]);
          -[NSObject center](v13, "center");
          v17 = v16;
          -[NSObject center](v13, "center");
          v18 = (void *)objc_msgSend(v15, "initWithLatitude:longitude:", v17);
          -[CLMicroLocationGeofence setRegionCenterLocation:](v14, "setRegionCenterLocation:", v18);

          objc_msgSend(v3, "addObject:", v14);
        }
        else
        {
          if (onceToken_MicroLocation_Default != -1)
            dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
          v19 = (id)logObject_MicroLocation_Default;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
            *(_DWORD *)buf = v24;
            v30 = 0;
            v31 = 2082;
            v32 = "";
            v33 = 2082;
            v34 = v20;
            _os_log_impl(&dword_2419D9000, v19, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#LoiBridge, was unable to retrieve monitor record for valid region identifier\", \"identifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
          }

          if (onceToken_MicroLocation_Default != -1)
            dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
          v13 = (id)logObject_MicroLocation_Default;
          if (os_signpost_enabled(v13))
          {
            v21 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
            *(_DWORD *)buf = v24;
            v30 = 0;
            v31 = 2082;
            v32 = "";
            v33 = 2082;
            v34 = v21;
            _os_signpost_emit_with_name_impl(&dword_2419D9000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#LoiBridge, was unable to retrieve monitor record for valid region identifier", "{\"msg%{public}.0s\":\"#LoiBridge, was unable to retrieve monitor record for valid region identifier\", \"identifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
          }
        }

        ++v9;
      }
      while (v6 != v9);
      v4 = v5;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)getAllActiveGeofences
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  -[CLMicroLocationLoiBridge regionMonitor](self, "regionMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CLMicroLocationLoiBridge retrieveAllActiveGeofences](self, "retrieveAllActiveGeofences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
  }
  else
  {
    -[CLMicroLocationLoiBridge generateRegionMonitorNotAvailableError](self, "generateRegionMonitorNotAvailableError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_initWeak(&location, self);
  -[CLMicroLocationLoiBridge queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__CLMicroLocationLoiBridge_getAllActiveGeofences__block_invoke;
  v8[3] = &unk_2511D9390;
  objc_copyWeak(&v11, &location);
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(v5, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __49__CLMicroLocationLoiBridge_getAllActiveGeofences__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_msgSend(WeakRetained, "microLocationLoiClient");
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v2 + 48))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

- (void)removeGeofencesNearLocationWithLatitude:(double)a3 andLongitude:(double)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  CLMonitor *regionMonitor;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  double v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", a3, a4);
  if (self->_regionMonitor)
  {
    -[CLMicroLocationLoiBridge retrieveAllActiveGeofences](self, "retrieveAllActiveGeofences");
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v28;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v28 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
          v10 = objc_alloc(MEMORY[0x24BDBFA80]);
          objc_msgSend(v9, "regionCenterLocation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "coordinate");
          v13 = v12;
          objc_msgSend(v9, "regionCenterLocation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "coordinate");
          v15 = (void *)objc_msgSend(v10, "initWithLatitude:longitude:", v13);
          objc_msgSend(v5, "distanceFromLocation:", v15);
          v17 = v16;

          v18 = ULSettings::get<ULSettings::CustomLoiGeofenceRadius>();
          if (v17 <= v18 + v18)
          {
            if (onceToken_MicroLocation_Default != -1)
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
            v22 = (id)logObject_MicroLocation_Default;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v9, "regionId");
              v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v24 = objc_msgSend(v23, "UTF8String");
              *(_DWORD *)buf = 68289539;
              v32 = 0;
              v33 = 2082;
              v34 = "";
              v35 = 2081;
              v36 = v24;
              v37 = 2049;
              v38 = v17;
              _os_log_impl(&dword_2419D9000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, removing geofence because it overlap the geofence at the requested location\", \"Geofence ID\":%{private, location:escape_only}s, \"Distance Between Geofences\":\"%{private}7f\"}", buf, 0x26u);

            }
            regionMonitor = self->_regionMonitor;
            objc_msgSend(v9, "regionId");
            v19 = objc_claimAutoreleasedReturnValue();
            -[CLMonitor removeConditionFromMonitoringWithIdentifier:](regionMonitor, "removeConditionFromMonitoringWithIdentifier:", v19);
          }
          else
          {
            if (onceToken_MicroLocation_Default != -1)
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
            v19 = (id)logObject_MicroLocation_Default;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v9, "regionId");
              v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v21 = objc_msgSend(v20, "UTF8String");
              *(_DWORD *)buf = 68289539;
              v32 = 0;
              v33 = 2082;
              v34 = "";
              v35 = 2081;
              v36 = v21;
              v37 = 2049;
              v38 = v17;
              _os_log_impl(&dword_2419D9000, v19, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#LOI Bridge, geofence does not overlap the geofence at the requested location\", \"Geofence ID\":%{private, location:escape_only}s, \"Distance Between Geofences\":\"%{private}7f\"}", buf, 0x26u);

            }
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      }
      while (v6);
    }

  }
}

- (void)getCurrentLocation
{
  void *v3;
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id location[2];

  -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_initWeak(location, self);
    -[CLMicroLocationLoiBridge queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__CLMicroLocationLoiBridge_getCurrentLocation__block_invoke;
    block[3] = &unk_2511D9340;
    objc_copyWeak(&v14, location);
    dispatch_async(v4, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
  -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "desiredAccuracy");
  v7 = v6;
  v8 = *MEMORY[0x24BDBFB50];

  if (v7 == v8)
    -[CLMicroLocationLoiBridge stopLeechingLocationUpdates](self, "stopLeechingLocationUpdates");
  v9 = *MEMORY[0x24BDBFB58];
  -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDesiredAccuracy:", v9);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
  v11 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_DEFAULT, "#LOI Bridge, requesting Location", (uint8_t *)location, 2u);
  }
  -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestLocation");

}

void __46__CLMicroLocationLoiBridge_getCurrentLocation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = objc_msgSend(WeakRetained, "microLocationLoiClient");
    objc_msgSend(v4, "generateLocationManagerNotAvailableError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(*(_QWORD *)v2 + 32))(v2, 0, v3);

    WeakRetained = v4;
  }

}

- (void)setGeofenceAtLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  double v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  char *v18;
  size_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30[3];
  id buf;
  __int16 v32;
  const char *v33;
  __int16 v34;
  double v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
  v7 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "coordinate");
    v9 = v8;
    objc_msgSend(v4, "coordinate");
    buf = (id)68289539;
    v32 = 2082;
    v33 = "";
    v34 = 2049;
    v35 = v9;
    v36 = 2049;
    v37 = v10;
    _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"LOI Bridge, requested geofence at location\", \"latitude\":\"%{private}7f\", \"longitude\":\"%{private}7f\"}", (uint8_t *)&buf, 0x26u);
  }

  -[CLMicroLocationLoiBridge regionMonitor](self, "regionMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    -[CLMicroLocationLoiBridge generateRegionMonitorNotAvailableError](self, "generateRegionMonitorNotAvailableError");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v22 = 0;
  }
  else
  {
    v13 = ULSettings::get<ULSettings::CustomLoiGeofenceRadius>();
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
    v14 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      buf = (id)68289283;
      v32 = 2082;
      v33 = "";
      v34 = 2049;
      v35 = v13;
      _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, setting geofence for custom LOI\", \"Custom LOI Geofence radius\":\"%{private}7f\"}", (uint8_t *)&buf, 0x1Cu);
    }
    v15 = objc_alloc(MEMORY[0x24BDBFA48]);
    objc_msgSend(v4, "coordinate");
    v16 = (void *)objc_msgSend(v15, "initWithCenter:radius:");
    -[CLMicroLocationLoiBridge regionMonitor](self, "regionMonitor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addConditionForMonitoring:identifier:", v16, v6);

    v18 = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v19 = strlen(v18);
    v20 = (void *)boost::uuids::string_generator::operator()<char const*>((boost::uuids::string_generator *)&buf, (unsigned __int8 *)v18, (unsigned __int8 *)&v18[v19]);
    v22 = v21;

    v23 = 0;
  }
  objc_initWeak(&buf, self);
  -[CLMicroLocationLoiBridge queue](self, "queue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__CLMicroLocationLoiBridge_setGeofenceAtLocation___block_invoke;
  block[3] = &unk_2511D9408;
  objc_copyWeak(v30, &buf);
  v30[1] = v20;
  v30[2] = v22;
  v28 = v4;
  v29 = v23;
  v25 = v23;
  v26 = v4;
  dispatch_async(v24, block);

  objc_destroyWeak(v30);
  objc_destroyWeak(&buf);

}

void __50__CLMicroLocationLoiBridge_setGeofenceAtLocation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_msgSend(WeakRetained, "microLocationLoiClient");
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)v2 + 56))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  }

}

- (void)removeGeofenceWithRegionId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  -[CLMicroLocationLoiBridge regionMonitor](self, "regionMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CLMicroLocationLoiBridge regionMonitor](self, "regionMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeConditionFromMonitoringWithIdentifier:", v4);

    v7 = 0;
  }
  else
  {
    -[CLMicroLocationLoiBridge generateRegionMonitorNotAvailableError](self, "generateRegionMonitorNotAvailableError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_initWeak(&location, self);
  -[CLMicroLocationLoiBridge queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__CLMicroLocationLoiBridge_removeGeofenceWithRegionId___block_invoke;
  v11[3] = &unk_2511D9390;
  objc_copyWeak(&v14, &location);
  v12 = v4;
  v13 = v7;
  v9 = v7;
  v10 = v4;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__CLMicroLocationLoiBridge_removeGeofenceWithRegionId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_msgSend(WeakRetained, "microLocationLoiClient");
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v2 + 72))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

- (void)startLeechingLocationUpdates
{
  void *v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "desiredAccuracy");
  v5 = v4;
  v6 = *MEMORY[0x24BDBFB50];

  if (v5 != v6)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
    v7 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 68289026;
      v10[1] = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, Starting to leech location updates\"}", (uint8_t *)v10, 0x12u);
    }
    -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDesiredAccuracy:", v6);

    -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startUpdatingLocation");

  }
}

- (void)stopLeechingLocationUpdates
{
  void *v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "desiredAccuracy");
  v5 = v4;
  v6 = *MEMORY[0x24BDBFB50];

  if (v5 == v6)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
    v7 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289026;
      v9[1] = 0;
      v10 = 2082;
      v11 = "";
      _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, Stopping leech location updates\"}", (uint8_t *)v9, 0x12u);
    }
    -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopUpdatingLocation");

  }
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id buf;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[CLMicroLocationLoiBridge queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (v5)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
    v7 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v5, "hasDepartureDate");
      v9 = "Entry";
      buf = (id)68289282;
      v16 = 2082;
      v17 = "";
      if (v8)
        v9 = "Exit";
      v18 = 2082;
      v19 = v9;
      _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, Got Visit Notification\", \"Visit:\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
    }

    objc_initWeak(&buf, self);
    -[CLMicroLocationLoiBridge queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__CLMicroLocationLoiBridge_locationManager_didVisit___block_invoke;
    v12[3] = &unk_2511D8FA8;
    objc_copyWeak(&v14, &buf);
    v13 = v5;
    dispatch_async(v10, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&buf);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
    v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_DEFAULT, "LOI Bridge, Received nil visit notification", (uint8_t *)&buf, 2u);
    }
  }

}

void __53__CLMicroLocationLoiBridge_locationManager_didVisit___block_invoke(uint64_t a1)
{
  void (***v2)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = (void (***)(_QWORD, _QWORD))objc_msgSend(WeakRetained, "microLocationLoiClient");
    (**v2)(v2, *(_QWORD *)(a1 + 32));
  }

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  double *v9;
  void *v10;
  double v11;
  const char *v12;
  void *v13;
  double v14;
  const char *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  id buf;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[CLMicroLocationLoiBridge queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
  v7 = (id)logObject_MicroLocation_Default;
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  v9 = (double *)MEMORY[0x24BDBFB58];
  if (v8)
  {
    -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "desiredAccuracy");
    if (v11 == *v9)
      v12 = "YES";
    else
      v12 = "NO";
    -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "desiredAccuracy");
    if (v14 == *MEMORY[0x24BDBFB50])
      v15 = "YES";
    else
      v15 = "NO";
    buf = (id)68289538;
    v38 = 2082;
    v39 = "";
    v40 = 2082;
    v41 = v12;
    v42 = 2082;
    v43 = v15;
    _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, Got Location Update\", \"Waiting on location: \":%{public, location:escape_only}s, \"Leeching location: \":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);

  }
  if (v5 && objc_msgSend(v5, "count"))
  {
    v16 = 0;
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = objc_alloc(MEMORY[0x24BDD1540]);
    v35 = *MEMORY[0x24BDD0FC8];
    v36 = CFSTR("Failed to get current Location");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", *MEMORY[0x24BDBFB18], 5, v19);

    v17 = 0;
  }
  -[CLMicroLocationLoiBridge clLocationManager](self, "clLocationManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "desiredAccuracy");
  if (v21 != *v9)
    goto LABEL_18;
  objc_msgSend(v17, "horizontalAccuracy");
  v23 = v22 > ULSettings::get<ULSettings::CustomLoiGeofenceRadius>();

  if (v23)
  {

    v24 = objc_alloc(MEMORY[0x24BDD1540]);
    v33 = *MEMORY[0x24BDD0FC8];
    v34 = CFSTR("Failed to get current Location");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "initWithDomain:code:userInfo:", *MEMORY[0x24BDBFB18], 5, v20);

    v17 = 0;
    v16 = (void *)v25;
LABEL_18:

  }
  objc_initWeak(&buf, self);
  -[CLMicroLocationLoiBridge queue](self, "queue");
  v26 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__CLMicroLocationLoiBridge_locationManager_didUpdateLocations___block_invoke;
  block[3] = &unk_2511D9390;
  objc_copyWeak(&v32, &buf);
  v30 = v17;
  v31 = v16;
  v27 = v16;
  v28 = v17;
  dispatch_async(v26, block);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&buf);

}

void __63__CLMicroLocationLoiBridge_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_msgSend(WeakRetained, "microLocationLoiClient");
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v2 + 32))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_77);
  v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, didFailWithError\", \"error:\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CLLocationManager)clLocationManager
{
  return self->_clLocationManager;
}

- (void)setClLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_clLocationManager, a3);
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineManager, a3);
}

- (CLMonitor)regionMonitor
{
  return self->_regionMonitor;
}

- (void)setRegionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_regionMonitor, a3);
}

- (CLMonitorConfiguration)regionMonitorConfiguration
{
  return self->_regionMonitorConfiguration;
}

- (void)setRegionMonitorConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_regionMonitorConfiguration, a3);
}

- (ULTimer)fetchPlaceInferenceTimer
{
  return self->_fetchPlaceInferenceTimer;
}

- (void)setFetchPlaceInferenceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_fetchPlaceInferenceTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionMonitor, 0);
  objc_storeStrong((id *)&self->_regionMonitorConfiguration, 0);
  objc_storeStrong((id *)&self->_fetchPlaceInferenceTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_clLocationManager, 0);
}

@end
