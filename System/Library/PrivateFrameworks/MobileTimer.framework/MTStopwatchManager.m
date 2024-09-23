@implementation MTStopwatchManager

- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  void (**v8)(id, MTStopwatchManager *);
  id v9;
  id v10;
  MTStopwatchManager *v11;
  NSObject *v12;
  MTStopwatchManagerExportedObject *v13;
  MTStopwatchManagerExportedObject *exportedObject;
  uint64_t v15;
  MTXPCConnectionProvider *connectionProvider;
  objc_super v18;
  uint8_t buf[4];
  MTStopwatchManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, MTStopwatchManager *))a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MTStopwatchManager;
  v11 = -[MTStopwatchManager init](&v18, sel_init);
  if (v11)
  {
    MTLogForCategory(5);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    objc_storeStrong((id *)&v11->_notificationCenter, a5);
    v13 = -[MTStopwatchManagerExportedObject initWithStopwatchManager:]([MTStopwatchManagerExportedObject alloc], "initWithStopwatchManager:", v11);
    exportedObject = v11->_exportedObject;
    v11->_exportedObject = v13;

    objc_storeStrong((id *)&v11->_metrics, a4);
    v8[2](v8, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    connectionProvider = v11->_connectionProvider;
    v11->_connectionProvider = (MTXPCConnectionProvider *)v15;

  }
  return v11;
}

id __38__MTStopwatchManager_initWithMetrics___block_invoke(uint64_t a1, void *a2)
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
  MTStopwatchServerInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MTStopwatchClientInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTXPCConnectionInfo infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:](MTXPCConnectionInfo, "infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:", CFSTR("com.apple.MobileTimer.stopwatchserver"), v3, v4, v5, CFSTR("com.apple.MTStopwatchServer.wakeup"), 0, 4096);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v2);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__MTStopwatchManager_initWithMetrics___block_invoke_2;
  v9[3] = &unk_1E39CBC38;
  objc_copyWeak(&v10, &location);
  +[MTXPCConnectionProvider providerWithConnectionInfo:reconnectHandler:](MTXPCConnectionProvider, "providerWithConnectionInfo:reconnectHandler:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

- (MTStopwatchManagerExportedObject)exportedObject
{
  return self->_exportedObject;
}

- (MTStopwatchManager)init
{
  MTMetrics *v3;
  MTStopwatchManager *v4;

  v3 = objc_alloc_init(MTMetrics);
  v4 = -[MTStopwatchManager initWithMetrics:](self, "initWithMetrics:", v3);

  return v4;
}

- (MTStopwatchManager)initWithMetrics:(id)a3
{
  return (MTStopwatchManager *)-[MTStopwatchManager _initWithConnectionProvidingBlock:metrics:](self, "_initWithConnectionProvidingBlock:metrics:", &__block_literal_global_9, a3);
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
  v10 = -[MTStopwatchManager _initWithConnectionProvidingBlock:metrics:notificationCenter:](self, "_initWithConnectionProvidingBlock:metrics:notificationCenter:", v8, v7, v9);

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
  MTLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = a1;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ warming...", (uint8_t *)&v6, 0xCu);
  }

  v4 = MTStopwatchServerInterface();
  v5 = MTStopwatchClientInterface();
}

void __38__MTStopwatchManager_initWithMetrics___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reconnect");

}

- (MTStopwatchManager)initWithConnectionProvider:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  MTStopwatchManager *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__MTStopwatchManager_initWithConnectionProvider_metrics___block_invoke;
  v10[3] = &unk_1E39CBC60;
  v11 = v6;
  v7 = v6;
  v8 = -[MTStopwatchManager _initWithConnectionProvidingBlock:metrics:](self, "_initWithConnectionProvidingBlock:metrics:", v10, a4);

  return v8;
}

id __57__MTStopwatchManager_initWithConnectionProvider_metrics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (MTStopwatchManager)initWithConnectionProvider:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  id v8;
  id v9;
  MTStopwatchManager *v10;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__MTStopwatchManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke;
  v12[3] = &unk_1E39CBC60;
  v13 = v8;
  v9 = v8;
  v10 = -[MTStopwatchManager _initWithConnectionProvidingBlock:metrics:notificationCenter:](self, "_initWithConnectionProvidingBlock:metrics:notificationCenter:", v12, a4, a5);

  return v10;
}

