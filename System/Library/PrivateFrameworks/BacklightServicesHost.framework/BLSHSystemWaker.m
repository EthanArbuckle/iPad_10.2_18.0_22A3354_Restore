@implementation BLSHSystemWaker

+ (id)sharedSystemActivityFactory
{
  if (sharedSystemActivityFactory_onceToken != -1)
    dispatch_once(&sharedSystemActivityFactory_onceToken, &__block_literal_global_29);
  return (id)sharedSystemActivityFactory___aggregatedAssertionFactory;
}

void __46__BLSHSystemWaker_sharedSystemActivityFactory__block_invoke()
{
  BLSHAggregatedSystemActivityAssertionFactory *v0;
  void *v1;

  v0 = objc_alloc_init(BLSHAggregatedSystemActivityAssertionFactory);
  v1 = (void *)sharedSystemActivityFactory___aggregatedAssertionFactory;
  sharedSystemActivityFactory___aggregatedAssertionFactory = (uint64_t)v0;

}

+ (id)wakerWithIdentifier:(id)a3 osInterfaceProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:osInterfaceProvider:", v7, v6);

  return v8;
}

- (BLSHSystemWaker)initWithIdentifier:(id)a3 osInterfaceProvider:(id)a4
{
  id v7;
  id v8;
  BLSHSystemWaker *v9;
  BLSHSystemWaker *v10;
  id v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BLSHSystemWaker;
  v9 = -[BLSHSystemWaker init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_osInterfaceProvider, a4);
    v11 = +[BLSHSystemWaker sharedSystemActivityFactory](BLSHSystemWaker, "sharedSystemActivityFactory");
  }

  return v10;
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

- (void)wakeWithCompletion:(id)a3
{
  id v5;
  BLSHOSInterfaceProviding *v6;
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BLSHOSInterfaceProviding *v11;
  BLSHSystemActivityAsserting *v12;
  BLSHSystemActivityAsserting *lock_systemActivity;
  BLSHSystemActivityAsserting *v14;
  BLSHOSInterfaceProviding *v15;
  NSString *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  BLSHOSInterfaceProviding *v20;
  NSString *v21;
  id v22;
  _QWORD *v23;
  id v24[2];
  id location;
  _QWORD v26[4];
  BLSHOSInterfaceProviding *v27;
  _QWORD v28[5];
  BLSHSystemActivityAsserting *v29;

  v5 = a3;
  v6 = self->_osInterfaceProvider;
  v7 = self->_identifier;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_waking)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@ already waking"), self, self->_identifier);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHSystemWaker wakeWithCompletion:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    self->_lock_waking = 1;
    v8 = (void *)mach_continuous_time();
    self->_lock_waitStartTimestamp = (unint64_t)v8;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__10;
    v28[4] = __Block_byref_object_dispose__10;
    +[BLSHSystemWaker sharedSystemActivityFactory](BLSHSystemWaker, "sharedSystemActivityFactory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __38__BLSHSystemWaker_wakeWithCompletion___block_invoke;
    v26[3] = &unk_24D1BE5B0;
    v11 = v6;
    v27 = v11;
    objc_msgSend(v9, "createAggregatedSystemActivityAssertionWithIdentifier:configurator:", v7, v26);
    v12 = (BLSHSystemActivityAsserting *)objc_claimAutoreleasedReturnValue();
    lock_systemActivity = self->_lock_systemActivity;
    self->_lock_systemActivity = v12;

    v29 = v12;
    os_unfair_lock_unlock(&self->_lock);
    objc_initWeak(&location, self);
    v14 = self->_lock_systemActivity;
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __38__BLSHSystemWaker_wakeWithCompletion___block_invoke_2;
    v19[3] = &unk_24D1BE5D8;
    objc_copyWeak(v24, &location);
    v15 = v11;
    v20 = v15;
    v16 = v7;
    v21 = v16;
    v24[1] = v8;
    v17 = v5;
    v22 = v17;
    v23 = v28;
    -[BLSHSystemActivityAsserting acquireWithTimeout:handler:](v14, "acquireWithTimeout:handler:", v19, 0.0);

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
    _Block_object_dispose(v28, 8);

  }
}

void __38__BLSHSystemWaker_wakeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setAcquireWaitsToAbortSleepRequested:", 1);
  objc_msgSend(v3, "setOSInterfaceProvider:", *(_QWORD *)(a1 + 32));

}

