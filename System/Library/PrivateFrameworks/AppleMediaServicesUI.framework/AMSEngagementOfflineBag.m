@implementation AMSEngagementOfflineBag

- (AMSEngagementOfflineBag)initWithUnderlyingBag:(id)a3
{
  id v5;
  AMSEngagementOfflineBag *v6;
  AMSEngagementOfflineBag *v7;
  AMSPromise *snapshotPromise;
  AMSSnapshotBag *underlyingOfflineBag;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSEngagementOfflineBag;
  v6 = -[AMSEngagementOfflineBag init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    snapshotPromise = v6->_snapshotPromise;
    v6->_snapshotPromise = 0;

    underlyingOfflineBag = v7->_underlyingOfflineBag;
    v7->_underlyingOfflineBag = 0;

    objc_storeStrong((id *)&v7->_underlyingBag, a3);
  }

  return v7;
}

- (id)_attemptBagLoad
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];

  -[AMSEngagementOfflineBag snapshotPromise](self, "snapshotPromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BE08340]);
    -[AMSEngagementOfflineBag setSnapshotPromise:](self, "setSnapshotPromise:", v4);

    -[AMSEngagementOfflineBag underlyingBag](self, "underlyingBag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __42__AMSEngagementOfflineBag__attemptBagLoad__block_invoke;
    v7[3] = &unk_24CB4F038;
    v7[4] = self;
    objc_msgSend(v5, "createSnapshotWithCompletion:", v7);

  }
  -[AMSEngagementOfflineBag snapshotPromise](self, "snapshotPromise");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __42__AMSEngagementOfflineBag__attemptBagLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "underlyingOfflineBag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE081D8], "sharedBagConfig");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)objc_opt_class();
        v12 = v11;
        AMSLogKey();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v11;
        v28 = 2114;
        v29 = v13;
        _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to load the underlying bag. Falling back to offline bag..", (uint8_t *)&v26, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "snapshotPromise");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "underlyingOfflineBag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "finishWithResult:error:", v15, 0);

    }
    else
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_opt_class();
        v24 = v23;
        AMSLogKey();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v23;
        v28 = 2114;
        v29 = v25;
        _os_log_impl(&dword_211102000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to generate offline bag.", (uint8_t *)&v26, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "snapshotPromise");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "finishWithError:", v6);
    }

    objc_msgSend(*(id *)(a1 + 32), "setSnapshotPromise:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedBagConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_opt_class();
      v19 = v18;
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v18;
      v28 = 2114;
      v29 = v20;
      _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully snapshotted the bag. Using underlying bag..", (uint8_t *)&v26, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "snapshotPromise");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "finishWithResult:error:", v5, 0);

  }
}

- (id)_getOfflineBagData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "ams_dynamicUIDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("offline-bag"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v3, 0, &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedBagConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v9;
      v22 = 2114;
      v23 = v11;
      v24 = 2114;
      v25 = v12;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to read offline bag data. error = %{public}@", buf, 0x20u);

    }
    v13 = 0;
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class();
      v16 = v15;
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Successfully read offline bag data.", buf, 0x16u);

    }
    v13 = v4;
  }

  return v13;
}

- (id)_getSnapshotResult
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
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[AMSEngagementOfflineBag snapshotPromise](self, "snapshotPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v2, "resultWithError:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedBagConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to get snapshot result for key. error = %{public}@", buf, 0x20u);

    }
    v10 = 0;
  }
  else
  {
    v10 = v3;
  }

  return v10;
}

