@implementation CMContinuityCaptureSessionStateManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  return (id)_sessionStateManager;
}

void __56__CMContinuityCaptureSessionStateManager_sharedInstance__block_invoke()
{
  CMContinuityCaptureSessionStateManager *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [CMContinuityCaptureSessionStateManager alloc];
  v3 = (id)FigDispatchQueueCreateWithPriority();
  v1 = -[CMContinuityCaptureSessionStateManager initWithQueue:](v0, "initWithQueue:", v3);
  v2 = (void *)_sessionStateManager;
  _sessionStateManager = v1;

}

- (CMContinuityCaptureSessionStateManager)initWithQueue:(id)a3
{
  id v5;
  CMContinuityCaptureSessionStateManager *v6;
  CMContinuityCaptureSessionStateManager *v7;
  uint64_t v8;
  NSMapTable *pendingStopCompletionDevices;
  NSMutableDictionary *v10;
  NSMutableDictionary *activeStreamDevicesByEntity;
  uint64_t v12;
  NSHashTable *skippedStopStreamByDevices;
  void *v14;
  CMContinuityCaptureSessionStateManager *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CMContinuityCaptureSessionStateManager;
  v6 = -[CMContinuityCaptureSessionStateManager init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    dispatch_queue_set_specific((dispatch_queue_t)v7->_queue, v7, v7, 0);
    v7->_sessionTerminationGracePeriodInSec = FigGetCFPreferenceNumberWithDefault();
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    pendingStopCompletionDevices = v7->_pendingStopCompletionDevices;
    v7->_pendingStopCompletionDevices = (NSMapTable *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    activeStreamDevicesByEntity = v7->_activeStreamDevicesByEntity;
    v7->_activeStreamDevicesByEntity = v10;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    skippedStopStreamByDevices = v7->_skippedStopStreamByDevices;
    v7->_skippedStopStreamByDevices = (NSHashTable *)v12;

    +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:forKeyPath:options:context:", v7, CFSTR("availableClientDevices"), 3, 0);

    v15 = v7;
  }

  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CMContinuityCaptureActiveSession)activeSession
{
  CMContinuityCaptureSessionStateManager *v2;
  CMContinuityCaptureActiveSession *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeSession;
  objc_sync_exit(v2);

  return v3;
}

- (void)stopStreamForDevice:(id)a3 option:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__CMContinuityCaptureSessionStateManager_stopStreamForDevice_option_completion___block_invoke;
  block[3] = &unk_24F06B068;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __80__CMContinuityCaptureSessionStateManager_stopStreamForDevice_option_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_stopStreamForDevice:option:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_stopStreamForDevice:(id)a3 option:(int64_t)a4 completion:(id)a5
{
  char v6;
  id v8;
  id v9;
  int sessionTerminationGracePeriodInSec;
  NSObject *v11;
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  NSObject *v14;
  id v15;
  id v16;
  dispatch_block_t v17;
  NSMapTable *pendingStopCompletionDevices;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSMutableDictionary *activeStreamDevicesByEntity;
  void *v24;
  NSObject *v25;
  char *v26;
  void *v27;
  dispatch_time_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  id v34;
  id v35;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureSessionStateManager *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v6 = a4;
  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((v6 & 1) != 0)
    sessionTerminationGracePeriodInSec = 0;
  else
    sessionTerminationGracePeriodInSec = self->_sessionTerminationGracePeriodInSec;
  CMContinuityCaptureLog(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v38 = self;
    v39 = 2080;
    v40 = "-[CMContinuityCaptureSessionStateManager _stopStreamForDevice:option:completion:]";
    v41 = 2114;
    v42 = v8;
    v43 = 1024;
    v44 = sessionTerminationGracePeriodInSec;
    _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%@ %s device %{public}@ sessionTerminationGracePeriodInSec:%d", buf, 0x26u);
  }

  -[NSMapTable objectForKey:](self->_pendingStopCompletionDevices, "objectForKey:", v8);
  v12 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    dispatch_block_cancel(v12);
    CMContinuityCaptureLog(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v38 = self;
      v39 = 2080;
      v40 = "-[CMContinuityCaptureSessionStateManager _stopStreamForDevice:option:completion:]";
      v41 = 2114;
      v42 = v8;
      _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%@ %s device %{public}@ pending completion", buf, 0x20u);
    }

    -[NSHashTable removeObject:](self->_skippedStopStreamByDevices, "removeObject:", v8);
    v13[2](v13);
  }
  v29 = MEMORY[0x24BDAC760];
  v30 = 3221225472;
  v31 = __81__CMContinuityCaptureSessionStateManager__stopStreamForDevice_option_completion___block_invoke;
  v32 = &unk_24F06B2D0;
  objc_copyWeak(&v35, &location);
  v15 = v8;
  v33 = v15;
  v16 = v9;
  v34 = v16;
  v17 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v29);
  pendingStopCompletionDevices = self->_pendingStopCompletionDevices;
  v22 = (void *)MEMORY[0x22E2A7CB0](v17, v19, v20, v21);
  -[NSMapTable setObject:forKey:](pendingStopCompletionDevices, "setObject:forKey:", v22, v15, v29, v30, v31, v32);

  activeStreamDevicesByEntity = self->_activeStreamDevicesByEntity;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v15, "entity"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](activeStreamDevicesByEntity, "removeObjectForKey:", v24);

  CMContinuityCaptureLog(0);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    -[NSMutableDictionary allKeys](self->_activeStreamDevicesByEntity, "allKeys");
    v26 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v38 = self;
    v39 = 2114;
    v40 = v26;
    _os_log_impl(&dword_227C5D000, v25, OS_LOG_TYPE_DEFAULT, "%@ remaining active entities %{public}@", buf, 0x16u);

  }
  objc_msgSend(v15, "setStreamIntent:", 0);
  if (!-[CMContinuityCaptureSessionStateManager _isStreamingForDevice:](self, "_isStreamingForDevice:", v15))
  {
    objc_msgSend(v15, "transportDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setStreamIntent:", 0);

  }
  v28 = dispatch_time(0, 1000000000 * sessionTerminationGracePeriodInSec);
  dispatch_after(v28, (dispatch_queue_t)self->_queue, v17);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

