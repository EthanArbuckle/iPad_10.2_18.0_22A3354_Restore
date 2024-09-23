@implementation AMSEngagement

void __28__AMSEngagement__connection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  AMSEngagementConnection *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  _QWORD block[4];
  id v22;
  id v23;

  WeakRetained = objc_loadWeakRetained(&_connection_connection);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v5)
  {
    v6 = [AMSEngagementConnection alloc];
    objc_msgSend(*(id *)(a1 + 48), "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AMSEngagementConnection initWithNotificationCenter:](v6, "initWithNotificationCenter:", v7);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setErrorHandler:", &__block_literal_global_124_1);
    objc_storeWeak(&_connection_connection, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__27;
  v19[4] = __Block_byref_object_dispose__27;
  v20 = v5;
  v11 = MEMORY[0x1E0C809B0];
  v12 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __28__AMSEngagement__connection__block_invoke_3;
  v18[3] = &unk_1E253DDB8;
  v18[4] = v19;
  v13 = v18;
  v14 = v12;
  AMSLogKey();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_time(0, 3000000000);
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAfter_block_invoke_0;
  block[3] = &unk_1E253DC28;
  v22 = v15;
  v23 = v13;
  v17 = v15;
  dispatch_after(v16, v14, block);

  _Block_object_dispose(v19, 8);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[AMSEngagement notificationCenter](AMSEngagement, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AMSEngagement;
  -[AMSEngagement dealloc](&v4, sel_dealloc);
}

- (id)enqueueData:(id)a3
{
  id v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  AMSMutablePromise *v8;
  void *v10;
  AMSMutablePromise *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  AMSMutablePromise *v15;
  _QWORD *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  AMSEngagement *v23;
  AMSMutablePromise *v24;
  void *v25;
  _QWORD block[4];
  id v27;
  id v28;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (!+[AMSEphemeralDefaults suppressEngagement](AMSEphemeralDefaults, "suppressEngagement"))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v4, 1);

      v11 = objc_alloc_init(AMSMutablePromise);
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_engagementQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __29__AMSEngagement_enqueueData___block_invoke;
      v21[3] = &unk_1E2541468;
      v4 = v10;
      v22 = v4;
      v23 = self;
      v15 = v11;
      v24 = v15;
      v25 = v12;
      v16 = v21;
      v17 = v12;
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = v14;
      block[1] = 3221225472;
      block[2] = __AMSDispatchAsync_block_invoke_2;
      block[3] = &unk_1E253DC28;
      v27 = v18;
      v28 = v16;
      v19 = v18;
      dispatch_async(v13, block);

      v20 = v25;
      v8 = v15;

      goto LABEL_7;
    }
    v5 = CFSTR("Suppress Engagement");
    v6 = 11;
  }
  else
  {
    v5 = CFSTR("Invalid Engagement Data");
    v6 = 2;
  }
  AMSError(v6, v5, &stru_1E2548760, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v7);
  v8 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

- (void)_observeNotifications
{
  void *v3;
  id v4;

  +[AMSEngagement notificationCenter](AMSEngagement, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__pushEventReceived_, 0x1E2553920, 0);

  +[AMSEngagement notificationCenter](AMSEngagement, "notificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__connectionErrorNotification, 0x1E25538E0, 0);

}

+ (NSNotificationCenter)notificationCenter
{
  if (_MergedGlobals_100 != -1)
    dispatch_once(&_MergedGlobals_100, &__block_literal_global_44);
  return (NSNotificationCenter *)(id)qword_1ECEAD138;
}

- (AMSEngagement)initWithBag:(id)a3
{
  id v5;
  AMSEngagement *v6;
  AMSEngagement *v7;
  uint64_t v8;
  AMSEngagementConnection *connection;
  uint64_t v10;
  NSMapTable *observerInfo;
  NSMutableSet *v12;
  NSMutableSet *runningPromises;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *callbackQueue;
  AMSEngagementMessageCache *v17;
  AMSEngagementMessageCache *cacheInfo;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSEngagement;
  v6 = -[AMSEngagement init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    +[AMSEngagement _connection](AMSEngagement, "_connection");
    v8 = objc_claimAutoreleasedReturnValue();
    connection = v7->_connection;
    v7->_connection = (AMSEngagementConnection *)v8;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    observerInfo = v7->_observerInfo;
    v7->_observerInfo = (NSMapTable *)v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    runningPromises = v7->_runningPromises;
    v7->_runningPromises = v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.AMSEngagement.callbackQueue", v14);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v15;

    v17 = objc_alloc_init(AMSEngagementMessageCache);
    cacheInfo = v7->_cacheInfo;
    v7->_cacheInfo = v17;

    -[AMSEngagement _observeNotifications](v7, "_observeNotifications");
  }

  return v7;
}

+ (id)_connection
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD block[4];
  id v23;
  id v24;

  objc_msgSend(a1, "_engagementQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__27;
  v20 = __Block_byref_object_dispose__27;
  v21 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __28__AMSEngagement__connection__block_invoke;
  v12[3] = &unk_1E25416B8;
  v14 = &v16;
  v15 = a1;
  v5 = v3;
  v13 = v5;
  v6 = v12;
  v7 = v5;
  AMSLogKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke;
  block[3] = &unk_1E253DC28;
  v23 = v8;
  v24 = v6;
  v9 = v8;
  dispatch_sync(v7, block);

  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (AMSEngagement)init
{
  return -[AMSEngagement initWithBag:](self, "initWithBag:", 0);
}

void __39__AMSEngagement__manageRunningPromise___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;
  id from;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __39__AMSEngagement__manageRunningPromise___block_invoke_2;
  v7 = &unk_1E25415E8;
  objc_copyWeak(&v8, &location);
  objc_copyWeak(&v9, &from);
  objc_msgSend(v2, "addFinishBlock:", &v4);
  objc_msgSend(*(id *)(a1 + 32), "runningPromises", v4, v5, v6, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __39__AMSEngagement__removeRunningPromise___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "runningPromises");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "runningPromises");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  }
}

- (NSMutableSet)runningPromises
{
  return self->_runningPromises;
}

void __58__AMSEngagement_addObserver_placements_serviceType_queue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  AMSEngagementObserverInfo *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginObservingMessages");

  objc_msgSend(*(id *)(a1 + 32), "observerInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (AMSEngagementObserverInfo *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSEngagementObserverInfo setDispatchQueue:](v4, "setDispatchQueue:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v4 = -[AMSEngagementObserverInfo initWithQueue:]([AMSEngagementObserverInfo alloc], "initWithQueue:", *(_QWORD *)(a1 + 48));
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v22 = 138543874;
      v23 = v7;
      v24 = 2114;
      v25 = v8;
      v26 = 2114;
      v27 = v9;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding %{public}@ as an observer", (uint8_t *)&v22, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "observerInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));

  }
  if (*(_QWORD *)(a1 + 56))
    -[AMSEngagementObserverInfo addPlacements:](v4, "addPlacements:");
  v11 = *(id *)(a1 + 64);
  if (!*(_QWORD *)(a1 + 64))
  {
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v14;
      v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Warning: nil serviceType passed, falling back to bundle ID last component", (uint8_t *)&v22, 0x16u);

    }
    v16 = (void *)MEMORY[0x1E0C99E98];
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLWithString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "pathExtension");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lowercaseString");
    v21 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v21;
  }
  if (objc_msgSend(v11, "length"))
    -[AMSEngagementObserverInfo addServiceType:](v4, "addServiceType:", v11);

}

void __38__AMSEngagement_treatmentStoreService__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__27;
  v11 = __Block_byref_object_dispose__27;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)v8[5];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__AMSEngagement_treatmentStoreService__block_invoke_2;
  v4[3] = &unk_1E25415C0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v6 = &v7;
  v5 = v3;
  objc_msgSend(v2, "treatmentStoreServiceWithReply:", v4);

  _Block_object_dispose(&v7, 8);
}

- (AMSEngagementConnection)connection
{
  return self->_connection;
}

- (NSMapTable)observerInfo
{
  return self->_observerInfo;
}

- (void)addObserver:(id)a3 placement:(id)a4 serviceType:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  if (a4)
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = a5;
    v10 = a3;
    objc_msgSend(v8, "setWithObject:", a4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[AMSEngagement addObserver:placements:serviceType:](self, "addObserver:placements:serviceType:", v10);

  }
  else
  {
    v10 = a5;
    v11 = a3;
    -[AMSEngagement addObserver:placements:serviceType:](self, "addObserver:placements:serviceType:");
  }

}

