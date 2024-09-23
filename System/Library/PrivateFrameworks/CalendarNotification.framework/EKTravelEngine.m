@implementation EKTravelEngine

- (void)handleDarwinNotification:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE13D58]))
  {
    -[EKTravelEngine _calDatabaseChangedNotificationReceived](self, "_calDatabaseChangedNotificationReceived");
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE13EB8]))
  {
    -[EKTravelEngine _calSyncClientBeginningMultiSaveNotificationReceived](self, "_calSyncClientBeginningMultiSaveNotificationReceived");
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE13EC0]))
  {
    -[EKTravelEngine _calSyncClientFinishedMultiSaveNotificationReceived](self, "_calSyncClientFinishedMultiSaveNotificationReceived");
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE128E0]))
  {
    -[EKTravelEngine _enableTravelAdvisoriesForAutomaticBehaviorNotificationReceived](self, "_enableTravelAdvisoriesForAutomaticBehaviorNotificationReceived");
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE14080]))
  {
    -[EKTravelEngine _significantTimeChangeNotificationReceived](self, "_significantTimeChangeNotificationReceived");
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDC7440]))
  {
    -[EKTravelEngine _eventKitFeatureSetChanged](self, "_eventKitFeatureSetChanged");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC74C8], "stateChangedNotificationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", v4);

    if (v5)
    {
      -[EKTravelEngine _updateDatabaseEncryptionState](self, "_updateDatabaseEncryptionState");
    }
    else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE128F8]))
    {
      -[EKTravelEngine _suggestEventLocationsSettingChanged](self, "_suggestEventLocationsSettingChanged");
    }
  }

}

+ (id)requestedDarwinNotifications
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[10];

  v6[9] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC74C8], "stateChangedNotificationName", CFSTR("com.apple.navd.wakeUpForHypothesisUpdate"), *MEMORY[0x24BE13D58], *MEMORY[0x24BE13EB8], *MEMORY[0x24BE13EC0], *MEMORY[0x24BE128E0], *MEMORY[0x24BE14080], *MEMORY[0x24BDC7440]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE128F8];
  v6[7] = v2;
  v6[8] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (double)requestRefreshTimeInterval
{
  return 60.0;
}

- (EKTravelEngine)initWithRouteHypothesizerProvider:(id)a3
{
  id v5;
  EKTravelEngine *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  id v12;
  const char *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *callbackQueue;
  NSMutableDictionary *v17;
  NSMutableDictionary *eventExternalURLsToAgendaEntries;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  EKTravelEngine *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EKTravelEngine;
  v6 = -[EKTravelEngine init](&v21, sel_init);
  if (v6)
  {
    EKTravelEngineLogInitialize();
    objc_storeStrong((id *)&v6->_routeHypothesizerProvider, a3);
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v8, v9);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v10;

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v13, v14);
    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v15;

    v6->_databaseIsEncryptedAndUnreadable = !-[EKTravelEngine _isProtectedDataAvailable](v6, "_isProtectedDataAvailable");
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    eventExternalURLsToAgendaEntries = v6->_eventExternalURLsToAgendaEntries;
    v6->_eventExternalURLsToAgendaEntries = v17;

    v19 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_215D9B000, v19, OS_LOG_TYPE_DEFAULT, "Travel engine initialized: [%@]", buf, 0xCu);
    }
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_running)
    -[EKTravelEngine _stopInternal](self, "_stopInternal");
  v3.receiver = self;
  v3.super_class = (Class)EKTravelEngine;
  -[EKTravelEngine dealloc](&v3, sel_dealloc);
}

- (void)start
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__EKTravelEngine_start__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

void __23__EKTravelEngine_start__block_invoke(uint64_t a1)
{
  int v2;
  os_log_t *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = (os_log_t *)MEMORY[0x24BDC7450];
  v4 = *MEMORY[0x24BDC7450];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "The travel engine is already running.  Will not start engine: [%@]", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Travel engine preparing to start: [%@]", (uint8_t *)&v10, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) = objc_msgSend(*(id *)(a1 + 32), "_isProtectedDataAvailable") ^ 1;
    objc_msgSend(*(id *)(a1 + 32), "_installPeriodicRefreshTimer");
    objc_msgSend(*(id *)(a1 + 32), "_installLocationManager");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 35) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
    v8 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Travel engine started: [%@]", (uint8_t *)&v10, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_refreshIfNeeded");
  }
}

- (void)stop
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __22__EKTravelEngine_stop__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

void __22__EKTravelEngine_stop__block_invoke(uint64_t a1)
{
  int v2;
  os_log_t *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = (os_log_t *)MEMORY[0x24BDC7450];
  v4 = *MEMORY[0x24BDC7450];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (!v5)
      return;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v9;
    v8 = "The travel engine is not running.  Will not stop engine: [%@]";
    goto LABEL_8;
  }
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "The travel engine is preparing to stop: [%@]", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_stopInternal");
  objc_msgSend(*(id *)(a1 + 32), "_uninstallLocationManager");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  v4 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v7;
    v8 = "Travel engine stopped: [%@]";
LABEL_8:
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
  }
}

- (void)_stopInternal
{
  -[EKTravelEngine _unregisterAllAgendaEntries](self, "_unregisterAllAgendaEntries");
  -[EKTravelEngine _uninstallSyncYieldTimer](self, "_uninstallSyncYieldTimer");
  -[EKTravelEngine _uninstallPeriodicRefreshTimer](self, "_uninstallPeriodicRefreshTimer");
}

- (void)requestHypothesisRefreshAtDate:(id)a3 forEventWithExternalURL:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  EKTravelEngine *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__EKTravelEngine_requestHypothesisRefreshAtDate_forEventWithExternalURL___block_invoke;
    block[3] = &unk_24D484800;
    v11 = v6;
    v12 = v7;
    v13 = self;
    dispatch_sync(workQueue, block);

  }
  else
  {
    v9 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "nil 'externalURL' given. Will not request hypothesis refresh at date: [%@] for any events.", buf, 0xCu);
    }
  }

}

