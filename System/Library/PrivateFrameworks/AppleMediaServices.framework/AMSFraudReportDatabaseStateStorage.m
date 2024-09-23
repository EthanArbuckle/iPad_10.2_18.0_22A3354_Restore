@implementation AMSFraudReportDatabaseStateStorage

- (AMSFraudReportDatabaseStateStorage)init
{
  AMSFraudReportDatabaseStateStorage *v2;
  AMSStorageDatabase *v3;
  AMSStorageDatabase *storageDatabase;
  AMSFraudReportDatabaseStateStorage *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)AMSFraudReportDatabaseStateStorage;
  v2 = -[AMSFraudReportDatabaseStateStorage init](&v12, sel_init);
  if (v2
    && (v3 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", CFSTR("AMSFraudReport")), storageDatabase = v2->_storageDatabase, v2->_storageDatabase = v3, storageDatabase, !v2->_storageDatabase))
  {
    +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
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
      AMSSetLogKeyIfNeeded();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create AMSStorageDatabase, no persistence will be available for Fraud Report.", buf, 0x16u);

    }
    v5 = 0;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (NSDate)lastCleanupDate
{
  return +[AMSDefaults lastFraudScoreStateCleanupDate](AMSDefaults, "lastFraudScoreStateCleanupDate");
}

- (void)setLastCleanupDate:(id)a3
{
  +[AMSDefaults setLastFraudScoreStateCleanupDate:](AMSDefaults, "setLastFraudScoreStateCleanupDate:", a3);
}

- (NSArray)allKeys
{
  AMSStorageDatabase *storageDatabase;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  storageDatabase = self->_storageDatabase;
  v12 = 0;
  -[AMSStorageDatabase allKeysForDomain:withError:](storageDatabase, "allKeysForDomain:withError:", CFSTR("AMSFraudReport"), &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v4)
  {
    +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
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
      v7 = (void *)objc_opt_class();
      v8 = v7;
      AMSSetLogKeyIfNeeded();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v7;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to read all keys from the Fraud Report persistent state database: %{public}@", buf, 0x20u);

    }
  }

  return (NSArray *)v3;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  AMSStorageDatabase *storageDatabase;
  BOOL v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  storageDatabase = self->_storageDatabase;
  if (v6)
  {
    v19 = 0;
    v9 = -[AMSStorageDatabase setValue:forKey:error:](storageDatabase, "setValue:forKey:error:", v6, v7, &v19);
    v10 = v19;
  }
  else
  {
    v18 = 0;
    v9 = -[AMSStorageDatabase deleteForKey:error:](storageDatabase, "deleteForKey:error:", v7, &v18);
    v10 = v18;
  }
  v11 = v10;
  if (!v9)
  {
    +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      AMSSetLogKeyIfNeeded();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v14;
      v22 = 2114;
      v23 = v16;
      v24 = 2114;
      v25 = v17;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set value to Fraud Report persistent state database: %{public}@", buf, 0x20u);

    }
  }

}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  AMSStorageDatabase *storageDatabase;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  storageDatabase = self->_storageDatabase;
  v20 = 0;
  -[AMSStorageDatabase valueForKey:error:](storageDatabase, "valueForKey:error:", v4, &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v20;
  if (!v7)
  {
    +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      AMSLogableError(v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v11;
      v23 = 2114;
      v24 = v5;
      v25 = 2114;
      v26 = v13;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve value from Fraud Report persistent state database: %{public}@", buf, 0x20u);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v7;
  }
  else
  {
    +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2114;
      v24 = v5;
      v18 = v17;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Value retrieved from Fraud Report persistent state database was not a dictionary, discarding.", buf, 0x16u);

    }
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageDatabase, 0);
}

@end
