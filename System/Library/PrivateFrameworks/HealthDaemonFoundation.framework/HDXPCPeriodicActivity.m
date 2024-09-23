@implementation HDXPCPeriodicActivity

- (HDXPCPeriodicActivity)initWithName:(id)a3 baseInterval:(double)a4 criteria:(id)a5 loggingCategory:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HDXPCPeriodicActivity *v16;
  uint64_t v17;
  NSString *name;
  OS_xpc_object *v19;
  OS_xpc_object *criteria;
  uint64_t v21;
  id handler;
  NSObject *loggingCategory;
  NSString *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  const os_unfair_lock *v28;
  objc_super v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  const os_unfair_lock *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v30.receiver = self;
  v30.super_class = (Class)HDXPCPeriodicActivity;
  v16 = -[HDXPCPeriodicActivity init](&v30, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    name = v16->_name;
    v16->_name = (NSString *)v17;

    v16->_baseInterval = a4;
    v19 = (OS_xpc_object *)xpc_copy(v13);
    criteria = v16->_criteria;
    v16->_criteria = v19;

    v21 = objc_msgSend(v15, "copy");
    handler = v16->_handler;
    v16->_handler = (id)v21;

    objc_storeStrong((id *)&v16->_loggingCategory, a6);
    v16->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v16->_lock);
    _HKInitializeLogging();
    loggingCategory = v16->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v16->_name;
      v25 = loggingCategory;
      _HDXPCPeriodicActivityLastSuccessfulRunUserDefaultsKey(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDXPCPeriodicActivity _dateForDefaultsKey:]((uint64_t)v16, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[HDXPCPeriodicActivity _lock_errorCount]((const os_unfair_lock *)v16);
      *(_DWORD *)buf = 138543874;
      v32 = v12;
      v33 = 2112;
      v34 = v27;
      v35 = 2048;
      v36 = v28;
      _os_log_impl(&dword_210F9A000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Initialized; Last Success: %@ (%ld errors since)",
        buf,
        0x20u);

    }
    os_unfair_lock_unlock(&v16->_lock);
    objc_storeWeak((id *)&v16->_activityShim, v16);
  }

  return v16;
}

- (id)_dateForDefaultsKey:(uint64_t)a1
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    v2 = (void *)MEMORY[0x24BDBCF50];
    v3 = a2;
    objc_msgSend(v2, "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (const)_lock_errorCount
{
  const os_unfair_lock *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 2);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _HDXPCPeriodicActivityErrorCountUserDefaultsKey(*(void **)&v1[16]._os_unfair_lock_opaque);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "integerForKey:", v3);

    return (const os_unfair_lock *)v4;
  }
  return result;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_210F9A000, v0, v1, "[%{public}@]: Client bug: Dealloc before unregistration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  objc_class *v5;
  void *v6;
  NSString *name;
  __CFString *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  v8 = CFSTR("idle");
  v9 = name;
  switch(self->_state)
  {
    case 0:
      break;
    case 1:
      v8 = CFSTR("starting");
      goto LABEL_6;
    case 2:
      v8 = CFSTR("running");
      goto LABEL_6;
    case 3:
      v8 = CFSTR("waiting");
LABEL_6:
      v9 = self->_name;
      break;
    default:
      objc_msgSend((id)0x7C8, "stringWithFormat:", CFSTR("unknown(%ld)"), self->_state);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = self->_name;
      break;
  }
  _HDXPCPeriodicActivityLastSuccessfulRunUserDefaultsKey(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDXPCPeriodicActivity _dateForDefaultsKey:]((uint64_t)self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p %@: %@ Last Success: %@ (%ld errors since) Interval: %0.2lfs>"), v6, self, name, v8, v11, -[HDXPCPeriodicActivity _lock_errorCount]((const os_unfair_lock *)self), *(_QWORD *)&self->_baseInterval);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v12;
}

+ (void)registerDisabledPeriodicActivityWithName:(id)a3 loggingCategory:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  const char *v8;
  void *v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if ((HDIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_210F9A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Registering DISABLED.", buf, 0xCu);
    }
    v7 = objc_retainAutorelease(v5);
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    v9 = (void *)*MEMORY[0x24BDAC5A0];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __82__HDXPCPeriodicActivity_registerDisabledPeriodicActivityWithName_loggingCategory___block_invoke;
    v10[3] = &unk_24CB18200;
    v11 = v6;
    v12 = v7;
    xpc_activity_register(v8, v9, v10);

  }
}

