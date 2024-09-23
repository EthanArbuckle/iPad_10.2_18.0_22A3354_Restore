@implementation AMSMetricsIdentifierCloudDataSource

+ (void)cleanupIdentifiers
{
  +[AMSMetricsIdentifierStore cleanupIdentifiers](AMSMetricsIdentifierStore, "cleanupIdentifiers");
}

+ (void)clearSyncState
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(a1, "_sharedQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AMSMetricsIdentifierCloudDataSource_clearSyncState__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_sync(v3, block);

}

void __53__AMSMetricsIdentifierCloudDataSource_clearSyncState__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_database");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v4;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Clearing identifier sync state", buf, 0x16u);

  }
  v11 = 0;
  objc_msgSend(v1, "clearIdentifierSyncStateWithError:", &v11);
  v6 = v11;
  if (v6)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to clear identifier sync state. %{public}@", buf, 0x20u);

    }
  }

}

- (void)fetchModifiedRecordsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_sharedQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__AMSMetricsIdentifierCloudDataSource_fetchModifiedRecordsWithCompletion___block_invoke;
  v7[3] = &unk_1E253DC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __74__AMSMetricsIdentifierCloudDataSource_fetchModifiedRecordsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void (*v18)(void);
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __74__AMSMetricsIdentifierCloudDataSource_fetchModifiedRecordsWithCompletion___block_invoke_2;
  v24[3] = &unk_1E2543AD8;
  v24[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v25 = v6;
  v7 = v3;
  v26 = v7;
  v23 = 0;
  objc_msgSend(v2, "enumerateUnsyncedIdentifierStoresUsingBlock:error:", v24, &v23);
  v8 = v23;
  if (v8)
  {
    v9 = v8;
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v12;
      v29 = 2114;
      v30 = v13;
      v31 = 2114;
      v32 = v9;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to enumerate unsynced identifier domains. %{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v20[0] = v5;
    v20[1] = 3221225472;
    v20[2] = __74__AMSMetricsIdentifierCloudDataSource_fetchModifiedRecordsWithCompletion___block_invoke_4;
    v20[3] = &unk_1E2543B00;
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v6;
    v22 = v7;
    v19 = 0;
    objc_msgSend(v2, "enumerateUnsyncedIdentifiersUsingBlock:error:", v20, &v19);
    v9 = v19;
    if (v9)
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = objc_opt_class();
        AMSLogKey();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v16;
        v29 = 2114;
        v30 = v17;
        v31 = 2114;
        v32 = v9;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to enumerate unsynced identifiers. %{public}@", buf, 0x20u);

      }
      v18 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      v18 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v18();

  }
}

uint64_t __74__AMSMetricsIdentifierCloudDataSource_fetchModifiedRecordsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "deleted");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "storeKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordIdentifierForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (id *)(a1 + 40);
LABEL_6:
      objc_msgSend(*v9, "addObject:", v8);
    }
  }
  else
  {
    objc_msgSend(v5, "_createRecordForIdentifierStore:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (id *)(a1 + 48);
      goto LABEL_6;
    }
  }

  return 1;
}

uint64_t __74__AMSMetricsIdentifierCloudDataSource_fetchModifiedRecordsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "deleted");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "idKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordIdentifierForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (id *)(a1 + 40);
LABEL_6:
      objc_msgSend(*v9, "addObject:", v8);
    }
  }
  else
  {
    objc_msgSend(v5, "_createRecordForIdentifier:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (id *)(a1 + 48);
      goto LABEL_6;
    }
  }

  return 1;
}

+ (void)removeAllRecords
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "_sharedQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AMSMetricsIdentifierCloudDataSource_removeAllRecords__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_sync(v3, block);

}

void __55__AMSMetricsIdentifierCloudDataSource_removeAllRecords__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_database");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v1, "OSLogObject");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_opt_class();
    AMSLogKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v3;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_18C849000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Permanently removing cross-device identifiers", buf, 0x16u);

  }
  v10 = 0;
  objc_msgSend(v0, "removeCrossDeviceIdentifiersWithError:", &v10);
  v5 = v10;
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
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to permanently remove cross-device identifiers. %{public}@", buf, 0x20u);

    }
  }

}

- (void)removeRecordWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_sharedQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__AMSMetricsIdentifierCloudDataSource_removeRecordWithIdentifier___block_invoke;
  v7[3] = &unk_1E253E2B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __66__AMSMetricsIdentifierCloudDataSource_removeRecordWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyForRecordIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Permanently removing identifier for key %{public}@", buf, 0x20u);

    }
    v14 = 0;
    objc_msgSend(v2, "permanentlyRemoveIdentifierForKey:error:", v4, &v14);
    v9 = v14;
    if (v9)
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = objc_opt_class();
        AMSLogKey();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v16 = v12;
        v17 = 2114;
        v18 = v13;
        v19 = 2114;
        v20 = v4;
        v21 = 2114;
        v22 = v9;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to permanently remove identifier for key %{public}@. %{public}@", buf, 0x2Au);

      }
    }

  }
}

