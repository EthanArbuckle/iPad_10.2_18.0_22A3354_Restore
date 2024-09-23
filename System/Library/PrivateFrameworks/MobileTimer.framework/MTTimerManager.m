@implementation MTTimerManager

uint64_t __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_3;
  v3[3] = &unk_1E39CDDB0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "getTimersWithCompletion:", v3);

}

uint64_t __49__MTTimerManager_loadAllDurationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "getTimerDurationsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __57__MTTimerManager__getCachedTimersWithFuture_finishBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __24__MTTimerManager_timers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2);
}

- (id)timers
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
  v8[2] = __24__MTTimerManager_timers__block_invoke;
  v8[3] = &unk_1E39CDE68;
  v4 = v3;
  v9 = v4;
  v5 = (void *)MEMORY[0x19AED0080](v8);
  -[MTTimerManager _getCachedTimersWithFuture:finishBlock:](self, "_getCachedTimersWithFuture:finishBlock:", v4, v5);
  v6 = v4;

  return v6;
}

- (void)_getCachedTimersWithFuture:(id)a3 finishBlock:(id)a4
{
  id v5;
  MTTimerCache *cache;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  cache = self->_cache;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__MTTimerManager__getCachedTimersWithFuture_finishBlock___block_invoke;
  v8[3] = &unk_1E39CDDB0;
  v9 = v5;
  v7 = v5;
  -[MTTimerCache getCachedTimersWithCompletion:](cache, "getCachedTimersWithCompletion:", v8);

}

void __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  v12[2] = __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_2;
  v12[3] = &unk_1E39CDDD8;
  v13 = v5;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_4;
  v10[3] = &unk_1E39CB4E8;
  v11 = v13;
  v9 = v13;
  objc_msgSend(v7, "performRemoteBlock:withErrorHandler:isSynchronous:", v12, v10, a3);

}

- (void)loadAllDurationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[MTTimerManager connectionProvider](self, "connectionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__MTTimerManager_loadAllDurationsWithCompletion___block_invoke;
  v10[3] = &unk_1E39CDDD8;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __49__MTTimerManager_loadAllDurationsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E39CB4E8;
  v9 = v11;
  v7 = v11;
  objc_msgSend(v5, "performRemoteBlock:withErrorHandler:", v10, v8);

}

- (MTXPCConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  void (**v8)(id, MTTimerManager *);
  id v9;
  id v10;
  MTTimerManager *v11;
  NSObject *v12;
  MTTimerManagerExportedObject *v13;
  MTTimerManagerExportedObject *exportedObject;
  uint64_t v15;
  MTXPCConnectionProvider *connectionProvider;
  void *v17;
  MTTimerCache *v18;
  uint64_t v19;
  MTTimerCache *cache;
  _QWORD v22[4];
  id v23;
  objc_super v24;
  uint8_t buf[4];
  MTTimerManager *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, MTTimerManager *))a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MTTimerManager;
  v11 = -[MTTimerManager init](&v24, sel_init);
  if (v11)
  {
    MTLogForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    objc_storeStrong((id *)&v11->_notificationCenter, a5);
    v13 = -[MTTimerManagerExportedObject initWithTimerManager:]([MTTimerManagerExportedObject alloc], "initWithTimerManager:", v11);
    exportedObject = v11->_exportedObject;
    v11->_exportedObject = v13;

    objc_storeStrong((id *)&v11->_metrics, a4);
    v8[2](v8, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    connectionProvider = v11->_connectionProvider;
    v11->_connectionProvider = (MTXPCConnectionProvider *)v15;

    +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerNotification:observer:", CFSTR("MTTimerManagerPreferencesChanged"), v11);

    objc_initWeak((id *)buf, v11);
    v18 = [MTTimerCache alloc];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke;
    v22[3] = &unk_1E39CDE00;
    objc_copyWeak(&v23, (id *)buf);
    v19 = -[MTTimerCache initWithUpdateBlock:](v18, "initWithUpdateBlock:", v22);
    cache = v11->_cache;
    v11->_cache = (MTTimerCache *)v19;

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

  return v11;
}

id __34__MTTimerManager_initWithMetrics___block_invoke(uint64_t a1, void *a2)
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
  MTTimerServerInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MTTimerClientInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTXPCConnectionInfo infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:](MTXPCConnectionInfo, "infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:", CFSTR("com.apple.MobileTimer.timerserver"), v3, v4, v5, CFSTR("com.apple.MTTimerServer.wakeup"), 0, 4096);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v2);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__MTTimerManager_initWithMetrics___block_invoke_2;
  v9[3] = &unk_1E39CBC38;
  objc_copyWeak(&v10, &location);
  +[MTXPCConnectionProvider providerWithConnectionInfo:reconnectHandler:](MTXPCConnectionProvider, "providerWithConnectionInfo:reconnectHandler:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

- (MTTimerManagerExportedObject)exportedObject
{
  return self->_exportedObject;
}

- (MTTimerManager)init
{
  MTMetrics *v3;
  MTTimerManager *v4;

  v3 = objc_alloc_init(MTMetrics);
  v4 = -[MTTimerManager initWithMetrics:](self, "initWithMetrics:", v3);

  return v4;
}

- (MTTimerManager)initWithMetrics:(id)a3
{
  return (MTTimerManager *)-[MTTimerManager _initWithConnectionProvidingBlock:metrics:](self, "_initWithConnectionProvidingBlock:metrics:", &__block_literal_global_32, a3);
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
  v10 = -[MTTimerManager _initWithConnectionProvidingBlock:metrics:notificationCenter:](self, "_initWithConnectionProvidingBlock:metrics:notificationCenter:", v8, v7, v9);

  return v10;
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
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = a1;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ warming...", (uint8_t *)&v6, 0xCu);
  }

  v4 = MTTimerServerInterface();
  v5 = MTTimerClientInterface();
}

