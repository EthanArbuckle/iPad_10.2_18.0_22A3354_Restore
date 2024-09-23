@implementation MTAlarmManager

uint64_t __59__MTAlarmManager__alarmsIncludingSleepAlarm_doSynchronous___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_3;
  v3[3] = &unk_1E39CE120;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "getAlarmsWithCompletion:", v3);

}

void __59__MTAlarmManager__alarmsIncludingSleepAlarm_doSynchronous___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t, id);
  id v11;
  id v12;

  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(v9 + 16);
  v11 = a5;
  v10(v9, a2, a3, a4, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v12, v11);

}

id __59__MTAlarmManager__alarmsIncludingSleepAlarm_doSynchronous___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v8;
  void *v9;

  v8 = a3;
  if (a5)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_44);
    if (*(_BYTE *)(a1 + 32))
      objc_msgSend(v9, "na_safeAddObjectsFromArray:", v8);
  }

  return v9;
}

- (id)alarmsIncludingSleepAlarm:(BOOL)a3
{
  return -[MTAlarmManager _alarmsIncludingSleepAlarm:doSynchronous:](self, "_alarmsIncludingSleepAlarm:doSynchronous:", a3, 0);
}

- (id)_alarmsIncludingSleepAlarm:(BOOL)a3 doSynchronous:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  MTAlarmCache *cache;
  id *v12;
  id *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  void *v24;
  _QWORD v25[4];
  BOOL v26;

  v4 = a4;
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __59__MTAlarmManager__alarmsIncludingSleepAlarm_doSynchronous___block_invoke;
  v25[3] = &__block_descriptor_33_e62___NSArray_40__0__NSArray_8__NSArray_16__MTAlarm_24__NSError_32l;
  v26 = a3;
  v9 = MEMORY[0x19AED0080](v25);
  v10 = (void *)v9;
  if (v4)
  {
    cache = self->_cache;
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __59__MTAlarmManager__alarmsIncludingSleepAlarm_doSynchronous___block_invoke_3;
    v22[3] = &unk_1E39CE200;
    v12 = &v23;
    v13 = &v24;
    v23 = v7;
    v24 = v10;
    v14 = v10;
    -[MTAlarmCache getCachedAlarmsSyncWithCompletion:](cache, "getCachedAlarmsSyncWithCompletion:", v22);
  }
  else
  {
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __59__MTAlarmManager__alarmsIncludingSleepAlarm_doSynchronous___block_invoke_4;
    v19[3] = &unk_1E39CE228;
    v12 = (id *)&v21;
    v21 = v9;
    v13 = &v20;
    v15 = v7;
    v20 = v15;
    v16 = v10;
    v17 = (void *)MEMORY[0x19AED0080](v19);
    -[MTAlarmManager _getCachedAlarmsWithFuture:finishBlock:](self, "_getCachedAlarmsWithFuture:finishBlock:", v15, v17);

  }
  return v7;
}

- (void)_getCachedAlarmsWithFuture:(id)a3 finishBlock:(id)a4
{
  id v5;
  MTAlarmCache *cache;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  cache = self->_cache;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__MTAlarmManager__getCachedAlarmsWithFuture_finishBlock___block_invoke;
  v8[3] = &unk_1E39CE120;
  v9 = v5;
  v7 = v5;
  -[MTAlarmCache getCachedAlarmsWithCompletion:](cache, "getCachedAlarmsWithCompletion:", v8);

}

uint64_t __57__MTAlarmManager__getCachedAlarmsWithFuture_finishBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_2;
  v12[3] = &unk_1E39CE148;
  v13 = v5;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_4;
  v10[3] = &unk_1E39CB4E8;
  v11 = v13;
  v9 = v13;
  objc_msgSend(v7, "performRemoteBlock:withErrorHandler:isSynchronous:", v12, v10, a3);

}

- (MTXPCConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

+ (void)warmUp
{
  NSObject *v3;
  id v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = a1;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ warming...", (uint8_t *)&v6, 0xCu);
  }

  v4 = MTAlarmServerInterface();
  v5 = MTAlarmClientInterface();
}

id __34__MTAlarmManager_initWithMetrics___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v2 = a2;
  MTAlarmServerInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MTAlarmClientInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTXPCConnectionInfo infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:](MTXPCConnectionInfo, "infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:", CFSTR("com.apple.MobileTimer.alarmserver"), v3, v4, v5, CFSTR("com.apple.MTAlarmServer.wakeup"), 0, 4096);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v2);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__MTAlarmManager_initWithMetrics___block_invoke_2;
  v9[3] = &unk_1E39CBC38;
  objc_copyWeak(&v10, &location);
  +[MTXPCConnectionProvider providerWithConnectionInfo:reconnectHandler:](MTXPCConnectionProvider, "providerWithConnectionInfo:reconnectHandler:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

- (MTAlarmManagerExportedObject)exportedObject
{
  return self->_exportedObject;
}

- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MTAlarmManager _initWithConnectionProvidingBlock:metrics:notificationCenter:](self, "_initWithConnectionProvidingBlock:metrics:notificationCenter:", v8, v7, v9);

  return v10;
}

- (MTAlarmManager)init
{
  MTMetrics *v3;
  MTAlarmManager *v4;

  v3 = objc_alloc_init(MTMetrics);
  v4 = -[MTAlarmManager initWithMetrics:](self, "initWithMetrics:", v3);

  return v4;
}

