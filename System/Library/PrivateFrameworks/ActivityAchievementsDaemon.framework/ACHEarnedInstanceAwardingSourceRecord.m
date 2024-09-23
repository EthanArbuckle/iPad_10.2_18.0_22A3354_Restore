@implementation ACHEarnedInstanceAwardingSourceRecord

- (ACHEarnedInstanceAwardingSourceRecord)initWithSource:(id)a3 earnedInstanceStore:(id)a4 dataStore:(id)a5 registrationDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ACHEarnedInstanceAwardingSourceRecord *v15;
  ACHEarnedInstanceAwardingSourceRecord *v16;
  uint64_t v17;
  OS_dispatch_queue *internalQueue;
  NSOperationQueue *v19;
  NSOperationQueue *operationQueue;
  void *v21;
  id WeakRetained;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ACHEarnedInstanceAwardingSourceRecord;
  v15 = -[ACHEarnedInstanceAwardingSourceRecord init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_source, a3);
    objc_storeWeak((id *)&v16->_earnedInstanceStore, v12);
    objc_storeWeak((id *)&v16->_dataStore, v13);
    objc_storeStrong((id *)&v16->_registrationDate, a6);
    HKCreateSerialDispatchQueue();
    v17 = objc_claimAutoreleasedReturnValue();
    internalQueue = v16->_internalQueue;
    v16->_internalQueue = (OS_dispatch_queue *)v17;

    v19 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v19;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v16->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    HKCreateSerialDispatchQueue();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setUnderlyingQueue:](v16->_operationQueue, "setUnderlyingQueue:", v21);

    -[NSOperationQueue setQualityOfService:](v16->_operationQueue, "setQualityOfService:", 17);
    WeakRetained = objc_loadWeakRetained((id *)&v16->_dataStore);
    objc_msgSend(WeakRetained, "addPropertyProvider:", v16);

  }
  return v16;
}

- (void)cancelAllEvaluationOperations
{
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
}

- (NSDateInterval)lastCompletedEvaluationInterval
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__ACHEarnedInstanceAwardingSourceRecord_lastCompletedEvaluationInterval__block_invoke;
  v5[3] = &unk_24D13AC40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDateInterval *)v3;
}

void __72__ACHEarnedInstanceAwardingSourceRecord_lastCompletedEvaluationInterval__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (NSDateInterval)lastScheduledEvaluationInterval
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__ACHEarnedInstanceAwardingSourceRecord_lastScheduledEvaluationInterval__block_invoke;
  v5[3] = &unk_24D13AC40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDateInterval *)v3;
}

void __72__ACHEarnedInstanceAwardingSourceRecord_lastScheduledEvaluationInterval__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)addEvaluationOperationWithDateInterval:(id)a3 evaluationBlock:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;

  v8 = a4;
  v9 = a5;
  internalQueue = self->_internalQueue;
  v11 = a3;
  dispatch_assert_queue_not_V2(internalQueue);
  ACHEvaluationDateIntervalFor(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke;
  block[3] = &unk_24D13BBA8;
  block[4] = self;
  v18 = v12;
  v19 = v8;
  v20 = v9;
  v14 = v9;
  v15 = v8;
  v16 = v12;
  dispatch_sync(v13, block);

}

void __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ACHLogAwardScheduling();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "uniqueName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    v18 = 2114;
    v19 = v2;
    _os_log_impl(&dword_21407B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling evaluation operation, dateInterval=%@, identifier=%{public}@", buf, 0x20u);

  }
  v6 = (void *)MEMORY[0x24BDD1478];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_194;
  v9[3] = &unk_24D13BB80;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v2;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  v7 = v2;
  objc_msgSend(v6, "blockOperationWithBlock:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addOperation:", v8);

}

