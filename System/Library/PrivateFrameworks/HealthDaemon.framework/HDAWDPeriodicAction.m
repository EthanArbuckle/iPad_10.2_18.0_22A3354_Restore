@implementation HDAWDPeriodicAction

void __42___HDAWDPeriodicAction__beginWaitingToRun__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[18];
  if (!(v3 % v2[8]))
  {
    -[_HDAWDPeriodicAction _queue_setWaitingToRun:]((uint64_t)v2, v2[9]);
    v2 = *(_QWORD **)(a1 + 32);
  }
  -[_HDAWDPeriodicAction _queue_setIntervalCounter:]((uint64_t)v2, v3 + 1);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v4 + 96));
    if (*(_BYTE *)(v4 + 56))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = (void *)MEMORY[0x1E0CB3A28];
      v7 = *(id *)(v4 + 160);
      objc_msgSend(v6, "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@"), v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)(v4 + 88));
      objc_msgSend(WeakRetained, "database");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v12, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v10, &v20, 300.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v20;

      if (v13)
      {
        v16 = *(void **)(v4 + 104);
        v15 = (id *)(v4 + 104);
        v17 = v16;
        v18 = v17;
        if (v17)
          objc_msgSend(v17, "invalidate");
        objc_storeStrong(v15, v13);

      }
      else
      {
        _HKInitializeLogging();
        v19 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v22 = v4;
          v23 = 2114;
          v24 = v14;
          _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to take database accessibility assertion during activity preparation: %{public}@", buf, 0x16u);
        }
      }

    }
  }
}

void __45___HDAWDPeriodicAction_setLastProcessedDate___block_invoke(uint64_t a1)
{
  -[_HDAWDPeriodicAction _queue_setLastProcessedDate:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __29___HDAWDPeriodicAction_reset__block_invoke(uint64_t a1)
{
  -[_HDAWDPeriodicAction _queue_setWaitingToRun:](*(_QWORD *)(a1 + 32), 0);
  -[_HDAWDPeriodicAction _queue_setLastSubmissionAttemptDate:](*(_QWORD *)(a1 + 32), 0);
  -[_HDAWDPeriodicAction _queue_setIntervalCounter:](*(_QWORD *)(a1 + 32), 0);
  -[_HDAWDPeriodicAction _queue_setLastProcessedDate:](*(_QWORD *)(a1 + 32), 0);
}

void __41___HDAWDPeriodicAction_lastProcessedDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 152));
}

void __49___HDAWDPeriodicAction_lastSubmissionAttemptDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 136));
}

uint64_t __39___HDAWDPeriodicAction_intervalCounter__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 144);
  return result;
}

void __29___HDAWDPeriodicAction_start__block_invoke(uint64_t a1)
{
  uint64_t v1;
  HDPeriodicActivity *v2;
  id WeakRetained;
  os_log_t *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = [HDPeriodicActivity alloc];
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 88));
    v4 = (os_log_t *)MEMORY[0x1E0CB52C0];
    v5 = -[HDPeriodicActivity initWithProfile:name:interval:delegate:loggingCategory:](v2, "initWithProfile:name:interval:delegate:loggingCategory:", WeakRetained, *(_QWORD *)(v1 + 160), v1, *MEMORY[0x1E0CB52C0], (double)*(uint64_t *)(v1 + 40));
    v6 = *(void **)(v1 + 120);
    *(_QWORD *)(v1 + 120) = v5;

    _HKInitializeLogging();
    v7 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(v1 + 160);
      v9 = 138543618;
      v10 = v1;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_INFO, "%{public}@: Registered XPC activity %{public}@ for periodic updates", (uint8_t *)&v9, 0x16u);
    }
  }
}

