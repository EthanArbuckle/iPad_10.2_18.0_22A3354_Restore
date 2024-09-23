@implementation BLSHBacklightIdleProvider

+ (id)createSharedProviderWithLocalAssertionService:(id)a3
{
  id v4;
  id v5;
  BLSHUserIdleProvider *v6;
  void *v7;
  void *v8;
  id result;
  void *v10;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_0);
  if (_sharedProvider_0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[BLSHBacklightIdleProvider createSharedProviderWithLocalAssertionService:] should not be called twice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[BLSHBacklightIdleProvider createSharedProviderWithLocalAssertionService:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v5 = objc_alloc((Class)a1);
    v6 = objc_alloc_init(BLSHUserIdleProvider);
    +[BLSHBacklightHost sharedBacklightHost](BLSHBacklightHost, "sharedBacklightHost");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithLocalAssertionService:idleProvider:backlightHost:", v4, v6, v7);

    objc_storeStrong((id *)&_sharedProvider_0, v8);
    os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_0);

    return v8;
  }
  return result;
}

+ (id)sharedProvider
{
  id v2;
  id result;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_0);
  v2 = (id)_sharedProvider_0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_0);
  if (v2)
    return v2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[BLSHBacklightIdleProvider sharedProvider] should not be called before createSharedProviderWithLocalAssertionService:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[BLSHBacklightIdleProvider sharedProvider].cold.1();
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BLSHBacklightIdleProvider)initWithLocalAssertionService:(id)a3 idleProvider:(id)a4 backlightHost:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLSHBacklightIdleProvider *v11;
  BLSHBacklightIdleProvider *v12;
  id v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLSHBacklightIdleProvider;
  v11 = -[BLSHBacklightIdleProvider init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v11->_lock_idleProvider, a4);
    objc_msgSend(v9, "setDelegate:", v12);
    v12->_lock_active = 1;
    objc_storeStrong((id *)&v12->_backlightHost, a5);
    objc_msgSend(v10, "addObserver:", v12);
    -[BLSHBacklightIdleProvider updateForBacklightState:]((uint64_t)v12, objc_msgSend(v10, "backlightState"));
    if (v8)
      v13 = +[BLSHPreventBacklightIdleAttributeHandler registerHandlerForService:provider:](BLSHPreventBacklightIdleAttributeHandler, "registerHandlerForService:provider:", v8, v12);
  }

  return v12;
}

- (void)updateForBacklightState:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  int v5;
  char v6;
  double v7;
  int v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v5 = *(unsigned __int8 *)(a1 + 56);
    if (*(_BYTE *)(a1 + 56))
    {
      if (a2 == 2)
      {
        v6 = 0;
        *(_BYTE *)(a1 + 63) = 0;
      }
      else
      {
        v6 = 1;
      }
      *(_BYTE *)(a1 + 60) = v6;
    }
    if (*(_BYTE *)(a1 + 63) || (v7 = *(double *)(a1 + 40), fabs(v7) < 2.22044605e-16))
      v7 = *(double *)(a1 + 32);
    v8 = *(unsigned __int8 *)(a1 + 58);
    v11 = *(id *)(a1 + 8);
    os_unfair_lock_unlock(v4);
    if (v5)
    {
      v9 = a2 == 2;
      objc_msgSend(v11, "setShouldNotifyOfUnidle:", v9);
      objc_msgSend(v11, "setIdleTimeout:shouldReset:", 1, v7);
      if (v8)
        v10 = 0;
      else
        v10 = v9;
      objc_msgSend((id)a1, "setActive:", v10);
    }

  }
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

- (void)start
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

- (void)signalUserActivityOccurred
{
  os_unfair_lock_s *p_lock;
  double lock_idleTimeout;
  BLSHUserIdleProviding *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_userActivityOccured = 1;
  lock_idleTimeout = self->_lock_idleTimeout;
  v5 = self->_lock_idleProvider;
  os_unfair_lock_unlock(p_lock);
  -[BLSHUserIdleProviding setIdleTimeout:shouldReset:](v5, "setIdleTimeout:shouldReset:", 1, lock_idleTimeout);

}

