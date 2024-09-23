@implementation HDMaintenanceWorkCoordinator

- (HDMaintenanceWorkCoordinator)init
{
  HDMaintenanceWorkCoordinator *v2;
  uint64_t v3;
  OS_dispatch_queue *managementQueue;
  uint64_t v5;
  OS_dispatch_queue *maintenanceWorkQueue;
  NSMutableArray *v7;
  NSMutableArray *pendingOperations;
  NSMutableSet *v9;
  NSMutableSet *activeOperations;
  HDAssertionManager *v11;
  HDAssertionManager *assertionManager;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HDMaintenanceWorkCoordinator;
  v2 = -[HDMaintenanceWorkCoordinator init](&v14, sel_init);
  if (v2)
  {
    HKCreateSerialDispatchQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    managementQueue = v2->_managementQueue;
    v2->_managementQueue = (OS_dispatch_queue *)v3;

    HKCreateConcurrentDispatchQueueWithQOSClass();
    v5 = objc_claimAutoreleasedReturnValue();
    maintenanceWorkQueue = v2->_maintenanceWorkQueue;
    v2->_maintenanceWorkQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingOperations = v2->_pendingOperations;
    v2->_pendingOperations = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeOperations = v2->_activeOperations;
    v2->_activeOperations = v9;

    v11 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E0D29808]);
    assertionManager = v2->_assertionManager;
    v2->_assertionManager = v11;

    -[HDAssertionManager addObserver:forAssertionIdentifier:queue:](v2->_assertionManager, "addObserver:forAssertionIdentifier:queue:", v2, CFSTR("_HDMaintenanceWorkCoordinatorSuspensionAssertion;"),
      v2->_managementQueue);
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDMaintenanceWorkCoordinator _lock_cancelActiveTimeoutTimer]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)HDMaintenanceWorkCoordinator;
  -[HDMaintenanceWorkCoordinator dealloc](&v4, sel_dealloc);
}

- (void)_lock_cancelActiveTimeoutTimer
{
  NSObject *v2;
  void *v3;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 56);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = 0;

    }
  }
}

- (BOOL)suspended
{
  HDMaintenanceWorkCoordinator *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_suspended;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)enqueueMaintenanceOperation:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  NSMutableSet *activeOperations;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  NSMutableSet *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v4, "setEnqueuedTime:", CFAbsoluteTimeGetCurrent());
  if (self->_suspended)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v4;
      v6 = "%{public}@: Enqueued (suspended)";
LABEL_4:
      v7 = v5;
      v8 = 12;
LABEL_8:
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
    }
  }
  else
  {
    v9 = -[NSMutableSet count](self->_activeOperations, "count");
    _HKInitializeLogging();
    HKLogInfrastructure();
    v5 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (!v9)
    {
      if (!v10)
        goto LABEL_9;
      v13 = 138543362;
      v14 = v4;
      v6 = "%{public}@: Enqueued for immediate start";
      goto LABEL_4;
    }
    if (v10)
    {
      v11 = -[NSMutableArray count](self->_pendingOperations, "count");
      activeOperations = self->_activeOperations;
      v13 = 138543874;
      v14 = v4;
      v15 = 2048;
      v16 = v11;
      v17 = 2114;
      v18 = activeOperations;
      v6 = "%{public}@: Enqueued (%ld pending, current active operations: %{public}@)";
      v7 = v5;
      v8 = 32;
      goto LABEL_8;
    }
  }
LABEL_9:

  -[NSMutableArray addObject:](self->_pendingOperations, "addObject:", v4);
  -[HDMaintenanceWorkCoordinator _lock_considerStartingNextPendingOperation]((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_lock_considerStartingNextPendingOperation
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    if (!objc_msgSend(*(id *)(a1 + 48), "count") && !*(_BYTE *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "firstObject");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v2);
        objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", 0);
        -[HDMaintenanceWorkCoordinator _lock_startTimeoutTimerForActiveOperations](a1);
        v3 = *(NSObject **)(a1 + 24);
        v4[0] = MEMORY[0x1E0C809B0];
        v4[1] = 3221225472;
        v4[2] = __74__HDMaintenanceWorkCoordinator__lock_considerStartingNextPendingOperation__block_invoke;
        v4[3] = &unk_1E6CE8080;
        v5 = v2;
        v6 = a1;
        dispatch_async(v3, v4);

      }
    }
  }
}

- (void)startOperationImmediately:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDMaintenanceWorkCoordinator _lock_prepareToStartOperationImmediately:]((uint64_t)self, v5);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v5, "startWithCompletionDelegate:fromImmediateRequest:", self, 1);

}

