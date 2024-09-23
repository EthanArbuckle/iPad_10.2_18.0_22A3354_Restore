@implementation BLSHAggregateProcessAssertion

+ (void)acquireAggregatedAssertion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_4);
  objc_msgSend(v7, "processIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "classLock_aggregateForProcessIdentity:shouldCreate:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__BLSHAggregateProcessAssertion_acquireAggregatedAssertion_completion___block_invoke;
  v11[3] = &unk_24D1BE1C0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "acquireAggregatedAssertion:completion:", v7, v11);

  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_4);
}

void __71__BLSHAggregateProcessAssertion_acquireAggregatedAssertion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __71__BLSHAggregateProcessAssertion_acquireAggregatedAssertion_completion___block_invoke_2;
    v4[3] = &unk_24D1BDC10;
    v6 = *(id *)(a1 + 32);
    v5 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

  }
}

uint64_t __71__BLSHAggregateProcessAssertion_acquireAggregatedAssertion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)invalidateAggregatedAssertion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_4);
  objc_msgSend(v4, "processIdentity");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "classLock_aggregateForProcessIdentity:shouldCreate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "invalidateAggregatedAssertion:", v4);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v5, "invalidate");
    objc_msgSend((id)_classLock_aggregates, "removeObjectForKey:", v7);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_4);

}

+ (id)classLock_aggregateForProcessIdentity:(id)a3 shouldCreate:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BLSHAggregateProcessAssertion *v10;
  BOOL v11;
  id result;
  void *v13;

  v4 = a4;
  v5 = a3;
  if (v5)
  {
    v6 = v5;
    os_unfair_lock_assert_owner((const os_unfair_lock *)&_classLock_4);
    v7 = (void *)_classLock_aggregates;
    if (!_classLock_aggregates)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)_classLock_aggregates;
      _classLock_aggregates = v8;

      v7 = (void *)_classLock_aggregates;
    }
    objc_msgSend(v7, "objectForKey:", v6);
    v10 = (BLSHAggregateProcessAssertion *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = 1;
    else
      v11 = !v4;
    if (!v11)
    {
      v10 = -[BLSHAggregateProcessAssertion initWithProcessIdentity:]([BLSHAggregateProcessAssertion alloc], "initWithProcessIdentity:", v6);
      objc_msgSend((id)_classLock_aggregates, "setObject:forKey:", v10, v6);
    }

    return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("processIdentity != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[BLSHAggregateProcessAssertion classLock_aggregateForProcessIdentity:shouldCreate:].cold.1();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BLSHAggregateProcessAssertion)initWithProcessIdentity:(id)a3
{
  id v5;
  BLSHAggregateProcessAssertion *v6;
  double v7;
  uint64_t v8;
  NSMapTable *lock_aggregated;
  id v11;
  id location;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLSHAggregateProcessAssertion;
  v6 = -[BLSHAggregateProcessAssertion init](&v13, sel_init);
  if (v6)
  {
    if (initWithProcessIdentity__onceToken != -1)
      dispatch_once(&initWithProcessIdentity__onceToken, &__block_literal_global_26);
    BSContinuousMachTimeNow();
    v6->_initTimestamp = v7;
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_processIdentity, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 2);
    lock_aggregated = v6->_lock_aggregated;
    v6->_lock_aggregated = (NSMapTable *)v8;

    objc_initWeak(&location, v6);
    objc_copyWeak(&v11, &location);
    v6->_stateHandler = os_state_add_handler();
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __57__BLSHAggregateProcessAssertion_initWithProcessIdentity___block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  inactive = dispatch_workloop_create_inactive("BLSHAggregateProcessAssertion_rbs_acquisition");
  v1 = (void *)initWithProcessIdentity____workloop;
  initWithProcessIdentity____workloop = (uint64_t)inactive;

  dispatch_workloop_set_scheduler_priority();
  dispatch_activate((dispatch_object_t)initWithProcessIdentity____workloop);
  v2 = dispatch_queue_create_with_target_V2("BLSHAggregateProcessAssertion_rbs_acquisition", 0, (dispatch_queue_t)initWithProcessIdentity____workloop);
  v3 = (void *)__rbsAssertionAcquisitionQueue;
  __rbsAssertionAcquisitionQueue = (uint64_t)v2;

}

uint64_t __57__BLSHAggregateProcessAssertion_initWithProcessIdentity___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "stateDataWithHints:", a2);

  return v4;
}

