@implementation HDDataAggregator

- (HDDataCollectionManager)dataCollectionManager
{
  return (HDDataCollectionManager *)objc_loadWeakRetained((id *)&self->_dataCollectionManager);
}

- (id)_keyValueDomain
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "objectType");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringWithFormat:", CFSTR("DATA_AGGREGATION-%@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setConfiguration:(id)a3
{
  HDDataAggregatorConfiguration *v4;
  HDDataAggregatorConfiguration *lock_configuration;
  NSObject *v6;
  HDDataAggregatorConfiguration *v7;
  HDDataAggregatorConfiguration *v8;
  HDDataAggregatorConfiguration *v9;
  int v10;
  HDDataAggregator *v11;
  __int16 v12;
  HDDataAggregatorConfiguration *v13;
  __int16 v14;
  HDDataAggregatorConfiguration *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (HDDataAggregatorConfiguration *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_configuration = self->_lock_configuration;
  if (lock_configuration == v4 || v4 && -[HDDataAggregatorConfiguration isEqual:](lock_configuration, "isEqual:", v4))
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_lock_configuration;
      v10 = 138543874;
      v11 = self;
      v12 = 2114;
      v13 = v7;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Aggregator configuration changed from %{public}@ -> %{public}@", (uint8_t *)&v10, 0x20u);
    }
    v8 = (HDDataAggregatorConfiguration *)-[HDDataAggregatorConfiguration copy](v4, "copy");
    v9 = self->_lock_configuration;
    self->_lock_configuration = v8;

    os_unfair_lock_unlock(&self->_lock);
    -[HDDataAggregator _considerStartingCollectors]((uint64_t)self);
    -[HDDataAggregator recomputeCollectorConfiguration](self, "recomputeCollectorConfiguration");
  }

}

- (void)dataCollector:(id)a3 didChangeState:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  HDDataAggregator *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataAggregator.m"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collector != nil"));

    if (v9)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataAggregator.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state != nil"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_12;
LABEL_3:
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_collectorRegistry, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 == v9 || v9 && objc_msgSend(v10, "isEqual:", v9))
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v16 = self;
      v17 = 2114;
      v18 = v7;
      v19 = 2114;
      v20 = v11;
      v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Collector %{public}@ changed state %{public}@ -> %{public}@", buf, 0x2Au);
    }
    -[NSMapTable setObject:forKey:](self->_lock_collectorRegistry, "setObject:forKey:", v9, v7);
    os_unfair_lock_unlock(&self->_lock);
    -[HDDataAggregator recomputeCollectorConfiguration](self, "recomputeCollectorConfiguration");
  }

}

- (HDDataAggregator)initWithDataCollectionManager:(id)a3
{
  id v4;
  HDDataAggregator *v5;
  HDDataAggregator *v6;
  uint64_t v7;
  NSMapTable *lock_collectorRegistry;
  uint64_t v9;
  HDDataAggregatorConfiguration *lock_configuration;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDDataAggregator;
  v5 = -[HDDataAggregator init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataCollectionManager, v4);
    *(_QWORD *)&v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    lock_collectorRegistry = v6->_lock_collectorRegistry;
    v6->_lock_collectorRegistry = (NSMapTable *)v7;

    v6->_lock_canStartCollectors = 0;
    +[HDDataAggregatorConfiguration configurationWithLatency:interval:seriesDuration:activeWorkout:foregroundObserver:](HDDataAggregatorConfiguration, "configurationWithLatency:interval:seriesDuration:activeWorkout:foregroundObserver:", 0, 0, *MEMORY[0x1E0CB4B30], *MEMORY[0x1E0CB4B30], *MEMORY[0x1E0CB4B30]);
    v9 = objc_claimAutoreleasedReturnValue();
    lock_configuration = v6->_lock_configuration;
    v6->_lock_configuration = (HDDataAggregatorConfiguration *)v9;

    atomic_store(0, (unsigned __int8 *)&v6->_hasStartedCollectors);
  }

  return v6;
}