- (void)_lock_prepareToStartOperationImmediately:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    _HKInitializeLogging();
    HKLogInfrastructure();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Running immediately", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v3);
    -[HDMaintenanceWorkCoordinator _lock_startTimeoutTimerForActiveOperations](a1);
  }

}

- (BOOL)startNextOperationWithNameImmediately:(id)a3
{
  id v4;
  NSMutableArray *pendingOperations;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  pendingOperations = self->_pendingOperations;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__HDMaintenanceWorkCoordinator_startNextOperationWithNameImmediately___block_invoke;
  v9[3] = &unk_1E6CFC830;
  v10 = v4;
  v6 = v4;
  -[NSMutableArray hk_firstObjectPassingTest:](pendingOperations, "hk_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HDMaintenanceWorkCoordinator _lock_prepareToStartOperationImmediately:]((uint64_t)self, v7);
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v7, "startWithCompletionDelegate:fromImmediateRequest:", self, 1);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  return v7 != 0;
}

uint64_t __70__HDMaintenanceWorkCoordinator_startNextOperationWithNameImmediately___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)cancelAllOperations
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v4;
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
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_pendingOperations;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "cancel", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_pendingOperations, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_activeOperations, "removeAllObjects");
  -[HDMaintenanceWorkCoordinator _lock_cancelActiveTimeoutTimer]((uint64_t)self);
  -[HDMaintenanceWorkCoordinator _lock_considerStartingNextPendingOperation]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_startTimeoutTimerForActiveOperations
{
  const os_unfair_lock *v2;
  dispatch_source_t v3;
  void *v4;
  NSObject *v5;
  double Current;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  double v14;
  NSObject *v15;
  dispatch_time_t v16;
  _QWORD handler[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id location[17];

  location[16] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (const os_unfair_lock *)(a1 + 8);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    if (!*(_QWORD *)(a1 + 56))
    {
      v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 16));
      v4 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v3;

      objc_initWeak(location, (id)a1);
      v5 = *(NSObject **)(a1 + 56);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __74__HDMaintenanceWorkCoordinator__lock_startTimeoutTimerForActiveOperations__block_invoke;
      handler[3] = &unk_1E6CECE78;
      objc_copyWeak(&v18, location);
      dispatch_source_set_event_handler(v5, handler);
      objc_destroyWeak(&v18);
      objc_destroyWeak(location);
    }
    os_unfair_lock_assert_owner(v2);
    Current = CFAbsoluteTimeGetCurrent();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = *(id *)(a1 + 48);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, location, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      v11 = Current;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "timeoutTime");
          if (v11 < v13)
            v11 = v13;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, location, 16);
      }
      while (v9);
    }
    else
    {
      v11 = Current;
    }

    v14 = v11 - Current;
    v15 = *(NSObject **)(a1 + 56);
    v16 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    dispatch_source_set_timer(v15, v16, (unint64_t)(v14 * 1000000000.0), (unint64_t)(v14 * 0.25 * 1000000000.0));
    dispatch_activate(*(dispatch_object_t *)(a1 + 56));
  }
  else
  {
    -[HDMaintenanceWorkCoordinator _lock_cancelActiveTimeoutTimer](a1);
  }
}

uint64_t __74__HDMaintenanceWorkCoordinator__lock_considerStartingNextPendingOperation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startWithCompletionDelegate:fromImmediateRequest:", *(_QWORD *)(a1 + 40), 0);
}

void __74__HDMaintenanceWorkCoordinator__lock_startTimeoutTimerForActiveOperations__block_invoke(uint64_t a1)
{
  CFAbsoluteTime Current;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  os_unfair_lock_s *lock;
  char *WeakRetained;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
    Current = CFAbsoluteTimeGetCurrent();
    v2 = (void *)*((_QWORD *)WeakRetained + 6);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __47__HDMaintenanceWorkCoordinator__timeoutDidFire__block_invoke;
    v26[3] = &__block_descriptor_40_e32_B16__0__HDMaintenanceOperation_8l;
    *(CFAbsoluteTime *)&v26[4] = Current;
    objc_msgSend(v2, "hk_filter:", v26);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v19 = v3;
      lock = (os_unfair_lock_s *)(WeakRetained + 8);
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v4 = v3;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v23 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            v10 = objc_msgSend(v9, "faultOnTimeout", v19, lock);
            _HKInitializeLogging();
            HKLogInfrastructure();
            v11 = objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if (v10)
            {
              if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
              {
                objc_msgSend(v9, "elapsedTime");
                v14 = v13;
                objc_msgSend(v9, "timeout");
                *(_DWORD *)buf = 138543874;
                v28 = v9;
                v29 = 2048;
                v30 = v14;
                v31 = 2048;
                v32 = v15;
                _os_log_fault_impl(&dword_1B7802000, v12, OS_LOG_TYPE_FAULT, "%{public}@: Timeout exceeded (%02.lfs elapsed of %02.lfs allowed)", buf, 0x20u);
              }
            }
            else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v9, "elapsedTime");
              v17 = v16;
              objc_msgSend(v9, "timeout");
              *(_DWORD *)buf = 138543874;
              v28 = v9;
              v29 = 2048;
              v30 = v17;
              v31 = 2048;
              v32 = v18;
              _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Timeout exceeded (%02.lfs elapsed of %02.lfs allowed)", buf, 0x20u);
            }

            objc_msgSend(*((id *)WeakRetained + 6), "removeObject:", v9);
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
        }
        while (v6);
      }

      -[HDMaintenanceWorkCoordinator _lock_startTimeoutTimerForActiveOperations](WeakRetained);
      -[HDMaintenanceWorkCoordinator _lock_considerStartingNextPendingOperation](WeakRetained);
      os_unfair_lock_unlock(lock);
      v3 = v19;
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
    }

  }
}