- (void)dealloc
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)acquireAggregatedAssertion:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  BLSHDurationCalculator *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  RBSAssertion *v17;
  NSObject *v18;
  RBSAssertion *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  RBSAssertion *v27;
  id v28;
  id v29;
  id location;

  v7 = a3;
  v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_aggregated, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_lock_aggregated objectForKey:assertion] == nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHAggregateProcessAssertion acquireAggregatedAssertion:completion:].cold.2();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2146108C8);
  }
  if (self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_invalidated == NO"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHAggregateProcessAssertion acquireAggregatedAssertion:completion:].cold.1();
    goto LABEL_15;
  }
  objc_msgSend(v7, "duration");
  v11 = v10;
  v12 = -[BLSHDurationCalculator initWithDuration:]([BLSHDurationCalculator alloc], "initWithDuration:", v10);
  if (!self->_lock_rbsAssertion)
  {
    -[NSMapTable setObject:forKey:](self->_lock_aggregated, "setObject:forKey:", v12, v7);
    goto LABEL_8;
  }
  -[BLSHDurationCalculator remainingDuration](self->_lock_durationCalculator, "remainingDuration");
  v14 = v13;
  -[NSMapTable setObject:forKey:](self->_lock_aggregated, "setObject:forKey:", v12, v7);
  if (v14 < v11)
  {
LABEL_8:
    objc_msgSend(v7, "processIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createRBSAssertion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v17 = self->_lock_rbsAssertion;
    objc_storeStrong((id *)&self->_lock_rbsAssertion, v16);
    objc_storeStrong((id *)&self->_lock_acquiredAssertion, a3);
    objc_storeStrong((id *)&self->_lock_durationCalculator, v12);
    v18 = __rbsAssertionAcquisitionQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__BLSHAggregateProcessAssertion_acquireAggregatedAssertion_completion___block_invoke;
    block[3] = &unk_24D1BE1E8;
    objc_copyWeak(&v29, &location);
    v24 = v16;
    v25 = v15;
    v26 = v7;
    v27 = v17;
    v28 = v8;
    v19 = v17;
    v20 = v15;
    v21 = v16;
    dispatch_async(v18, block);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_9;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
LABEL_9:

}

void __71__BLSHAggregateProcessAssertion_acquireAggregatedAssertion_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t i;
  NSObject *v24;
  os_log_type_t v25;
  os_log_type_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  _BYTE v53[18];
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = *(void **)(a1 + 32);
  v45 = 0;
  v4 = objc_msgSend(v3, "acquireWithError:", &v45);
  v5 = v45;
  v6 = objc_msgSend(WeakRetained, "isCurrentRBSAssertion:", *(_QWORD *)(a1 + 32));
  if (v5 || (v4 & 1) == 0)
  {
    objc_msgSend(v5, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "code");
    if ((v6 & 1) == 0
      && (objc_msgSend(v11, "isEqual:", *MEMORY[0x24BE80D88]) ? (v13 = v12 == 1) : (v13 = 0), v13))
    {
      bls_scenes_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v32 = *(void **)(a1 + 32);
        v33 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "explanation");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v47 = WeakRetained;
        v48 = 2114;
        v49 = v32;
        v50 = 2114;
        v51 = v33;
        v52 = 2114;
        *(_QWORD *)v53 = v34;
        _os_log_impl(&dword_2145AC000, v17, OS_LOG_TYPE_INFO, "%p (already invalidated) did not acquire rb assertion:%{public}@ for process:%{public}@ explanation:%{public}@", buf, 0x2Au);

      }
    }
    else
    {
      v39 = v12;
      v14 = (void *)MEMORY[0x24BE80CE8];
      objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingIdentity:", *(_QWORD *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      objc_msgSend(v14, "statesForPredicate:withDescriptor:error:", v15, 0, &v44);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v44;

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v58, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 0;
        v22 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v41 != v22)
              objc_enumerationMutation(v18);
            v21 |= objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "isRunning");
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v58, 16);
        }
        while (v20);
      }
      else
      {
        LOBYTE(v21) = 0;
      }

      bls_scenes_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if ((v21 & 1) != 0)
      {
        if (objc_msgSend(*(id *)(a1 + 48), "shouldFaultOnFailureToAcquire"))
          v25 = OS_LOG_TYPE_FAULT;
        else
          v25 = OS_LOG_TYPE_ERROR;
      }
      else
      {
        v25 = OS_LOG_TYPE_DEFAULT;
      }
      v26 = v25;
      if (os_log_type_enabled(v24, v25))
      {
        objc_msgSend(v5, "localizedDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v17;
        v28 = *(_QWORD *)(a1 + 32);
        v37 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "explanation");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219522;
        v47 = WeakRetained;
        v48 = 2114;
        v49 = v11;
        v50 = 2048;
        v51 = v39;
        v52 = 2114;
        *(_QWORD *)v53 = v27;
        *(_WORD *)&v53[8] = 2114;
        *(_QWORD *)&v53[10] = v28;
        v17 = v38;
        v54 = 2114;
        v55 = v37;
        v56 = 2114;
        v57 = v29;
        _os_log_impl(&dword_2145AC000, v24, v26, "%p error:%{public}@:%ld:\"%{public}@\" failed to acquire rb assertion:%{public}@ for process:%{public}@ explanation:%{public}@", buf, 0x48u);

      }
    }

  }
  else
  {
    bls_scenes_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "explanation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v47 = WeakRetained;
      v48 = 2114;
      v49 = v8;
      v50 = 2114;
      v51 = v9;
      v52 = 1024;
      *(_DWORD *)v53 = v6;
      *(_WORD *)&v53[4] = 2114;
      *(_QWORD *)&v53[6] = v10;
      _os_log_impl(&dword_2145AC000, v7, OS_LOG_TYPE_DEFAULT, "%p acquired rbs assertion:%{public}@ for process:%{public}@ current:%{BOOL}u explanation:%{public}@", buf, 0x30u);

    }
    if ((v6 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }
  if (*(_QWORD *)(a1 + 56))
  {
    bls_scenes_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 56), "explanation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v47 = WeakRetained;
      v48 = 2114;
      v49 = v35;
      v50 = 2114;
      v51 = v36;
      _os_log_debug_impl(&dword_2145AC000, v30, OS_LOG_TYPE_DEBUG, "%p:acquireAggregatedAssertion: invalidating old RBS assertion \"%{public}@\" for process:%{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 56), "invalidate");
  }
  v31 = *(_QWORD *)(a1 + 64);
  if (v31)
    (*(void (**)(uint64_t, id))(v31 + 16))(v31, v5);

}