- (void)registerDataCollector:(id)a3 state:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  HDDataAggregator *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataAggregator.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collector != nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataAggregator.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state != nil"));

LABEL_3:
  os_unfair_lock_lock(&self->_lock);
  _HKInitializeLogging();
  v10 = *MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v7;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Registered %{public}@ with state %{public}@", buf, 0x20u);
  }
  -[NSMapTable setObject:forKey:](self->_lock_collectorRegistry, "setObject:forKey:", v9, v7);
  os_unfair_lock_unlock(&self->_lock);
  -[HDDataAggregator _considerStartingCollectors]((uint64_t)self);
  v11 = atomic_load((unsigned __int8 *)&self->_hasStartedCollectors);
  if ((v11 & 1) != 0)
  {
    -[HDDataAggregator _startCollector:]((id *)&self->super.isa, v7);
    -[HDDataAggregator recomputeCollectorConfiguration](self, "recomputeCollectorConfiguration");
  }

}

- (void)daemonReady:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataCollectionManager);
  objc_msgSend(WeakRetained, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__HDDataAggregator_daemonReady___block_invoke;
  v7[3] = &unk_1E6CE80E8;
  v7[4] = self;
  objc_msgSend(v6, "performWhenDataProtectedByFirstUnlockIsAvailable:", v7);

}

uint64_t __32__HDDataAggregator_daemonReady___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  -[HDDataAggregator _considerStartingCollectors](*(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "recomputeCollectorConfiguration");
}

- (void)resume
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataCollectionManager);
  objc_msgSend(WeakRetained, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerDaemonReadyObserver:queue:", self, 0);

}

- (void)requestAggregationThroughDate:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5 completion:(id)a6
{
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id WeakRetained;
  NSObject *v18;
  id v19;
  id obj;
  id v21;
  _QWORD block[4];
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  NSObject *v29;
  _QWORD *v30;
  _QWORD *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[3];
  char v39;
  uint8_t buf[4];
  HDDataAggregator *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v19 = a6;
  -[HDDataAggregator allCollectors](self, "allCollectors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = dispatch_group_create();
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v39 = 1;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__129;
    v36[4] = __Block_byref_object_dispose__129;
    v37 = 0;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "collector");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            dispatch_group_enter(v9);
            _HKInitializeLogging();
            v14 = *MEMORY[0x1E0CB52A8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v41 = self;
              v42 = 2114;
              v43 = v21;
              v44 = 2114;
              v45 = v13;
              _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting collection through %{public}@ from %{public}@", buf, 0x20u);
            }
            v26[0] = MEMORY[0x1E0C809B0];
            v26[1] = 3221225472;
            v26[2] = __74__HDDataAggregator_requestAggregationThroughDate_mode_options_completion___block_invoke;
            v26[3] = &unk_1E6CFEB30;
            v26[4] = self;
            v15 = v21;
            v27 = v15;
            v16 = v13;
            v28 = v16;
            v30 = v38;
            v31 = v36;
            v29 = v9;
            objc_msgSend(v16, "dataAggregator:requestsCollectionThroughDate:completion:", self, v15, v26);

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      }
      while (v10);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_dataCollectionManager);
    objc_msgSend(WeakRetained, "dataCollectionQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__HDDataAggregator_requestAggregationThroughDate_mode_options_completion___block_invoke_189;
    block[3] = &unk_1E6CFEB58;
    v23 = v19;
    v24 = v38;
    v25 = v36;
    dispatch_group_notify(v9, v18, block);

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v38, 8);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v19 + 2))(v19, 1, 0);
  }

}