+ (double)defaultDuration
{
  void *v2;
  float v3;
  float v4;
  double result;
  float v6;
  char v7;

  v7 = 0;
  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:exists:", CFSTR("MTTimerDefaultDuration"), &v7);
  v4 = v3;

  result = 900.0;
  if (v7 && v4 != 0.0)
  {
    v6 = floorf(v4);
    if (v6 < 1.0)
      v6 = 1.0;
    return fminf(v6, 86399.0);
  }
  return result;
}

+ (void)setDefaultDuration:(double)a3
{
  NSObject *v4;
  float v5;
  void *v6;
  double v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = objc_opt_class();
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ setting default duration to %f", (uint8_t *)&v8, 0x16u);
  }

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a3;
  *(float *)&v7 = v5;
  objc_msgSend(v6, "setFloat:forKey:notification:", CFSTR("MTTimerDefaultDuration"), CFSTR("MTTimerManagerPreferencesChanged"), v7);

}

void __34__MTTimerManager_initWithMetrics___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reconnect");

}

- (MTTimerManager)initWithConnectionProvider:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  MTTimerManager *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__MTTimerManager_initWithConnectionProvider_metrics___block_invoke;
  v10[3] = &unk_1E39CDD88;
  v11 = v6;
  v7 = v6;
  v8 = -[MTTimerManager _initWithConnectionProvidingBlock:metrics:](self, "_initWithConnectionProvidingBlock:metrics:", v10, a4);

  return v8;
}

id __53__MTTimerManager_initWithConnectionProvider_metrics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (MTTimerManager)initWithConnectionProvider:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  id v8;
  id v9;
  MTTimerManager *v10;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__MTTimerManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke;
  v12[3] = &unk_1E39CDD88;
  v13 = v8;
  v9 = v8;
  v10 = -[MTTimerManager _initWithConnectionProvidingBlock:metrics:notificationCenter:](self, "_initWithConnectionProvidingBlock:metrics:notificationCenter:", v12, a4, a5);

  return v10;
}

id __72__MTTimerManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MTTimerManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  -[MTXPCConnectionProvider invalidate](self->_connectionProvider, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)MTTimerManager;
  -[MTTimerManager dealloc](&v4, sel_dealloc);
}

- (void)reconnect
{
  void *v3;
  id v4;

  -[MTTimerManager cache](self, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markNeedsUpdate");

  -[MTTimerManager connectionProvider](self, "connectionProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performRemoteBlock:withErrorHandler:", &__block_literal_global_47, 0);

}

uint64_t __27__MTTimerManager_reconnect__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "checkIn");
}

