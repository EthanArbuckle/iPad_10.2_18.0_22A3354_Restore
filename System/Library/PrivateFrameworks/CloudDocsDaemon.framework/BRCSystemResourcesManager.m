@implementation BRCSystemResourcesManager

void __50__BRCSystemResourcesManager_removeProcessMonitor___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "invalidate");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    v2 = v3;
  }

}

- (void)_setPowerLevelWithCoalescing:(BOOL)a3
{
  void *v5;
  double v6;
  double v7;
  NSObject *powerLevelOKTimer;
  OS_dispatch_source *v9;
  NSObject *v10;
  OS_dispatch_source *v11;
  NSObject *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  dispatch_block_t v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  dispatch_block_t v23;
  OS_dispatch_source *v24;
  _QWORD v25[5];
  BOOL v26;
  _QWORD v27[5];
  BOOL v28;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemPowerLatency");
  v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  if (a3)
  {
    powerLevelOKTimer = self->_powerLevelOKTimer;
    if (self->_powerLevelOK)
    {
      if (powerLevelOKTimer)
      {
        dispatch_source_cancel(powerLevelOKTimer);
        v9 = self->_powerLevelOKTimer;
        self->_powerLevelOKTimer = 0;

      }
    }
    else
    {
      if (powerLevelOKTimer)
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __58__BRCSystemResourcesManager__setPowerLevelWithCoalescing___block_invoke_2;
        v25[3] = &unk_1E8760EE0;
        v25[4] = self;
        v26 = a3;
        v12 = powerLevelOKTimer;
        v13 = v25;
        v14 = v13;
        v15 = v13;
        if (*MEMORY[0x1E0D11070])
        {
          ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v15);
        dispatch_source_set_event_handler(v12, v16);

      }
      else
      {
        v17 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_notificationQueue);
        v18 = dispatch_time(0, (unint64_t)(v7 * 1000000000.0));
        dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(unint64_t)(v7 * 1000000000.0) / 10);

        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __58__BRCSystemResourcesManager__setPowerLevelWithCoalescing___block_invoke;
        v27[3] = &unk_1E8760EE0;
        v27[4] = self;
        v28 = a3;
        v19 = v17;
        v20 = v27;
        v21 = v20;
        v22 = v20;
        if (*MEMORY[0x1E0D11070])
        {
          ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v22);
        dispatch_source_set_event_handler(v19, v23);

        v24 = self->_powerLevelOKTimer;
        self->_powerLevelOKTimer = (OS_dispatch_source *)v19;
        v12 = v19;

        dispatch_resume(v12);
      }

    }
  }
  else
  {
    v10 = self->_powerLevelOKTimer;
    if (v10)
    {
      dispatch_source_cancel(v10);
      v11 = self->_powerLevelOKTimer;
      self->_powerLevelOKTimer = 0;

    }
    if (self->_powerLevelOK)
      -[BRCSystemResourcesManager _setPowerLevel:](self, "_setPowerLevel:", 0);
  }

}

uint64_t __58__BRCSystemResourcesManager__setPowerLevelWithCoalescing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPowerLevel:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __46__BRCSystemResourcesManager__initPowerManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPowerLevelWithCoalescing:", brc_power_is_ok());
}

- (void)_resetPowerManager
{
  NSObject *notificationQueue;
  _QWORD block[5];

  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__BRCSystemResourcesManager__resetPowerManager__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

- (void)removeProcessMonitor:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__BRCSystemResourcesManager_removeProcessMonitor___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(notificationQueue, block);

}

void __36__BRCSystemResourcesManager_manager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)manager_gSystemResourcesManager;
  manager_gSystemResourcesManager = v0;

}

