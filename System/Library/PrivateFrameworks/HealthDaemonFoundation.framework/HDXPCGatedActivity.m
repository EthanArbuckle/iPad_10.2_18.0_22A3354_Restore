@implementation HDXPCGatedActivity

- (HDXPCGatedActivity)initWithName:(id)a3 criteria:(id)a4 loggingCategory:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDXPCGatedActivity *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  id handler;
  OS_xpc_object *v19;
  OS_xpc_object *criteria;
  OS_xpc_object **p_criteria;
  void *v22;
  double v23;
  double v24;
  double v25;
  int64_t v26;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)HDXPCGatedActivity;
  v14 = -[HDXPCGatedActivity init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v15;

    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_loggingCategory, a5);
    v17 = objc_msgSend(v13, "copy");
    handler = v14->_handler;
    v14->_handler = (id)v17;

    v19 = (OS_xpc_object *)xpc_copy(v11);
    p_criteria = &v14->_criteria;
    criteria = v14->_criteria;
    v14->_criteria = v19;

    objc_storeWeak((id *)&v14->_activityShim, v14);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleForKey:", v14->_name);
    v24 = v23;

    if (v24 <= 0.0)
    {
      p_criteria = (OS_xpc_object **)MEMORY[0x24BDAC5A0];
    }
    else
    {
      v14->_nextScheduledFireDeadline = v24;
      v25 = v24 - CFAbsoluteTimeGetCurrent();
      if (v25 <= 0.0)
        v26 = 1;
      else
        v26 = (uint64_t)v25;
      xpc_dictionary_set_int64(v14->_criteria, (const char *)*MEMORY[0x24BDAC5B8], v26);
      xpc_dictionary_set_int64(v14->_criteria, (const char *)*MEMORY[0x24BDAC5D8], 0);
      xpc_dictionary_set_BOOL(v14->_criteria, (const char *)*MEMORY[0x24BDAC6B8], 0);
    }
    -[HDXPCGatedActivity _registerActivityWithCriteria:](v14, "_registerActivityWithCriteria:", *p_criteria);
  }

  return v14;
}