void __74__HDDataAggregator_requestAggregationThroughDate_mode_options_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a2)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v14 = 138543874;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished collection through %{public}@ for %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v13 = *(_QWORD *)(v11 + 40);
    v12 = (id *)(v11 + 40);
    if (!v13)
      objc_storeStrong(v12, a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __74__HDDataAggregator_requestAggregationThroughDate_mode_options_completion___block_invoke_189(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)_considerStartingCollectors
{
  __CFString *v2;
  unsigned __int8 *v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSObject *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  unsigned __int8 v20;
  NSObject *v21;
  const __CFString *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = (__CFString *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  if (*(_BYTE *)(a1 + 33))
  {
    v3 = (unsigned __int8 *)(a1 + 32);
    while (1)
    {
      v4 = __ldaxr(v3);
      if (v4)
        break;
      if (!__stlxr(1u, v3))
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v5 = *(id *)(a1 + 16);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v28 != v8)
                objc_enumerationMutation(v5);
              -[__CFString addObject:](v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          }
          while (v7);
        }

        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        _HKInitializeLogging();
        v10 = *MEMORY[0x1E0CB52A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v34 = a1;
          v35 = 2114;
          v36 = v2;
          _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: start collectors: %{public}@", buf, 0x16u);
        }
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v11 = v2;
        v12 = -[__CFString countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v24 != v14)
                objc_enumerationMutation(v11);
              -[HDDataAggregator _startCollector:]((id *)a1, *(void **)(*((_QWORD *)&v23 + 1) + 8 * j));
            }
            v13 = -[__CFString countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v13);
        }

        goto LABEL_32;
      }
    }
    __clrex();
    v20 = atomic_load(v3);
    if ((v20 & 1) != 0)
      goto LABEL_31;
    _HKInitializeLogging();
    v21 = *MEMORY[0x1E0CB52A8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    v22 = CFSTR("YES");
    if ((v4 & 1) == 0)
      v22 = CFSTR("NO");
    *(_DWORD *)buf = 138543618;
    v34 = a1;
    v35 = 2114;
    v36 = v22;
    v17 = "%{public}@: Unable to set _hasStartedCollectors (%{public}@); not starting";
    v18 = v21;
    v19 = 22;
  }
  else
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB52A8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_DWORD *)buf = 138543362;
    v34 = a1;
    v17 = "%{public}@: Not yet starting collectors (_canStartCollectors = NO)";
    v18 = v16;
    v19 = 12;
  }
  _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_31:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
LABEL_32:

}

- (HDDataAggregatorConfiguration)configuration
{
  os_unfair_lock_s *p_lock;
  HDDataAggregatorConfiguration *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_configuration;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_startCollector:(id *)a1
{
  id v3;
  void *v4;
  int CanResumeFromLastSensorDatum;
  os_log_t *v6;
  HDKeyValueDomain *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  HDKeyValueDomain *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    CanResumeFromLastSensorDatum = _HDDataCollectorCanResumeFromLastSensorDatum(v3);
    v6 = (os_log_t *)MEMORY[0x1E0CB52A8];
    if (CanResumeFromLastSensorDatum)
    {
      v7 = [HDKeyValueDomain alloc];
      -[HDDataAggregator _keyValueDomain](a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained(a1 + 7);
      objc_msgSend(WeakRetained, "profile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v7, "initWithCategory:domainName:profile:", 0, v8, v10);

      objc_msgSend(v4, "identifierForDataAggregator:", a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel__startCollector_, a1, CFSTR("HDDataAggregator.m"), 430, CFSTR("%@: Unexpectedly nil collector key when starting %@"), a1, v4);

      }
      v24 = 0;
      -[HDKeyValueDomain dataForKey:error:](v11, "dataForKey:error:", v12, &v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v24;

      if (v13)
      {
        v15 = objc_opt_class();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v15 = objc_msgSend(v4, "sensorDatumClassForAggregator:", a1);
        }
        else
        {
          _HKInitializeLogging();
          v18 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v26 = a1;
            v27 = 2114;
            v28 = (uint64_t)v4;
            v29 = 2114;
            v30 = v15;
            _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@: *** Collector %{public}@ does not implement sensorDatumClassForAggregator:! Please implement to silence this warning. Assuming %{public}@.", buf, 0x20u);
          }
        }
        v23 = v14;
        objc_msgSend(MEMORY[0x1E0CB3710], "hk_unarchivedObjectOfClass:forKey:data:error:", v15, CFSTR("sensor_datum"), v13, &v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v23;

        if (!v16)
        {
          _HKInitializeLogging();
          v20 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            v26 = a1;
            v27 = 2114;
            v28 = v15;
            v29 = 2114;
            v30 = (uint64_t)v4;
            v31 = 2114;
            v32 = v19;
            _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode sensor datum of class %{public}@ when starting %{public}@: %{public}@", buf, 0x2Au);
          }
          v16 = 0;
        }
        v14 = v19;
      }
      else
      {
        if (v14)
        {
          _HKInitializeLogging();
          v17 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v26 = a1;
            v27 = 2114;
            v28 = (uint64_t)v4;
            v29 = 2114;
            v30 = (uint64_t)v14;
            _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve existing context for collector '%{public}@': %{public}@:", buf, 0x20u);
          }
        }
        v13 = 0;
        v16 = 0;
      }
    }
    else
    {
      v13 = 0;
      v16 = 0;
      v14 = 0;
    }
    _HKInitializeLogging();
    v21 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v26 = a1;
      v27 = 2114;
      v28 = (uint64_t)v4;
      v29 = 2112;
      v30 = (uint64_t)v16;
      _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting collector %{public}@ with last persisted datum: %@", buf, 0x20u);
    }
    objc_msgSend(v4, "beginCollectionForDataAggregator:lastPersistedSensorDatum:", a1, v16);

  }
}

