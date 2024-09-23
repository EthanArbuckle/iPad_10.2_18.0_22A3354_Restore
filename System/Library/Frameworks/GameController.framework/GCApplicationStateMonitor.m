@implementation GCApplicationStateMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_43);
  return (id)sharedInstance_sharedStateMonitor;
}

void __43__GCApplicationStateMonitor_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;

  if (currentProcessIsGameControllerDaemon())
  {
    v0 = objc_opt_new();
    v1 = (void *)sharedInstance_sharedStateMonitor;
    sharedInstance_sharedStateMonitor = v0;

  }
  else if (gc_isInternalBuild())
  {
    getGCAppStateMonitorLogger();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __43__GCApplicationStateMonitor_sharedInstance__block_invoke_cold_1(v2);

  }
}

- (GCApplicationStateMonitor)init
{
  GCApplicationStateMonitor *v2;
  uint64_t v3;
  NSMapTable *observerToPIDs;
  uint64_t v5;
  NSMapTable *pidToObservers;
  uint64_t v7;
  NSMutableDictionary *pidToBundleIdentifier;
  uint64_t v9;
  NSMutableDictionary *pidToCanReceiveEvents;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GCApplicationStateMonitor;
  v2 = -[GCApplicationStateMonitor init](&v14, sel_init);
  if (v2)
  {
    +[NSMapTable weakToStrongObjectsMapTable](&off_254DF7908, "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observerToPIDs = v2->_observerToPIDs;
    v2->_observerToPIDs = (NSMapTable *)v3;

    +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    pidToObservers = v2->_pidToObservers;
    v2->_pidToObservers = (NSMapTable *)v5;

    v7 = objc_opt_new();
    pidToBundleIdentifier = v2->_pidToBundleIdentifier;
    v2->_pidToBundleIdentifier = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    pidToCanReceiveEvents = v2->_pidToCanReceiveEvents;
    v2->_pidToCanReceiveEvents = (NSMutableDictionary *)v9;

    v11 = dispatch_queue_create("com.apple.gamecontroller.appstatemonitor", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

    -[GCApplicationStateMonitor initializeStateMonitor](v2, "initializeStateMonitor");
    -[GCApplicationStateMonitor initializeForegroundMonitor](v2, "initializeForegroundMonitor");
  }
  return v2;
}

- (void)setFrontmostApplication:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  NSObject *v7;
  NSString *frontmostApplicationIdentifier;
  NSObject *v9;
  BKSApplicationStateMonitor *bksStateMonitor;
  uint64_t frontmostApplication;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v3 = *(_QWORD *)&a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[GCApplicationStateMonitor setFrontmostApplication:].cold.3(v3, v12);

  }
  self->_frontmostApplication = v3;
  if ((_DWORD)v3)
  {
    objc_initWeak(&location, self);
    +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", self->_frontmostApplication);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_pidToBundleIdentifier, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_storeStrong((id *)&self->_frontmostApplicationIdentifier, v6);
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          -[GCApplicationStateMonitor setFrontmostApplication:].cold.2();

      }
    }
    else
    {
      bksStateMonitor = self->_bksStateMonitor;
      frontmostApplication = self->_frontmostApplication;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __53__GCApplicationStateMonitor_setFrontmostApplication___block_invoke;
      v13[3] = &unk_24D2B64C8;
      objc_copyWeak(&v14, &location);
      -[BKSApplicationStateMonitor applicationInfoForPID:completion:](bksStateMonitor, "applicationInfoForPID:completion:", frontmostApplication, v13);
      objc_destroyWeak(&v14);
    }

    objc_destroyWeak(&location);
  }
  else
  {
    frontmostApplicationIdentifier = self->_frontmostApplicationIdentifier;
    self->_frontmostApplicationIdentifier = 0;

    if (gc_isInternalBuild())
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[GCApplicationStateMonitor setFrontmostApplication:].cold.1();

    }
  }
}

void __53__GCApplicationStateMonitor_setFrontmostApplication___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  NSObject **v9;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __53__GCApplicationStateMonitor_setFrontmostApplication___block_invoke_2;
    v7[3] = &unk_24D2B2B48;
    v8 = v3;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