- (void)saveRecord:(id)a3 isServerRecord:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_sharedQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AMSMetricsIdentifierCloudDataSource_saveRecord_isServerRecord___block_invoke;
  block[3] = &unk_1E2543B28;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

void __65__AMSMetricsIdentifierCloudDataSource_saveRecord_isServerRecord___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  objc_msgSend(v3, "_parseRecord:error:", v4, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_saveCloudObject:intoDatabase:isServerRecord:", v5, v2, *(unsigned __int8 *)(a1 + 48));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  if (v6)
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
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to add record %{public}@. %{public}@", buf, 0x2Au);

    }
  }

}

+ (id)_saveCloudObject:(id)a3 intoDatabase:(id)a4 isServerRecord:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_saveStoreInfo:intoDatabase:isServerRecord:", v8, v9, v5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "_saveIdInfo:intoDatabase:isServerRecord:", v8, v9, v5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
LABEL_7:

  return v11;
}

+ (id)_saveStoreInfo:(id)a3 intoDatabase:(id)a4 isServerRecord:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v19;
  _QWORD v20[4];
  id v21;
  BOOL v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v24 = v11;
    v25 = 2114;
    v26 = v12;
    v27 = 2114;
    v28 = v7;
    v29 = 2114;
    v30 = v13;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Maybe saving Store Info %{public}@. from cloudkit server %{public}@", buf, 0x2Au);

  }
  objc_msgSend(v7, "storeKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __82__AMSMetricsIdentifierCloudDataSource__saveStoreInfo_intoDatabase_isServerRecord___block_invoke;
  v20[3] = &unk_1E2543B50;
  v21 = v7;
  v22 = v5;
  v15 = v7;
  v16 = (id)objc_msgSend(v8, "identifierStoreForKey:updateMaybe:error:", v14, v20, &v19);
  v17 = v19;

  return v17;
}

uint64_t __82__AMSMetricsIdentifierCloudDataSource__saveStoreInfo_intoDatabase_isServerRecord___block_invoke(uint64_t a1, id *a2)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;

  v4 = *a2;
  objc_msgSend(v4, "modified");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "modified");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  if (v7 <= v10 || *(_BYTE *)(a1 + 40) && (objc_msgSend(v4, "deleted") & 1) == 0)
  {
    *a2 = objc_retainAutorelease(*(id *)(a1 + 32));
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_saveIdInfo:(id)a3 intoDatabase:(id)a4 isServerRecord:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v19;
  _QWORD v20[4];
  id v21;
  BOOL v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v24 = v11;
    v25 = 2114;
    v26 = v12;
    v27 = 2114;
    v28 = v7;
    v29 = 2114;
    v30 = v13;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Maybe saving Id Info %{public}@. from cloudkit server %{public}@", buf, 0x2Au);

  }
  objc_msgSend(v7, "idKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__AMSMetricsIdentifierCloudDataSource__saveIdInfo_intoDatabase_isServerRecord___block_invoke;
  v20[3] = &unk_1E2543B50;
  v21 = v7;
  v22 = v5;
  v15 = v7;
  v16 = (id)objc_msgSend(v8, "identifierForKey:updateMaybe:error:", v14, v20, &v19);
  v17 = v19;

  return v17;
}

BOOL __79__AMSMetricsIdentifierCloudDataSource__saveIdInfo_intoDatabase_isServerRecord___block_invoke(uint64_t a1, id *a2)
{
  id v4;
  _BOOL8 v5;

  v4 = *a2;
  v5 = +[AMSMetricsIdentifierCore _shouldReplaceInfo:withInfo:isServerRecord:](AMSMetricsIdentifierCore, "_shouldReplaceInfo:withInfo:isServerRecord:", v4, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  if (v5)
    *a2 = objc_retainAutorelease(*(id *)(a1 + 32));

  return v5;
}

- (id)_createRecordForIdentifierStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[AMSMetricsIdentifierCloudDataSource delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsIdentifierCloudDataSource delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifierStoreRecordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createRecordForKey:recordType:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    objc_msgSend(v4, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setField:forKey:", v11, CFSTR("account"));

    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "resetInterval");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setField:forKey:", v13, CFSTR("resetInterval"));

    objc_msgSend(v4, "modified");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setField:forKey:", v14, CFSTR("modified"));

    objc_msgSend(v4, "started");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setField:forKey:", v15, CFSTR("started"));

    objc_msgSend(v4, "storeUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setField:forKey:", v16, CFSTR("storeUUID"));

  }
  return v9;
}