- (void)unregisterDataCollector:(id)a3
{
  id v5;
  NSObject *v6;
  unsigned __int8 v7;
  void *v8;
  uint8_t buf[4];
  HDDataAggregator *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataAggregator.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collector != nil"));

  }
  os_unfair_lock_lock(&self->_lock);
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Unregistered %{public}@", buf, 0x16u);
  }
  -[NSMapTable removeObjectForKey:](self->_lock_collectorRegistry, "removeObjectForKey:", v5);
  os_unfair_lock_unlock(&self->_lock);
  v7 = atomic_load((unsigned __int8 *)&self->_hasStartedCollectors);
  if ((v7 & 1) != 0)
    -[HDDataAggregator recomputeCollectorConfiguration](self, "recomputeCollectorConfiguration");

}

- (id)allCollectors
{
  unsigned __int8 v2;
  id v5;
  NSMapTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  HDDataCollectorRecord *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = atomic_load((unsigned __int8 *)&self->_hasStartedCollectors);
  if ((v2 & 1) == 0)
    return MEMORY[0x1E0C9AA60];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  os_unfair_lock_lock(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_lock_collectorRegistry;
  v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = objc_alloc_init(HDDataCollectorRecord);
        -[HDDataCollectorRecord setCollector:](v12, "setCollector:", v11, (_QWORD)v14);
        -[NSMapTable objectForKey:](self->_lock_collectorRegistry, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDDataCollectorRecord setState:](v12, "setState:", v13);

        objc_msgSend(v5, "addObject:", v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_158);
  return v5;
}

uint64_t __33__HDDataAggregator_allCollectors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "priority");

  objc_msgSend(v4, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "priority");
  if (v6 <= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v6 < v8)
    return 1;
  else
    return v9;
}

- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5
{
  -[HDDataAggregator dataCollector:didCollectSensorData:device:options:](self, "dataCollector:didCollectSensorData:device:options:", a3, a4, a5, 0);
}

- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5 options:(unint64_t)a6
{
  id v8;
  id v9;
  HKObserverSet *sensorDataObservers;
  _QWORD v11[5];
  id v12;
  id v13;

  v8 = a4;
  v9 = a5;
  if (self)
  {
    sensorDataObservers = self->_sensorDataObservers;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__HDDataAggregator__notifySensorDataObservers_device_options___block_invoke;
    v11[3] = &unk_1E6CFEC60;
    v11[4] = self;
    v12 = v8;
    v13 = v9;
    -[HKObserverSet notifyObservers:](sensorDataObservers, "notifyObservers:", v11);

  }
}