void __73__EKTravelEngine_requestHypothesisRefreshAtDate_forEventWithExternalURL___block_invoke(_QWORD *a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (NSObject **)MEMORY[0x24BDC7450];
  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    v5 = a1[5];
    v11 = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Requesting hypothesis refresh at date: [%@] for event that has external URL: [%@]", (uint8_t *)&v11, 0x16u);
  }
  objc_msgSend(*(id *)(a1[6] + 40), "objectForKey:", a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "requestHypothesisRefreshAtDate:", a1[4]);
  }
  else
  {
    v8 = *v2;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[4];
      v10 = a1[5];
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Will not request hypothesis refresh at date: [%@] for event that has external URL: [%@] because is isn't being monitored", (uint8_t *)&v11, 0x16u);
    }
  }

}

- (void)cancelHypothesisRefreshRequestForEventWithExternalURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *workQueue;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  EKTravelEngine *v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __72__EKTravelEngine_cancelHypothesisRefreshRequestForEventWithExternalURL___block_invoke;
    v8[3] = &unk_24D484760;
    v9 = v4;
    v10 = self;
    dispatch_sync(workQueue, v8);

  }
  else
  {
    v7 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "nil 'externalURL' given. Will not cancel a hypothesis refresh request for any events.", buf, 2u);
    }
  }

}

void __72__EKTravelEngine_cancelHypothesisRefreshRequestForEventWithExternalURL___block_invoke(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (NSObject **)MEMORY[0x24BDC7450];
  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Canceling hypothesis refresh request for event that has external URL: [%@]", (uint8_t *)&v9, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "cancelHypothesisRefreshRequest");
  }
  else
  {
    v7 = *v2;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "Will not cancel refresh request for event that has external URL: [%@] because it isn't being monitored.", (uint8_t *)&v9, 0xCu);
    }
  }

}

- (void)ceaseMonitoringForEventWithExternalURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *workQueue;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  EKTravelEngine *v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __57__EKTravelEngine_ceaseMonitoringForEventWithExternalURL___block_invoke;
    v8[3] = &unk_24D484760;
    v9 = v4;
    v10 = self;
    dispatch_sync(workQueue, v8);

  }
  else
  {
    v7 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "nil 'externalURL' given.  Will not cease monitoring for any events.", buf, 2u);
    }
  }

}

void __57__EKTravelEngine_ceaseMonitoringForEventWithExternalURL___block_invoke(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (NSObject **)MEMORY[0x24BDC7450];
  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Ceasing monitoring for event that has external URL: [%@]", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDC74D0], "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "preventMarkingTravelAdvisoryEntriesAsDismissed");

    if ((v7 & 1) == 0)
      objc_msgSend(v5, "setDismissed:", 1);
    objc_msgSend(v5, "reset");
  }
  else
  {
    v8 = *v2;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Will not cease monitoring for event that has external URL: [%@] because it isn't being monitored.", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)receivedAlarmNamed:(id)a3
{
  id v4;
  char v5;
  os_log_t *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *workQueue;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  _QWORD v20[6];
  _QWORD block[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.calaccessd.travelEngine."));
  v6 = (os_log_t *)MEMORY[0x24BDC7460];
  v7 = *MEMORY[0x24BDC7460];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "EKTravelEngine received alarm named: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    -[EKTravelEngine alarmName](self, "alarmName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "isEqualToString:", v9);

    if (v10)
    {
      *((_BYTE *)v23 + 24) = 1;
      v11 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "EKTravelEngine received periodic refresh alarm", (uint8_t *)&buf, 2u);
      }
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __37__EKTravelEngine_receivedAlarmNamed___block_invoke;
      block[3] = &unk_24D484738;
      block[4] = self;
      dispatch_sync(workQueue, block);
    }
    else
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__4;
      v29 = __Block_byref_object_dispose__4;
      v30 = 0;
      v13 = self->_workQueue;
      v14 = MEMORY[0x24BDAC760];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __37__EKTravelEngine_receivedAlarmNamed___block_invoke_15;
      v20[3] = &unk_24D484A08;
      v20[4] = self;
      v20[5] = &buf;
      dispatch_sync(v13, v20);
      v15 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      v17[0] = v14;
      v17[1] = 3221225472;
      v17[2] = __37__EKTravelEngine_receivedAlarmNamed___block_invoke_2;
      v17[3] = &unk_24D484C50;
      v19 = &v22;
      v18 = v4;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", v17);

      _Block_object_dispose(&buf, 8);
    }
    if (!*((_BYTE *)v23 + 24))
    {
      v16 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_215D9B000, v16, OS_LOG_TYPE_DEFAULT, "Uninstalling unrecognized alarm for travel engine", (uint8_t *)&buf, 2u);
      }
      objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      xpc_set_event();
    }
    _Block_object_dispose(&v22, 8);
  }
  else if (v8)
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "EKTravelEngine skipping the alarm named: %{public}@. It may be an alarm from another place like EKAlarmEngine.", (uint8_t *)&buf, 0xCu);
  }

}

uint64_t __37__EKTravelEngine_receivedAlarmNamed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_periodicRefreshTimerFired");
}