void __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_194(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id WeakRetained;
  char v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  char v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  _QWORD *v46;
  char v47;
  id v48;
  _QWORD block[4];
  id v50;
  id v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD v54[5];
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__12;
  v54[4] = __Block_byref_object_dispose__12;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "uniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("com.apple.activityawardsd.evaluation."), "stringByAppendingString:", v2);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  v55 = (id)os_transaction_create();

  ACHLogAwardScheduling();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "uniqueName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v57 = v5;
    v58 = 2114;
    v59 = v6;
    _os_log_impl(&dword_21407B000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Executing evaluation operation with identifier %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 56);
  v53 = 0;
  (*(void (**)(void))(v8 + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v7);
  v13 = v12;

  if (!v10)
  {
    ACHLogAwardScheduling();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "uniqueName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 138543874;
      v57 = v19;
      v58 = 2048;
      v59 = v20;
      v60 = 2048;
      v61 = v13;
      _os_log_impl(&dword_21407B000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Source returned %ld earned instances in %lf seconds; saving...",
        buf,
        0x20u);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      v48 = 0;
      v22 = objc_msgSend(WeakRetained, "addEarnedInstances:error:", v9, &v48);
      v23 = v48;

    }
    else
    {
      v23 = 0;
      v22 = 1;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSinceDate:", v17);
    v26 = v25;

    ACHLogAwardScheduling();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v22;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "uniqueName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v29;
      v58 = 2048;
      v59 = v26;
      _os_log_impl(&dword_21407B000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saved earned instances in %lf seconds", buf, 0x16u);

      v22 = v28;
    }

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "timeIntervalSinceDate:", v7);
    v32 = v31;

    ACHLogAwardScheduling();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v22;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "uniqueName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v57 = v35;
      v58 = 2114;
      v59 = v36;
      v60 = 2048;
      v61 = v32;
      _os_log_impl(&dword_21407B000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed evaluation operation with identifier %{public}@ in %lf seconds", buf, 0x20u);

      v22 = v34;
    }

    v37 = *(_QWORD *)(a1 + 32);
    v38 = *(NSObject **)(v37 + 32);
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_199;
    v41[3] = &unk_24D13BB58;
    v47 = v22;
    v42 = v23;
    v43 = v37;
    v44 = *(id *)(a1 + 48);
    v45 = *(id *)(a1 + 64);
    v46 = v54;
    v39 = v23;
    dispatch_async(v38, v41);

    goto LABEL_18;
  }
  ACHLogAwardScheduling();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "uniqueName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v40;
    v58 = 2048;
    v59 = (uint64_t)v13;
    v60 = 2112;
    v61 = v10;
    _os_log_error_impl(&dword_21407B000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Source failed in %lf seconds with error: %@", buf, 0x20u);

  }
  v15 = *(void **)(a1 + 64);
  if (v15)
  {
    dispatch_get_global_queue(21, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_198;
    block[3] = &unk_24D13BB08;
    v51 = v15;
    v50 = v10;
    v52 = v54;
    dispatch_async(v16, block);

    v17 = v51;
LABEL_18:

  }
  _Block_object_dispose(v54, 8);

}

void __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_198(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_199(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  char v12;

  if (*(_BYTE *)(a1 + 72) && !*(_QWORD *)(a1 + 32))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 48), *(id *)(a1 + 48));
  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    dispatch_get_global_queue(21, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_2;
    v8[3] = &unk_24D13BB30;
    v10 = v2;
    v12 = *(_BYTE *)(a1 + 72);
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 64);
    v9 = v4;
    v11 = v5;
    dispatch_async(v3, v8);

  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
}

void __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)addEvaluationOperationWithDateInterval:(id)a3 databaseContext:(id)a4 evaluationBlock:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *internalQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  ACHEvaluationDateIntervalFor(a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke;
  block[3] = &unk_24D13BC48;
  block[4] = self;
  v20 = v13;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  v18 = v13;
  dispatch_async(internalQueue, block);

}

void __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ACHLogAwardScheduling();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    *(_DWORD *)buf = 138543874;
    v22 = v5;
    v23 = 2112;
    v24 = v4;
    v25 = 2114;
    v26 = v2;
    _os_log_impl(&dword_21407B000, v3, OS_LOG_TYPE_DEFAULT, "Scheduling evaluation operation, source=%{public}@, dateInterval=%@, identifier=%{public}@", buf, 0x20u);
  }

  v6 = (void *)MEMORY[0x24BDD1478];
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke_200;
  v14 = &unk_24D13BC20;
  v15 = v2;
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 32);
  v19 = v7;
  v16 = v8;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 40);
  v20 = *(id *)(a1 + 64);
  v9 = v2;
  objc_msgSend(v6, "blockOperationWithBlock:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addOperation:", v10, v11, v12, v13, v14);

}