- (BOOL)persistObjects:(id)a3 usedDatums:(id)a4 collector:(id)a5 source:(id)a6 device:(id)a7 resolveAssociations:(BOOL)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __96__HDDataAggregator_persistObjects_usedDatums_collector_source_device_resolveAssociations_error___block_invoke;
  v22[3] = &unk_1E6CFEBC0;
  v22[4] = self;
  v23 = v15;
  v26 = a8;
  v24 = v16;
  v25 = v17;
  v18 = v17;
  v19 = v16;
  v20 = v15;
  LOBYTE(a7) = -[HDDataAggregator persistForCollector:usedDatums:source:device:error:persistenceHandler:](self, "persistForCollector:usedDatums:source:device:error:persistenceHandler:", v18, v19, a6, a7, a9, v22);

  return (char)a7;
}

uint64_t __96__HDDataAggregator_persistObjects_usedDatums_collector_source_device_resolveAssociations_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v5 = (id *)(*(_QWORD *)(a1 + 32) + 56);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:updateSourceOrder:resolveAssociations:error:", *(_QWORD *)(a1 + 40), v6, 1, 0, *(unsigned __int8 *)(a1 + 64), a3, CFAbsoluteTimeGetCurrent());

  if (!v10)
    return 0;
  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "didPersistObjects:lastDatum:collector:error:", v12, v13, *(_QWORD *)(a1 + 56), a3);

  return v14;
}

- (BOOL)persistForCollector:(id)a3 usedDatums:(id)a4 source:(id)a5 device:(id)a6 error:(id *)a7 persistenceHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  BOOL v32;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  HDDataAggregator *v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  HDDataAggregator *v44;
  id v45;
  id v46;
  _QWORD aBlock[4];
  id v48;
  HDDataAggregator *v49;
  id v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  HDDataAggregator *v56;
  id v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD v60[5];
  id v61;
  _QWORD v62[5];
  id v63;

  v14 = a3;
  v35 = a4;
  v15 = a5;
  v16 = a6;
  v36 = a8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataCollectionManager);
  objc_msgSend(WeakRetained, "profile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy__129;
  v62[4] = __Block_byref_object_dispose__129;
  v63 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__129;
  v60[4] = __Block_byref_object_dispose__129;
  v61 = 0;
  objc_msgSend(v18, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke;
  v53[3] = &unk_1E6CFEBE8;
  v58 = v62;
  v20 = v18;
  v54 = v20;
  v21 = v15;
  v55 = v21;
  v56 = self;
  v59 = v60;
  v22 = v16;
  v57 = v22;
  v23 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v19, a7, v53);

  if (v23)
  {
    v34 = v14;
    v24 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_206;
    aBlock[3] = &unk_1E6CFEC10;
    v25 = v20;
    v48 = v25;
    v51 = v62;
    v52 = v60;
    v49 = self;
    v50 = v36;
    v26 = _Block_copy(aBlock);
    objc_msgSend(v25, "database");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v24;
    v42[1] = 3221225472;
    v42[2] = __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_209;
    v42[3] = &unk_1E6CEE6A8;
    v28 = v14;
    v29 = v24;
    v30 = v28;
    v43 = v28;
    v44 = self;
    v45 = v35;
    v46 = v26;
    v37[0] = v29;
    v37[1] = 3221225472;
    v37[2] = __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_4;
    v37[3] = &unk_1E6CFEC38;
    v31 = v46;
    v41 = v31;
    v38 = v30;
    v39 = self;
    v40 = v45;
    v32 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDDataEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v27, a7, v42, v37);

    v14 = v34;
  }
  else
  {
    v32 = 0;
  }

  _Block_object_dispose(v60, 8);
  _Block_object_dispose(v62, 8);

  return v32;
}