void __53__GCApplicationStateMonitor_setFrontmostApplication___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE089E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 64), v2);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __53__GCApplicationStateMonitor_setFrontmostApplication___block_invoke_2_cold_1();

  }
}

- (void)initializeStateMonitor
{
  BKSApplicationStateMonitor *v3;
  BKSApplicationStateMonitor *bksStateMonitor;
  BKSApplicationStateMonitor *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  v3 = (BKSApplicationStateMonitor *)objc_opt_new();
  bksStateMonitor = self->_bksStateMonitor;
  self->_bksStateMonitor = v3;

  -[BKSApplicationStateMonitor updateInterestedStates:](self->_bksStateMonitor, "updateInterestedStates:", 11);
  objc_initWeak(&location, self);
  v5 = self->_bksStateMonitor;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __51__GCApplicationStateMonitor_initializeStateMonitor__block_invoke;
  v9 = &unk_24D2B64C8;
  objc_copyWeak(&v10, &location);
  -[BKSApplicationStateMonitor setHandler:](v5, "setHandler:", &v6);
  -[GCApplicationStateMonitor updateInterestedBundleIDs](self, "updateInterestedBundleIDs", v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __51__GCApplicationStateMonitor_initializeStateMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      getGCAppStateMonitorLogger();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v3;
        _os_log_impl(&dword_215181000, v6, OS_LOG_TYPE_DEFAULT, "Received user info: %@", buf, 0xCu);
      }

    }
    v5 = WeakRetained[2];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__GCApplicationStateMonitor_initializeStateMonitor__block_invoke_62;
    v7[3] = &unk_24D2B2B48;
    v8 = v3;
    v9 = WeakRetained;
    dispatch_async(v5, v7);

  }
}

void __51__GCApplicationStateMonitor_initializeStateMonitor__block_invoke_62(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE089F0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE08A00]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "intValue");
  v5 = objc_msgSend(v3, "intValue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 - 1) > 1)
  {
    v7 = v5;
    if (v4 != 8)
      goto LABEL_6;
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "frontmostApplication") != (_DWORD)v5)
      goto LABEL_6;
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "setFrontmostApplication:", v7);
LABEL_6:
  if (v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((v4 - 1) > 1)
          {
            if (v4 == 8)
              objc_msgSend(v13, "applicationForegrounded:", v5, (_QWORD)v14);
          }
          else
          {
            objc_msgSend(v13, "applicationBackgrounded:", v5);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)addObserver:(id)a3 forProcessIdentifier:(int)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  GCApplicationStateMonitor *v11;
  id v12;
  int v13;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke;
  block[3] = &unk_24D2B4D30;
  objc_copyWeak(&v12, &location);
  v13 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  void *v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[6];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  NSObject *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__10;
    v30 = __Block_byref_object_dispose__10;
    +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 56));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[3], "objectForKey:", v27[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

    if (v5)
    {
      v6 = WeakRetained[3];
      v7 = (void *)objc_opt_new();
      objc_msgSend(v6, "setObject:forKey:", v7, v27[5]);

    }
    objc_msgSend(WeakRetained[3], "objectForKey:", v27[5]);
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject containsObject:](v8, "containsObject:", *(_QWORD *)(a1 + 32)))
    {
      if (!gc_isInternalBuild())
      {
LABEL_15:

        _Block_object_dispose(&v26, 8);
        goto LABEL_16;
      }
      getGCAppStateMonitorLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = v27[5];
        v11 = *(NSObject **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v33 = v10;
        v34 = 2112;
        v35 = v11;
        _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "addObserver - Process %@ is already observed by %@, no need to re-register", buf, 0x16u);
      }
    }
    else
    {
      -[NSObject addObject:](v8, "addObject:", *(_QWORD *)(a1 + 32));
      if (gc_isInternalBuild())
      {
        getGCAppStateMonitorLogger();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = v27[5];
          *(_DWORD *)buf = 138412546;
          v33 = v21;
          v34 = 2112;
          v35 = v8;
          _os_log_impl(&dword_215181000, v20, OS_LOG_TYPE_INFO, "addObserver - Process %@ has the following observers: %@", buf, 0x16u);
        }

      }
      objc_msgSend(WeakRetained[4], "objectForKey:", *(_QWORD *)(a1 + 32));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 == 0;

      if (v13)
      {
        v14 = WeakRetained[4];
        v15 = (void *)objc_opt_new();
        objc_msgSend(v14, "setObject:forKey:", v15, *(_QWORD *)(a1 + 32));

      }
      objc_msgSend(WeakRetained[4], "objectForKey:", *(_QWORD *)(a1 + 32));
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v9, "addObject:", v27[5]);
      if (gc_isInternalBuild())
      {
        getGCAppStateMonitorLogger();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v33 = v23;
          v34 = 2112;
          v35 = v9;
          _os_log_impl(&dword_215181000, v22, OS_LOG_TYPE_INFO, "addObserver - %@ is observing the following processes: %@", buf, 0x16u);
        }

      }
      objc_msgSend(WeakRetained[5], "objectForKey:", v27[5]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == 0;

      if (v17)
      {
        v18 = WeakRetained[1];
        v19 = *(unsigned int *)(a1 + 56);
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke_64;
        v24[3] = &unk_24D2B6518;
        objc_copyWeak(&v25, v2);
        v24[4] = *(_QWORD *)(a1 + 40);
        v24[5] = &v26;
        objc_msgSend(v18, "applicationInfoForPID:completion:", v19, v24);
        objc_destroyWeak(&v25);
      }
    }

    goto LABEL_15;
  }