void __69___HDAWDPeriodicAction__doIfWaitingOnMaintenanceQueueWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (**v4)(_QWORD);
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  HDMutableDatabaseTransactionContext *v11;
  id WeakRetained;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  const __CFString *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD block[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _BYTE buf[24];
  void *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  if (v3)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 1;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__100;
    v32 = __Block_byref_object_dispose__100;
    v33 = 0;
    v5 = *(NSObject **)(v3 + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46___HDAWDPeriodicAction__doIfWaitingWithError___block_invoke;
    block[3] = &unk_1E6CF1308;
    block[4] = v3;
    block[5] = &v34;
    block[6] = &v28;
    dispatch_sync(v5, block);
    if (*((_BYTE *)v35 + 24))
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(v3 + 160);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v7;
        _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "Attempting to submit metric for %@", buf, 0xCu);
      }
      +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", v3, *(_QWORD *)(v3 + 160));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)v29[5];
      v26 = 0;
      v10 = v9;
      v11 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      -[HDMutableDatabaseTransactionContext setCacheScope:](v11, "setCacheScope:", 1);
      if (v10)
        -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v11, "addAccessibilityAssertion:", v10);
      WeakRetained = objc_loadWeakRetained((id *)(v3 + 88));
      objc_msgSend(WeakRetained, "database");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __66___HDAWDPeriodicAction__runBlockWithAccessibilityAssertion_error___block_invoke;
      v39 = &unk_1E6CECC80;
      v40 = v3;
      v14 = objc_msgSend(v13, "performWithTransactionContext:error:block:", v11, &v26, buf);

      v15 = v26;
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_INFO))
      {
        v17 = *(_QWORD *)(v3 + 160);
        v18 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        if (v14)
          v18 = CFSTR("YES");
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2114;
        v39 = v15;
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_INFO, "%@ Submission success: %{public}@, error: %{public}@", buf, 0x20u);
      }
      v19 = v15;
      v20 = v19;
      if (v19)
        v21 = objc_retainAutorelease(v19);

      v22 = *(NSObject **)(v3 + 96);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __46___HDAWDPeriodicAction__doIfWaitingWithError___block_invoke_223;
      v39 = &unk_1E6CF1C08;
      v40 = v3;
      v41 = v14;
      dispatch_sync(v22, buf);
      objc_msgSend(v8, "invalidate");

    }
    else
    {
      v20 = 0;
    }
    v23 = *(NSObject **)(v3 + 96);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __46___HDAWDPeriodicAction__doIfWaitingWithError___block_invoke_2;
    v25[3] = &unk_1E6CECDD0;
    v25[4] = &v28;
    dispatch_sync(v23, v25);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    v20 = 0;
  }
  v24 = v20;
  v4[2](v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __46___HDAWDPeriodicAction__doIfWaitingWithError___block_invoke(_QWORD *a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E0CB52C0];
  v3 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEBUG))
  {
    v10 = a1[4];
    v11 = *(_QWORD *)(v10 + 160);
    v12 = *(_QWORD *)(v10 + 136);
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    _os_log_debug_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEBUG, "%@ Last submitted at %@", (uint8_t *)&v14, 0x16u);
  }
  v4 = a1[4];
  if (v4)
  {
    if (*(_QWORD *)(v4 + 136))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(v4 + 136));
      LOBYTE(v4) = v6 > *(double *)(v4 + 80);

    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    _HKInitializeLogging();
    v7 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEBUG))
    {
      v13 = *(_QWORD *)(a1[4] + 160);
      v14 = 138412290;
      v15 = v13;
      _os_log_debug_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEBUG, "%@ Skipping submission: last attempt was too recent", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 104));
  v8 = a1[4];
  v9 = *(void **)(v8 + 104);
  *(_QWORD *)(v8 + 104) = 0;

}

void __46___HDAWDPeriodicAction__doIfWaitingWithError___block_invoke_223(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HDAWDPeriodicAction _queue_setLastSubmissionAttemptDate:](v2, v3);

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    v5 = 0;
  }
  else
  {
    v6 = *(_QWORD *)(v4 + 128);
    if (v6 <= 1)
      v6 = 1;
    v5 = v6 - 1;
  }
  -[_HDAWDPeriodicAction _queue_setWaitingToRun:](v4, v5);
}

uint64_t __46___HDAWDPeriodicAction__doIfWaitingWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidate");
}

uint64_t __66___HDAWDPeriodicAction__runBlockWithAccessibilityAssertion_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 16))();
}

uint64_t __59___HDAWDPeriodicAction_performPeriodicActivity_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;

  if (a2)
    v2 = 0;
  else
    v2 = 2;
  return (*(uint64_t (**)(_QWORD, uint64_t, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v2, *(double *)(*(_QWORD *)(a1 + 32) + 80));
}

@end