- (id)nextTimer
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
  v8[2] = __27__MTTimerManager_nextTimer__block_invoke;
  v8[3] = &unk_1E39CDE68;
  v4 = v3;
  v9 = v4;
  v5 = (void *)MEMORY[0x19AED0080](v8);
  -[MTTimerManager _getCachedTimersWithFuture:finishBlock:](self, "_getCachedTimersWithFuture:finishBlock:", v4, v5);
  v6 = v4;

  return v6;
}

uint64_t __27__MTTimerManager_nextTimer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (a3 | a4)
    return objc_msgSend(v4, "finishWithResult:error:");
  else
    return objc_msgSend(v4, "finishWithNoResult");
}

- (id)timerWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[MTTimerManager timers](self, "timers", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flatMap:", &__block_literal_global_50_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __38__MTTimerManager_timerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "na_firstObjectPassingTest:", &__block_literal_global_52_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __38__MTTimerManager_timerWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentTimer");
}

- (id)timersSync
{
  MTTimerCache *cache;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  cache = self->_cache;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__MTTimerManager_timersSync__block_invoke;
  v5[3] = &unk_1E39CDEF0;
  v5[4] = self;
  v5[5] = &v6;
  -[MTTimerCache getCachedTimersSyncWithCompletion:](cache, "getCachedTimersSyncWithCompletion:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__MTTimerManager_timersSync__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  if (v6)
  {
    MTLogForCategory(4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __28__MTTimerManager_timersSync__block_invoke_cold_1(a1, (uint64_t)v6, v7);

  }
  else
  {
    v8 = objc_msgSend(a2, "copy");
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (id)nextTimersForDate:(id)a3 maxCount:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  unint64_t v20;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 30, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerManager timers](self, "timers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__MTTimerManager_nextTimersForDate_maxCount___block_invoke;
  v16[3] = &unk_1E39CDF40;
  v17 = v6;
  v18 = v7;
  v19 = v9;
  v20 = a4;
  v11 = v9;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v10, "flatMap:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __45__MTTimerManager_nextTimersForDate_maxCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__MTTimerManager_nextTimersForDate_maxCount___block_invoke_2;
  v8[3] = &unk_1E39CDF18;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = v4;
  v13 = *(_QWORD *)(a1 + 56);
  v5 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __45__MTTimerManager_nextTimersForDate_maxCount___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "state") == 3)
  {
    objc_msgSend(v10, "nextTriggerAfterDate:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "triggerDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "components:fromDate:", 30, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "dateFromComponents:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1 + 48), "isEqualToDate:", v9))
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);

    }
    else
    {
      NSLog(CFSTR("Timer is running but doesn't have a next trigger."));
    }

  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 56), "count") >= *(_QWORD *)(a1 + 64))
    *a4 = 1;

}

- (id)addTimer:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  MTTimerManager *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MTLogForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "timerIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ addTimer:%{public}@", buf, 0x16u);

  }
  if (!objc_msgSend(v5, "state"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTTimerManager.m"), 293, CFSTR("State can't be unknown"));

  }
  v8 = (void *)objc_opt_new();
  MTNewChildActivityForName(12);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__MTTimerManager_addTimer___block_invoke;
  block[3] = &unk_1E39CB828;
  block[4] = self;
  v17 = v5;
  v10 = v8;
  v18 = v10;
  v11 = v5;
  os_activity_apply(v9, block);

  v12 = v18;
  v13 = v10;

  return v13;
}

void __27__MTTimerManager_addTimer___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(a1[4], "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markNeedsUpdate");

  objc_msgSend(a1[4], "connectionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__MTTimerManager_addTimer___block_invoke_2;
  v5[3] = &unk_1E39CDF68;
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter", v5[0], 3221225472, __27__MTTimerManager_addTimer___block_invoke_2, &unk_1E39CDF68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performRemoteBlock:withErrorHandler:", v5, v4);

  objc_msgSend(*((id *)a1[4] + 3), "logTimerAdded");
}

void __27__MTTimerManager_addTimer___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTTimerManager - Adding Timer", v7, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTimer:withCompletion:", v5, v6);

}