void __81__CMContinuityCaptureSessionStateManager__stopStreamForDevice_option_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  NSObject *v4;
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_loadWeakRetained(v2);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v5;
      v9 = 2080;
      v10 = "-[CMContinuityCaptureSessionStateManager _stopStreamForDevice:option:completion:]_block_invoke";
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%@ %s device %{public}@ completion", (uint8_t *)&v7, 0x20u);

    }
    objc_msgSend(WeakRetained[3], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained[5], "removeObject:", *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)_devicesWithPendingStopSession
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NSMapTable keyEnumerator](self->_pendingStopCompletionDevices, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      objc_msgSend(v3, "addObject:", v6);
      objc_msgSend(v4, "nextObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);
  }

  return v3;
}

- (void)startStreamForDevice:(id)a3 startCompletion:(id)a4 startSkippedCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102__CMContinuityCaptureSessionStateManager_startStreamForDevice_startCompletion_startSkippedCompletion___block_invoke;
  block[3] = &unk_24F06B2F8;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __102__CMContinuityCaptureSessionStateManager_startStreamForDevice_startCompletion_startSkippedCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_startStreamForDevice:startCompletion:startSkippedCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)_startStreamForDevice:(id)a3 startCompletion:(id)a4 startSkippedCompletion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  NSObject *v11;
  void *v12;
  NSMutableDictionary *activeStreamDevicesByEntity;
  void *v14;
  NSObject *v15;
  char *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void (**v29)(_QWORD);
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  void (**v35)(_QWORD);
  void (**v36)(_QWORD);
  id v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  CMContinuityCaptureSessionStateManager *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(_QWORD))a4;
  v10 = (void (**)(_QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CMContinuityCaptureLog(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v45 = self;
    v46 = 2080;
    v47 = "-[CMContinuityCaptureSessionStateManager _startStreamForDevice:startCompletion:startSkippedCompletion:]";
    v48 = 2114;
    v49 = v8;
    _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%@ %s device %{public}@", buf, 0x20u);
  }

  objc_msgSend(v8, "setStreamIntent:", 1);
  if (!-[CMContinuityCaptureSessionStateManager _isStreamingForDevice:](self, "_isStreamingForDevice:", v8))
  {
    objc_msgSend(v8, "transportDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStreamIntent:", 1);

  }
  activeStreamDevicesByEntity = self->_activeStreamDevicesByEntity;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "entity"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](activeStreamDevicesByEntity, "setObject:forKeyedSubscript:", v8, v14);

  CMContinuityCaptureLog(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[NSMutableDictionary allKeys](self->_activeStreamDevicesByEntity, "allKeys");
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v45 = self;
    v46 = 2114;
    v47 = v16;
    _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%@ updated active entities %{public}@", buf, 0x16u);

  }
  -[NSMapTable objectForKey:](self->_pendingStopCompletionDevices, "objectForKey:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    CMContinuityCaptureLog(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v45 = self;
      v46 = 2080;
      v47 = "-[CMContinuityCaptureSessionStateManager _startStreamForDevice:startCompletion:startSkippedCompletion:]";
      v48 = 2114;
      v49 = v8;
      _os_log_impl(&dword_227C5D000, v18, OS_LOG_TYPE_DEFAULT, "%@ %s device %{public}@ cancel pending completion", buf, 0x20u);
    }

    dispatch_block_cancel(v17);
    -[NSMapTable removeObjectForKey:](self->_pendingStopCompletionDevices, "removeObjectForKey:", v8);
    -[NSHashTable addObject:](self->_skippedStopStreamByDevices, "addObject:", v8);
    objc_msgSend(v8, "compositeDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "relayEvent:", CFSTR("kCMContinuityCaptureEventUserResume"));

    if (v10)
      v10[2](v10);
  }
  else
  {
    objc_msgSend(v8, "transportDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "deviceIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[CMContinuityCaptureSessionStateManager _devicesWithPendingStopSession](self, "_devicesWithPendingStopSession");
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v23)
    {
      v24 = v23;
      v35 = v10;
      v36 = v9;
      v37 = v8;
      v25 = 0;
      v26 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          v28 = v25;
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(obj);
          v25 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * i);

          -[NSMapTable objectForKey:](self->_pendingStopCompletionDevices, "objectForKey:", v25);
          v29 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "transportDevice");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "deviceIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "UUIDString");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            v33 = !v32 || v22 == 0;
            if (v33 || (objc_msgSend(v32, "isEqualToString:", v22) & 1) == 0)
            {
              CMContinuityCaptureLog(0);
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v45 = self;
                v46 = 2114;
                v47 = (const char *)v25;
                _os_log_impl(&dword_227C5D000, v34, OS_LOG_TYPE_DEFAULT, "%@ complete pending stop for %{public}@", buf, 0x16u);
              }

              v29[2](v29);
              dispatch_block_cancel(v29);
              -[NSMapTable removeObjectForKey:](self->_pendingStopCompletionDevices, "removeObjectForKey:", v25);
              -[NSHashTable removeObject:](self->_skippedStopStreamByDevices, "removeObject:", v25);
            }
          }

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v24);

      v9 = v36;
      v8 = v37;
      v17 = 0;
      v10 = v35;
    }
    v9[2](v9);

  }
}

