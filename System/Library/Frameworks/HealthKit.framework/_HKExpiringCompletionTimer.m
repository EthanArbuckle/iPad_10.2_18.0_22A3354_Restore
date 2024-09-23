@implementation _HKExpiringCompletionTimer

- (_HKExpiringCompletionTimer)initWithCompletion:(id)a3
{
  void *v5;
  _HKExpiringCompletionTimer *v6;

  dispatch_get_global_queue(0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_HKExpiringCompletionTimer initWithQueue:completion:](self, "initWithQueue:completion:", v5, a3);

  return v6;
}

- (_HKExpiringCompletionTimer)initWithQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  _HKExpiringCompletionTimer *v9;
  _HKExpiringCompletionTimer *v10;
  uint64_t v11;
  id completion;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HKExpiringCompletionTimer;
  v9 = -[_HKExpiringCompletionTimer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = objc_msgSend(v8, "copy");
    completion = v10->_completion;
    v10->_completion = (id)v11;

  }
  return v10;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKExpiringCompletionTimer.m"), 40, CFSTR("%@ must be invalidated before deallocation"), objc_opt_class());

  }
  -[_HKExpiringCompletionTimer _cancelTimer](self, "_cancelTimer");
  v5.receiver = self;
  v5.super_class = (Class)_HKExpiringCompletionTimer;
  -[_HKExpiringCompletionTimer dealloc](&v5, sel_dealloc);
}

- (void)_cancelTimer
{
  NSObject *timerSource;
  OS_dispatch_source *v4;

  timerSource = self->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel(timerSource);
    v4 = self->_timerSource;
    self->_timerSource = 0;

  }
}

- (BOOL)isExpired
{
  double v3;

  if (!self->_startDate)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return v3 > self->_expirationTime;
}

- (void)startWithTimeoutInterval:(double)a3 handler:(id)a4
{
  id v7;
  void *v8;
  id timeoutHandler;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v7 = a4;
  if (self->_invalidated)
  {
    v13 = v7;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKExpiringCompletionTimer.m"), 56, CFSTR("Cannot start an invalidated timer"));

    v7 = v13;
  }
  if (self->_startDate)
  {
    v14 = v7;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKExpiringCompletionTimer.m"), 57, CFSTR("Cannot start timer twice"));

    v7 = v14;
  }
  if (!self->_invalidated && !self->_startDate)
  {
    self->_timeout = a3;
    v12 = v7;
    v8 = (void *)objc_msgSend(v7, "copy");
    timeoutHandler = self->_timeoutHandler;
    self->_timeoutHandler = v8;

    -[_HKExpiringCompletionTimer _start](self, "_start");
    v7 = v12;
  }

}

- (void)restart
{
  void *v4;
  void *v5;

  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKExpiringCompletionTimer.m"), 69, CFSTR("Cannot restart an invalidated timer"));

  }
  if (!self->_timeoutHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKExpiringCompletionTimer.m"), 70, CFSTR("Cannot restart a timer with no timeout handler"));

  }
  if (!self->_invalidated)
  {
    if (self->_timeoutHandler)
    {
      -[_HKExpiringCompletionTimer _cancelTimer](self, "_cancelTimer");
      -[_HKExpiringCompletionTimer _start](self, "_start");
    }
  }
}

- (void)_start
{
  NSDate *v4;
  NSDate *startDate;
  double v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *timerSource;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD v12[6];

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  self->_startDate = v4;

  -[NSDate timeIntervalSinceReferenceDate](self->_startDate, "timeIntervalSinceReferenceDate");
  self->_expirationTime = v6 + self->_timeout;
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  timerSource = self->_timerSource;
  self->_timerSource = v7;

  v9 = self->_timerSource;
  v10 = dispatch_walltime(0, (uint64_t)(self->_timeout * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
  v11 = self->_timerSource;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36___HKExpiringCompletionTimer__start__block_invoke;
  v12[3] = &unk_1E37E8940;
  v12[4] = self;
  v12[5] = a2;
  dispatch_source_set_event_handler(v11, v12);
  dispatch_resume((dispatch_object_t)self->_timerSource);
}

- (void)invalidate
{
  -[_HKExpiringCompletionTimer _invalidateAndInvokeCompletion:error:](self, "_invalidateAndInvokeCompletion:error:", 0, 0);
}

- (void)invalidateAndInvokeCompletionWithError:(id)a3
{
  -[_HKExpiringCompletionTimer _invalidateAndInvokeCompletion:error:](self, "_invalidateAndInvokeCompletion:error:", 1, a3);
}

- (void)_invalidateAndInvokeCompletion:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  void (**v7)(void *, BOOL);
  id completion;
  id v9;

  v4 = a3;
  v6 = a4;
  if (!self->_invalidated)
  {
    v9 = v6;
    self->_invalidated = 1;
    -[_HKExpiringCompletionTimer _cancelTimer](self, "_cancelTimer");
    v7 = (void (**)(void *, BOOL))_Block_copy(self->_completion);
    completion = self->_completion;
    self->_completion = 0;

    if (v4)
      v7[2](v7, v9 == 0);

    v6 = v9;
  }

}

- (NSDate)startDate
{
  return self->_startDate;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
}

@end
