@implementation _HKDelayedOperation

- (void)execute
{
  -[_HKDelayedOperation executeWithDelay:](self, "executeWithDelay:", self->_delay);
}

- (_HKDelayedOperation)initWithQueue:(id)a3 delay:(double)a4 block:(id)a5
{
  return -[_HKDelayedOperation initWithMode:queue:delay:block:](self, "initWithMode:queue:delay:block:", 0, a3, a5, a4);
}

- (_HKDelayedOperation)initWithMode:(int64_t)a3 queue:(id)a4 delay:(double)a5 block:(id)a6
{
  return -[_HKDelayedOperation initWithMode:clock:queue:delay:block:](self, "initWithMode:clock:queue:delay:block:", a3, 0, a4, a6, a5);
}

- (_HKDelayedOperation)initWithMode:(int64_t)a3 clock:(int64_t)a4 queue:(id)a5 delay:(double)a6 block:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  dispatch_source_t v18;
  void *v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v13 = a5;
  v14 = a7;
  v25.receiver = self;
  v25.super_class = (Class)_HKDelayedOperation;
  v15 = -[_HKDelayedOperation init](&v25, sel_init);
  if (v15)
  {
    v16 = _Block_copy(v14);
    v17 = (void *)*((_QWORD *)v15 + 1);
    *((_QWORD *)v15 + 1) = v16;

    objc_storeStrong((id *)v15 + 2, a5);
    *((_QWORD *)v15 + 3) = a3;
    *((_QWORD *)v15 + 4) = a4;
    *((_QWORD *)v15 + 7) = 0;
    v18 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v15 + 2));
    v19 = (void *)*((_QWORD *)v15 + 5);
    *((_QWORD *)v15 + 5) = v18;

    *((double *)v15 + 6) = a6;
    objc_initWeak(&location, v15);
    v20 = *((_QWORD *)v15 + 5);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60___HKDelayedOperation_initWithMode_clock_queue_delay_block___block_invoke;
    v22[3] = &unk_1E37E85F0;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v20, v22);
    dispatch_resume(*((dispatch_object_t *)v15 + 5));
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return (_HKDelayedOperation *)v15;
}