void __37__EKTravelEngine_receivedAlarmNamed___block_invoke_15(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __37__EKTravelEngine_receivedAlarmNamed___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v7;
  else
    v3 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(v5, "receivedAlarmNamed:", v4);
  objc_msgSend(v5, "throttle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(v6, "receivedAlarmNamed:", *(_QWORD *)(a1 + 32));
}

+ (id)travelEligibleEventsInEventStore:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "CalSimulatedDateForNow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_travelAgendaTimeWindowInterval");
  objc_msgSend(v6, "dateByAddingTimeInterval:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "travelEligibleEvents:fromStartDate:untilEndDate:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)travelEligibleEvents:(id)a3 fromStartDate:(id)a4 untilEndDate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v22 = a4;
  v8 = a5;
  objc_msgSend(v7, "calendarsForEntityType:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v16, "isIgnoringEventAlerts") & 1) == 0)
        {
          objc_msgSend(v16, "source");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isDelegate");

          if ((v18 & 1) == 0)
            objc_msgSend(v10, "addObject:", v16);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v13);
  }

  v19 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v22;
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_215D9B000, v19, OS_LOG_TYPE_DEFAULT, "Will search for travel agenda candidates between [%@] and [%@].  Calendars to search: [%@]", buf, 0x20u);
  }
  objc_msgSend(v7, "travelEligibleEventsInCalendars:startDate:endDate:", v10, v22, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)authorized
{
  NSObject *workQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__EKTravelEngine_authorized__block_invoke;
  v5[3] = &unk_24D484A08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__EKTravelEngine_authorized__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "authorizedInternal");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)sendFeedbackForPostingLeaveByNotificationForEventWithExternalURL:(id)a3
{
  -[EKTravelEngine _sendFeedbackForPostingNotificationForEventWithExternalURL:feedback:](self, "_sendFeedbackForPostingNotificationForEventWithExternalURL:feedback:", a3, &__block_literal_global_15);
}

uint64_t __83__EKTravelEngine_sendFeedbackForPostingLeaveByNotificationForEventWithExternalURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendFeedbackForPostingLeaveByNotification");
}

- (void)sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL:(id)a3
{
  -[EKTravelEngine _sendFeedbackForPostingNotificationForEventWithExternalURL:feedback:](self, "_sendFeedbackForPostingNotificationForEventWithExternalURL:feedback:", a3, &__block_literal_global_21);
}

uint64_t __84__EKTravelEngine_sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendFeedbackForPostingLeaveNowNotification");
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  os_log_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *callbackQueue;
  _QWORD block[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "authorizationStatus");
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = (os_log_t *)MEMORY[0x24BDC7450];
  v6 = (void *)*MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x24BDC7568];
    v8 = v6;
    objc_msgSend(v7, "authorizationStatusAsString:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v9;
    _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Location authorization status changed to [%@]", buf, 0xCu);

  }
  v10 = -[EKTravelEngine isLocationManagerStatusAuthorized:](self, "isLocationManagerStatusAuthorized:", v4);
  if (v10)
  {
    -[EKTravelEngine _refreshIfNeeded](self, "_refreshIfNeeded");
  }
  else if ((v4 - 1) <= 1)
  {
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.calendar.LocationAuthDenied"), 0, 0, 1);

    -[EKTravelEngine _unregisterAllAgendaEntries](self, "_unregisterAllAgendaEntries");
    self->_needsRefresh = 1;
  }
  if (v10 != -[EKTravelEngine authorizedInternal](self, "authorizedInternal"))
  {
    -[EKTravelEngine setAuthorizedInternal:](self, "setAuthorizedInternal:", v10);
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)MEMORY[0x24BDD16E0];
      v14 = v12;
      objc_msgSend(v13, "numberWithBool:", -[EKTravelEngine authorizedInternal](self, "authorizedInternal"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v15;
      _os_log_impl(&dword_215D9B000, v14, OS_LOG_TYPE_DEFAULT, "The location authorization state has changed.  self.authorizedInternal: [%@]", buf, 0xCu);

    }
    -[EKTravelEngine authorizationChangedBlock](self, "authorizationChangedBlock");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __56__EKTravelEngine_locationManagerDidChangeAuthorization___block_invoke;
      block[3] = &unk_24D484CD8;
      v20 = v16;
      dispatch_async(callbackQueue, block);

    }
  }
}

uint64_t __56__EKTravelEngine_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_calDatabaseChangedNotificationReceived
{
  NSObject *v3;
  uint64_t v4;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *MEMORY[0x24BE13D58];
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Received notification: [%@].", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__EKTravelEngine__calDatabaseChangedNotificationReceived__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __57__EKTravelEngine__calDatabaseChangedNotificationReceived__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_refreshIfNeeded");
}

- (void)_eventKitFeatureSetChanged
{
  NSObject *v3;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "The state EventKit feature set was changed", buf, 2u);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__EKTravelEngine__eventKitFeatureSetChanged__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __44__EKTravelEngine__eventKitFeatureSetChanged__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_refreshIfNeeded");
}

- (void)_suggestEventLocationsSettingChanged
{
  NSObject *v3;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "The state of SuggestEventLocations was changed", buf, 2u);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__EKTravelEngine__suggestEventLocationsSettingChanged__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __54__EKTravelEngine__suggestEventLocationsSettingChanged__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_refreshIfNeeded");
}

- (void)_calSyncClientBeginningMultiSaveNotificationReceived
{
  NSObject *v3;
  uint64_t v4;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *MEMORY[0x24BE13EB8];
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Received notification: [%@].", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__EKTravelEngine__calSyncClientBeginningMultiSaveNotificationReceived__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __70__EKTravelEngine__calSyncClientBeginningMultiSaveNotificationReceived__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 35))
  {
    v2 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_215D9B000, v2, OS_LOG_TYPE_DEFAULT, "The travel engine is yielding to sync already.  Ignoring notification.", v3, 2u);
    }
  }
  else
  {
    *(_BYTE *)(v1 + 35) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_installSyncYieldTimer");
  }
}