- (void)reset
{
  os_unfair_lock_s *p_lock;
  double lock_nonInteractiveIdleTimeout;
  BLSHUserIdleProviding *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_nonInteractiveIdleTimeout = self->_lock_nonInteractiveIdleTimeout;
  self->_lock_userActivityOccured = 0;
  v5 = self->_lock_idleProvider;
  os_unfair_lock_unlock(p_lock);
  -[BLSHUserIdleProviding setShouldNotifyOfUnidle:](v5, "setShouldNotifyOfUnidle:", 1);
  -[BLSHUserIdleProviding setIdleTimeout:shouldReset:](v5, "setIdleTimeout:shouldReset:", 1, lock_nonInteractiveIdleTimeout);

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  BLSHUserIdleProviding *lock_idleProvider;
  BLSHUserIdleProviding *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  lock_idleProvider = self->_lock_idleProvider;
  self->_lock_idleProvider = 0;
  v5 = lock_idleProvider;

  os_unfair_lock_unlock(p_lock);
  -[BLSHUserIdleProviding invalidate](v5, "invalidate");

}

- (double)idleTimeout
{
  os_unfair_lock_s *p_lock;
  double lock_idleTimeout;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_idleTimeout = self->_lock_idleTimeout;
  os_unfair_lock_unlock(p_lock);
  return lock_idleTimeout;
}

- (void)setIdleTimeout:(double)a3
{
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_userActivityOccured;
  BLSHUserIdleProviding *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_idleTimeout = a3;
  lock_userActivityOccured = self->_lock_userActivityOccured;
  v7 = self->_lock_idleProvider;
  os_unfair_lock_unlock(p_lock);
  if (lock_userActivityOccured)
    -[BLSHUserIdleProviding setIdleTimeout:shouldReset:](v7, "setIdleTimeout:shouldReset:", 0, a3);

}

- (double)nonInteractiveIdleTimeout
{
  os_unfair_lock_s *p_lock;
  double lock_nonInteractiveIdleTimeout;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_nonInteractiveIdleTimeout = self->_lock_nonInteractiveIdleTimeout;
  os_unfair_lock_unlock(p_lock);
  return lock_nonInteractiveIdleTimeout;
}

- (void)setNonInteractiveIdleTimeout:(double)a3
{
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_userActivityOccured;
  BLSHUserIdleProviding *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_nonInteractiveIdleTimeout = a3;
  lock_userActivityOccured = self->_lock_userActivityOccured;
  v7 = self->_lock_idleProvider;
  os_unfair_lock_unlock(p_lock);
  if (!lock_userActivityOccured)
    -[BLSHUserIdleProviding setIdleTimeout:shouldReset:](v7, "setIdleTimeout:shouldReset:", 0, a3);

}

- (BOOL)isActive
{
  BLSHBacklightIdleProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_active;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setActive:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_active;
  _BOOL4 lock_started;
  BLSHUserIdleProviding *v9;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_active = self->_lock_active;
  self->_lock_active = v3;
  lock_started = self->_lock_started;
  v9 = self->_lock_idleProvider;
  os_unfair_lock_unlock(p_lock);
  if (lock_active != v3 && lock_started)
  {
    if (v3)
      -[BLSHUserIdleProviding resume](v9, "resume");
    else
      -[BLSHUserIdleProviding pause](v9, "pause");
  }

}

- (BOOL)isIdle
{
  BLSHBacklightIdleProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_idle;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)hasUserActivityOccured
{
  BLSHBacklightIdleProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_userActivityOccured;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSuspended:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_suspended;
  _BOOL4 lock_started;
  NSObject *v8;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_suspended = self->_lock_suspended;
  self->_lock_suspended = v3;
  lock_started = self->_lock_started;
  os_unfair_lock_unlock(p_lock);
  bls_backlight_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[BLSHBacklightIdleProvider setSuspended:].cold.1();

  if (lock_suspended != v3 && lock_started)
    BSDispatchMain();
}

