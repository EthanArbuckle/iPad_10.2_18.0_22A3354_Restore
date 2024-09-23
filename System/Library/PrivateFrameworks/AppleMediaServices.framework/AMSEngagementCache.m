@implementation AMSEngagementCache

+ (id)sharedInstance
{
  if (qword_1ECEAD188 != -1)
    dispatch_once(&qword_1ECEAD188, &__block_literal_global_45);
  return (id)_MergedGlobals_101;
}

void __36__AMSEngagementCache_sharedInstance__block_invoke()
{
  void *v0;
  AMSEngagementCache *v1;
  void *v2;
  id v3;

  +[AMSDatabaseHelper databaseFolderNameForType:](AMSDatabaseHelper, "databaseFolderNameForType:", 3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSDatabaseHelper databaseURLForCachePath:type:](AMSDatabaseHelper, "databaseURLForCachePath:type:", v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = -[AMSEngagementCache initWithFileURL:]([AMSEngagementCache alloc], "initWithFileURL:", v0);
  v2 = (void *)_MergedGlobals_101;
  _MergedGlobals_101 = (uint64_t)v1;

}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  AMSEngagementCacheDatabase *database;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v5;
    v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Closing database", buf, 0x16u);

  }
  database = self->_database;
  v18 = 0;
  v8 = -[AMSEngagementCacheDatabase closeWithError:](database, "closeWithError:", &v18);
  v9 = v18;
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v8)
  {
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Database is closed", buf, 0x16u);
LABEL_14:

    }
  }
  else
  {
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v15;
      v21 = 2114;
      v22 = v14;
      v23 = 2114;
      v24 = v16;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to close database: %{public}@", buf, 0x20u);

      goto LABEL_14;
    }
  }

  v17.receiver = self;
  v17.super_class = (Class)AMSEngagementCache;
  -[AMSEngagementCache dealloc](&v17, sel_dealloc);
}

- (void)cacheResponse:(id)a3 filter:(id)a4 expiration:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v39 = a5;
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_opt_class();
    AMSLogKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v9);
    v15 = v9;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v44 = v12;
    v45 = 2114;
    v46 = v13;
    v47 = 2114;
    v48 = v14;
    v49 = 2114;
    v50 = v16;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Caching (response: %{public}@, filter: %{public}@)", buf, 0x2Au);

    v9 = v15;
  }

  v42 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 0, &v42);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v42;
  if (v17)
  {
    v41 = v18;
    v38 = v9;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 0, &v41);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v41;

    if (!v19)
    {
      +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v25 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v25, "OSLogObject");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v33 = objc_opt_class();
        AMSLogKey();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v20);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v33;
        v45 = 2114;
        v46 = v34;
        v47 = 2114;
        v48 = v35;
        _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode filter: %{public}@", buf, 0x20u);

      }
      goto LABEL_26;
    }
    -[AMSEngagementCache database](self, "database");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v20;
    v22 = objc_msgSend(v21, "insertResponseData:filterData:expiration:error:", v17, v19, v39, &v40);
    v23 = v40;

    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v22)
    {
      if (!v24)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v25 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v25, "OSLogObject");
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      v27 = objc_opt_class();
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v27;
      v45 = 2114;
      v46 = v28;
      _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Caching complete", buf, 0x16u);
    }
    else
    {
      if (!v24)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v25 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v25, "OSLogObject");
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      v36 = objc_opt_class();
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v23);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v36;
      v45 = 2114;
      v46 = v28;
      v47 = 2114;
      v48 = v37;
      _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to insert response: %{public}@", buf, 0x20u);

    }
LABEL_25:
    v20 = v23;
LABEL_26:

    v18 = v20;
    v9 = v38;
    goto LABEL_27;
  }
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "OSLogObject");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v29 = objc_opt_class();
    AMSLogKey();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v18);
    v31 = v9;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v44 = v29;
    v45 = 2114;
    v46 = v30;
    v47 = 2114;
    v48 = v32;
    _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode response: %{public}@", buf, 0x20u);

    v9 = v31;
  }
LABEL_27:

}

- (AMSEngagementCacheDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

- (AMSEngagementCache)initWithFileURL:(id)a3
{
  id v4;
  AMSEngagementCache *v5;
  AMSEngagementCacheDatabase *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v26;
  objc_super v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AMSEngagementCache;
  v5 = -[AMSEngagementCache init](&v27, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(AMSEngagementCacheDatabase);
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v9;
      v30 = 2114;
      v31 = v10;
      v32 = 2114;
      v33 = v12;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening database (path: %{public}@)", buf, 0x20u);

    }
    objc_msgSend(v4, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v14 = -[AMSEngagementCacheDatabase openAtPath:error:](v6, "openAtPath:error:", v13, &v26);
    v15 = v26;

    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v14)
    {
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_opt_class();
        AMSLogKey();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v19;
        v30 = 2114;
        v31 = v20;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Database is open", buf, 0x16u);

      }
      objc_storeStrong((id *)&v5->_database, v6);
    }
    else
    {
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_opt_class();
        AMSLogKey();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v15);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v22;
        v30 = 2114;
        v31 = v23;
        v32 = 2114;
        v33 = v24;
        _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to open database: %{public}@", buf, 0x20u);

      }
      v5 = 0;
    }

  }
  return v5;
}

- (id)cachedResponseForEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v31;
  _QWORD v32[5];
  id v33;
  _BYTE *v34;
  id v35;
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Collecting garbage", buf, 0x16u);

  }
  -[AMSEngagementCache database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v10 = objc_msgSend(v9, "collectGarbageWithError:", &v35);
  v11 = v35;

  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v10)
  {
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Garbage collection is complete", buf, 0x16u);

    }
  }
  else
  {
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v11);
      v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2114;
      v37 = v19;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Failed to collect garbage: %{public}@", buf, 0x20u);

    }
  }

  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v20, "OSLogObject");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_opt_class();
    AMSLogKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v4);
    v24 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2114;
    v37 = v24;
    _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching cached response (event: %{public}@)", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v37 = __Block_byref_object_copy__28;
  v38 = __Block_byref_object_dispose__28;
  v39 = 0;
  -[AMSEngagementCache database](self, "database");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __54__AMSEngagementCache_Project__cachedResponseForEvent___block_invoke;
  v32[3] = &unk_1E2541768;
  v32[4] = self;
  v27 = v4;
  v33 = v27;
  v34 = buf;
  v31 = v11;
  objc_msgSend(v25, "selectWithExpirationDate:handler:error:", v26, v32, &v31);
  v28 = v31;

  v29 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v29;
}

uint64_t __54__AMSEngagementCache_Project__cachedResponseForEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a2, 0, &v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v23;
  if (v6)
  {
    v22 = v7;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v22;

    if (v8)
    {
      if (!+[AMSEngagementAppEventFilterModel matchEvent:toFilter:](AMSEngagementAppEventFilterModel, "matchEvent:toFilter:", *(_QWORD *)(a1 + 40), v8))
      {
        v20 = 1;
        goto LABEL_16;
      }
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = v6;
      v12 = *(NSObject **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v11;
    }
    else
    {
      +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v12, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_opt_class();
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v17;
        v26 = 2114;
        v27 = v18;
        v28 = 2114;
        v29 = v19;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode filter: %{public}@", buf, 0x20u);

      }
      v8 = 0;
    }
  }
  else
  {
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v13;
      v26 = 2114;
      v27 = v14;
      v28 = 2114;
      v29 = v15;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode response: %{public}@", buf, 0x20u);

    }
    v9 = v7;
  }

  v20 = 0;
LABEL_16:

  return v20;
}

@end