- (void)addObserver:(id)a3 placements:(id)a4 serviceType:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "_notifyQueue");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSEngagement addObserver:placements:serviceType:queue:](self, "addObserver:placements:serviceType:queue:", v10, v9, v8, v11);

}

- (void)addObserver:(id)a3 placement:(id)a4 serviceType:(id)a5 queue:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  if (a4)
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = a6;
    v12 = a5;
    v13 = a3;
    objc_msgSend(v10, "setWithObject:", a4);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[AMSEngagement addObserver:placements:serviceType:queue:](self, "addObserver:placements:serviceType:queue:", v13);

  }
  else
  {
    v12 = a6;
    v13 = a5;
    v14 = a3;
    -[AMSEngagement addObserver:placements:serviceType:queue:](self, "addObserver:placements:serviceType:queue:");
  }

}

- (void)addObserver:(id)a3 placements:(id)a4 serviceType:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend((id)objc_opt_class(), "_engagementQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __58__AMSEngagement_addObserver_placements_serviceType_queue___block_invoke;
  v23[3] = &unk_1E2541440;
  v23[4] = self;
  v24 = v10;
  v25 = v13;
  v26 = v11;
  v27 = v12;
  v16 = v23;
  v17 = v12;
  v18 = v11;
  v19 = v13;
  v20 = v10;
  AMSLogKey();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke;
  block[3] = &unk_1E253DC28;
  v29 = v21;
  v30 = v16;
  v22 = v21;
  dispatch_sync(v14, block);

}

+ (OS_dispatch_queue)_notifyQueue
{
  if (qword_1ECEAD150 != -1)
    dispatch_once(&qword_1ECEAD150, &__block_literal_global_131);
  return (OS_dispatch_queue *)(id)qword_1ECEAD158;
}

void __39__AMSEngagement__manageRunningPromise___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeRunningPromise:", v2);

}

- (void)_removeRunningPromise:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_engagementQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__AMSEngagement__removeRunningPromise___block_invoke;
  v11[3] = &unk_1E253E2B0;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  v8 = v4;
  AMSLogKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E253DC28;
  v14 = v9;
  v15 = v7;
  v10 = v9;
  dispatch_async(v5, block);

}

- (id)treatmentStoreService
{
  void *v3;
  AMSMutablePromise *v4;
  AMSMutablePromise *v5;
  NSObject *v6;
  uint64_t v7;
  AMSMutablePromise *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  AMSMutablePromise *v12;
  _QWORD v14[5];
  AMSMutablePromise *v15;
  _QWORD block[4];
  id v17;
  id v18;

  if (+[AMSDevice deviceIsAudioAccessory](AMSDevice, "deviceIsAudioAccessory"))
  {
    AMSError(12, CFSTR("Unavailable"), CFSTR("The treatment store is unavailable on this device."), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v3);
    v4 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", 5.0);
    -[AMSEngagement _manageRunningPromise:](self, "_manageRunningPromise:", v5);
    objc_msgSend((id)objc_opt_class(), "_engagementQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __38__AMSEngagement_treatmentStoreService__block_invoke;
    v14[3] = &unk_1E253E2B0;
    v14[4] = self;
    v8 = v5;
    v15 = v8;
    v9 = v14;
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke_2;
    block[3] = &unk_1E253DC28;
    v17 = v10;
    v18 = v9;
    v11 = v10;
    dispatch_async(v6, block);

    v12 = v15;
    v4 = v8;

  }
  return v4;
}

- (void)_manageRunningPromise:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_engagementQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__AMSEngagement__manageRunningPromise___block_invoke;
  v11[3] = &unk_1E253E2B0;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  v8 = v4;
  AMSLogKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E253DC28;
  v14 = v9;
  v15 = v7;
  v10 = v9;
  dispatch_async(v5, block);

}

+ (OS_dispatch_queue)_engagementQueue
{
  if (qword_1ECEAD140 != -1)
    dispatch_once(&qword_1ECEAD140, &__block_literal_global_129_0);
  return (OS_dispatch_queue *)(id)qword_1ECEAD148;
}

- (id)enqueueMessageEvent:(id)a3
{
  id v4;
  AMSMutablePromise *v5;
  void *v6;
  uint64_t v7;
  AMSMutablePromise *v8;
  AMSMutablePromise *v9;
  AMSMutablePromise *v10;
  AMSMutablePromise *v11;
  _QWORD v13[4];
  AMSMutablePromise *v14;
  _QWORD v15[5];
  AMSMutablePromise *v16;

  v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  -[AMSEngagement enqueueEvent:](self, "enqueueEvent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__AMSEngagement_Messaging__enqueueMessageEvent___block_invoke;
  v15[3] = &unk_1E25413F0;
  v15[4] = self;
  v8 = v5;
  v16 = v8;
  objc_msgSend(v6, "addSuccessBlock:", v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __48__AMSEngagement_Messaging__enqueueMessageEvent___block_invoke_3;
  v13[3] = &unk_1E253E120;
  v9 = v8;
  v14 = v9;
  objc_msgSend(v6, "addErrorBlock:", v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

- (id)enqueueEvent:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "engagementData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSEngagement enqueueData:](self, "enqueueData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __48__AMSEngagement_Messaging__enqueueMessageEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSEngagementMessageEventResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[AMSEngagementMessageEventResponse initWithEnqueueResult:]([AMSEngagementMessageEventResponse alloc], "initWithEnqueueResult:", v3);

  objc_msgSend(*(id *)(a1 + 32), "cacheInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterWithMessage:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Blocked message identifiers: %{public}@", (uint8_t *)&v12, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notifyBlockedMessages:", v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v4);

}

- (AMSEngagementMessageCache)cacheInfo
{
  return self->_cacheInfo;
}

void __37__AMSEngagement__enqueueWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  os_signpost_id_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  os_signpost_id_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  os_signpost_id_t v58;
  uint64_t v59;
  _BYTE v60[12];
  __int16 v61;
  void *v62;
  __int16 v63;
  double v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  v9 = AMSSetLogKey(*(void **)(a1 + 40));
  if (v6)
  {
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "start");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceNow");
      v16 = v15;

      *(_DWORD *)v60 = 138544130;
      v17 = -v16;
      if (v16 >= 0.0)
        v17 = v16;
      *(_QWORD *)&v60[4] = v12;
      v61 = 2114;
      v62 = v13;
      v63 = 2048;
      v64 = v17;
      v65 = 2114;
      v66 = v6;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Enqueue finished with error (%.3f) %{public}@", v60, 0x2Au);

    }
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject", *(_QWORD *)v60);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_signpost_enabled(v20);

    if (!v18)
    if (v21)
    {
      +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "OSLogObject");
        v24 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "OSLogObject");
        v24 = objc_claimAutoreleasedReturnValue();

      }
      v45 = objc_msgSend(*(id *)(a1 + 48), "signpostID");
      if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v46 = v45;
        if (os_signpost_enabled(v24))
        {
          *(_DWORD *)v60 = 138543362;
          *(_QWORD *)&v60[4] = v6;
          _os_signpost_emit_with_name_impl(&dword_18C849000, v24, OS_SIGNPOST_EVENT, v46, "Engagement", "Enqueue finished with error %{public}@", v60, 0xCu);
        }
      }

      +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v47)
      {
        objc_msgSend(v47, "OSLogObject");
        v49 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "OSLogObject");
        v49 = objc_claimAutoreleasedReturnValue();

      }
      v51 = objc_msgSend(*(id *)(a1 + 48), "signpostID");
      if ((unint64_t)(v51 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v52 = v51;
        if (os_signpost_enabled(v49))
        {
          *(_WORD *)v60 = 0;
          _os_signpost_emit_with_name_impl(&dword_18C849000, v49, OS_SIGNPOST_INTERVAL_END, v52, "Engagement", "Error occured", v60, 2u);
        }
      }

    }
    -[__CFString userInfo](v6, "userInfo");
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v55 = *(void **)(v54 + 40);
    *(_QWORD *)(v54 + 40) = v53;

    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v6);
  }
  else
  {
    v25 = *(void **)(a1 + 32);
    objc_msgSend(v5, "actions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_parseActions:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setActions:", v27);
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v28, "OSLogObject");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_opt_class();
      AMSLogKey();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "start");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeIntervalSinceNow");
      v34 = v33;

      if (v34 < 0.0)
        v34 = -v34;
      objc_msgSend(v5, "request");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
        v36 = CFSTR("true");
      else
        v36 = CFSTR("false");
      *(_DWORD *)v60 = 138544386;
      *(_QWORD *)&v60[4] = v30;
      v61 = 2114;
      v62 = v31;
      v63 = 2048;
      v64 = v34;
      v65 = 2114;
      v66 = v36;
      v67 = 2048;
      v68 = objc_msgSend(v27, "count");
      _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueue finished (%.3f) request: %{public}@, actions: %ld", v60, 0x34u);

    }
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (!v37)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v38, "OSLogObject");
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_signpost_enabled(v39);

    if (!v37)
    if (v40)
    {
      +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v41)
      {
        objc_msgSend(v41, "OSLogObject");
        v43 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "OSLogObject");
        v43 = objc_claimAutoreleasedReturnValue();

      }
      v57 = objc_msgSend(*(id *)(a1 + 48), "signpostID");
      if ((unint64_t)(v57 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v58 = v57;
        if (os_signpost_enabled(v43))
        {
          v59 = objc_msgSend(v27, "count");
          *(_DWORD *)v60 = 134217984;
          *(_QWORD *)&v60[4] = v59;
          _os_signpost_emit_with_name_impl(&dword_18C849000, v43, OS_SIGNPOST_INTERVAL_END, v58, "Engagement", "Finished (actions: %ld)", v60, 0xCu);
        }
      }

    }
    objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", v5);

  }
}