- (BOOL)isCurrentRBSAssertion:(id)a3
{
  BLSHAggregateProcessAssertion *v3;
  os_unfair_lock_s *p_lock;
  RBSAssertion *v5;

  v3 = self;
  p_lock = &self->_lock;
  v5 = (RBSAssertion *)a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v3) = v3->_lock_rbsAssertion == v5;

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (BOOL)invalidateAggregatedAssertion:(id)a3
{
  BLSHAggregatedProcessAssertion *v4;
  os_unfair_lock_s *p_lock;
  NSMapTable **p_lock_aggregated;
  void *v7;
  RBSAssertion *v8;
  RBSAssertion *lock_rbsAssertion;
  BLSHDurationCalculator *lock_durationCalculator;
  NSMapTable *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  id v23;
  id v24;
  void *v25;
  char v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  RBSProcessIdentity *v30;
  RBSAssertion *v31;
  NSObject *v32;
  BLSHAggregatedProcessAssertion *lock_acquiredAssertion;
  NSObject *v34;
  id v36;
  void *v37;
  RBSProcessIdentity *processIdentity;
  id *p_lock_durationCalculator;
  id *location;
  BLSHAggregateProcessAssertion *v41;
  BLSHAggregatedProcessAssertion *v42;
  RBSAssertion *v43;
  os_unfair_lock_s *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  BLSHAggregateProcessAssertion *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  RBSProcessIdentity *v55;
  __int16 v56;
  RBSProcessIdentity *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = (BLSHAggregatedProcessAssertion *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_lock_aggregated = &self->_lock_aggregated;
  -[NSMapTable objectForKey:](self->_lock_aggregated, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMapTable removeObjectForKey:](self->_lock_aggregated, "removeObjectForKey:", v4);
    if (self->_lock_acquiredAssertion == v4)
    {
      self->_lock_acquiredAssertion = 0;

      v8 = self->_lock_rbsAssertion;
      lock_rbsAssertion = self->_lock_rbsAssertion;
      self->_lock_rbsAssertion = 0;

      lock_durationCalculator = self->_lock_durationCalculator;
      self->_lock_durationCalculator = 0;

      if (!-[NSMapTable count](self->_lock_aggregated, "count"))
      {
        v15 = 0;
        v14 = 0;
        if (v8)
        {
LABEL_27:
          bls_scenes_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            -[BLSHAggregateProcessAssertion invalidateAggregatedAssertion:].cold.2((uint64_t)self, v8, v32);

          -[RBSAssertion invalidate](v8, "invalidate");
        }
LABEL_30:

        goto LABEL_31;
      }
      v43 = v8;
      v44 = &self->_lock;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v11 = *p_lock_aggregated;
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      if (v12)
      {
        v13 = v12;
        p_lock_durationCalculator = (id *)&self->_lock_durationCalculator;
        location = (id *)&self->_lock_acquiredAssertion;
        v41 = self;
        v42 = v4;
        v14 = 0;
        v15 = 0;
        v16 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v47 != v16)
              objc_enumerationMutation(v11);
            v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            -[NSMapTable objectForKey:](*p_lock_aggregated, "objectForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "remainingDuration");
            v21 = v20;
            objc_msgSend(v14, "remainingDuration");
            if (v21 > v22)
            {
              v23 = v19;

              v24 = v18;
              v14 = v23;
              v15 = v24;
            }

          }
          v13 = -[NSMapTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        }
        while (v13);

        if (!v15)
        {
          self = v41;
          v4 = v42;
          goto LABEL_26;
        }
        objc_msgSend(v15, "createRBSAssertion");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0;
        v26 = objc_msgSend(v25, "acquireWithError:", &v45);
        v27 = v45;
        bls_scenes_log();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v28;
        self = v41;
        v4 = v42;
        if (v27 || (v26 & 1) == 0)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v27, "bls_loggingString");
            v36 = v27;
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            processIdentity = v41->_processIdentity;
            *(_DWORD *)buf = 134218754;
            v51 = v41;
            v52 = 2114;
            v53 = v37;
            v54 = 2114;
            v55 = (RBSProcessIdentity *)v25;
            v56 = 2114;
            v57 = processIdentity;
            _os_log_fault_impl(&dword_2145AC000, v29, OS_LOG_TYPE_FAULT, "%p error:%{public}@ failed to reacquire rb assertion:%{public}@ for process:%{public}@", buf, 0x2Au);

            v27 = v36;
          }
        }
        else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v30 = v41->_processIdentity;
          *(_DWORD *)buf = 134218498;
          v51 = v41;
          v52 = 2114;
          v53 = v25;
          v54 = 2114;
          v55 = v30;
          _os_log_impl(&dword_2145AC000, v29, OS_LOG_TYPE_DEFAULT, "%p (reacquire) acquired rbs assertion:%{public}@ for process:%{public}@", buf, 0x20u);
        }

        objc_storeStrong(location, v15);
        v31 = v41->_lock_rbsAssertion;
        v41->_lock_rbsAssertion = (RBSAssertion *)v25;
        v11 = v25;

        objc_storeStrong(p_lock_durationCalculator, v14);
      }
      else
      {
        v15 = 0;
        v14 = 0;
      }