uint64_t __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v26 = 0;
  objc_msgSend(v5, "sourceEntityForClientSource:createOrUpdateIfNecessary:error:", v6, 1, &v26);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v26;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v28 = v19;
      v29 = 2114;
      v30 = v20;
      v31 = 2114;
      v32 = v8;
      _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_INFO, "Failed to retrieve source entity for source '%{public}@' when creating a sample for aggregator '%{public}@': %{public}@", buf, 0x20u);
    }
    v14 = v8;
    if (!v14)
      goto LABEL_14;
    if (!a3)
    {
LABEL_13:
      _HKLogDroppedError();
      goto LABEL_14;
    }
LABEL_8:
    v14 = objc_retainAutorelease(v14);
    *a3 = v14;
LABEL_14:

    v17 = 0;
    goto LABEL_15;
  }

  objc_msgSend(*(id *)(a1 + 32), "deviceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 56);
  v25 = 0;
  objc_msgSend(v11, "deviceEntityForDevice:error:", v12, &v25);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v25;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v13;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    _HKInitializeLogging();
    v21 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_INFO))
    {
      v23 = *(_QWORD *)(a1 + 48);
      v22 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v28 = v22;
      v29 = 2114;
      v30 = v23;
      v31 = 2114;
      v32 = v14;
      _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_INFO, "Failed to retrieve device entity for device '%{public}@' when creating a sample for aggregator '%{public}@': %{public}@", buf, 0x20u);
    }
    v14 = v14;
    if (!v14)
      goto LABEL_14;
    if (!a3)
      goto LABEL_13;
    goto LABEL_8;
  }
  v17 = 1;
LABEL_15:

  return v17;
}

uint64_t __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_206(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dataProvenanceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localDataProvenanceForSourceEntity:version:deviceEntity:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 48);
  v13 = 0;
  v7 = (*(uint64_t (**)(void))(v6 + 16))();
  v8 = v13;
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_INFO, "%{public}@: Persistence failed: %{public}@", buf, 0x16u);
    }
    v11 = v8;
    if (v11)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

  }
  return v7;
}

uint64_t __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_209(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_2;
    v22[3] = &unk_1E6CE7FB8;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v23 = v10;
    v24 = v11;
    v25 = v12;
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_3;
    v18[3] = &unk_1E6CE7FB8;
    v13 = *(id *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(a1 + 48);
    v19 = v13;
    v20 = v14;
    v21 = v15;
    objc_msgSend(v6, "onCommit:orRollback:", v22, v18);

  }
  v16 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), a3, v7, v8);

  return v16;
}

uint64_t __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataAggregator:didPersistDatums:success:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, 0);
}

void __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Database transaction rollback."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataAggregator:didPersistDatums:success:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, v2);

}

uint64_t __90__HDDataAggregator_persistForCollector_usedDatums_source_device_error_persistenceHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v3 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "dataAggregator:didPersistDatums:success:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v2, v3);

  return v2;
}

- (BOOL)didPersistObjects:(id)a3 lastDatum:(id)a4 collector:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  HDKeyValueDomain *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  HDKeyValueDomain *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  v9 = a4;
  v10 = a5;
  if (_HDDataCollectorCanResumeFromLastSensorDatum(v10))
  {
    v11 = [HDKeyValueDomain alloc];
    -[HDDataAggregator _keyValueDomain](self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataCollectionManager);
    objc_msgSend(WeakRetained, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v11, "initWithCategory:domainName:profile:", 0, v12, v14);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v16, "encodeObject:forKey:", v9, CFSTR("sensor_datum"));
    objc_msgSend(v16, "encodedData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifierForDataAggregator:", self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HDKeyValueDomain setData:forKey:error:](v15, "setData:forKey:error:", v17, v18, a6);

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

- (BOOL)doesDatumPredateDatabaseObliteration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDate **p_unitTest_lastObliterationDate;
  char v8;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HDDataAggregator_doesDatumPredateDatabaseObliteration___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  if (qword_1ED552498 != -1)
    dispatch_once(&qword_1ED552498, block);
  if (_HDIsUnitTesting)
  {
    objc_msgSend(v4, "dateInterval");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    p_unitTest_lastObliterationDate = &self->_unitTest_lastObliterationDate;
  }
  else
  {
    if (!_MergedGlobals_218)
    {
      v8 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v4, "dateInterval");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    p_unitTest_lastObliterationDate = (NSDate **)&_MergedGlobals_218;
  }
  v8 = objc_msgSend(v6, "hk_isBeforeDate:", *p_unitTest_lastObliterationDate);

