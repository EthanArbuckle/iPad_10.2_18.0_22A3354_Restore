@implementation FPDProcessMonitor

- (void)_handleProcessStateUpdate:(id)a3
{
  NSObject *notificationQueue;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  notificationQueue = self->_notificationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(notificationQueue);
  objc_msgSend(v5, "process");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "pid");
  objc_msgSend(v5, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPDProcessMonitor process:didBecomeForeground:](self, "process:didBecomeForeground:", v6, -[FPDProcessMonitor _isProcessForeground:](self, "_isProcessForeground:", v7));
}

- (void)_addPIDToObserve:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSCountedSet countForObject:](self->_pids, "countForObject:", v5))
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIDForPID, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ state machine is broken"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        -[FPDProcessMonitor _addPIDToObserve:].cold.3((uint64_t)v22, v23, v24, v25, v26, v27, v28, v29);

      __assert_rtn("-[FPDProcessMonitor _addPIDToObserve:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDProcessMonitor.m", 276, (const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
    }
    -[FPDProcessMonitor _bundleIDForPID:](self, "_bundleIDForPID:", v3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v6 = (void *)v8;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bundleIDForPID, "setObject:forKeyedSubscript:", v8, v5);
      if (!-[NSSet containsObject:](self->_excludedBundleIDs, "containsObject:", v6))
      {
        -[NSCountedSet addObject:](self->_bundleIDs, "addObject:", v6);
        -[NSCountedSet addObject:](self->_pids, "addObject:", v5);
        -[FPDProcessMonitor _startMonitoringAndSendInitialNotificationForPID:](self, "_startMonitoringAndSendInitialNotificationForPID:", v3);
        goto LABEL_13;
      }
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[FPDProcessMonitor _addPIDToObserve:].cold.2(v3, v9, v10, v11, v12, v13, v14, v15);
    }
    else
    {
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[FPDProcessMonitor _addPIDToObserve:].cold.1(v3, v9, v16, v17, v18, v19, v20, v21);
      v6 = 0;
    }

  }
  -[NSCountedSet addObject:](self->_pids, "addObject:", v5);
LABEL_13:

}

- (id)_bundleIDForPID:(int)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0D87D68];
  v4 = (void *)MEMORY[0x1E0D87DA0];
  objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateMatchingTarget:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleForPredicate:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_startMonitoringAndSendInitialNotificationForPID:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)MEMORY[0x1E0D87D68];
  v6 = (void *)MEMORY[0x1E0D87DA0];
  objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateMatchingTarget:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleForPredicate:error:", v8, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProcessMonitor process:didBecomeForeground:](self, "process:didBecomeForeground:", v3, -[FPDProcessMonitor _isProcessForeground:](self, "_isProcessForeground:", v9));
  -[FPDProcessMonitor _updateMonitoredBundleIDs](self, "_updateMonitoredBundleIDs");

}

- (BOOL)_isProcessForeground:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "taskState");
  if (RBSTaskStateIsRunning())
  {
    objc_msgSend(v3, "endowmentNamespaces");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __33__FPDProcessMonitor_setDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processMonitor:didBecomeForeground:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isForeground"));

}

- (void)process:(int)a3 didBecomeForeground:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableDictionary *bundleIDForPID;
  void *v8;
  void *v9;
  NSObject *v10;
  FPDProcessMonitor *v11;
  int v12;
  NSMutableSet *foregroundBundleIDs;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t section;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  FPDProcessMonitor *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  bundleIDForPID = self->_bundleIDForPID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](bundleIDForPID, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    section = __fp_create_section();
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v16 = CFSTR("background");
      *(_DWORD *)buf = 134218754;
      if (v4)
        v16 = CFSTR("foreground");
      v19 = section;
      v20 = 2112;
      v21 = self;
      v22 = 1024;
      v23 = a3;
      v24 = 2112;
      v25 = v16;
      _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx received a notif for %@ that [%d] became %@", buf, 0x26u);
    }

    v11 = self;
    objc_sync_enter(v11);
    v12 = -[FPDProcessMonitor isForeground](v11, "isForeground");
    foregroundBundleIDs = v11->_foregroundBundleIDs;
    if (v4)
      -[NSMutableSet addObject:](foregroundBundleIDs, "addObject:", v9);
    else
      -[NSMutableSet removeObject:](foregroundBundleIDs, "removeObject:", v9);
    v14 = -[FPDProcessMonitor isForeground](v11, "isForeground");
    objc_sync_exit(v11);

    if (v12 != (_DWORD)v14)
    {
      -[FPDProcessMonitor delegate](v11, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "processMonitor:didBecomeForeground:", v11, v14);

    }
    __fp_leave_section_Debug();
  }

}

- (BOOL)isForeground
{
  FPDProcessMonitor *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableSet count](v2->_foregroundBundleIDs, "count") != 0;
  objc_sync_exit(v2);

  return v3;
}

- (FPDProcessMonitorDelegate)delegate
{
  FPDProcessMonitor *v2;
  id WeakRetained;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (FPDProcessMonitorDelegate *)WeakRetained;
}