- (void)_calSyncClientFinishedMultiSaveNotificationReceived
{
  NSObject *v3;
  uint64_t v4;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *MEMORY[0x24BE13EC0];
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Received notification: [%@].", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__EKTravelEngine__calSyncClientFinishedMultiSaveNotificationReceived__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __69__EKTravelEngine__calSyncClientFinishedMultiSaveNotificationReceived__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint8_t v4[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 35))
  {
    *(_BYTE *)(v1 + 35) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_uninstallSyncYieldTimer");
    objc_msgSend(*(id *)(a1 + 32), "_refreshIfNeeded");
  }
  else
  {
    v3 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "The travel engine is not currently yielding to sync.  Ignoring notification.", v4, 2u);
    }
  }
}

- (void)_enableTravelAdvisoriesForAutomaticBehaviorNotificationReceived
{
  NSObject *v3;
  uint64_t v4;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *MEMORY[0x24BE128E0];
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Received notification: [%@].", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__EKTravelEngine__enableTravelAdvisoriesForAutomaticBehaviorNotificationReceived__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __81__EKTravelEngine__enableTravelAdvisoriesForAutomaticBehaviorNotificationReceived__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_refreshIfNeeded");
}

- (void)_significantTimeChangeNotificationReceived
{
  NSObject *v3;
  uint64_t v4;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *MEMORY[0x24BE14080];
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Received notification: [%@].", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__EKTravelEngine__significantTimeChangeNotificationReceived__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __60__EKTravelEngine__significantTimeChangeNotificationReceived__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBeforeDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v4 = *MEMORY[0x24BDC7450];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      v8 = 138543618;
      v9 = v2;
      v10 = 2114;
      v11 = v6;
      _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Refreshing in response to significant time changed notification as the current time (%{public}@) is before the last time we refreshed (%{public}@)", (uint8_t *)&v8, 0x16u);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_refreshIfNeeded");
  }
  else if (v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v8 = 138543618;
    v9 = v2;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "NOT refreshing in response to significant time changed notification as the current time (%{public}@) is after the last time we refreshed (%{public}@)", (uint8_t *)&v8, 0x16u);
  }

}

- (void)_updateDatabaseEncryptionState
{
  NSObject *v3;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Updating database encryption state.", buf, 2u);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__EKTravelEngine__updateDatabaseEncryptionState__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_async(workQueue, block);
}

_BYTE *__48__EKTravelEngine__updateDatabaseEncryptionState__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[34])
  {
    result = (_BYTE *)objc_msgSend(result, "_isProtectedDataAvailable");
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) = 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
      return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_refreshIfNeeded");
    }
  }
  return result;
}

- (BOOL)isLocationManagerStatusAuthorized:(int)a3
{
  return a3 == 3;
}

- (BOOL)_isProtectedDataAvailable
{
  id v2;
  char v3;

  v2 = objc_alloc_init(MEMORY[0x24BDC74C8]);
  v3 = objc_msgSend(v2, "dataIsAccessible");

  return v3;
}

- (void)_installSyncYieldTimer
{
  os_log_t *v3;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *syncYieldTimer;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  EKTravelEngine *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BDC7450];
  v4 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = (uint64_t)self;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Installing sync yield timer for travel engine: [%@].", buf, 0xCu);
  }
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_workQueue);
  syncYieldTimer = self->_syncYieldTimer;
  self->_syncYieldTimer = v5;

  v7 = dispatch_time(0, 240000000000);
  dispatch_source_set_timer((dispatch_source_t)self->_syncYieldTimer, v7, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
  v8 = self->_syncYieldTimer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __40__EKTravelEngine__installSyncYieldTimer__block_invoke;
  handler[3] = &unk_24D484738;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v12 = 240;
    v13 = 2112;
    v14 = self;
    _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Installed sync yield timer with [%ld] second length for travel engine: [%@].", buf, 0x16u);
  }
  dispatch_resume((dispatch_object_t)self->_syncYieldTimer);
}

uint64_t __40__EKTravelEngine__installSyncYieldTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_ERROR))
    __40__EKTravelEngine__installSyncYieldTimer__block_invoke_cold_1(v2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 35) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_refreshIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_uninstallSyncYieldTimer");
}

- (void)_uninstallSyncYieldTimer
{
  NSObject *v3;
  OS_dispatch_source *syncYieldTimer;
  int v5;
  EKTravelEngine *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (self->_syncYieldTimer)
  {
    v3 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Uninstalling sync yield timer for travel engine: [%@].", (uint8_t *)&v5, 0xCu);
    }
    dispatch_source_cancel((dispatch_source_t)self->_syncYieldTimer);
    syncYieldTimer = self->_syncYieldTimer;
    self->_syncYieldTimer = 0;

  }
}

+ (double)_travelAgendaTimeWindowInterval
{
  double v2;

  +[EKTravelEngineAgendaEntry fuzzyMaximumInitialUpdateIntervalBeforeStartDate](EKTravelEngineAgendaEntry, "fuzzyMaximumInitialUpdateIntervalBeforeStartDate");
  return fmax(v2 * 1.5, 43200.0);
}

+ (double)_periodicRefreshInterval
{
  double v2;
  double v3;
  double v4;

  +[EKTravelEngineAgendaEntry fuzzyMaximumInitialUpdateIntervalBeforeStartDate](EKTravelEngineAgendaEntry, "fuzzyMaximumInitialUpdateIntervalBeforeStartDate");
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "_travelAgendaTimeWindowInterval");
  return v4 - v3 + -120.0;
}

- (id)alarmName
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.calaccessd.travelEngine."), CFSTR("periodicRefreshTimer"));
}