void __82__HDXPCPeriodicActivity_registerDisabledPeriodicActivityWithName_loggingCategory___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x212BD35D0]();
  if (xpc_activity_get_state(v3))
  {
    if (!xpc_activity_set_state(v3, 5))
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR))
        __82__HDXPCPeriodicActivity_registerDisabledPeriodicActivityWithName_loggingCategory___block_invoke_cold_1();
    }
  }
  else
  {
    _HKInitializeLogging();
    v5 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_210F9A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Checked in DISABLED.", (uint8_t *)&v7, 0xCu);
    }
    xpc_activity_unregister((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
  }
  objc_autoreleasePoolPop(v4);

}

- (void)registerActivity
{
  BOOL *p_registered;
  NSObject *loggingCategory;
  NSString *name;
  id WeakRetained;
  const char *v8;
  OS_xpc_object *criteria;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_registered = &self->_registered;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_registered))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_registered));
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    *(_DWORD *)buf = 138543362;
    v13 = name;
    _os_log_impl(&dword_210F9A000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Registering.", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_activityShim);
  v8 = -[NSString UTF8String](self->_name, "UTF8String");
  criteria = self->_criteria;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__HDXPCPeriodicActivity_registerActivity__block_invoke;
  v10[3] = &unk_24CB18228;
  objc_copyWeak(&v11, (id *)buf);
  objc_msgSend(WeakRetained, "xpcActivity_register:criteria:handler:", v8, criteria, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __41__HDXPCPeriodicActivity_registerActivity__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x212BD35D0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDXPCPeriodicActivity _handleXPCActivityCallback:]((uint64_t)WeakRetained, v5);

  objc_autoreleasePoolPop(v3);
}

- (void)_handleXPCActivityCallback:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v5 = objc_msgSend(WeakRetained, "xpcActivity_getState:", v3);

    _HKInitializeLogging();
    v6 = *(NSObject **)(a1 + 72);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        v8 = *(_QWORD *)(a1 + 64);
        v10 = 138543362;
        v11 = v8;
        _os_log_impl(&dword_210F9A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Fired.", (uint8_t *)&v10, 0xCu);
      }
      -[HDXPCPeriodicActivity _performActivity:](a1, v3);
    }
    else if (v7)
    {
      v9 = *(_QWORD *)(a1 + 64);
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_210F9A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Checked in.", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)unregisterActivity
{
  BOOL *p_registered;
  int v4;
  NSObject *loggingCategory;
  NSString *name;
  id WeakRetained;
  int v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  p_registered = &self->_registered;
  do
  {
    v4 = __ldaxr((unsigned __int8 *)p_registered);
    if (v4 != 1)
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(0, (unsigned __int8 *)p_registered));
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    v8 = 138543362;
    v9 = name;
    _os_log_impl(&dword_210F9A000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Unregistering.", (uint8_t *)&v8, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_activityShim);
  objc_msgSend(WeakRetained, "xpcActivity_unregister:", -[NSString UTF8String](self->_name, "UTF8String"));

}

- (OS_xpc_object)criteria
{
  os_unfair_lock_s *p_lock;
  xpc_object_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = xpc_copy(self->_criteria);
  os_unfair_lock_unlock(p_lock);
  return (OS_xpc_object *)v4;
}

- (void)setCriteria:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDXPCPeriodicActivity _lock_setCriteria:]((uint64_t)self, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_setCriteria:(uint64_t)a1
{
  xpc_object_t v3;
  void *v4;
  id WeakRetained;
  xpc_object_t object2;

  object2 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    if (!xpc_equal(*(xpc_object_t *)(a1 + 16), object2))
    {
      v3 = xpc_copy(object2);
      v4 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v3;

      if (*(_QWORD *)(a1 + 24))
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(WeakRetained, "xpcActivity_setCriteria:activity:", object2, *(_QWORD *)(a1 + 24));

      }
      else
      {
        objc_msgSend((id)a1, "unregisterActivity");
        objc_msgSend((id)a1, "registerActivity");
      }
    }
  }

}