LABEL_16:

}

void __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  NSObject **v9;
  __int128 v10;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke_2;
    v7[3] = &unk_24D2B64F0;
    v8 = v3;
    v9 = v5;
    v10 = *(_OWORD *)(a1 + 32);
    dispatch_async(v6, v7);

  }
}

void __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE089E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setObject:forKey:", v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    if (gc_isInternalBuild())
    {
      getGCAppStateMonitorLogger();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v6 = 138412546;
        v7 = v4;
        v8 = 2112;
        v9 = v2;
        _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "addObserver - Registered pid %@ with bundle identifier %@", (uint8_t *)&v6, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 48), "updateInterestedBundleIDs");
  }
  else if (gc_isInternalBuild())
  {
    getGCAppStateMonitorLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke_2_cold_1();

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  GCApplicationStateMonitor *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__GCApplicationStateMonitor_removeObserver___block_invoke;
  v7[3] = &unk_24D2B3DE0;
  objc_copyWeak(&v10, &location);
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __44__GCApplicationStateMonitor_removeObserver___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      getGCAppStateMonitorLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v18 = v11;
        _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_INFO, "removeObserver - Removing all observers for %@", buf, 0xCu);
      }

    }
    objc_msgSend(WeakRetained[4], "objectForKey:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 40), "removeObserver:forProcessIdentifier:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "intValue", (_QWORD)v12));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)removeObserver:(id)a3 forProcessIdentifier:(int)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  GCApplicationStateMonitor *v11;
  id v12;
  int v13;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__GCApplicationStateMonitor_removeObserver_forProcessIdentifier___block_invoke;
  block[3] = &unk_24D2B4D30;
  objc_copyWeak(&v12, &location);
  v13 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __65__GCApplicationStateMonitor_removeObserver_forProcessIdentifier___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[3], "objectForKey:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject containsObject:](v4, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      -[NSObject removeObject:](v4, "removeObject:", *(_QWORD *)(a1 + 32));
      if (!-[NSObject count](v4, "count"))
      {
        objc_msgSend(WeakRetained[3], "removeObjectForKey:", v3);
        if (gc_isInternalBuild())
        {
          getGCAppStateMonitorLogger();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v17 = 138412290;
            v18 = v3;
            _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_INFO, "removeObserver - %@ is no longer being observed by anything, removing pid:observer mapping.", (uint8_t *)&v17, 0xCu);
          }

        }
      }
      if (gc_isInternalBuild())
      {
        getGCAppStateMonitorLogger();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v17 = 138412546;
          v18 = v3;
          v19 = 2112;
          v20 = v4;
          _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "removeObserver - Process %@ has the following observers: %@", (uint8_t *)&v17, 0x16u);
        }

      }
      objc_msgSend(WeakRetained[4], "objectForKey:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeObject:](v5, "removeObject:", v3);
      if (gc_isInternalBuild())
      {
        getGCAppStateMonitorLogger();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = *(void **)(a1 + 32);
          v17 = 138412546;
          v18 = v11;
          v19 = 2112;
          v20 = v5;
          _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_INFO, "removeObserver - %@ is no longer observing the following processes: %@", (uint8_t *)&v17, 0x16u);
        }

      }
      if (!-[NSObject count](v5, "count"))
      {
        objc_msgSend(WeakRetained[4], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
        if (gc_isInternalBuild())
        {
          getGCAppStateMonitorLogger();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v15 = *(void **)(a1 + 32);
            v17 = 138412290;
            v18 = v15;
            _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_INFO, "removeObserver - %@ is no longer observing anything, removing observer:pid mapping.", (uint8_t *)&v17, 0xCu);
          }

        }
      }
      objc_msgSend(WeakRetained[5], "objectForKey:", v3);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = -[NSObject containsObject:](v4, "containsObject:", *(_QWORD *)(a1 + 32));

        if ((v8 & 1) == 0)
        {
          if (gc_isInternalBuild())
          {
            getGCAppStateMonitorLogger();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v17 = 138412290;
              v18 = v3;
              _os_log_impl(&dword_215181000, v16, OS_LOG_TYPE_INFO, "removeObserver - %@ is no longer being observed by anything, removing bundleIdentifier mapping", (uint8_t *)&v17, 0xCu);
            }

          }
          objc_msgSend(WeakRetained[5], "removeObjectForKey:", v3);
          objc_msgSend(*(id *)(a1 + 40), "updateInterestedBundleIDs");
        }
      }
    }
    else
    {
      if (!gc_isInternalBuild())
        goto LABEL_15;
      getGCAppStateMonitorLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v12 = *(NSObject **)(a1 + 32);
        v17 = 138412546;
        v18 = v3;
        v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "removeObserver - Process %@ is not observed by %@, no need to unregister", (uint8_t *)&v17, 0x16u);
      }
    }