- (id)_enqueueWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  os_signpost_id_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  id v23;
  AMSMutablePromise *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  os_signpost_id_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  AMSMutablePromise *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  AMSMutablePromise *v47;
  void *v48;
  __CFString *v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  _QWORD *v56;
  _QWORD v57[5];
  id v58;
  id v59;
  AMSMutablePromise *v60;
  _BYTE *v61;
  _QWORD *v62;
  _QWORD v63[5];
  id v64;
  _BYTE buf[24];
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "signpostID"))
  {
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_enabled(v7);

    if (!v5)
    if (v8)
    {
      +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSignpostID:", os_signpost_id_make_with_pointer(v11, self));

      if (!v9)
      +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "OSLogObject");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "OSLogObject");
        v14 = objc_claimAutoreleasedReturnValue();

      }
      v16 = objc_msgSend(v4, "signpostID");
      if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v17 = v16;
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18C849000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Engagement", "Enqueuing request", buf, 2u);
        }
      }

    }
  }
  objc_msgSend(v4, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "events");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("eventType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;

    v25 = &stru_1E2548760;
    if (v22)
      v25 = v22;
    v50 = v25;

    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (!v26)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v27, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_signpost_enabled(v28);

    if (!v26)
    if (v29)
    {
      +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        objc_msgSend(v30, "OSLogObject");
        v32 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "OSLogObject");
        v32 = objc_claimAutoreleasedReturnValue();

      }
      v34 = objc_msgSend(v4, "signpostID");
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        objc_msgSend(v4, "request");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "destinations");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR(","));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v50;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v37;
        _os_signpost_emit_with_name_impl(&dword_18C849000, v32, OS_SIGNPOST_EVENT, v34, "Engagement", "Enqueueing event for type: %{public}@, dest: [%{public}@]", buf, 0x16u);

      }
    }
    objc_msgSend(v4, "request", v50);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "logKey");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSEngagement _enqueueTimeout](AMSEngagement, "_enqueueTimeout");
    v41 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", v40);
    -[AMSEngagement _manageRunningPromise:](self, "_manageRunningPromise:", v41);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v66 = __Block_byref_object_copy__27;
    v67 = __Block_byref_object_dispose__27;
    -[AMSEngagement connection](self, "connection");
    v68 = (id)objc_claimAutoreleasedReturnValue();
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x3032000000;
    v63[3] = __Block_byref_object_copy__27;
    v63[4] = __Block_byref_object_dispose__27;
    v64 = 0;
    v42 = *(void **)(*(_QWORD *)&buf[8] + 40);
    objc_msgSend(v4, "request");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = MEMORY[0x1E0C809B0];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __37__AMSEngagement__enqueueWithContext___block_invoke;
    v57[3] = &unk_1E25414E0;
    v57[4] = self;
    v61 = buf;
    v45 = v39;
    v58 = v45;
    v46 = v4;
    v59 = v46;
    v62 = v63;
    v47 = v41;
    v60 = v47;
    objc_msgSend(v42, "enqueueWithRequest:completion:", v43, v57);

    v52[0] = v44;
    v52[1] = 3221225472;
    v52[2] = __37__AMSEngagement__enqueueWithContext___block_invoke_56;
    v52[3] = &unk_1E2541508;
    v52[4] = self;
    v53 = v20;
    v23 = v51;
    v54 = v23;
    v56 = v63;
    v55 = v46;
    -[AMSPromise addErrorBlock:](v47, "addErrorBlock:", v52);
    v48 = v55;
    v24 = v47;

    _Block_object_dispose(v63, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    AMSError(2, CFSTR("No events to enqueue"), &stru_1E2548760, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v23);
    v24 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

void __29__AMSEngagement_enqueueData___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  double v31;
  AMSEngagementEnqueueResult *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  os_signpost_id_t v46;
  void *v47;
  AMSEngagementEnqueueRequest *v48;
  void *v49;
  void *v50;
  void *v51;
  AMSEngagementEnqueueContext *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  os_signpost_id_t v61;
  NSObject *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  _QWORD *v69;
  NSObject *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  NSObject *v75;
  _BOOL4 v76;
  os_signpost_id_t v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  os_signpost_id_t spida;
  os_signpost_id_t spid;
  void *v88;
  void *v89;
  void *v90;
  __CFString *v91;
  _QWORD v92[4];
  id v93;
  uint64_t v94;
  _BYTE buf[24];
  double v96;
  _BYTE v97[20];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v2 = AMSSetLogKey(0);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("eventType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;

  v6 = &stru_1E2548760;
  if (v5)
    v6 = v5;
  v91 = v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("nativeHandling"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_enabled(v11);

  if (!v9)
  if (v12)
  {
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_id_make_with_pointer(v15, *(const void **)(a1 + 40));

    if (!v13)
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();

    }
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18C849000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Engagement", "Enqueuing data", buf, 2u);
    }

  }
  else
  {
    v16 = 0;
  }
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    +[AMSEngagementClientData loadFromDisk](AMSEngagementClientData, "loadFromDisk");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_scheduleSyncIfNeeded:", v21);
  }
  objc_msgSend(v21, "destinationsForEvent:", *(_QWORD *)(a1 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) != 0 || (_os_feature_enabled_impl() & 1) != 0 || objc_msgSend(v22, "count"))
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      +[AMSEngagementCache sharedInstance](AMSEngagementCache, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "cachedResponseForEvent:", *(_QWORD *)(a1 + 32));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
LABEL_30:
        v88 = v21;
        v25 = v22;
        +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v27 = v3;
        objc_msgSend(v26, "OSLogObject");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = objc_opt_class();
          AMSLogKey();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "timeIntervalSinceNow");
          *(_DWORD *)buf = 138544130;
          if (v31 < 0.0)
            v31 = -v31;
          *(_QWORD *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2048;
          v96 = v31;
          *(_WORD *)v97 = 2114;
          *(_QWORD *)&v97[2] = v91;
          _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Returned cached response (%.3f), type: %{public}@", buf, 0x2Au);

        }
        v32 = objc_alloc_init(AMSEngagementEnqueueResult);
        -[AMSEngagementEnqueueResult setData:](v32, "setData:", v24);
        objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v32);
        +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (!v33)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v34, "OSLogObject");
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = os_signpost_enabled(v35);

        if (!v33)
        if (!v36)
        {
          v3 = v27;
          v22 = v25;
          v21 = v88;
LABEL_64:

          goto LABEL_65;
        }
        +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (v37)
        {
          objc_msgSend(v37, "OSLogObject");
          v39 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "OSLogObject");
          v39 = objc_claimAutoreleasedReturnValue();

        }
        spid = v16;
        v55 = v16 - 1;
        if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18C849000, v39, OS_SIGNPOST_EVENT, spid, "Engagement", "Returning cached response", buf, 2u);
        }

        +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v56;
        v3 = v27;
        if (v56)
        {
          objc_msgSend(v56, "OSLogObject");
          v48 = (AMSEngagementEnqueueRequest *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "OSLogObject");
          v48 = (AMSEngagementEnqueueRequest *)objc_claimAutoreleasedReturnValue();

        }
        v22 = v25;

        v21 = v88;
        if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&v48->super))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18C849000, &v48->super, OS_SIGNPOST_INTERVAL_END, spid, "Engagement", "Finished", buf, 2u);
        }
