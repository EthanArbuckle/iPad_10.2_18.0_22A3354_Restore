@implementation HDContentProtectionManager

- (BOOL)deviceUnlockedSinceBoot
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_unlockedSinceBoot);
  return v2 & 1;
}

+ (BOOL)isProtectedDataAvailableWithState:(int64_t)a3
{
  return a3 == 4 || a3 == 1;
}

- (BOOL)isProtectedDataAvailable
{
  return objc_msgSend((id)objc_opt_class(), "isProtectedDataAvailableWithState:", -[HDContentProtectionManager observedState](self, "observedState"));
}

- (int64_t)observedState
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_shouldIgnoreUnlockedState);
  if ((v2 & 1) != 0)
    return 2;
  return (int)atomic_load((unsigned int *)&self->_contentProtectionState);
}

- (HDContentProtectionManager)init
{
  return -[HDContentProtectionManager initWithNotifications:initialState:unlockedSinceBoot:](self, "initWithNotifications:initialState:unlockedSinceBoot:", 1, 0, 0);
}

- (HDContentProtectionManager)initWithNotifications:(BOOL)a3 initialState:(int64_t)a4 unlockedSinceBoot:(BOOL)a5
{
  _BOOL4 v7;
  HDContentProtectionManager *v9;
  uint64_t v10;
  OS_dispatch_queue *observationQueue;
  id v12;
  void *v13;
  uint64_t v14;
  HKObserverSet *observers;
  id v16;
  void *v17;
  uint64_t v18;
  HKSynchronousObserverSet *synchronousObservers;
  NSObject *v20;
  void *v21;
  void *v23;
  _QWORD block[4];
  HDContentProtectionManager *v25;
  objc_super v26;

  v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HDContentProtectionManager;
  v9 = -[HDContentProtectionManager init](&v26, sel_init);
  if (v9)
  {
    HKCreateSerialDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    observationQueue = v9->_observationQueue;
    v9->_observationQueue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc(MEMORY[0x24BDD3DD0]);
    HKLogInfrastructure();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithName:loggingCategory:", CFSTR("content-protection-observers"), v13);
    observers = v9->_observers;
    v9->_observers = (HKObserverSet *)v14;

    v16 = objc_alloc(MEMORY[0x24BDD4020]);
    HKLogInfrastructure();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithName:loggingCategory:", CFSTR("content-protection-observers"), v17);
    synchronousObservers = v9->_synchronousObservers;
    v9->_synchronousObservers = (HKSynchronousObserverSet *)v18;

    if (v7)
    {
      v20 = v9->_observationQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke;
      block[3] = &unk_24CB18348;
      v25 = v9;
      dispatch_sync(v20, block);

    }
    else
    {
      if (!a4)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("HDContentProtectionManager.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialState != HDContentProtectionStateInvalid"));

      }
      atomic_store(a4, (unsigned int *)&v9->_contentProtectionState);
      atomic_store(a5, (unsigned __int8 *)&v9->_unlockedSinceBoot);
    }
    +[HDDiagnosticManager sharedDiagnosticManager](HDDiagnosticManager, "sharedDiagnosticManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v9);

  }
  return v9;
}

void __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke(uint64_t a1)
{
  const char *v2;
  int *v3;
  int *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD handler[4];
  int *v9;

  if (MKBDeviceFormattedForContentProtection())
  {
    v2 = (const char *)*MEMORY[0x24BE67240];
    v3 = *(int **)(a1 + 32);
    v4 = v3 + 4;
    v5 = *((_QWORD *)v3 + 3);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke_2;
    handler[3] = &unk_24CB18370;
    v9 = v3;
    notify_register_dispatch(v2, v4, v5, handler);
    *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 56) = CFAbsoluteTimeGetCurrent();

  }
  atomic_store(-[HDContentProtectionManager _keyBagLockState](*(_QWORD *)(a1 + 32)), (unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
  atomic_store(MKBDeviceUnlockedSinceBoot() != 0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 13));
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 14));
  v7 = *(id *)(a1 + 32);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = AKSEventsRegister();
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x24BDD2FD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
      __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke_cold_1(v6);
  }

}

void __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  _QWORD *v4;

  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 64) = CFAbsoluteTimeGetCurrent();
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke_3;
  v3[3] = &unk_24CB18348;
  v4 = v2;
  -[HDContentProtectionManager _observationQueue_adjustContentProtectionStateWithBlock:](v4, v3);

}

uint64_t __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  unsigned int *v2;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (unsigned int *)(v1 + 8);
  result = -[HDContentProtectionManager _keyBagLockState](v1);
  atomic_store(result, v2);
  return result;
}

