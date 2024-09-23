@implementation HDMaintenanceOperation

- (HDMaintenanceOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDMaintenanceOperation)initWithName:(id)a3
{
  id v4;
  HDMaintenanceOperation *v5;
  HDMaintenanceOperation *v6;
  uint64_t v7;
  NSString *name;
  id canceledBlock;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDMaintenanceOperation;
  v5 = -[HDMaintenanceOperation init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "copy");
    name = v6->_name;
    v6->_name = (NSString *)v7;

    v6->_timeout = 900.0;
    *(_WORD *)&v6->_faultOnTimeout = 1;
    canceledBlock = v6->_canceledBlock;
    v6->_canceledBlock = 0;

  }
  return v6;
}

+ (id)maintenanceOperationWithName:(id)a3 asynchronousBlock:(id)a4
{
  return (id)objc_msgSend(a1, "maintenanceOperationWithName:asynchronousBlock:canceledBlock:", a3, a4, 0);
}

+ (id)maintenanceOperationWithName:(id)a3 asynchronousBlock:(id)a4 canceledBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  _HDMaintenanceWorkCoordinatorAsynchronousOperation *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_HDMaintenanceWorkCoordinatorAsynchronousOperation initWithName:operationBlock:canceledBlock:]([_HDMaintenanceWorkCoordinatorAsynchronousOperation alloc], "initWithName:operationBlock:canceledBlock:", v9, v8, v7);

  return v10;
}

+ (id)maintenanceOperationWithName:(id)a3 queue:(id)a4 synchronousBlock:(id)a5
{
  return (id)objc_msgSend(a1, "maintenanceOperationWithName:queue:synchronousBlock:canceledBlock:", a3, a4, a5, 0);
}

+ (id)maintenanceOperationWithName:(id)a3 queue:(id)a4 synchronousBlock:(id)a5 canceledBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _HDMaintenanceWorkCoordinatorSynchronousOperation *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[_HDMaintenanceWorkCoordinatorSynchronousOperation initWithName:queue:block:canceledBlock:]([_HDMaintenanceWorkCoordinatorSynchronousOperation alloc], "initWithName:queue:block:canceledBlock:", v12, v11, v10, v9);

  return v13;
}

+ (id)maintenanceOperationWithName:(id)a3 database:(id)a4 asynchronousBlock:(id)a5
{
  return (id)objc_msgSend(a1, "maintenanceOperationWithName:database:asynchronousBlock:canceledBlock:", a3, a4, a5, 0);
}

+ (id)maintenanceOperationWithName:(id)a3 database:(id)a4 asynchronousBlock:(id)a5 canceledBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _HDMaintenanceWorkCoordinatorProtectedDatabaseOperation *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation initWithName:database:operationBlock:canceledBlock:]([_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation alloc], "initWithName:database:operationBlock:canceledBlock:", v12, v11, v10, v9);

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void)startWithCompletionDelegate:(id)a3 fromImmediateRequest:(BOOL)a4
{
  id v6;
  double Current;
  double v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  const __CFString *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  HDMaintenanceOperation *v17;
  int v18;
  HDMaintenanceOperation *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_hasStarted)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_isImmediateRequest = a4;
    self->_hasStarted = 1;
    objc_storeWeak((id *)&self->_delegate, v6);
    Current = CFAbsoluteTimeGetCurrent();
    v8 = Current + self->_timeout;
    self->_startedTime = Current;
    self->_timeoutTime = v8;
    os_unfair_lock_unlock(&self->_lock);
    _HKLogPersistedSignposts();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_make_with_pointer(v9, self);

    _HKInitializeLogging();
    HKLogInfrastructure();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR(" Immediately");
      if (!self->_isImmediateRequest)
        v12 = &stru_1E6D11BB8;
      v18 = 138543618;
      v19 = self;
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Started%{public}@.", (uint8_t *)&v18, 0x16u);
    }

    _HKInitializeLogging();
    _HKLogPersistedSignposts();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_enabled(v13);

    if (v14)
    {
      _HKLogPersistedSignposts();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        -[HDMaintenanceOperation name](self, "name");
        v17 = (HDMaintenanceOperation *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v17;
        _os_signpost_emit_with_name_impl(&dword_1B7802000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v10, "maintenance work operation", "name=%{public}@", (uint8_t *)&v18, 0xCu);

      }
    }
    -[HDMaintenanceOperation main](self, "main");
  }

}