- (BOOL)_isStreamingForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "transportDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary allValues](self->_activeStreamDevicesByEntity, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "transportDevice", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "deviceIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "UUIDString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7 && v15 && objc_msgSend(v15, "isEqualToString:", v7))
          {

            LOBYTE(v10) = 1;
            goto LABEL_15;
          }

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_15:

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)shouldResetConnectionForDevice:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__CMContinuityCaptureSessionStateManager_shouldResetConnectionForDevice___block_invoke;
  block[3] = &unk_24F06B320;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_async_and_wait(queue, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __73__CMContinuityCaptureSessionStateManager_shouldResetConnectionForDevice___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_shouldResetConnectionForDevice:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_shouldResetConnectionForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableClientDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "transportDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v14, "deviceIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9
          && v16
          && objc_msgSend(v9, "isEqualToString:", v16)
          && objc_msgSend(v14, "hasStreamIntent"))
        {

          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          -[NSHashTable allObjects](self->_skippedStopStreamByDevices, "allObjects", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v11)
          {
            v18 = *(_QWORD *)v25;
            while (2)
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v25 != v18)
                  objc_enumerationMutation(v17);
                objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "transportDevice");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "deviceIdentifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "UUIDString");
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v22 && (objc_msgSend(v9, "isEqualToString:", v22) & 1) != 0)
                {

                  LOBYTE(v11) = 1;
                  goto LABEL_24;
                }

              }
              v11 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              if (v11)
                continue;
              break;
            }
          }
          goto LABEL_24;
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v11)
        continue;
      break;
    }
  }
  v17 = v10;