- (id)_updateTimer:(id)a3 doSynchronous:(BOOL)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  BOOL v21;
  uint8_t buf[4];
  MTTimerManager *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  MTLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "timerIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v9;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ updateTimer:%{public}@", buf, 0x16u);

  }
  if (!objc_msgSend(v7, "state"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTTimerManager.m"), 315, CFSTR("State can't be unknown"));

  }
  v10 = (void *)objc_opt_new();
  MTNewChildActivityForName(13);
  v11 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __45__MTTimerManager__updateTimer_doSynchronous___block_invoke;
  v18[3] = &unk_1E39CDF90;
  v18[4] = self;
  v19 = v7;
  v12 = v10;
  v20 = v12;
  v21 = a4;
  v13 = v7;
  os_activity_apply(v11, v18);

  v14 = v20;
  v15 = v12;

  return v15;
}

void __45__MTTimerManager__updateTimer_doSynchronous___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markNeedsUpdate");

  objc_msgSend(*(id *)(a1 + 32), "connectionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__MTTimerManager__updateTimer_doSynchronous___block_invoke_2;
  v5[3] = &unk_1E39CDF68;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 48), "errorOnlyCompletionHandlerAdapter", v5[0], 3221225472, __45__MTTimerManager__updateTimer_doSynchronous___block_invoke_2, &unk_1E39CDF68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performRemoteBlock:withErrorHandler:isSynchronous:", v5, v4, *(unsigned __int8 *)(a1 + 56));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "logTimerUpdated");
}

void __45__MTTimerManager__updateTimer_doSynchronous___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTTimerManager - Updating Timer", v7, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateTimer:withCompletion:", v5, v6);

}

- (id)updateTimer:(id)a3
{
  return -[MTTimerManager _updateTimer:doSynchronous:](self, "_updateTimer:doSynchronous:", a3, 0);
}

- (id)removeTimer:(id)a3
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
  MTTimerManager *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "timerIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removeTimer:%{public}@", buf, 0x16u);

  }
  v7 = (void *)objc_opt_new();
  MTNewChildActivityForName(14);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MTTimerManager_removeTimer___block_invoke;
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

void __30__MTTimerManager_removeTimer___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(a1[4], "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markNeedsUpdate");

  objc_msgSend(a1[4], "connectionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__MTTimerManager_removeTimer___block_invoke_2;
  v5[3] = &unk_1E39CDF68;
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter", v5[0], 3221225472, __30__MTTimerManager_removeTimer___block_invoke_2, &unk_1E39CDF68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performRemoteBlock:withErrorHandler:", v5, v4);

  objc_msgSend(*((id *)a1[4] + 3), "logTimerDeleted");
}

void __30__MTTimerManager_removeTimer___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTTimerManager - Removing Timer", v7, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTimer:withCompletion:", v5, v6);

}

- (id)dismissTimerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  MTTimerManager *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissTimerWithIdentifier:%{public}@", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new();
  MTNewChildActivityForName(15);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MTTimerManager_dismissTimerWithIdentifier___block_invoke;
  block[3] = &unk_1E39CB828;
  block[4] = self;
  v14 = v4;
  v8 = v6;
  v15 = v8;
  v9 = v4;
  os_activity_apply(v7, block);

  v10 = v15;
  v11 = v8;

  return v11;
}

void __45__MTTimerManager_dismissTimerWithIdentifier___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(a1[4], "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markNeedsUpdate");

  objc_msgSend(a1[4], "connectionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__MTTimerManager_dismissTimerWithIdentifier___block_invoke_2;
  v5[3] = &unk_1E39CDF68;
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter", v5[0], 3221225472, __45__MTTimerManager_dismissTimerWithIdentifier___block_invoke_2, &unk_1E39CDF68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performRemoteBlock:withErrorHandler:", v5, v4);

  objc_msgSend(*((id *)a1[4] + 3), "logTimerDismissed");
}

void __45__MTTimerManager_dismissTimerWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTTimerManager - Dismissing Timer", v7, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissTimerWithIdentifier:withCompletion:", v5, v6);

}

- (id)repeatTimerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  MTTimerManager *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ repeatTimerWithIdentifier:%{public}@", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new();
  MTNewChildActivityForName(16);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MTTimerManager_repeatTimerWithIdentifier___block_invoke;
  block[3] = &unk_1E39CB828;
  block[4] = self;
  v14 = v4;
  v8 = v6;
  v15 = v8;
  v9 = v4;
  os_activity_apply(v7, block);

  v10 = v15;
  v11 = v8;

  return v11;
}