- (uint64_t)_keyBagLockState
{
  unsigned int v1;

  if (result)
  {
    v1 = MKBGetDeviceLockState();
    result = 0;
    if (v1 <= 6)
      return qword_210FD5570[v1];
  }
  return result;
}

- (void)_observationQueue_adjustContentProtectionStateWithBlock:(_QWORD *)a1
{
  void (**v3)(_QWORD);
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  os_log_t *v7;
  unsigned __int8 *v8;
  unsigned __int8 v9;
  NSObject *v10;
  os_log_t v11;
  _BOOL4 v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[6];
  _QWORD v22[6];
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v4 = objc_msgSend(a1, "observedState");
    v3[2](v3);
    v5 = objc_msgSend(a1, "observedState");
    v6 = v5;
    v7 = (os_log_t *)MEMORY[0x24BDD2FD8];
    if (v5 == 4 || v5 == 1)
    {
      v8 = (unsigned __int8 *)a1 + 13;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(1u, v8));
      if ((v9 & 1) == 0)
      {
        _HKInitializeLogging();
        v10 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210F9A000, v10, OS_LOG_TYPE_DEFAULT, "First unlock", buf, 2u);
        }
      }
    }
    _HKInitializeLogging();
    v11 = *v7;
    v12 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT);
    if (v6 == v4)
    {
      if (v12)
      {
        v13 = CFSTR("invalid");
        switch(v4)
        {
          case 0uLL:
            break;
          case 1uLL:
            v13 = CFSTR("unlocked");
            break;
          case 2uLL:
            v13 = CFSTR("locked");
            break;
          case 3uLL:
            v13 = CFSTR("locking");
            break;
          case 4uLL:
            v13 = CFSTR("disabled");
            break;
          default:
            v13 = CFSTR("unknown");
            break;
        }
        *(_DWORD *)buf = 138543618;
        v24 = v13;
        v25 = 2114;
        v26 = v13;
        v20 = v11;
        _os_log_impl(&dword_210F9A000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring no-op keybag transition (%{public}@ -> %{public}@)", buf, 0x16u);

      }
    }
    else
    {
      if (v12)
      {
        if (v4 > 4)
          v14 = CFSTR("unknown");
        else
          v14 = off_24CB18450[v4];
        if (v6 > 4)
          v15 = CFSTR("unknown");
        else
          v15 = off_24CB18450[v6];
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        v25 = 2114;
        v26 = v15;
        v16 = v11;
        _os_log_impl(&dword_210F9A000, v16, OS_LOG_TYPE_DEFAULT, "Key bag transitioning from %{public}@ to %{public}@", buf, 0x16u);

      }
      v17 = (void *)a1[5];
      v18 = MEMORY[0x24BDAC760];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __86__HDContentProtectionManager__observationQueue_adjustContentProtectionStateWithBlock___block_invoke;
      v22[3] = &__block_descriptor_48_e39_v16__0___HDContentProtectionObserver__8l;
      v22[4] = v6;
      v22[5] = v4;
      objc_msgSend(v17, "notifyObservers:", v22);
      v19 = (void *)a1[4];
      v21[0] = v18;
      v21[1] = 3221225472;
      v21[2] = __86__HDContentProtectionManager__observationQueue_adjustContentProtectionStateWithBlock___block_invoke_2;
      v21[3] = &__block_descriptor_48_e39_v16__0___HDContentProtectionObserver__8l;
      v21[4] = v6;
      v21[5] = v4;
      objc_msgSend(v19, "notifyObservers:", v21);
    }
  }

}