- (void)cancel
{
  (*((void (**)(void))self->_canceledBlock + 2))();
  -[HDMaintenanceOperation finish]((uint64_t)self);
}

- (void)finish
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  CFAbsoluteTime v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  int v12;
  uint64_t v13;
  __int16 v14;
  CFAbsoluteTime v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _HKLogPersistedSignposts();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_signpost_id_make_with_pointer(v2, (const void *)a1);

    _HKInitializeLogging();
    HKLogInfrastructure();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 16);
      v12 = 138543618;
      v13 = a1;
      v14 = 2048;
      v15 = v5;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopped after %0.3lfs.", (uint8_t *)&v12, 0x16u);
    }

    _HKInitializeLogging();
    _HKLogPersistedSignposts();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_enabled(v6);

    if (v7)
    {
      _HKLogPersistedSignposts();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        objc_msgSend((id)a1, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = (uint64_t)v10;
        _os_signpost_emit_with_name_impl(&dword_1B7802000, v9, OS_SIGNPOST_INTERVAL_END, v3, "maintenance work operation", "name=%{public}@", (uint8_t *)&v12, 0xCu);

      }
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    *(_BYTE *)(a1 + 49) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_storeWeak((id *)(a1 + 40), 0);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    objc_msgSend(WeakRetained, "operationDidFinish:", a1);

  }
}

- (double)timeoutTime
{
  os_unfair_lock_s *p_lock;
  double timeoutTime;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_hasStarted)
    timeoutTime = self->_timeoutTime;
  else
    timeoutTime = CFAbsoluteTimeGetCurrent() + self->_timeout;
  os_unfair_lock_unlock(p_lock);
  return timeoutTime;
}

- (double)elapsedTime
{
  os_unfair_lock_s *p_lock;
  double v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_hasStarted)
    v4 = CFAbsoluteTimeGetCurrent() - self->_startedTime;
  else
    v4 = 0.0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  const __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double enqueuedTime;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isImmediateRequest)
    v4 = CFSTR(" (Immediate)");
  else
    v4 = &stru_1E6D11BB8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), self->_name, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_hasFinished)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@ finished>"), objc_opt_class(), self, v5, v13, v14);
  }
  else if (self->_hasStarted)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = objc_opt_class();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@:%p %@ running for %0.3lfs/%0.3lfs>"), v7, self, v5, CFAbsoluteTimeGetCurrent() - self->_startedTime, *(_QWORD *)&self->_timeout);
  }
  else
  {
    enqueuedTime = self->_enqueuedTime;
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_opt_class();
    if (enqueuedTime <= 0.0)
      objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@:%p %@ not enqueued>"), v10, self, v5, v13, v14);
    else
      objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@:%p %@ pending for %0.3lfs>"), v10, self, v5, CFAbsoluteTimeGetCurrent() - self->_enqueuedTime, v14);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (BOOL)faultOnTimeout
{
  return self->_faultOnTimeout;
}

- (void)setFaultOnTimeout:(BOOL)a3
{
  self->_faultOnTimeout = a3;
}

- (BOOL)isImmediateRequest
{
  return self->_isImmediateRequest;
}

- (double)enqueuedTime
{
  return self->_enqueuedTime;
}

- (void)setEnqueuedTime:(double)a3
{
  self->_enqueuedTime = a3;
}

- (id)canceledBlock
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setCanceledBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_canceledBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