LABEL_24:

  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__CMContinuityCaptureSessionStateManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v17[3] = &unk_24F06AFA0;
  objc_copyWeak(v21, &location);
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21[1] = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __89__CMContinuityCaptureSessionStateManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_observeValueForKeyPath:ofObject:change:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    WeakRetained = v3;
  }

}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  CMContinuityCaptureSessionStateManager *v44;
  NSMutableDictionary *activeStreamDevicesByEntity;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id obj;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  CMContinuityCaptureSessionStateManager *v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v50 = a4;
  v10 = a5;
  v49 = v9;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("availableClientDevices")))
  {
    v47 = v10;
    +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "availableClientDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    CMContinuityCaptureLog(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v76 = self;
      v77 = 2114;
      v78 = v12;
      _os_log_impl(&dword_227C5D000, v13, OS_LOG_TYPE_DEFAULT, "%@ updated device list %{public}@", buf, 0x16u);
    }

    -[CMContinuityCaptureSessionStateManager _devicesWithPendingStopSession](self, "_devicesWithPendingStopSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v14;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v68 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v19, "transportDevice");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "deviceIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "UUIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, v22);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      }
      while (v16);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v52 = v12;
    v23 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v64 != v24)
            objc_enumerationMutation(v52);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * j), "deviceIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "UUIDString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(v54, "addObject:", v27);
            objc_msgSend(v15, "removeObjectForKey:", v27);
          }

        }
        v23 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      }
      while (v23);
    }

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v15, "allValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v60;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v60 != v30)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * k);
          -[NSMapTable objectForKey:](self->_pendingStopCompletionDevices, "objectForKey:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v33)
          {
            dispatch_block_cancel(v33);
            CMContinuityCaptureLog(0);
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v76 = self;
              v77 = 2114;
              v78 = v32;
              _os_log_impl(&dword_227C5D000, v35, OS_LOG_TYPE_DEFAULT, "%@ remove pending stop for %{public}@", buf, 0x16u);
            }

            -[NSMapTable removeObjectForKey:](self->_pendingStopCompletionDevices, "removeObjectForKey:", v32);
          }

        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      }
      while (v29);
    }

    -[NSMutableDictionary allValues](self->_activeStreamDevicesByEntity, "allValues");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "count"))
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v51 = v48;
      v36 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
      if (v36)
      {
        v37 = *(_QWORD *)v56;
        do
        {
          for (m = 0; m != v36; ++m)
          {
            if (*(_QWORD *)v56 != v37)
              objc_enumerationMutation(v51);
            v39 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * m);
            objc_msgSend(v39, "transportDevice");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "deviceIdentifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "UUIDString");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42 && (objc_msgSend(v54, "containsObject:", v42) & 1) == 0)
            {
              -[NSHashTable removeObject:](self->_skippedStopStreamByDevices, "removeObject:", v39);
              CMContinuityCaptureLog(0);
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v76 = self;
                v77 = 2114;
                v78 = v39;
                _os_log_impl(&dword_227C5D000, v43, OS_LOG_TYPE_DEFAULT, "%@ remove stream intent for terminated device %{public}@", buf, 0x16u);
              }

              v44 = self;
              objc_sync_enter(v44);
              activeStreamDevicesByEntity = self->_activeStreamDevicesByEntity;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v39, "entity"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary removeObjectForKey:](activeStreamDevicesByEntity, "removeObjectForKey:", v46);

              objc_sync_exit(v44);
            }

          }
          v36 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
        }
        while (v36);
      }

    }
    v10 = v47;
  }

}

