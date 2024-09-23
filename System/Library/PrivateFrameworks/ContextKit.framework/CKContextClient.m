@implementation CKContextClient

+ (double)timeIntervalBetweenMachTime:(unint64_t)a3 andMachTime:(unint64_t)a4
{
  unint64_t v4;

  v4 = a4 - a3;
  if (a3 >= a4)
    v4 = a3 - a4;
  return (double)(v4 * _timebaseInfo / *(unsigned int *)algn_1ECF91824) / 1000.0 / 1000.0 / 1000.0;
}

- (unint64_t)defaultRequestType
{
  return self->_defaultRequestType;
}

- (int64_t)tryAcquireServiceSemaphoreNeedsIncPending:(BOOL)a3
{
  _BOOL8 v3;
  CKContextClient *v4;
  CKContextSemaphore *v5;
  int64_t v6;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = v4->_serviceSemaphore;
  objc_sync_exit(v4);

  if (v5)
    v6 = -[CKContextSemaphore tryAcquireNeedsIncPending:](v5, "tryAcquireNeedsIncPending:", v3);
  else
    v6 = 2;

  return v6;
}

- (id)newRequest
{
  return -[CKContextRequest initForClient:]([CKContextRequest alloc], "initForClient:", self);
}

+ (void)initialize
{
  void *v3;
  id v4;

  if ((id)objc_opt_class() == a1)
  {
    mach_timebase_info((mach_timebase_info_t)&_timebaseInfo);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
    {
      _application_start_mt = mach_continuous_approximate_time();
      objc_msgSend(a1, "_observeApplicationStateNotifications");
    }

  }
}

+ (void)_observeApplicationStateNotifications
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationDidEnterBackgroundNotification"), 0, 0, &__block_literal_global);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationWillEnterForegroundNotification"), 0, 0, &__block_literal_global_46);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationDidBecomeActiveNotification"), 0, 0, &__block_literal_global_47);

}

uint64_t __56__CKContextClient__observeApplicationStateNotifications__block_invoke()
{
  uint64_t result;

  result = mach_continuous_approximate_time();
  atomic_store(result, &_last_background_mt);
  return result;
}

uint64_t __56__CKContextClient__observeApplicationStateNotifications__block_invoke_2()
{
  uint64_t result;

  result = mach_continuous_approximate_time();
  atomic_store(result, &_last_foreground_mt);
  return result;
}

uint64_t __56__CKContextClient__observeApplicationStateNotifications__block_invoke_3()
{
  uint64_t result;

  result = mach_continuous_approximate_time();
  atomic_store(result, &_last_foreground_mt);
  return result;
}

- (CKContextClient)initWithDefaultRequestType:(unint64_t)a3
{
  CKContextClient *v4;
  CKContextClient *v5;
  uint64_t v6;
  NSMutableArray *updateHandlers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKContextClient;
  v4 = -[CKContextClient init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_defaultRequestType = a3;
    v6 = objc_opt_new();
    updateHandlers = v5->_updateHandlers;
    v5->_updateHandlers = (NSMutableArray *)v6;

    +[CKContextXPCClient registerForServiceUpdateNotifications:](CKContextXPCClient, "registerForServiceUpdateNotifications:", v5);
    -[CKContextClient updateCachedCapabilitiesWithReply:](v5, "updateCachedCapabilitiesWithReply:", 0);
  }
  return v5;
}

- (void)ensureFullyInitialized
{
  CKContextClient *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_sync_exit(obj);

}

- (void)didReceiveCKContextServiceUpdateNotification
{
  CKContextClient *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id buf[2];

  v2 = self;
  objc_sync_enter(v2);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A1AA2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Received ContextKit configuration update notification", (uint8_t *)buf, 2u);
  }
  v3 = (void *)-[NSString copy](v2->_indexVersionId, "copy");
  objc_initWeak(buf, v2);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke;
  v5[3] = &unk_1E462EF28;
  objc_copyWeak(&v7, buf);
  v4 = v3;
  v6 = v4;
  -[CKContextClient updateCachedCapabilitiesWithReply:](v2, "updateCachedCapabilitiesWithReply:", v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);

  objc_sync_exit(v2);
}

