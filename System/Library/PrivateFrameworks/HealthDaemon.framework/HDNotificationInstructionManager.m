@implementation HDNotificationInstructionManager

- (HDNotificationInstructionManager)initWithProfile:(id)a3
{
  return -[HDNotificationInstructionManager initWithProfile:unitTest_nowDate:unitTest_didEvaluateIfMaintenanceWorkIsNeeded:](self, "initWithProfile:unitTest_nowDate:unitTest_didEvaluateIfMaintenanceWorkIsNeeded:", a3, 0, 0);
}

- (HDNotificationInstructionManager)initWithProfile:(id)a3 unitTest_nowDate:(id)a4 unitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDNotificationInstructionManager *v11;
  HDNotificationInstructionManager *v12;
  uint64_t v13;
  OS_dispatch_queue *queue;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *lock_observersByClientIdentifier;
  void *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HDNotificationInstructionManager;
  v11 = -[HDNotificationInstructionManager init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    HKCreateSerialDispatchQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    v12->_lock._os_unfair_lock_opaque = 0;
    if (v9)
      objc_storeStrong((id *)&v12->_unitTest_nowDate, a4);
    if (v10)
      -[HDNotificationInstructionManager setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:](v12, "setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:", v10);
    v12->_queue_hasEnqueuedMaintenanceWork = 0;
    objc_msgSend(v8, "daemon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "behavior");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_queue_hasInstructionsToInvalidate = objc_msgSend(v16, "invalidatesNotificationInstructionsOnLaunch");

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_observersByClientIdentifier = v12->_lock_observersByClientIdentifier;
    v12->_lock_observersByClientIdentifier = v17;

    objc_msgSend(v8, "registerProfileReadyObserver:queue:", v12, v12->_queue);
    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v12);

  }
  return v12;
}

- (id)diagnosticDescription
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  HDNotificationInstructionManager *v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E6DF9E48);
  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __57__HDNotificationInstructionManager_diagnosticDescription__block_invoke;
  v11 = &unk_1E6CE8080;
  v12 = v3;
  v13 = self;
  v5 = v3;
  dispatch_async_and_wait(queue, &v8);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"), v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __57__HDNotificationInstructionManager_diagnosticDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t- hasEnqueuedMaintenanceWork: %d"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 25));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t- hasInstructionsToInvalidate: %d"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 24));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (void)_unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:(void *)a1
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unitTest_didEvaluateIfMaintenanceWorkIsNeeded");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
  else
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5330];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v9 = 138543874;
      v10 = (id)objc_opt_class();
      v11 = 2048;
      v12 = a1;
      v13 = 1024;
      v14 = a2;
      v8 = v10;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Did evaluate for maintenance work: %d", (uint8_t *)&v9, 0x1Cu);

    }
  }

}

- (_QWORD)currentDate
{
  void *v1;

  if (a1)
  {
    v1 = (void *)a1[6];
    if (v1)
      return v1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)profileDidBecomeReady:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addProtectedDataObserver:queue:", self, self->_queue);

  objc_msgSend(v5, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v7, "isProtectedDataAvailable");
  if ((_DWORD)v5)
    -[HDNotificationInstructionManager _queue_enqueueMaintenanceInvalidationIfNeeded]((uint64_t)self);
}

- (void)_queue_enqueueMaintenanceInvalidationIfNeeded
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(_BYTE *)(a1 + 24) && !*(_BYTE *)(a1 + 25))
    {
      objc_msgSend((id)a1, "maintenanceOperationName");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "database");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __81__HDNotificationInstructionManager__queue_enqueueMaintenanceInvalidationIfNeeded__block_invoke;
      v9[3] = &unk_1E6CFFF28;
      v9[4] = a1;
      +[HDMaintenanceOperation maintenanceOperationWithName:database:asynchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:database:asynchronousBlock:", v2, v4, v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(v6, "daemon");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "maintenanceWorkCoordinator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "enqueueMaintenanceOperation:", v5);

      *(_BYTE *)(a1 + 25) = 1;
      -[HDNotificationInstructionManager _unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:]((void *)a1, 1);

    }
    else
    {
      -[HDNotificationInstructionManager _unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:]((void *)a1, 0);
    }
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
    -[HDNotificationInstructionManager _queue_enqueueMaintenanceInvalidationIfNeeded]((uint64_t)self);
}

void __81__HDNotificationInstructionManager__queue_enqueueMaintenanceInvalidationIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a4;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__HDNotificationInstructionManager__queue_enqueueMaintenanceInvalidationIfNeeded__block_invoke_2;
  block[3] = &unk_1E6CE9C08;
  block[4] = v6;
  v10 = v5;
  v8 = v5;
  dispatch_async_and_wait(v7, block);

}

