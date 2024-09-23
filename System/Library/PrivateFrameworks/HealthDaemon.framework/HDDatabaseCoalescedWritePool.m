@implementation HDDatabaseCoalescedWritePool

- (HDDatabaseCoalescedWritePool)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDDatabaseCoalescedWritePool)initWithProfile:(id)a3 name:(id)a4 loggingCategory:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDDatabaseCoalescedWritePool *v11;
  HDDatabaseCoalescedWritePool *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  OS_dispatch_queue *writeQueue;
  NSMutableArray *v17;
  NSMutableArray *pendingWriteQueue;
  id v19;
  OS_dispatch_queue *v20;
  uint64_t v21;
  _HKDelayedOperation *pendingWriteOperation;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HDDatabaseCoalescedWritePool;
  v11 = -[HDDatabaseCoalescedWritePool init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    v13 = objc_msgSend(v9, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

    objc_storeStrong((id *)&v12->_loggingCategory, a5);
    HKCreateSerialDispatchQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    writeQueue = v12->_writeQueue;
    v12->_writeQueue = (OS_dispatch_queue *)v15;

    v12->_lock._os_unfair_lock_opaque = 0;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingWriteQueue = v12->_pendingWriteQueue;
    v12->_pendingWriteQueue = v17;

    objc_initWeak(&location, v12);
    v19 = objc_alloc(MEMORY[0x1E0CB6F80]);
    v20 = v12->_writeQueue;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __69__HDDatabaseCoalescedWritePool_initWithProfile_name_loggingCategory___block_invoke;
    v24[3] = &unk_1E6CECE78;
    objc_copyWeak(&v25, &location);
    v21 = objc_msgSend(v19, "initWithMode:clock:queue:delay:block:", 1, 0, v20, v24, 0.0);
    pendingWriteOperation = v12->_pendingWriteOperation;
    v12->_pendingWriteOperation = (_HKDelayedOperation *)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __69__HDDatabaseCoalescedWritePool_initWithProfile_name_loggingCategory___block_invoke(uint64_t a1)
{
  int v1;
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  _QWORD *WeakRetained;
  id v9;
  uint8_t buf[4];
  _QWORD *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = 0;
    v1 = -[HDDatabaseCoalescedWritePool _queue_performPendingWriteOperationsWithError:]((uint64_t)WeakRetained, &v9);
    v2 = v9;
    _HKInitializeLogging();
    v3 = WeakRetained[2];
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (v1)
    {
      if (v4)
      {
        *(_DWORD *)buf = 138543362;
        v11 = WeakRetained;
        v5 = "%{public}@: Completed scheduled pending write operation.";
        v6 = v3;
        v7 = 12;
LABEL_7:
        _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, v5, buf, v7);
      }
    }
    else if (v4)
    {
      *(_DWORD *)buf = 138543618;
      v11 = WeakRetained;
      v12 = 2114;
      v13 = v2;
      v5 = "%{public}@: Scheduled pending write operation failed with error: %{public}@";
      v6 = v3;
      v7 = 22;
      goto LABEL_7;
    }

  }
}

- (uint64_t)_queue_performPendingWriteOperationsWithError:(uint64_t)a1
{
  id v4;
  id v5;
  void *v6;
  NSObject **v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  double Current;
  id WeakRetained;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  CFAbsoluteTime v35;
  id v36;
  void *v37;
  _QWORD *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  double v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  v4 = *(id *)(a1 + 48);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v5;

  if (objc_msgSend(v4, "count"))
    objc_msgSend(*(id *)(a1 + 64), "consumeQuota");
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  if (objc_msgSend(v4, "count"))
  {
    v39 = a2;
    v7 = (NSObject **)MEMORY[0x1E0CB52A8];
    v8 = _HKLogSignpostIDGenerate();
    _HKInitializeLogging();
    v9 = *v7;
    if (os_signpost_enabled(v9))
    {
      v10 = v9;
      v11 = v10;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_DWORD *)buf = 134217984;
        v50 = objc_msgSend(v4, "count");
        _os_signpost_emit_with_name_impl(&dword_1B7802000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v8, "coalesced-write", "count=%ld", buf, 0xCu);
      }

    }
    +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", a1, *(_QWORD *)(a1 + 8));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDatabaseTransactionContext contextForWritingProtectedData](HDDatabaseTransactionContext, "contextForWritingProtectedData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v48 = 0;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __78__HDDatabaseCoalescedWritePool__queue_performPendingWriteOperationsWithError___block_invoke;
    v46[3] = &unk_1E6CE7950;
    v46[4] = a1;
    v47 = v4;
    v44[0] = v17;
    v44[1] = 3221225472;
    v44[2] = __78__HDDatabaseCoalescedWritePool__queue_performPendingWriteOperationsWithError___block_invoke_2;
    v44[3] = &unk_1E6CECEC8;
    v44[4] = a1;
    v18 = v47;
    v45 = v18;
    v19 = objc_msgSend(v15, "performTransactionWithContext:error:block:inaccessibilityHandler:", v16, &v48, v46, v44);
    v20 = v48;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v21 = v18;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v41;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v41 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v25);
          if (v26)
            v27 = *(_QWORD *)(v26 + 16);
          else
            v27 = 0;
          (*(void (**)(uint64_t, uint64_t, id))(v27 + 16))(v27, v19, v20);
          ++v25;
        }
        while (v23 != v25);
        v28 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
        v23 = v28;
      }
      while (v28);
    }

    _HKInitializeLogging();
    v29 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB52A8]))
    {
      v30 = v29;
      v31 = v30;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B7802000, v31, OS_SIGNPOST_INTERVAL_END, v8, "coalesced-write", ", buf, 2u);
      }

    }
    _HKInitializeLogging();
    v32 = *(NSObject **)(a1 + 16);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      v34 = objc_msgSend(v21, "count");
      v35 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 138543874;
      v50 = a1;
      v51 = 2048;
      v52 = v34;
      v53 = 2048;
      v54 = v35 - Current;
      _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed %ld pending writes in %0.3lfs.", buf, 0x20u);

    }
    objc_msgSend(v12, "invalidate");
    v36 = v20;
    v37 = v36;
    if (v36)
    {
      if (v39)
        *v39 = objc_retainAutorelease(v36);
      else
        _HKLogDroppedError();
    }

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