- (void)_installPeriodicRefreshTimer
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int64_t v11;
  xpc_object_t v12;
  id v13;
  int v14;
  EKTravelEngine *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "_periodicRefreshInterval");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)*MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithDouble:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = self;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Installing a periodic refresh timer for travel engine: [%@].  Timer interval: [%@].  Estimated fire date (based on system time): [%@].", (uint8_t *)&v14, 0x20u);

  }
  v11 = (unint64_t)((ceil(v4) + (double)time(0)) * 1000000000.0);
  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_date(v12, (const char *)*MEMORY[0x24BE14018], v11);
  -[EKTravelEngine alarmName](self, "alarmName");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "UTF8String");
  xpc_set_event();

}

- (void)_uninstallPeriodicRefreshTimer
{
  NSObject *v3;
  id v4;
  int v5;
  EKTravelEngine *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Uninstalling the periodic refresh timer for travel engine: [%@].", (uint8_t *)&v5, 0xCu);
  }
  -[EKTravelEngine alarmName](self, "alarmName");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  xpc_set_event();

}

- (void)_trimAgendaEntriesBeforeDate:(id)a3 andAfterDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *eventExternalURLsToAgendaEntries;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Trimming entries before [%@] and after [%@].", buf, 0x16u);
  }
  eventExternalURLsToAgendaEntries = self->_eventExternalURLsToAgendaEntries;
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __60__EKTravelEngine__trimAgendaEntriesBeforeDate_andAfterDate___block_invoke;
  v16[3] = &unk_24D484D00;
  v17 = v6;
  v18 = v7;
  v11 = v7;
  v12 = v6;
  -[NSMutableDictionary keysOfEntriesPassingTest:](eventExternalURLsToAgendaEntries, "keysOfEntriesPassingTest:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __60__EKTravelEngine__trimAgendaEntriesBeforeDate_andAfterDate___block_invoke_33;
  v15[3] = &unk_24D484D28;
  v15[4] = self;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](self->_eventExternalURLsToAgendaEntries, "removeObjectsForKeys:", v14);

}

uint64_t __60__EKTravelEngine__trimAgendaEntriesBeforeDate_andAfterDate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "originalEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "originalEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "CalIsBeforeOrSameAsDate:", *(_QWORD *)(a1 + 32)))
  {
    v9 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v4;
      v10 = "Removing travel agenda entry that ends before the time window: [%@]";
LABEL_7:
      _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (!objc_msgSend(v6, "CalIsAfterDate:", *(_QWORD *)(a1 + 40)))
    {
      v11 = 0;
      goto LABEL_10;
    }
    v9 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v4;
      v10 = "Removing travel agenda entry that starts after the time window: [%@]";
      goto LABEL_7;
    }
  }
  v11 = 1;
LABEL_10:

  return v11;
}

void __60__EKTravelEngine__trimAgendaEntriesBeforeDate_andAfterDate___block_invoke_33(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (BOOL)_authorizedToAcquireLocation
{
  void *v2;
  int v3;
  uint64_t v4;
  int v5;
  char v6;
  char v7;
  char v9;
  char v10;

  objc_msgSend(MEMORY[0x24BE13FC8], "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(MEMORY[0x24BE13FC0], "authorizationStatusForBundle:", v2);
  v4 = *MEMORY[0x24BE14020];
  v5 = objc_msgSend(MEMORY[0x24BE13FC0], "authorizationStatusForBundleIdentifier:", *MEMORY[0x24BE14020]);
  v6 = objc_msgSend(MEMORY[0x24BE13FC0], "preciseLocationAuthorizedForBundle:", v2);
  v7 = objc_msgSend(MEMORY[0x24BE13FC0], "preciseLocationAuthorizedForBundleIdentifier:", v4);
  if (v3 != 3 || v5 <= 2)
    v9 = 0;
  else
    v9 = v6;
  v10 = v9 & v7;

  return v10;
}

- (id)_eventStore
{
  EKTimedEventStorePurger *timedEventStorePurger;
  EKTimedEventStorePurger *v4;
  EKTimedEventStorePurger *v5;

  timedEventStorePurger = self->_timedEventStorePurger;
  if (!timedEventStorePurger)
  {
    v4 = (EKTimedEventStorePurger *)objc_alloc_init(MEMORY[0x24BDC7550]);
    v5 = self->_timedEventStorePurger;
    self->_timedEventStorePurger = v4;

    -[EKTimedEventStorePurger setTimeout:](self->_timedEventStorePurger, "setTimeout:", 4.0);
    -[EKTimedEventStorePurger setPurgingAllowed:](self->_timedEventStorePurger, "setPurgingAllowed:", 1);
    -[EKTimedEventStorePurger setCreationBlock:](self->_timedEventStorePurger, "setCreationBlock:", &__block_literal_global_39);
    timedEventStorePurger = self->_timedEventStorePurger;
  }
  return (id)-[EKTimedEventStorePurger acquireCachedEventStoreOrCreate:](timedEventStorePurger, "acquireCachedEventStoreOrCreate:", 1);
}

id __29__EKTravelEngine__eventStore__block_invoke()
{
  return objc_alloc_init(MEMORY[0x24BDC74E8]);
}

- (void)_refreshIfNeeded
{
  NSObject *v3;
  const char *v4;
  BOOL v5;
  os_log_t *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  EKTravelEngine *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  EKTravelEngine *v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  EKTravelEngine *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (!self->_needsRefresh)
  {
    v3 = *MEMORY[0x24BDC7450];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 138412290;
    v33 = self;
    v4 = "Data does not need to be refreshed.  Will not refresh data for travel engine: [%@]";
    goto LABEL_10;
  }
  if (self->_databaseIsEncryptedAndUnreadable)
  {
    v3 = *MEMORY[0x24BDC7450];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 138412290;
    v33 = self;
    v4 = "Cannot access data. Will not refresh data for travel engine: [%@]";
LABEL_10:
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 0xCu);
    return;
  }
  if (self->_yieldingToSync)
  {
    v3 = *MEMORY[0x24BDC7450];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 138412290;
    v33 = self;
    v4 = "Currently yielding to sync. Will not refresh data for travel engine: [%@]";
    goto LABEL_10;
  }
  v5 = -[EKTravelEngine _authorizedToAcquireLocation](self, "_authorizedToAcquireLocation");
  v6 = (os_log_t *)MEMORY[0x24BDC7450];
  v7 = *MEMORY[0x24BDC7450];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v33 = self;
      _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "Refreshing data for travel engine: [%@]", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_lastRefreshDate, v9);
    -[EKTravelEngine _eventStore](self, "_eventStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_travelAgendaTimeWindowInterval");
    v12 = v11;
    v13 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x24BDD16E0];
      v15 = v13;
      objc_msgSend(v14, "numberWithDouble:", v12);
      v16 = (EKTravelEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v16;
      _os_log_impl(&dword_215D9B000, v15, OS_LOG_TYPE_DEFAULT, "The travel agenda time window interval is [%@] seconds.", buf, 0xCu);

    }
    objc_msgSend(v9, "dateByAddingTimeInterval:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKTravelEngine _trimAgendaEntriesBeforeDate:andAfterDate:](self, "_trimAgendaEntriesBeforeDate:andAfterDate:", v9, v17);
    +[EKTravelEngine travelEligibleEvents:fromStartDate:untilEndDate:](EKTravelEngine, "travelEligibleEvents:fromStartDate:untilEndDate:", v10, v9, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v20 = *v6;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = objc_msgSend(v18, "count");
      *(_DWORD *)buf = 134217984;
      v33 = (EKTravelEngine *)v22;
      _os_log_impl(&dword_215D9B000, v21, OS_LOG_TYPE_DEFAULT, "Found [%lu] travel agenda candidates.", buf, 0xCu);

    }
    v23 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke;
    v30[3] = &unk_24D484E08;
    v30[4] = self;
    v24 = v19;
    v31 = v24;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v30);
    v25 = (void *)-[NSMutableDictionary copy](self->_eventExternalURLsToAgendaEntries, "copy");
    v27[0] = v23;
    v27[1] = 3221225472;
    v27[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke_51;
    v27[3] = &unk_24D484E30;
    v28 = v24;
    v29 = self;
    v26 = v24;
    objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v27);

    self->_needsRefresh = 0;
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "Calendar system service is not authorized to use location", buf, 2u);
    }
    self->_needsRefresh = 1;
  }
}