- (AMSSnapshotBag)underlyingOfflineBag
{
  AMSSnapshotBag *underlyingOfflineBag;
  AMSSnapshotBag *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  AMSSnapshotBag *v29;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  underlyingOfflineBag = self->_underlyingOfflineBag;
  if (underlyingOfflineBag)
    goto LABEL_2;
  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSEngagementOfflineBag _getOfflineBagData](self, "_getOfflineBagData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v9, v10, &v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v33;

  if (v12)
  {

LABEL_17:
    v3 = 0;
    return v3;
  }
  v13 = objc_alloc_init(MEMORY[0x24BE083B8]);
  objc_msgSend(v13, "setData:", v11);
  -[AMSEngagementOfflineBag expirationDate](self, "expirationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExpirationDate:", v14);

  -[AMSEngagementOfflineBag profile](self, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProfile:", v15);

  -[AMSEngagementOfflineBag profileVersion](self, "profileVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProfileVersion:", v16);

  v32 = 0;
  objc_msgSend(v13, "buildWithError:", &v32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v32;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedBagConfig");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v18)
  {
    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_opt_class();
      v31 = v22;
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v22;
      v36 = 2114;
      v37 = v23;
      v38 = 2114;
      v39 = v24;
      _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create the offline snapshot. error = %{public}@", buf, 0x20u);

    }
  }
  else
  {
    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_opt_class();
      v27 = v26;
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v26;
      v36 = 2114;
      v37 = v28;
      _os_log_impl(&dword_211102000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully created the offline snapshot.", buf, 0x16u);

    }
    v29 = v17;
    v20 = self->_underlyingOfflineBag;
    self->_underlyingOfflineBag = v29;
  }

  if (v18)
    goto LABEL_17;
  underlyingOfflineBag = self->_underlyingOfflineBag;
LABEL_2:
  v3 = underlyingOfflineBag;
  return v3;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
}

- (BOOL)isExpired
{
  void *v2;
  void *v3;
  BOOL v4;

  -[AMSEngagementOfflineBag expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "compare:", v2) == 1;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (NSString)profile
{
  void *v2;
  void *v3;

  -[AMSEngagementOfflineBag underlyingBag](self, "underlyingBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)profileVersion
{
  void *v2;
  void *v3;

  -[AMSEngagementOfflineBag underlyingBag](self, "underlyingBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AMSEngagementOfflineBag snapshotPromise](self, "snapshotPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFinished");

  if (v6)
  {
    -[AMSEngagementOfflineBag _getSnapshotResult](self, "_getSnapshotResult");
  }
  else
  {
    v7 = -[AMSEngagementOfflineBag _attemptBagLoad](self, "_attemptBagLoad");
    -[AMSEngagementOfflineBag underlyingOfflineBag](self, "underlyingOfflineBag");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AMSEngagementOfflineBag snapshotPromise](self, "snapshotPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFinished");

  if (v6)
  {
    -[AMSEngagementOfflineBag _getSnapshotResult](self, "_getSnapshotResult");
  }
  else
  {
    v7 = -[AMSEngagementOfflineBag _attemptBagLoad](self, "_attemptBagLoad");
    -[AMSEngagementOfflineBag underlyingOfflineBag](self, "underlyingOfflineBag");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "BOOLForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)doubleForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AMSEngagementOfflineBag snapshotPromise](self, "snapshotPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFinished");

  if (v6)
  {
    -[AMSEngagementOfflineBag _getSnapshotResult](self, "_getSnapshotResult");
  }
  else
  {
    v7 = -[AMSEngagementOfflineBag _attemptBagLoad](self, "_attemptBagLoad");
    -[AMSEngagementOfflineBag underlyingOfflineBag](self, "underlyingOfflineBag");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)integerForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AMSEngagementOfflineBag snapshotPromise](self, "snapshotPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFinished");

  if (v6)
  {
    -[AMSEngagementOfflineBag _getSnapshotResult](self, "_getSnapshotResult");
  }
  else
  {
    v7 = -[AMSEngagementOfflineBag _attemptBagLoad](self, "_attemptBagLoad");
    -[AMSEngagementOfflineBag underlyingOfflineBag](self, "underlyingOfflineBag");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "integerForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AMSEngagementOfflineBag snapshotPromise](self, "snapshotPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFinished");

  if (v6)
  {
    -[AMSEngagementOfflineBag _getSnapshotResult](self, "_getSnapshotResult");
  }
  else
  {
    v7 = -[AMSEngagementOfflineBag _attemptBagLoad](self, "_attemptBagLoad");
    -[AMSEngagementOfflineBag underlyingOfflineBag](self, "underlyingOfflineBag");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)URLForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AMSEngagementOfflineBag snapshotPromise](self, "snapshotPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFinished");

  if (v6)
  {
    -[AMSEngagementOfflineBag _getSnapshotResult](self, "_getSnapshotResult");
  }
  else
  {
    v7 = -[AMSEngagementOfflineBag _attemptBagLoad](self, "_attemptBagLoad");
    -[AMSEngagementOfflineBag underlyingOfflineBag](self, "underlyingOfflineBag");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)URLForKey:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[AMSEngagementOfflineBag snapshotPromise](self, "snapshotPromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFinished");

  if (v9)
  {
    -[AMSEngagementOfflineBag _getSnapshotResult](self, "_getSnapshotResult");
  }
  else
  {
    v10 = -[AMSEngagementOfflineBag _attemptBagLoad](self, "_attemptBagLoad");
    -[AMSEngagementOfflineBag underlyingOfflineBag](self, "underlyingOfflineBag");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLForKey:account:", v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AMSEngagementOfflineBag snapshotPromise](self, "snapshotPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFinished");

  if (v6)
  {
    -[AMSEngagementOfflineBag _getSnapshotResult](self, "_getSnapshotResult");
  }
  else
  {
    v7 = -[AMSEngagementOfflineBag _attemptBagLoad](self, "_attemptBagLoad");
    -[AMSEngagementOfflineBag underlyingOfflineBag](self, "underlyingOfflineBag");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AMSEngagementOfflineBag _attemptBagLoad](self, "_attemptBagLoad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__AMSEngagementOfflineBag_createSnapshotWithCompletion___block_invoke;
  v7[3] = &unk_24CB4F060;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addFinishBlock:", v7);

}

uint64_t __56__AMSEngagementOfflineBag_createSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (AMSPromise)snapshotPromise
{
  return self->_snapshotPromise;
}

- (void)setSnapshotPromise:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotPromise, a3);
}

- (AMSBagProtocol)underlyingBag
{
  return self->_underlyingBag;
}

- (void)setUnderlyingBag:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingBag, a3);
}

- (void)setUnderlyingOfflineBag:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingOfflineBag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingOfflineBag, 0);
  objc_storeStrong((id *)&self->_underlyingBag, 0);
  objc_storeStrong((id *)&self->_snapshotPromise, 0);
}

@end