- (BOOL)startSessionWithDevice:(id)a3 forTransportType:(int64_t)a4 validateTransport:(BOOL)a5 initiatedOnCommunalDevice:(BOOL)a6 outError:(id *)a7
{
  id v12;
  NSObject *queue;
  id v14;
  char v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  int64_t v21;
  BOOL v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v12 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __135__CMContinuityCaptureSessionStateManager_startSessionWithDevice_forTransportType_validateTransport_initiatedOnCommunalDevice_outError___block_invoke;
  v17[3] = &unk_24F06B348;
  v19 = &v30;
  v17[4] = self;
  v14 = v12;
  v20 = &v24;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v18 = v14;
  dispatch_async_and_wait(queue, v17);

  if (a7)
    *a7 = objc_retainAutorelease((id)v25[5]);
  v15 = *((_BYTE *)v31 + 24);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v15;
}

void __135__CMContinuityCaptureSessionStateManager_startSessionWithDevice_forTransportType_validateTransport_initiatedOnCommunalDevice_outError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 72);
  v5 = *(unsigned __int8 *)(a1 + 73);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v2, "_startSessionWithDevice:forTransportType:validateTransport:initiatedOnCommunalDevice:outError:", v3, v6, v4, v5, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
}

- (BOOL)_startSessionWithDevice:(id)a3 forTransportType:(int64_t)a4 validateTransport:(BOOL)a5 initiatedOnCommunalDevice:(BOOL)a6 outError:(id *)a7
{
  _BOOL4 v7;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  BOOL v32;
  char *v33;
  void *v34;
  _UNKNOWN **v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id *v39;
  id v40;
  uint64_t v41;
  void *v42;
  char v43;
  unint64_t v44;
  unint64_t v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  __int16 v50;
  NSObject *v51;
  void *v52;
  char v53;
  NSObject *v54;
  NSObject *v55;
  CMContinuityCaptureSessionStateManager *v56;
  CMContinuityCaptureActiveSession *activeSession;
  NSObject *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  CMContinuityCaptureActiveSession *v64;
  char *v65;
  CMContinuityCaptureSessionStateManager *v66;
  NSObject *v67;
  char *v68;
  NSObject *v69;
  _BOOL4 v72;
  _BOOL4 v74;
  void *v75;
  uint8_t buf[4];
  CMContinuityCaptureSessionStateManager *v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  _BYTE v81[10];
  void *v82;
  __int16 v83;
  _BOOL4 v84;
  __int16 v85;
  uint64_t v86;
  uint64_t v87;

  v72 = a6;
  v7 = a5;
  v87 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "availableClientDevices");
  v11 = objc_claimAutoreleasedReturnValue();

  CMContinuityCaptureLog(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v77 = self;
    v78 = 2080;
    v79 = "-[CMContinuityCaptureSessionStateManager _startSessionWithDevice:forTransportType:validateTransport:initiatedO"
          "nCommunalDevice:outError:]";
    v80 = 2114;
    *(_QWORD *)v81 = v9;
    *(_WORD *)&v81[8] = 2114;
    v82 = v13;
    v83 = 1024;
    v84 = v7;
    v85 = 2114;
    v86 = v11;
    _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%@ %s %{public}@ Active session %{public}@ validateTransport:%d availableDevices:%{public}@", buf, 0x3Au);

  }
  v74 = v7;
  v75 = (void *)v11;

  -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deviceIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "isEqualToString:", v21);

    if ((v22 & 1) == 0)
    {
      CMContinuityCaptureLog(0);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v77 = self;
        v78 = 2082;
        v79 = "-[CMContinuityCaptureSessionStateManager _startSessionWithDevice:forTransportType:validateTransport:initia"
              "tedOnCommunalDevice:outError:]";
        v80 = 2114;
        *(_QWORD *)v81 = v37;
        _os_log_impl(&dword_227C5D000, v36, OS_LOG_TYPE_DEFAULT, "%@ %{public}s already active session for %{public}@", buf, 0x20u);

      }
      v33 = (char *)v9;
      v38 = v75;
      v39 = a7;
      if (!a7)
        goto LABEL_55;
      v40 = objc_alloc(MEMORY[0x24BDD1540]);
      v41 = -1005;
      goto LABEL_51;
    }
  }
  -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
    goto LABEL_9;
  v24 = (void *)v23;
  -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "device");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "deviceIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "UUIDString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "UUIDString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v28, "isEqualToString:", v30);

  if (!v31 || v74)
  {
LABEL_9:
    -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (char *)v9;
    if (v34)
    {

      v35 = &off_24F06A000;
      goto LABEL_16;
    }
    v35 = &off_24F06A000;
    +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "isUserSelectedDeviceIfApplicable:", v9);

    if ((v43 & 1) != 0)
    {
LABEL_16:
      if (v74)
      {
        v44 = objc_msgSend(v9, "deviceStatus") & 0x1000000;
        v45 = objc_msgSend(v9, "deviceStatus") & 0x200;
        CMContinuityCaptureLog(0);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v35[127], "sharedInstance");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "transportErrorFlags");
          *(_DWORD *)buf = 138413058;
          v77 = self;
          v78 = 2048;
          v79 = (const char *)v48;
          v80 = 1024;
          *(_DWORD *)v81 = v44 >> 24;
          *(_WORD *)&v81[4] = 1024;
          *(_DWORD *)&v81[6] = v45 >> 9;
          _os_log_impl(&dword_227C5D000, v46, OS_LOG_TYPE_DEFAULT, "%@ errorFlags : %llx wired:%d wireless:%d", buf, 0x22u);

        }
        objc_msgSend(v35[127], "sharedInstance");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "transportErrorFlags");

        if ((v50 & 0x100) != 0)
        {
          CMContinuityCaptureLog(0);
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v77 = self;
            _os_log_impl(&dword_227C5D000, v51, OS_LOG_TYPE_DEFAULT, "%@ RPError : RPErrorFlagsNoManatee", buf, 0xCu);
          }

        }
        if (!v44)
        {
          objc_msgSend(v35[127], "sharedInstance");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "transportErrorFlags");

          if ((v53 & 4) != 0 || !v45)
          {
            CMContinuityCaptureLog(0);
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v77 = self;
              v78 = 2114;
              v79 = v33;
              _os_log_impl(&dword_227C5D000, v54, OS_LOG_TYPE_DEFAULT, "%@ (%{public}@) RPError : USB inactive and WifiOff", buf, 0x16u);
            }

            if (!v45)
            {
              CMContinuityCaptureLog(0);
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v77 = self;
                v78 = 2114;
                v79 = v33;
                _os_log_impl(&dword_227C5D000, v55, OS_LOG_TYPE_DEFAULT, "%@ (%{public}@) non wired with wifip2p2 disabled", buf, 0x16u);
              }

              v38 = v75;
              if (a7)
                *a7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -1011, 0);
              v56 = self;
              objc_sync_enter(v56);
              activeSession = v56->_activeSession;
              v56->_activeSession = 0;

              objc_sync_exit(v56);
              CMContinuityCaptureLog(0);
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                if (a7)
                  v59 = *a7;
                else
                  v59 = 0;
                *(_DWORD *)buf = 138412802;
                v77 = v56;
                v78 = 2080;
                v79 = "-[CMContinuityCaptureSessionStateManager _startSessionWithDevice:forTransportType:validateTranspor"
                      "t:initiatedOnCommunalDevice:outError:]";
                v80 = 2114;
                *(_QWORD *)v81 = v59;
                _os_log_impl(&dword_227C5D000, v58, OS_LOG_TYPE_DEFAULT, "%@ %s Failed to start session error %{public}@", buf, 0x20u);
              }

