@implementation AMSMetricsDatabaseDataSource

- (void)didFinishBatching
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;

  -[AMSMetricsDatabaseDataSource queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__AMSMetricsDatabaseDataSource_didFinishBatching__block_invoke;
  v8[3] = &unk_1E253DBD8;
  v8[4] = self;
  v5 = v8;
  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_4;
  block[3] = &unk_1E253DC28;
  v10 = v6;
  v11 = v5;
  v7 = v6;
  dispatch_async(v3, block);

}

- (AMSMetricsDatabaseDataSource)initWithContainerIdentifier:(id)a3
{
  id v5;
  AMSMetricsDatabaseDataSource *v6;
  AMSMetricsDatabaseDataSource *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSMetricsDatabaseDataSource;
  v6 = -[AMSMetricsDatabaseDataSource init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_containerIdentifier, a3);
    v8 = dispatch_queue_create("com.apple.AMSMetricsDatabaseDataSource", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (AMSMetricsDatabase)database
{
  NSObject *v3;
  AMSMetricsDatabase *database;
  void *v5;
  AMSMetricsDatabase *v6;
  AMSMetricsDatabase *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AMSMetricsDatabaseDataSource queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  database = self->_database;
  if (!database)
  {
    -[AMSMetricsDatabaseDataSource containerIdentifier](self, "containerIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetricsDatabase sharedDatabaseWithContainerId:](AMSMetricsDatabase, "sharedDatabaseWithContainerId:", v5);
    v6 = (AMSMetricsDatabase *)objc_claimAutoreleasedReturnValue();
    v7 = self->_database;
    self->_database = v6;

    database = self->_database;
    if (!database)
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_opt_class();
        AMSLogKey();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v10;
        v15 = 2114;
        v16 = v11;
        _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to initialize metrics database", (uint8_t *)&v13, 0x16u);

      }
      database = self->_database;
    }
  }
  return database;
}

- (id)enqueueEvents:(id)a3
{
  id v4;
  AMSMutableBinaryPromise *v5;
  NSObject *v6;
  uint64_t v7;
  AMSMutableBinaryPromise *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  id v12;
  AMSMutableBinaryPromise *v13;
  AMSMutableBinaryPromise *v14;
  _QWORD v16[4];
  id v17;
  AMSMetricsDatabaseDataSource *v18;
  AMSMutableBinaryPromise *v19;
  _QWORD block[4];
  id v21;
  id v22;

  v4 = a3;
  v5 = objc_alloc_init(AMSMutableBinaryPromise);
  -[AMSMetricsDatabaseDataSource queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__AMSMetricsDatabaseDataSource_enqueueEvents___block_invoke;
  v16[3] = &unk_1E25414B8;
  v17 = v4;
  v18 = self;
  v8 = v5;
  v19 = v8;
  v9 = v16;
  v10 = v4;
  AMSLogKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_4;
  block[3] = &unk_1E253DC28;
  v21 = v11;
  v22 = v9;
  v12 = v11;
  dispatch_async(v6, block);

  v13 = v19;
  v14 = v8;

  return v14;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

void __68__AMSMetricsDatabaseDataSource_enumerateSortedEventsForTopic_block___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentLockKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__AMSMetricsDatabaseDataSource_enumerateSortedEventsForTopic_block___block_invoke_2;
  v5[3] = &unk_1E2543740;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "enumerateEventsWithTopic:lockKey:objectBlock:", v3, v4, v5);

}

void __46__AMSMetricsDatabaseDataSource_enqueueEvents___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1[4], "count"))
    goto LABEL_8;
  +[AMSMetricsMemoryDataSource batchesFromEvents:](AMSMetricsMemoryDataSource, "batchesFromEvents:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "insertEvents:error:", v2, &v10);
  v4 = v10;

  if (v4)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to insert events. Error = %{public}@", buf, 0x20u);

    }
    objc_msgSend(a1[6], "finishWithError:", v4);

  }
  else
  {
LABEL_8:
    objc_msgSend(a1[6], "finishWithSuccess");
  }
}

uint64_t __68__AMSMetricsDatabaseDataSource_enumerateSortedEventsForTopic_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AMSMetricsDatabaseDataSource;
  -[AMSMetricsDatabaseDataSource dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentLockKey, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)enumerateSortedEventsForTopic:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[AMSMetricsDatabaseDataSource queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__AMSMetricsDatabaseDataSource_enumerateSortedEventsForTopic_block___block_invoke;
  v15[3] = &unk_1E253F738;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  v11 = v7;
  v12 = v6;
  AMSLogKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke_1;
  block[3] = &unk_1E253DC28;
  v19 = v13;
  v20 = v10;
  v14 = v13;
  dispatch_sync(v8, block);

}