- (MTAlarmManager)initWithMetrics:(id)a3
{
  return (MTAlarmManager *)-[MTAlarmManager _initWithConnectionProvidingBlock:metrics:](self, "_initWithConnectionProvidingBlock:metrics:", &__block_literal_global_34, a3);
}

- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  void (**v8)(id, MTAlarmManager *);
  id v9;
  id v10;
  MTAlarmManager *v11;
  NSObject *v12;
  MTAlarmManagerExportedObject *v13;
  MTAlarmManagerExportedObject *exportedObject;
  uint64_t v15;
  MTXPCConnectionProvider *connectionProvider;
  MTAlarmCache *v17;
  uint64_t v18;
  MTAlarmCache *cache;
  _QWORD v21[4];
  id v22;
  objc_super v23;
  uint8_t buf[4];
  MTAlarmManager *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, MTAlarmManager *))a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MTAlarmManager;
  v11 = -[MTAlarmManager init](&v23, sel_init);
  if (v11)
  {
    MTLogForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    objc_storeStrong((id *)&v11->_notificationCenter, a5);
    v13 = -[MTAlarmManagerExportedObject initWithAlarmManager:]([MTAlarmManagerExportedObject alloc], "initWithAlarmManager:", v11);
    exportedObject = v11->_exportedObject;
    v11->_exportedObject = v13;

    objc_storeStrong((id *)&v11->_metrics, a4);
    v8[2](v8, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    connectionProvider = v11->_connectionProvider;
    v11->_connectionProvider = (MTXPCConnectionProvider *)v15;

    objc_initWeak((id *)buf, v11);
    v17 = [MTAlarmCache alloc];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke;
    v21[3] = &unk_1E39CE170;
    objc_copyWeak(&v22, (id *)buf);
    v18 = -[MTAlarmCache initWithUpdateBlock:](v17, "initWithUpdateBlock:", v21);
    cache = v11->_cache;
    v11->_cache = (MTAlarmCache *)v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

  return v11;
}

+ (id)assistantSyncNotificationName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", ".siri_data_changed", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("com.apple.alarm.label"), "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __34__MTAlarmManager_initWithMetrics___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reconnect");

}

- (MTAlarmManager)initWithConnectionProvider:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  MTAlarmManager *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__MTAlarmManager_initWithConnectionProvider_metrics___block_invoke;
  v10[3] = &unk_1E39CE0F8;
  v11 = v6;
  v7 = v6;
  v8 = -[MTAlarmManager _initWithConnectionProvidingBlock:metrics:](self, "_initWithConnectionProvidingBlock:metrics:", v10, a4);

  return v8;
}

id __53__MTAlarmManager_initWithConnectionProvider_metrics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (MTAlarmManager)initWithConnectionProvider:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  id v8;
  id v9;
  MTAlarmManager *v10;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__MTAlarmManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke;
  v12[3] = &unk_1E39CE0F8;
  v13 = v8;
  v9 = v8;
  v10 = -[MTAlarmManager _initWithConnectionProvidingBlock:metrics:notificationCenter:](self, "_initWithConnectionProvidingBlock:metrics:notificationCenter:", v12, a4, a5);

  return v10;
}

id __72__MTAlarmManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MTAlarmManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  -[MTXPCConnectionProvider invalidate](self->_connectionProvider, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)MTAlarmManager;
  -[MTAlarmManager dealloc](&v4, sel_dealloc);
}

- (void)checkIn
{
  NSObject *v3;
  int v4;
  MTAlarmManager *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ checking in...", (uint8_t *)&v4, 0xCu);
  }

  -[MTAlarmManager reconnect](self, "reconnect");
}

- (void)reconnect
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  MTAlarmManager *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ reconnecting...", buf, 0xCu);
  }

  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarmManager cache](self, "cache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ updating cache %{public}@", buf, 0x16u);

  }
  -[MTAlarmManager cache](self, "cache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markNeedsUpdate");

  MTLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarmManager connectionProvider](self, "connectionProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ calling connection provider %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  -[MTAlarmManager connectionProvider](self, "connectionProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __27__MTAlarmManager_reconnect__block_invoke;
  v12[3] = &unk_1E39CE198;
  objc_copyWeak(&v13, (id *)buf);
  v11[0] = v10;
  v11[1] = 3221225472;
  v11[2] = __27__MTAlarmManager_reconnect__block_invoke_40;
  v11[3] = &unk_1E39CC2D8;
  v11[4] = self;
  objc_msgSend(v9, "performRemoteBlock:withErrorHandler:", v12, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __27__MTAlarmManager_reconnect__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "connectionProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = WeakRetained;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ remote block being called on connection provider %{public}@...", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(v3, "checkIn");

}

void __27__MTAlarmManager_reconnect__block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __27__MTAlarmManager_reconnect__block_invoke_40_cold_1(a1, (uint64_t)v3, v4);

}

void __59__MTAlarmManager__alarmsIncludingSleepAlarm_doSynchronous___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;

  if (a5)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a5);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v6);

  }
}

- (id)sleepAlarm
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__MTAlarmManager_sleepAlarm__block_invoke;
  v8[3] = &unk_1E39CE250;
  v4 = v3;
  v9 = v4;
  v5 = (void *)MEMORY[0x19AED0080](v8);
  -[MTAlarmManager _getCachedAlarmsWithFuture:finishBlock:](self, "_getCachedAlarmsWithFuture:finishBlock:", v4, v5);
  v6 = v4;

  return v6;
}

void __28__MTAlarmManager_sleepAlarm__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v9 = a5;
  objc_msgSend(a3, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  if (v9 | v7)
    objc_msgSend(v8, "finishWithResult:error:", v7, v9);
  else
    objc_msgSend(v8, "finishWithNoResult");

}