LABEL_26:
      p_lock = v44;
      v8 = v43;
      if (v43)
        goto LABEL_27;
      goto LABEL_30;
    }
  }
LABEL_31:
  lock_acquiredAssertion = self->_lock_acquiredAssertion;
  if (!lock_acquiredAssertion && -[NSMapTable count](*p_lock_aggregated, "count"))
  {
    bls_scenes_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      -[BLSHAggregateProcessAssertion invalidateAggregatedAssertion:].cold.1((uint64_t)self, (id *)p_lock_aggregated, v34);

  }
  os_unfair_lock_unlock(p_lock);

  return lock_acquiredAssertion != 0;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  RBSAssertion *lock_rbsAssertion;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    -[RBSAssertion invalidate](self->_lock_rbsAssertion, "invalidate");
    lock_rbsAssertion = self->_lock_rbsAssertion;
    self->_lock_rbsAssertion = 0;

    self->_lock_invalidated = 1;
  }
  os_unfair_lock_unlock(p_lock);
}

- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3
{
  void *v3;
  os_state_data_s *v4;

  -[BLSHAggregateProcessAssertion debugDescription](self, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (os_state_data_s *)BLSStateDataWithTitleDescriptionAndHints();

  return v4;
}

- (NSString)debugDescription
{
  void *v3;
  os_unfair_lock_s *p_lock;
  id v5;
  double v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  BLSHAggregateProcessAssertion *v16;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_lock_invalidated, CFSTR("invalidated"), 1);
  BSContinuousMachTimeNow();
  v7 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("elapsed"), 3, v6 - self->_initTimestamp);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __49__BLSHAggregateProcessAssertion_debugDescription__block_invoke;
  v14 = &unk_24D1BBE80;
  v15 = v3;
  v16 = self;
  v8 = v3;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v11);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v8, "build", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

void __49__BLSHAggregateProcessAssertion_debugDescription__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("RBSAssertion"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("acquiredAssertion"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "keyEnumerator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("aggregatedAssertions"), 0);

}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_lock_durationCalculator, 0);
  objc_storeStrong((id *)&self->_lock_acquiredAssertion, 0);
  objc_storeStrong((id *)&self->_lock_rbsAssertion, 0);
  objc_storeStrong((id *)&self->_lock_aggregated, 0);
}

+ (void)classLock_aggregateForProcessIdentity:shouldCreate:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)acquireAggregatedAssertion:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)acquireAggregatedAssertion:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)invalidateAggregatedAssertion:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  int v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend(*a2, "count");
  v7 = *a2;
  v8 = 134218498;
  v9 = a1;
  v10 = 1024;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_fault_impl(&dword_2145AC000, a3, OS_LOG_TYPE_FAULT, "%p shouldInvalidate but still has aggregated count:%d — %@", (uint8_t *)&v8, 0x1Cu);
}

- (void)invalidateAggregatedAssertion:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "explanation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_4(&dword_2145AC000, a3, v6, "%p invalidateAggregatedAssertion: invalidating RBS assertion %{public}@", (uint8_t *)&v7);

}

@end