id __76__MTStopwatchManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (MTStopwatchManager)initWithoutXpc:(BOOL)a3
{
  void *v4;
  MTStopwatchManager *v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MTStopwatchManager initWithConnectionProvider:metrics:notificationCenter:](self, "initWithConnectionProvider:metrics:notificationCenter:", 0, 0, v4);

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MTStopwatchManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  -[MTXPCConnectionProvider invalidate](self->_connectionProvider, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)MTStopwatchManager;
  -[MTStopwatchManager dealloc](&v4, sel_dealloc);
}

- (void)reconnect
{
  id v2;

  -[MTStopwatchManager connectionProvider](self, "connectionProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performRemoteBlock:withErrorHandler:", &__block_literal_global_38, 0);

}

uint64_t __31__MTStopwatchManager_reconnect__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "checkIn");
}

- (id)createStopwatch:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  MTStopwatchManager *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ createStopwatch:%{public}@", buf, 0x16u);

  }
  v7 = (void *)objc_opt_new();
  -[MTStopwatchManager connectionProvider](self, "connectionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = v4;
  v9 = v7;
  v17 = v9;
  v10 = v4;
  objc_msgSend(v9, "errorOnlyCompletionHandlerAdapter", v15, 3221225472, __38__MTStopwatchManager_createStopwatch___block_invoke, &unk_1E39CBCC8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performRemoteBlock:withErrorHandler:", &v15, v11);

  v12 = v17;
  v13 = v9;

  return v13;
}

void __38__MTStopwatchManager_createStopwatch___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - Adding Stopwatch", v7, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createStopwatch:withCompletion:", v5, v6);

}

- (id)updateStopwatch:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  MTStopwatchManager *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ updateStopwatch: %{public}@", buf, 0x16u);

  }
  v7 = (void *)objc_opt_new();
  -[MTStopwatchManager connectionProvider](self, "connectionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = v4;
  v9 = v7;
  v17 = v9;
  v10 = v4;
  objc_msgSend(v9, "errorOnlyCompletionHandlerAdapter", v15, 3221225472, __38__MTStopwatchManager_updateStopwatch___block_invoke, &unk_1E39CBCC8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performRemoteBlock:withErrorHandler:", &v15, v11);

  v12 = v17;
  v13 = v9;

  return v13;
}

void __38__MTStopwatchManager_updateStopwatch___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - Updating Stopwatch", v7, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateStopwatch:withCompletion:", v5, v6);

}

- (id)removeStopwatch:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  MTStopwatchManager *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removeStopwatch: %{public}@", buf, 0x16u);

  }
  v7 = (void *)objc_opt_new();
  -[MTStopwatchManager connectionProvider](self, "connectionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = v4;
  v9 = v7;
  v17 = v9;
  v10 = v4;
  objc_msgSend(v9, "errorOnlyCompletionHandlerAdapter", v15, 3221225472, __38__MTStopwatchManager_removeStopwatch___block_invoke, &unk_1E39CBCC8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performRemoteBlock:withErrorHandler:", &v15, v11);

  v12 = v17;
  v13 = v9;

  return v13;
}

void __38__MTStopwatchManager_removeStopwatch___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - Deleting Stopwatch", v7, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "errorOnlyCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteStopwatch:withCompletion:", v5, v6);

}

- (id)getStopwatches
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  MTStopwatchManager *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ getStopwatches", buf, 0xCu);
  }

  v4 = (void *)objc_opt_new();
  -[MTStopwatchManager connectionProvider](self, "connectionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__MTStopwatchManager_getStopwatches__block_invoke;
  v9[3] = &unk_1E39CBD18;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v6, "errorOnlyCompletionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performRemoteBlock:withErrorHandler:", v9, v7);

  return v6;
}

void __36__MTStopwatchManager_getStopwatches__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - getting stopwatches", buf, 2u);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__MTStopwatchManager_getStopwatches__block_invoke_40;
  v5[3] = &unk_1E39CBCF0;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "getStopwatchesWithCompletion:", v5);

}

uint64_t __36__MTStopwatchManager_getStopwatches__block_invoke_40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "finishWithError:");
  else
    return objc_msgSend(v3, "finishWithResult:", a2);
}