- (id)sleepAlarms
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__MTAlarmManager_sleepAlarms__block_invoke;
  v8[3] = &unk_1E39CE250;
  v4 = v3;
  v9 = v4;
  v5 = (void *)MEMORY[0x19AED0080](v8);
  -[MTAlarmManager _getCachedAlarmsWithFuture:finishBlock:](self, "_getCachedAlarmsWithFuture:finishBlock:", v4, v5);
  v6 = v4;

  return v6;
}

uint64_t __29__MTAlarmManager_sleepAlarms__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;

  v5 = *(void **)(a1 + 32);
  if (a3 | a5)
    return objc_msgSend(v5, "finishWithResult:error:");
  else
    return objc_msgSend(v5, "finishWithNoResult");
}

- (id)nextAlarm
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, void *, void *);
  void *v11;
  MTAlarmManager *v12;
  id v13;

  v3 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __27__MTAlarmManager_nextAlarm__block_invoke;
  v11 = &unk_1E39CE278;
  v12 = self;
  v4 = v3;
  v13 = v4;
  v5 = (void *)MEMORY[0x19AED0080](&v8);
  -[MTAlarmManager _getCachedAlarmsWithFuture:finishBlock:](self, "_getCachedAlarmsWithFuture:finishBlock:", v4, v5, v8, v9, v10, v11, v12);
  v6 = v4;

  return v6;
}

void __27__MTAlarmManager_nextAlarm__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  MTLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v15 = 138543362;
    v16 = v10;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ finish block called for next alarm", (uint8_t *)&v15, 0xCu);
  }

  MTLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v7 | v8)
  {
    if (v12)
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = 138543874;
      v16 = v14;
      v17 = 2114;
      v18 = v7;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ finish block called with next alarm: %{public}@, error: %{public}@", (uint8_t *)&v15, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v7, v8);
  }
  else
  {
    if (v12)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ finish block called with no next alarm", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

- (unint64_t)alarmCountIncludingSleepAlarm:(BOOL)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[4];
  BOOL v9;

  -[MTAlarmManager alarmsSyncIncludingSleepAlarm:](self, "alarmsSyncIncludingSleepAlarm:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MTAlarmManager_alarmCountIncludingSleepAlarm___block_invoke;
  v8[3] = &__block_descriptor_33_e17_B16__0__MTAlarm_8l;
  v9 = a3;
  objc_msgSend(v4, "na_filter:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

uint64_t __48__MTAlarmManager_alarmCountIncludingSleepAlarm___block_invoke(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32))
    return 1;
  else
    return objc_msgSend(a2, "isSleepAlarm") ^ 1;
}

- (unint64_t)firingAlarmCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[MTAlarmManager alarmsSyncIncludingSleepAlarm:](self, "alarmsSyncIncludingSleepAlarm:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_48);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

uint64_t __34__MTAlarmManager_firingAlarmCount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFiring");
}

- (id)alarmsSync
{
  return -[MTAlarmManager alarmsSyncIncludingSleepAlarm:](self, "alarmsSyncIncludingSleepAlarm:", 0);
}

- (id)alarmsSyncIncludingSleepAlarm:(BOOL)a3
{
  void *v5;
  id v6;
  id v7;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  -[MTAlarmManager _alarmsIncludingSleepAlarm:doSynchronous:](self, "_alarmsIncludingSleepAlarm:doSynchronous:", a3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isFinished") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTAlarmManager.m"), 316, CFSTR("Expected alarm future to be finished."));

  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__MTAlarmManager_alarmsSyncIncludingSleepAlarm___block_invoke;
  v10[3] = &unk_1E39CE2C0;
  v10[4] = &v11;
  v6 = (id)objc_msgSend(v5, "addCompletionBlock:", v10);
  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __48__MTAlarmManager_alarmsSyncIncludingSleepAlarm___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  id v7;

  v6 = a2;
  if (!a3)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v6 = v7;
  }

}

- (id)alarms
{
  return -[MTAlarmManager alarmsIncludingSleepAlarm:](self, "alarmsIncludingSleepAlarm:", 0);
}

- (id)nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4
{
  return -[MTAlarmManager nextAlarmsForDate:maxCount:includeSleepAlarm:](self, "nextAlarmsForDate:maxCount:includeSleepAlarm:", a3, a4, 1);
}

- (id)nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5
{
  return -[MTAlarmManager nextAlarmsForDate:maxCount:includeSleepAlarm:includeBedtimeNotification:](self, "nextAlarmsForDate:maxCount:includeSleepAlarm:includeBedtimeNotification:", a3, a4, a5, 0);
}

- (id)nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4 includeBedtimeNotification:(BOOL)a5
{
  return -[MTAlarmManager nextAlarmsForDate:maxCount:includeSleepAlarm:includeBedtimeNotification:](self, "nextAlarmsForDate:maxCount:includeSleepAlarm:includeBedtimeNotification:", a3, a4, 1, a5);
}

- (id)nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6
{
  return -[MTAlarmManager _nextAlarmsForDate:maxCount:includeSleepAlarm:includeBedtimeNotification:doSynchronous:](self, "_nextAlarmsForDate:maxCount:includeSleepAlarm:includeBedtimeNotification:doSynchronous:", a3, a4, a5, a6, 0);
}