- (BOOL)willStartBatchingWithLogKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD block[4];
  id v23;
  id v24;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__44;
  v20 = __Block_byref_object_dispose__44;
  v21 = 0;
  -[AMSMetricsDatabaseDataSource queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__AMSMetricsDatabaseDataSource_willStartBatchingWithLogKey_error___block_invoke;
  v15[3] = &unk_1E2542338;
  v15[4] = self;
  v15[5] = &v16;
  v9 = v15;
  v10 = v7;
  AMSLogKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke_1;
  block[3] = &unk_1E253DC28;
  v23 = v11;
  v24 = v9;
  v12 = v11;
  dispatch_sync(v10, block);

  v13 = (void *)v17[5];
  if (a4 && v13)
    *a4 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v16, 8);

  return v13 == 0;
}

- (BOOL)removeEvents:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD block[4];
  id v26;
  id v27;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__44;
  v23 = __Block_byref_object_dispose__44;
  v24 = 0;
  -[AMSMetricsDatabaseDataSource queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__AMSMetricsDatabaseDataSource_removeEvents_error___block_invoke;
  v16[3] = &unk_1E25436C8;
  v16[4] = self;
  v9 = v6;
  v17 = v9;
  v18 = &v19;
  v10 = v16;
  v11 = v7;
  AMSLogKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke_1;
  block[3] = &unk_1E253DC28;
  v26 = v12;
  v27 = v10;
  v13 = v12;
  dispatch_sync(v11, block);

  v14 = (void *)v20[5];
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  _Block_object_dispose(&v19, 8);
  return v14 == 0;
}

void __51__AMSMetricsDatabaseDataSource_removeEvents_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "dropEvents:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);

}

void __66__AMSMetricsDatabaseDataSource_willStartBatchingWithLogKey_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "lockAllEventsWithError:", &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentLockKey:", v4);

}

uint64_t __49__AMSMetricsDatabaseDataSource_didFinishBatching__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentLockKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentLockKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v3, "unlockAllEventsWithKey:error:", v4, &v12);
    v5 = v12;

    if (v5)
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "OSLogObject");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)objc_opt_class();
        v9 = v8;
        AMSLogKey();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v14 = v8;
        v15 = 2114;
        v16 = v10;
        v17 = 2114;
        v18 = v5;
        _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error unlocking event. Error = %{public}@", buf, 0x20u);

      }
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentLockKey:", 0);
}

- (NSString)currentLockKey
{
  return self->_currentLockKey;
}

- (void)setCurrentLockKey:(id)a3
{
  objc_storeStrong((id *)&self->_currentLockKey, a3);
}

- (int64_t)eventCount
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  void *v7;
  id v8;
  int64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;
  id v18;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[AMSMetricsDatabaseDataSource queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__AMSMetricsDatabaseDataSource_eventCount__block_invoke;
  v11[3] = &unk_1E253E378;
  v11[4] = self;
  v11[5] = &v12;
  v5 = v11;
  v6 = v3;
  AMSLogKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke_1;
  block[3] = &unk_1E253DC28;
  v17 = v7;
  v18 = v5;
  v8 = v7;
  dispatch_sync(v6, block);

  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __42__AMSMetricsDatabaseDataSource_eventCount__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v3 = objc_msgSend(v2, "countAllEventsWithLockKey:error:", 0, &v10);
  v4 = v10;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

  if (v4)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to count events. Error = %{public}@", buf, 0x20u);

    }
  }

}

- (void)removeAllEvents
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;

  -[AMSMetricsDatabaseDataSource queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__AMSMetricsDatabaseDataSource_removeAllEvents__block_invoke;
  v8[3] = &unk_1E253DBD8;
  v8[4] = self;
  v5 = v8;
  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_4;
  block[3] = &unk_1E253DC28;
  v10 = v6;
  v11 = v5;
  v7 = v6;
  dispatch_async(v3, block);

}

void __47__AMSMetricsDatabaseDataSource_removeAllEvents__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "database");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v1, "dropAllEventsWithLockKey:error:", 0, &v8);
  v2 = v8;

  if (v2)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "OSLogObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_opt_class();
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v10 = v5;
      v11 = 2114;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to drop events. Error = %{public}@", buf, 0x20u);

    }
  }

}

- (BOOL)skipEvents:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD block[4];
  id v26;
  id v27;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__44;
  v23 = __Block_byref_object_dispose__44;
  v24 = 0;
  -[AMSMetricsDatabaseDataSource queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__AMSMetricsDatabaseDataSource_skipEvents_error___block_invoke;
  v16[3] = &unk_1E25436C8;
  v16[4] = self;
  v9 = v6;
  v17 = v9;
  v18 = &v19;
  v10 = v16;
  v11 = v7;
  AMSLogKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke_1;
  block[3] = &unk_1E253DC28;
  v26 = v12;
  v27 = v10;
  v13 = v12;
  dispatch_sync(v11, block);

  v14 = (void *)v20[5];
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  _Block_object_dispose(&v19, 8);
  return v14 == 0;
}

void __49__AMSMetricsDatabaseDataSource_skipEvents_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "unlockEvents:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);

}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

@end