uint64_t __81__HDNotificationInstructionManager__queue_enqueueMaintenanceInvalidationIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t *v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  id v30;
  id *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE buf[24];
  void *v37;
  id v38;
  uint64_t *v39;
  id *v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
    v25 = 0;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__139;
    v34 = __Block_byref_object_dispose__139;
    v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
    objc_msgSend(WeakRetained, "database");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __101__HDNotificationInstructionManager__queue_readInvalidInstructionsAndCheckForValidInstructions_error___block_invoke;
    v37 = &unk_1E6CFFF78;
    v38 = (id)v2;
    v39 = &v26;
    v40 = &v30;
    v41 = 50;
    v6 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDataEntity, "performReadTransactionWithHealthDatabase:error:block:", v4, &v25, buf);

    if (v6)
    {
      v7 = v27;
      if (*((_BYTE *)v27 + 24))
      {
        v8 = 1;
      }
      else
      {
        v8 = objc_msgSend(v31[5], "count") == 50;
        v7 = v27;
      }
      *((_BYTE *)v7 + 24) = v8;
      v9 = (void *)objc_msgSend(v31[5], "copy");
    }
    else
    {
      v9 = 0;
      v8 = 1;
    }
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);

    v10 = v25;
    if (v9)
    {
      if (!objc_msgSend(v9, "count"))
        goto LABEL_11;

      v11 = (void *)objc_msgSend(v9, "copy");
      v30 = 0;
      v12 = v11;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
      v13 = objc_loadWeakRetained((id *)(v2 + 8));
      objc_msgSend(v13, "database");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v5;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __72__HDNotificationInstructionManager__queue_invalidateInstructions_error___block_invoke;
      v37 = &unk_1E6CE7950;
      v15 = v12;
      v38 = v15;
      v39 = (uint64_t *)v2;
      LOBYTE(v12) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDNotificationInstructionEntity, "performWriteTransactionWithHealthDatabase:error:block:", v14, &v30, buf);

      v10 = v30;
      if ((v12 & 1) == 0)
      {
        _HKInitializeLogging();
        v20 = (void *)*MEMORY[0x1E0CB5330];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_ERROR))
        {
          v22 = v20;
          v23 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v23;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v10;
          v24 = v23;
          _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Error invalidating instructions: %{public}@", buf, 0x16u);

        }
      }
      else
      {
LABEL_11:
        *(_BYTE *)(v2 + 24) = v8;
      }
    }
    else
    {
      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x1E0CB5330];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_ERROR))
      {
        v17 = v16;
        v18 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v10;
        v19 = v18;
        _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Error checking for invalid instructions: %{public}@", buf, 0x16u);

      }
    }

    *(_BYTE *)(v2 + 25) = 0;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

BOOL __101__HDNotificationInstructionManager__queue_readInvalidInstructionsAndCheckForValidInstructions_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _BOOL8 v9;
  _QWORD v11[4];
  id v12;
  __int128 v13;

  v5 = a2;
  -[HDNotificationInstructionManager currentDate](*(_QWORD **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 56);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __101__HDNotificationInstructionManager__queue_readInvalidInstructionsAndCheckForValidInstructions_error___block_invoke_2;
  v11[3] = &unk_1E6CFFF50;
  v12 = v5;
  v13 = *(_OWORD *)(a1 + 40);
  v8 = v5;
  v9 = +[HDNotificationInstructionEntity enumerateNotificationInstructionsWithSetCriteriaNotExpiredBeforeDate:transaction:limit:error:enumerationHandler:](HDNotificationInstructionEntity, "enumerateNotificationInstructionsWithSetCriteriaNotExpiredBeforeDate:transaction:limit:error:enumerationHandler:", v6, v8, v7, a3, v11);

  return v9;
}

uint64_t __101__HDNotificationInstructionManager__queue_readInvalidInstructionsAndCheckForValidInstructions_error___block_invoke_2(_QWORD *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v13;

  v5 = a2;
  objc_msgSend(v5, "criteria");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v13 = 0;
  v8 = objc_msgSend(v6, "isValidWithDatabaseTransaction:error:", v7, &v13);
  v9 = v13;

  if (v8)
  {
    if (v8 == 2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v5);
    }
    else if (v8 == 1)
    {
      v10 = 1;
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      goto LABEL_12;
    }
    v10 = 1;
    goto LABEL_12;
  }
  v11 = v9;
  if (v11)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v11);
    else
      _HKLogDroppedError();
  }

  v10 = 0;