void __44__MTTimerManager_repeatTimerWithIdentifier___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(a1[4], "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markNeedsUpdate");

  objc_msgSend(a1[4], "connectionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__MTTimerManager_repeatTimerWithIdentifier___block_invoke_2;
  v5[3] = &unk_1E39CDF68;
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter", v5[0], 3221225472, __44__MTTimerManager_repeatTimerWithIdentifier___block_invoke_2, &unk_1E39CDF68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performRemoteBlock:withErrorHandler:", v5, v4);

  objc_msgSend(*((id *)a1[4] + 3), "logTimerRepeated");
}

void __44__MTTimerManager_repeatTimerWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTTimerManager - Repeating Timer", v7, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repeatTimerWithIdentifier:withCompletion:", v5, v6);

}

- (id)currentTimer
{
  void *v2;
  void *v3;

  -[MTTimerManager timers](self, "timers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flatMap:", &__block_literal_global_63);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __30__MTTimerManager_currentTimer__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[MTTimer currentTimerFromTimers:](MTTimer, "currentTimerFromTimers:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_updateCurrentTimerWithState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v9;
  _QWORD v10[6];

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTTimerManager.m"), 414, CFSTR("State can't be unknown"));

  }
  -[MTTimerManager currentTimer](self, "currentTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__MTTimerManager__updateCurrentTimerWithState___block_invoke;
  v10[3] = &unk_1E39CDFD8;
  v10[4] = self;
  v10[5] = a3;
  objc_msgSend(v5, "flatMap:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __47__MTTimerManager__updateCurrentTimerWithState___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "timerByUpdatingWithState:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTimer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)stopCurrentTimer
{
  return -[MTTimerManager _updateCurrentTimerWithState:](self, "_updateCurrentTimerWithState:", 1);
}

- (id)pauseCurrentTimer
{
  return -[MTTimerManager _updateCurrentTimerWithState:](self, "_updateCurrentTimerWithState:", 2);
}

- (id)resumeCurrentTimer
{
  return -[MTTimerManager _updateCurrentTimerWithState:](self, "_updateCurrentTimerWithState:", 3);
}

- (id)_validateCanStartTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "timerIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ cannot restart a timer (%@) that isn't stopped."), self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTTimerManager"), 1, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    MTLogForCategory(4);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MTTimerManager _validateCanStartTimer:].cold.1((uint64_t)v8, v11);

  }
  return v5;
}

- (id)_runningTimerFromCurrentTimer:(id)a3 withDuration:(double)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v5, "setDuration:", a4);
  objc_msgSend(v5, "setState:", 3);
  return v5;
}