void __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_sync_enter(v4);
    v5 = (void *)*((_QWORD *)v4 + 2);
    if (v5)
    {
      if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke_cold_2((uint64_t *)v4 + 2, v6, v7);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(_QWORD *)(a1 + 32);
          v17 = *((_QWORD *)v4 + 2);
          *(_DWORD *)buf = 138412546;
          v33 = v16;
          v34 = 2112;
          v35 = v17;
          _os_log_impl(&dword_1A1AA2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "ContextKit indexVersionId changed: %@ to %@", buf, 0x16u);
        }
        v18 = MEMORY[0x1E0C81028];
        v19 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v20 = objc_msgSend(*((id *)v4 + 3), "count");
          __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke_cold_3((uint64_t)buf, v20, v21);
        }

        dispatch_get_global_queue(17, 0);
        v22 = objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v23 = *((id *)v4 + 3);
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v28 != v25)
                objc_enumerationMutation(v23);
              dispatch_async(v22, *(dispatch_block_t *)(*((_QWORD *)&v27 + 1) + 8 * i));
            }
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          }
          while (v24);
        }

      }
    }
    else
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v8)
        __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    objc_sync_exit(v4);

  }
}

- (void)updateCachedCapabilitiesWithReply:(id)a3
{
  id v4;
  CKContextClient *v5;
  NSSet *capabilities;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  capabilities = v5->_capabilities;
  v5->_capabilities = 0;

  objc_initWeak(&location, v5);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[CKContextClient updateCachedCapabilitiesWithReply:].cold.1();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__CKContextClient_updateCachedCapabilitiesWithReply___block_invoke;
  v8[3] = &unk_1E462EF50;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  -[CKContextClient retrieveCapabilitiesWithReply:](v5, "retrieveCapabilitiesWithReply:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  objc_sync_exit(v5);

}

void __53__CKContextClient_updateCachedCapabilitiesWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id WeakRetained;
  void *v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = (id *)WeakRetained;
    objc_sync_enter(v9);
    if (v12)
      objc_storeStrong(v9 + 1, a2);
    if (v6)
      objc_storeStrong(v9 + 2, a3);
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
    objc_sync_exit(v9);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(void))(v11 + 16))();
  }

}

+ (id)clientWithDefaultRequestType:(unint64_t)a3
{
  unint64_t v3;

  if (a3 <= 0x15)
    v3 = a3;
  else
    v3 = 0;
  return -[CKContextClient initWithDefaultRequestType:]([CKContextClient alloc], "initWithDefaultRequestType:", v3);
}

+ (id)clientWithPreferredRequestType:(unint64_t)a3
{
  unint64_t v3;

  if (a3 <= 0x15)
    v3 = a3;
  else
    v3 = 0;
  return -[CKContextClient initWithDefaultRequestType:]([CKContextClient alloc], "initWithDefaultRequestType:", v3);
}

- (id)createRequest
{
  return -[CKContextRequest initForClient:]([CKContextRequest alloc], "initForClient:", self);
}

- (void)capabilitiesWithReply:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[CKContextClient newRequest](self, "newRequest");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CKContextClient_capabilitiesWithReply___block_invoke;
  v7[3] = &unk_1E462EF78;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "capabilitiesWithReply:", v7);

}

uint64_t __41__CKContextClient_capabilitiesWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerConfigurationUpdateHandler:(id)a3
{
  CKContextClient *v4;
  NSMutableArray *updateHandlers;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  updateHandlers = v4->_updateHandlers;
  v6 = (void *)MEMORY[0x1A1B10ED0](v7);
  -[NSMutableArray addObject:](updateHandlers, "addObject:", v6);

  objc_sync_exit(v4);
}

- (id)retrieveCapabilites
{
  CKContextClient *v2;
  NSSet *capabilities;
  NSSet *v4;
  uint64_t v5;
  CKContextSemaphore *serviceSemaphore;
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v2 = self;
  objc_sync_enter(v2);
  capabilities = v2->_capabilities;
  if (capabilities)
  {
    v4 = capabilities;
  }
  else
  {
    +[CKContextRequest requestServiceSemaphore](CKContextRequest, "requestServiceSemaphore");
    v5 = objc_claimAutoreleasedReturnValue();
    serviceSemaphore = v2->_serviceSemaphore;
    v2->_serviceSemaphore = (CKContextSemaphore *)v5;

    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    v7 = objc_alloc_init(MEMORY[0x1E0CB3530]);
    v8 = -[CKContextClient newRequest](v2, "newRequest");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __38__CKContextClient_retrieveCapabilites__block_invoke;
    v14[3] = &unk_1E462EFA0;
    v16 = &v24;
    v17 = &v18;
    v9 = v7;
    v15 = v9;
    objc_msgSend(v8, "capabilitiesWithReply:", v14);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 10.0);
    v11 = objc_msgSend(v9, "waitUntilDate:", v10);

    if ((v11 & 1) != 0)
    {
      objc_storeStrong((id *)&v2->_indexVersionId, (id)v19[5]);
      objc_storeStrong((id *)&v2->_capabilities, (id)v25[5]);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A1AA2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "retrieveCapabilites timeout", v13, 2u);
    }
    v4 = v2->_capabilities;

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);

  }
  objc_sync_exit(v2);

  return v4;
}