void __38__BLSHSystemWaker_wakeWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "systemSleepMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    bls_backlight_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      if (objc_msgSend(v8, "afterPendingSleepWasAlreadyInitiated"))
        v12 = OS_LOG_TYPE_DEFAULT;
      else
        v12 = OS_LOG_TYPE_DEBUG;
    }
    else
    {
      v12 = OS_LOG_TYPE_FAULT;
    }
    if (os_log_type_enabled(v11, v12))
    {
      v15 = *(_QWORD *)(a1 + 40);
      mach_continuous_time();
      BSTimeDifferenceFromMachTimeToMachTime();
      v17 = v16;
      v18 = objc_msgSend(v10, "hasSleepBeenRequested");
      objc_msgSend(v7, "bls_loggingString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134219010;
      v21 = WeakRetained;
      v22 = 2114;
      v23 = v15;
      v24 = 2048;
      v25 = v17;
      v26 = 1024;
      v27 = v18;
      v28 = 2114;
      v29 = v19;
      _os_log_impl(&dword_2145AC000, v11, v12, "%p system waker activity acquired:\"%{public}@\" elapsed:%.4lfs hasSleepBeenRequested:%{BOOL}u error:%{public}@", (uint8_t *)&v20, 0x30u);

    }
    objc_msgSend(WeakRetained, "waitWithSystemSleepMonitor:completion:", v10, *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "invalidate");
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

  }
}

- (void)setCompletion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id lock_completion;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)MEMORY[0x2199D2BD8](v5);

  lock_completion = self->_lock_completion;
  self->_lock_completion = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)callCompletionForReason:(id)a3
{
  id v4;
  _BOOL4 lock_invalidated;
  void (**v6)(_QWORD);
  id lock_completion;
  BLSHSystemActivityAsserting *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSString *identifier;
  uint64_t v16;
  int v17;
  BLSHSystemWaker *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_invalidated = self->_lock_invalidated;
  v6 = (void (**)(_QWORD))MEMORY[0x2199D2BD8](self->_lock_completion);
  lock_completion = self->_lock_completion;
  self->_lock_completion = 0;

  v8 = self->_lock_systemActivity;
  os_unfair_lock_unlock(&self->_lock);
  -[BLSHOSInterfaceProviding systemSleepMonitor](self->_osInterfaceProvider, "systemSleepMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!lock_invalidated && v6)
  {
    v11 = objc_msgSend(v9, "hasSleepBeenRequested");
    bls_backlight_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
      v14 = OS_LOG_TYPE_FAULT;
    else
      v14 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v12, v14))
    {
      identifier = self->_identifier;
      mach_continuous_time();
      BSTimeDifferenceFromMachTimeToMachTime();
      v17 = 134219266;
      v18 = self;
      v19 = 2114;
      v20 = identifier;
      v21 = 2114;
      v22 = v4;
      v23 = 2048;
      v24 = v16;
      v25 = 1024;
      v26 = objc_msgSend(v10, "hasSleepBeenRequested");
      v27 = 1024;
      v28 = -[BLSHSystemActivityAsserting isActive](v8, "isActive");
      _os_log_impl(&dword_2145AC000, v13, v14, "%p waited for system awake :\"%{public}@\" details:%{public}@ elapsed:%.4lfs hasSleepBeenRequested:%{BOOL}u activityActive:%{BOOL}u", (uint8_t *)&v17, 0x36u);
    }

    v6[2](v6);
  }
  objc_msgSend(v10, "removeObserver:", self);

}

- (void)waitWithSystemSleepMonitor:(id)a3 completion:(id)a4
{
  id v6;

  v6 = a3;
  -[BLSHSystemWaker setCompletion:](self, "setCompletion:", a4);
  if ((objc_msgSend(v6, "hasSleepBeenRequested") & 1) != 0)
    objc_msgSend(v6, "addObserver:", self);
  else
    -[BLSHSystemWaker callCompletionForReason:](self, "callCompletionForReason:", CFSTR("alreadyAwake"));

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  BLSHSystemActivityAsserting *lock_systemActivity;
  void *v5;
  BLSHSystemActivityAsserting *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  lock_systemActivity = self->_lock_systemActivity;
  self->_lock_systemActivity = 0;
  v6 = lock_systemActivity;

  os_unfair_lock_unlock(p_lock);
  -[BLSHOSInterfaceProviding systemSleepMonitor](self->_osInterfaceProvider, "systemSleepMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[BLSHSystemActivityAsserting invalidate](v6, "invalidate");
}

- (void)systemSleepMonitorSleepRequestAborted:(id)a3
{
  -[BLSHSystemWaker callCompletionForReason:](self, "callCompletionForReason:", CFSTR("sleepRequestAborted"));
}

- (void)systemSleepMonitorWillWakeFromSleep:(id)a3
{
  -[BLSHSystemWaker callCompletionForReason:](self, "callCompletionForReason:", CFSTR("willWakeFromSleep"));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_completion, 0);
  objc_storeStrong((id *)&self->_lock_systemActivity, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)wakeWithCompletion:(const char *)a1 .cold.1(const char *a1)
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