- (id)didAddLap:(id)a3 forStopwatch:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  MTStopwatchManager *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MTLogForCategory(5);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = self;
    v40 = 2114;
    v41 = v12;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ addLap for: %{public}@", buf, 0x16u);

  }
  v13 = (void *)objc_opt_new();
  objc_initWeak((id *)buf, self);
  v14 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __52__MTStopwatchManager_didAddLap_forStopwatch_sender___block_invoke;
  v32[3] = &unk_1E39CBD40;
  v15 = v13;
  v33 = v15;
  v16 = v10;
  v34 = v16;
  objc_copyWeak(&v37, (id *)buf);
  v17 = v8;
  v35 = v17;
  v18 = v9;
  v36 = v18;
  v19 = (void *)MEMORY[0x19AED0080](v32);
  -[MTStopwatchManager connectionProvider](self, "connectionProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v17;
  v29 = v21;
  v22 = v18;
  v30 = v22;
  v23 = v19;
  v31 = v23;
  objc_msgSend(v15, "errorOnlyCompletionHandlerAdapter", v14, 3221225472, __52__MTStopwatchManager_didAddLap_forStopwatch_sender___block_invoke_2, &unk_1E39CBD68);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "performRemoteBlock:withErrorHandler:", &v28, v24);

  v25 = v31;
  v26 = v15;

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)buf);

  return v26;
}

void __52__MTStopwatchManager_didAddLap_forStopwatch_sender___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  NAEmptyResult();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:error:", v5, v4);

  objc_msgSend(*(id *)(a1 + 40), "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    if (WeakRetained)
    {
      v9 = WeakRetained;
      objc_msgSend(WeakRetained, "exportedObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didAddLap:forStopwatch:source:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

      WeakRetained = v9;
    }

  }
}

void __52__MTStopwatchManager_didAddLap_forStopwatch_sender___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - adding lap for stopwatch", v5, 2u);
  }

  objc_msgSend(v3, "didAddLap:forStopwatch:withCompletion:", a1[4], a1[5], a1[6]);
}

- (id)didClearAllLapsForStopwatch:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  MTStopwatchManager *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = self;
    v33 = 2114;
    v34 = v9;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ didClearAllLapsForStopwatch for: %{public}@", buf, 0x16u);

  }
  v10 = (void *)objc_opt_new();
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __57__MTStopwatchManager_didClearAllLapsForStopwatch_sender___block_invoke;
  v26[3] = &unk_1E39CBD90;
  v12 = v10;
  v27 = v12;
  v13 = v7;
  v28 = v13;
  objc_copyWeak(&v30, (id *)buf);
  v14 = v6;
  v29 = v14;
  v15 = (void *)MEMORY[0x19AED0080](v26);
  -[MTStopwatchManager connectionProvider](self, "connectionProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  v24 = v17;
  v18 = v15;
  v25 = v18;
  objc_msgSend(v12, "errorOnlyCompletionHandlerAdapter", v11, 3221225472, __57__MTStopwatchManager_didClearAllLapsForStopwatch_sender___block_invoke_2, &unk_1E39CBDB8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performRemoteBlock:withErrorHandler:", &v23, v19);

  v20 = v25;
  v21 = v12;

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

  return v21;
}

void __57__MTStopwatchManager_didClearAllLapsForStopwatch_sender___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  NAEmptyResult();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:error:", v5, v4);

  objc_msgSend(*(id *)(a1 + 40), "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v9 = WeakRetained;
      objc_msgSend(WeakRetained, "exportedObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didClearAllLapsForStopwatch:source:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

      WeakRetained = v9;
    }

  }
}

