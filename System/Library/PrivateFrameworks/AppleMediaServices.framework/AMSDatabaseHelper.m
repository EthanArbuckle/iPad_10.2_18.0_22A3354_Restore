@implementation AMSDatabaseHelper

+ (id)databaseFolderNameForType:(int64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if (_MergedGlobals_94 != -1)
    dispatch_once(&_MergedGlobals_94, &__block_literal_global_35);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = (id)qword_1ECEAD088;
  objc_msgSend(v4, "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)databasePathForCachePath:(id)a3 type:(int64_t)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "databaseURLForCachePath:type:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)databaseURLForCachePath:(id)a3 type:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_cachesURLForCachePath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "_databaseNameForType:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_opt_class();
      AMSHashIfNeeded(v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2114;
      v17 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Database location = %{public}@", (uint8_t *)&v14, 0x16u);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_cachesURLForCachePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "ams_cachesDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v12 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v19);
      v13 = v19;

      if (!v12 || v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
          AMSLogableError(v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v21 = v16;
          v22 = 2114;
          v23 = v4;
          v24 = 2114;
          v25 = v17;
          _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create %{public}@ directory. Error = %{public}@", buf, 0x20u);

        }
      }

    }
    objc_msgSend(a1, "_applyProtectionClassForDirectoryAtURL:", v7);
    objc_msgSend(a1, "_addSkipBackupAttribute:forURL:", 1, v7);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)_applyProtectionClassForDirectoryAtURL:(id)a3
{
  void *v3;
  int v4;
  id v5;

  objc_msgSend(a3, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    v4 = open((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), 0x1000000);
    v3 = v5;
    if (v4)
    {
      fcntl(v4, 64, 4);
      close(v4);
      v3 = v5;
    }
  }

}

+ (id)_databaseNameForType:(int64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (qword_1ECEAD090 != -1)
    dispatch_once(&qword_1ECEAD090, &__block_literal_global_18);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = (id)qword_1ECEAD098;
  objc_msgSend(v4, "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("sqlitedb"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)_addSkipBackupAttribute:(BOOL)a3 forURL:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = objc_opt_class();
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Error excluding nil URL from backup", buf, 0xCu);
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C999D8];
  v16 = 0;
  v8 = objc_msgSend(v5, "setResourceValue:forKey:error:", v6, v7, &v16);
  v9 = v16;

  if ((v8 & 1) == 0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      AMSLogableError(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      v19 = 2114;
      v20 = v5;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Error excluding %{public}@ from backup %{public}@", buf, 0x20u);

    }
LABEL_13:

    v10 = 0;
    goto LABEL_14;
  }
  v10 = 1;
LABEL_14:

  return v10;
}

void __47__AMSDatabaseHelper_databaseFolderNameForType___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E25AF398;
  v2[1] = &unk_1E25AF3B0;
  v3[0] = CFSTR("Metrics");
  v3[1] = CFSTR("Storage");
  v2[2] = &unk_1E25AF3C8;
  v2[3] = &unk_1E25AF3E0;
  v3[2] = CFSTR("Accounts");
  v3[3] = CFSTR("Engagement");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD088;
  qword_1ECEAD088 = v0;

}

void __42__AMSDatabaseHelper__databaseNameForType___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E25AF398;
  v2[1] = &unk_1E25AF3B0;
  v3[0] = CFSTR("metrics");
  v3[1] = CFSTR("storage");
  v2[2] = &unk_1E25AF3C8;
  v2[3] = &unk_1E25AF3E0;
  v3[2] = CFSTR("cookies");
  v3[3] = CFSTR("engagement");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD098;
  qword_1ECEAD098 = v0;

}

+ (id)databasePathForDataVaultPath:(id)a3 type:(int64_t)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "databaseURLForDataVaultPath:type:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)databaseURLForDataVaultPath:(id)a3 type:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataVaultURLForDataVaultPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "_databaseNameForType:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_opt_class();
      AMSHashIfNeeded(v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2114;
      v17 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Database location = %{public}@", (uint8_t *)&v14, 0x16u);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)dataVaultURLForDataVaultPath:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_opt_class();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v8;
    v30 = 2114;
    v31 = v10;
    v32 = 2114;
    v33 = v11;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ | dataVaultPath = %{public}@", buf, 0x20u);

  }
  v12 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
  v13 = (void *)MEMORY[0x1E0C99E98];
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "ams_dataVaultDirectory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_7;
LABEL_15:
    v25 = 0;
    goto LABEL_16;
  }
  NSTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_15;
LABEL_7:
  objc_msgSend(v15, "URLByAppendingPathComponent:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v18 = objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v27);
  v19 = v27;

  if ((v18 & 1) == 0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      AMSHashIfNeeded(v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v22;
      v30 = 2114;
      v31 = v23;
      v32 = 2114;
      v33 = v24;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create %{public}@ directory in data vault. error = %{public}@", buf, 0x20u);

    }
  }
  objc_msgSend(a1, "_addSkipBackupAttribute:forURL:", 1, v16);
  v25 = v16;

LABEL_16:
  return v25;
}

+ (BOOL)removeDatabaseForCachePath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_cachesURLForCachePath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_opt_class();
      AMSHashIfNeeded(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_INFO, "%{public}@: Removing database at cache URL: %{public}@.", (uint8_t *)&v14, 0x16u);

    }
    v11 = +[AMSDatabaseHelper removeDatabaseAtURL:](AMSDatabaseHelper, "removeDatabaseAtURL:", v5);
  }
  else
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543618;
      v15 = objc_opt_class();
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove database at path: %{public}@. Unable to determine the URL.", (uint8_t *)&v14, 0x16u);
    }

    v11 = 0;
  }

  return v11;
}

+ (BOOL)removeDatabaseForDataVaultPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "dataVaultURLForDataVaultPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_opt_class();
      AMSHashIfNeeded(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_INFO, "%{public}@: Removing database at data vault URL: %{public}@.", (uint8_t *)&v16, 0x16u);

    }
    v11 = +[AMSDatabaseHelper removeDatabaseAtURL:](AMSDatabaseHelper, "removeDatabaseAtURL:", v5);
  }
  else
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      AMSHashIfNeeded(v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove database at data vault path: %{public}@. Unable to determine the URL.", (uint8_t *)&v16, 0x16u);

    }
    v11 = 0;
  }

  return v11;
}

+ (BOOL)removeDatabaseAtURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v16);
  v6 = v16;

  if (v6)
    v7 = 0;
  else
    v7 = v5;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_opt_class();
      AMSHashIfNeeded(v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v11;
      v19 = 2114;
      v20 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_INFO, "%{public}@: Successfully removed database at URL: %{public}@.", buf, 0x16u);
LABEL_13:

    }
  }
  else
  {
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      AMSHashIfNeeded(v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      v19 = 2114;
      v20 = v12;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove database at URL: %{public}@. Error = %{public}@", buf, 0x20u);

      goto LABEL_13;
    }
  }

  return v7;
}

@end