- (id)_nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6 doSynchronous:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a3;
  -[MTAlarmManager _sortedNextAlarmsAfterDate:includeSleepAlarm:includeBedtimeNotification:doSynchronous:](self, "_sortedNextAlarmsAfterDate:includeSleepAlarm:includeBedtimeNotification:doSynchronous:", v12, v9, v8, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "components:fromDate:", 30, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateFromComponents:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __105__MTAlarmManager__nextAlarmsForDate_maxCount_includeSleepAlarm_includeBedtimeNotification_doSynchronous___block_invoke;
  v26 = &unk_1E39CE2E8;
  v30 = v8;
  v27 = v12;
  v28 = v14;
  v29 = v16;
  v17 = v16;
  v18 = v14;
  v19 = v12;
  v20 = (void *)MEMORY[0x19AED0080](&v23);
  objc_msgSend((id)objc_opt_class(), "_filteredAlarms:afterDate:maxCount:filter:", v13, v19, a4, v20, v23, v24, v25, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __105__MTAlarmManager__nextAlarmsForDate_maxCount_includeSleepAlarm_includeBedtimeNotification_doSynchronous___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (objc_msgSend(v3, "isEnabled"))
  {
    objc_msgSend(v3, "nextTriggerAfterDate:includeBedtimeNotification:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "triggerDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "mtIsAfterDate:", *(_QWORD *)(a1 + 32))
      && (objc_msgSend(v4, "isPastOverrideEvent") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "components:fromDate:", 30, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "dateFromComponents:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(*(id *)(a1 + 48), "isEqualToDate:", v8);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)nextAlarmsInRange:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5
{
  return -[MTAlarmManager nextAlarmsInRange:maxCount:includeSleepAlarm:includeBedtimeNotification:](self, "nextAlarmsInRange:maxCount:includeSleepAlarm:includeBedtimeNotification:", a3, a4, a5, 0);
}

- (id)nextAlarmsInRange:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6
{
  return -[MTAlarmManager _nextAlarmsInRange:maxCount:includeSleepAlarm:includeBedtimeNotification:doSynchronous:](self, "_nextAlarmsInRange:maxCount:includeSleepAlarm:includeBedtimeNotification:doSynchronous:", a3, a4, a5, a6, 0);
}

- (id)_nextAlarmsInRange:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6 doSynchronous:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  BOOL v26;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a3;
  objc_msgSend(v12, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlarmManager _sortedNextAlarmsAfterDate:includeSleepAlarm:includeBedtimeNotification:doSynchronous:](self, "_sortedNextAlarmsAfterDate:includeSleepAlarm:includeBedtimeNotification:doSynchronous:", v13, v9, v8, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __105__MTAlarmManager__nextAlarmsInRange_maxCount_includeSleepAlarm_includeBedtimeNotification_doSynchronous___block_invoke;
  v24 = &unk_1E39CE310;
  v25 = v12;
  v26 = v8;
  v15 = v12;
  v16 = (void *)MEMORY[0x19AED0080](&v21);
  v17 = (void *)objc_opt_class();
  objc_msgSend(v15, "startDate", v21, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_filteredAlarms:afterDate:maxCount:filter:", v14, v18, a4, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __105__MTAlarmManager__nextAlarmsInRange_maxCount_includeSleepAlarm_includeBedtimeNotification_doSynchronous___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "isEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nextFireDateAfterDate:includeBedtimeNotification:", v4, *(unsigned __int8 *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(*(id *)(a1 + 32), "containsDate:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_sortedNextAlarmsAfterDate:(id)a3 includeSleepAlarm:(BOOL)a4 includeBedtimeNotification:(BOOL)a5
{
  return -[MTAlarmManager _sortedNextAlarmsAfterDate:includeSleepAlarm:includeBedtimeNotification:doSynchronous:](self, "_sortedNextAlarmsAfterDate:includeSleepAlarm:includeBedtimeNotification:doSynchronous:", a3, a4, a5, 0);
}

- (id)_sortedNextAlarmsAfterDate:(id)a3 includeSleepAlarm:(BOOL)a4 includeBedtimeNotification:(BOOL)a5 doSynchronous:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  -[MTAlarmManager _alarmsIncludingSleepAlarm:doSynchronous:](self, "_alarmsIncludingSleepAlarm:doSynchronous:", v8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "_filterSleepAlarmOverrides:date:", v11, v10);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  objc_msgSend((id)objc_opt_class(), "_sortedAlarms:date:includeBedtimeNotification:", v11, v10, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_filterSleepAlarmOverrides:(id)a3 date:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = a3;
  objc_msgSend(v6, "mtGregorianCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__MTAlarmManager__filterSleepAlarmOverrides_date___block_invoke;
  v13[3] = &unk_1E39CC7C0;
  v14 = v5;
  v15 = v8;
  v9 = v8;
  v10 = v5;
  objc_msgSend(v7, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __50__MTAlarmManager__filterSleepAlarmOverrides_date___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__12;
  v24 = __Block_byref_object_dispose__12;
  v25 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__MTAlarmManager__filterSleepAlarmOverrides_date___block_invoke_2;
  v16[3] = &unk_1E39CE338;
  v7 = v4;
  v17 = v7;
  v8 = v5;
  v18 = v8;
  v19 = &v20;
  objc_msgSend(v3, "na_each:", v16);
  if (v21[5])
  {
    objc_msgSend(v7, "addObject:");
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __50__MTAlarmManager__filterSleepAlarmOverrides_date___block_invoke_3;
    v11[3] = &unk_1E39CE360;
    v15 = &v20;
    v12 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    v14 = v7;
    objc_msgSend(v8, "na_each:", v11);

  }
  else
  {
    objc_msgSend(v7, "addObjectsFromArray:", v8);
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v20, 8);
  return v9;
}

void __50__MTAlarmManager__filterSleepAlarmOverrides_date___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isSleepAlarm") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    if (objc_msgSend(v4, "isSingleTimeAlarm"))
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }

}

void __50__MTAlarmManager__filterSleepAlarmOverrides_date___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "overridesNextAlarm:date:calendar:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);

}

+ (id)_sortedAlarms:(id)a3 date:(id)a4 includeBedtimeNotification:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__MTAlarmManager__sortedAlarms_date_includeBedtimeNotification___block_invoke;
  v11[3] = &unk_1E39CE3B0;
  v12 = v7;
  v13 = a5;
  v8 = v7;
  objc_msgSend(a3, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __64__MTAlarmManager__sortedAlarms_date_includeBedtimeNotification___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  char v12;

  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __64__MTAlarmManager__sortedAlarms_date_includeBedtimeNotification___block_invoke_2;
  v10 = &unk_1E39CE388;
  v11 = *(id *)(a1 + 32);
  v12 = *(_BYTE *)(a1 + 40);
  objc_msgSend(a2, "sortedArrayUsingComparator:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4, v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __64__MTAlarmManager__sortedAlarms_date_includeBedtimeNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isEnabled") && objc_msgSend(v6, "isEnabled"))
  {
    objc_msgSend(v5, "nextFireDateAfterDate:includeBedtimeNotification:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextFireDateAfterDate:includeBedtimeNotification:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7 && v8)
    {
      v10 = objc_msgSend(v7, "compare:", v8);
    }
    else if (v8)
    {
      v10 = 1;
    }
    else
    {
      v10 = -1;
    }

  }
  else if (objc_msgSend(v6, "isEnabled"))
  {
    v10 = 1;
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

+ (id)_filteredAlarms:(id)a3 afterDate:(id)a4 maxCount:(unint64_t)a5 filter:(id)a6
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  unint64_t v14;

  v8 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__MTAlarmManager__filteredAlarms_afterDate_maxCount_filter___block_invoke;
  v12[3] = &unk_1E39CE3D8;
  v13 = v8;
  v14 = a5;
  v9 = v8;
  objc_msgSend(a3, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __60__MTAlarmManager__filteredAlarms_afterDate_maxCount_filter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
      if ((unint64_t)objc_msgSend(v4, "count", (_QWORD)v13) >= *(_QWORD *)(a1 + 40))
        break;
      if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
        objc_msgSend(v4, "addObject:", v10);
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)nextAlarmsForDateSync:(id)a3 maxCount:(unint64_t)a4
{
  return -[MTAlarmManager nextAlarmsForDateSync:maxCount:includeSleepAlarm:](self, "nextAlarmsForDateSync:maxCount:includeSleepAlarm:", a3, a4, 1);
}

- (id)nextAlarmsForDateSync:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5
{
  return -[MTAlarmManager nextAlarmsForDateSync:maxCount:includeSleepAlarm:includeBedtimeNotification:](self, "nextAlarmsForDateSync:maxCount:includeSleepAlarm:includeBedtimeNotification:", a3, a4, a5, 0);
}

- (id)nextAlarmsForDateSync:(id)a3 maxCount:(unint64_t)a4 includeBedtimeNotification:(BOOL)a5
{
  return -[MTAlarmManager nextAlarmsForDateSync:maxCount:includeSleepAlarm:includeBedtimeNotification:](self, "nextAlarmsForDateSync:maxCount:includeSleepAlarm:includeBedtimeNotification:", a3, a4, 1, a5);
}

- (id)nextAlarmsForDateSync:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a6;
  v7 = a5;
  v11 = a3;
  -[MTAlarmManager _nextAlarmsForDate:maxCount:includeSleepAlarm:includeBedtimeNotification:doSynchronous:](self, "_nextAlarmsForDate:maxCount:includeSleepAlarm:includeBedtimeNotification:doSynchronous:", v11, a4, v7, v6, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isFinished") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTAlarmManager.m"), 511, CFSTR("Expected next alarm future to be finished."));

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__12;
  v22 = __Block_byref_object_dispose__12;
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__MTAlarmManager_nextAlarmsForDateSync_maxCount_includeSleepAlarm_includeBedtimeNotification___block_invoke;
  v17[3] = &unk_1E39CE2C0;
  v17[4] = &v18;
  v13 = (id)objc_msgSend(v12, "addCompletionBlock:", v17);
  v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v14;
}

void __94__MTAlarmManager_nextAlarmsForDateSync_maxCount_includeSleepAlarm_includeBedtimeNotification___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)nextAlarmsInRangeSync:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5
{
  return -[MTAlarmManager nextAlarmsInRangeSync:maxCount:includeSleepAlarm:includeBedtimeNotification:](self, "nextAlarmsInRangeSync:maxCount:includeSleepAlarm:includeBedtimeNotification:", a3, a4, a5, 0);
}

- (id)nextAlarmsInRangeSync:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a6;
  v7 = a5;
  v11 = a3;
  -[MTAlarmManager _nextAlarmsInRange:maxCount:includeSleepAlarm:includeBedtimeNotification:doSynchronous:](self, "_nextAlarmsInRange:maxCount:includeSleepAlarm:includeBedtimeNotification:doSynchronous:", v11, a4, v7, v6, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isFinished") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTAlarmManager.m"), 527, CFSTR("Expected next alarm future to be finished."));

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__12;
  v22 = __Block_byref_object_dispose__12;
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__MTAlarmManager_nextAlarmsInRangeSync_maxCount_includeSleepAlarm_includeBedtimeNotification___block_invoke;
  v17[3] = &unk_1E39CE2C0;
  v17[4] = &v18;
  v13 = (id)objc_msgSend(v12, "addCompletionBlock:", v17);
  v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v14;
}

void __94__MTAlarmManager_nextAlarmsInRangeSync_maxCount_includeSleepAlarm_includeBedtimeNotification___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)sleepAlarmSync
{
  MTAlarmCache *cache;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  cache = self->_cache;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__MTAlarmManager_sleepAlarmSync__block_invoke;
  v5[3] = &unk_1E39CE400;
  v5[4] = &v6;
  -[MTAlarmCache getCachedAlarmsSyncWithCompletion:](cache, "getCachedAlarmsSyncWithCompletion:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __32__MTAlarmManager_sleepAlarmSync__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (!a5)
  {
    objc_msgSend(a3, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (id)sleepAlarmsSync
{
  MTAlarmCache *cache;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  cache = self->_cache;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__MTAlarmManager_sleepAlarmsSync__block_invoke;
  v5[3] = &unk_1E39CE400;
  v5[4] = &v6;
  -[MTAlarmCache getCachedAlarmsSyncWithCompletion:](cache, "getCachedAlarmsSyncWithCompletion:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__MTAlarmManager_sleepAlarmsSync__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v8;
  id v9;

  v8 = a3;
  if (!a5)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v8 = v9;
  }

}

- (id)nextAlarmSync
{
  MTAlarmCache *cache;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  cache = self->_cache;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__MTAlarmManager_nextAlarmSync__block_invoke;
  v5[3] = &unk_1E39CE400;
  v5[4] = &v6;
  -[MTAlarmCache getCachedAlarmsSyncWithCompletion:](cache, "getCachedAlarmsSyncWithCompletion:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__MTAlarmManager_nextAlarmSync__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;

  v8 = a4;
  if (!a5)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a4);
    v8 = v9;
  }

}

- (id)alarmWithIDString:(id)a3
{
  return -[MTAlarmManager alarmWithIDString:includeSleep:](self, "alarmWithIDString:includeSleep:", a3, 0);
}

- (id)alarmWithIDString:(id)a3 includeSleep:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MTAlarmManager alarmsSyncIncludingSleepAlarm:](self, "alarmsSyncIncludingSleepAlarm:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "alarmIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v6);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)_alarmWithIDStringAsync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MTAlarmManager _alarmsIncludingSleepAlarm:doSynchronous:](self, "_alarmsIncludingSleepAlarm:doSynchronous:", 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__MTAlarmManager__alarmWithIDStringAsync___block_invoke;
  v9[3] = &unk_1E39CE428;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __42__MTAlarmManager__alarmWithIDStringAsync___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__MTAlarmManager__alarmWithIDStringAsync___block_invoke_2;
  v8[3] = &unk_1E39CB510;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(a2, "na_firstObjectPassingTest:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D519C0];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimer.MTAlarmManager"), 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithError:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __42__MTAlarmManager__alarmWithIDStringAsync___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "alarmIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (unint64_t)indexForAlarm:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MTAlarmManager alarmsSync](self, "alarmsSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__MTAlarmManager_indexForAlarm___block_invoke;
  v9[3] = &unk_1E39CE450;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __32__MTAlarmManager_indexForAlarm___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "alarmIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alarmIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

- (id)alarmAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[MTAlarmManager alarmsSync](self, "alarmsSync");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (unint64_t)alarmCount
{
  return -[MTAlarmManager alarmCountIncludingSleepAlarm:](self, "alarmCountIncludingSleepAlarm:", 0);
}

- (id)nextSleepAlarm
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_opt_new();
  -[MTAlarmManager connectionProvider](self, "connectionProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__MTAlarmManager_nextSleepAlarm__block_invoke;
  v8[3] = &unk_1E39CE4A0;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performRemoteBlock:withErrorHandler:", v8, v6);

  return v5;
}

void __32__MTAlarmManager_nextSleepAlarm__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__MTAlarmManager_nextSleepAlarm__block_invoke_2;
  v3[3] = &unk_1E39CE478;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "nextSleepAlarmWithCompletion:", v3);

}