void __57__MTStopwatchManager_didClearAllLapsForStopwatch_sender___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - didClearAllLapsForStopwatch", v5, 2u);
  }

  objc_msgSend(v3, "didClearAllLapsForStopwatch:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)didStartLapTimerForStopwatch:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  MTStopwatchManager *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = self;
    v33 = 2114;
    v34 = v9;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ didStartLapTimerForStopwatch for: %{public}@", buf, 0x16u);

  }
  v10 = (void *)objc_opt_new();
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __58__MTStopwatchManager_didStartLapTimerForStopwatch_sender___block_invoke;
  v26[3] = &unk_1E39CBD90;
  v12 = v10;
  v27 = v12;
  v13 = v7;
  v28 = v13;
  objc_copyWeak(&v30, (id *)buf);
  v14 = v6;
  v29 = v14;
  v15 = (void *)MEMORY[0x19AED0080](v26);
  -[MTStopwatchManager connectionProvider](self, "connectionProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  v24 = v17;
  v18 = v15;
  v25 = v18;
  objc_msgSend(v12, "errorOnlyCompletionHandlerAdapter", v11, 3221225472, __58__MTStopwatchManager_didStartLapTimerForStopwatch_sender___block_invoke_2, &unk_1E39CBDB8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performRemoteBlock:withErrorHandler:", &v23, v19);

  v20 = v25;
  v21 = v12;

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

  return v21;
}

void __58__MTStopwatchManager_didStartLapTimerForStopwatch_sender___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  NAEmptyResult();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:error:", v5, v4);

  objc_msgSend(*(id *)(a1 + 40), "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v9 = WeakRetained;
      objc_msgSend(WeakRetained, "exportedObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didStartLapTimerForStopwatch:source:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

      WeakRetained = v9;
    }

  }
}

void __58__MTStopwatchManager_didStartLapTimerForStopwatch_sender___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - didStartLapTimerForStopwatch", v5, 2u);
  }

  objc_msgSend(v3, "didStartLapTimerForStopwatch:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)didPauseLapTimerForStopwatch:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  MTStopwatchManager *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = self;
    v33 = 2114;
    v34 = v9;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ didPauseLapTimerForStopwatch for: %{public}@", buf, 0x16u);

  }
  v10 = (void *)objc_opt_new();
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __58__MTStopwatchManager_didPauseLapTimerForStopwatch_sender___block_invoke;
  v26[3] = &unk_1E39CBD90;
  v12 = v10;
  v27 = v12;
  v13 = v7;
  v28 = v13;
  objc_copyWeak(&v30, (id *)buf);
  v14 = v6;
  v29 = v14;
  v15 = (void *)MEMORY[0x19AED0080](v26);
  -[MTStopwatchManager connectionProvider](self, "connectionProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  v24 = v17;
  v18 = v15;
  v25 = v18;
  objc_msgSend(v12, "errorOnlyCompletionHandlerAdapter", v11, 3221225472, __58__MTStopwatchManager_didPauseLapTimerForStopwatch_sender___block_invoke_2, &unk_1E39CBDB8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performRemoteBlock:withErrorHandler:", &v23, v19);

  v20 = v25;
  v21 = v12;

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

  return v21;
}

void __58__MTStopwatchManager_didPauseLapTimerForStopwatch_sender___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  NAEmptyResult();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:error:", v5, v4);

  objc_msgSend(*(id *)(a1 + 40), "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v9 = WeakRetained;
      objc_msgSend(WeakRetained, "exportedObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didPauseLapTimerForStopwatch:source:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

      WeakRetained = v9;
    }

  }
}

void __58__MTStopwatchManager_didPauseLapTimerForStopwatch_sender___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - didPauseLapTimerForStopwatch", v5, 2u);
  }

  objc_msgSend(v3, "didPauseLapTimerForStopwatch:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)didLapLapTimerForStopwatch:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  MTStopwatchManager *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = self;
    v33 = 2114;
    v34 = v9;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ didLapLapTimerForStopwatch for: %{public}@", buf, 0x16u);

  }
  v10 = (void *)objc_opt_new();
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __56__MTStopwatchManager_didLapLapTimerForStopwatch_sender___block_invoke;
  v26[3] = &unk_1E39CBD90;
  v12 = v10;
  v27 = v12;
  v13 = v7;
  v28 = v13;
  objc_copyWeak(&v30, (id *)buf);
  v14 = v6;
  v29 = v14;
  v15 = (void *)MEMORY[0x19AED0080](v26);
  -[MTStopwatchManager connectionProvider](self, "connectionProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  v24 = v17;
  v18 = v15;
  v25 = v18;
  objc_msgSend(v12, "errorOnlyCompletionHandlerAdapter", v11, 3221225472, __56__MTStopwatchManager_didLapLapTimerForStopwatch_sender___block_invoke_2, &unk_1E39CBDB8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performRemoteBlock:withErrorHandler:", &v23, v19);

  v20 = v25;
  v21 = v12;

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

  return v21;
}

void __56__MTStopwatchManager_didLapLapTimerForStopwatch_sender___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  NAEmptyResult();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:error:", v5, v4);

  objc_msgSend(*(id *)(a1 + 40), "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v9 = WeakRetained;
      objc_msgSend(WeakRetained, "exportedObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didLapLapTimerForStopwatch:source:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

      WeakRetained = v9;
    }

  }
}

