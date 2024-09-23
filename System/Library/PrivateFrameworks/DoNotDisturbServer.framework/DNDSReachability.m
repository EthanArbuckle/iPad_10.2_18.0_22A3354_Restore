@implementation DNDSReachability

- (DNDSReachability)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  dispatch_source_t v6;
  void *v7;
  nw_path_monitor_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DNDSReachability;
  v2 = -[DNDSReachability init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.donotdisturb.reachability", v3);
    v5 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v4;

    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v2 + 3));
    v7 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v6;

    v8 = nw_path_monitor_create();
    v9 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v10;

    *((_BYTE *)v2 + 10) = 0;
    objc_msgSend(v2, "setupPathMonitor");
  }
  return (DNDSReachability *)v2;
}

+ (id)commonReachability
{
  if (commonReachability_onceToken != -1)
    dispatch_once(&commonReachability_onceToken, &__block_literal_global_9);
  return (id)commonReachability_reachability;
}

void __38__DNDSReachability_commonReachability__block_invoke()
{
  DNDSReachability *v0;
  void *v1;

  v0 = objc_alloc_init(DNDSReachability);
  v1 = (void *)commonReachability_reachability;
  commonReachability_reachability = (uint64_t)v0;

}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;

  -[DNDSReachability debounceTimer](self, "debounceTimer");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v3);

  -[DNDSReachability debounceTimer](self, "debounceTimer");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v4);

  v5.receiver = self;
  v5.super_class = (Class)DNDSReachability;
  -[DNDSReachability dealloc](&v5, sel_dealloc);
}

- (void)_updateHandlerForPath:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  nw_path_status_t status;

  v4 = a3;
  -[DNDSReachability queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  status = nw_path_get_status(v4);
  -[DNDSReachability _setReachable:](self, "_setReachable:", (status & 0xFFFFFFFD) == 1);
  if (!-[DNDSReachability isInitialized](self, "isInitialized"))
  {
    -[DNDSReachability setInitialized:](self, "setInitialized:", 1);
    -[DNDSReachability setLastInformedReachability:](self, "setLastInformedReachability:", (status & 0xFFFFFFFD) == 1);
  }
}

- (void)setupPathMonitor
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *debounceTimer;
  _QWORD v8[5];
  _QWORD update_handler[5];

  -[DNDSReachability pathMonitor](self, "pathMonitor");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  update_handler[0] = MEMORY[0x1E0C809B0];
  update_handler[1] = 3221225472;
  update_handler[2] = __36__DNDSReachability_setupPathMonitor__block_invoke;
  update_handler[3] = &unk_1E86A69C0;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v3, update_handler);

  -[DNDSReachability pathMonitor](self, "pathMonitor");
  v5 = objc_claimAutoreleasedReturnValue();
  -[DNDSReachability queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_set_queue(v5, v6);

  debounceTimer = self->_debounceTimer;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __36__DNDSReachability_setupPathMonitor__block_invoke_2;
  v8[3] = &unk_1E86A5970;
  v8[4] = self;
  dispatch_source_set_event_handler(debounceTimer, v8);
}

uint64_t __36__DNDSReachability_setupPathMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHandlerForPath:", a2);
}

uint64_t __36__DNDSReachability_setupPathMonitor__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_informDelegates");
}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[DNDSReachability queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__DNDSReachability_addDelegate___block_invoke;
  block[3] = &unk_1E86A59E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __32__DNDSReachability_addDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *evaluator_for_endpoint;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "debounceTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);

    objc_msgSend(*(id *)(a1 + 32), "debounceTimer");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v5);

    objc_msgSend(*(id *)(a1 + 32), "pathMonitor");
    v6 = objc_claimAutoreleasedReturnValue();
    nw_path_monitor_start(v6);

    evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
    if (evaluator_for_endpoint)
    {
      v8 = (void *)nw_path_evaluator_copy_path();
      objc_msgSend(*(id *)(a1 + 32), "_updateHandlerForPath:", v8);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[DNDSReachability queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__DNDSReachability_removeDelegate___block_invoke;
  block[3] = &unk_1E86A59E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __35__DNDSReachability_removeDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "debounceTimer");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v5);

    objc_msgSend(*(id *)(a1 + 32), "pathMonitor");
    v6 = objc_claimAutoreleasedReturnValue();
    nw_path_monitor_cancel(v6);

    objc_msgSend(*(id *)(a1 + 32), "setInitialized:", 0);
  }
}

- (void)_setReachable:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  int v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  -[DNDSReachability queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[DNDSReachability isReachable](self, "isReachable") != v3)
  {
    self->_reachable = v3;
    if (-[DNDSReachability isInitialized](self, "isInitialized"))
    {
      v6 = (void *)DNDSLogSystemState;
      if (os_log_type_enabled((os_log_t)DNDSLogSystemState, OS_LOG_TYPE_INFO))
      {
        v7 = (void *)MEMORY[0x1E0CB37E8];
        v8 = v6;
        objc_msgSend(v7, "numberWithBool:", v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_INFO, "Informed of reachability change to %@", (uint8_t *)&v12, 0xCu);

      }
      -[DNDSReachability debounceTimer](self, "debounceTimer");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = dispatch_walltime(0, 1000000000);
      dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

    }
  }
}

- (void)_informDelegates
{
  NSObject *v3;
  _BOOL8 v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[DNDSReachability queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[DNDSReachability isReachable](self, "isReachable");
  v5 = -[DNDSReachability lastInformedReachability](self, "lastInformedReachability");
  v6 = (void *)DNDSLogSystemState;
  v7 = os_log_type_enabled((os_log_t)DNDSLogSystemState, OS_LOG_TYPE_DEFAULT);
  if (v4 == v5)
  {
    if (v7)
    {
      v16 = (void *)MEMORY[0x1E0CB37E8];
      v17 = v6;
      objc_msgSend(v16, "numberWithBool:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, "Debounced reachability state (%@) did not change. Ignoring.", buf, 0xCu);

    }
  }
  else
  {
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      v9 = v6;
      objc_msgSend(v8, "numberWithBool:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v10;
      _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Informing delegates of debounced reachability state: %@", buf, 0xCu);

    }
    -[DNDSReachability setLastInformedReachability:](self, "setLastInformedReachability:", v4);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[DNDSReachability delegates](self, "delegates", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15++), "reachabilityChangedTo:", v4);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

  }
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_source)debounceTimer
{
  return self->_debounceTimer;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (BOOL)lastInformedReachability
{
  return self->_lastInformedReachability;
}

- (void)setLastInformedReachability:(BOOL)a3
{
  self->_lastInformedReachability = a3;
}

- (BOOL)isInitialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

@end