uint64_t __32__MTAlarmManager_nextSleepAlarm__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2 | a3)
    return objc_msgSend(v3, "finishWithResult:error:", a2, a3);
  else
    return objc_msgSend(v3, "finishWithNoResult");
}

- (id)addAlarm:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  MTAlarmManager *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "alarmIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ addAlarm:%{public}@", buf, 0x16u);

  }
  v7 = (void *)objc_opt_new();
  MTNewChildActivityForName(0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__MTAlarmManager_addAlarm___block_invoke;
  block[3] = &unk_1E39CB828;
  block[4] = self;
  v15 = v4;
  v9 = v7;
  v16 = v9;
  v10 = v4;
  os_activity_apply(v8, block);

  v11 = v16;
  v12 = v9;

  return v12;
}

void __27__MTAlarmManager_addAlarm___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a1[4], "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markNeedsUpdate");

  objc_msgSend(a1[4], "connectionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__MTAlarmManager_addAlarm___block_invoke_2;
  v6[3] = &unk_1E39CE4C8;
  v7 = a1[5];
  v8 = a1[6];
  objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter", v6[0], 3221225472, __27__MTAlarmManager_addAlarm___block_invoke_2, &unk_1E39CE4C8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performRemoteBlock:withErrorHandler:", v6, v4);

  objc_msgSend(*((id *)a1[4] + 3), "logAlarmAdded:", objc_msgSend(a1[5], "isSleepAlarm"));
  +[MTAlarmManager assistantSyncNotificationName](MTAlarmManager, "assistantSyncNotificationName");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  notify_post((const char *)objc_msgSend(v5, "cStringUsingEncoding:", 4));

}