uint64_t __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke_4(uint64_t result, int a2, CFDictionaryRef theDict)
{
  void *v3;
  void *v4;
  uint64_t v5;
  CFTypeID v6;
  unsigned __int8 *v7;
  void *value[5];

  if (a2 == 1)
  {
    value[3] = v3;
    value[4] = v4;
    v5 = result;
    value[0] = 0;
    result = CFDictionaryGetValueIfPresent(theDict, (const void *)*MEMORY[0x24BE07950], (const void **)value);
    if ((_DWORD)result)
    {
      v6 = CFGetTypeID(value[0]);
      result = CFBooleanGetTypeID();
      if (v6 == result)
      {
        result = CFBooleanGetValue((CFBooleanRef)value[0]);
        v7 = (unsigned __int8 *)(*(_QWORD *)(v5 + 32) + 14);
        do
          __ldaxr(v7);
        while (__stlxr((_DWORD)result != 0, v7));
      }
    }
  }
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[HDDiagnosticManager sharedDiagnosticManager](HDDiagnosticManager, "sharedDiagnosticManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  notify_cancel(self->_notifyToken);
  AKSEventsUnregister();
  v4.receiver = self;
  v4.super_class = (Class)HDContentProtectionManager;
  -[HDContentProtectionManager dealloc](&v4, sel_dealloc);
}

- (void)addContentProtectionObserver:(id)a3 withQueue:(id)a4
{
  id v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (OS_dispatch_queue *)a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDContentProtectionManager.m"), 152, CFSTR("Observer cannot be nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDContentProtectionManager.m"), 153, CFSTR("Queue cannot be NULL"));

LABEL_3:
  if (self->_observationQueue == v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDContentProtectionManager.m"), 154, CFSTR("Queue cannot be the same as _observationQueue"));

  }
  _HKInitializeLogging();
  v10 = *MEMORY[0x24BDD2FD8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = v7;
    _os_log_impl(&dword_210F9A000, v10, OS_LOG_TYPE_DEFAULT, "Added content protection observer %{public}@", (uint8_t *)&v14, 0xCu);
  }
  -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", v7, v9);

}

- (void)addSynchronousContentProtectionObserver:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDContentProtectionManager.m"), 161, CFSTR("Observer cannot be nil"));

  }
  _HKInitializeLogging();
  v6 = *MEMORY[0x24BDD2FD8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_210F9A000, v6, OS_LOG_TYPE_DEFAULT, "Added synchronous content protection observer %{public}@", (uint8_t *)&v8, 0xCu);
  }
  -[HKSynchronousObserverSet registerObserver:](self->_synchronousObservers, "registerObserver:", v5);

}

- (void)removeContentProtectionObserver:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDContentProtectionManager.m"), 168, CFSTR("Observer cannot be nil"));

    v5 = 0;
  }
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", v5);
  -[HKSynchronousObserverSet unregisterObserver:](self->_synchronousObservers, "unregisterObserver:", v7);

}

- (BOOL)isInSession
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isSession);
  return v2 & 1;
}

- (BOOL)shouldIgnoreUnlockedState
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_shouldIgnoreUnlockedState);
  return v2 & 1;
}

- (void)_updateMKBState
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_210F9A000, log, OS_LOG_TYPE_ERROR, "Actual content protection state '%d' does not match cached content protection state '%d' (found via recheck)", (uint8_t *)v3, 0xEu);
}

- (void)recheckContentProtectionState
{
  NSObject *observationQueue;
  _QWORD block[5];

  observationQueue = self->_observationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HDContentProtectionManager_recheckContentProtectionState__block_invoke;
  block[3] = &unk_24CB18348;
  block[4] = self;
  dispatch_async(observationQueue, block);
}

void __59__HDContentProtectionManager_recheckContentProtectionState__block_invoke(uint64_t a1)
{
  double Current;
  uint64_t v3;
  _QWORD v4[5];

  Current = CFAbsoluteTimeGetCurrent();
  v3 = *(_QWORD *)(a1 + 32);
  if (Current - *(double *)(v3 + 72) >= 5.0)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __59__HDContentProtectionManager_recheckContentProtectionState__block_invoke_2;
    v4[3] = &unk_24CB18348;
    v4[4] = v3;
    -[HDContentProtectionManager _observationQueue_adjustContentProtectionStateWithBlock:]((_QWORD *)v3, v4);
    *(double *)(*(_QWORD *)(a1 + 32) + 72) = Current;
  }
}

void __59__HDContentProtectionManager_recheckContentProtectionState__block_invoke_2(uint64_t a1)
{
  -[HDContentProtectionManager _updateMKBState](*(_QWORD *)(a1 + 32));
}

- (void)setContentProtectionState:(int64_t)a3
{
  NSObject *observationQueue;
  _QWORD v4[6];

  observationQueue = self->_observationQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__HDContentProtectionManager_setContentProtectionState___block_invoke;
  v4[3] = &unk_24CB183C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(observationQueue, v4);
}

void __56__HDContentProtectionManager_setContentProtectionState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  _QWORD *v3;
  uint64_t v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __56__HDContentProtectionManager_setContentProtectionState___block_invoke_2;
  v2[3] = &unk_24CB183C0;
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v1;
  -[HDContentProtectionManager _observationQueue_adjustContentProtectionStateWithBlock:](v3, v2);
}

uint64_t __56__HDContentProtectionManager_setContentProtectionState___block_invoke_2(uint64_t result)
{
  atomic_store(*(_DWORD *)(result + 40), (unsigned int *)(*(_QWORD *)(result + 32) + 8));
  return result;
}

- (void)setInSession:(BOOL)a3
{
  NSObject *observationQueue;
  _QWORD v4[5];
  BOOL v5;

  observationQueue = self->_observationQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__HDContentProtectionManager_setInSession___block_invoke;
  v4[3] = &unk_24CB183E8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(observationQueue, v4);
}

