@implementation HKAsynchronousOperation

- (HKAsynchronousOperation)init
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

- (HKAsynchronousOperation)initWithName:(id)a3 operationBlock:(id)a4
{
  id v6;
  id v7;
  HKAsynchronousOperation *v8;
  HKAsynchronousOperation *v9;
  uint64_t v10;
  id operationBlock;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKAsynchronousOperation;
  v8 = -[HKAsynchronousOperation init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HKAsynchronousOperation setName:](v8, "setName:", v6);
    v10 = objc_msgSend(v7, "copy");
    operationBlock = v9->_operationBlock;
    v9->_operationBlock = (id)v10;

    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_finished = 0;
    v9->_executing = 0;
    -[HKAsynchronousOperation _isExecutingKeyPath](v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAsynchronousOperation addObserver:forKeyPath:options:context:](v9, "addObserver:forKeyPath:options:context:", v9, v12, 3, HKAsynchronousOperationSelfObservingContext);

  }
  return v9;
}

- (id)_isExecutingKeyPath
{
  if (a1)
  {
    NSStringFromSelector(sel_isExecuting);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HKAsynchronousOperation _isExecutingKeyPath](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAsynchronousOperation removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, v3, HKAsynchronousOperationSelfObservingContext);

  v4.receiver = self;
  v4.super_class = (Class)HKAsynchronousOperation;
  -[HKAsynchronousOperation dealloc](&v4, sel_dealloc);
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  void *v3;
  void *v4;
  _QWORD *operationBlock;
  void (*v6)(_QWORD *, _QWORD *);
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  -[HKAsynchronousOperation _isExecutingKeyPath](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAsynchronousOperation _isFinishedKeyPath](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", v3);
  -[HKAsynchronousOperation setExecuting:](self, "setExecuting:", 1);
  -[HKAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", v3);
  operationBlock = self->_operationBlock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__HKAsynchronousOperation_start__block_invoke;
  v9[3] = &unk_1E37E6738;
  v9[4] = self;
  v10 = v3;
  v11 = v4;
  v6 = (void (*)(_QWORD *, _QWORD *))operationBlock[2];
  v7 = v4;
  v8 = v3;
  v6(operationBlock, v9);

}

- (id)_isFinishedKeyPath
{
  if (a1)
  {
    NSStringFromSelector(sel_isFinished);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t __32__HKAsynchronousOperation_start__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", *(_QWORD *)(a1 + 48));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 260));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 257) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 260));
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isExecuting
{
  HKAsynchronousOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_executing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setExecuting:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_executing = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isFinished
{
  HKAsynchronousOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFinished:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_finished = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  objc_super v17;

  if ((void *)HKAsynchronousOperationSelfObservingContext == a6)
  {
    v11 = *MEMORY[0x1E0CB2CC8];
    v12 = a5;
    objc_msgSend(v12, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "BOOLValue");
    if (v14 != v16)
    {
      if (v16)
        -[HKAsynchronousOperation _operationDidStart]((CFAbsoluteTime *)self);
      else
        -[HKAsynchronousOperation _operationDidFinish]((double *)self);
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HKAsynchronousOperation;
    v10 = a5;
    -[HKAsynchronousOperation observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);

  }
}

- (void)_operationDidStart
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  CFAbsoluteTime *v11;
  int v12;
  CFAbsoluteTime *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _HKLogPersistedSignposts();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_signpost_id_make_with_pointer(v2, a1);

    _HKInitializeLogging();
    HKLogInfrastructure();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (v5)
    {
      HKLogInfrastructure();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v12 = 138543362;
        v13 = a1;
        _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_INFO, "%{public}@: Started.", (uint8_t *)&v12, 0xCu);
      }

    }
    _HKInitializeLogging();
    _HKLogPersistedSignposts();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_enabled(v7);

    if (v8)
    {
      _HKLogPersistedSignposts();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        -[CFAbsoluteTime name](a1, "name");
        v11 = (CFAbsoluteTime *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_signpost_emit_with_name_impl(&dword_19A0E6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v3, "HKAsynchronousOperation", "name=%{public}@", (uint8_t *)&v12, 0xCu);

      }
    }
    a1[33] = CFAbsoluteTimeGetCurrent();
  }
}

- (void)_operationDidFinish
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  CFAbsoluteTime v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  double *v12;
  int v13;
  double *v14;
  __int16 v15;
  CFAbsoluteTime v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _HKLogPersistedSignposts();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_signpost_id_make_with_pointer(v2, a1);

    _HKInitializeLogging();
    HKLogInfrastructure();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (v5)
    {
      HKLogInfrastructure();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = CFAbsoluteTimeGetCurrent() - a1[33];
        v13 = 138543618;
        v14 = a1;
        v15 = 2048;
        v16 = v7;
        _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_INFO, "%{public}@: Stopped after %0.3lfs.", (uint8_t *)&v13, 0x16u);
      }

    }
    _HKInitializeLogging();
    _HKLogPersistedSignposts();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_enabled(v8);

    if (v9)
    {
      _HKLogPersistedSignposts();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        objc_msgSend(a1, "name");
        v12 = (double *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v12;
        _os_signpost_emit_with_name_impl(&dword_19A0E6000, v11, OS_SIGNPOST_INTERVAL_END, v3, "HKAsynchronousOperation", "name=%{public}@", (uint8_t *)&v13, 0xCu);

      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_operationBlock, 0);
}

@end