void __42__BLSHBacklightIdleProvider_setSuspended___block_invoke(uint64_t a1)
{
  -[BLSHBacklightIdleProvider onMain_handleSuspendedChanged](*(_QWORD *)(a1 + 32));
}

- (void)onMain_handleSuspendedChanged
{
  os_unfair_lock_s *v2;
  int v3;
  id v4;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v3 = *(unsigned __int8 *)(a1 + 58);
    v4 = *(id *)(a1 + 8);
    os_unfair_lock_unlock(v2);
    objc_msgSend(*(id *)(a1 + 16), "backlightState");
    if (BLSBacklightStateIsActive())
    {
      objc_msgSend(v4, "reset");
      objc_msgSend((id)a1, "setActive:", v3 == 0);
    }

  }
}

- (void)setSuppressed:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  int v5;
  int v6;
  NSObject *v7;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v5 = *(unsigned __int8 *)(a1 + 59);
    *(_BYTE *)(a1 + 59) = a2;
    v6 = *(unsigned __int8 *)(a1 + 56);
    os_unfair_lock_unlock(v4);
    bls_backlight_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BLSHBacklightIdleProvider setSuppressed:].cold.1();

    if (v5 != a2)
    {
      if (v6)
        BSDispatchMain();
    }
  }
}

void __43__BLSHBacklightIdleProvider_setSuppressed___block_invoke(uint64_t a1)
{
  -[BLSHBacklightIdleProvider onMain_handleSuppressedChanged](*(_QWORD *)(a1 + 32));
}

- (void)onMain_handleSuppressedChanged
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6(&dword_2145AC000, v0, v1, "onMain_handleSuppressedChanged suppressed=%{BOOL}u idle=%{BOOL}u");
  OUTLINED_FUNCTION_2();
}

- (void)onMain_idleBacklightInactiveWithExplanation:(uint64_t)a1
{
  id v3;
  int v4;
  void *v5;
  NSObject *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v4 = *(unsigned __int8 *)(a1 + 61);
    *(_BYTE *)(a1 + 61) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
    if (v4)
    {
      v5 = *(void **)(a1 + 16);
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE0B858]), "initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:", 0, v3, mach_continuous_time(), 1, 0);
      v7 = (id)objc_msgSend(v5, "performChangeRequest:", v6);
    }
    else
    {
      bls_backlight_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[BLSHBacklightIdleProvider onMain_idleBacklightInactiveWithExplanation:].cold.1(a1, (uint64_t)v3, v6);
    }

  }
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  id v8;
  _BOOL4 lock_didStartTransitionToNewState;
  int64_t lock_previousBacklightState;
  NSObject *v11;
  BOOL v12;
  id WeakRetained;
  void *v14;
  void *v15;
  _BOOL4 lock_idle;
  _BOOL4 lock_active;
  _BOOL4 v18;
  int v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  os_unfair_lock_lock(&self->_lock);
  lock_didStartTransitionToNewState = 0;
  if (a4 == 2 && self->_lock_idle)
    lock_didStartTransitionToNewState = self->_lock_didStartTransitionToNewState;
  lock_previousBacklightState = self->_lock_previousBacklightState;
  self->_lock_previousBacklightState = a4;
  self->_lock_didStartTransitionToNewState = 0;
  bls_backlight_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromBLSBacklightState();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    lock_idle = self->_lock_idle;
    lock_active = self->_lock_active;
    v18 = self->_lock_didStartTransitionToNewState;
    v19 = 138413570;
    v20 = v15;
    v21 = 1024;
    v22 = lock_previousBacklightState != a4;
    v23 = 1024;
    v24 = lock_didStartTransitionToNewState;
    v25 = 1024;
    v26 = lock_idle;
    v27 = 1024;
    v28 = lock_active;
    v29 = 1024;
    v30 = v18;
    _os_log_debug_impl(&dword_2145AC000, v11, OS_LOG_TYPE_DEBUG, "didCompleteUpdateToState %@; changed=%{BOOL}d; needToResumeIdleTimer=%{BOOL}d, idle=%{BOOL}d, active=%{BOOL}d, did"
      "StartTransitionToNewState=%{BOOL}d",
      (uint8_t *)&v19,
      0x2Au);

  }
  os_unfair_lock_unlock(&self->_lock);
  v12 = !lock_didStartTransitionToNewState;
  if (lock_previousBacklightState != a4)
    v12 = 0;
  if (!v12)
  {
    -[BLSHBacklightIdleProvider updateForBacklightState:]((uint64_t)self, a4);
    if (a4 == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "backlightTurnedOnForEvent:", v14);

    }
  }

}