- (BOOL)waitingForTrigger
{
  HDXPCGatedActivity *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_nextScheduledFireDeadline > 0.0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setWaitingForTrigger:(BOOL)a3
{
  os_unfair_lock_s *p_lock;
  double nextScheduledFireDeadline;
  NSObject *loggingCategory;
  int v8;
  HDXPCGatedActivity *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a3)
  {
    nextScheduledFireDeadline = self->_nextScheduledFireDeadline;
    os_unfair_lock_unlock(p_lock);
    if (nextScheduledFireDeadline == 0.0)
    {
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138543362;
        v9 = self;
        _os_log_impl(&dword_210F9A000, loggingCategory, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting implicit run by setting waitingForTrigger = YES.", (uint8_t *)&v8, 0xCu);
      }
      -[HDXPCGatedActivity requestRunWithMaximumDelay:completion:](self, "requestRunWithMaximumDelay:completion:", &__block_literal_global_2, 0.0);
    }
  }
  else
  {
    -[HDXPCGatedActivity _lock_resetNextActivityFireDate](self, "_lock_resetNextActivityFireDate");
    os_unfair_lock_unlock(p_lock);
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  NSString *name;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  name = self->_name;
  if (self->_inProgress)
  {
    v8 = CFSTR("ACTIVE");
LABEL_6:
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %@>"), v5, self, self->_name, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (self->_nextScheduledFireDeadline <= 0.0)
  {
    v8 = CFSTR("idle");
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.2lfs"), *(_QWORD *)&self->_nextScheduledFireDeadline);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %@>"), v6, self, name, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v10;
}

- (void)requestRunWithMaximumDelay:(double)a3 completion:(id)a4
{
  HDCoalescedTaskPoolQuota *quota;
  double v7;
  double v8;
  id v9;

  v9 = a4;
  quota = self->_quota;
  if (quota)
  {
    -[HDCoalescedTaskPoolQuota timeUntilNextAvailableTrigger](quota, "timeUntilNextAvailableTrigger");
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }
  -[HDXPCGatedActivity _runRequestWithMaximumDelay:requiredDelay:completion:](self, "_runRequestWithMaximumDelay:requiredDelay:completion:", v9, a3, v8);

}

- (void)_runRequestWithMaximumDelay:(double)a3 requiredDelay:(double)a4 completion:(id)a5
{
  id v8;
  os_unfair_lock_s *p_lock;
  double nextScheduledFireDeadline;
  CFAbsoluteTime v11;
  double nextFireTime;
  NSMutableArray *nextCompletions;
  NSMutableArray *v15;
  NSMutableArray *v16;
  void *v17;
  void *v18;
  NSObject *loggingCategory;
  double v20;
  NSObject *v21;
  NSMutableArray *v22;
  NSMutableArray *v23;
  NSMutableArray *v24;
  void *v25;
  void *v26;
  xpc_object_t v27;
  NSObject *v28;
  NSMutableArray *pendingCompletions;
  void *v30;
  void *v31;
  int v32;
  HDXPCGatedActivity *v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  nextScheduledFireDeadline = self->_nextScheduledFireDeadline;
  if (nextScheduledFireDeadline > 0.0)
  {
    if (self->_inProgress && self->_rescheduleWhileInProgress)
    {
      v11 = CFAbsoluteTimeGetCurrent() + a3;
      nextFireTime = self->_nextFireTime;
      if (nextFireTime == 0.0 || v11 < nextFireTime)
        self->_nextFireTime = v11;
      nextCompletions = self->_nextCompletions;
      if (!nextCompletions)
      {
        v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v16 = self->_nextCompletions;
        self->_nextCompletions = v15;

        nextCompletions = self->_nextCompletions;
      }
      v17 = (void *)objc_msgSend(v8, "copy", v11);
      v18 = (void *)MEMORY[0x212BD3780]();
      -[NSMutableArray addObject:](nextCompletions, "addObject:", v18);

      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
      {
        v32 = 138543362;
        v33 = self;
        _os_log_impl(&dword_210F9A000, loggingCategory, OS_LOG_TYPE_DEFAULT, "%{public}@: Run requested delayed because activity is already in progress.", (uint8_t *)&v32, 0xCu);
      }
LABEL_23:
      os_unfair_lock_unlock(p_lock);
      goto LABEL_24;
    }
    v20 = nextScheduledFireDeadline - CFAbsoluteTimeGetCurrent();
    if (v20 <= a3)
    {
      _HKInitializeLogging();
      v28 = self->_loggingCategory;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v32 = 138543874;
        v33 = self;
        v34 = 2048;
        v35 = a3;
        v36 = 2048;
        v37 = v20;
        _os_log_impl(&dword_210F9A000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: Run requested with delay %lf, but next fire date is in  %lf, no need to re-register.", (uint8_t *)&v32, 0x20u);
      }
      pendingCompletions = self->_pendingCompletions;
      v30 = (void *)objc_msgSend(v8, "copy");
      v31 = (void *)MEMORY[0x212BD3780]();
      -[NSMutableArray addObject:](pendingCompletions, "addObject:", v31);

      goto LABEL_23;
    }
  }
  -[HDXPCGatedActivity _lock_setNextScheduledFireDeadline:](self, "_lock_setNextScheduledFireDeadline:", CFAbsoluteTimeGetCurrent() + a3);
  _HKInitializeLogging();
  v21 = self->_loggingCategory;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v32 = 138543874;
    v33 = self;
    v34 = 2048;
    v35 = a3;
    v36 = 2048;
    v37 = a4;
    _os_log_impl(&dword_210F9A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting run with maximum delay %lf, required delay %lf", (uint8_t *)&v32, 0x20u);
  }
  v22 = self->_pendingCompletions;
  if (!v22)
  {
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v24 = self->_pendingCompletions;
    self->_pendingCompletions = v23;

    v22 = self->_pendingCompletions;
  }
  v25 = (void *)objc_msgSend(v8, "copy");
  v26 = (void *)MEMORY[0x212BD3780]();
  -[NSMutableArray addObject:](v22, "addObject:", v26);

  v27 = xpc_copy(self->_criteria);
  os_unfair_lock_unlock(&self->_lock);
  -[HDXPCGatedActivity _registerActivityWithCriteria:delay:gracePeriod:](self, "_registerActivityWithCriteria:delay:gracePeriod:", v27, a4, a3);

LABEL_24:
}

- (void)runUngatedWithCompletion:(id)a3
{
  -[HDXPCGatedActivity _performActivity:completion:](self, "_performActivity:completion:", 0, a3);
}

- (BOOL)shouldDefer
{
  void *v3;
  id WeakRetained;
  char v5;

  -[HDXPCGatedActivity currentActivity](self, "currentActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_activityShim);
    v5 = objc_msgSend(WeakRetained, "xpcActivity_shouldDefer:", v3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_registerActivityWithCriteria:(id)a3
{
  id v4;
  id WeakRetained;
  const char *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_activityShim);
  v6 = -[NSString UTF8String](self->_name, "UTF8String");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__HDXPCGatedActivity__registerActivityWithCriteria___block_invoke;
  v7[3] = &unk_24CB18228;
  objc_copyWeak(&v8, &location);
  objc_msgSend(WeakRetained, "xpcActivity_register:criteria:handler:", v6, v4, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __52__HDXPCGatedActivity__registerActivityWithCriteria___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x212BD35D0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleXPCActivityCallback:", v5);

  objc_autoreleasePoolPop(v3);
}

- (void)_registerActivityWithCriteria:(id)a3 delay:(double)a4 gracePeriod:(double)a5
{
  const char *v7;
  int64_t v8;
  xpc_object_t xdict;

  v7 = (const char *)*MEMORY[0x24BDAC5B8];
  v8 = (uint64_t)a4;
  xdict = a3;
  xpc_dictionary_set_int64(xdict, v7, v8);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x24BDAC5D8], (uint64_t)a5);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x24BDAC6B8], 0);
  -[HDXPCGatedActivity _registerActivityWithCriteria:](self, "_registerActivityWithCriteria:", xdict);

}

- (void)_handleXPCActivityCallback:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  BOOL v7;
  NSObject *loggingCategory;
  _BOOL4 v9;
  NSObject *v10;
  NSString *name;
  id v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  HDXPCGatedActivity *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activityShim);
  v6 = objc_msgSend(WeakRetained, "xpcActivity_getState:", v4);

  if (v6)
  {
    v7 = -[HDXPCGatedActivity waitingForTrigger](self, "waitingForTrigger");
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    v9 = os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138543618;
        v24 = self;
        v25 = 2114;
        v26 = v4;
        _os_log_impl(&dword_210F9A000, loggingCategory, OS_LOG_TYPE_DEFAULT, "%{public}@ fired with activity %{public}@", buf, 0x16u);
      }
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke;
      v21[3] = &unk_24CB187F8;
      v21[4] = self;
      v22 = v4;
      -[HDXPCGatedActivity _performActivity:completion:](self, "_performActivity:completion:", v22, v21);

    }
    else
    {
      if (v9)
      {
        *(_DWORD *)buf = 138543618;
        v24 = self;
        v25 = 2114;
        v26 = v4;
        _os_log_impl(&dword_210F9A000, loggingCategory, OS_LOG_TYPE_DEFAULT, "%{public}@ fired with activity %{public}@, but we're not currently waiting on a trigger.", buf, 0x16u);
      }
      os_unfair_lock_lock(&self->_lock);
      -[HDXPCGatedActivity _lock_resetNextActivityFireDate](self, "_lock_resetNextActivityFireDate");
      os_unfair_lock_unlock(&self->_lock);
      v12 = objc_loadWeakRetained((id *)&self->_activityShim);
      v13 = objc_msgSend(v12, "xpcActivity_setCompletionStatus:activity:", 0, v4);

      if ((v13 & 1) == 0)
      {
        _HKInitializeLogging();
        v14 = self->_loggingCategory;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[HDXPCGatedActivity _handleXPCActivityCallback:].cold.1((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v10 = self->_loggingCategory;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      *(_DWORD *)buf = 138543362;
      v24 = (HDXPCGatedActivity *)name;
      _os_log_impl(&dword_210F9A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Checked in for gated scheduling", buf, 0xCu);
    }
  }

}

void __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id *v6;
  NSObject *v7;
  id v8;
  id v9;
  char v10;
  id v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  id v16;
  char v17;
  id WeakRetained;
  char v19;
  id v20;
  id v21;
  char v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  xpc_object_t v30;
  _QWORD *v31;
  void *v32;
  double v33;
  int v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2 != 2)
  {
    if (a2 == 1)
    {
      _HKInitializeLogging();
      v6 = (id *)(a1 + 32);
      if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 104), OS_LOG_TYPE_ERROR))
        __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke_cold_3();
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
      v19 = objc_msgSend(WeakRetained, "xpcActivity_setCompletionStatus:activity:", 3, *(_QWORD *)(a1 + 40));

      if ((v19 & 1) == 0)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*((os_log_t *)*v6 + 13), OS_LOG_TYPE_ERROR))
          __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke_cold_1();
      }
      goto LABEL_25;
    }
    if (a2)
      goto LABEL_26;
    _HKInitializeLogging();
    v6 = (id *)(a1 + 32);
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *v6;
      v34 = 138543362;
      v35 = v8;
      _os_log_impl(&dword_210F9A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished activity successfully.", (uint8_t *)&v34, 0xCu);
    }
    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
    v10 = objc_msgSend(v9, "xpcActivity_setCompletionStatus:activity:", 0, *(_QWORD *)(a1 + 40));

    if ((v10 & 1) != 0)
      goto LABEL_25;
    _HKInitializeLogging();
    if (!os_log_type_enabled(*((os_log_t *)*v6 + 13), OS_LOG_TYPE_ERROR))
      goto LABEL_25;