- (void)_initPowerManager
{
  NSHashTable *v3;
  NSHashTable *powerObservers;
  uint64_t v5;
  OS_dispatch_queue *notificationQueue;
  _QWORD *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD handler[4];
  id v15;
  id v16;
  const char *v17;

  self->_powerLevelOK = 1;
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v3 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  powerObservers = self->_powerObservers;
  self->_powerObservers = v3;

  v5 = MEMORY[0x1E0C809B0];
  notificationQueue = self->_notificationQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__BRCSystemResourcesManager__initPowerManager__block_invoke;
  v13[3] = &unk_1E875E0D0;
  v13[4] = self;
  v7 = v13;
  v8 = (void *)MEMORY[0x1E0DC5EE8];
  v9 = notificationQueue;
  objc_msgSend(v8, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "br_currentPersonaID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  handler[0] = v5;
  handler[1] = 3221225472;
  handler[2] = __br_notify_register_dispatch_block_invoke_1;
  handler[3] = &unk_1E875E140;
  v16 = v7;
  v17 = "com.apple.system.powermanagement.SystemLoadAdvisory";
  v15 = v11;
  v12 = v11;
  notify_register_dispatch("com.apple.system.powermanagement.SystemLoadAdvisory", &self->_powerNotifyToken, v9, handler);

  -[BRCSystemResourcesManager _resetPowerManager](self, "_resetPowerManager");
}

+ (id)manager
{
  if (manager_once != -1)
    dispatch_once(&manager_once, &__block_literal_global_68);
  return (id)manager_gSystemResourcesManager;
}

- (void)_setPowerLevel:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *powerLevelOKTimer;
  OS_dispatch_source *v6;
  void *v7;
  NSObject *v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  powerLevelOKTimer = self->_powerLevelOKTimer;
  if (powerLevelOKTimer)
  {
    dispatch_source_cancel(powerLevelOKTimer);
    v6 = self->_powerLevelOKTimer;
    self->_powerLevelOKTimer = 0;

  }
  self->_powerLevelOK = v3;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[BRCSystemResourcesManager _setPowerLevel:].cold.1();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_powerObservers;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "powerLevelChanged:", v3, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

uint64_t __53__BRCSystemResourcesManager_addReachabilityObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "networkReachabilityChanged:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)_initAppListObservers
{
  NSHashTable *v3;
  NSHashTable *appListObservers;
  NSObject *notificationQueue;
  _QWORD handler[5];

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v3 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  appListObservers = self->_appListObservers;
  self->_appListObservers = v3;

  notificationQueue = self->_notificationQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __50__BRCSystemResourcesManager__initAppListObservers__block_invoke;
  handler[3] = &unk_1E8760420;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", notificationQueue, handler);
}

- (BRCSystemResourcesManager)init
{
  BRCSystemResourcesManager *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *notificationQueue;
  void *v7;
  NSObject *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BRCSystemResourcesManager;
  v2 = -[BRCSystemResourcesManager init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.brc.system-resources", v4);

    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    -[BRCSystemResourcesManager _initScreenLockManager](v2, "_initScreenLockManager");
    -[BRCSystemResourcesManager _initReachability](v2, "_initReachability");
    -[BRCSystemResourcesManager _initPowerManager](v2, "_initPowerManager");
    -[BRCSystemResourcesManager _initLowDiskManager](v2, "_initLowDiskManager");
    -[BRCSystemResourcesManager _initLowMemory](v2, "_initLowMemory");
    -[BRCSystemResourcesManager _initProcessObservers](v2, "_initProcessObservers");
    -[BRCSystemResourcesManager _initAppListObservers](v2, "_initAppListObservers");
    -[BRCSystemResourcesManager _initXPCFSEvents](v2, "_initXPCFSEvents");
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCSystemResourcesManager init].cold.1();

  }
  return v2;
}

- (void)close
{
  NSObject *notificationQueue;
  _QWORD block[5];

  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__BRCSystemResourcesManager_close__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_sync(notificationQueue, block);
}

void __34__BRCSystemResourcesManager_close__block_invoke(uint64_t a1)
{
  _BYTE *v1;
  id *v2;
  void *v3;
  NSObject *v4;

  v2 = (id *)(a1 + 32);
  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[16])
  {
    objc_msgSend(v1, "_invalidateScreenLockManager");
    objc_msgSend(*v2, "_invalidateReachability");
    objc_msgSend(*v2, "_invalidatePowerManager");
    objc_msgSend(*v2, "_invalidateLowDiskManager");
    objc_msgSend(*v2, "_invalidateLowMemory");
    objc_msgSend(*v2, "_invalidateProcessObservers");
    objc_msgSend(*v2, "_invalidateAppListObservers");
    *((_BYTE *)*v2 + 16) = 1;
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __34__BRCSystemResourcesManager_close__block_invoke_cold_1();

  }
}