LABEL_12:

  return v10;
}

uint64_t __72__HDNotificationInstructionManager__queue_invalidateInstructions_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = *(id *)(a1 + 32);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "messageIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDNotificationInstructionManager currentDate](*(_QWORD **)(a1 + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[HDNotificationInstructionEntity invalidateNotificationInstructionWithMessageIdentifier:modificationDate:transaction:error:](HDNotificationInstructionEntity, "invalidateNotificationInstructionWithMessageIdentifier:modificationDate:transaction:error:", v10, v11, v5, a3);

        if (!v12)
        {
          v13 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)enumerateValidNotificationInstructionsForClientIdentifier:(id)a3 action:(int64_t)a4 error:(id *)a5 enumerationBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  int64_t v23;

  v10 = a3;
  v11 = a6;
  -[HDNotificationInstructionManager currentDate](self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __124__HDNotificationInstructionManager_enumerateValidNotificationInstructionsForClientIdentifier_action_error_enumerationBlock___block_invoke;
  v19[3] = &unk_1E6CF6D50;
  v20 = v10;
  v21 = v12;
  v22 = v11;
  v23 = a4;
  v15 = v11;
  v16 = v12;
  v17 = v10;
  LOBYTE(a5) = +[HDNotificationInstructionEntity attemptProtectedReadTransactionWithUnprotectedFallbackWithHealthDatabase:error:block:](HDNotificationInstructionEntity, "attemptProtectedReadTransactionWithUnprotectedFallbackWithHealthDatabase:error:block:", v14, a5, v19);

  return (char)a5;
}

BOOL __124__HDNotificationInstructionManager_enumerateValidNotificationInstructionsForClientIdentifier_action_error_enumerationBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __124__HDNotificationInstructionManager_enumerateValidNotificationInstructionsForClientIdentifier_action_error_enumerationBlock___block_invoke_2;
  v12[3] = &unk_1E6CFFFA0;
  v13 = v5;
  v14 = v7;
  v15 = *(id *)(a1 + 48);
  v9 = v5;
  v10 = +[HDNotificationInstructionEntity enumerateNotificationInstructionsWithClientIdentifier:action:notExpiredBeforeDate:transaction:error:enumerationHandler:](HDNotificationInstructionEntity, "enumerateNotificationInstructionsWithClientIdentifier:action:notExpiredBeforeDate:transaction:error:enumerationHandler:", v8, v6, v14, v9, a3, v12);

  return v10;
}

uint64_t __124__HDNotificationInstructionManager_enumerateValidNotificationInstructionsForClientIdentifier_action_error_enumerationBlock___block_invoke_2(_QWORD *a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v14;

  v5 = a2;
  v6 = a1[4];
  v7 = a1[5];
  v14 = 0;
  v8 = objc_msgSend(v5, "isValidWithDatabaseTransaction:date:error:", v6, v7, &v14);
  v9 = v14;
  v10 = v9;
  if (v8)
  {
    if (v8 != 1)
    {
      v11 = 1;
      goto LABEL_11;
    }
LABEL_5:
    v11 = (*(uint64_t (**)(void))(a1[6] + 16))();
    goto LABEL_11;
  }
  if (objc_msgSend(v9, "hk_isDatabaseAccessibilityError"))
    goto LABEL_5;
  v12 = v10;
  if (v12)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();
  }

  v11 = 0;
LABEL_11:

  return v11;
}

- (void)insertNotificationInstruction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__HDNotificationInstructionManager_insertNotificationInstruction_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __77__HDNotificationInstructionManager_insertNotificationInstruction_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v3 = a1[4];
  v2 = (void *)a1[5];
  v11 = 0;
  v4 = v2;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 16));
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 8));
    objc_msgSend(WeakRetained, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__HDNotificationInstructionManager__queue_insertOrIgnoreNotificationInstruction_error___block_invoke;
    v12[3] = &unk_1E6CE7950;
    v7 = v4;
    v13 = v7;
    v14 = v3;
    v8 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDNotificationInstructionEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, &v11, v12);

    if (v8)
    {
      objc_msgSend(v7, "criteria");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        *(_BYTE *)(v3 + 24) = 1;
    }

  }
  v10 = v11;
  (*(void (**)(void))(a1[6] + 16))();

}

