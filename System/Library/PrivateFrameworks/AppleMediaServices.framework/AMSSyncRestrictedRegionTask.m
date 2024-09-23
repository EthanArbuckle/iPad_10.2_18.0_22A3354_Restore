@implementation AMSSyncRestrictedRegionTask

- (AMSSyncRestrictedRegionTask)initWithAccount:(id)a3
{
  return -[AMSSyncRestrictedRegionTask initWithAccount:bag:](self, "initWithAccount:bag:", a3, 0);
}

- (AMSSyncRestrictedRegionTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSSyncRestrictedRegionTask *v9;
  AMSSyncRestrictedRegionTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSSyncRestrictedRegionTask;
  v9 = -[AMSTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_3_6 != -1)
    dispatch_once(&_MergedGlobals_3_6, &__block_literal_global_123);
  return (NSString *)(id)qword_1ECEACD10;
}

void __44__AMSSyncRestrictedRegionTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACD10;
  qword_1ECEACD10 = (uint64_t)CFSTR("Accounts");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACD18 != -1)
    dispatch_once(&qword_1ECEACD18, &__block_literal_global_2_5);
  return (NSString *)(id)qword_1ECEACD20;
}

void __51__AMSSyncRestrictedRegionTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACD20;
  qword_1ECEACD20 = (uint64_t)CFSTR("1");

}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)performSync
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__AMSSyncRestrictedRegionTask_performSync__block_invoke;
  v3[3] = &unk_1E253DB80;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __42__AMSSyncRestrictedRegionTask_performSync__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  _QWORD v47[4];
  id v48;
  uint64_t v49;
  id v50[2];
  double v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  unint64_t v57;
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  unint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[AMSSyncRestrictedRegionTask createBagForSubProfile](AMSSyncRestrictedRegionTask, "createBagForSubProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setBag:", v4);

  }
  v5 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "durationOfSyncRestrictedRegionValueFromBag:", v6);
  v8 = v7;

  if (*(double *)&v8 != -1.0)
  {
    v51 = 0.0;
    v16 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = objc_msgSend(v16, "hasCachedRestrictedRegionsValueFromAccount:cachedTimestamp:", v17, &v51);

    if ((_DWORD)v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "systemUptime");
      v20 = v19;

      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v53 = v23;
        v54 = 2114;
        v55 = v2;
        v56 = 2048;
        v57 = (unint64_t)v51;
        v58 = 2048;
        v59 = (unint64_t)*(double *)&v8;
        v60 = 2048;
        v61 = (unint64_t)v20;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Has cached value, last timestamp = %lu, sync duration = %lu, current timestamp = %lu", buf, 0x34u);
      }

      if ((objc_msgSend((id)objc_opt_class(), "didExceededSyncDuration:lastTimestamp:currentTimestamp:", *(double *)&v8, v51, v20) & 1) == 0)
      {
        +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v24, "OSLogObject");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = objc_opt_class();
          objc_msgSend(*(id *)(a1 + 32), "account");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v53 = v26;
          v54 = 2114;
          v55 = v2;
          v56 = 2114;
          v57 = (unint64_t)v28;
          _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Not exceeded sync duration, cancelling sync task for the account = %{public}@", buf, 0x20u);

        }
        AMSError(6, CFSTR("AMSSyncRestrictedRegionTask Error"), CFSTR("Not exceeded sync duration, cancelling sync task for the account"), 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v29);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "OSLogObject");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = objc_opt_class();
        objc_msgSend(*(id *)(a1 + 32), "account");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v53 = v32;
        v54 = 2114;
        v55 = v2;
        v56 = 2114;
        v57 = (unint64_t)v34;
        _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No cached value was found for the account = %{public}@", buf, 0x20u);

      }
    }
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v35)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v35, "OSLogObject");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "account");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v37;
      v54 = 2114;
      v55 = v2;
      v56 = 2114;
      v57 = (unint64_t)v39;
      _os_log_impl(&dword_18C849000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cached value expired, starting sync task for the account = %{public}@", buf, 0x20u);

    }
    v40 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "createSyncAccountFlagsTaskForAccount:bag:", v41, v42);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    objc_msgSend(v29, "performSync");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __42__AMSSyncRestrictedRegionTask_performSync__block_invoke_15;
    v47[3] = &unk_1E25461A8;
    objc_copyWeak(v50, (id *)buf);
    v44 = v2;
    v50[1] = v8;
    v45 = *(_QWORD *)(a1 + 32);
    v48 = v44;
    v49 = v45;
    objc_msgSend(v43, "thenWithBlock:", v47);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(v50);
    objc_destroyWeak((id *)buf);
    goto LABEL_30;
  }
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    v11 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v53 = v11;
    v54 = 2114;
    v55 = v2;
    v56 = 2114;
    v57 = (unint64_t)v13;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Got an invalid sync duration value from the bag for the account = %{public}@", buf, 0x20u);

  }
  AMSError(200, CFSTR("AMSSyncRestrictedRegionTask Error"), CFSTR("Got an invalid sync duration value from the bag"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_31:
  return v15;
}

id __42__AMSSyncRestrictedRegionTask_performSync__block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  unint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagIsInRestrictedRegion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v8 = objc_msgSend(v7, "BOOLValue");
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemUptime");
  v11 = v10;

  v12 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v12, "cacheRestrictedRegionSyncTimestamp:", v11);

  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_loadWeakRetained((id *)(a1 + 48));
    v16 = objc_opt_class();
    v17 = CFSTR("NO");
    v18 = *(_QWORD *)(a1 + 32);
    v19 = (unint64_t)*(double *)(a1 + 56);
    if ((_DWORD)v8)
      v17 = CFSTR("YES");
    *(_DWORD *)buf = 138544386;
    v34 = v16;
    v35 = 2114;
    v36 = v18;
    v37 = 2114;
    v38 = v17;
    v39 = 2048;
    v40 = (unint64_t)v11;
    v41 = 2048;
    v42 = v19;
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updated isInRestrictedRegion value = %{public}@, current timestamp=%lu, sync duration = %lu", buf, 0x34u);

  }
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v21, "account");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ams_saveAccount:verifyCredentials:", v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __42__AMSSyncRestrictedRegionTask_performSync__block_invoke_22;
  v29[3] = &unk_1E253D7B8;
  objc_copyWeak(&v32, (id *)(a1 + 48));
  v24 = *(id *)(a1 + 32);
  v25 = *(_QWORD *)(a1 + 40);
  v30 = v24;
  v31 = v25;
  objc_msgSend(v23, "addErrorBlock:", v29);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v32);
  return v27;
}