void __34__EKTravelEngine__refreshIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  os_log_t *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  os_log_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  os_log_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  EKTravelEngineAgendaEntry *v29;
  NSObject *v30;
  EKTravelEngineAgendaEntry *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  EKTravelEngineOriginalEvent *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  void *v58;
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "externalURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "preferredLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (os_log_t *)MEMORY[0x24BDC7450];
  v7 = (void *)*MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v2, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v67 = v9;
    v68 = 2112;
    v69 = v5;
    v70 = 2112;
    v71 = v10;
    v72 = 2112;
    v73 = v4;
    _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Inspecting travel agenda candidate event with title [%@], location [%@], start date [%@], and external URL [%@].", buf, 0x2Au);

  }
  if (v4)
  {
    if (!v5)
    {
      v16 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v4;
        _os_log_impl(&dword_215D9B000, v16, OS_LOG_TYPE_DEFAULT, "No location for event with external URL: [%@].  Will unregister as travel entry if it exists.", buf, 0xCu);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v4;
          _os_log_impl(&dword_215D9B000, v18, OS_LOG_TYPE_DEFAULT, "Unregistering event with external URL [%@] since it seems to have lost its location.", buf, 0xCu);
        }
        objc_msgSend(v17, "reset");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", v4);
      }

      goto LABEL_43;
    }
    if (+[CALNNotificationFilter shouldIgnoreNotificationForEvent:](CALNNotificationFilter, "shouldIgnoreNotificationForEvent:", v2))
    {
      v11 = *v6;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "Event is or may be junk. Will not register as travel agenda item.";
        v13 = v11;
        v14 = 2;
LABEL_10:
        _os_log_impl(&dword_215D9B000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
        goto LABEL_43;
      }
      goto LABEL_43;
    }
    objc_msgSend(v2, "travelStartLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "routing");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(MEMORY[0x24BE13FB8], "routingModeEnumForCalRouteType:", v58);
    if (v58)
    {
      v57 = objc_msgSend(MEMORY[0x24BDC7568], "geoTransportTypeForCalLocationRoutingMode:", v20);
    }
    else
    {
      v21 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)MEMORY[0x24BDC7568];
        v23 = v21;
        objc_msgSend(v22, "geoTransportTypeAsString:", 4);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v67 = v4;
        v68 = 2112;
        v69 = v24;
        _os_log_impl(&dword_215D9B000, v23, OS_LOG_TYPE_DEFAULT, "No routing method found on event with external URL [%@].  Defaulting to [%@].", buf, 0x16u);

      }
      v57 = 4;
    }
    v25 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)MEMORY[0x24BDC7568];
      v27 = v25;
      objc_msgSend(v26, "geoTransportTypeAsString:", v57);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v67 = v28;
      v68 = 2112;
      v69 = v4;
      _os_log_impl(&dword_215D9B000, v27, OS_LOG_TYPE_DEFAULT, "Using routing method [%@] for event with external URL [%@].", buf, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v4);
    v29 = (EKTravelEngineAgendaEntry *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      v30 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v4;
        _os_log_impl(&dword_215D9B000, v30, OS_LOG_TYPE_DEFAULT, "Creating agenda entry because one does not exist for event with external URL: [%@]", buf, 0xCu);
      }
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      v31 = [EKTravelEngineAgendaEntry alloc];
      objc_msgSend(*(id *)(a1 + 32), "routeHypothesizerProvider");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[EKTravelEngineAgendaEntry initWithRouteHypothesizerProvider:](v31, "initWithRouteHypothesizerProvider:", v32);

      v33 = MEMORY[0x24BDAC760];
      v63[0] = MEMORY[0x24BDAC760];
      v63[1] = 3221225472;
      v63[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke_45;
      v63[3] = &unk_24D484DB8;
      objc_copyWeak(&v65, (id *)buf);
      v34 = v4;
      v64 = v34;
      -[EKTravelEngineAgendaEntry setUpdateBlock:](v29, "setUpdateBlock:", v63);
      v60[0] = v33;
      v60[1] = 3221225472;
      v60[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke_2_47;
      v60[3] = &unk_24D484DB8;
      objc_copyWeak(&v62, (id *)buf);
      v35 = v34;
      v61 = v35;
      -[EKTravelEngineAgendaEntry setEntrySignificantlyChangedBlock:](v29, "setEntrySignificantlyChangedBlock:", v60);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", v29, v35);

      objc_destroyWeak(&v62);
      objc_destroyWeak(&v65);
      objc_destroyWeak((id *)buf);
    }
    if (-[EKTravelEngineAgendaEntry dismissed](v29, "dismissed"))
    {
      objc_msgSend(v2, "structuredLocation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "title");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKTravelEngineAgendaEntry originalEvent](v29, "originalEvent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "locationString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v37, "isEqualToString:", v39);

      if ((v40 & 1) == 0)
      {
        v45 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v4;
          v46 = "The entry has been dismissed, but it's location has changed.  Clearing the dismissed flag for the entry "
                "for event with external URL: [%@]";
          goto LABEL_36;
        }
LABEL_37:
        -[EKTravelEngineAgendaEntry setDismissed:](v29, "setDismissed:", 0);
        goto LABEL_38;
      }
      objc_msgSend(v2, "startDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKTravelEngineAgendaEntry originalEvent](v29, "originalEvent");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "startDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v41, "isEqualToDate:", v43);

      if ((v44 & 1) == 0)
      {
        v45 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v4;
          v46 = "The entry has been dismissed, but it's start date has changed.  Clearing the dismissed flag for the entr"
                "y for event with external URL: [%@]";
LABEL_36:
          _os_log_impl(&dword_215D9B000, v45, OS_LOG_TYPE_DEFAULT, v46, buf, 0xCu);
          goto LABEL_37;
        }
        goto LABEL_37;
      }
    }