LABEL_8:
  return v8;
}

void __57__HDDataAggregator_doesDatumPredateDatabaseObliteration___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dataCollectionManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profile");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mostRecentObliterationDate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_218;
  _MergedGlobals_218 = v3;

}

- (void)unitTest_setLastObliterationDate:(id)a3
{
  objc_storeStrong((id *)&self->_unitTest_lastObliterationDate, a3);
}

- (HKObjectType)objectType
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

void __62__HDDataAggregator__notifySensorDataObservers_device_options___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "objectType");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aggregator:didCollectSensorData:objectType:device:", v3, v4, v6, a1[6]);

}

- (void)registerSensorDataObserver:(id)a3 queue:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  HKObserverSet *v9;
  HKObserverSet *sensorDataObservers;
  id v11;

  p_lock = &self->_lock;
  v7 = a4;
  v11 = a3;
  os_unfair_lock_lock(p_lock);
  if (!self->_sensorDataObservers)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB6988]);
    v9 = (HKObserverSet *)objc_msgSend(v8, "initWithName:loggingCategory:", CFSTR("aggregation-sensor-data-observation"), *MEMORY[0x1E0CB52A8]);
    sensorDataObservers = self->_sensorDataObservers;
    self->_sensorDataObservers = v9;

  }
  os_unfair_lock_unlock(p_lock);
  -[HKObserverSet registerObserver:queue:](self->_sensorDataObservers, "registerObserver:queue:", v11, v7);

}

- (void)unregisterSensorDataObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_sensorDataObservers, "unregisterObserver:", a3);
}

- (void)recomputeCollectorConfiguration
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_log_t *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  os_unfair_lock_t lock;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  HDDataAggregator *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  lock = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  -[HDDataAggregator allCollectors](self, "allCollectors");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    v6 = (os_log_t *)MEMORY[0x1E0CB52A8];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "collector");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDDataAggregator configurationForCollector:](self, "configurationForCollector:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        _HKInitializeLogging();
        v11 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          v12 = v11;
          objc_msgSend(v8, "collector");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v22 = self;
          v23 = 2114;
          v24 = v13;
          v25 = 2114;
          v26 = v10;
          _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: wants collection for collector %{public}@ with configuration %{public}@", buf, 0x20u);

        }
        objc_msgSend(v8, "collector");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dataAggregator:wantsCollectionWithConfiguration:", self, v10);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v4);
  }
  os_unfair_lock_unlock(lock);

}

- (id)configurationForCollector:(id)a3
{
  void *v3;
  void *v4;

  -[HDDataAggregator configuration](self, "configuration", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataCollectorConfiguration configurationWithType:aggregatorConfiguration:](HDDataCollectorConfiguration, "configurationWithType:aggregatorConfiguration:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)diagnosticDescription
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = v3;
  v5 = atomic_load((unsigned __int8 *)&self->_hasStartedCollectors);
  if ((v5 & 1) != 0)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasStartedCollectors: %@\n"), v6);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v4, "appendFormat:", CFSTR("configuration: %@\n"), self->_lock_configuration);
  objc_msgSend(v4, "appendString:", CFSTR("dataCollectors:\n"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMapTable keyEnumerator](self->_lock_collectorRegistry, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_lock_collectorRegistry, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("  %@: %@\n"), v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(&self->_lock);
  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataCollectionManager);
  objc_storeStrong((id *)&self->_unitTest_lastObliterationDate, 0);
  objc_storeStrong((id *)&self->_sensorDataObservers, 0);
  objc_storeStrong((id *)&self->_lock_configuration, 0);
  objc_storeStrong((id *)&self->_lock_collectorRegistry, 0);
}

@end