- (void)executeWithDelay:(double)a3
{
  double lastExecution;
  double v7;
  double v8;
  double v9;
  double nextScheduledExecution;
  OS_os_log *v11;
  NSObject *v13;
  NSString *v14;
  int64_t clock;
  dispatch_time_t v16;
  NSObject *loggingCategory;
  NSString *loggingName;
  NSObject *queue;
  NSObject *v20;
  NSString *v21;
  double v22;
  void *v23;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_block)
  {
    lastExecution = _CurrentTimeForClock(self->_clock);
    v7 = lastExecution;
    if (!self->_mode)
      lastExecution = self->_lastExecution;
    v8 = lastExecution + a3;
    v9 = lastExecution + a3 - v7;
    if (v9 <= 0.0)
    {
      if (self->_loggingCategory)
      {
        _HKInitializeLogging();
        loggingCategory = self->_loggingCategory;
        if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_INFO))
        {
          loggingName = self->_loggingName;
          *(_DWORD *)buf = 138543362;
          v26 = loggingName;
          _os_log_impl(&dword_19A0E6000, loggingCategory, OS_LOG_TYPE_INFO, "Delayed operation %{public}@: Scheduling immediate execution.", buf, 0xCu);
        }
      }
      self->_nextScheduledExecution = v7;
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40___HKDelayedOperation_executeWithDelay___block_invoke;
      block[3] = &unk_1E37E6770;
      block[4] = self;
      dispatch_async(queue, block);
    }
    else
    {
      nextScheduledExecution = self->_nextScheduledExecution;
      v11 = self->_loggingCategory;
      if (nextScheduledExecution == 0.0 || v8 < nextScheduledExecution)
      {
        if (v11)
        {
          _HKInitializeLogging();
          v13 = self->_loggingCategory;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v14 = self->_loggingName;
            *(_DWORD *)buf = 138543618;
            v26 = v14;
            v27 = 2048;
            v28 = v9;
            _os_log_impl(&dword_19A0E6000, v13, OS_LOG_TYPE_INFO, "Delayed operation %{public}@: Scheduling execution in %lfs.", buf, 0x16u);
          }
        }
        self->_nextScheduledExecution = v8;
        if (!self->_timerSource)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKDelayedOperation.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_timerSource != nil"));

        }
        clock = self->_clock;
        if (clock == 1)
        {
          v16 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
        }
        else
        {
          if (clock)
            -[_HKDelayedOperation executeWithDelay:].cold.1(clock);
          v16 = dispatch_walltime(0, (uint64_t)(v9 * 1000000000.0));
        }
        dispatch_source_set_timer((dispatch_source_t)self->_timerSource, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      else if (v11)
      {
        _HKInitializeLogging();
        v20 = self->_loggingCategory;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v22 = self->_nextScheduledExecution;
          v21 = self->_loggingName;
          *(_DWORD *)buf = 138543874;
          v26 = v21;
          v27 = 2048;
          v28 = v8;
          v29 = 2048;
          v30 = v22;
          _os_log_impl(&dword_19A0E6000, v20, OS_LOG_TYPE_INFO, "Delayed operation %{public}@: Ignoring scheduling request (requested %lf > scheduled %lf).", buf, 0x20u);
        }
      }
    }
  }
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33___HKDelayedOperation_invalidate__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)enableLoggingWithName:(id)a3 category:(id)a4
{
  OS_os_log *v6;
  NSObject *queue;
  id v8;
  NSString *v9;
  NSString *loggingName;
  OS_os_log *loggingCategory;

  v6 = (OS_os_log *)a4;
  queue = self->_queue;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  v9 = (NSString *)objc_msgSend(v8, "copy");

  loggingName = self->_loggingName;
  self->_loggingName = v9;

  loggingCategory = self->_loggingCategory;
  self->_loggingCategory = v6;

}

- (void)disableLogging
{
  OS_os_log *loggingCategory;
  NSString *loggingName;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  loggingCategory = self->_loggingCategory;
  self->_loggingCategory = 0;

  loggingName = self->_loggingName;
  self->_loggingName = 0;

}

- (void)_queue_executeBlockIfScheduled
{
  double v3;
  double lastExecution;
  double nextScheduledExecution;
  NSObject *loggingCategory;
  NSString *loggingName;
  void (**block)(void);
  int v9;
  NSString *v10;
  __int16 v11;
  double v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_nextScheduledExecution > 0.0)
  {
    v3 = _CurrentTimeForClock(self->_clock);
    if (self->_loggingCategory)
    {
      lastExecution = self->_lastExecution;
      nextScheduledExecution = self->_nextScheduledExecution;
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_INFO))
      {
        loggingName = self->_loggingName;
        v9 = 138543874;
        v10 = loggingName;
        v11 = 2048;
        v12 = v3 - lastExecution;
        v13 = 2048;
        v14 = v3 - nextScheduledExecution;
        _os_log_impl(&dword_19A0E6000, loggingCategory, OS_LOG_TYPE_INFO, "Delayed operation %{public}@: Executing after %lfs (slipped %lfs).", (uint8_t *)&v9, 0x20u);
      }
    }
    self->_lastExecution = v3;
    self->_nextScheduledExecution = 0.0;
    block = (void (**)(void))self->_block;
    if (block)
      block[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_loggingName, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
}

- (void)executeWithDelay:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "dispatch_time_t _HKDispatchTimeForDelayAndClock(NSTimeInterval, _HKDelayedOperationClock)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_HKDelayedOperation.m"), 24, CFSTR("Invalid clock value for delayed operation: %ld"), a1);

  __break(1u);
}

@end