- (OS_xpc_object)currentActivity
{
  os_unfair_lock_s *p_lock;
  OS_xpc_object *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_currentActivity;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)didPerformActivityWithResult:(int64_t)a3 minimumRetryInterval:(double)a4 activityStartDate:(id)a5 error:(id)a6
{
  os_unfair_lock_s *p_lock;
  id v11;
  id v12;

  p_lock = &self->_lock;
  v11 = a6;
  v12 = a5;
  os_unfair_lock_lock(p_lock);
  -[HDXPCPeriodicActivity _lock_activityFinishedWithResult:minimumRetryInterval:activityStartDate:error:]((uint64_t)self, a3, v12, v11, a4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_activityFinishedWithResult:(void *)a3 minimumRetryInterval:(void *)a4 activityStartDate:(double)a5 error:
{
  id v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v11 = fmax(a5, 0.0);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 <= 0.0)
    {
      _HDXPCPeriodicActivityEarliestNextRunUserDefaultsKey(*(void **)(a1 + 64));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _HDXPCPeriodicActivityEarliestNextRunUserDefaultsKey(*(void **)(a1 + 64));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, v14);

    }
    switch(a2)
    {
      case 0:
        _HKInitializeLogging();
        v15 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(_QWORD *)(a1 + 64);
          v23 = 138543618;
          v24 = v16;
          v25 = 2048;
          v26 = v11;
          _os_log_impl(&dword_210F9A000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]: succeeded with minimum retry interval: %lfs", (uint8_t *)&v23, 0x16u);
        }
        -[HDXPCPeriodicActivity _lock_setLastSuccessfulRunDate:](a1, v9);
        break;
      case 1:
        _HKInitializeLogging();
        v17 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 64);
          v23 = 138543362;
          v24 = v18;
          _os_log_impl(&dword_210F9A000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]: waiting for external conditions to change", (uint8_t *)&v23, 0xCu);
        }
        goto LABEL_11;
      case 2:
LABEL_11:
        _HKInitializeLogging();
        v19 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = *(_QWORD *)(a1 + 64);
          v23 = 138543874;
          v24 = v20;
          v25 = 2048;
          v26 = v11;
          v27 = 2114;
          v28 = v10;
          _os_log_error_impl(&dword_210F9A000, v19, OS_LOG_TYPE_ERROR, "[%{public}@]: failed but will retry on the normal schedule with minimum interval %0.2lfs: %{public}@.", (uint8_t *)&v23, 0x20u);
        }
        break;
      case 3:
        _HKInitializeLogging();
        v21 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = *(_QWORD *)(a1 + 64);
          v23 = 138543874;
          v24 = v22;
          v25 = 2048;
          v26 = v11;
          v27 = 2114;
          v28 = v10;
          _os_log_error_impl(&dword_210F9A000, v21, OS_LOG_TYPE_ERROR, "[%{public}@]: failed and will retry after minimum interval %0.2lfs: %{public}@.", (uint8_t *)&v23, 0x20u);
        }
        -[HDXPCPeriodicActivity _lock_incrementErrorCount](a1);
        break;
      case 4:
        _HKInitializeLogging();
        if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
          -[HDXPCPeriodicActivity _lock_activityFinishedWithResult:minimumRetryInterval:activityStartDate:error:].cold.1();
        break;
      default:
        break;
    }
  }

}

- (int64_t)errorCount
{
  os_unfair_lock_s *p_lock;
  const os_unfair_lock *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[HDXPCPeriodicActivity _lock_errorCount]((const os_unfair_lock *)self);
  os_unfair_lock_unlock(p_lock);
  return (int64_t)v4;
}

- (BOOL)shouldDefer
{
  void *v3;
  id WeakRetained;
  char v5;

  -[HDXPCPeriodicActivity currentActivity](self, "currentActivity");
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

- (NSDate)lastSuccessfulRunDate
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  _HDXPCPeriodicActivityLastSuccessfulRunUserDefaultsKey(self->_name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDXPCPeriodicActivity _dateForDefaultsKey:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSDate *)v5;
}