LABEL_55:
              v32 = 0;
              goto LABEL_56;
            }
          }
        }
        +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "deviceIdentifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "UUIDString");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "unscheduleNotificationForDeviceIdentifier:type:clearHistory:", v62, 14, 0);

      }
      -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (v63)
      {
        CMContinuityCaptureLog(0);
        v64 = (CMContinuityCaptureActiveSession *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v64->super, OS_LOG_TYPE_DEFAULT))
        {
          -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
          v65 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v77 = self;
          v78 = 2114;
          v79 = v65;
          _os_log_impl(&dword_227C5D000, &v64->super, OS_LOG_TYPE_DEFAULT, "%@ Connect to active session %{public}@", buf, 0x16u);

        }
      }
      else
      {
        v64 = -[CMContinuityCaptureActiveSession initWithDevice:transport:initiatedOnCommunalDevice:]([CMContinuityCaptureActiveSession alloc], "initWithDevice:transport:initiatedOnCommunalDevice:", v33, a4, v72);
        if (v64)
        {
          v66 = self;
          objc_sync_enter(v66);
          objc_storeStrong((id *)&v66->_activeSession, v64);
          objc_sync_exit(v66);

        }
        CMContinuityCaptureLog(0);
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
          v68 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v77 = self;
          v78 = 2114;
          v79 = v68;
          _os_log_impl(&dword_227C5D000, v67, OS_LOG_TYPE_DEFAULT, "%@ Activate session %{public}@", buf, 0x16u);

        }
      }

      v32 = 1;
      goto LABEL_46;
    }
    CMContinuityCaptureLog(0);
    v69 = objc_claimAutoreleasedReturnValue();
    v38 = v75;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v77 = self;
      v78 = 2082;
      v79 = "-[CMContinuityCaptureSessionStateManager _startSessionWithDevice:forTransportType:validateTransport:initiate"
            "dOnCommunalDevice:outError:]";
      v80 = 2114;
      *(_QWORD *)v81 = v9;
      _os_log_impl(&dword_227C5D000, v69, OS_LOG_TYPE_DEFAULT, "%@ %{public}s device %{public}@ unavialble", buf, 0x20u);
    }

    v39 = a7;
    if (!a7)
      goto LABEL_55;
    v40 = objc_alloc(MEMORY[0x24BDD1540]);
    v41 = -1013;