void __27__MTAlarmManager_addAlarm___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTAlarmManager - Adding Alarm", v7, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAlarm:withCompletion:", v5, v6);

}

- (id)updateAlarm:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  MTAlarmManager *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "alarmIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ updateAlarm:%{public}@", buf, 0x16u);

  }
  v7 = (void *)objc_opt_new();
  MTNewChildActivityForName(1);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MTAlarmManager_updateAlarm___block_invoke;
  block[3] = &unk_1E39CB828;
  block[4] = self;
  v15 = v4;
  v9 = v7;
  v16 = v9;
  v10 = v4;
  os_activity_apply(v8, block);

  v11 = v16;
  v12 = v9;

  return v12;
}

void __30__MTAlarmManager_updateAlarm___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a1[4], "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markNeedsUpdate");

  objc_msgSend(a1[4], "connectionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__MTAlarmManager_updateAlarm___block_invoke_2;
  v6[3] = &unk_1E39CE4C8;
  v7 = a1[5];
  v8 = a1[6];
  objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter", v6[0], 3221225472, __30__MTAlarmManager_updateAlarm___block_invoke_2, &unk_1E39CE4C8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performRemoteBlock:withErrorHandler:", v6, v4);

  objc_msgSend(*((id *)a1[4] + 3), "logAlarmUpdated:", objc_msgSend(a1[5], "isSleepAlarm"));
  +[MTAlarmManager assistantSyncNotificationName](MTAlarmManager, "assistantSyncNotificationName");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  notify_post((const char *)objc_msgSend(v5, "cStringUsingEncoding:", 4));

}