LABEL_63:

        goto LABEL_64;
      }
    }
    else
    {
      objc_msgSend(v21, "cachedResponseDataForEvent:", *(_QWORD *)(a1 + 32));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        goto LABEL_30;
    }
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(prev: %@)"), *(_QWORD *)(a1 + 56));
      v32 = (AMSEngagementEnqueueResult *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = (AMSEngagementEnqueueResult *)&stru_1E2548760;
    }
    v89 = v3;
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v40)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v40, "OSLogObject");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = objc_opt_class();
      AMSLogKey();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR(","));
      spida = (os_signpost_id_t)v24;
      v44 = v21;
      v45 = v22;
      v46 = v16;
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v43;
      *(_WORD *)&buf[22] = 2114;
      v96 = *(double *)&v91;
      *(_WORD *)v97 = 2114;
      *(_QWORD *)&v97[2] = v47;
      *(_WORD *)&v97[10] = 2114;
      *(_QWORD *)&v97[12] = v32;
      _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueueing event for type: %{public}@, dest: [%{public}@] %{public}@", buf, 0x34u);

      v16 = v46;
      v22 = v45;
      v21 = v44;
      v24 = (void *)spida;

    }
    v48 = objc_alloc_init(AMSEngagementEnqueueRequest);
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSEngagementEnqueueRequest setClientInfo:](v48, "setClientInfo:", v49);

    v94 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSEngagementEnqueueRequest setEvents:](v48, "setEvents:", v50);

    AMSLogKey();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSEngagementEnqueueRequest setLogKey:](v48, "setLogKey:", v51);

    +[AMSEngagement _enqueueTimeout](AMSEngagement, "_enqueueTimeout");
    -[AMSEngagementEnqueueRequest setTimeout:](v48, "setTimeout:");
    -[AMSEngagementEnqueueRequest setDestinations:](v48, "setDestinations:", v22);
    v52 = objc_alloc_init(AMSEngagementEnqueueContext);
    v3 = v89;
    -[AMSEngagementEnqueueContext setStart:](v52, "setStart:", v89);
    -[AMSEngagementEnqueueContext setSignpostID:](v52, "setSignpostID:", v16);
    -[AMSEngagementEnqueueContext setRequest:](v52, "setRequest:", v48);
    objc_msgSend(*(id *)(a1 + 40), "_enqueueWithContext:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "finishWithPromise:", v53);

    goto LABEL_63;
  }
  v90 = v21;
  v59 = v22;
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v60)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v61 = v16;
  objc_msgSend(v60, "OSLogObject");
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
  {
    v63 = objc_opt_class();
    AMSLogKey();
    v64 = v3;
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v63;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v65;
    _os_log_impl(&dword_18C849000, v62, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Not Native Handling and No destinations for event", buf, 0x16u);

    v3 = v64;
  }

  v66 = *(void **)(a1 + 48);
  v67 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v68 = MEMORY[0x1E0C809B0];
  v92[0] = MEMORY[0x1E0C809B0];
  v92[1] = 3221225472;
  v92[2] = __29__AMSEngagement_enqueueData___block_invoke_37;
  v92[3] = &unk_1E253DBD8;
  v93 = v66;
  v69 = v92;
  v70 = v67;
  AMSLogKey();
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v68;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_2;
  v96 = COERCE_DOUBLE(&unk_1E253DC28);
  *(_QWORD *)v97 = v71;
  *(_QWORD *)&v97[8] = v69;
  v72 = v71;
  dispatch_async(v70, buf);

  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v73;
  if (!v73)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v74, "OSLogObject");
  v75 = objc_claimAutoreleasedReturnValue();
  v76 = os_signpost_enabled(v75);

  v77 = v61;
  if (!v73)

  v22 = v59;
  v21 = v90;
  if (v76)
  {
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v78;
    if (v78)
    {
      objc_msgSend(v78, "OSLogObject");
      v80 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "OSLogObject");
      v80 = objc_claimAutoreleasedReturnValue();

    }
    if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18C849000, v80, OS_SIGNPOST_EVENT, v77, "Engagement", "No destinations for event", buf, 2u);
    }

    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v82;
    if (v82)
    {
      objc_msgSend(v82, "OSLogObject");
      v84 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "OSLogObject");
      v84 = objc_claimAutoreleasedReturnValue();

    }
    if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18C849000, v84, OS_SIGNPOST_INTERVAL_END, v77, "Engagement", "Finished", buf, 2u);
    }

  }
  v24 = v93;
LABEL_65:

}

- (void)_scheduleSyncIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD block[4];
  id v14;
  id v15;

  objc_msgSend(a3, "lastSyncedBuild");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDevice buildVersion](AMSDevice, "buildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    +[AMSEngagement _engagementQueue](AMSEngagement, "_engagementQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39__AMSEngagement__scheduleSyncIfNeeded___block_invoke;
    v12[3] = &unk_1E253DBD8;
    v12[4] = self;
    v9 = v12;
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke_2;
    block[3] = &unk_1E253DC28;
    v14 = v10;
    v15 = v9;
    v11 = v10;
    dispatch_async(v7, block);

  }
}

+ (double)_enqueueTimeout
{
  _BOOL4 v2;
  double result;

  v2 = +[AMSDefaults engagementExtendTimeouts](AMSDefaults, "engagementExtendTimeouts");
  result = 600.0;
  if (!v2)
    return 6.0;
  return result;
}

- (id)_parseActions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
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
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;

          if (v11)
            objc_msgSend(v4, "addObject:", v11, (_QWORD)v13);
        }
        else
        {

          v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

void __38__AMSEngagement_treatmentStoreService__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v10);
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    if (v5)
    {
      objc_msgSend(v8, "finishWithError:", v5);
    }
    else
    {
      AMSError(12, CFSTR("Engagement Failure"), CFSTR("Treatment store service is unavailable"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "finishWithError:", v9);

    }
  }

}

void __35__AMSEngagement_notificationCenter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37D0]);
  v1 = (void *)qword_1ECEAD138;
  qword_1ECEAD138 = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheInfo, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_runningPromises, 0);
  objc_storeStrong((id *)&self->_observerInfo, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

void __33__AMSEngagement__engagementQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create_with_target_V2("com.apple.AMSEngagement.engagementQueue", 0, v2);
  v1 = (void *)qword_1ECEAD148;
  qword_1ECEAD148 = (uint64_t)v0;

}

void __29__AMSEngagement__notifyQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create_with_target_V2("com.apple.AMSEngagement.notify", 0, v2);
  v1 = (void *)qword_1ECEAD158;
  qword_1ECEAD158 = (uint64_t)v0;

}

uint64_t __48__AMSEngagement_Messaging__enqueueMessageEvent___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (void)handleDialogResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "originalRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedActionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "locateActionWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "metricsEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metricsEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enqueueEvents:", v10);

  }
}

- (id)contentInfoForApp:(id)a3 cacheKey:(id)a4 version:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSMutablePromise *v11;
  NSObject *v12;
  uint64_t v13;
  AMSMutablePromise *v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  AMSMutablePromise *v21;
  AMSMutablePromise *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  AMSMutablePromise *v28;
  _QWORD block[4];
  id v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", 5.0);
  -[AMSEngagement _manageRunningPromise:](self, "_manageRunningPromise:", v11);
  objc_msgSend((id)objc_opt_class(), "_engagementQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __52__AMSEngagement_contentInfoForApp_cacheKey_version___block_invoke;
  v24[3] = &unk_1E2541440;
  v24[4] = self;
  v25 = v8;
  v26 = v9;
  v27 = v10;
  v14 = v11;
  v28 = v14;
  v15 = v24;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  AMSLogKey();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E253DC28;
  v30 = v19;
  v31 = v15;
  v20 = v19;
  dispatch_async(v12, block);

  v21 = v28;
  v22 = v14;

  return v22;
}

void __52__AMSEngagement_contentInfoForApp_cacheKey_version___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__27;
  v13 = __Block_byref_object_dispose__27;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)v10[5];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__AMSEngagement_contentInfoForApp_cacheKey_version___block_invoke_12;
  v6[3] = &unk_1E2541418;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v8 = &v9;
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "contentInfoForApp:cacheKey:version:reply:", v5, v3, v4, v6);

  _Block_object_dispose(&v9, 8);
}

void __52__AMSEngagement_contentInfoForApp_cacheKey_version___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v10);
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    if (v5)
    {
      objc_msgSend(v8, "finishWithError:", v5);
    }
    else
    {
      AMSError(12, CFSTR("Engagement Failure"), CFSTR("Failed to get content info"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "finishWithError:", v9);

    }
  }

}