void __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke_200(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id WeakRetained;
  uint64_t v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  char v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  ACHLogAwardScheduling();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v31 = v3;
    _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "Executing evaluation operation with identifier %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v4);
  v8 = v7;

  ACHLogAwardScheduling();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134218240;
    v31 = v10;
    v32 = 2048;
    v33 = v8;
    _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Source returned %ld earned instances in %lf seconds", buf, 0x16u);
  }

  if (objc_msgSend(v5, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    v12 = *(_QWORD *)(a1 + 48);
    v29 = 0;
    v13 = objc_msgSend(WeakRetained, "addEarnedInstances:databaseContext:error:", v5, v12, &v29);
    v14 = v29;

  }
  else
  {
    v14 = 0;
    v13 = 1;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v4);
  v17 = v16;

  ACHLogAwardScheduling();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v31 = v19;
    v32 = 2048;
    v33 = v17;
    _os_log_impl(&dword_21407B000, v18, OS_LOG_TYPE_DEFAULT, "Completed evaluation operation with identifier %{public}@ in %lf seconds", buf, 0x16u);
  }

  v20 = *(_QWORD *)(a1 + 40);
  v21 = *(NSObject **)(v20 + 32);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke_201;
  v23[3] = &unk_24D13BBF8;
  v28 = v13;
  v24 = v14;
  v25 = v20;
  v26 = *(id *)(a1 + 56);
  v27 = *(id *)(a1 + 72);
  v22 = v14;
  dispatch_async(v21, v23);

}

void __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke_201(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  if (*(_BYTE *)(a1 + 64) && !*(_QWORD *)(a1 + 32))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 48), *(id *)(a1 + 48));
  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    dispatch_get_global_queue(21, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke_2;
    block[3] = &unk_24D13BBD0;
    v6 = v2;
    v7 = *(_BYTE *)(a1 + 64);
    v5 = *(id *)(a1 + 32);
    dispatch_async(v3, block);

  }
}

uint64_t __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (NSString)uniqueName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[ACHEarnedInstanceAwarding uniqueName](self->_source, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-SourceRecord"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSArray)dataStorePropertyKeys
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("LastCompletedEvaluationStart");
  v3[1] = CFSTR("LastCompletedEvaluationEnd");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)dataStoreProperties
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__ACHEarnedInstanceAwardingSourceRecord_dataStoreProperties__block_invoke;
  v5[3] = &unk_24D13ACE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __60__ACHEarnedInstanceAwardingSourceRecord_dataStoreProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    v14[0] = CFSTR("LastCompletedEvaluationStart");
    v3 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v2, "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("LastCompletedEvaluationEnd");
    v15[0] = v5;
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = MEMORY[0x24BDBD1B8];

  }
}

- (void)setDataStoreProperties:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[4];
  id v8;
  ACHEarnedInstanceAwardingSourceRecord *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__ACHEarnedInstanceAwardingSourceRecord_setDataStoreProperties___block_invoke;
  block[3] = &unk_24D13A360;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

void __64__ACHEarnedInstanceAwardingSourceRecord_setDataStoreProperties___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("LastCompletedEvaluationStart"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("LastCompletedEvaluationEnd"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v4 = v3;
  objc_msgSend(v2, "doubleValue");
  if (v4 > 0.0)
  {
    v6 = v5;
    if (v5 > 0.0)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v7, v8);
      ACHEvaluationDateIntervalFor(v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(void **)(v11 + 48);
      *(_QWORD *)(v11 + 48) = v10;

    }
  }

}

- (void)dataStoreDidClearAllProperties:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__ACHEarnedInstanceAwardingSourceRecord_dataStoreDidClearAllProperties_completion___block_invoke;
  v8[3] = &unk_24D13BC70;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(internalQueue, v8);

}

uint64_t __83__ACHEarnedInstanceAwardingSourceRecord_dataStoreDidClearAllProperties_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ACHEarnedInstanceAwardingSourceRecord;
  -[ACHEarnedInstanceAwardingSourceRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHEarnedInstanceAwarding uniqueName](self->_source, "uniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <\n            uniqueName:\"%@\"\n            registrationDate:\"%@\"\n            lastScheduledEvaluationInterval:\"%@\"\n            lastCompletedEvaluationInterval:\"%@\"\n            >"), v4, v5, self->_registrationDate, self->_lastScheduledEvaluationInterval, self->_lastCompletedEvaluationInterval);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (ACHEarnedInstanceAwarding)source
{
  return self->_source;
}

- (NSDate)registrationDate
{
  return self->_registrationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationDate, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_lastCompletedEvaluationInterval, 0);
  objc_storeStrong((id *)&self->_lastScheduledEvaluationInterval, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_earnedInstanceStore);
  objc_destroyWeak((id *)&self->_dataStore);
}

@end