- (id)startCurrentTimerWithDuration:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v8[6];

  -[MTTimerManager currentTimer](self, "currentTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MTTimerManager_startCurrentTimerWithDuration___block_invoke;
  v8[3] = &unk_1E39CDFD8;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __48__MTTimerManager_startCurrentTimerWithDuration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_validateCanStartTimer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "_runningTimerFromCurrentTimer:withDuration:", v3, *(double *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateTimer:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)getCurrentTimerSync
{
  void *v2;
  void *v3;

  -[MTTimerManager timersSync](self, "timersSync");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTTimer currentTimerFromTimers:](MTTimer, "currentTimerFromTimers:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)startCurrentTimerWithDurationSync:(double)a3
{
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  -[MTTimerManager getCurrentTimerSync](self, "getCurrentTimerSync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerManager _validateCanStartTimer:](self, "_validateCanStartTimer:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 0;
    *((_BYTE *)v16 + 24) = 0;
  }
  else
  {
    -[MTTimerManager _runningTimerFromCurrentTimer:withDuration:](self, "_runningTimerFromCurrentTimer:withDuration:", v6, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimerManager _updateTimer:doSynchronous:](self, "_updateTimer:doSynchronous:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isFinished") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTTimerManager.m"), 490, CFSTR("Start timer isn't finished, but expected it to be"));

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__MTTimerManager_startCurrentTimerWithDurationSync___block_invoke;
    v14[3] = &unk_1E39CE000;
    v14[4] = &v15;
    v11 = (id)objc_msgSend(v10, "addCompletionBlock:", v14);

    v8 = *((_BYTE *)v16 + 24) != 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __52__MTTimerManager_startCurrentTimerWithDurationSync___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3 == 0;
  return result;
}

- (BOOL)_updateCurrentTimerWithStateSync:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTTimerManager.m"), 501, CFSTR("State can't be unknown"));

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  -[MTTimerManager getCurrentTimerSync](self, "getCurrentTimerSync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timerByUpdatingWithState:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerManager _updateTimer:doSynchronous:](self, "_updateTimer:doSynchronous:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isFinished") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTTimerManager.m"), 507, CFSTR("Update Timer isn't finished, but expected it to be"));

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__MTTimerManager__updateCurrentTimerWithStateSync___block_invoke;
  v14[3] = &unk_1E39CE000;
  v14[4] = &v15;
  v9 = (id)objc_msgSend(v8, "addCompletionBlock:", v14);
  v10 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __51__MTTimerManager__updateCurrentTimerWithStateSync___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3 == 0;
  return result;
}

- (BOOL)stopCurrentTimerSync
{
  return -[MTTimerManager _updateCurrentTimerWithStateSync:](self, "_updateCurrentTimerWithStateSync:", 1);
}

- (BOOL)pauseCurrentTimerSync
{
  return -[MTTimerManager _updateCurrentTimerWithStateSync:](self, "_updateCurrentTimerWithStateSync:", 2);
}

- (BOOL)resumeCurrentTimerSync
{
  return -[MTTimerManager _updateCurrentTimerWithStateSync:](self, "_updateCurrentTimerWithStateSync:", 3);
}

uint64_t __49__MTTimerManager_loadAllDurationsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)recentDurations
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__MTTimerManager_recentDurations__block_invoke;
  v9[3] = &unk_1E39CE028;
  v4 = v3;
  v10 = v4;
  v5 = (void *)MEMORY[0x19AED0080](v9);
  v6 = -[MTTimerManager getQueryDurations:withFuture:](self, "getQueryDurations:withFuture:", v5, v4);
  v7 = v4;

  return v7;
}

uint64_t __33__MTTimerManager_recentDurations__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a6);
}

- (id)getQueryDurations:(id)a3 withFuture:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  -[MTTimerManager connectionProvider](self, "connectionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__MTTimerManager_getQueryDurations_withFuture___block_invoke;
  v12[3] = &unk_1E39CDDD8;
  v13 = v6;
  v9 = v6;
  objc_msgSend(v7, "errorOnlyCompletionHandlerAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performRemoteBlock:withErrorHandler:", v12, v10);

  return v7;
}

uint64_t __47__MTTimerManager_getQueryDurations_withFuture___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "getTimerDurationsWithCompletion:", *(_QWORD *)(a1 + 32));
}

- (id)addRecentDuration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  id v15;
  id v16;
  uint8_t buf[4];
  MTTimerManager *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ addRecentDuration: %{public}@", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new();
  -[MTTimerManager connectionProvider](self, "connectionProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = v4;
  v8 = v6;
  v16 = v8;
  v9 = v4;
  objc_msgSend(v8, "errorOnlyCompletionHandlerAdapter", v14, 3221225472, __36__MTTimerManager_addRecentDuration___block_invoke, &unk_1E39CDF68);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performRemoteBlock:withErrorHandler:", &v14, v10);

  v11 = v16;
  v12 = v8;

  return v12;
}

void __36__MTTimerManager_addRecentDuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "errorOnlyCompletionHandlerAdapter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addRecentDuration:withCompletion:", v2, v5);

}

- (id)removeRecentDuration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  id v15;
  id v16;
  uint8_t buf[4];
  MTTimerManager *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removeRecentDuration: %{public}@", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new();
  -[MTTimerManager connectionProvider](self, "connectionProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = v4;
  v8 = v6;
  v16 = v8;
  v9 = v4;
  objc_msgSend(v8, "errorOnlyCompletionHandlerAdapter", v14, 3221225472, __39__MTTimerManager_removeRecentDuration___block_invoke, &unk_1E39CDF68);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performRemoteBlock:withErrorHandler:", &v14, v10);

  v11 = v16;
  v12 = v8;

  return v12;
}

void __39__MTTimerManager_removeRecentDuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "errorOnlyCompletionHandlerAdapter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeRecentDuration:withCompletion:", v2, v5);

}

