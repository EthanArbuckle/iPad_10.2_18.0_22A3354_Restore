@implementation EKTimedEventStorePurger

- (id)acquireCachedEventStoreOrCreate:(BOOL)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__12;
  v14 = __Block_byref_object_dispose__13;
  v15 = 0;
  -[EKTimedEventStorePurger workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__EKTimedEventStorePurger_acquireCachedEventStoreOrCreate___block_invoke;
  block[3] = &unk_1E4785AD8;
  block[4] = self;
  block[5] = &v10;
  v9 = a3;
  dispatch_sync(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __59__EKTimedEventStorePurger_acquireCachedEventStoreOrCreate___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void (**v7)(void);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "internalStore");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = a1 + 40;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    goto LABEL_2;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*v2, "internalCreationBlock");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)v4 + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*v2, "setInternalStore:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 40));
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      __59__EKTimedEventStorePurger_acquireCachedEventStoreOrCreate___block_invoke_cold_1();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", *v2, sel__eventStoreChangedNotification_, CFSTR("EKEventStoreChangedNotification"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 40));

    objc_msgSend(*v2, "setIgnoreLowLevelDatabaseChangedNotifications:", 1);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 40))
LABEL_2:
      objc_msgSend(*v2, "_resetIdleTimer");
  }
}

- (id)internalCreationBlock
{
  return self->_internalCreationBlock;
}

- (void)setInternalStore:(id)a3
{
  objc_storeStrong((id *)&self->_internalStore, a3);
}

- (void)setIgnoreLowLevelDatabaseChangedNotifications:(BOOL)a3
{
  self->_ignoreLowLevelDatabaseChangedNotifications = a3;
}

- (void)_resetIdleTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Purging is disallowed.  Will not set up an idle timer for [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (EKEventStore)internalStore
{
  return self->_internalStore;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (double)internalTimeout
{
  return self->_internalTimeout;
}

- (BOOL)internalPurgingAllowed
{
  return self->_internalPurgingAllowed;
}

- (EKTimedEventStorePurger)init
{
  EKTimedEventStorePurger *v2;
  id v3;
  const char *v4;
  dispatch_queue_t v5;
  id v6;
  const char *v7;
  dispatch_queue_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EKTimedEventStorePurger;
  v2 = -[EKTimedEventStorePurger init](&v10, sel_init);
  if (v2)
  {
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");

    v5 = dispatch_queue_create(v4, 0);
    -[EKTimedEventStorePurger setWorkQueue:](v2, "setWorkQueue:", v5);

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");

    v8 = dispatch_queue_create(v7, 0);
    -[EKTimedEventStorePurger setCallbackQueue:](v2, "setCallbackQueue:", v8);

    -[EKTimedEventStorePurger _addPersistentNotificationObservers](v2, "_addPersistentNotificationObservers");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[EKTimedEventStorePurger _uninstallTimer](self, "_uninstallTimer");
  -[EKTimedEventStorePurger _removePersistentNotificationObservers](self, "_removePersistentNotificationObservers");
  -[EKTimedEventStorePurger _removeTransientEventStoreChangeObserver](self, "_removeTransientEventStoreChangeObserver");
  v3.receiver = self;
  v3.super_class = (Class)EKTimedEventStorePurger;
  -[EKTimedEventStorePurger dealloc](&v3, sel_dealloc);
}

- (void)setTimeout:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[EKTimedEventStorePurger workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__EKTimedEventStorePurger_setTimeout___block_invoke;
  v6[3] = &unk_1E4785A88;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __38__EKTimedEventStorePurger_setTimeout___block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "internalTimeout");
  v4 = v3;
  if (vabdd_f64(v3, *(double *)(a1 + 40)) >= 2.22044605e-16)
  {
    v5 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = (void *)MEMORY[0x1E0CB37E8];
      v8 = v5;
      objc_msgSend(v7, "numberWithDouble:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v6;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_debug_impl(&dword_1A2318000, v8, OS_LOG_TYPE_DEBUG, "Changing timeout in [%@] from [%@] to [%@].", (uint8_t *)&v11, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setInternalTimeout:", *(double *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_resetIdleTimer");
  }
  return result;
}

- (double)timeout
{
  NSObject *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[EKTimedEventStorePurger workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__EKTimedEventStorePurger_timeout__block_invoke;
  v6[3] = &unk_1E4785190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __34__EKTimedEventStorePurger_timeout__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "internalTimeout");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)setCreationBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EKTimedEventStorePurger workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__EKTimedEventStorePurger_setCreationBlock___block_invoke;
  v7[3] = &unk_1E4784E18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __44__EKTimedEventStorePurger_setCreationBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeTransientEventStoreChangeObserver");
  objc_msgSend(*(id *)(a1 + 32), "setInternalStore:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setInternalCreationBlock:", *(_QWORD *)(a1 + 40));
}

- (id)creationBlock
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  -[EKTimedEventStorePurger workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__EKTimedEventStorePurger_creationBlock__block_invoke;
  v6[3] = &unk_1E4785190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (void *)MEMORY[0x1A85849D4](v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __40__EKTimedEventStorePurger_creationBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "internalCreationBlock");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setChangedBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EKTimedEventStorePurger workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__EKTimedEventStorePurger_setChangedBlock___block_invoke;
  v7[3] = &unk_1E4784E18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __43__EKTimedEventStorePurger_setChangedBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInternalChangedBlock:", *(_QWORD *)(a1 + 40));
}

- (id)changedBlock
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  -[EKTimedEventStorePurger workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__EKTimedEventStorePurger_changedBlock__block_invoke;
  v6[3] = &unk_1E4785190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (void *)MEMORY[0x1A85849D4](v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __39__EKTimedEventStorePurger_changedBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "internalChangedBlock");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPurgingAllowed:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[EKTimedEventStorePurger workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__EKTimedEventStorePurger_setPurgingAllowed___block_invoke;
  v6[3] = &unk_1E4785AB0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

uint64_t __45__EKTimedEventStorePurger_setPurgingAllowed___block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "internalPurgingAllowed");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != (_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setInternalPurgingAllowed:", v3 != 0);
    v4 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    {
      v5 = v4;
      CalBooleanAsString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CalBooleanAsString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_debug_impl(&dword_1A2318000, v5, OS_LOG_TYPE_DEBUG, "Set 'purgingAllowed' from [%@] to [%@] in [%@]", (uint8_t *)&v9, 0x20u);

    }
    return objc_msgSend(*(id *)(a1 + 32), "_resetIdleTimer");
  }
  return result;
}

- (BOOL)purgingAllowed
{
  EKTimedEventStorePurger *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[EKTimedEventStorePurger workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__EKTimedEventStorePurger_purgingAllowed__block_invoke;
  v5[3] = &unk_1E4785190;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __41__EKTimedEventStorePurger_purgingAllowed__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "internalPurgingAllowed");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __42__EKTimedEventStorePurger__resetIdleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
  {
    __42__EKTimedEventStorePurger__resetIdleTimer__block_invoke_cold_2();
    if (!WeakRetained)
      goto LABEL_8;
  }
  else if (!WeakRetained)
  {
    goto LABEL_8;
  }
  objc_msgSend(WeakRetained, "setIgnoreLowLevelDatabaseChangedNotifications:", 0);
  objc_msgSend(WeakRetained, "internalStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      __42__EKTimedEventStorePurger__resetIdleTimer__block_invoke_cold_1();
    objc_msgSend(WeakRetained, "_removeTransientEventStoreChangeObserver");
    objc_msgSend(WeakRetained, "setInternalStore:", 0);
  }
  objc_msgSend(WeakRetained, "_uninstallTimer");

LABEL_8:
}

- (void)_uninstallTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Uninstalling dispatch timer in [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_addPersistentNotificationObservers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Adding persistent notification observers for [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_removePersistentNotificationObservers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Removing persistent notification observers for [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_databaseChangedExternally
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v4 = 2112;
  v5 = v0;
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v1, v2, "[%@] received notification: [%@]", v3);
  OUTLINED_FUNCTION_1_0();
}

void __53__EKTimedEventStorePurger__databaseChangedExternally__block_invoke(uint64_t a1)
{
  id *v1;

  v1 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "ignoreLowLevelDatabaseChangedNotifications"))
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      __53__EKTimedEventStorePurger__databaseChangedExternally__block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*v1, "_fireChangedBlock");
  }
}