void __38__CKContextClient_retrieveCapabilites__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1A1AA2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "capabilitiesWithReply returned error: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    if (v8)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  objc_msgSend(*(id *)(a1 + 32), "signal");

}

- (void)retrieveCapabilitiesWithReply:(id)a3
{
  void (**v4)(id, NSSet *, NSString *);
  CKContextClient *v5;
  NSSet *capabilities;
  id v7;
  _QWORD v8[4];
  void (**v9)(id, NSSet *, NSString *);
  _QWORD v10[5];
  void (**v11)(id, NSSet *, NSString *);
  id v12;
  id location;

  v4 = (void (**)(id, NSSet *, NSString *))a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    capabilities = v5->_capabilities;
    if (capabilities)
    {
      v4[2](v4, capabilities, v5->_indexVersionId);
    }
    else if (v5->_serviceSemaphore)
    {
      v7 = -[CKContextClient newRequest](v5, "newRequest");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke_59;
      v8[3] = &unk_1E462EF78;
      v9 = v4;
      objc_msgSend(v7, "capabilitiesWithReply:", v8);

    }
    else
    {
      objc_initWeak(&location, v5);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke;
      v10[3] = &unk_1E462EFC8;
      objc_copyWeak(&v12, &location);
      v10[4] = v5;
      v11 = v4;
      +[CKContextRequest requestServiceSemaphoreWithReply:](CKContextRequest, "requestServiceSemaphoreWithReply:", v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v5);

  }
}

void __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke(id *a1, void *a2)
{
  id v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 4, a2);
    v7 = (void *)objc_msgSend(a1[4], "newRequest");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke_2;
    v8[3] = &unk_1E462EF78;
    v9 = a1[5];
    objc_msgSend(v7, "capabilitiesWithReply:", v8);

  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

void __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(void);

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke_2_cold_1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v17();

}

void __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke_59(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(void);

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke_2_cold_1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v17();

}

- (id)indexVersionId
{
  CKContextClient *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_indexVersionId;
  objc_sync_exit(v2);

  return v3;
}

- (NSSet)capabilities
{
  CKContextClient *v2;
  NSSet *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_capabilities;
  objc_sync_exit(v2);

  return v3;
}

- (void)workWithServiceSemaphore:(id)a3
{
  (*((void (**)(id, CKContextSemaphore *))a3 + 2))(a3, self->_serviceSemaphore);
}

- (void)ancestorsForTopics:(id)a3 withReply:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD activity_block[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __48__CKContextClient_ancestorsForTopics_withReply___block_invoke;
  activity_block[3] = &unk_1E462F040;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  _os_activity_initiate(&dword_1A1AA2000, "CKContextClient ancestorsForTopics", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __48__CKContextClient_ancestorsForTopics_withReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[4];
  char v15;
  _QWORD v16[4];
  char v17;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2810000000;
  v16[3] = &unk_1A1AB4839;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2810000000;
  v14[3] = &unk_1A1AB4839;
  v15 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__CKContextClient_ancestorsForTopics_withReply___block_invoke_2;
  v9[3] = &unk_1E462F018;
  v12 = v16;
  v13 = v14;
  v11 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v3 = (void *)MEMORY[0x1A1B10ED0](v9);
  +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __48__CKContextClient_ancestorsForTopics_withReply___block_invoke_4;
  v7[3] = &unk_1E462EFF0;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ancestorsForTopics:withReply:", *(_QWORD *)(a1 + 32), v5);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
}

void __48__CKContextClient_ancestorsForTopics_withReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 *v10;
  unsigned __int8 v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(1u, v7));
  if ((v8 & 1) == 0)
  {
    +[CKContextXPCClient isXPCConnectionError:](CKContextXPCClient, "isXPCConnectionError:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_9;
    v10 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(1u, v10));
    if ((v11 & 1) != 0)
    {
LABEL_9:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __48__CKContextClient_ancestorsForTopics_withReply___block_invoke_3;
      v13[3] = &unk_1E462EFF0;
      v14 = *(id *)(a1 + 40);
      objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ancestorsForTopics:withReply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
  }

}