void __29__AMSEngagement_enqueueData___block_invoke_37(uint64_t a1)
{
  void *v1;
  AMSEngagementEnqueueResult *v2;

  v1 = *(void **)(a1 + 32);
  v2 = objc_alloc_init(AMSEngagementEnqueueResult);
  objc_msgSend(v1, "finishWithResult:", v2);

}

- (id)_enqueue:(id)a3
{
  id v4;
  AMSMutablePromise *v5;
  NSObject *v6;
  uint64_t v7;
  AMSMutablePromise *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  id v12;
  AMSMutablePromise *v13;
  _QWORD v15[4];
  id v16;
  AMSMutablePromise *v17;
  AMSEngagement *v18;
  _QWORD block[4];
  id v20;
  id v21;

  v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend((id)objc_opt_class(), "_engagementQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __26__AMSEngagement__enqueue___block_invoke;
  v15[3] = &unk_1E25414B8;
  v16 = v4;
  v8 = v5;
  v17 = v8;
  v18 = self;
  v9 = v15;
  v10 = v4;
  AMSLogKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E253DC28;
  v20 = v11;
  v21 = v9;
  v12 = v11;
  dispatch_async(v6, block);

  v13 = v8;
  return v13;
}

void __26__AMSEngagement__enqueue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AMSEngagementEnqueueContext *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;

  objc_msgSend(*(id *)(a1 + 32), "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = *(void **)(a1 + 40);
    AMSError(2, CFSTR("No events to enqueue"), &stru_1E2548760, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithPromise:", v6);

  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "destinations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSEngagementClientData loadFromDisk](AMSEngagementClientData, "loadFromDisk");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "destinations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __26__AMSEngagement__enqueue___block_invoke_2;
    v22 = &unk_1E2541490;
    v10 = v8;
    v23 = v10;
    v24 = v3;
    objc_msgSend(v9, "ams_filterUsingTest:", &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count", v19, v20, v21, v22))
    {
      objc_msgSend(*(id *)(a1 + 32), "setDestinations:", v11);
    }
    else
    {
      v12 = *(void **)(a1 + 40);
      AMSError(2, CFSTR("No events to enqueue"), &stru_1E2548760, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "finishWithPromise:", v14);

    }
  }
  v15 = objc_alloc_init(AMSEngagementEnqueueContext);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSEngagementEnqueueContext setStart:](v15, "setStart:", v16);

  -[AMSEngagementEnqueueContext setRequest:](v15, "setRequest:", *(_QWORD *)(a1 + 32));
  v17 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_enqueueWithContext:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "finishWithPromise:", v18);

}

uint64_t __26__AMSEngagement__enqueue___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "destination:allowsEvent:", v4, *(_QWORD *)(a1 + 40));

  return v5;
}

void __37__AMSEngagement__enqueueWithContext___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(v7, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destinations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_recordLoggingEventWithBag:enqueueData:eventType:userInfo:destinations:error:", v11, v5, v6, v8, v10, v3);

}

+ (void)_recordLoggingEventWithBag:(id)a3 enqueueData:(id)a4 eventType:(id)a5 userInfo:(id)a6 destinations:(id)a7 error:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  AMSMetricsLoggingEvent *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  AMSEngagementDestination *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  AMSMetricsLoggingEvent *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  AMSMetricsLoggingEvent *v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v17, "ams_filterUsingTest:", &__block_literal_global_58);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v46 = v15;
    if (!v13)
    {
      +[AMSEngagement createBagForSubProfile](AMSEngagement, "createBagForSubProfile");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v44 = v18;
    v20 = -[AMSMetricsLoggingEvent initWithSubsystem:category:error:]([AMSMetricsLoggingEvent alloc], "initWithSubsystem:category:error:", CFSTR("Engagement"), CFSTR("enqueue"), v18);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("placements"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;

    objc_msgSend(v22, "ams_objectAtIndex:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = v23;
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("placement"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v47 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v47 = v24;

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("destination"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v45 = v16;

    if (objc_msgSend(v26, "length"))
    {
      v27 = -[AMSEngagementDestination initWithIdentifier:]([AMSEngagementDestination alloc], "initWithIdentifier:", v26);
      v53[0] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
      v28 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = v17;
    }
    v29 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v28, "ams_mapWithTransform:", &__block_literal_global_71);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setWithArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSDefaults jsVersionMap](AMSDefaults, "jsVersionMap");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke_3;
    v51[3] = &unk_1E2541570;
    v33 = v31;
    v52 = v33;
    objc_msgSend(v32, "ams_filterUsingTest:", v51);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("breadcrumbs"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMetricsLoggingEvent setBreadcrumbs:](v20, "setBreadcrumbs:", v35);

    -[AMSMetricsLoggingEvent setEventDestinations:](v20, "setEventDestinations:", v28);
    if (objc_msgSend(v46, "length"))
      v36 = v46;
    else
      v36 = 0;
    -[AMSMetricsLoggingEvent setEngagementEventType:](v20, "setEngagementEventType:", v36);
    -[AMSMetricsLoggingEvent setEventPlacement:](v20, "setEventPlacement:", v47);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("serviceType"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v38 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v38 = v37;

    -[AMSMetricsLoggingEvent setEventServiceType:](v20, "setEventServiceType:", v38);
    -[AMSMetricsLoggingEvent setJsVersions:](v20, "setJsVersions:", v34);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("requestUrl"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = v39;
    else
      v40 = 0;

    -[AMSMetricsLoggingEvent setUrl:](v20, "setUrl:", v40);
    +[AMSMetricsLoggingEvent shouldSampleErrorsWithBag:](AMSMetricsLoggingEvent, "shouldSampleErrorsWithBag:", v13);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke_4;
    v48[3] = &unk_1E253E2B0;
    v13 = v13;
    v49 = v13;
    v50 = v20;
    v42 = v20;
    objc_msgSend(v41, "addSuccessBlock:", v48);

    v16 = v45;
    v15 = v46;
    v18 = v44;
  }

}

uint64_t __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allowsResponse");
}

uint64_t __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke_5;
  v3[3] = &unk_1E253E2B0;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

}

void __94__AMSEngagement__recordLoggingEventWithBag_enqueueData_eventType_userInfo_destinations_error___block_invoke_5(uint64_t a1)
{
  id v2;

  +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enqueueEvent:", *(_QWORD *)(a1 + 40));

}

- (id)sync
{
  return -[AMSEngagement syncDestinations:](self, "syncDestinations:", 0);
}

- (id)syncDestinations:(id)a3
{
  id v4;
  AMSEngagementSyncRequest *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(AMSEngagementSyncRequest);
  if (objc_msgSend(v4, "count"))
    v6 = v4;
  else
    v6 = 0;
  -[AMSEngagementSyncRequest setApps:](v5, "setApps:", v6);

  -[AMSEngagementSyncRequest setTimeout:](v5, "setTimeout:", 300.0);
  AMSLogKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSEngagementSyncRequest setLogKey:](v5, "setLogKey:", v7);

  -[AMSEngagement syncWithRequest:](self, "syncWithRequest:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)syncWithRequest:(id)a3
{
  id v4;
  AMSMutablePromise *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD *v9;
  AMSMutablePromise *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  AMSEngagement *v19;
  id v20;
  AMSMutablePromise *v21;
  _QWORD block[4];
  id v23;
  id v24;

  v4 = a3;
  v5 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", 300.0);
  -[AMSEngagement _manageRunningPromise:](self, "_manageRunningPromise:", v5);
  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_engagementQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __33__AMSEngagement_syncWithRequest___block_invoke;
  v17[3] = &unk_1E2541468;
  v18 = v6;
  v19 = self;
  v20 = v4;
  v21 = v5;
  v9 = v17;
  v10 = v5;
  v11 = v4;
  v12 = v6;
  AMSLogKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E253DC28;
  v23 = v13;
  v24 = v9;
  v14 = v13;
  dispatch_async(v7, block);

  -[AMSPromise binaryPromiseAdapter](v10, "binaryPromiseAdapter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __33__AMSEngagement_syncWithRequest___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  __CFString *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _BYTE *v28;
  os_signpost_id_t v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = AMSSetLogKey(0);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(prev: %@)"), *(_QWORD *)(a1 + 32));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E2548760;
  }
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    v31 = (uint64_t (*)(uint64_t, uint64_t))v4;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting sync. %{public}@", buf, 0x20u);

  }
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_enabled(v11);

  if (!v9)
  if (v12)
  {
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_id_make_with_pointer(v15, *(const void **)(a1 + 40));

    if (!v13)
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();

    }
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18C849000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Engagement", "Starting sync", buf, 2u);
    }

  }
  else
  {
    v16 = 0;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__27;
  v32 = __Block_byref_object_dispose__27;
  objc_msgSend(*(id *)(a1 + 40), "connection");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
  v22 = *(void **)(a1 + 48);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __33__AMSEngagement_syncWithRequest___block_invoke_82;
  v24[3] = &unk_1E2541598;
  v24[4] = *(_QWORD *)(a1 + 40);
  v28 = buf;
  v25 = v22;
  v23 = v3;
  v26 = v23;
  v29 = v16;
  v27 = *(id *)(a1 + 56);
  objc_msgSend(v21, "syncWithRequest:completion:", v25, v24);

  _Block_object_dispose(buf, 8);
}