BOOL __47__HDMaintenanceWorkCoordinator__timeoutDidFire__block_invoke(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "timeoutTime");
  return v3 <= *(double *)(a1 + 32);
}

- (id)takeMaintenanceSuspensionAssertionForOwner:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HDMaintenanceWorkCoordinator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("suspended"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29800]), "initWithAssertionIdentifier:ownerIdentifier:", CFSTR("_HDMaintenanceWorkCoordinatorSuspensionAssertion;"),
                 v4);

  os_unfair_lock_lock(&self->_lock);
  self->_suspended = 1;
  -[HDAssertionManager takeAssertion:](self->_assertionManager, "takeAssertion:", v5);
  os_unfair_lock_unlock(&self->_lock);
  -[HDMaintenanceWorkCoordinator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("suspended"));
  return v5;
}

- (void)operationDidFinish:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_activeOperations, "removeObject:", v5);

  -[HDMaintenanceWorkCoordinator _lock_considerStartingNextPendingOperation]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  id v5;
  char v6;

  v5 = a3;
  -[HDMaintenanceWorkCoordinator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("suspended"));
  os_unfair_lock_lock(&self->_lock);
  v6 = objc_msgSend(v5, "hasActiveAssertionForIdentifier:", CFSTR("_HDMaintenanceWorkCoordinatorSuspensionAssertion;"));

  self->_suspended = v6;
  if ((v6 & 1) == 0)
    -[HDMaintenanceWorkCoordinator _lock_considerStartingNextPendingOperation]((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
  -[HDMaintenanceWorkCoordinator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("suspended"));
}

- (id)diagnosticDescription
{
  os_unfair_lock_s *p_lock;
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_alloc(MEMORY[0x1E0CB37A0]);
  if (-[NSMutableSet count](self->_activeOperations, "count"))
    v5 = "ACTIVE";
  else
    v5 = "quiescent";
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%s (%ld pending)"), v5, -[NSMutableArray count](self->_pendingOperations, "count"));
  if (self->_suspended)
  {
    -[HDAssertionManager activeAssertionsForIdentifier:](self->_assertionManager, "activeAssertionsForIdentifier:", CFSTR("_HDMaintenanceWorkCoordinatorSuspensionAssertion;"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_map:", &__block_literal_global_133);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "appendFormat:", CFSTR(" SUSPENDED (%@)"), v10);
  }
  if (-[NSMutableSet count](self->_activeOperations, "count"))
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\tACTIVE (%ld):"), -[NSMutableSet count](self->_activeOperations, "count"));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = self->_activeOperations;
    v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v6, "appendFormat:", CFSTR("\n\t\t**: %@"), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        }
        v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

  }
  if (-[NSMutableArray count](self->_pendingOperations, "count"))
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\tPending (%ld):"), -[NSMutableArray count](self->_pendingOperations, "count"));
    if (-[NSMutableArray count](self->_pendingOperations, "count"))
    {
      v16 = 0;
      do
      {
        v17 = v16 + 1;
        -[NSMutableArray objectAtIndexedSubscript:](self->_pendingOperations, "objectAtIndexedSubscript:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("\n\t\t%2ld: %@"), v17, v18);

        v19 = -[NSMutableArray count](self->_pendingOperations, "count");
        v16 = v17;
      }
      while (v17 < v19);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

uint64_t __53__HDMaintenanceWorkCoordinator_diagnosticDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ownerIdentifier");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_timeoutSource, 0);
  objc_storeStrong((id *)&self->_activeOperations, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_maintenanceWorkQueue, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
}

@end