LABEL_24:
    __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke_cold_1();
LABEL_25:
    os_unfair_lock_lock((os_unfair_lock_t)*v6 + 2);
    objc_msgSend(*v6, "_lock_resetNextActivityFireDate");
    os_unfair_lock_unlock((os_unfair_lock_t)*v6 + 2);
    goto LABEL_26;
  }
  v6 = (id *)(a1 + 32);
  v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  v12 = objc_msgSend(v11, "xpcActivity_shouldDefer:", *(_QWORD *)(a1 + 40));

  _HKInitializeLogging();
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v14)
    {
      v20 = *v6;
      v34 = 138543362;
      v35 = v20;
      _os_log_impl(&dword_210F9A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Handler requested activity deferral but activity should not be deferred; failing activity.",
        (uint8_t *)&v34,
        0xCu);
    }
    v21 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
    v22 = objc_msgSend(v21, "xpcActivity_setCompletionStatus:activity:", 3, *(_QWORD *)(a1 + 40));

    if ((v22 & 1) != 0)
      goto LABEL_25;
    _HKInitializeLogging();
    if (!os_log_type_enabled(*((os_log_t *)*v6 + 13), OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    goto LABEL_24;
  }
  if (v14)
  {
    v15 = *v6;
    v34 = 138543362;
    v35 = v15;
    _os_log_impl(&dword_210F9A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting activity deferral.", (uint8_t *)&v34, 0xCu);
  }
  v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  v17 = objc_msgSend(v16, "xpcActivity_setState:activity:", 3, *(_QWORD *)(a1 + 40));

  if ((v17 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*((os_log_t *)*v6 + 13), OS_LOG_TYPE_ERROR))
      __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke_cold_4();
  }
LABEL_26:
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(double *)(v23 + 56);
  if (v24 <= 0.0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v23 + 8));
  }
  else
  {
    v25 = v24 - CFAbsoluteTimeGetCurrent();
    v26 = 0.0;
    if (v25 >= 0.0)
      v27 = v25;
    else
      v27 = 0.0;
    objc_msgSend(*(id *)(a1 + 32), "_lock_setNextScheduledFireDeadline:", CFAbsoluteTimeGetCurrent() + v27);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(*(_QWORD *)(a1 + 32) + 64));
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(void **)(v28 + 64);
    *(_QWORD *)(v28 + 64) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    v30 = xpc_copy(*(xpc_object_t *)(*(_QWORD *)(a1 + 32) + 24));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v31 = *(_QWORD **)(a1 + 32);
    v32 = (void *)v31[15];
    if (v32)
    {
      objc_msgSend(v32, "timeUntilNextAvailableTrigger");
      v26 = v33;
    }
    objc_msgSend(v31, "_registerActivityWithCriteria:delay:gracePeriod:", v30, v26, v27);

  }
}