void __33__AMSEngagement_syncWithRequest___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  os_signpost_id_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  os_signpost_id_t v44;
  void *v45;
  os_signpost_id_t v46;
  _BYTE v47[12];
  __int16 v48;
  void *v49;
  __int16 v50;
  double v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 40), "logKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = AMSSetLogKey(v9);

  if (v6)
  {
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow");
      *(_DWORD *)v47 = 138544130;
      if (v15 < 0.0)
        v15 = -v15;
      *(_QWORD *)&v47[4] = v13;
      v48 = 2114;
      v49 = v14;
      v50 = 2048;
      v51 = v15;
      v52 = 2114;
      v53 = v6;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Sync finished with error (%.3f) %{public}@", v47, 0x2Au);

    }
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject", *(_QWORD *)v47);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_signpost_enabled(v18);

    if (!v16)
    if (v19)
    {
      +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "OSLogObject");
        v22 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "OSLogObject");
        v22 = objc_claimAutoreleasedReturnValue();

      }
      v39 = *(_QWORD *)(a1 + 72);
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_DWORD *)v47 = 138543362;
        *(_QWORD *)&v47[4] = v6;
        _os_signpost_emit_with_name_impl(&dword_18C849000, v22, OS_SIGNPOST_EVENT, v39, "Engagement", "Sync finished with error %{public}@", v47, 0xCu);
      }

      +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v40)
      {
        objc_msgSend(v40, "OSLogObject");
        v42 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "OSLogObject");
        v42 = objc_claimAutoreleasedReturnValue();

      }
      v44 = *(_QWORD *)(a1 + 72);
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)v47 = 0;
        _os_signpost_emit_with_name_impl(&dword_18C849000, v42, OS_SIGNPOST_INTERVAL_END, v44, "Engagement", "Error occured", v47, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v6);
  }
  else
  {
    v23 = *(void **)(a1 + 32);
    objc_msgSend(v5, "actions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v23, "_parseActions:", v24);

    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v26, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_opt_class();
      AMSLogKey();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow");
      *(_DWORD *)v47 = 138543874;
      if (v30 < 0.0)
        v30 = -v30;
      *(_QWORD *)&v47[4] = v28;
      v48 = 2114;
      v49 = v29;
      v50 = 2048;
      v51 = v30;
      _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sync finished (%.3f)", v47, 0x20u);

    }
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (!v31)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v32, "OSLogObject", *(_QWORD *)v47);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_signpost_enabled(v33);

    if (!v31)
    if (v34)
    {
      +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v35)
      {
        objc_msgSend(v35, "OSLogObject");
        v37 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "OSLogObject");
        v37 = objc_claimAutoreleasedReturnValue();

      }
      v46 = *(_QWORD *)(a1 + 72);
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)v47 = 0;
        _os_signpost_emit_with_name_impl(&dword_18C849000, v37, OS_SIGNPOST_INTERVAL_END, v46, "Engagement", "Finished", v47, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
  }

}

- (id)syncMetricsIdentifiers
{
  void *v3;
  AMSMutableBinaryPromise *v4;
  NSObject *v5;
  uint64_t v6;
  AMSMutableBinaryPromise *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  id v11;
  AMSMutableBinaryPromise *v12;
  AMSMutableBinaryPromise *v13;
  _QWORD v15[5];
  id v16;
  AMSMutableBinaryPromise *v17;
  _QWORD block[4];
  id v19;
  id v20;

  AMSLogKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(AMSMutableBinaryPromise);
  objc_msgSend((id)objc_opt_class(), "_engagementQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39__AMSEngagement_syncMetricsIdentifiers__block_invoke;
  v15[3] = &unk_1E25414B8;
  v15[4] = self;
  v16 = v3;
  v7 = v4;
  v17 = v7;
  v8 = v15;
  v9 = v3;
  AMSLogKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E253DC28;
  v19 = v10;
  v20 = v8;
  v11 = v10;
  dispatch_async(v5, block);

  v12 = v17;
  v13 = v7;

  return v13;
}

uint64_t __39__AMSEngagement_syncMetricsIdentifiers__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = AMSSetLogKey(0);
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v10 = 138543874;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting metrics identifier sync. %{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncMetricsIdentifiers");

  return objc_msgSend(*(id *)(a1 + 48), "finishWithSuccess");
}

- (id)manualSyncMetricsIdentifiers
{
  AMSMutableBinaryPromise *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  AMSMutableBinaryPromise *v14;
  _QWORD block[4];
  id v16;
  id v17;

  v3 = objc_alloc_init(AMSMutableBinaryPromise);
  if (os_variant_has_internal_content())
  {
    AMSLogKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_engagementQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__AMSEngagement_manualSyncMetricsIdentifiers__block_invoke;
    v12[3] = &unk_1E25414B8;
    v12[4] = self;
    v13 = v4;
    v14 = v3;
    v7 = v12;
    v8 = v4;
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke_2;
    block[3] = &unk_1E253DC28;
    v16 = v9;
    v17 = v7;
    v10 = v9;
    dispatch_async(v5, block);

  }
  else
  {
    -[AMSMutableBinaryPromise finishWithSuccess](v3, "finishWithSuccess");
  }
  return v3;
}

uint64_t __45__AMSEngagement_manualSyncMetricsIdentifiers__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = AMSSetLogKey(0);
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v10 = 138543874;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting metrics identifier manual sync. %{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "manualSyncMetricsIdentifiers");

  return objc_msgSend(*(id *)(a1 + 48), "finishWithSuccess");
}

- (id)_createCombinedLogKey
{
  void *v2;
  void *v3;
  uint64_t v4;

  AMSGenerateLogCorrelationKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AMSLogKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v3, v2);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }

  return v2;
}

- (void)removeObserver:(id)a3 placement:(id)a4 serviceType:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "_engagementQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54__AMSEngagement_removeObserver_placement_serviceType___block_invoke;
  v19[3] = &unk_1E2541468;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v13 = v19;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  AMSLogKey();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke;
  block[3] = &unk_1E253DC28;
  v24 = v17;
  v25 = v13;
  v18 = v17;
  dispatch_sync(v11, block);

}

void __54__AMSEngagement_removeObserver_placement_serviceType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observerInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "observerInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_21;
    if (*(_QWORD *)(a1 + 48))
      objc_msgSend(v5, "removePlacement:");
    if (*(_QWORD *)(a1 + 56))
      objc_msgSend(v5, "removeServiceType:");
    objc_msgSend(v5, "placements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      if (!*(_QWORD *)(a1 + 48))
      {
        v7 = *(_QWORD *)(a1 + 56);

        if (!v7)
          goto LABEL_15;
LABEL_21:

        return;
      }
    }
    else
    {
      objc_msgSend(v5, "serviceTypes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "count"))
      {

LABEL_15:
        +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "OSLogObject");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = objc_opt_class();
          AMSLogKey();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(a1 + 40);
          v15 = 138543874;
          v16 = v11;
          v17 = 2114;
          v18 = v12;
          v19 = 2114;
          v20 = v13;
          _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing %{public}@ as an observer", (uint8_t *)&v15, 0x20u);

        }
        objc_msgSend(*(id *)(a1 + 32), "observerInfo");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
        goto LABEL_20;
      }
      if (!*(_QWORD *)(a1 + 48))
      {
        v14 = *(_QWORD *)(a1 + 56);

        if (v14)
          goto LABEL_21;
        goto LABEL_15;
      }

    }
LABEL_20:

    goto LABEL_21;
  }
}

- (void)addCachePolicy:(int64_t)a3 forPlacements:(id)a4 serviceType:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
        -[AMSEngagement cacheInfo](self, "cacheInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addWithCachePolicy:placement:serviceType:", a3, v14, v9);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (void)_failAllRunningPromisesWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_engagementQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__AMSEngagement__failAllRunningPromisesWithError___block_invoke;
  v11[3] = &unk_1E253E2B0;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  v8 = v4;
  AMSLogKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_1E253DC28;
  v14 = v9;
  v15 = v7;
  v10 = v9;
  dispatch_async(v5, block);

}