void __30__MTAlarmManager_updateAlarm___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTAlarmManager - Updating Alarm", v7, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateAlarm:withCompletion:", v5, v6);

}

- (id)removeAlarm:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  MTAlarmManager *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "alarmIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removeAlarm:%{public}@", buf, 0x16u);

  }
  v7 = (void *)objc_opt_new();
  MTNewChildActivityForName(2);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MTAlarmManager_removeAlarm___block_invoke;
  block[3] = &unk_1E39CB828;
  block[4] = self;
  v15 = v4;
  v9 = v7;
  v16 = v9;
  v10 = v4;
  os_activity_apply(v8, block);

  v11 = v16;
  v12 = v9;

  return v12;
}

void __30__MTAlarmManager_removeAlarm___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a1[4], "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markNeedsUpdate");

  objc_msgSend(a1[4], "connectionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__MTAlarmManager_removeAlarm___block_invoke_2;
  v6[3] = &unk_1E39CE4C8;
  v7 = a1[5];
  v8 = a1[6];
  objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter", v6[0], 3221225472, __30__MTAlarmManager_removeAlarm___block_invoke_2, &unk_1E39CE4C8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performRemoteBlock:withErrorHandler:", v6, v4);

  objc_msgSend(*((id *)a1[4] + 3), "logAlarmDeleted:", objc_msgSend(a1[5], "isSleepAlarm"));
  +[MTAlarmManager assistantSyncNotificationName](MTAlarmManager, "assistantSyncNotificationName");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  notify_post((const char *)objc_msgSend(v5, "cStringUsingEncoding:", 4));

}

void __30__MTAlarmManager_removeAlarm___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTAlarmManager - Removing Alarm", v7, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAlarm:withCompletion:", v5, v6);

}

- (id)snoozeAlarmWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[MTAlarmManager _alarmWithIDStringAsync:](self, "_alarmWithIDStringAsync:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__MTAlarmManager_snoozeAlarmWithIdentifier___block_invoke;
  v9[3] = &unk_1E39CE4F0;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __44__MTAlarmManager_snoozeAlarmWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(a2, "isSleepAlarm"))
    v4 = 2;
  else
    v4 = 0;
  return objc_msgSend(v2, "snoozeAlarmWithIdentifier:snoozeAction:", v3, v4);
}

- (id)snoozeAlarmWithIdentifier:(id)a3 snoozeAction:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  unint64_t v18;
  uint8_t buf[4];
  MTAlarmManager *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  MTLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ snoozeAlarmWithIdentifier:%{public}@", buf, 0x16u);
  }

  v8 = (void *)objc_opt_new();
  MTNewChildActivityForName(4);
  v9 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__MTAlarmManager_snoozeAlarmWithIdentifier_snoozeAction___block_invoke;
  v15[3] = &unk_1E39CE540;
  v15[4] = self;
  v16 = v6;
  v18 = a4;
  v10 = v8;
  v17 = v10;
  v11 = v6;
  os_activity_apply(v9, v15);

  v12 = v17;
  v13 = v10;

  return v13;
}

void __57__MTAlarmManager_snoozeAlarmWithIdentifier_snoozeAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markNeedsUpdate");

  objc_msgSend(*(id *)(a1 + 32), "connectionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__MTAlarmManager_snoozeAlarmWithIdentifier_snoozeAction___block_invoke_2;
  v8[3] = &unk_1E39CE518;
  v4 = *(id *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v9 = v4;
  v11 = v5;
  v10 = v6;
  objc_msgSend(*(id *)(a1 + 48), "errorOnlyCompletionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performRemoteBlock:withErrorHandler:", v8, v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "logAlarmSnoozeAction:", *(_QWORD *)(a1 + 56));
}

void __57__MTAlarmManager_snoozeAlarmWithIdentifier_snoozeAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTAlarmManager - Snoozing Alarm", v8, 2u);
  }

  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snoozeAlarmWithIdentifier:snoozeAction:withCompletion:", v6, v5, v7);

}