- (void)_performActivity:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSMutableArray *pendingCompletions;
  NSMutableArray *v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  _BOOL4 inProgress;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  id WeakRetained;
  char v17;
  void (**unitTest_ActivityCompletion)(void);
  NSObject *loggingCategory;
  uint64_t v20;
  _QWORD v21[5];

  v7 = a3;
  v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  pendingCompletions = self->_pendingCompletions;
  if (!pendingCompletions)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v11 = self->_pendingCompletions;
    self->_pendingCompletions = v10;

    pendingCompletions = self->_pendingCompletions;
  }
  v12 = (void *)objc_msgSend(v8, "copy");
  v13 = (void *)MEMORY[0x212BD3780]();
  -[NSMutableArray addObject:](pendingCompletions, "addObject:", v13);

  inProgress = self->_inProgress;
  if (!self->_inProgress)
  {
    objc_storeStrong((id *)&self->_currentActivity, a3);
    self->_inProgress = 1;
  }
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x212BD3780](self->_handler);
  os_unfair_lock_unlock(&self->_lock);
  if (!inProgress)
  {
    if (v7
      && (WeakRetained = objc_loadWeakRetained((id *)&self->_activityShim),
          v17 = objc_msgSend(WeakRetained, "xpcActivity_setState:activity:", 4, v7),
          WeakRetained,
          (v17 & 1) == 0))
    {
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
        -[HDXPCGatedActivity _performActivity:completion:].cold.1((uint64_t)self, loggingCategory, v20);
    }
    else
    {
      -[HDCoalescedTaskPoolQuota consumeQuota](self->_quota, "consumeQuota");
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __50__HDXPCGatedActivity__performActivity_completion___block_invoke;
      v21[3] = &unk_24CB18820;
      v21[4] = self;
      ((void (**)(_QWORD, HDXPCGatedActivity *, id, _QWORD *))v15)[2](v15, self, v7, v21);
      if (HDIsUnitTesting())
      {
        unitTest_ActivityCompletion = (void (**)(void))self->unitTest_ActivityCompletion;
        if (unitTest_ActivityCompletion)
          unitTest_ActivityCompletion[2]();
      }
    }
  }

}