void __50__AMSEngagement__failAllRunningPromisesWithError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _BYTE buf[24];
  void *v20;
  id v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "runningPromises");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v5, "count");
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Failing %ld connections", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "runningPromises");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = MEMORY[0x1E0C809B0];
  v9 = *(void **)(a1 + 40);
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__AMSEngagement__failAllRunningPromisesWithError___block_invoke_102;
  v16[3] = &unk_1E253E2B0;
  v17 = v7;
  v18 = v9;
  v11 = v16;
  v12 = v10;
  v13 = v7;
  AMSLogKey();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v8;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_2;
  v20 = &unk_1E253DC28;
  v21 = v14;
  v22 = v11;
  v15 = v14;
  dispatch_async(v12, buf);

}

void __50__AMSEngagement__failAllRunningPromisesWithError___block_invoke_102(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "finishWithError:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_pushEventReceived:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _BYTE buf[24];
  void *v22;
  id v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received push event", buf, 0x16u);

    }
    objc_msgSend((id)objc_opt_class(), "_engagementQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __36__AMSEngagement__pushEventReceived___block_invoke;
    v19[3] = &unk_1E253E2B0;
    v19[4] = self;
    v20 = v5;
    v13 = v19;
    AMSLogKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v12;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_2;
    v22 = &unk_1E253DC28;
    v23 = v14;
    v24 = v13;
    v15 = v14;
    dispatch_async(v11, buf);

  }
  else
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Rejecting received push event with no object", buf, 0x16u);

    }
  }

}

uint64_t __36__AMSEngagement__pushEventReceived___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePushEvent:", *(_QWORD *)(a1 + 40));
}

- (void)handlePushEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _UNKNOWN **v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _UNKNOWN **v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _UNKNOWN **v23;
  uint64_t v24;
  AMSEngagement *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_engagementQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = &off_1E2519000;
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7)
  {
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "actions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v12;
      v8 = &off_1E2519000;
      v42 = 2114;
      v43 = v13;
      v44 = 2048;
      v45 = objc_msgSend(v14, "count");
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Processing %lu push event", buf, 0x20u);

    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v4, "actions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v15)
    {
      v16 = v15;
      v33 = v4;
      v17 = *(_QWORD *)v36;
      v18 = &off_1E2519000;
      do
      {
        v19 = 0;
        v34 = v16;
        do
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v10);
          v20 = (void *)objc_msgSend(objc_alloc((Class)v18[234]), "initWithJSObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v19));
          if (v20)
          {
            -[AMSEngagement _handleServiceResponse:](self, "_handleServiceResponse:", v20);
          }
          else
          {
            objc_msgSend(v8[274], "sharedEngagementConfig");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v21)
            {
              objc_msgSend(v8[274], "sharedConfig");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v21, "OSLogObject");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = v18;
              v24 = v17;
              v25 = self;
              v26 = v10;
              v27 = objc_opt_class();
              AMSLogKey();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v41 = v27;
              v10 = v26;
              self = v25;
              v17 = v24;
              v18 = v23;
              v16 = v34;
              v42 = 2114;
              v43 = v28;
              _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Unable to get service response from push event action", buf, 0x16u);

              v8 = &off_1E2519000;
            }

          }
          ++v19;
        }
        while (v16 != v19);
        v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v16);
      v4 = v33;
    }
  }
  else
  {
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v30 = objc_opt_class();
      AMSLogKey();
      v31 = v4;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v30;
      v42 = 2114;
      v43 = v32;
      _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Push event contains no actions to push", buf, 0x16u);

      v4 = v31;
    }

  }
}