BOOL __87__HDNotificationInstructionManager__queue_insertOrIgnoreNotificationInstruction_error___block_invoke(int8x16_t *a1, void *a2, uint64_t a3)
{
  id v5;
  _BOOL8 v6;
  id v7;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;

  v5 = a2;
  v6 = +[HDNotificationInstructionEntity insertOrIgnoreNotificationInstruction:transaction:error:](HDNotificationInstructionEntity, "insertOrIgnoreNotificationInstruction:transaction:error:", a1[2].i64[0], v5, a3);
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __87__HDNotificationInstructionManager__queue_insertOrIgnoreNotificationInstruction_error___block_invoke_2;
    v10[3] = &unk_1E6CE8080;
    v9 = a1[2];
    v7 = (id)v9.i64[0];
    v11 = vextq_s8(v9, v9, 8uLL);
    objc_msgSend(v5, "onCommit:orRollback:", v10, 0);

  }
  return v6;
}

void __87__HDNotificationInstructionManager__queue_insertOrIgnoreNotificationInstruction_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 28));
    v3 = *(void **)(v1 + 32);
    objc_msgSend(v2, "clientIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __88__HDNotificationInstructionManager__notifyObserversForDidInsertNotificationInstruction___block_invoke;
    v6[3] = &unk_1E6CFFFE8;
    v6[4] = v1;
    v7 = v2;
    objc_msgSend(v5, "notifyObservers:", v6);

    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 28));
  }

}

- (BOOL)invalidateNotificationInstructionsWithMessageIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  HDNotificationInstructionManager *v13;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99__HDNotificationInstructionManager_invalidateNotificationInstructionsWithMessageIdentifiers_error___block_invoke;
  v11[3] = &unk_1E6CE7950;
  v12 = v6;
  v13 = self;
  v9 = v6;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDNotificationInstructionEntity, "performWriteTransactionWithHealthDatabase:error:block:", v8, a4, v11);

  return (char)a4;
}

uint64_t __99__HDNotificationInstructionManager_invalidateNotificationInstructionsWithMessageIdentifiers_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = *(id *)(a1 + 32);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[HDNotificationInstructionManager currentDate](*(_QWORD **)(a1 + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = +[HDNotificationInstructionEntity invalidateNotificationInstructionWithMessageIdentifier:modificationDate:transaction:error:](HDNotificationInstructionEntity, "invalidateNotificationInstructionWithMessageIdentifier:modificationDate:transaction:error:", v10, v11, v5, a3);

        if (!(_DWORD)v10)
        {
          v12 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)obliterateNotificationInstructionsWithError:(id *)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDNotificationInstructionEntity, "performWriteTransactionWithHealthDatabase:error:block:", v5, a3, &__block_literal_global_171);

  return (char)a3;
}

BOOL __80__HDNotificationInstructionManager_obliterateNotificationInstructionsWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDNotificationInstructionEntity obliterateNotificationInstructionsWithTransaction:error:](HDNotificationInstructionEntity, "obliterateNotificationInstructionsWithTransaction:error:", a2, a3);
}

- (void)registerObserver:(id)a3 forClientIdentifier:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_observersByClientIdentifier, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB6988]);
    HKLogInfrastructure();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithName:loggingCategory:", v8, v12);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_observersByClientIdentifier, "setObject:forKeyedSubscript:", v10, v8);
  }
  objc_msgSend(v10, "registerObserver:queue:", v13, v9);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)unregisterObserver:(id)a3 forClientIdentifier:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDNotificationInstructionManager _lock_unregisterObserver:clientIdentifier:]((uint64_t)self, v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_unregisterObserver:(void *)a3 clientIdentifier:
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v7 = a3;
  if (a1)
  {
    v5 = a2;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 28));
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78__HDNotificationInstructionManager__lock_unregisterObserver_clientIdentifier___block_invoke;
    v8[3] = &unk_1E6CE8080;
    v8[4] = a1;
    v9 = v7;
    objc_msgSend(v6, "unregisterObserver:runIfLastObserver:", v5, v8);

  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allKeys](self->_lock_observersByClientIdentifier, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[HDNotificationInstructionManager _lock_unregisterObserver:clientIdentifier:]((uint64_t)self, v4, *(void **)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __88__HDNotificationInstructionManager__notifyObserversForDidInsertNotificationInstruction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notificationInstructionManager:didInsertNotificationInstruction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __78__HDNotificationInstructionManager__lock_unregisterObserver_clientIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

- (id)unitTest_didEvaluateIfMaintenanceWorkIsNeeded
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSDate)unitTest_nowDate
{
  return self->_unitTest_nowDate;
}

- (void)setUnitTest_nowDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_nowDate, 0);
  objc_storeStrong(&self->unitTest_didEvaluateIfMaintenanceWorkIsNeeded, 0);
  objc_storeStrong((id *)&self->_lock_observersByClientIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
