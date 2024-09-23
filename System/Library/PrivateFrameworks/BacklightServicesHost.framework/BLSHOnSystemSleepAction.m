@implementation BLSHOnSystemSleepAction

+ (id)actionWithIdentifier:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id result;
  void *v13;

  v7 = a3;
  v8 = a4;
  +[BLSHBacklightOSInterfaceProvider sharedProvider](BLSHBacklightOSInterfaceProvider, "sharedProvider");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(a1, "actionWithIdentifier:delegate:osInterfaceProvider:", v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("sharedProvider != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[BLSHOnSystemSleepAction actionWithIdentifier:delegate:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)actionWithIdentifier:(id)a3 delegate:(id)a4 osInterfaceProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:delegate:osInterfaceProvider:", v10, v9, v8);

  return v11;
}

- (BLSHOnSystemSleepAction)initWithIdentifier:(id)a3 delegate:(id)a4 osInterfaceProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  BLSHOnSystemSleepAction *v12;
  BLSHOnSystemSleepAction *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLSHOnSystemSleepAction;
  v12 = -[BLSHOnSystemSleepAction init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_osInterfaceProvider, a5);
    v13->_lock_state = 0;
  }

  return v13;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int64_t)state
{
  os_unfair_lock_s *p_lock;
  int64_t lock_state;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_state = self->_lock_state;
  os_unfair_lock_unlock(p_lock);
  return lock_state;
}

- (void)install
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_2145AC000, v0, v1, "%p:%{public}@ installing sleep action when sleep imminent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __34__BLSHOnSystemSleepAction_install__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAcquireWaitsToAbortSleepRequested:", 1);
}

void __34__BLSHOnSystemSleepAction_install__block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  bls_backlight_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2)
    v11 = OS_LOG_TYPE_DEFAULT;
  else
    v11 = OS_LOG_TYPE_FAULT;
  if (os_log_type_enabled(v9, v11))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(v12 + 56);
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    v17 = 134219010;
    v18 = v12;
    v19 = 2114;
    v20 = v13;
    v21 = 2114;
    v22 = v8;
    v23 = 2048;
    v24 = v14;
    v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_2145AC000, v10, v11, "%p:%{public}@ install sleep action system activity assertion callback details:%{public}@ elapsed:%.4lfs error:%{public}@", (uint8_t *)&v17, 0x34u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

}

- (void)uninstall
{
  id v3;

  -[BLSHOSInterfaceProviding systemSleepMonitor](self->_osInterfaceProvider, "systemSleepMonitor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)systemSleepMonitor:(id)a3 sleepRequestedWithResult:(id)a4
{
  id v7;
  uint64_t (**v8)(id, uint64_t, _QWORD);
  int64_t lock_state;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  int64_t v13;
  NSString *identifier;
  const __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  double v18;
  id v19;
  uint64_t v20;
  void *v21;
  id lock_proceedWithSleepBlock;
  id WeakRetained;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[4];
  uint64_t (**v27)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  BLSHOnSystemSleepAction *v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (uint64_t (**)(id, uint64_t, _QWORD))a4;
  os_unfair_lock_lock(&self->_lock);
  lock_state = self->_lock_state;
  bls_backlight_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (lock_state)
    v12 = OS_LOG_TYPE_ERROR;
  else
    v12 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v10, v12))
  {
    v13 = self->_lock_state;
    identifier = self->_identifier;
    v15 = CFSTR("Idle");
    if (v13 == 1)
      v15 = CFSTR("Performing");
    if (v13 == 2)
      v16 = CFSTR("Completed");
    else
      v16 = (__CFString *)v15;
    v17 = v16;
    *(_DWORD *)buf = 134218498;
    v29 = self;
    v30 = 2114;
    v31 = identifier;
    v32 = 2114;
    v33 = v17;
    _os_log_impl(&dword_2145AC000, v11, v12, "%p:%{public}@ sleepRequested state:%{public}@", buf, 0x20u);

  }
  BSContinuousMachTimeNow();
  self->_lock_sleepRequestedTime = v18;
  if (lock_state)
  {
    os_unfair_lock_unlock(&self->_lock);
    v19 = (id)v8[2](v8, 1, 0);
  }
  else
  {
    if (self->_lock_proceedWithSleepBlock)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_proceedWithSleepBlock == nil"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHOnSystemSleepAction systemSleepMonitor:sleepRequestedWithResult:].cold.1(a2);
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x2145B6104);
    }
    v20 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __71__BLSHOnSystemSleepAction_systemSleepMonitor_sleepRequestedWithResult___block_invoke;
    v26[3] = &unk_24D1BC240;
    v27 = v8;
    v21 = (void *)MEMORY[0x2199D2BD8](v26);
    lock_proceedWithSleepBlock = self->_lock_proceedWithSleepBlock;
    self->_lock_proceedWithSleepBlock = v21;

    self->_lock_state = 1;
    os_unfair_lock_unlock(&self->_lock);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v25[0] = v20;
    v25[1] = 3221225472;
    v25[2] = __71__BLSHOnSystemSleepAction_systemSleepMonitor_sleepRequestedWithResult___block_invoke_2;
    v25[3] = &unk_24D1BC268;
    v25[4] = self;
    objc_msgSend(WeakRetained, "systemSleepAction:performWithCompletion:", self, v25);

  }
}