- (NSDate)earliestRunDate
{
  void *v3;
  void *v4;

  _HDXPCPeriodicActivityEarliestNextRunUserDefaultsKey(self->_name);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDXPCPeriodicActivity _dateForDefaultsKey:]((uint64_t)self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (BOOL)isWaiting
{
  HDXPCPeriodicActivity *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_state == 3;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (OS_xpc_object)currentCriteria
{
  void *v3;
  id WeakRetained;
  void *v5;

  -[HDXPCPeriodicActivity currentActivity](self, "currentActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_activityShim);
    objc_msgSend(WeakRetained, "xpcActivity_copyCriteria:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (OS_xpc_object *)v5;
}

- (void)externalConditionsChanged
{
  os_unfair_lock_s *p_lock;
  int64_t state;
  NSObject *v5;
  NSString *v6;
  NSObject *loggingCategory;
  NSString *name;
  int v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  if (state == 3)
  {
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      v9 = 138543362;
      v10 = name;
      _os_log_impl(&dword_210F9A000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Conditions changed while waiting; kicking off a run.",
        (uint8_t *)&v9,
        0xCu);
    }
    os_unfair_lock_unlock(p_lock);
    -[HDXPCPeriodicActivity _performCurrentActivityWithCompletion:]((uint64_t)self, &__block_literal_global);
  }
  else
  {
    if (state == 2)
    {
      _HKInitializeLogging();
      v5 = self->_loggingCategory;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = self->_name;
        v9 = 138543362;
        v10 = v6;
        _os_log_impl(&dword_210F9A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Conditions changed while running; recording for immediate reconsideration.",
          (uint8_t *)&v9,
          0xCu);
      }
      self->_conditionsChanged = 1;
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_performCurrentActivityWithCompletion:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  CFAbsoluteTime Current;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, _QWORD *);
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  CFAbsoluteTime v28;
  os_signpost_id_t v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if ((*(_QWORD *)(a1 + 32) & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      *(_QWORD *)(a1 + 32) = 2;
      v4 = *(id *)(a1 + 24);
      *(_BYTE *)(a1 + 40) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      objc_msgSend(MEMORY[0x24BDD3AD8], "transactionWithOwner:activityName:", a1, *(_QWORD *)(a1 + 64));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      _HKInitializeLogging();
      v7 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138543362;
        v31 = v8;
        _os_log_impl(&dword_210F9A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Calling out to client handler", buf, 0xCu);
      }
      _HKLogPersistedSignposts();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_signpost_id_make_with_pointer(v9, (const void *)a1);

      _HKInitializeLogging();
      _HKLogPersistedSignposts();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_signpost_enabled(v11);

      if (v12)
      {
        _HKLogPersistedSignposts();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
        {
          v15 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 138543362;
          v31 = v15;
          _os_signpost_emit_with_name_impl(&dword_210F9A000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HDXPCPeriodicActivity", "name=%{public}@", buf, 0xCu);
        }

      }
      v16 = *(_QWORD *)(a1 + 48);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __63__HDXPCPeriodicActivity__performCurrentActivityWithCompletion___block_invoke;
      v24[3] = &unk_24CB182D0;
      v24[4] = a1;
      v28 = Current;
      v29 = v10;
      v26 = v4;
      v27 = v3;
      v25 = v5;
      v17 = *(void (**)(uint64_t, uint64_t, _QWORD *))(v16 + 16);
      v18 = v4;
      v19 = v5;
      v17(v16, a1, v24);

    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      _HKInitializeLogging();
      v20 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(a1 + 64);
        v22 = v20;
        NSStringFromSelector(sel__performCurrentActivityWithCompletion_);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        v32 = 2114;
        v33 = v23;
        _os_log_impl(&dword_210F9A000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ called while not starting or waiting.", buf, 0x16u);

      }
    }
  }

}

- (double)modifiedIntervalForCurrentState
{
  os_unfair_lock_s *p_lock;
  double v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[HDXPCPeriodicActivity _lock_modifiedIntervalForCurrentState]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)_lock_modifiedIntervalForCurrentState
{
  double v2;
  int64_t v3;
  unint64_t v4;
  double v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;

  if (!a1)
    return 0.0;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  v2 = *(double *)(a1 + 80);
  v3 = (int64_t)-[HDXPCPeriodicActivity _lock_errorCount]((const os_unfair_lock *)a1);
  if (v3 >= 1)
  {
    v4 = 20;
    if (v3 < 20)
      v4 = v3;
    v2 = *(double *)(a1 + 80);
    v5 = 0.0;
    v6 = v4 >= 2;
    v7 = v4 - 2;
    if (v6)
      v5 = exp2((double)v7) * (v2 * 0.025);
    if (v5 < v2)
      v2 = v5;
  }
  _HDXPCPeriodicActivityEarliestNextRunUserDefaultsKey(*(void **)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDXPCPeriodicActivity _dateForDefaultsKey:](a1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "timeIntervalSinceNow");
  else
    v10 = 0.0;
  if (v2 < v10)
    v2 = v10;

  return v2;
}

- (void)updateCriteriaForModifiedIntervalForCurrentState
{
  os_unfair_lock_s *p_lock;
  double v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[HDXPCPeriodicActivity _lock_modifiedIntervalForCurrentState]((uint64_t)self);
  xpc_dictionary_set_int64(self->_criteria, (const char *)*MEMORY[0x24BDAC5F0], (uint64_t)v4);
  -[HDXPCPeriodicActivity _lock_setCriteria:]((uint64_t)self, self->_criteria);
  os_unfair_lock_unlock(p_lock);
}

- (void)resetIntervalWithCriteria:(id)a3
{
  -[HDXPCPeriodicActivity setCriteria:](self, "setCriteria:", a3);
  -[HDXPCPeriodicActivity unregisterActivity](self, "unregisterActivity");
  -[HDXPCPeriodicActivity registerActivity](self, "registerActivity");
}

- (void)_performActivity:(uint64_t)a1
{
  id v4;
  id WeakRetained;
  char v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v6 = objc_msgSend(WeakRetained, "xpcActivity_setState:activity:", 4, v4);

    if ((v6 & 1) != 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      if (*(_QWORD *)(a1 + 32))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        _HKInitializeLogging();
        v7 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(_QWORD *)(a1 + 64);
          v13 = 138543362;
          v14 = v8;
          _os_log_impl(&dword_210F9A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Fired while already in progress; finishing activity immediately.",
            (uint8_t *)&v13,
            0xCu);
        }
        v9 = objc_loadWeakRetained((id *)(a1 + 56));
        v10 = objc_msgSend(v9, "xpcActivity_setState:activity:", 5, v4);

        if ((v10 & 1) == 0)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
            -[HDXPCPeriodicActivity _performActivity:].cold.1();
        }
      }
      else
      {
        *(_QWORD *)(a1 + 32) = 1;
        objc_storeStrong((id *)(a1 + 24), a2);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        -[HDXPCPeriodicActivity _performCurrentActivityWithCompletion:](a1, &__block_literal_global_189);
      }
    }
    else
    {
      _HKInitializeLogging();
      v11 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 64);
        v13 = 138543362;
        v14 = v12;
        _os_log_impl(&dword_210F9A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Failed to continue activity.", (uint8_t *)&v13, 0xCu);
      }
    }
  }

}