- (id)defaultDurations
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  MTTimerManager *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ running query for default durations", buf, 0xCu);
  }

  v4 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__MTTimerManager_defaultDurations__block_invoke;
  v10[3] = &unk_1E39CE028;
  v5 = v4;
  v11 = v5;
  v6 = (void *)MEMORY[0x19AED0080](v10);
  v7 = -[MTTimerManager getQueryDurations:withFuture:](self, "getQueryDurations:withFuture:", v6, v5);
  v8 = v5;

  return v8;
}

uint64_t __34__MTTimerManager_defaultDurations__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a4, a6);
}

- (id)favoriteDurations
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  MTTimerManager *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ running query for favorite durations", buf, 0xCu);
  }

  v4 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__MTTimerManager_favoriteDurations__block_invoke;
  v10[3] = &unk_1E39CE028;
  v5 = v4;
  v11 = v5;
  v6 = (void *)MEMORY[0x19AED0080](v10);
  v7 = -[MTTimerManager getQueryDurations:withFuture:](self, "getQueryDurations:withFuture:", v6, v5);
  v8 = v5;

  return v8;
}

uint64_t __35__MTTimerManager_favoriteDurations__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a3, a6);
}

- (id)addFavoriteDuration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  id v15;
  id v16;
  uint8_t buf[4];
  MTTimerManager *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ addFavoriteDuration: %{public}@", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new();
  -[MTTimerManager connectionProvider](self, "connectionProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = v4;
  v8 = v6;
  v16 = v8;
  v9 = v4;
  objc_msgSend(v8, "errorOnlyCompletionHandlerAdapter", v14, 3221225472, __38__MTTimerManager_addFavoriteDuration___block_invoke, &unk_1E39CDF68);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performRemoteBlock:withErrorHandler:", &v14, v10);

  v11 = v16;
  v12 = v8;

  return v12;
}

void __38__MTTimerManager_addFavoriteDuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "errorOnlyCompletionHandlerAdapter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addFavoriteDuration:withCompletion:", v2, v5);

}

- (id)removeFavoriteDuration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  id v15;
  id v16;
  uint8_t buf[4];
  MTTimerManager *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removeFavoriteDuration: %{public}@", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new();
  -[MTTimerManager connectionProvider](self, "connectionProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = v4;
  v8 = v6;
  v16 = v8;
  v9 = v4;
  objc_msgSend(v8, "errorOnlyCompletionHandlerAdapter", v14, 3221225472, __41__MTTimerManager_removeFavoriteDuration___block_invoke, &unk_1E39CDF68);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performRemoteBlock:withErrorHandler:", &v14, v10);

  v11 = v16;
  v12 = v8;

  return v12;
}

void __41__MTTimerManager_removeFavoriteDuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "errorOnlyCompletionHandlerAdapter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFavoriteDuration:withCompletion:", v2, v5);

}

- (id)latestDuration
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  MTTimerManager *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ running query for latest duration", buf, 0xCu);
  }

  v4 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__MTTimerManager_latestDuration__block_invoke;
  v10[3] = &unk_1E39CE028;
  v5 = v4;
  v11 = v5;
  v6 = (void *)MEMORY[0x19AED0080](v10);
  v7 = -[MTTimerManager getQueryDurations:withFuture:](self, "getQueryDurations:withFuture:", v6, v5);
  v8 = v5;

  return v8;
}

uint64_t __32__MTTimerManager_latestDuration__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a5, a6);
}

- (id)saveLatestDuration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  id v15;
  id v16;
  uint8_t buf[4];
  MTTimerManager *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ saveLatestDuration: %{public}@", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new();
  -[MTTimerManager connectionProvider](self, "connectionProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = v4;
  v8 = v6;
  v16 = v8;
  v9 = v4;
  objc_msgSend(v8, "errorOnlyCompletionHandlerAdapter", v14, 3221225472, __37__MTTimerManager_saveLatestDuration___block_invoke, &unk_1E39CDF68);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performRemoteBlock:withErrorHandler:", &v14, v10);

  v11 = v16;
  v12 = v8;

  return v12;
}

void __37__MTTimerManager_saveLatestDuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "errorOnlyCompletionHandlerAdapter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveLatestDuration:withCompletion:", v2, v5);

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

- (MTTimerCache)cache
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

void __28__MTTimerManager_timersSync__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%{public}@ Error getting timers:%{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_validateCanStartTimer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end