id __71__BLSHOnSystemSleepAction_systemSleepMonitor_sleepRequestedWithResult___block_invoke(uint64_t a1)
{
  return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__BLSHOnSystemSleepAction_systemSleepMonitor_sleepRequestedWithResult___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "actionCompleted");
}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  id v7;
  id v8;
  int64_t lock_state;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  int64_t v13;
  NSString *identifier;
  const __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  id lock_proceedWithSleepBlock;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id WeakRetained;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  BLSHOnSystemSleepAction *v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_state = self->_lock_state;
  bls_backlight_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (lock_state == 2)
    v12 = OS_LOG_TYPE_DEBUG;
  else
    v12 = 16 * (lock_state != 0);
  if (os_log_type_enabled(v10, v12))
  {
    v13 = self->_lock_state;
    identifier = self->_identifier;
    v15 = CFSTR("Idle");
    if (v13 == 1)
      v15 = CFSTR("Performing");
    if (v13 == 2)
      v16 = CFSTR("Completed");
    else
      v16 = (__CFString *)v15;
    v17 = v16;
    *(_DWORD *)buf = 134218498;
    v30 = self;
    v31 = 2114;
    v32 = identifier;
    v33 = 2114;
    v34 = v17;
    _os_log_impl(&dword_2145AC000, v11, v12, "%p:%{public}@ prepareForSleep state:%{public}@", buf, 0x20u);

  }
  v18 = (void *)MEMORY[0x2199D2BD8](self->_lock_proceedWithSleepBlock);
  lock_proceedWithSleepBlock = self->_lock_proceedWithSleepBlock;
  self->_lock_proceedWithSleepBlock = 0;

  if (v18)
  {
    bls_backlight_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[BLSHOnSystemSleepAction systemSleepMonitor:prepareForSleepWithCompletion:].cold.2();

    dispatch_async(MEMORY[0x24BDAC9B8], v18);
  }
  if (lock_state == 2)
  {
    if (self->_lock_proceedWithSleepBlock)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_proceedWithSleepBlock == nil"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHOnSystemSleepAction systemSleepMonitor:prepareForSleepWithCompletion:].cold.1(a2);
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x2145B6424);
    }
    os_unfair_lock_unlock(&self->_lock);
    dispatch_async(MEMORY[0x24BDAC9B8], v8);
  }
  else
  {
    if (!lock_state)
      self->_lock_state = 1;
    v21 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __76__BLSHOnSystemSleepAction_systemSleepMonitor_prepareForSleepWithCompletion___block_invoke;
    v27[3] = &unk_24D1BC240;
    v28 = v8;
    v22 = (void *)MEMORY[0x2199D2BD8](v27);
    v23 = self->_lock_proceedWithSleepBlock;
    self->_lock_proceedWithSleepBlock = v22;

    os_unfair_lock_unlock(&self->_lock);
    if (!lock_state)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v26[0] = v21;
      v26[1] = 3221225472;
      v26[2] = __76__BLSHOnSystemSleepAction_systemSleepMonitor_prepareForSleepWithCompletion___block_invoke_2;
      v26[3] = &unk_24D1BC268;
      v26[4] = self;
      objc_msgSend(WeakRetained, "systemSleepAction:performWithCompletion:", self, v26);

    }
  }

}

void __76__BLSHOnSystemSleepAction_systemSleepMonitor_prepareForSleepWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
}

uint64_t __76__BLSHOnSystemSleepAction_systemSleepMonitor_prepareForSleepWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "actionCompleted");
}

- (void)systemSleepMonitorSleepRequestAborted:(id)a3
{
  -[BLSHOnSystemSleepAction systemWillWakeForReason:](self, "systemWillWakeForReason:", CFSTR("sleepRequestAborted"));
}