uint64_t __48__CKContextClient_ancestorsForTopics_withReply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__CKContextClient_ancestorsForTopics_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)groupResponses:(id)a3 withReply:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  id v12;

  v9 = a3;
  v5 = a4;
  if (v5)
  {
    v6 = v9;
    if ((unint64_t)objc_msgSend(v6, "count") >= 0x1F5)
    {
      objc_msgSend(v6, "subarrayWithRange:", 0, 500);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v7;
    }
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __44__CKContextClient_groupResponses_withReply___block_invoke;
    activity_block[3] = &unk_1E462F040;
    v11 = v6;
    v12 = v5;
    v8 = v6;
    _os_activity_initiate(&dword_1A1AA2000, "CKContextClient groupResponses", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
}

void __44__CKContextClient_groupResponses_withReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[4];
  char v15;
  _QWORD v16[4];
  char v17;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2810000000;
  v16[3] = &unk_1A1AB4839;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2810000000;
  v14[3] = &unk_1A1AB4839;
  v15 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__CKContextClient_groupResponses_withReply___block_invoke_2;
  v9[3] = &unk_1E462F068;
  v12 = v16;
  v13 = v14;
  v11 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v3 = (void *)MEMORY[0x1A1B10ED0](v9);
  +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __44__CKContextClient_groupResponses_withReply___block_invoke_4;
  v7[3] = &unk_1E462EFF0;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupResponses:withReply:", *(_QWORD *)(a1 + 32), v5);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
}

void __44__CKContextClient_groupResponses_withReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 *v10;
  unsigned __int8 v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(1u, v7));
  if ((v8 & 1) == 0)
  {
    +[CKContextXPCClient isXPCConnectionError:](CKContextXPCClient, "isXPCConnectionError:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_9;
    v10 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(1u, v10));
    if ((v11 & 1) != 0)
    {
LABEL_9:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __44__CKContextClient_groupResponses_withReply___block_invoke_3;
      v13[3] = &unk_1E462EFF0;
      v14 = *(id *)(a1 + 40);
      objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "groupResponses:withReply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
  }

}

uint64_t __44__CKContextClient_groupResponses_withReply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__CKContextClient_groupResponses_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)isLikelyUnsolicitedUserInteraction
{
  unint64_t v3;
  unint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v18;
  unint64_t v19;
  double v20;
  double v21;

  if (!_application_start_mt)
    return 0;
  v3 = atomic_load(&_last_background_mt);
  v4 = atomic_load(&_last_foreground_mt);
  if (v3 > v4)
  {
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v5)
      +[CKContextClient isLikelyUnsolicitedUserInteraction].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = atomic_load(&_last_foreground_mt);
    atomic_store(v13, &_last_background_mt);
  }
  v14 = mach_continuous_approximate_time();
  v15 = _application_start_mt;
  if (atomic_load(&_last_background_mt))
  {
    if (atomic_load(&_last_foreground_mt))
    {
      v18 = atomic_load(&_last_background_mt);
      v19 = atomic_load(&_last_foreground_mt);
      objc_msgSend(a1, "timeIntervalBetweenMachTime:andMachTime:", v18, v19);
      if (v20 > 900.0)
        v15 = atomic_load(&_last_foreground_mt);
    }
  }
  objc_msgSend(a1, "timeIntervalBetweenMachTime:andMachTime:", v15, v14);
  return v21 < 15.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceSemaphore, 0);
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_indexVersionId, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

void __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1A1AA2000, MEMORY[0x1E0C81028], a3, "ContextKit indexVersionId is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke_cold_2(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_4(&dword_1A1AA2000, MEMORY[0x1E0C81028], a3, "ContextKit indexVersionId unchanged: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

void __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_4(&dword_1A1AA2000, MEMORY[0x1E0C81028], a3, "Notifying %lu registered update handlers", (uint8_t *)a1);
}

- (void)updateCachedCapabilitiesWithReply:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1A1AA2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Updating capabilties asynchronously", v0, 2u);
  OUTLINED_FUNCTION_2();
}

void __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], a3, "CapabilitiesWithReply returned error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)isLikelyUnsolicitedUserInteraction
{
  OUTLINED_FUNCTION_1(&dword_1A1AA2000, MEMORY[0x1E0C81028], a3, "Did not receive an expected foreground notification", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