LABEL_15:
  }

}

- (void)updateInterestedBundleIDs
{
  NSObject *queue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__GCApplicationStateMonitor_updateInterestedBundleIDs__block_invoke;
  block[3] = &unk_24D2B4268;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__GCApplicationStateMonitor_updateInterestedBundleIDs__block_invoke(uint64_t a1)
{
  void *v2;
  id *WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199DE97C]();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(WeakRetained[4], "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "unionSet:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      }
      while (v7);
    }

    if (gc_isInternalBuild())
    {
      getGCAppStateMonitorLogger();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v4;
        _os_log_impl(&dword_215181000, v20, OS_LOG_TYPE_INFO, "updateInterestedBundleIDs - observed PIDs: %@", buf, 0xCu);
      }

    }
    v10 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(WeakRetained[5], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15), (_QWORD)v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v13);
    }

    GCGameIntentBlocklist();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unionSet:", v17);

    if (gc_isInternalBuild())
    {
      getGCAppStateMonitorLogger();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v10;
        _os_log_impl(&dword_215181000, v21, OS_LOG_TYPE_INFO, "updateInterestedBundleIDs - observed bundle identifiers: %@", buf, 0xCu);
      }

    }
    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(v10, "allObjects", (_QWORD)v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateInterestedBundleIDs:", v19);

  }
  objc_autoreleasePoolPop(v2);
}

- (void)onFrontmostApplicationChanged:(int)a3
{
  NSObject *queue;
  _QWORD v6[5];
  id v7;
  int v8;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__GCApplicationStateMonitor_onFrontmostApplicationChanged___block_invoke;
  v6[3] = &unk_24D2B6540;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v8 = a3;
  dispatch_async(queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __59__GCApplicationStateMonitor_onFrontmostApplicationChanged___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint8_t v29[128];
  uint8_t buf[4];
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "frontmostApplication");
    objc_msgSend(*(id *)(a1 + 32), "setFrontmostApplication:", *(unsigned int *)(a1 + 48));
    if (gc_isInternalBuild())
    {
      getGCAppStateMonitorLogger();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 67109120;
        v31 = v19;
        _os_log_impl(&dword_215181000, v18, OS_LOG_TYPE_INFO, "Frontmost application is now %d", buf, 8u);
      }

    }
    +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[3], "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v25;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v25 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v10++), "applicationBackgrounded:", v3);
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v8);
      }
    }
    +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained[3], "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v21;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v21 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17++), "applicationForegrounded:", *(unsigned int *)(a1 + 48), (_QWORD)v20);
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        }
        while (v15);
      }

    }
  }

}