void __63__HDXPCPeriodicActivity__performCurrentActivityWithCompletion___block_invoke(uint64_t a1, unint64_t a2, void *a3, double a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double Current;
  double v12;
  NSObject *v13;
  id v14;
  id v15;
  double v16;
  const char *v17;
  const char *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _BYTE v31[24];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v8 + 64);
  v9 = *(void **)(v8 + 72);
  Current = CFAbsoluteTimeGetCurrent();
  v12 = *(double *)(a1 + 64);
  v13 = v9;
  v14 = v10;
  v15 = v7;
  v16 = Current - v12;
  switch(a2)
  {
    case 0uLL:
      _HKInitializeLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v31 = 138543618;
        *(_QWORD *)&v31[4] = v14;
        *(_WORD *)&v31[12] = 2048;
        *(double *)&v31[14] = v16;
        v17 = "[%{public}@]: Completed successfully in %0.3lfs.";
        goto LABEL_6;
      }
      break;
    case 1uLL:
      _HKInitializeLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v31 = 138543618;
        *(_QWORD *)&v31[4] = v14;
        *(_WORD *)&v31[12] = 2048;
        *(double *)&v31[14] = v16;
        v17 = "[%{public}@]: Requested wait after %0.3lfs.";
LABEL_6:
        _os_log_impl(&dword_210F9A000, v13, OS_LOG_TYPE_DEFAULT, v17, v31, 0x16u);
      }
      break;
    case 2uLL:
      _HKInitializeLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v31 = 138543874;
        *(_QWORD *)&v31[4] = v14;
        *(_WORD *)&v31[12] = 2048;
        *(double *)&v31[14] = v16;
        *(_WORD *)&v31[22] = 2114;
        v32 = v15;
        v18 = "[%{public}@]: Failed with an ignorable error after %0.3lfs: %{public}@";
        goto LABEL_23;
      }
      break;
    case 3uLL:
      _HKInitializeLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v31 = 138543874;
        *(_QWORD *)&v31[4] = v14;
        *(_WORD *)&v31[12] = 2048;
        *(double *)&v31[14] = v16;
        *(_WORD *)&v31[22] = 2114;
        v32 = v15;
        v18 = "[%{public}@]: Failed with an error after %0.3lfs and will be retried: %{public}@";
        goto LABEL_23;
      }
      break;
    case 4uLL:
      _HKInitializeLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v31 = 138543874;
        *(_QWORD *)&v31[4] = v14;
        *(_WORD *)&v31[12] = 2048;
        *(double *)&v31[14] = v16;
        *(_WORD *)&v31[22] = 2114;
        v32 = v15;
        v18 = "[%{public}@]: Failed with a deferrable error after %0.3lfs: %{public}@";