- (void)backlightHost:(id)a3 willTransitionToState:(int64_t)a4 forEvent:(id)a5
{
  os_unfair_lock_s *p_lock;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL4 lock_didStartTransitionToNewState;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a4 == 2)
    self->_lock_pendingIdleInactiveRequest = 0;
  if (self->_lock_previousBacklightState != a4)
    self->_lock_didStartTransitionToNewState = 1;
  bls_backlight_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromBLSBacklightState();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBLSBacklightState();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    lock_didStartTransitionToNewState = self->_lock_didStartTransitionToNewState;
    v12 = 138412802;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 1024;
    v17 = lock_didStartTransitionToNewState;
    _os_log_debug_impl(&dword_2145AC000, v8, OS_LOG_TYPE_DEBUG, "willTransitionToState %@; previousBacklightState %@; didStartTransitionToNewState=%{BOOL}d",
      (uint8_t *)&v12,
      0x1Cu);

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)idleProviderDidIdle:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  *(_WORD *)&self->_lock_idle = 257;
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v5, "setShouldNotifyOfUnidle:", 1);

  BSDispatchMain();
}

void __49__BLSHBacklightIdleProvider_idleProviderDidIdle___block_invoke(uint64_t a1)
{
  -[BLSHBacklightIdleProvider onMain_handleDidIdle](*(_QWORD *)(a1 + 32));
}

- (void)onMain_handleDidIdle
{
  OUTLINED_FUNCTION_9(&dword_2145AC000, a2, a3, "%p backlightIdle is suppressed, will not deactivate backlight (yet)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)idleProviderDidUnidle:(id)a3
{
  os_unfair_lock_s *p_lock;
  double lock_idleTimeout;
  id v6;

  p_lock = &self->_lock;
  v6 = a3;
  os_unfair_lock_lock(p_lock);
  self->_lock_userActivityOccured = 1;
  *(_WORD *)&self->_lock_idle = 0;
  lock_idleTimeout = self->_lock_idleTimeout;
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v6, "setShouldNotifyOfUnidle:", 0);
  objc_msgSend(v6, "setIdleTimeout:shouldReset:", 0, lock_idleTimeout);

}

- (BLSHBacklightIdleProviderDelegate)delegate
{
  return (BLSHBacklightIdleProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backlightHost, 0);
  objc_storeStrong((id *)&self->_lock_idleProvider, 0);
}

+ (void)createSharedProviderWithLocalAssertionService:.cold.1()
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

+ (void)sharedProvider
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

- (void)setSuspended:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6(&dword_2145AC000, v0, v1, "setSuspended started=%{BOOL}u changed=%{BOOL}u");
  OUTLINED_FUNCTION_2();
}

- (void)setSuppressed:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6(&dword_2145AC000, v0, v1, "setSuppressed started=%{BOOL}u changed=%{BOOL}u");
  OUTLINED_FUNCTION_2();
}

- (void)onMain_idleBacklightInactiveWithExplanation:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_2145AC000, log, OS_LOG_TYPE_DEBUG, "%p will not inactivate (not pending) for explanation:%{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
