@implementation AFWatchdogTimer

- (void)dealloc
{
  NSObject *timerSource;
  objc_super v4;

  timerSource = self->_timerSource;
  if (timerSource && self->_isStopped)
    dispatch_resume(timerSource);
  v4.receiver = self;
  v4.super_class = (Class)AFWatchdogTimer;
  -[AFWatchdogTimer dealloc](&v4, sel_dealloc);
}

- (AFWatchdogTimer)initWithTimeoutInterval:(double)a3 timeoutHandler:(id)a4
{
  void *v7;
  AFWatchdogTimer *v8;

  dispatch_get_global_queue(17, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](self, "initWithTimeoutInterval:onQueue:timeoutHandler:", v7, a4, a3);

  return v8;
}

- (AFWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 timeoutHandler:(id)a5
{
  id v10;
  id v11;
  AFWatchdogTimer *v12;
  AFWatchdogTimer *v13;
  uint64_t v14;
  id timeoutHandler;
  dispatch_source_t v16;
  OS_dispatch_source *timerSource;
  NSObject *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD handler[4];
  id v24;
  id v25;
  id location;
  objc_super v27;

  v10 = a4;
  v11 = a5;
  if (a3 >= 0.0)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFWatchdogTimer.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFWatchdogTimer.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeoutInterval >= 0"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFWatchdogTimer.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeoutHandler"));

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)AFWatchdogTimer;
  v12 = -[AFWatchdogTimer init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_interval = a3;
    v12->_remainingInterval = a3;
    objc_storeStrong((id *)&v12->_queue, a4);
    v14 = MEMORY[0x1A1AC0C3C](v11);
    timeoutHandler = v13->_timeoutHandler;
    v13->_timeoutHandler = (id)v14;

    v16 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v13->_queue);
    timerSource = v13->_timerSource;
    v13->_timerSource = (OS_dispatch_source *)v16;

    v13->_timerLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v13);
    v18 = v13->_timerSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __66__AFWatchdogTimer_initWithTimeoutInterval_onQueue_timeoutHandler___block_invoke;
    handler[3] = &unk_1E3A2FBF8;
    objc_copyWeak(&v25, &location);
    v24 = v11;
    dispatch_source_set_event_handler(v18, handler);
    v13->_isStopped = 1;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTimeoutInterval:onQueue:timeoutHandler:", self->_queue, self->_timeoutHandler, self->_interval);
}

- (void)start
{
  os_unfair_lock_s *p_timerLock;
  NSObject *timerSource;
  dispatch_time_t v5;
  void *v6;
  double v7;

  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  if (self->_isStopped)
  {
    timerSource = self->_timerSource;
    v5 = dispatch_time(0, (uint64_t)(self->_remainingInterval * 1000000000.0));
    dispatch_source_set_timer(timerSource, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_timerSource);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    self->_startTime = v7;

    self->_isStopped = 0;
  }
  os_unfair_lock_unlock(p_timerLock);
}

- (void)stop
{
  os_unfair_lock_s *p_timerLock;
  double v4;

  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  if (!self->_isStopped)
  {
    dispatch_suspend((dispatch_object_t)self->_timerSource);
    -[AFWatchdogTimer timeRemaining](self, "timeRemaining");
    self->_remainingInterval = v4;
    self->_isStopped = 1;
  }
  os_unfair_lock_unlock(p_timerLock);
}

- (BOOL)isStopped
{
  return self->_isStopped;
}

- (double)timeRemaining
{
  double result;
  void *v4;
  double v5;
  double v6;

  if (self->_isStopped)
    return self->_remainingInterval;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemUptime");
  v6 = v5 - self->_startTime;

  result = self->_interval - v6;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (void)cancel
{
  os_unfair_lock_s *p_timerLock;

  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  dispatch_source_cancel((dispatch_source_t)self->_timerSource);
  if (self->_isStopped)
  {
    dispatch_resume((dispatch_object_t)self->_timerSource);
    self->_isStopped = 0;
  }
  os_unfair_lock_unlock(p_timerLock);
}

- (BOOL)cancelIfNotAlreadyCanceled
{
  intptr_t v3;

  v3 = dispatch_source_testcancel((dispatch_source_t)self->_timerSource);
  if (!v3)
    -[AFWatchdogTimer cancel](self, "cancel");
  return v3 == 0;
}

- (void)reset
{
  -[AFWatchdogTimer stop](self, "stop");
  self->_remainingInterval = self->_interval;
  -[AFWatchdogTimer start](self, "start");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
}

uint64_t __66__AFWatchdogTimer_initWithTimeoutInterval_onQueue_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cancelIfNotAlreadyCanceled");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