- (void)_removeTransientEventStoreChangeObserver
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1A2318000, v0, v1, "Removing transient event store change observer for event store [%@] in [%@]");
  OUTLINED_FUNCTION_1_0();
}

- (void)_eventStoreChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    -[EKTimedEventStorePurger _eventStoreChangedNotification:].cold.1();
  if (!+[EKChangeListener isSyncStatusChangeNotification:](EKChangeListener, "isSyncStatusChangeNotification:", v4))
  {
    -[EKTimedEventStorePurger workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__EKTimedEventStorePurger__eventStoreChangedNotification___block_invoke;
    block[3] = &unk_1E4785078;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

uint64_t __58__EKTimedEventStorePurger__eventStoreChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fireChangedBlock");
}

- (void)_fireChangedBlock
{
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  -[EKTimedEventStorePurger internalChangedBlock](self, "internalChangedBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[EKTimedEventStorePurger callbackQueue](self, "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __44__EKTimedEventStorePurger__fireChangedBlock__block_invoke;
    v5[3] = &unk_1E4784E18;
    v5[4] = self;
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __44__EKTimedEventStorePurger__fireChangedBlock__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    __44__EKTimedEventStorePurger__fireChangedBlock__block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void)setInternalTimeout:(double)a3
{
  self->_internalTimeout = a3;
}

- (void)setInternalCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)internalChangedBlock
{
  return self->_internalChangedBlock;
}

- (void)setInternalChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)ignoreLowLevelDatabaseChangedNotifications
{
  return self->_ignoreLowLevelDatabaseChangedNotifications;
}

- (void)setInternalPurgingAllowed:(BOOL)a3
{
  self->_internalPurgingAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalStore, 0);
  objc_storeStrong(&self->_internalChangedBlock, 0);
  objc_storeStrong(&self->_internalCreationBlock, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __59__EKTimedEventStorePurger_acquireCachedEventStoreOrCreate___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_4(&dword_1A2318000, v0, v1, "No existing store was found in [%@].  Created event store: [%@].");
  OUTLINED_FUNCTION_1_0();
}

void __42__EKTimedEventStorePurger__resetIdleTimer__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1A2318000, v0, v1, "Clearing event store: [%@] in [%@]");
  OUTLINED_FUNCTION_1_0();
}

void __42__EKTimedEventStorePurger__resetIdleTimer__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Idle timer fired in [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __53__EKTimedEventStorePurger__databaseChangedExternally__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v0, v1, "Ignored low-level [%@] notification in [%@].", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_eventStoreChangedNotification:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1A2318000, v0, v1, "[%@] received notification: [%@]");
  OUTLINED_FUNCTION_1_0();
}

void __44__EKTimedEventStorePurger__fireChangedBlock__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A2318000, a2, a3, "Firing changed block from [%@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