- (void)systemSleepMonitorWillWakeFromSleep:(id)a3
{
  -[BLSHOnSystemSleepAction systemWillWakeForReason:](self, "systemWillWakeForReason:", CFSTR("willWakeFromSleep"));
}

- (void)systemWillWakeForReason:(id)a3
{
  id v4;
  void *v5;
  id lock_proceedWithSleepBlock;
  int64_t lock_state;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  int64_t v11;
  NSString *identifier;
  const __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  id WeakRetained;
  NSObject *v17;
  int v18;
  BLSHOnSystemSleepAction *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)MEMORY[0x2199D2BD8](self->_lock_proceedWithSleepBlock);
  lock_proceedWithSleepBlock = self->_lock_proceedWithSleepBlock;
  self->_lock_proceedWithSleepBlock = 0;

  lock_state = self->_lock_state;
  bls_backlight_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (lock_state == 2)
    v10 = OS_LOG_TYPE_DEBUG;
  else
    v10 = 16 * (lock_state != 0);
  if (os_log_type_enabled(v8, v10))
  {
    v11 = self->_lock_state;
    identifier = self->_identifier;
    v13 = CFSTR("Idle");
    if (v11 == 1)
      v13 = CFSTR("Performing");
    if (v11 == 2)
      v14 = CFSTR("Completed");
    else
      v14 = (__CFString *)v13;
    v15 = v14;
    v18 = 134218754;
    v19 = self;
    v20 = 2114;
    v21 = identifier;
    v22 = 2114;
    v23 = v4;
    v24 = 2114;
    v25 = v15;
    _os_log_impl(&dword_2145AC000, v9, v10, "%p:%{public}@ systemWillWakeForReason%{public}@ state:%{public}@", (uint8_t *)&v18, 0x2Au);

  }
  self->_lock_state = 0;
  os_unfair_lock_unlock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "systemSleepAction:systemWillWakeForReason:", self, v4);

  if (v5)
  {
    bls_backlight_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[BLSHOnSystemSleepAction systemSleepMonitor:prepareForSleepWithCompletion:].cold.2();

    dispatch_async(MEMORY[0x24BDAC9B8], v5);
  }

}

- (void)actionCompleted
{
  os_unfair_lock_s *p_lock;
  int64_t lock_state;
  void (**v5)(_QWORD);
  id lock_proceedWithSleepBlock;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  int64_t v10;
  NSString *identifier;
  const __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  int v16;
  BLSHOnSystemSleepAction *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_state = self->_lock_state;
  v5 = (void (**)(_QWORD))MEMORY[0x2199D2BD8](self->_lock_proceedWithSleepBlock);
  lock_proceedWithSleepBlock = self->_lock_proceedWithSleepBlock;
  self->_lock_proceedWithSleepBlock = 0;

  bls_backlight_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (lock_state == 1)
    v9 = OS_LOG_TYPE_DEBUG;
  else
    v9 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v7, v9))
  {
    v10 = self->_lock_state;
    identifier = self->_identifier;
    v12 = CFSTR("Idle");
    if (v10 == 1)
      v12 = CFSTR("Performing");
    if (v10 == 2)
      v13 = CFSTR("Completed");
    else
      v13 = (__CFString *)v12;
    v14 = v13;
    v15 = (void *)MEMORY[0x2199D2BD8](v5);
    v16 = 134218754;
    v17 = self;
    v18 = 2114;
    v19 = identifier;
    v20 = 2114;
    v21 = v14;
    v22 = 2048;
    v23 = v15;
    _os_log_impl(&dword_2145AC000, v8, v9, "%p:%{public}@ actionCompleted state:%{public}@ proceedWithSleepBlock=%p", (uint8_t *)&v16, 0x2Au);

  }
  if (lock_state == 1)
    self->_lock_state = 2;
  os_unfair_lock_unlock(p_lock);
  if (v5)
    v5[2](v5);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_lock_proceedWithSleepBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
}

+ (void)actionWithIdentifier:(const char *)a1 delegate:.cold.1(const char *a1)
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

- (void)systemSleepMonitor:(const char *)a1 sleepRequestedWithResult:.cold.1(const char *a1)
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

- (void)systemSleepMonitor:(const char *)a1 prepareForSleepWithCompletion:.cold.1(const char *a1)
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

- (void)systemSleepMonitor:prepareForSleepWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_2145AC000, v0, v1, "%p:%{public}@ timed out sleep request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
