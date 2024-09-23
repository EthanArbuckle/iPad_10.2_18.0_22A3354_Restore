@implementation HDExtendedDatabaseTransaction

- (HDExtendedDatabaseTransaction)initWithDatabase:(id)a3 context:(id)a4 transactionTimeout:(double)a5 continuationTimeout:(double)a6 error:(id *)a7
{
  id v13;
  id v14;
  HDExtendedDatabaseTransaction *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  dispatch_semaphore_t v23;
  void *v24;
  dispatch_semaphore_t v25;
  void *v26;
  NSObject *v27;
  dispatch_source_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  HDExtendedDatabaseTransaction *v33;
  NSError *lastError;
  NSError *v35;
  NSError *v36;
  dispatch_time_t v37;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD block[4];
  HDExtendedDatabaseTransaction *v45;
  id v46;
  _QWORD handler[4];
  id v48;
  id location;
  objc_super v50;

  v13 = a3;
  v14 = a4;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDExtendedDatabaseTransaction.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database != nil"));

  }
  if (a5 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDExtendedDatabaseTransaction.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transactionTimeout > 0"));

  }
  if (a6 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDExtendedDatabaseTransaction.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("continuationTimeout > 0"));

  }
  v50.receiver = self;
  v50.super_class = (Class)HDExtendedDatabaseTransaction;
  v15 = -[HDExtendedDatabaseTransaction init](&v50, sel_init);
  if (v15)
  {
    v16 = (uint64_t)v15;
    objc_storeWeak((id *)&v15->_database, v13);
    *(double *)(v16 + 96) = a5;
    *(double *)(v16 + 104) = a6;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(v16 + 16);
    *(_QWORD *)(v16 + 16) = v17;

    HKCreateSerialDispatchQueue();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(v16 + 32);
    *(_QWORD *)(v16 + 32) = v19;

    HKCreateSerialDispatchQueue();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v21;

    v23 = dispatch_semaphore_create(0);
    v24 = *(void **)(v16 + 48);
    *(_QWORD *)(v16 + 48) = v23;

    v25 = dispatch_semaphore_create(0);
    v26 = *(void **)(v16 + 56);
    *(_QWORD *)(v16 + 56) = v25;

    dispatch_get_global_queue(0, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v27);
    v29 = *(void **)(v16 + 64);
    *(_QWORD *)(v16 + 64) = v28;

    objc_initWeak(&location, (id)v16);
    v30 = *(NSObject **)(v16 + 64);
    v31 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __103__HDExtendedDatabaseTransaction_initWithDatabase_context_transactionTimeout_continuationTimeout_error___block_invoke;
    handler[3] = &unk_1E6CECE78;
    objc_copyWeak(&v48, &location);
    dispatch_source_set_event_handler(v30, handler);
    -[HDExtendedDatabaseTransaction _enableAutomaticRollbackTimer](v16);
    dispatch_resume(*(dispatch_object_t *)(v16 + 64));
    *(_QWORD *)(v16 + 80) = 0;
    v32 = *(NSObject **)(v16 + 32);
    block[0] = v31;
    block[1] = 3221225472;
    block[2] = __103__HDExtendedDatabaseTransaction_initWithDatabase_context_transactionTimeout_continuationTimeout_error___block_invoke_202;
    block[3] = &unk_1E6CE8080;
    v33 = (HDExtendedDatabaseTransaction *)(id)v16;
    v45 = v33;
    v46 = v14;
    dispatch_async(v32, block);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v16 + 48), 0xFFFFFFFFFFFFFFFFLL);
    lastError = v33->_lastError;
    if (lastError)
    {
      v35 = lastError;
      v36 = v35;
      if (a7)
        *a7 = objc_retainAutorelease(v35);
      else
        _HKLogDroppedError();

      v33 = 0;
    }
    else
    {
      v37 = dispatch_time(0, (uint64_t)(*(double *)(v16 + 96) * 1000000000.0));
      v42[0] = v31;
      v42[1] = 3221225472;
      v42[2] = __103__HDExtendedDatabaseTransaction_initWithDatabase_context_transactionTimeout_continuationTimeout_error___block_invoke_2;
      v42[3] = &unk_1E6CECE78;
      objc_copyWeak(&v43, &location);
      dispatch_after(v37, v27, v42);

      objc_destroyWeak(&v43);
    }

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