- (void)_updateMonitoredBundleIDs
{
  RBSProcessMonitor *monitor;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  monitor = self->_monitor;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__FPDProcessMonitor__updateMonitoredBundleIDs__block_invoke;
  v4[3] = &unk_1E8C76178;
  v4[4] = self;
  -[RBSProcessMonitor updateConfiguration:](monitor, "updateConfiguration:", v4);
}

- (void)_removePIDToObserve:(int)a3
{
  uint64_t v3;
  void *v5;
  FPDProcessMonitor *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[NSCountedSet countForObject:](self->_pids, "countForObject:"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ removed an object that wasn't observed %@"), v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[FPDProcessMonitor _addPIDToObserve:].cold.3((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

    __assert_rtn("-[FPDProcessMonitor _removePIDToObserve:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDProcessMonitor.m", 359, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
  }
  -[NSCountedSet removeObject:](self->_pids, "removeObject:", v17);
  if (!-[NSCountedSet countForObject:](self->_pids, "countForObject:", v17))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIDForPID, "objectForKeyedSubscript:", v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bundleIDForPID, "setObject:forKeyedSubscript:", 0, v17);
      -[NSCountedSet removeObject:](self->_bundleIDs, "removeObject:", v5);
      if (!-[NSCountedSet countForObject:](self->_bundleIDs, "countForObject:", v5))
      {
        v6 = self;
        objc_sync_enter(v6);
        if (-[NSMutableSet count](v6->_foregroundBundleIDs, "count"))
        {
          -[NSMutableSet removeObject:](v6->_foregroundBundleIDs, "removeObject:", v5);
          v7 = -[NSMutableSet count](v6->_foregroundBundleIDs, "count");
          objc_sync_exit(v6);

          -[FPDProcessMonitor _stopMonitoringPID:](v6, "_stopMonitoringPID:", v3);
          if (!v7)
          {
            -[FPDProcessMonitor delegate](v6, "delegate");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "processMonitor:didBecomeForeground:", v6, 0);

          }
        }
        else
        {
          objc_sync_exit(v6);

          -[FPDProcessMonitor _stopMonitoringPID:](v6, "_stopMonitoringPID:", v3);
        }
      }
    }

  }
}

uint64_t __47__FPDProcessMonitor_initWithExcludedBundleIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createMonitor");
}

uint64_t __46__FPDProcessMonitor__updateMonitoredBundleIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureAppMonitor:", a2);
}

uint64_t __42__FPDProcessMonitor__configureAppMonitor___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleProcessStateUpdate:", *(_QWORD *)(a1 + 40));
}

uint64_t __35__FPDProcessMonitor__createMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureAppMonitor:", a2);
}

uint64_t __42__FPDProcessMonitor__configureAppMonitor___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", a2);
}

uint64_t __37__FPDProcessMonitor_addPIDToObserve___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addPIDToObserve:", *(unsigned int *)(a1 + 40));
}

- (void)_configureAppMonitor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[NSCountedSet allObjects](self->_bundleIDs, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_map:", &__block_literal_global_4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicates:", v6);
  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v7, "setValues:", 1);
    objc_msgSend(v7, "setEndowmentNamespaces:", &unk_1E8C95D78);
  }
  else
  {
    objc_msgSend(v7, "setValues:", 0);
  }
  objc_msgSend(v4, "setStateDescriptor:", v7);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__FPDProcessMonitor__configureAppMonitor___block_invoke_2;
  v8[3] = &unk_1E8C76150;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "setUpdateHandler:", v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __42__FPDProcessMonitor__configureAppMonitor___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "notificationQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__FPDProcessMonitor__configureAppMonitor___block_invoke_3;
    v9[3] = &unk_1E8C75850;
    v9[4] = v7;
    v10 = v5;
    dispatch_async(v8, v9);

  }
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)_createMonitor
{
  RBSProcessMonitor *v3;
  RBSProcessMonitor *monitor;
  _QWORD v5[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__FPDProcessMonitor__createMonitor__block_invoke;
  v5[3] = &unk_1E8C76178;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D87D90], "monitorWithConfiguration:", v5);
  v3 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
  monitor = self->_monitor;
  self->_monitor = v3;

}

- (void)setDelegate:(id)a3
{
  FPDProcessMonitor *v4;
  id v5;
  NSObject *notificationQueue;
  _QWORD block[5];

  v4 = self;
  v5 = a3;
  objc_sync_enter(v4);
  objc_storeWeak((id *)&v4->_delegate, v5);

  objc_sync_exit(v4);
  notificationQueue = v4->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__FPDProcessMonitor_setDelegate___block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = v4;
  dispatch_async(notificationQueue, block);
}