LABEL_51:
    v32 = 0;
    *v39 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), v41, 0);
    goto LABEL_56;
  }
  v32 = 1;
  v33 = (char *)v9;
LABEL_46:
  v38 = v75;
LABEL_56:

  return v32;
}

- (void)stopCurrentSession:(id)a3 syncOnOwnedQueue:(BOOL)a4
{
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;

  v7 = a3;
  if (a4)
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__CMContinuityCaptureSessionStateManager_stopCurrentSession_syncOnOwnedQueue___block_invoke;
    block[3] = &unk_24F06ADE8;
    block[4] = self;
    v9 = v7;
    dispatch_async_and_wait(queue, block);

  }
  else
  {
    -[CMContinuityCaptureSessionStateManager _stopCurrentSession:](self, "_stopCurrentSession:", v7);
  }

}

uint64_t __78__CMContinuityCaptureSessionStateManager_stopCurrentSession_syncOnOwnedQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopCurrentSession:", *(_QWORD *)(a1 + 40));
}

- (void)_stopCurrentSession:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CMContinuityCaptureSessionStateManager *v14;
  CMContinuityCaptureActiveSession *activeSession;
  int v16;
  CMContinuityCaptureSessionStateManager *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "discardUserSelectedDeviceIfApplicableWithReason:", v4);

  CMContinuityCaptureLog(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = self;
    v18 = 2080;
    v19 = "-[CMContinuityCaptureSessionStateManager _stopCurrentSession:]";
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ %s Active session %{public}@ reason %{public}@", (uint8_t *)&v16, 0x2Au);

  }
  -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shieldSessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureSessionStateManager activeSession](self, "activeSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "relayUserDisconnectForTransport:reason:shieldSessionID:", objc_msgSend(v13, "transport"), v4, v10);

    }
    v14 = self;
    objc_sync_enter(v14);
    activeSession = v14->_activeSession;
    v14->_activeSession = 0;

    objc_sync_exit(v14);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_skippedStopStreamByDevices, 0);
  objc_storeStrong((id *)&self->_activeStreamDevicesByEntity, 0);
  objc_storeStrong((id *)&self->_pendingStopCompletionDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