- (void)dealloc
{
  OS_dispatch_queue *notificationQueue;
  objc_super v4;

  -[BRCSystemResourcesManager close](self, "close");
  notificationQueue = self->_notificationQueue;
  self->_notificationQueue = 0;

  v4.receiver = self;
  v4.super_class = (Class)BRCSystemResourcesManager;
  -[BRCSystemResourcesManager dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_3(v0);
  OUTLINED_FUNCTION_0_0(&dword_1CBD43000, v2, v3, "[DEBUG] [%@] has been reset%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)_initScreenLockManager
{
  void *v3;
  NSHashTable *v4;
  NSHashTable *screenLockObservers;

  objc_msgSend(MEMORY[0x1E0D10ED8], "sharedScreenLockMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  screenLockObservers = self->_screenLockObservers;
  self->_screenLockObservers = v4;

}

- (void)_invalidateScreenLockManager
{
  void *v3;
  NSHashTable *screenLockObservers;

  objc_msgSend(MEMORY[0x1E0D10ED8], "sharedScreenLockMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  screenLockObservers = self->_screenLockObservers;
  self->_screenLockObservers = 0;

}

- (void)screenLockChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSHashTable *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v5 = self->_screenLockObservers;
  objc_sync_enter(v5);
  -[NSHashTable allObjects](self->_screenLockObservers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (self->_screenLocked != v3)
  {
    self->_screenLocked = v3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "screenLockChanged:", v3, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)addScreenLockObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_screenLockObservers;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_screenLockObservers, "addObject:", v5);
  objc_sync_exit(v4);

  objc_msgSend(v5, "screenLockChanged:", self->_screenLocked);
}

- (void)removeScreenLockObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_screenLockObservers;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_screenLockObservers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)reachabilityMonitor:(id)a3 didChangeReachabilityStatusTo:(BOOL)a4
{
  NSObject *notificationQueue;
  _QWORD v5[5];
  BOOL v6;

  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__BRCSystemResourcesManager_reachabilityMonitor_didChangeReachabilityStatusTo___block_invoke;
  v5[3] = &unk_1E8760EE0;
  v5[4] = self;
  v6 = a4;
  dispatch_async(notificationQueue, v5);
}

uint64_t __79__BRCSystemResourcesManager_reachabilityMonitor_didChangeReachabilityStatusTo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setIsNetworkReachableWithCoalescing:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_initReachability
{
  NSHashTable *v3;
  NSHashTable *reachabilityObservers;
  BRCStateUpdateCoalescer *v5;
  OS_dispatch_queue *notificationQueue;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BRCStateUpdateCoalescer *v12;
  BRCStateUpdateCoalescer *reachabilityStateUpdateCoalescer;
  void *v14;
  id v15;

  self->_isNetworkReachable = 1;
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v3 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  reachabilityObservers = self->_reachabilityObservers;
  self->_reachabilityObservers = v3;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [BRCStateUpdateCoalescer alloc];
  notificationQueue = self->_notificationQueue;
  objc_msgSend(v15, "systemReachabilityMinDelay");
  v8 = v7;
  objc_msgSend(v15, "systemReachabilityMaxDelay");
  v10 = v9;
  objc_msgSend(v15, "systemReachabilityStableStateMinThreshold");
  v12 = -[BRCStateUpdateCoalescer initWithCallbackQueue:timerMinDelay:timerMaxDelay:stableStateMinThreshold:](v5, "initWithCallbackQueue:timerMinDelay:timerMaxDelay:stableStateMinThreshold:", notificationQueue, v8, v10, v11);
  reachabilityStateUpdateCoalescer = self->_reachabilityStateUpdateCoalescer;
  self->_reachabilityStateUpdateCoalescer = v12;

  objc_msgSend(MEMORY[0x1E0D10EC0], "sharedReachabilityMonitor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:", self);

}

- (void)__resetReachability
{
  -[BRCStateUpdateCoalescer reset](self->_reachabilityStateUpdateCoalescer, "reset");
  -[BRCSystemResourcesManager _setNetworkReachable:](self, "_setNetworkReachable:", self->_isNetworkReachable);
}

- (void)_resetReachability
{
  NSObject *notificationQueue;
  _QWORD block[5];

  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__BRCSystemResourcesManager__resetReachability__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

uint64_t __47__BRCSystemResourcesManager__resetReachability__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__resetReachability");
}

- (void)_invalidateReachability
{
  NSHashTable *reachabilityObservers;
  void *v4;
  BRCStateUpdateCoalescer *reachabilityStateUpdateCoalescer;

  reachabilityObservers = self->_reachabilityObservers;
  self->_reachabilityObservers = 0;

  objc_msgSend(MEMORY[0x1E0D10EC0], "sharedReachabilityMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[BRCSystemResourcesManager __resetReachability](self, "__resetReachability");
  reachabilityStateUpdateCoalescer = self->_reachabilityStateUpdateCoalescer;
  self->_reachabilityStateUpdateCoalescer = 0;

}

- (void)_setIsNetworkReachableWithCoalescing:(BOOL)a3
{
  _BOOL8 v3;
  BRCStateUpdateCoalescer *reachabilityStateUpdateCoalescer;
  _QWORD v6[5];
  BOOL v7;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  reachabilityStateUpdateCoalescer = self->_reachabilityStateUpdateCoalescer;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__BRCSystemResourcesManager__setIsNetworkReachableWithCoalescing___block_invoke;
  v6[3] = &unk_1E8760EE0;
  v6[4] = self;
  v7 = v3;
  -[BRCStateUpdateCoalescer updateStateWithCoalescing:oldState:newState:](reachabilityStateUpdateCoalescer, "updateStateWithCoalescing:oldState:newState:", v6, self->_isNetworkReachable, v3);
}

uint64_t __66__BRCSystemResourcesManager__setIsNetworkReachableWithCoalescing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setNetworkReachable:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isNetworkReachable
{
  NSObject *notificationQueue;
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
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__BRCSystemResourcesManager_isNetworkReachable__block_invoke;
  v5[3] = &unk_1E8760960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(notificationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__BRCSystemResourcesManager_isNetworkReachable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (void)_setNetworkReachable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  self->_isNetworkReachable = v3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "un";
    if (v3)
      v7 = "";
    *(_DWORD *)buf = 136315394;
    v19 = v7;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] Network really becomes %sreachable%@", buf, 0x16u);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_reachabilityObservers;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "networkReachabilityChanged:", v3, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)addReachabilityObserver:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__BRCSystemResourcesManager_addReachabilityObserver___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(notificationQueue, block);

}

- (void)removeReachabilityObserver:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__BRCSystemResourcesManager_removeReachabilityObserver___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(notificationQueue, block);

}

uint64_t __56__BRCSystemResourcesManager_removeReachabilityObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_invalidatePowerManager
{
  NSHashTable *powerObservers;

  notify_cancel(self->_powerNotifyToken);
  self->_powerNotifyToken = 0;
  powerObservers = self->_powerObservers;
  self->_powerObservers = 0;

}

uint64_t __47__BRCSystemResourcesManager__resetPowerManager__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[10];
  if (v3)
  {
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = 0;

    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_setPowerLevel:", brc_power_is_ok());
}

- (BOOL)isPowerOK
{
  NSObject *notificationQueue;
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
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__BRCSystemResourcesManager_isPowerOK__block_invoke;
  v5[3] = &unk_1E8760960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(notificationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__BRCSystemResourcesManager_isPowerOK__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 76);
  return result;
}

uint64_t __58__BRCSystemResourcesManager__setPowerLevelWithCoalescing___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPowerLevel:", *(unsigned __int8 *)(a1 + 40));
}

- (void)addPowerObserver:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__BRCSystemResourcesManager_addPowerObserver___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(notificationQueue, block);

}

uint64_t __46__BRCSystemResourcesManager_addPowerObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "powerLevelChanged:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 76));
}

