@implementation BSLHWatchdogTimer

- (BSLHWatchdogTimer)initWithExplanation:(id)a3 delegate:(id)a4 provider:(id)a5
{
  id v8;
  id v9;
  id v10;
  BSLHWatchdogTimer *v11;
  uint64_t v12;
  NSString *explanation;
  uint64_t v14;
  BSAbsoluteMachTimer *timer;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BSLHWatchdogTimer;
  v11 = -[BSLHWatchdogTimer init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    explanation = v11->_explanation;
    v11->_explanation = (NSString *)v12;

    objc_storeWeak((id *)&v11->_delegate, v9);
    objc_storeStrong((id *)&v11->_provider, a5);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE0BD78]), "initWithIdentifier:", v8);
    timer = v11->_timer;
    v11->_timer = (BSAbsoluteMachTimer *)v14;

    v11->_lock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

- (void)dealloc
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (NSString)description
{
  void *v3;
  id v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_lock_invalidated, CFSTR("invalidated"), 1);
  objc_msgSend(v3, "appendString:withName:", self->_explanation, CFSTR("explanation"));
  if (self->_lock_invalidated)
  {
    if (self->_lock_invalidationReason == 1)
      v5 = CFSTR("replaced");
    else
      v5 = CFSTR("completed");
    objc_msgSend(v3, "appendString:withName:", v5, CFSTR("invalidationReason"));
  }
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)scheduleWithTimeout:(double)a3
{
  os_unfair_lock_s *p_lock;
  double v7;
  id WeakRetained;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  BSAbsoluteMachTimer *timer;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_lock_invalidated"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BSLHWatchdogTimer scheduleWithTimeout:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    self->_lock_timeout = a3;
    BSContinuousMachTimeNow();
    self->_lock_watchdogStart = v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "osInterfaceProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemSleepMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSleepImminent");

    if (v11)
    {
      self->_lock_sleepImminentSinceScheduled = 1;
      objc_msgSend(WeakRetained, "osInterfaceProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "systemSleepMonitor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:", self);

    }
    os_unfair_lock_unlock(p_lock);
    objc_initWeak(&location, self);
    timer = self->_timer;
    v15 = MEMORY[0x24BDAC9B8];
    v16 = MEMORY[0x24BDAC9B8];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __41__BSLHWatchdogTimer_scheduleWithTimeout___block_invoke;
    v18[3] = &unk_24D1BD628;
    objc_copyWeak(&v19, &location);
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](timer, "scheduleWithFireInterval:leewayInterval:queue:handler:", v15, v18, a3, 1.0);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

void __41__BSLHWatchdogTimer_scheduleWithTimeout___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "invalidate");

  objc_msgSend(WeakRetained, "timerFired");
}

- (void)timerFired
{
  os_unfair_lock_s *p_lock;
  double lock_timeout;
  double v5;
  double v6;
  double lock_watchdogStart;
  _BOOL4 lock_invalidated;
  BLSHWatchdogProvider *provider;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_timeout = self->_lock_timeout;
  BSContinuousMachTimeNow();
  v6 = v5;
  lock_watchdogStart = self->_lock_watchdogStart;
  lock_invalidated = self->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  if (!lock_invalidated)
  {
    provider = self->_provider;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[BLSHWatchdogProvider fireWatchdogWithTimer:delegate:timeout:elapsedTime:](provider, "fireWatchdogWithTimer:delegate:timeout:elapsedTime:", self, WeakRetained, lock_timeout, v6 - lock_watchdogStart);

  }
}

- (void)invalidate:(unint64_t)a3
{
  double lock_timeout;
  double v6;
  double v7;

  -[BSAbsoluteMachTimer invalidate](self->_timer, "invalidate");
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  self->_lock_invalidationReason = a3;
  lock_timeout = self->_lock_timeout;
  BSContinuousMachTimeNow();
  v7 = v6 - self->_lock_watchdogStart;
  os_unfair_lock_unlock(&self->_lock);
  -[BSLHWatchdogTimer setSleepImminentSinceScheduled:](self, "setSleepImminentSinceScheduled:", 0);
  -[BLSHWatchdogProvider clearWatchdogWithExplanation:reason:timeout:elapsedTime:](self->_provider, "clearWatchdogWithExplanation:reason:timeout:elapsedTime:", self->_explanation, a3, lock_timeout, v7);
}

- (BOOL)isInvalidated
{
  BSLHWatchdogTimer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)invalidationReason
{
  os_unfair_lock_s *p_lock;
  unint64_t lock_invalidationReason;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_invalidationReason = self->_lock_invalidationReason;
  os_unfair_lock_unlock(p_lock);
  return lock_invalidationReason;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (BOOL)hasSleepBeenImminentSinceScheduled
{
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_sleepImminentSinceScheduled;
  id WeakRetained;
  void *v6;
  void *v7;
  char v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_sleepImminentSinceScheduled = self->_lock_sleepImminentSinceScheduled;
  os_unfair_lock_unlock(p_lock);
  if (!lock_sleepImminentSinceScheduled)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "osInterfaceProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemSleepMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSleepImminent");

  return v8;
}

- (void)setSleepImminentSinceScheduled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_sleepImminentSinceScheduled;
  void *v7;
  void *v8;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_sleepImminentSinceScheduled = self->_lock_sleepImminentSinceScheduled;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  self->_lock_sleepImminentSinceScheduled = a3;
  os_unfair_lock_unlock(p_lock);
  if (lock_sleepImminentSinceScheduled && !a3)
  {
    objc_msgSend(WeakRetained, "osInterfaceProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemSleepMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", self);

  }
}

- (void)systemSleepMonitorSleepRequestAborted:(id)a3
{
  -[BSLHWatchdogTimer setSleepImminentSinceScheduled:](self, "setSleepImminentSinceScheduled:", 0);
}

- (void)systemSleepMonitorWillWakeFromSleep:(id)a3
{
  -[BSLHWatchdogTimer setSleepImminentSinceScheduled:](self, "setSleepImminentSinceScheduled:", 0);
}

- (void)systemSleepMonitorDidWakeFromSleep:(id)a3
{
  -[BSLHWatchdogTimer setSleepImminentSinceScheduled:](self, "setSleepImminentSinceScheduled:", 0);
}

- (BOOL)wasSleepImminentWhenScheduled
{
  return self->_sleepImminentWhenScheduled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)scheduleWithTimeout:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