void __103__HDExtendedDatabaseTransaction_initWithDatabase_context_transactionTimeout_continuationTimeout_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1BCCACAC4]();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 103, CFSTR("Rollback due to automatic rollback timer timeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = 0;
  v6 = objc_msgSend(WeakRetained, "rollbackDueToError:errorOut:", v3, &v11);
  v7 = v11;

  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      v10 = objc_loadWeakRetained(v4);
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "'%@', rollback due to automatic rollback timer timeout", buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_enableAutomaticRollbackTimer
{
  NSObject *v2;
  dispatch_time_t v3;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 64);
    if (v2)
    {
      if (*(_QWORD *)(a1 + 80) <= 1uLL)
      {
        v3 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 104) * 1000000000.0));
        dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(*(double *)(a1 + 104) * 1000000000.0));
      }
    }
  }
}

void __103__HDExtendedDatabaseTransaction_initWithDatabase_context_transactionTimeout_continuationTimeout_error___block_invoke_202(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id WeakRetained;
  char v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[7];
  id v10;
  _QWORD v11[3];
  char v12;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__transaction_runTransactionWithContext_, v1, CFSTR("HDExtendedDatabaseTransaction.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("healthDatabase"));

    }
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    v10 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__HDExtendedDatabaseTransaction__transaction_runTransactionWithContext___block_invoke;
    v9[3] = &unk_1E6CEC9E0;
    v9[4] = v1;
    v9[5] = v11;
    v9[6] = sel__transaction_runTransactionWithContext_;
    v4 = objc_msgSend(WeakRetained, "performTransactionWithContext:error:block:inaccessibilityHandler:", v2, &v10, v9, 0);
    v5 = v10;
    v6 = v10;
    if (!*(_QWORD *)(v1 + 88) && v6)
      objc_storeStrong((id *)(v1 + 88), v5);
    *(_BYTE *)(v1 + 8) = v4;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
    v7 = objc_loadWeakRetained((id *)(v1 + 24));
    objc_msgSend(v7, "finalizeExtendedTransactionForIdentifier:", *(_QWORD *)(v1 + 16));

    _Block_object_dispose(v11, 8);
  }

}

void __103__HDExtendedDatabaseTransaction_initWithDatabase_context_transactionTimeout_continuationTimeout_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1BCCACAC4]();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 103, CFSTR("Rollback due to transaction timeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = 0;
  v6 = objc_msgSend(WeakRetained, "rollbackDueToError:errorOut:", v3, &v11);
  v7 = v11;

  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      v10 = objc_loadWeakRetained(v4);
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "'%@', rollback due to transaction timeout", buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)dealloc
{
  NSObject *automaticRollbackTimer;
  OS_dispatch_source *v4;
  objc_super v5;

  automaticRollbackTimer = self->_automaticRollbackTimer;
  if (automaticRollbackTimer)
  {
    dispatch_source_cancel(automaticRollbackTimer);
    v4 = self->_automaticRollbackTimer;
    self->_automaticRollbackTimer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)HDExtendedDatabaseTransaction;
  -[HDExtendedDatabaseTransaction dealloc](&v5, sel_dealloc);
}

- (BOOL)performInTransactionWithErrorOut:(id *)a3 block:(id)a4
{
  id v6;
  NSObject *dataQueue;
  id v8;
  BOOL v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__79;
  v25 = __Block_byref_object_dispose__79;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  dataQueue = self->_dataQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__HDExtendedDatabaseTransaction_performInTransactionWithErrorOut_block___block_invoke;
  v13[3] = &unk_1E6CF6538;
  v13[4] = self;
  v8 = v6;
  v14 = v8;
  v15 = &v17;
  v16 = &v21;
  dispatch_sync(dataQueue, v13);
  if (*((_BYTE *)v18 + 24))
  {
    v9 = 1;
  }
  else
  {
    v10 = (id)v22[5];
    v11 = v10;
    if (v10)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

    v9 = *((_BYTE *)v18 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __72__HDExtendedDatabaseTransaction_performInTransactionWithErrorOut_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 80) == 1)
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 64));
    v3 = _Block_copy(*(const void **)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = v3;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 56));
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 48), 0xFFFFFFFFFFFFFFFFLL);
    -[HDExtendedDatabaseTransaction _enableAutomaticRollbackTimer](*(_QWORD *)(a1 + 32));
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 64));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Extended transaction is no longer in progress."));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v9 + 88);
    *(_QWORD *)(v9 + 88) = v8;
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (BOOL)commitWithErrorOut:(id *)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__HDExtendedDatabaseTransaction_commitWithErrorOut___block_invoke;
  v4[3] = &unk_1E6CEBC00;
  v4[4] = self;
  return -[HDExtendedDatabaseTransaction performInTransactionWithErrorOut:block:](self, "performInTransactionWithErrorOut:block:", a3, v4);
}