- (void)_handleServiceResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  char v26;
  NSObject *v27;
  uint64_t v28;
  _QWORD *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  char v34;
  NSObject *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned int v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  _QWORD *v71;
  void *v72;
  id v73;
  uint64_t v74;
  void *v75;
  char v76;
  NSObject *v77;
  uint64_t v78;
  _QWORD *v79;
  void *v80;
  id v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  id v89;
  id obj;
  void *v91;
  uint64_t v92;
  AMSEngagement *v93;
  _QWORD v94[6];
  id v95;
  uint64_t v96;
  id v97;
  id v98;
  _QWORD v99[6];
  id v100;
  uint64_t v101;
  id v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[6];
  id v109;
  _QWORD v110[6];
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  void *v116;
  _BYTE buf[24];
  unint64_t v118;
  _BYTE v119[20];
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v93 = self;
  objc_msgSend((id)objc_opt_class(), "_engagementQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "serviceType");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  v89 = v4;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    v4 = v89;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending service response to observers", buf, 0x16u);

  }
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  -[AMSEngagement observerInfo](self, "observerInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v112, v121, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v113;
    v82 = *(_QWORD *)v113;
    v83 = v11;
    do
    {
      v15 = 0;
      v84 = v13;
      do
      {
        if (*(_QWORD *)v113 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * v15);
        -[AMSEngagement observerInfo](v93, "observerInfo", v82, v83);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v16;
        objc_msgSend(v17, "objectForKey:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "placements");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = 0;
        }
        else
        {
          objc_msgSend(v18, "serviceTypes");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v21 == 0;

        }
        v87 = v18;
        objc_msgSend(v18, "serviceTypes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "containsObject:", v91);

        if (v20 || v23)
        {
          objc_msgSend(v4, "engagementRequest");
          v24 = objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v25 = (void *)v24;
            v26 = objc_opt_respondsToSelector();

            if ((v26 & 1) != 0)
            {
              objc_msgSend(v87, "dispatchQueue");
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = MEMORY[0x1E0C809B0];
              v110[0] = MEMORY[0x1E0C809B0];
              v110[1] = 3221225472;
              v110[2] = __40__AMSEngagement__handleServiceResponse___block_invoke;
              v110[3] = &unk_1E25414B8;
              v110[4] = v93;
              v110[5] = v88;
              v111 = v4;
              v29 = v110;
              AMSLogKey();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)buf = v28;
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_2;
              v118 = (unint64_t)&unk_1E253DC28;
              *(_QWORD *)v119 = v30;
              *(_QWORD *)&v119[8] = v29;
              v31 = v30;
              dispatch_async(v27, buf);

            }
          }
          objc_msgSend(v4, "fullScreenMessageRequest");
          v32 = objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v33 = (void *)v32;
            v34 = objc_opt_respondsToSelector();

            if ((v34 & 1) != 0)
            {
              objc_msgSend(v87, "dispatchQueue");
              v35 = objc_claimAutoreleasedReturnValue();
              v36 = MEMORY[0x1E0C809B0];
              v108[0] = MEMORY[0x1E0C809B0];
              v108[1] = 3221225472;
              v108[2] = __40__AMSEngagement__handleServiceResponse___block_invoke_2;
              v108[3] = &unk_1E25414B8;
              v108[4] = v93;
              v108[5] = v88;
              v109 = v4;
              v37 = v108;
              AMSLogKey();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)buf = v36;
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_2;
              v118 = (unint64_t)&unk_1E253DC28;
              *(_QWORD *)v119 = v38;
              *(_QWORD *)&v119[8] = v37;
              v39 = v38;
              dispatch_async(v35, buf);

            }
          }
          objc_msgSend(v4, "placements");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            objc_msgSend(v87, "placements");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "count");

            if (v42)
            {
              objc_msgSend(v87, "placements");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "objectEnumerator");
            }
            else
            {
              objc_msgSend(v4, "placements");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "keyEnumerator");
            }
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              v85 = v44;
              v86 = v15;
              v106 = 0u;
              v107 = 0u;
              v104 = 0u;
              v105 = 0u;
              obj = v44;
              v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
              if (v45)
              {
                v46 = v45;
                v92 = *(_QWORD *)v105;
                do
                {
                  for (i = 0; i != v46; ++i)
                  {
                    if (*(_QWORD *)v105 != v92)
                      objc_enumerationMutation(obj);
                    v48 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * i);
                    objc_msgSend(v4, "placements");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "objectForKeyedSubscript:", v48);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v50)
                    {
                      if (objc_msgSend(v50, "presentationAction") == 1)
                      {
                        objc_msgSend(v50, "makeDialogRequest");
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v51 = 0;
                      }
                      -[AMSEngagement cacheInfo](v93, "cacheInfo");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "serviceType");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      v54 = objc_msgSend(v52, "isBlockedWithMessageRequest:placement:serviceType:", v50, v48, v53);

                      +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v55)
                      {
                        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      objc_msgSend(v55, "OSLogObject");
                      v56 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                      {
                        v57 = objc_opt_class();
                        AMSLogKey();
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138544386;
                        *(_QWORD *)&buf[4] = v57;
                        v4 = v89;
                        *(_WORD *)&buf[12] = 2114;
                        *(_QWORD *)&buf[14] = v58;
                        *(_WORD *)&buf[22] = 2048;
                        v118 = v54;
                        *(_WORD *)v119 = 2114;
                        *(_QWORD *)&v119[2] = v48;
                        *(_WORD *)&v119[10] = 2114;
                        *(_QWORD *)&v119[12] = v91;
                        _os_log_impl(&dword_18C849000, v56, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Cache Lookup %ld for placement %{public}@ serviceType %{public}@", buf, 0x34u);

                      }
                      if (v54)
                      {
                        objc_msgSend(v50, "messageIdentifier");
                        v59 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v59)
                        {
                          +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
                          v60 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v60)
                          {
                            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                            v60 = (void *)objc_claimAutoreleasedReturnValue();
                          }
                          objc_msgSend(v60, "OSLogObject");
                          v61 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                          {
                            v62 = objc_opt_class();
                            AMSLogKey();
                            v63 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v50, "messageIdentifier");
                            v64 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138544386;
                            *(_QWORD *)&buf[4] = v62;
                            *(_WORD *)&buf[12] = 2114;
                            *(_QWORD *)&buf[14] = v63;
                            *(_WORD *)&buf[22] = 2114;
                            v118 = (unint64_t)v64;
                            *(_WORD *)v119 = 2114;
                            *(_QWORD *)&v119[2] = v48;
                            *(_WORD *)&v119[10] = 2114;
                            *(_QWORD *)&v119[12] = v91;
                            _os_log_impl(&dword_18C849000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Notifying message blocked with identifier %{public}@ for placement %{public}@ serviceType %{public}@", buf, 0x34u);

                          }
                          -[AMSEngagement connection](v93, "connection");
                          v65 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v50, "messageIdentifier");
                          v66 = (void *)objc_claimAutoreleasedReturnValue();
                          v116 = v66;
                          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
                          v67 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v65, "notifyBlockedMessages:", v67);

                          v4 = v89;
                        }
                      }
                      else
                      {
                        objc_msgSend(v50, "engagementRequest");
                        v68 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v68)
                        {

                        }
                        else if ((objc_opt_respondsToSelector() & 1) != 0)
                        {
                          objc_msgSend(v87, "dispatchQueue");
                          v69 = objc_claimAutoreleasedReturnValue();
                          v70 = MEMORY[0x1E0C809B0];
                          v99[0] = MEMORY[0x1E0C809B0];
                          v99[1] = 3221225472;
                          v99[2] = __40__AMSEngagement__handleServiceResponse___block_invoke_117;
                          v99[3] = &unk_1E2541650;
                          v99[4] = v93;
                          v99[5] = v48;
                          v100 = v91;
                          v101 = v88;
                          v102 = v51;
                          v103 = v4;
                          v71 = v99;
                          AMSLogKey();
                          v72 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_QWORD *)buf = v70;
                          *(_QWORD *)&buf[8] = 3221225472;
                          *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_2;
                          v118 = (unint64_t)&unk_1E253DC28;
                          *(_QWORD *)v119 = v72;
                          *(_QWORD *)&v119[8] = v71;
                          v73 = v72;
                          dispatch_async(v69, buf);

                        }
                        objc_msgSend(v50, "engagementRequest");
                        v74 = objc_claimAutoreleasedReturnValue();
                        if (v74)
                        {
                          v75 = (void *)v74;
                          v76 = objc_opt_respondsToSelector();

                          if ((v76 & 1) != 0)
                          {
                            objc_msgSend(v87, "dispatchQueue");
                            v77 = objc_claimAutoreleasedReturnValue();
                            v78 = MEMORY[0x1E0C809B0];
                            v94[0] = MEMORY[0x1E0C809B0];
                            v94[1] = 3221225472;
                            v94[2] = __40__AMSEngagement__handleServiceResponse___block_invoke_120;
                            v94[3] = &unk_1E2541650;
                            v94[4] = v93;
                            v94[5] = v48;
                            v95 = v91;
                            v96 = v88;
                            v97 = v50;
                            v98 = v4;
                            v79 = v94;
                            AMSLogKey();
                            v80 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_QWORD *)buf = v78;
                            *(_QWORD *)&buf[8] = 3221225472;
                            *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_2;
                            v118 = (unint64_t)&unk_1E253DC28;
                            *(_QWORD *)v119 = v80;
                            *(_QWORD *)&v119[8] = v79;
                            v81 = v80;
                            dispatch_async(v77, buf);

                          }
                        }
                      }

                    }
                  }
                  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
                }
                while (v46);
              }

              v11 = v83;
              v13 = v84;
              v14 = v82;
              v44 = v85;
              v15 = v86;
            }

          }
        }

        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v112, v121, 16);
    }
    while (v13);
  }

}

void __40__AMSEngagement__handleServiceResponse___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Pushing engagement request", (uint8_t *)&v9, 0x16u);

  }
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "engagementRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "engagement:handleEngagementRequest:completion:", v7, v8, &__block_literal_global_110);

}

void __40__AMSEngagement__handleServiceResponse___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v4;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Pushing full screen message request", buf, 0x16u);

  }
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "fullScreenMessageRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "makeDialogRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__AMSEngagement__handleServiceResponse___block_invoke_113;
  v10[3] = &unk_1E253E210;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "engagement:handleDialogRequest:completion:", v7, v9, v10);

}

uint64_t __40__AMSEngagement__handleServiceResponse___block_invoke_113(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDialogResult:", a2);
}

void __40__AMSEngagement__handleServiceResponse___block_invoke_117(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v13 = 138544130;
    v14 = v4;
    v15 = 2114;
    v16 = v5;
    v17 = 2114;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Pushing dialog request for placement %{public}@ serviceType %{public}@", (uint8_t *)&v13, 0x2Au);

  }
  v8 = *(void **)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 72), "serviceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engagement:didUpdateRequest:placement:serviceType:", v10, v9, v11, v12);

}

void __40__AMSEngagement__handleServiceResponse___block_invoke_120(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v13 = 138544130;
    v14 = v4;
    v15 = 2114;
    v16 = v5;
    v17 = 2114;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Pushing engagement request for placement %{public}@ serviceType %{public}@", (uint8_t *)&v13, 0x2Au);

  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "engagementRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 72), "serviceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "engagement:didUpdateEngagementRequest:placement:serviceType:completion:", v8, v10, v11, v12, &__block_literal_global_122);

}

void __28__AMSEngagement__connection__block_invoke_2()
{
  id v0;

  +[AMSEngagement notificationCenter](AMSEngagement, "notificationCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", 0x1E25538E0, 0);

}

void __28__AMSEngagement__connection__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)_connectionErrorNotification
{
  id v3;

  AMSError(12, CFSTR("Engagement Connection Failed"), CFSTR("The connection encountered an error"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSEngagement _failAllRunningPromisesWithError:](self, "_failAllRunningPromisesWithError:", v3);

}

id *__39__AMSEngagement__scheduleSyncIfNeeded___block_invoke(id *result)
{
  id *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((__hasAttemptedInitialSync & 1) == 0)
  {
    v1 = result;
    __hasAttemptedInitialSync = 1;
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v2, "OSLogObject");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_opt_class();
      AMSLogKey();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543618;
      v7 = v4;
      v8 = 2114;
      v9 = v5;
      _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Scheduling initial sync", (uint8_t *)&v6, 0x16u);

    }
    return (id *)(id)objc_msgSend(v1[4], "sync");
  }
  return result;
}

+ (NSString)bagSubProfile
{
  if (qword_1ECEAD160 != -1)
    dispatch_once(&qword_1ECEAD160, &__block_literal_global_133_0);
  return (NSString *)(id)qword_1ECEAD168;
}

void __30__AMSEngagement_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD168;
  qword_1ECEAD168 = (uint64_t)CFSTR("AMSCore");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEAD170 != -1)
    dispatch_once(&qword_1ECEAD170, &__block_literal_global_136);
  return (NSString *)(id)qword_1ECEAD178;
}

void __37__AMSEngagement_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD178;
  qword_1ECEAD178 = (uint64_t)CFSTR("1");

}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setObserverInfo:(id)a3
{
  objc_storeStrong((id *)&self->_observerInfo, a3);
}

- (void)setRunningPromises:(id)a3
{
  objc_storeStrong((id *)&self->_runningPromises, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

@end