- (void)dealloc
{
  objc_super v3;

  -[BKSApplicationStateMonitor invalidate](self->_bksStateMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)GCApplicationStateMonitor;
  -[GCApplicationStateMonitor dealloc](&v3, sel_dealloc);
}

- (int)frontmostApplication
{
  return self->_frontmostApplication;
}

- (NSString)frontmostApplicationIdentifier
{
  return self->_frontmostApplicationIdentifier;
}

- (void)setFrontmostApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_frontmostApplicationIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontmostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_pidToCanReceiveEvents, 0);
  objc_storeStrong((id *)&self->_pidToBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_observerToPIDs, 0);
  objc_storeStrong((id *)&self->_pidToObservers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bksStateMonitor, 0);
}

- (BOOL)applicationCanReceiveEvents:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pidToCanReceiveEvents, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pidToCanReceiveEvents, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)setApplicationCanReceiveEvents:(BOOL)a3 forPID:(int)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  NSObject *queue;
  _QWORD block[4];
  id v11;
  int v12;
  BOOL v13;
  id location;

  v5 = a3;
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(_QWORD *)&a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pidToCanReceiveEvents, "setObject:forKeyedSubscript:", v8, v7);

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__GCApplicationStateMonitor_ClientCanReceiveEvents__setApplicationCanReceiveEvents_forPID___block_invoke;
  block[3] = &unk_24D2B6568;
  objc_copyWeak(&v11, &location);
  v13 = v5;
  v12 = a4;
  dispatch_async(queue, block);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __91__GCApplicationStateMonitor_ClientCanReceiveEvents__setApplicationCanReceiveEvents_forPID___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      getGCAppStateMonitorLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(unsigned __int8 *)(a1 + 44);
        v12 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 67109376;
        v19 = v11;
        v20 = 1024;
        v21 = v12;
        _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_INFO, "setApplicationCanReceiveEvents %d forPID: %d", buf, 0xEu);
      }

    }
    +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[3], "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "applicationCanReceiveEventsDidChange:forPID:", *(unsigned __int8 *)(a1 + 44), *(unsigned int *)(a1 + 40));
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v7);
      }
    }

  }
}

- (void)removeApplicationFromCanReceiveEventsMonitoring:(int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCAppStateMonitorLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_215181000, v6, OS_LOG_TYPE_INFO, "removeApplicationFromCanReceiveEventsMonitoring %d", (uint8_t *)v7, 8u);
    }

  }
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_pidToCanReceiveEvents, "removeObjectForKey:", v5);

}

void __43__GCApplicationStateMonitor_sharedInstance__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215181000, log, OS_LOG_TYPE_ERROR, "GCApplicationStateMonitor is not accessible from this process.", v1, 2u);
}

- (void)setFrontmostApplication:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_24();
  OUTLINED_FUNCTION_0_30(&dword_215181000, v0, v1, "Setting frontmostApplicationIdentifier to %@", v2);
  OUTLINED_FUNCTION_1_27();
}

- (void)setFrontmostApplication:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_24();
  OUTLINED_FUNCTION_0_30(&dword_215181000, v0, v1, "Setting frontmostApplicationIdentifier to %@", v2);
  OUTLINED_FUNCTION_1_27();
}

- (void)setFrontmostApplication:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_30(&dword_215181000, a2, v4, "setFrontmostApplication %@", (uint8_t *)&v5);

}

void __53__GCApplicationStateMonitor_setFrontmostApplication___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_24();
  OUTLINED_FUNCTION_0_30(&dword_215181000, v0, v1, "Setting frontmostApplicationIdentifier to %@", v2);
  OUTLINED_FUNCTION_1_27();
}

void __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_24();
  _os_log_error_impl(&dword_215181000, v0, OS_LOG_TYPE_ERROR, "addObserver - Error: unable to locate bundle identifier for pid %@", v1, 0xCu);
  OUTLINED_FUNCTION_1_27();
}

@end