- (void)removePowerObserver:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__BRCSystemResourcesManager_removePowerObserver___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(notificationQueue, block);

}

uint64_t __49__BRCSystemResourcesManager_removePowerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)connectedToPowerSource
{
  return 1;
}

- (void)_initLowDiskManager
{
  NSMutableSet *v3;
  NSMutableSet *lowDiskSet;
  NSMutableDictionary *v5;
  NSMutableDictionary *lowDiskDict;
  OS_dispatch_source *v7;
  OS_dispatch_source *lowDiskSource;
  OS_dispatch_source *v9;
  NSObject *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  dispatch_block_t v14;
  _QWORD v15[5];

  v3 = (NSMutableSet *)objc_opt_new();
  lowDiskSet = self->_lowDiskSet;
  self->_lowDiskSet = v3;

  v5 = (NSMutableDictionary *)objc_opt_new();
  lowDiskDict = self->_lowDiskDict;
  self->_lowDiskDict = v5;

  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD8], 0, 0x1304uLL, (dispatch_queue_t)self->_notificationQueue);
  lowDiskSource = self->_lowDiskSource;
  self->_lowDiskSource = v7;

  v9 = self->_lowDiskSource;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__BRCSystemResourcesManager__initLowDiskManager__block_invoke;
  v15[3] = &unk_1E875D500;
  v15[4] = self;
  v10 = v9;
  v11 = v15;
  v12 = v11;
  v13 = v11;
  if (*MEMORY[0x1E0D11070])
  {
    ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v13);
  dispatch_source_set_event_handler(v10, v14);

  dispatch_resume((dispatch_object_t)self->_lowDiskSource);
}