LABEL_38:
    if (-[EKTravelEngineAgendaEntry dismissed](v29, "dismissed"))
    {
      v47 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v4;
        _os_log_impl(&dword_215D9B000, v47, OS_LOG_TYPE_DEFAULT, "The entry has been dismissed.  Will not update the entry for event with external URL: [%@]", buf, 0xCu);
      }
    }
    else
    {
      v48 = objc_alloc_init(EKTravelEngineOriginalEvent);
      -[EKTravelEngineOriginalEvent setEventExternalURL:](v48, "setEventExternalURL:", v4);
      objc_msgSend(v2, "startDate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKTravelEngineOriginalEvent setStartDate:](v48, "setStartDate:", v49);

      objc_msgSend(v2, "endDate");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKTravelEngineOriginalEvent setEndDate:](v48, "setEndDate:", v50);

      -[EKTravelEngineOriginalEvent setTransportTypeOverride:](v48, "setTransportTypeOverride:", v57);
      objc_msgSend(v2, "structuredLocation");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "title");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKTravelEngineOriginalEvent setLocationString:](v48, "setLocationString:", v52);

      objc_msgSend(v5, "geoLocation");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKTravelEngineOriginalEvent setGeoLocation:](v48, "setGeoLocation:", v53);

      -[EKTravelEngineOriginalEvent setLocationIsAConferenceRoom:](v48, "setLocationIsAConferenceRoom:", objc_msgSend(v2, "locationIsAConferenceRoom"));
      objc_msgSend(v5, "mapKitHandle");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKTravelEngineOriginalEvent setLocationMapKitHandle:](v48, "setLocationMapKitHandle:", v54);

      -[EKTravelEngineOriginalEvent setAutomaticGeocodingAllowed:](v48, "setAutomaticGeocodingAllowed:", objc_msgSend(v2, "automaticLocationGeocodingAllowed"));
      -[EKTravelEngineOriginalEvent setHasPredictedLocation:](v48, "setHasPredictedLocation:", objc_msgSend(v2, "hasPredictedLocation"));
      objc_msgSend(v2, "locationWithoutPrediction");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKTravelEngineOriginalEvent setLocationStringWithoutPrediction:](v48, "setLocationStringWithoutPrediction:", v55);

      objc_msgSend(v2, "calendar");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKTravelEngineOriginalEvent setIsOnSharedCalendar:](v48, "setIsOnSharedCalendar:", objc_msgSend(v56, "sharingStatus") != 0);
      -[EKTravelEngineAgendaEntry updateHypothesizerIfNecessaryWithOriginalEvent:](v29, "updateHypothesizerIfNecessaryWithOriginalEvent:", v48);

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

    goto LABEL_43;
  }
  v15 = *v6;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v2;
    v12 = "No external url for event: [%@].  Will not register as travel agenda item.";
    v13 = v15;
    v14 = 12;
    goto LABEL_10;
  }
LABEL_43:

}

void __34__EKTravelEngine__refreshIfNeeded__block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  NSObject **v10;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke_2;
    block[3] = &unk_24D484800;
    v8 = v3;
    v9 = *(id *)(a1 + 32);
    v10 = v5;
    dispatch_async(v6, block);

  }
}