void __56__MTStopwatchManager_didLapLapTimerForStopwatch_sender___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - didLapLapTimerForStopwatch", v5, 2u);
  }

  objc_msgSend(v3, "didLapLapTimerForStopwatch:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)didResetLapTimerForStopwatch:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  MTStopwatchManager *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = self;
    v33 = 2114;
    v34 = v9;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ didResetLapTimerForStopwatch for: %{public}@", buf, 0x16u);

  }
  v10 = (void *)objc_opt_new();
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __58__MTStopwatchManager_didResetLapTimerForStopwatch_sender___block_invoke;
  v26[3] = &unk_1E39CBD90;
  v12 = v10;
  v27 = v12;
  v13 = v7;
  v28 = v13;
  objc_copyWeak(&v30, (id *)buf);
  v14 = v6;
  v29 = v14;
  v15 = (void *)MEMORY[0x19AED0080](v26);
  -[MTStopwatchManager connectionProvider](self, "connectionProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  v24 = v17;
  v18 = v15;
  v25 = v18;
  objc_msgSend(v12, "errorOnlyCompletionHandlerAdapter", v11, 3221225472, __58__MTStopwatchManager_didResetLapTimerForStopwatch_sender___block_invoke_2, &unk_1E39CBDB8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performRemoteBlock:withErrorHandler:", &v23, v19);

  v20 = v25;
  v21 = v12;

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

  return v21;
}

void __58__MTStopwatchManager_didResetLapTimerForStopwatch_sender___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  NAEmptyResult();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:error:", v5, v4);

  objc_msgSend(*(id *)(a1 + 40), "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v9 = WeakRetained;
      objc_msgSend(WeakRetained, "exportedObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didResetLapTimerForStopwatch:source:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

      WeakRetained = v9;
    }

  }
}

void __58__MTStopwatchManager_didResetLapTimerForStopwatch_sender___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - didResetLapTimerForStopwatch", v5, 2u);
  }

  objc_msgSend(v3, "didResetLapTimerForStopwatch:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)didResumeLapTimerForStopwatch:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  MTStopwatchManager *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = self;
    v33 = 2114;
    v34 = v9;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ didResumeLapTimerForStopwatch for: %{public}@", buf, 0x16u);

  }
  v10 = (void *)objc_opt_new();
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __59__MTStopwatchManager_didResumeLapTimerForStopwatch_sender___block_invoke;
  v26[3] = &unk_1E39CBD90;
  v12 = v10;
  v27 = v12;
  v13 = v7;
  v28 = v13;
  objc_copyWeak(&v30, (id *)buf);
  v14 = v6;
  v29 = v14;
  v15 = (void *)MEMORY[0x19AED0080](v26);
  -[MTStopwatchManager connectionProvider](self, "connectionProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  v24 = v17;
  v18 = v15;
  v25 = v18;
  objc_msgSend(v12, "errorOnlyCompletionHandlerAdapter", v11, 3221225472, __59__MTStopwatchManager_didResumeLapTimerForStopwatch_sender___block_invoke_2, &unk_1E39CBDB8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performRemoteBlock:withErrorHandler:", &v23, v19);

  v20 = v25;
  v21 = v12;

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

  return v21;
}

void __59__MTStopwatchManager_didResumeLapTimerForStopwatch_sender___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  NAEmptyResult();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:error:", v5, v4);

  objc_msgSend(*(id *)(a1 + 40), "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v9 = WeakRetained;
      objc_msgSend(WeakRetained, "exportedObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didResumeLapTimerForStopwatch:source:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

      WeakRetained = v9;
    }

  }
}

void __59__MTStopwatchManager_didResumeLapTimerForStopwatch_sender___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  MTLogForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - didResumeLapTimerForStopwatch", v5, 2u);
  }

  objc_msgSend(v3, "didResumeLapTimerForStopwatch:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setExportedObject:(id)a3
{
  objc_storeStrong((id *)&self->_exportedObject, a3);
}

- (MTXPCConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (MTMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
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
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_exportedObject, 0);
}

@end