LABEL_23:
        _os_log_error_impl(&dword_210F9A000, v13, OS_LOG_TYPE_ERROR, v18, v31, 0x20u);
      }
      break;
    default:
      break;
  }

  _HKInitializeLogging();
  _HKLogPersistedSignposts();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_signpost_enabled(v19);

  if (v20)
  {
    _HKLogPersistedSignposts();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = *(_QWORD *)(a1 + 72);
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      HDStringFromXPCPeriodicActivityResult(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v31 = 138543618;
      *(_QWORD *)&v31[4] = v24;
      *(_WORD *)&v31[12] = 2114;
      *(_QWORD *)&v31[14] = v25;
      _os_signpost_emit_with_name_impl(&dword_210F9A000, v22, OS_SIGNPOST_INTERVAL_END, v23, "HDXPCPeriodicActivity", "name=%{public}@, result=%{public}@", v31, 0x16u);

    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v26 = *(_QWORD *)(a1 + 32);
  if (a2 == 1)
  {
    v27 = *(unsigned __int8 *)(v26 + 40);
    *(_QWORD *)(v26 + 32) = 3;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    if (v27)
      -[HDXPCPeriodicActivity _performCurrentActivityWithCompletion:](*(_QWORD *)(a1 + 32), &__block_literal_global_194);
  }
  else
  {
    v28 = *(void **)(v26 + 24);
    *(_QWORD *)(v26 + 24) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    v29 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(a1 + 64));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDXPCPeriodicActivity _lock_activityFinishedWithResult:minimumRetryInterval:activityStartDate:error:](v29, a2, v30, v15, a4);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    -[HDXPCPeriodicActivity _updateStateForFinishedActivity:result:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48), a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate", *(_OWORD *)v31, *(_QWORD *)&v31[16], v32);

}

- (void)_updateStateForFinishedActivity:(uint64_t)a3 result:
{
  id v5;
  void *v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id WeakRetained;
  char v12;
  id v13;
  int v14;
  id v15;
  char v16;
  id v17;
  char v18;

  v5 = a2;
  v6 = v5;
  if (a1 && v5)
  {
    switch(a3)
    {
      case 0:
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
        v12 = objc_msgSend(WeakRetained, "xpcActivity_setCompletionStatus:activity:", 0, v6);

        if ((v12 & 1) == 0)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
            -[HDXPCPeriodicActivity _updateStateForFinishedActivity:result:].cold.4();
        }
        break;
      case 1:
        _HKInitializeLogging();
        if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_FAULT))
          -[HDXPCPeriodicActivity _updateStateForFinishedActivity:result:].cold.3();
        break;
      case 2:
      case 3:
        v7 = objc_loadWeakRetained((id *)(a1 + 56));
        v8 = objc_msgSend(v7, "xpcActivity_setCompletionStatus:activity:", 3, v6);

        if ((v8 & 1) == 0)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
            goto LABEL_25;
        }
        break;
      case 4:
        v13 = objc_loadWeakRetained((id *)(a1 + 56));
        v14 = objc_msgSend(v13, "xpcActivity_shouldDefer:", v6);

        if (v14)
        {
          v15 = objc_loadWeakRetained((id *)(a1 + 56));
          v16 = objc_msgSend(v15, "xpcActivity_setState:activity:", 3, v6);

          if ((v16 & 1) == 0)
          {
            _HKInitializeLogging();
            if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
              -[HDXPCPeriodicActivity _updateStateForFinishedActivity:result:].cold.5();
          }
        }
        else
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
            -[HDXPCPeriodicActivity _updateStateForFinishedActivity:result:].cold.7();
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
          -[HDXPCPeriodicActivity _lock_incrementErrorCount](a1);
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
          v17 = objc_loadWeakRetained((id *)(a1 + 56));
          v18 = objc_msgSend(v17, "xpcActivity_setCompletionStatus:activity:", 1, v6);

          if ((v18 & 1) == 0)
          {
            _HKInitializeLogging();
            if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
              goto LABEL_25;
          }
        }
        break;
      default:
        _HKInitializeLogging();
        if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
          -[HDXPCPeriodicActivity _updateStateForFinishedActivity:result:].cold.2();
        v9 = objc_loadWeakRetained((id *)(a1 + 56));
        v10 = objc_msgSend(v9, "xpcActivity_setCompletionStatus:activity:", 0, v6);

        if ((v10 & 1) == 0)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