uint64_t __52__HDExtendedDatabaseTransaction_commitWithErrorOut___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 2;
  return 1;
}

- (BOOL)rollbackDueToError:(id)a3 errorOut:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__HDExtendedDatabaseTransaction_rollbackDueToError_errorOut___block_invoke;
  v9[3] = &unk_1E6CE7950;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  -[HDExtendedDatabaseTransaction performInTransactionWithErrorOut:block:](self, "performInTransactionWithErrorOut:block:", a4, v9);
  LOBYTE(a4) = self->_status == 3;

  return (char)a4;
}

uint64_t __61__HDExtendedDatabaseTransaction_rollbackDueToError_errorOut___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 3;
  return 1;
}

uint64_t __72__HDExtendedDatabaseTransaction__transaction_runTransactionWithContext___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v24 = a2;
  *(_QWORD *)(a1[4] + 80) = 1;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 48));
  v5 = (os_log_t *)MEMORY[0x1E0CB52B0];
  while (2)
  {
    v6 = a1[4];
    v7 = *(NSObject **)(v6 + 56);
    v8 = dispatch_time(0, (uint64_t)(*(double *)(v6 + 104) * 1000000000.0));
    if (dispatch_semaphore_wait(v7, v8))
    {
      *(_QWORD *)(a1[4] + 80) = 3;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 103, CFSTR("Rollback due to HDExtendedDatabaseTransaction continuation timeout"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1[4] + 88);
      *(_QWORD *)(a1[4] + 88) = v9;

      *a3 = objc_retainAutorelease(*(id *)(a1[4] + 88));
      _HKInitializeLogging();
      v11 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        v19 = a1[4];
        *(_DWORD *)buf = 138412290;
        v27 = v19;
        _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "'%@', rollback due to HDExtendedDatabaseTransaction continuation timeout", buf, 0xCu);
      }
    }
    v12 = a1[4];
    if (*(_QWORD *)(v12 + 80) == 1)
    {
      v13 = *(_QWORD *)(v12 + 72);
      if (v13)
      {
        v25 = 0;
        v14 = (*(uint64_t (**)(uint64_t, id, id *))(v13 + 16))(v13, v24, &v25);
        v15 = v25;
        v16 = v25;
        *(_BYTE *)(a1[4] + 8) = v14;
        v17 = a1[4];
        if (!*(_BYTE *)(v17 + 8))
          objc_storeStrong((id *)(v17 + 88), v15);

        v12 = a1[4];
        if (!*(_BYTE *)(v12 + 8))
        {
          *(_QWORD *)(v12 + 80) = 3;
          v12 = a1[4];
        }
      }
    }
    switch(*(_QWORD *)(v12 + 80))
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("HDExtendedDatabaseTransaction.m"), 234, CFSTR("Invalid transaction status."));

        continue;
      case 1:
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v12 + 48));
        continue;
      case 2:
        v22 = 1;
        break;
      case 3:
        _HKInitializeLogging();
        v20 = *MEMORY[0x1E0CB52C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_INFO))
        {
          v21 = *(_QWORD *)(a1[4] + 88);
          *(_DWORD *)buf = 138412290;
          v27 = v21;
          _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_INFO, "Transaction was rolled back, last error: %@", buf, 0xCu);
        }
        v22 = 0;
        break;
      default:
        continue;
    }
    break;
  }

  return v22;
}

- (NSUUID)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (HDDatabase)database
{
  return (HDDatabase *)objc_loadWeakRetained((id *)&self->_database);
}

- (double)transactionTimeout
{
  return self->_transactionTimeout;
}

- (double)continuationTimeout
{
  return self->_continuationTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong(&self->_pendingWork, 0);
  objc_storeStrong((id *)&self->_automaticRollbackTimer, 0);
  objc_storeStrong((id *)&self->_pendingWorkSemaphore, 0);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_destroyWeak((id *)&self->_database);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end