void __48__BRCSystemResourcesManager__initLowDiskManager__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  dispatch_source_t v4;
  double v5;
  int64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  dispatch_block_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t v21;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v3 + 128))
  {
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v3 + 8));
    objc_msgSend(v2, "systemLowDiskLatency");
    v6 = (unint64_t)(v5 * 1000000000.0);
    v7 = v4;
    v8 = dispatch_time(0, v6);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, v6 / 10);

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __48__BRCSystemResourcesManager__initLowDiskManager__block_invoke_2;
    v19[3] = &unk_1E875D470;
    v9 = v7;
    v10 = *(_QWORD *)(a1 + 32);
    v20 = v9;
    v21 = v10;
    v11 = v9;
    v12 = v19;
    v13 = v12;
    v14 = v12;
    if (*MEMORY[0x1E0D11070])
    {
      ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v14);
    dispatch_source_set_event_handler(v11, v15);

    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 128);
    *(_QWORD *)(v16 + 128) = v11;
    v18 = v11;

    dispatch_resume(v18);
  }

}

uint64_t __48__BRCSystemResourcesManager__initLowDiskManager__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 128);
  *(_QWORD *)(v2 + 128) = 0;

  return objc_msgSend(*(id *)(a1 + 40), "_processLowDiskNotification:", 0);
}

- (void)_invalidateLowDiskManager
{
  NSObject *lowDiskTimer;
  OS_dispatch_source *v4;
  NSObject *lowDiskSource;
  OS_dispatch_source *v6;
  NSMutableDictionary *lowDiskDict;
  NSMutableSet *lowDiskSet;

  lowDiskTimer = self->_lowDiskTimer;
  if (lowDiskTimer)
  {
    dispatch_source_cancel(lowDiskTimer);
    v4 = self->_lowDiskTimer;
    self->_lowDiskTimer = 0;

  }
  lowDiskSource = self->_lowDiskSource;
  if (lowDiskSource)
  {
    dispatch_source_cancel(lowDiskSource);
    v6 = self->_lowDiskSource;
    self->_lowDiskSource = 0;

  }
  lowDiskDict = self->_lowDiskDict;
  self->_lowDiskDict = 0;

  lowDiskSet = self->_lowDiskSet;
  self->_lowDiskSet = 0;

}