- (void)performWriteWithMaximumLatency:(double)a3 block:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _HDDatabasePendingWriteRecord *v10;
  id v11;
  id v12;
  uint64_t v13;
  id writeBlock;
  uint64_t v15;
  id completion;
  HDCoalescedTaskPoolQuota *quota;
  double v18;
  double v19;
  void *v20;
  NSObject *writeQueue;
  id v22;
  _QWORD v23[5];
  id v24;
  double v25;
  double v26;
  objc_super v27;

  v8 = a5;
  v9 = a4;
  v10 = [_HDDatabasePendingWriteRecord alloc];
  v11 = v9;
  v12 = v8;
  if (v10)
  {
    v27.receiver = v10;
    v27.super_class = (Class)_HDDatabasePendingWriteRecord;
    v10 = -[HDDatabaseCoalescedWritePool init](&v27, sel_init);
    if (v10)
    {
      v13 = objc_msgSend(v11, "copy");
      writeBlock = v10->_writeBlock;
      v10->_writeBlock = (id)v13;

      v15 = objc_msgSend(v12, "copy");
      completion = v10->_completion;
      v10->_completion = (id)v15;

    }
  }

  quota = self->_quota;
  v18 = a3;
  if (quota)
  {
    -[HDCoalescedTaskPoolQuota timeUntilNextAvailableTrigger](quota, "timeUntilNextAvailableTrigger");
    if (v19 >= a3)
      v18 = v19;
    else
      v18 = a3;
  }
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray addObject:](self->_pendingWriteQueue, "addObject:", v10);
  os_unfair_lock_unlock(&self->_lock);
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", self, CFSTR("PendingWriteOperation"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  writeQueue = self->_writeQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __80__HDDatabaseCoalescedWritePool_performWriteWithMaximumLatency_block_completion___block_invoke;
  v23[3] = &unk_1E6CECEA0;
  v25 = a3;
  v26 = v18;
  v23[4] = self;
  v24 = v20;
  v22 = v20;
  dispatch_async(writeQueue, v23);

}

uint64_t __80__HDDatabaseCoalescedWritePool_performWriteWithMaximumLatency_block_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(void **)(v2 + 64);
    v7 = v3;
    objc_msgSend(v6, "timeUntilNextAvailableTrigger");
    v10 = 138544130;
    v11 = v2;
    v12 = 2048;
    v13 = v4;
    v14 = 2048;
    v15 = v5;
    v16 = 2048;
    v17 = v8;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@:Pending Write with requested latency=%0.3lfs, adjusted latency=%0.3lfs, quota=%0.3lfs", (uint8_t *)&v10, 0x2Au);

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 40), "executeWithDelay:", *(double *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)flushPendingWriteQueueWithCompletion:(id)a3
{
  id v4;
  NSObject *writeQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  writeQueue = self->_writeQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__HDDatabaseCoalescedWritePool_flushPendingWriteQueueWithCompletion___block_invoke;
  v7[3] = &unk_1E6CE9C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(writeQueue, v7);

}

void __69__HDDatabaseCoalescedWritePool_flushPendingWriteQueueWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = 0;
  -[HDDatabaseCoalescedWritePool _queue_performPendingWriteOperationsWithError:](v2, &v4);
  v3 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (uint64_t)_performPendingWriteRecords:(void *)a3 transaction:(void *)a4 accessibilityError:(uint64_t)a5 error:
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16);
          if (v17)
            v18 = *(_QWORD *)(v17 + 8);
          else
            v18 = 0;
          if (!(*(unsigned int (**)(uint64_t, id, id, uint64_t))(v18 + 16))(v18, v10, v11, a5))
          {
            v20 = 0;
            goto LABEL_16;
          }
          ++v16;
        }
        while (v14 != v16);
        v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v14 = v19;
      }
      while (v19);
    }
    v20 = 1;
LABEL_16:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t __78__HDDatabaseCoalescedWritePool__queue_performPendingWriteOperationsWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return -[HDDatabaseCoalescedWritePool _performPendingWriteRecords:transaction:accessibilityError:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a2, 0, a3);
}

uint64_t __78__HDDatabaseCoalescedWritePool__queue_performPendingWriteOperationsWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return -[HDDatabaseCoalescedWritePool _performPendingWriteRecords:transaction:accessibilityError:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0, a2, a3);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HDCoalescedTaskPoolQuota)quota
{
  return self->_quota;
}

- (void)setQuota:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quota, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_pendingWriteQueue, 0);
  objc_storeStrong((id *)&self->_pendingWriteOperation, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