- (id)_createRecordForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[AMSMetricsIdentifierCloudDataSource delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsIdentifierCloudDataSource delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifierRecordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createRecordForKey:recordType:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    objc_msgSend(v4, "expires");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setField:forKey:", v11, CFSTR("expires"));

    objc_msgSend(v4, "modified");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setField:forKey:", v12, CFSTR("modified"));

    objc_msgSend(v4, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setField:forKey:", v13, CFSTR("name"));

    objc_msgSend(v4, "storeUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setField:forKey:", v14, CFSTR("storeUUID"));

    objc_msgSend(v4, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setField:forKey:", v15, CFSTR("value"));

    objc_msgSend(v4, "serverProvidedAt");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setField:forKey:", v16, CFSTR("serverProvidedAt"));

  }
  return v9;
}

+ (id)_database
{
  return +[AMSMetricsIdentifierStore _database](AMSMetricsIdentifierStore, "_database");
}

- (id)_parseRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;

  v6 = a3;
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsIdentifierCloudDataSource delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyForRecordIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSMetricsIdentifierCloudDataSource delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifierStoreRecordType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqualToString:", v12);

  if (v13)
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setStoreKey:", v10);
    objc_msgSend(v14, "setCrossDeviceSync:", 1);
    objc_msgSend(v6, "fieldForKey:", CFSTR("account"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccount:", v15);

    objc_msgSend(v6, "fieldForKey:", CFSTR("resetInterval"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    objc_msgSend(v14, "setResetInterval:");

    objc_msgSend(v6, "fieldForKey:", CFSTR("started"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStarted:", v17);

    objc_msgSend(v6, "fieldForKey:", CFSTR("storeUUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStoreUUID:", v18);

    objc_msgSend(v6, "fieldForKey:", CFSTR("modified"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setModified:", v19);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLastSync:", v20);

    objc_msgSend(v14, "storeKey");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_20;
    v22 = (void *)v21;
    objc_msgSend(v14, "storeUUID");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_19;
    v24 = (void *)v23;
    objc_msgSend(v14, "account");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      objc_msgSend(v14, "modified");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
LABEL_20:
        if (*a4)
        {
          AMSError(0, CFSTR("Invalid record data"), CFSTR("Record data is not valid."), 0);
          v45 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v45 = 0;
        }
        goto LABEL_23;
      }
LABEL_13:
      v45 = v14;
LABEL_23:

      goto LABEL_24;
    }
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  -[AMSMetricsIdentifierCloudDataSource delegate](self, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "identifierRecordType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v7, "isEqualToString:", v29);

  if (v30)
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setIdKey:", v10);
    objc_msgSend(v14, "setCrossDeviceSync:", 1);
    objc_msgSend(v6, "fieldForKey:", CFSTR("expires"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setExpires:", v31);

    objc_msgSend(v6, "fieldForKey:", CFSTR("name"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setName:", v32);

    objc_msgSend(v6, "fieldForKey:", CFSTR("storeUUID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStoreUUID:", v33);

    objc_msgSend(v6, "fieldForKey:", CFSTR("value"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:", v34);

    objc_msgSend(v6, "fieldForKey:", CFSTR("modified"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setModified:", v35);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLastSync:", v36);

    objc_msgSend(v6, "fieldForKey:", CFSTR("serverProvidedAt"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setServerProvidedAt:", v37);

    objc_msgSend(v14, "idKey");
    v38 = objc_claimAutoreleasedReturnValue();
    if (!v38)
      goto LABEL_20;
    v22 = (void *)v38;
    objc_msgSend(v14, "storeUUID");
    v39 = objc_claimAutoreleasedReturnValue();
    if (!v39)
      goto LABEL_19;
    v24 = (void *)v39;
    objc_msgSend(v14, "name");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v41 = (void *)v40;
      objc_msgSend(v14, "modified");
      v42 = objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        v43 = (void *)v42;
        objc_msgSend(v14, "value");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v44)
          goto LABEL_20;
        goto LABEL_13;
      }

    }
    goto LABEL_18;
  }
  if (*a4)
  {
    AMSError(0, CFSTR("Unknown record type"), CFSTR("Record type is unrecognized."), 0);
    v45 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = 0;
  }
LABEL_24:

  return v45;
}

+ (id)_sharedQueue
{
  return +[AMSMetricsIdentifierStore _sharedQueue](AMSMetricsIdentifierStore, "_sharedQueue");
}

- (AMSMetricsIdentifierCloudDataSourceDelegate)delegate
{
  return (AMSMetricsIdentifierCloudDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
