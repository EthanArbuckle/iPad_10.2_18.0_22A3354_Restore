@implementation VSDelayOperation

+ (VSDelayOperation)delayOperationWithDelay:(double)a3
{
  return -[VSDelayOperation initWithDelay:tolerance:]([VSDelayOperation alloc], "initWithDelay:tolerance:", a3, a3 / 10.0);
}

+ (VSDelayOperation)delayOperationWithFireDate:(id)a3
{
  id v3;
  VSDelayOperation *v4;

  v3 = a3;
  v4 = -[VSDelayOperation initWithFireDate:tolerance:]([VSDelayOperation alloc], "initWithFireDate:tolerance:", v3, 0.0);

  -[VSDelayOperation setShouldIgnoreTolerance:](v4, "setShouldIgnoreTolerance:", 1);
  return v4;
}

- (VSDelayOperation)initWithDelay:(double)a3 tolerance:(double)a4
{
  VSDelayOperation *result;
  objc_super v8;

  if (a3 <= 0.0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The delay argument must be greater than zero."));
  v8.receiver = self;
  v8.super_class = (Class)VSDelayOperation;
  result = -[VSDelayOperation init](&v8, sel_init);
  if (result)
  {
    result->_delay = a3;
    result->_tolerance = a4;
  }
  return result;
}

- (VSDelayOperation)initWithFireDate:(id)a3 tolerance:(double)a4
{
  id v6;
  VSDelayOperation *v7;
  uint64_t v8;
  NSDate *fireDate;
  objc_super v11;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The fireDate parameter must not be nil."));
  v11.receiver = self;
  v11.super_class = (Class)VSDelayOperation;
  v7 = -[VSDelayOperation init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    fireDate = v7->_fireDate;
    v7->_fireDate = (NSDate *)v8;

    v7->_tolerance = a4;
  }

  return v7;
}

- (VSDelayOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[VSDelayOperation _cancelTimer](self, "_cancelTimer");
  v3.receiver = self;
  v3.super_class = (Class)VSDelayOperation;
  -[VSDelayOperation dealloc](&v3, sel_dealloc);
}

- (void)_cancelTimer
{
  NSObject *timerSource;

  timerSource = self->_timerSource;
  if (timerSource)
    dispatch_source_cancel(timerSource);
}

- (void)executionDidBegin
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  dispatch_time_t v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD handler[4];
  id v19;
  id location;
  uint8_t buf[4];
  VSDelayOperation *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.VSDelayOperation.%p"), self);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __37__VSDelayOperation_executionDidBegin__block_invoke;
  handler[3] = &unk_1E939FD70;
  objc_copyWeak(&v19, &location);
  dispatch_source_set_event_handler(v5, handler);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __37__VSDelayOperation_executionDidBegin__block_invoke_12;
  v16[3] = &unk_1E939FD70;
  objc_copyWeak(&v17, &location);
  dispatch_source_set_cancel_handler(v5, v16);
  -[VSDelayOperation delay](self, "delay");
  v8 = v7;
  -[VSDelayOperation tolerance](self, "tolerance");
  v10 = v9;
  -[VSDelayOperation fireDate](self, "fireDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "timeIntervalSinceNow");
    v8 = v13;
    if (-[VSDelayOperation shouldIgnoreTolerance](self, "shouldIgnoreTolerance"))
      v10 = v8 / 10.0;
  }
  if (v8 <= 9223372040.0)
    v14 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  else
    v14 = -1;
  dispatch_source_set_timer(v5, v14, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(v10 * 1000000000.0));
  VSDefaultLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = self;
    _os_log_impl(&dword_1D2419000, v15, OS_LOG_TYPE_DEFAULT, "Delay operation timer will begin %@", buf, 0xCu);
  }

  dispatch_resume(v5);
  objc_storeStrong((id *)&self->_timerSource, v5);
  if (-[VSDelayOperation isCancelled](self, "isCancelled"))
    -[VSDelayOperation _cancelTimer](self, "_cancelTimer");

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __37__VSDelayOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    VSDefaultLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = WeakRetained;
      _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Delay operation timer did fire %@", (uint8_t *)&v3, 0xCu);
    }

    objc_msgSend(WeakRetained, "finishExecutionIfPossible");
  }

}

void __37__VSDelayOperation_executionDidBegin__block_invoke_12(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    VSDefaultLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = WeakRetained;
      _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Delay operation timer cancelled %@", (uint8_t *)&v3, 0xCu);
    }

    objc_msgSend(WeakRetained, "finishExecutionIfPossible");
  }

}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSDelayOperation;
  -[VSAsyncOperation cancel](&v3, sel_cancel);
  -[VSDelayOperation _cancelTimer](self, "_cancelTimer");
}

- (double)delay
{
  return self->_delay;
}

- (double)tolerance
{
  return self->_tolerance;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (BOOL)shouldIgnoreTolerance
{
  return self->_shouldIgnoreTolerance;
}

- (void)setShouldIgnoreTolerance:(BOOL)a3
{
  self->_shouldIgnoreTolerance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
}

@end