- (FPDProcessMonitor)initWithExcludedBundleIDs:(id)a3
{
  id v4;
  FPDProcessMonitor *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *notificationQueue;
  NSMutableDictionary *v9;
  NSMutableDictionary *bundleIDForPID;
  NSCountedSet *v11;
  NSCountedSet *pids;
  NSCountedSet *v13;
  NSCountedSet *bundleIDs;
  NSMutableSet *v15;
  NSMutableSet *foregroundBundleIDs;
  NSObject *v17;
  FPDProcessMonitor *v18;
  uint64_t v19;
  NSSet *excludedBundleIDs;
  _QWORD block[4];
  FPDProcessMonitor *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)FPDProcessMonitor;
  v5 = -[FPDProcessMonitor init](&v24, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.fileproviderd.process-monitor", v6);
    notificationQueue = v5->_notificationQueue;
    v5->_notificationQueue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    bundleIDForPID = v5->_bundleIDForPID;
    v5->_bundleIDForPID = v9;

    v11 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    pids = v5->_pids;
    v5->_pids = v11;

    v13 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    foregroundBundleIDs = v5->_foregroundBundleIDs;
    v5->_foregroundBundleIDs = v15;

    v17 = v5->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__FPDProcessMonitor_initWithExcludedBundleIDs___block_invoke;
    block[3] = &unk_1E8C75E48;
    v18 = v5;
    v23 = v18;
    dispatch_async(v17, block);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v19 = objc_claimAutoreleasedReturnValue();
    excludedBundleIDs = v18->_excludedBundleIDs;
    v18->_excludedBundleIDs = (NSSet *)v19;

  }
  return v5;
}

uint64_t __41__FPDProcessMonitor_addPIDToObserveSync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addPIDToObserve:", *(unsigned int *)(a1 + 40));
}

uint64_t __40__FPDProcessMonitor_removePIDToObserve___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removePIDToObserve:", *(unsigned int *)(a1 + 40));
}

- (void)removePIDToObserve:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *notificationQueue;
  _QWORD v6[5];
  int v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 >= 1)
  {
    v8 = v3;
    v9 = v4;
    notificationQueue = self->_notificationQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__FPDProcessMonitor_removePIDToObserve___block_invoke;
    v6[3] = &unk_1E8C761A0;
    v6[4] = self;
    v7 = a3;
    dispatch_sync(notificationQueue, v6);
  }
}

- (void)addPIDToObserveSync:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *notificationQueue;
  _QWORD v6[5];
  int v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 >= 1)
  {
    v8 = v3;
    v9 = v4;
    notificationQueue = self->_notificationQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__FPDProcessMonitor_addPIDToObserveSync___block_invoke;
    v6[3] = &unk_1E8C761A0;
    v6[4] = self;
    v7 = a3;
    dispatch_sync(notificationQueue, v6);
  }
}

- (void)addPIDToObserve:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *notificationQueue;
  _QWORD v6[5];
  int v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 >= 1)
  {
    v8 = v3;
    v9 = v4;
    notificationQueue = self->_notificationQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__FPDProcessMonitor_addPIDToObserve___block_invoke;
    v6[3] = &unk_1E8C761A0;
    v6[4] = self;
    v7 = a3;
    dispatch_async(notificationQueue, v6);
  }
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FPDProcessMonitor prettyDescription](self, "prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)prettyDescription
{
  FPDProcessMonitor *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;

  v2 = self;
  objc_sync_enter(v2);
  if (-[NSMutableSet count](v2->_foregroundBundleIDs, "count"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[NSMutableSet allObjects](v2->_foregroundBundleIDs, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("foreground:{%@}"), v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[NSCountedSet count](v2->_bundleIDs, "count"))
    {
      v8 = CFSTR("no process observed");
      goto LABEL_6;
    }
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[NSCountedSet allObjects](v2->_bundleIDs, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("observing:{%@}"), v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (__CFString *)v6;

LABEL_6:
  objc_sync_exit(v2);

  return v8;
}

- (void)_invalidate
{
  RBSProcessMonitor *monitor;

  -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");
  monitor = self->_monitor;
  self->_monitor = 0;

}

- (void)invalidate
{
  FPDProcessMonitor *v2;
  NSObject *notificationQueue;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  objc_storeWeak((id *)&v2->_delegate, 0);
  objc_sync_exit(v2);

  notificationQueue = v2->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__FPDProcessMonitor_invalidate__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = v2;
  dispatch_sync(notificationQueue, block);
}

uint64_t __31__FPDProcessMonitor_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_excludedBundleIDs, 0);
  objc_storeStrong((id *)&self->_foregroundBundleIDs, 0);
  objc_storeStrong((id *)&self->_pids, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_bundleIDForPID, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

- (void)_addPIDToObserve:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CF55F000, a2, a3, "[DEBUG] no bundle ID for %d", a5, a6, a7, a8, 0);
}

- (void)_addPIDToObserve:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CF55F000, a2, a3, "[DEBUG] bundle is excluded %d", a5, a6, a7, a8, 0);
}

- (void)_addPIDToObserve:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_19(&dword_1CF55F000, a2, a3, "[CRIT] %{public}@", a5, a6, a7, a8, 2u);
}

@end