uint64_t __50__HDXPCGatedActivity__performActivity_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activityFinishedWithResult:error:", a2, a3);
}

- (void)_activityFinishedWithResult:(int64_t)a3 error:(id)a4
{
  id v5;
  NSMutableArray *v6;
  NSMutableArray *pendingCompletions;
  OS_xpc_object *currentActivity;
  NSMutableArray *v9;
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

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  self->_inProgress = 0;
  v6 = self->_pendingCompletions;
  pendingCompletions = self->_pendingCompletions;
  self->_pendingCompletions = 0;

  currentActivity = self->_currentActivity;
  self->_currentActivity = 0;

  os_unfair_lock_unlock(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v6;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13));
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)_lock_setNextScheduledFireDeadline:(double)a3
{
  id v5;

  os_unfair_lock_assert_owner(&self->_lock);
  self->_nextScheduledFireDeadline = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDouble:forKey:", self->_name, a3);

}

- (void)_lock_resetNextActivityFireDate
{
  id v3;

  os_unfair_lock_assert_owner(&self->_lock);
  self->_nextScheduledFireDeadline = 0.0;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", self->_name);

}

- (void)xpcActivity_register:(const char *)a3 criteria:(id)a4 handler:(id)a5
{
  id v7;
  xpc_object_t criteria;

  criteria = a4;
  v7 = a5;
  if ((HDIsUnitTesting() & 1) == 0)
    xpc_activity_register(a3, criteria, v7);

}