void __43__HDContentProtectionManager_setInSession___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  _QWORD v2[5];
  char v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __43__HDContentProtectionManager_setInSession___block_invoke_2;
  v2[3] = &unk_24CB183E8;
  v2[4] = v1;
  v3 = *(_BYTE *)(a1 + 40);
  -[HDContentProtectionManager _observationQueue_adjustContentProtectionStateWithBlock:](v1, v2);
}

uint64_t __43__HDContentProtectionManager_setInSession___block_invoke_2(uint64_t result)
{
  atomic_store(*(_BYTE *)(result + 40), (unsigned __int8 *)(*(_QWORD *)(result + 32) + 14));
  return result;
}

- (void)setShouldIgnoreUnlockedState:(BOOL)a3
{
  NSObject *observationQueue;
  _QWORD v4[5];
  BOOL v5;

  observationQueue = self->_observationQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__HDContentProtectionManager_setShouldIgnoreUnlockedState___block_invoke;
  v4[3] = &unk_24CB183E8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(observationQueue, v4);
}

void __59__HDContentProtectionManager_setShouldIgnoreUnlockedState___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  _QWORD v2[5];
  char v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __59__HDContentProtectionManager_setShouldIgnoreUnlockedState___block_invoke_2;
  v2[3] = &unk_24CB183E8;
  v2[4] = v1;
  v3 = *(_BYTE *)(a1 + 40);
  -[HDContentProtectionManager _observationQueue_adjustContentProtectionStateWithBlock:](v1, v2);
}

uint64_t __59__HDContentProtectionManager_setShouldIgnoreUnlockedState___block_invoke_2(uint64_t result)
{
  atomic_store(*(_BYTE *)(result + 40), (unsigned __int8 *)(*(_QWORD *)(result + 32) + 12));
  return result;
}

- (id)diagnosticDescription
{
  void *v3;
  NSObject *observationQueue;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  HDContentProtectionManager *v10;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  observationQueue = self->_observationQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__HDContentProtectionManager_diagnosticDescription__block_invoke;
  v8[3] = &unk_24CB18410;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(observationQueue, v8);
  v6 = v5;

  return v6;
}

void __51__HDContentProtectionManager_diagnosticDescription__block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  int v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "observedState");
  if (v3 > 4)
    v4 = CFSTR("unknown");
  else
    v4 = off_24CB18450[v3];
  objc_msgSend(v2, "appendFormat:", CFSTR("Recorded state: %@\n"), v4);
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("System state: %@\n"), off_24CB18450[-[HDContentProtectionManager _keyBagLockState](*(_QWORD *)(a1 + 40))]);
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(*(id *)(a1 + 40), "deviceUnlockedSinceBoot");
  v7 = "NO";
  if (v6)
    v7 = "YES";
  objc_msgSend(v5, "appendFormat:", CFSTR("Unlocked since boot: %s\n"), v7);
  if (objc_msgSend(*(id *)(a1 + 40), "shouldIgnoreUnlockedState"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("IGNORING UNLOCKED STATE\n"));
  if (*(double *)(*(_QWORD *)(a1 + 40) + 64) == 0.0)
  {
    HDDiagnosticStringFromDate(0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HDDiagnosticStringFromDate(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (*(double *)(*(_QWORD *)(a1 + 40) + 56) == 0.0)
  {
    HDDiagnosticStringFromDate(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HDDiagnosticStringFromDate(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Last lock_status notification: %@ (began observing %@)"), v9, v11);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\nObservers:"));
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "allObservers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          v18 = *(void **)(a1 + 32);
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "appendFormat:", CFSTR("\n\t<%@:%p>"), v20, v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v14);
    }

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\nObservers:"));
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "allObservers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          v27 = *(void **)(a1 + 32);
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "appendFormat:", CFSTR("\n\t<%@:%p>"), v29, v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v23);
    }

  }
}

uint64_t __86__HDContentProtectionManager__observationQueue_adjustContentProtectionStateWithBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentProtectionStateChanged:previousState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __86__HDContentProtectionManager__observationQueue_adjustContentProtectionStateWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentProtectionStateChanged:previousState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronousObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observationQueue, 0);
}

void __83__HDContentProtectionManager_initWithNotifications_initialState_unlockedSinceBoot___block_invoke_cold_1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  __int16 v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 138478083;
  v2 = CFSTR("AKSEvents");
  v3 = 2113;
  v4 = CFSTR("kAKSInfoOnenessUnlocked");
  _os_log_error_impl(&dword_210F9A000, log, OS_LOG_TYPE_ERROR, "Unable to register for %{private}@ %{private}@", (uint8_t *)&v1, 0x16u);
}

@end