LABEL_25:
            -[HDXPCPeriodicActivity _updateStateForFinishedActivity:result:].cold.1();
        }
        break;
    }
  }

}

- (void)_lock_incrementErrorCount
{
  const os_unfair_lock *v2;
  void *v3;
  id v4;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v2 = -[HDXPCPeriodicActivity _lock_errorCount]((const os_unfair_lock *)a1);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    _HDXPCPeriodicActivityErrorCountUserDefaultsKey(*(void **)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInteger:forKey:", (char *)&v2->_os_unfair_lock_opaque + 1, v3);

  }
}

- (void)_lock_setLastSuccessfulRunDate:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      _HDXPCPeriodicActivityLastSuccessfulRunUserDefaultsKey(*(void **)(a1 + 64));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v7, v4);

    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _HDXPCPeriodicActivityErrorCountUserDefaultsKey(*(void **)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInteger:forKey:", 0, v6);

  }
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
  HDXPCPeriodicActivity *v4;
  HDXPCPeriodicActivity *v5;

  v5 = (HDXPCPeriodicActivity *)a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = v5;
  if (!v5)
    v4 = self;
  objc_storeWeak((id *)&self->_activityShim, v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)unitTest_reset
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDXPCPeriodicActivity _lock_setLastSuccessfulRunDate:]((uint64_t)self, 0);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HDXPCPeriodicActivityErrorCountUserDefaultsKey(self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", 0, v5);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HDXPCPeriodicActivityEarliestNextRunUserDefaultsKey(self->_name);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)unitTest_synthesizeActivityFireWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[HDXPCPeriodicActivity _lock_setLastSuccessfulRunDate:]((uint64_t)self, 0);
  self->_state = 1;
  os_unfair_lock_unlock(&self->_lock);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__HDXPCPeriodicActivity_unitTest_synthesizeActivityFireWithCompletion___block_invoke;
  v6[3] = &unk_24CB182F8;
  v7 = v4;
  v5 = v4;
  -[HDXPCPeriodicActivity _performCurrentActivityWithCompletion:]((uint64_t)self, v6);

}

uint64_t __71__HDXPCPeriodicActivity_unitTest_synthesizeActivityFireWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)name
{
  return self->_name;
}

- (OS_os_log)loggingCategory
{
  return self->_loggingCategory;
}

- (double)baseInterval
{
  return self->_baseInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_activityShim);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
}

void __82__HDXPCPeriodicActivity_registerDisabledPeriodicActivityWithName_loggingCategory___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_210F9A000, v0, v1, "[%{public}@]: Failed to set state as 'done' after firing while disabled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_activityFinishedWithResult:minimumRetryInterval:activityStartDate:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_210F9A000, v0, v1, "[%{public}@]: failed with a deferrable error: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_performActivity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_210F9A000, v0, v1, "[%{public}@]: Failed to set activity state during unexpected fire event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateStateForFinishedActivity:result:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_210F9A000, v0, v1, "[%{public}@]: Failed to finish activity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateStateForFinishedActivity:result:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_210F9A000, v0, v1, "[%{public}@]: Invalid activity result %ld; assuming done.");
  OUTLINED_FUNCTION_1();
}

- (void)_updateStateForFinishedActivity:result:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_210F9A000, v0, v1, "[%{public}@]: Attempting to finish activity, but client requested waiting.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateStateForFinishedActivity:result:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_210F9A000, v0, v1, "[%{public}@]: Failed to set completion status after activity finish", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateStateForFinishedActivity:result:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_210F9A000, v0, v1, "[%{public}@]: Failed to defer activity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateStateForFinishedActivity:result:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_210F9A000, v0, v1, "[%{public}@]: Activity completed requesting deferral, but should not be deferred", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