- (void)_resetLowDiskManager
{
  NSObject *notificationQueue;
  _QWORD block[5];

  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__BRCSystemResourcesManager__resetLowDiskManager__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

uint64_t __49__BRCSystemResourcesManager__resetLowDiskManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processLowDiskNotification:", 1);
}

- (void)_processLowDiskNotification:(BOOL)a3
{
  NSMutableDictionary *lowDiskDict;
  _QWORD v6[5];
  BOOL v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  lowDiskDict = self->_lowDiskDict;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__BRCSystemResourcesManager__processLowDiskNotification___block_invoke;
  v6[3] = &unk_1E8768160;
  v6[4] = self;
  v7 = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](lowDiskDict, "enumerateKeysAndObjectsUsingBlock:", v6);
}

void __57__BRCSystemResourcesManager__processLowDiskNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL8 has_enough_space;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  has_enough_space = brc_device_has_enough_space(objc_msgSend(v5, "intValue"));
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "containsObject:", v5);
  if (*(_BYTE *)(a1 + 40) || has_enough_space == v8)
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
    if (has_enough_space)
      objc_msgSend(v9, "removeObject:", v5);
    else
      objc_msgSend(v9, "addObject:", v5);
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v17 = "NOT ";
      *(_DWORD *)buf = 138412802;
      v24 = v5;
      if (has_enough_space)
        v17 = "";
      v25 = 2080;
      v26 = v17;
      v27 = 2112;
      v28 = v10;
      _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] disk %@ has %senough space now%@", buf, 0x20u);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "lowDiskStatusChangedForDevice:hasEnoughSpace:", objc_msgSend(v5, "intValue", (_QWORD)v18), has_enough_space);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
}

- (BOOL)hasEnoughSpaceForDevice:(int)a3
{
  return brc_device_has_enough_space(*(uint64_t *)&a3);
}

- (void)addLowDiskObserver:(id)a3 forDevice:(int)a4
{
  id v6;
  NSObject *notificationQueue;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  int v13;

  v6 = a3;
  if (!a4)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCSystemResourcesManager addLowDiskObserver:forDevice:].cold.1();

  }
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__BRCSystemResourcesManager_addLowDiskObserver_forDevice___block_invoke;
  block[3] = &unk_1E8763008;
  v13 = a4;
  block[4] = self;
  v12 = v6;
  v8 = v6;
  dispatch_sync(notificationQueue, block);

}

void __58__BRCSystemResourcesManager_addLowDiskObserver_forDevice___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKeyedSubscript:", v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "containsObject:", v6);
  if (v2)
  {
    v4 = v3 ^ 1u;
  }
  else
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v2, v6);
    if (brc_device_has_enough_space(*(unsigned int *)(a1 + 48)))
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "addObject:", v6);
      v4 = 0;
    }
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "lowDiskStatusChangedForDevice:hasEnoughSpace:", *(unsigned int *)(a1 + 48), v4);

}

- (void)removeLowDiskObserver:(id)a3 forDevice:(int)a4
{
  id v6;
  NSObject *notificationQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__BRCSystemResourcesManager_removeLowDiskObserver_forDevice___block_invoke;
  block[3] = &unk_1E8763008;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(notificationQueue, block);

}

void __61__BRCSystemResourcesManager_removeLowDiskObserver_forDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));
    if (!objc_msgSend(v3, "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeObjectForKey:", v4);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeObject:", v4);
    }
  }

}

- (void)_initLowMemory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _memoryNotificationEventSource == NULL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __43__BRCSystemResourcesManager__initLowMemory__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveMemoryWarning");
}

uint64_t __43__BRCSystemResourcesManager__initLowMemory__block_invoke_2()
{
  return br_pacer_signal();
}

- (void)_invalidateLowMemory
{
  NSHashTable *lowMemoryObservers;
  NSObject *notificationQueue;
  _QWORD block[5];

  lowMemoryObservers = self->_lowMemoryObservers;
  self->_lowMemoryObservers = 0;

  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__BRCSystemResourcesManager__invalidateLowMemory__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_sync(notificationQueue, block);
}

void __49__BRCSystemResourcesManager__invalidateLowMemory__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 144));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 144);
  *(_QWORD *)(v2 + 144) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 152);
  *(_QWORD *)(v4 + 152) = 0;

}