- (void)xpcActivity_unregister:(const char *)a3
{
  if ((HDIsUnitTesting() & 1) == 0)
    xpc_activity_unregister(a3);
}

- (BOOL)xpcActivity_shouldDefer:(id)a3
{
  return xpc_activity_should_defer((xpc_activity_t)a3);
}

- (void)xpcActivity_setCriteria:(id)a3 activity:(id)a4
{
  xpc_activity_set_criteria((xpc_activity_t)a4, a3);
}

- (id)xpcActivity_copyCriteria:(id)a3
{
  return xpc_activity_copy_criteria((xpc_activity_t)a3);
}

- (int64_t)xpcActivity_getState:(id)a3
{
  return xpc_activity_get_state((xpc_activity_t)a3);
}

- (BOOL)xpcActivity_setState:(int64_t)a3 activity:(id)a4
{
  return xpc_activity_set_state((xpc_activity_t)a4, a3);
}

- (BOOL)xpcActivity_setCompletionStatus:(int64_t)a3 activity:(id)a4
{
  return xpc_activity_set_completion_status();
}

- (void)unitTest_setActivityShim:(id)a3
{
  HDXPCGatedActivity *v4;
  HDXPCGatedActivity *v5;

  v5 = (HDXPCGatedActivity *)a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = v5;
  if (!v5)
    v4 = self;
  objc_storeWeak((id *)&self->_activityShim, v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)unitTest_setActivityCompletion:(id)a3
{
  void *v4;
  id unitTest_ActivityCompletion;

  v4 = (void *)MEMORY[0x212BD3780](a3, a2);
  unitTest_ActivityCompletion = self->unitTest_ActivityCompletion;
  self->unitTest_ActivityCompletion = v4;

}

- (NSString)name
{
  return self->_name;
}

- (OS_os_log)loggingCategory
{
  return self->_loggingCategory;
}

- (OS_xpc_object)currentActivity
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCurrentActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)rescheduleWhileInProgress
{
  return self->_rescheduleWhileInProgress;
}

- (void)setRescheduleWhileInProgress:(BOOL)a3
{
  self->_rescheduleWhileInProgress = a3;
}

- (HDCoalescedTaskPoolQuota)quota
{
  return self->_quota;
}

- (void)setQuota:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quota, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_activityShim);
  objc_storeStrong(&self->unitTest_ActivityCompletion, 0);
  objc_storeStrong((id *)&self->_nextCompletions, 0);
  objc_storeStrong((id *)&self->_pendingCompletions, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong(&self->_handler, 0);
}

- (void)_handleXPCActivityCallback:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_210F9A000, a2, a3, "%{public}@: Failed to update completion state.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_210F9A000, v0, v1, "%{public}@: Failed to update completion state.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke_cold_3()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_0_1(&dword_210F9A000, v1, (uint64_t)v1, "%{public}@: Failed to perform activity: %{public}@.", v2);
  OUTLINED_FUNCTION_1();
}

void __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_210F9A000, v0, v1, "%{public}@: Failed to defer activity.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_performActivity:(uint64_t)a3 completion:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 96);
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  OUTLINED_FUNCTION_0_1(&dword_210F9A000, a2, a3, "%{public}@: Failed to continue activity %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

@end