- (id)dismissAlarmWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[MTAlarmManager _alarmWithIDStringAsync:](self, "_alarmWithIDStringAsync:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__MTAlarmManager_dismissAlarmWithIdentifier___block_invoke;
  v9[3] = &unk_1E39CE4F0;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __45__MTAlarmManager_dismissAlarmWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(a2, "isSleepAlarm"))
    v4 = 5;
  else
    v4 = 0;
  return objc_msgSend(v2, "dismissAlarmWithIdentifier:dismissAction:", v3, v4);
}

- (id)dismissAlarmWithIdentifier:(id)a3 dismissAction:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  MTAlarmManager *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  MTLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    MTDismissAlarmActionDescription(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = self;
    v22 = 2114;
    v23 = v6;
    v24 = 2114;
    v25 = v8;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissAlarmWithIdentifier:%{public}@ (%{public}@)", buf, 0x20u);

  }
  v9 = (void *)objc_opt_new();
  MTNewChildActivityForName(3);
  v10 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__MTAlarmManager_dismissAlarmWithIdentifier_dismissAction___block_invoke;
  v16[3] = &unk_1E39CE540;
  v16[4] = self;
  v17 = v6;
  v19 = a4;
  v11 = v9;
  v18 = v11;
  v12 = v6;
  os_activity_apply(v10, v16);

  v13 = v18;
  v14 = v11;

  return v14;
}

void __59__MTAlarmManager_dismissAlarmWithIdentifier_dismissAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markNeedsUpdate");

  objc_msgSend(*(id *)(a1 + 32), "connectionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__MTAlarmManager_dismissAlarmWithIdentifier_dismissAction___block_invoke_2;
  v8[3] = &unk_1E39CE518;
  v4 = *(id *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v9 = v4;
  v11 = v5;
  v10 = v6;
  objc_msgSend(*(id *)(a1 + 48), "errorOnlyCompletionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performRemoteBlock:withErrorHandler:", v8, v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "logAlarmDismissAction:", *(_QWORD *)(a1 + 56));
}

void __59__MTAlarmManager_dismissAlarmWithIdentifier_dismissAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTAlarmManager - Dismissing Alarm", v8, 2u);
  }

  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAlarmWithIdentifier:dismissAction:withCompletion:", v6, v5, v7);

}

- (void)setExportedObject:(id)a3
{
  objc_storeStrong((id *)&self->_exportedObject, a3);
}

- (MTMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (MTAlarmCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_exportedObject, 0);
}

- (id)updateSleepAlarms
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  MTNewChildActivityForName(1);
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__MTAlarmManager_Sleep__updateSleepAlarms__block_invoke;
  v9[3] = &unk_1E39CB7B0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  os_activity_apply(v4, v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __42__MTAlarmManager_Sleep__updateSleepAlarms__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "connectionProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__MTAlarmManager_Sleep__updateSleepAlarms__block_invoke_2;
  v4[3] = &unk_1E39CE4A0;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performRemoteBlock:withErrorHandler:", v4, v3);

}

void __42__MTAlarmManager_Sleep__updateSleepAlarms__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTAlarmManager - Refreshing Sleep Alarms", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "errorOnlyCompletionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateSleepAlarmsWithCompletion:", v5);

}

- (id)resetSleepAlarmSnoozeState
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  MTNewChildActivityForName(1);
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__MTAlarmManager_Sleep__resetSleepAlarmSnoozeState__block_invoke;
  v9[3] = &unk_1E39CB7B0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  os_activity_apply(v4, v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __51__MTAlarmManager_Sleep__resetSleepAlarmSnoozeState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "connectionProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__MTAlarmManager_Sleep__resetSleepAlarmSnoozeState__block_invoke_2;
  v4[3] = &unk_1E39CE4A0;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performRemoteBlock:withErrorHandler:", v4, v3);

}

void __51__MTAlarmManager_Sleep__resetSleepAlarmSnoozeState__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTAlarmManager - Resetting Sleep Alarms Snooze State", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "errorOnlyCompletionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetSleepAlarmSnoozeStateWithCompletion:", v5);

}

- (id)nextExpectedRefreshDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MTAlarmManager nextWidgetAlarmInThreshold](self, "nextWidgetAlarmInThreshold");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MTAlarmManager nextFutureAlarmDate](self, "nextFutureAlarmDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 32, -20, v5, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (id)nextWidgetAlarmInThreshold
{
  return -[MTAlarmManager nextAlarmInHoursThreshold:](self, "nextAlarmInHoursThreshold:", 20);
}

- (id)nextAlarmInHoursThreshold:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 32, a3, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithStartDate:endDate:", v9, v7);

  -[MTAlarmManager nextAlarmsInRangeSync:maxCount:includeSleepAlarm:](self, "nextAlarmsInRangeSync:maxCount:includeSleepAlarm:", v10, 1, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)nextFutureAlarmDate
{
  void *v2;
  void *v3;

  -[MTAlarmManager nextAlarmInHoursThreshold:](self, "nextAlarmInHoursThreshold:", 168);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextFireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __27__MTAlarmManager_reconnect__block_invoke_40_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%{public}@ error while reconnecting: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