- (void)_didReceiveMemoryWarning
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Memory warning received%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addLowMemoryObserver:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__BRCSystemResourcesManager_addLowMemoryObserver___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(notificationQueue, block);

}

uint64_t __50__BRCSystemResourcesManager_addLowMemoryObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeLowMemoryObserver:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__BRCSystemResourcesManager_removeLowMemoryObserver___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(notificationQueue, block);

}

uint64_t __53__BRCSystemResourcesManager_removeLowMemoryObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_initProcessObservers
{
  NSMapTable *v3;
  NSMapTable *processObservers;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  processObservers = self->_processObservers;
  self->_processObservers = v3;

}

- (void)_invalidateProcessObservers
{
  NSObject *notificationQueue;
  _QWORD block[5];

  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__BRCSystemResourcesManager__invalidateProcessObservers__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_sync(notificationQueue, block);
}

void __56__BRCSystemResourcesManager__invalidateProcessObservers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6++), "invalidate");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 160);
  *(_QWORD *)(v7 + 160) = 0;

}

- (void)addProcessMonitor:(id)a3 forProcessID:(int)a4
{
  id v6;
  NSObject *notificationQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__BRCSystemResourcesManager_addProcessMonitor_forProcessID___block_invoke;
  block[3] = &unk_1E8763008;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(notificationQueue, block);

}

void __60__BRCSystemResourcesManager_addProcessMonitor_forProcessID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10EB0]), "initForProcessID:observer:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
    if (v3)
    {
      v4 = v3;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));
      v3 = v4;
    }

  }
}

void __50__BRCSystemResourcesManager__initAppListObservers__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __50__BRCSystemResourcesManager__initAppListObservers__block_invoke_cold_1();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 168);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "forceRefetchAppList", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_invalidateAppListObservers
{
  NSHashTable *appListObservers;

  appListObservers = self->_appListObservers;
  self->_appListObservers = 0;

}

- (void)addAppListObserver:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__BRCSystemResourcesManager_addAppListObserver___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(notificationQueue, block);

}

uint64_t __48__BRCSystemResourcesManager_addAppListObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeAppListObserver:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__BRCSystemResourcesManager_removeAppListObserver___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(notificationQueue, block);

}

uint64_t __51__BRCSystemResourcesManager_removeAppListObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appListObservers, 0);
  objc_storeStrong((id *)&self->_processObservers, 0);
  objc_storeStrong((id *)&self->_memoryNotificationCoalescePacer, 0);
  objc_storeStrong((id *)&self->_memoryNotificationEventSource, 0);
  objc_storeStrong((id *)&self->_lowMemoryObservers, 0);
  objc_storeStrong((id *)&self->_lowDiskTimer, 0);
  objc_storeStrong((id *)&self->_lowDiskSource, 0);
  objc_storeStrong((id *)&self->_lowDiskDict, 0);
  objc_storeStrong((id *)&self->_lowDiskSet, 0);
  objc_storeStrong((id *)&self->_connectedToPowerSourceCheckedDate, 0);
  objc_storeStrong((id *)&self->_powerLevelOKTimer, 0);
  objc_storeStrong((id *)&self->_powerObservers, 0);
  objc_storeStrong((id *)&self->_reachabilityStateUpdateCoalescer, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_reachabilityObservers, 0);
  objc_storeStrong((id *)&self->_screenLockObservers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

- (void)init
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_3(v0);
  OUTLINED_FUNCTION_0_0(&dword_1CBD43000, v2, v3, "[DEBUG] [%@] has been initialized%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

void __34__BRCSystemResourcesManager_close__block_invoke_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_3(v0);
  OUTLINED_FUNCTION_0_0(&dword_1CBD43000, v2, v3, "[DEBUG] [%@] has been invalidated%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)_setPowerLevel:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, (uint64_t)v0, "[DEBUG] Power level really becomes %s%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)addLowDiskObserver:forDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: deviceID != 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__BRCSystemResourcesManager__initAppListObservers__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Received an app install notification%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