void __42__AMSSyncRestrictedRegionTask_performSync__block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedAccountsMultiUserConfig](AMSLogConfig, "sharedAccountsMultiUserConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v7 = objc_opt_class();
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to save cached value for the account = %{public}@. error = %{public}@", (uint8_t *)&v12, 0x2Au);

  }
}

- (void)cacheRestrictedRegionSyncTimestamp:(double)a3
{
  void *v4;
  id v5;

  -[AMSSyncRestrictedRegionTask account](self, "account");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_setLastRestrictedRegionSyncTimestamp:", v4);

}

+ (BOOL)didExceededSyncDuration:(double)a3 lastTimestamp:(double)a4 currentTimestamp:(double)a5
{
  return a5 - a4 >= a3 && a3 >= 1.0;
}

+ (BOOL)hasCachedRestrictedRegionsValueFromAccount:(id)a3 cachedTimestamp:(double *)a4
{
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;

  objc_msgSend(a3, "ams_lastRestrictedRegionSyncTimestamp");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a4 && v5)
  {
    v7 = objc_opt_respondsToSelector();
    v8 = 0;
    if ((v7 & 1) != 0)
      objc_msgSend(v6, "doubleValue", 0.0);
    *(_QWORD *)a4 = v8;
  }

  return v6 != 0;
}

+ (double)durationOfSyncRestrictedRegionValueFromBag:(id)a3
{
  id v3;
  double v4;
  double v5;

  v3 = a3;
  v4 = -1.0;
  if (objc_msgSend((id)objc_opt_class(), "storefrontContainsRestrictedRegionsValueFromBag:", v3))
  {
    objc_msgSend((id)objc_opt_class(), "checkRestrictedRegionDurationValueFromBag:", v3);
    if (v5 >= 1.0)
      v4 = v5;
    else
      v4 = -1.0;
  }

  return v4;
}

+ (BOOL)storefrontContainsRestrictedRegionsValueFromBag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "BOOLForKey:", 0x1E254D080);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v4, "valueWithError:", &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "BOOLForKey:", 0x1E254D080);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v6;
    objc_msgSend(v7, "valueWithError:", &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;

    v10 = objc_msgSend(v8, "BOOLValue");
    v6 = v9;
  }
  else
  {
    v10 = 0;
  }

  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(CFSTR("storefrontContainsRestrictedRegion"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = v13;
      v21 = 2114;
      v22 = v14;
      v23 = 2114;
      v24 = v15;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No entry found for key: %{public}@, error: %{public}@", buf, 0x2Au);

    }
    v10 = 0;
  }

  return v10;
}

+ (double)checkRestrictedRegionDurationValueFromBag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "doubleForKey:", 0x1E254D0A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v4, "valueWithError:", &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;
  v7 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "doubleForKey:", 0x1E254D0A0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v6;
    objc_msgSend(v8, "valueWithError:", &v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v18;

    objc_msgSend(v9, "doubleValue");
    v7 = v11;

    v6 = v10;
  }

  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(CFSTR("checkRestrictedRegionDuration"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = v14;
      v22 = 2114;
      v23 = v15;
      v24 = 2114;
      v25 = v16;
      v26 = 2114;
      v27 = v6;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No entry found for key: %{public}@, error: %{public}@", buf, 0x2Au);

    }
    v7 = 0.0;
  }

  return v7;
}

+ (id)createSyncAccountFlagsTaskForAccount:(id)a3 bag:(id)a4
{
  id v5;
  id v6;
  AMSSyncAccountFlagsTask *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AMSSyncAccountFlagsTask initWithAccount:bag:]([AMSSyncAccountFlagsTask alloc], "initWithAccount:bag:", v6, v5);

  -[AMSTask setRunMode:](v7, "setRunMode:", 1);
  return v7;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