void __34__EKTravelEngine__refreshIfNeeded__block_invoke_2(id *a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "latestHypothesis");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    v13 = v4;
    v14 = 2112;
    v15 = v2;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Hypothesis updated for event with external URL: [%@].  Hypothesis: [%@]", buf, 0x16u);
  }
  objc_msgSend(a1[6], "adviceBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *((_QWORD *)a1[6] + 2);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke_46;
    block[3] = &unk_24D484D90;
    v11 = v5;
    v9 = a1[5];
    v10 = v2;
    dispatch_async(v7, block);

  }
}

uint64_t __34__EKTravelEngine__refreshIfNeeded__block_invoke_46(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __34__EKTravelEngine__refreshIfNeeded__block_invoke_2_47(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  NSObject **v7;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[1];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke_3;
    v5[3] = &unk_24D484760;
    v6 = *(id *)(a1 + 32);
    v7 = v3;
    dispatch_async(v4, v5);

  }
}

void __34__EKTravelEngine__refreshIfNeeded__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_215D9B000, v2, OS_LOG_TYPE_DEFAULT, "Significant change encountered for event with external URL [%@].", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "eventSignificantlyChangedBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke_48;
    v7[3] = &unk_24D484DE0;
    v9 = v4;
    v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);

  }
}

uint64_t __34__EKTravelEngine__refreshIfNeeded__block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __34__EKTravelEngine__refreshIfNeeded__block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
  {
    v7 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "Unregistering event with external URL since it's not in the travel window: [%@]", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(v6, "reset");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObjectForKey:", v5);
  }

}

- (void)_unregisterAllAgendaEntries
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering all agenda entries.", buf, 2u);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allValues](self->_eventExternalURLsToAgendaEntries, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "reset");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_eventExternalURLsToAgendaEntries, "removeAllObjects");
}

- (void)_periodicRefreshTimerFired
{
  NSObject *v3;
  int v4;
  EKTravelEngine *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "The periodic refresh timer fired for travel engine: [%@].", (uint8_t *)&v4, 0xCu);
  }
  -[EKTravelEngine _uninstallPeriodicRefreshTimer](self, "_uninstallPeriodicRefreshTimer");
  -[EKTravelEngine _installPeriodicRefreshTimer](self, "_installPeriodicRefreshTimer");
  self->_needsRefresh = 1;
  -[EKTravelEngine _refreshIfNeeded](self, "_refreshIfNeeded");
}

- (void)_installLocationManager
{
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = (os_log_t *)MEMORY[0x24BDC7450];
  v4 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Installation of location manager requested.", (uint8_t *)&v10, 2u);
  }
  objc_msgSend(MEMORY[0x24BE13FC8], "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDBFA88]);
  objc_msgSend(v5, "bundlePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithEffectiveBundlePath:delegate:onQueue:", v7, self, self->_workQueue);

  objc_storeStrong((id *)&self->_locationManager, v8);
  v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Installation of location manager complete.  Location manager: [%@]", (uint8_t *)&v10, 0xCu);
  }

}

- (void)_uninstallLocationManager
{
  os_log_t *v3;
  NSObject *v4;
  CLLocationManager *locationManager;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = (os_log_t *)MEMORY[0x24BDC7450];
  v4 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Uninstallation of location manager requested.", buf, 2u);
  }
  -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", 0);
  locationManager = self->_locationManager;
  self->_locationManager = 0;

  v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Uninstallation of location manager complete.", v7, 2u);
  }
}

- (void)_sendFeedbackForPostingNotificationForEventWithExternalURL:(id)a3 feedback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *workQueue;
  NSObject *v10;
  const char *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v10 = *MEMORY[0x24BDC7450];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v11 = "nil 'externalURL' given.  Will not send feedback for posting notification.";
LABEL_8:
    _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    v10 = *MEMORY[0x24BDC7450];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v11 = "nil 'feedback' given.  Will not send feedback for posting notification.";
    goto LABEL_8;
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__EKTravelEngine__sendFeedbackForPostingNotificationForEventWithExternalURL_feedback___block_invoke;
  block[3] = &unk_24D484E58;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  dispatch_async(workQueue, block);

LABEL_9:
}

void __86__EKTravelEngine__sendFeedbackForPostingNotificationForEventWithExternalURL_feedback___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v3 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      v4 = a1[5];
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Will not send feedback for posting notification for event that has external URL: [%@] because it isn't being monitored.", (uint8_t *)&v5, 0xCu);
    }
  }

}

- (id)adviceBlock
{
  return self->_adviceBlock;
}

- (void)setAdviceBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)authorizationChangedBlock
{
  return self->_authorizationChangedBlock;
}

- (void)setAuthorizationChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)eventSignificantlyChangedBlock
{
  return self->_eventSignificantlyChangedBlock;
}

- (void)setEventSignificantlyChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CALNRouteHypothesizerProvider)routeHypothesizerProvider
{
  return self->_routeHypothesizerProvider;
}

- (BOOL)authorizedInternal
{
  return self->_authorizedInternal;
}

- (void)setAuthorizedInternal:(BOOL)a3
{
  self->_authorizedInternal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeHypothesizerProvider, 0);
  objc_storeStrong(&self->_eventSignificantlyChangedBlock, 0);
  objc_storeStrong(&self->_authorizationChangedBlock, 0);
  objc_storeStrong(&self->_adviceBlock, 0);
  objc_storeStrong((id *)&self->_lastRefreshDate, 0);
  objc_storeStrong((id *)&self->_timedEventStorePurger, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_eventExternalURLsToAgendaEntries, 0);
  objc_storeStrong((id *)&self->_syncYieldTimer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __40__EKTravelEngine__installSyncYieldTimer__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "Sync yield timer fired.  Overriding sync yield and refreshing if needed.", v1, 2u);
}

@end
