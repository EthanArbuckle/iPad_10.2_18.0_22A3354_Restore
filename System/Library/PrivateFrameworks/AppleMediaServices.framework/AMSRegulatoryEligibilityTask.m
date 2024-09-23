@implementation AMSRegulatoryEligibilityTask

- (AMSRegulatoryEligibilityTask)init
{
  AMSRegulatoryEligibilityTask *v2;
  AMSRegulatoryEligibilityTask *v3;
  NSObject *v4;
  NSObject *cachedServerDataService;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSRegulatoryEligibilityTask;
  v2 = -[AMSTask init](&v7, sel_init);
  v3 = v2;
  if (v2 && !v2->_cachedServerDataService)
  {
    v4 = objc_alloc_init(NSClassFromString(CFSTR("AMSDAccountCachedServerDataService")));
    cachedServerDataService = v3->_cachedServerDataService;
    v3->_cachedServerDataService = v4;

    v3->_overrideLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (AMSRegulatoryEligibilityTask)initWithServerData:(id)a3
{
  id v5;
  AMSRegulatoryEligibilityTask *v6;
  AMSRegulatoryEligibilityTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSRegulatoryEligibilityTask;
  v6 = -[AMSTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cachedServerDataService, a3);

  return v7;
}

+ (AMSRegulatoryEligibilityTask)sharedInstance
{
  if (_MergedGlobals_1_15 != -1)
    dispatch_once(&_MergedGlobals_1_15, &__block_literal_global_113);
  return (AMSRegulatoryEligibilityTask *)(id)qword_1ECEACBF8;
}

void __46__AMSRegulatoryEligibilityTask_sharedInstance__block_invoke()
{
  AMSRegulatoryEligibilityTask *v0;
  void *v1;

  v0 = objc_alloc_init(AMSRegulatoryEligibilityTask);
  v1 = (void *)qword_1ECEACBF8;
  qword_1ECEACBF8 = (uint64_t)v0;

}

- (id)update
{
  uint64_t (*v3)(void);
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  _BYTE buf[24];
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v3 = (uint64_t (*)(void))off_1ECEACC00;
  v24 = off_1ECEACC00;
  if (!off_1ECEACC00)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke_1;
    v26 = &unk_1E253DDB8;
    v27 = &v21;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke_1((uint64_t)buf);
    v3 = (uint64_t (*)(void))v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v3)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v4 = v3() == 0;
  +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = objc_opt_class();
      v17 = v16;
      if (v14)
      {
        AMSLogKey();
        self = (AMSRegulatoryEligibilityTask *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] "), v17, self);
      }
      else
      {
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: "), v16);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@Skipping regulatory eligibility; process started before first device unlock",
        buf,
        0xCu);
      if (v14)
      {

        v18 = self;
      }

    }
    AMSError(119, CFSTR("Skipping regulatory eligibility"), CFSTR("Device has not been unlocked"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting regulatory eligibility update.", buf, 0x16u);

    }
    objc_msgSend((id)objc_opt_class(), "fetchRegulatoryiTunesAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __38__AMSRegulatoryEligibilityTask_update__block_invoke;
    v20[3] = &unk_1E253D550;
    v20[4] = self;
    objc_msgSend(v10, "continueWithBlock:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "binaryPromiseAdapter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

id __38__AMSRegulatoryEligibilityTask_update__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  AMSMutablePromise *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  AMSMutablePromise *v14;
  AMSMutablePromise *v15;
  AMSMutablePromise *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  AMSMutablePromise *v33;
  id v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v20;
      v38 = 2114;
      v39 = v21;
      v40 = 2114;
      v41 = v22;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch account for regulatory eligibility. error = %{public}@", buf, 0x20u);

    }
    v34 = 0;
    v23 = objc_msgSend((id)objc_opt_class(), "setBillingCountry:withStatus:error:", 0, 7, &v34);
    v16 = (AMSMutablePromise *)v34;
    if (v23)
    {
      +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "promiseAdapter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
LABEL_15:
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(v5, "ams_accountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v25, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_opt_class();
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v27;
      v38 = 2114;
      v39 = v28;
      _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot proceed with regulatory eligibility; account does not have an AMS account ID.",
        buf,
        0x16u);

    }
    AMSError(111, CFSTR("No account identifier"), CFSTR("Account missing ams_accountID value"), 0);
    v16 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v8 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 32), "cachedServerDataService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_accountID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __38__AMSRegulatoryEligibilityTask_update__block_invoke_30;
  v30[3] = &unk_1E2545600;
  v12 = v5;
  v13 = *(_QWORD *)(a1 + 32);
  v31 = v12;
  v32 = v13;
  v14 = v8;
  v33 = v14;
  objc_msgSend(v9, "getDataForAccountIDs:reply:", v11, v30);

  v15 = v33;
  v16 = v14;

  v17 = v16;
LABEL_16:

  return v17;
}

void __38__AMSRegulatoryEligibilityTask_update__block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  int8x16_t v38;
  _QWORD v39[4];
  int8x16_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "allAccountData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ams_accountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "iso2CountryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
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
      AMSHashIfNeeded(*(void **)(a1 + 32));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v9);
      v15 = v5;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v12;
      v47 = 2114;
      v48 = v13;
      v49 = 2114;
      v50 = v14;
      v51 = 2114;
      v52 = v16;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The billing country for %{public}@ is %{public}@.", buf, 0x2Au);

      v5 = v15;
    }

    if (v9)
    {
      v44 = 0;
      v17 = objc_msgSend((id)objc_opt_class(), "setBillingCountry:withStatus:error:", v9, 0, &v44);
      v18 = v44;
      if (v17)
      {
        objc_msgSend(*(id *)(a1 + 32), "accountPropertyForKey:", CFSTR("3PRegulatoryOverride"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = *(void **)(a1 + 40);
          v43 = 0;
          v21 = objc_msgSend(v20, "setForcedOverride:error:", v19, &v43);
          v22 = v43;
          v23 = v22;
          if ((v21 & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v22);

            goto LABEL_23;
          }

        }
        objc_msgSend((id)objc_opt_class(), "setRegulatoryPropertyOnAccount:", *(_QWORD *)(a1 + 32));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "finishWithPromise:", v24);
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __38__AMSRegulatoryEligibilityTask_update__block_invoke_35;
        v39[3] = &unk_1E25455D8;
        v38 = *(int8x16_t *)(a1 + 32);
        v25 = (id)v38.i64[0];
        v40 = vextq_s8(v38, v38, 8uLL);
        v41 = v9;
        v42 = v19;
        v26 = v19;
        v27 = (id)objc_msgSend(v24, "thenWithBlock:", v39);

LABEL_23:
        goto LABEL_24;
      }
    }
    else
    {
      +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v34, "OSLogObject");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = objc_opt_class();
        AMSLogKey();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v36;
        v47 = 2114;
        v48 = v37;
        _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The billing country was null, so we won't update eligibility engine.", buf, 0x16u);

      }
      AMSError(119, CFSTR("Eligibility write failed"), CFSTR("Exited early because of null account"), 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v18);
    goto LABEL_23;
  }
  +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v28, "OSLogObject");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = objc_opt_class();
    AMSLogKey();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(*(void **)(a1 + 32));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v46 = v30;
    v47 = 2114;
    v48 = v31;
    v49 = 2114;
    v50 = v32;
    v51 = 2114;
    v52 = v33;
    _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve data for account %{public}@. error = %{public}@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v5);
LABEL_24:

}

AMSPromise *__38__AMSRegulatoryEligibilityTask_update__block_invoke_35(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateAMSDefaults:country:override:result:", v6, a1[6], a1[7], v5);

  return +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
}

+ (id)fetchRegulatoryiTunesAccount
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", AMSAccountMediaTypeProduction);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_activeiTunesAccountForMediaType:", AMSAccountMediaTypeProduction);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__AMSRegulatoryEligibilityTask_fetchRegulatoryiTunesAccount__block_invoke;
  v8[3] = &unk_1E2545628;
  v9 = v3;
  v10 = a1;
  v5 = v3;
  objc_msgSend(v4, "continueWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __60__AMSRegulatoryEligibilityTask_fetchRegulatoryiTunesAccount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
    goto LABEL_2;
  objc_msgSend(*(id *)(a1 + 32), "ams_activeiCloudAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = objc_opt_class();
    AMSLogKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No active iCloud or iTunes account found", (uint8_t *)&v18, 0x16u);
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "ams_iTunesAccountForAccount:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v14 = objc_opt_class();
    AMSLogKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v14;
    v20 = 2114;
    v21 = v13;
    v22 = 2114;
    v23 = v15;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No iTunes account found associated with active iCloud account: %{public}@", (uint8_t *)&v18, 0x20u);

LABEL_14:
LABEL_15:

    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v9 = (void *)v8;

  v5 = v9;
LABEL_2:
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_16:
  v16 = (void *)v7;

  return v16;
}

+ (BOOL)setBillingCountry:(id)a3 withStatus:(unint64_t)a4 error:(id *)a5
{
  id v6;
  void *v7;
  xpc_object_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
    v8 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
  else
    v8 = 0;
  +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
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
    v12 = a5;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v7);
    v14 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543874;
    v28 = v11;
    v29 = 2114;
    v30 = v13;
    v31 = 2114;
    v32 = v15;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Reporting billing country %{public}@ to policy engine...", (uint8_t *)&v27, 0x20u);

    v7 = v14;
    a5 = v12;
  }

  v16 = os_eligibility_set_input();
  +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v16)
  {
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v20;
      v29 = 2114;
      v30 = v21;
      v31 = 1024;
      LODWORD(v32) = v16;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set billing country; status code %i",
        (uint8_t *)&v27,
        0x1Cu);

    }
    if (a5)
    {
      AMSError(119, CFSTR("Eligibility write failed"), CFSTR("Failed to set account eligibility"), 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v23;
      v29 = 2114;
      v30 = v24;
      v31 = 2114;
      v32 = v25;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully set billing country to %{public}@.", (uint8_t *)&v27, 0x20u);

    }
  }

  return v16 == 0;
}

- (NSNumber)override
{
  os_unfair_lock_s *p_overrideLock;
  NSNumber *v4;

  p_overrideLock = &self->_overrideLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_override;
  os_unfair_lock_unlock(p_overrideLock);
  return v4;
}

- (void)setOverride:(id)a3
{
  NSNumber *v4;
  NSNumber *override;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  override = self->_override;
  self->_override = v4;

  os_unfair_lock_unlock(&self->_overrideLock);
}

- (BOOL)setForcedOverride:(id)a3 error:(id *)a4
{
  id v7;
  void (**v8)(_QWORD);
  NSNumber **p_override;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  id v32;
  int v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  uint64_t v47;
  void *v48;
  _QWORD aBlock[5];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    os_unfair_lock_lock(&self->_overrideLock);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__AMSRegulatoryEligibilityTask_setForcedOverride_error___block_invoke;
    aBlock[3] = &unk_1E253DBD8;
    aBlock[4] = self;
    v8 = (void (**)(_QWORD))_Block_copy(aBlock);
    p_override = &self->_override;
    if (-[NSNumber isEqualToNumber:](self->_override, "isEqualToNumber:", v7))
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
        *(_DWORD *)buf = 138543618;
        v51 = v12;
        v52 = 2114;
        v53 = v13;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The override on the account has not changed, so we will not set it", buf, 0x16u);

      }
      goto LABEL_8;
    }
    if (objc_msgSend(v7, "intValue"))
    {
      +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_opt_class();
        AMSLogKey();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = v21;
        v52 = 2114;
        v53 = v22;
        v54 = 2112;
        v55 = v7;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting forced override eligibility to %@.", buf, 0x20u);

      }
      if (objc_msgSend(v7, "intValue") != 1 && objc_msgSend(v7, "intValue") != 2)
      {
        +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v42)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v42, "OSLogObject");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = objc_opt_class();
          AMSLogKey();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v44;
          v52 = 2114;
          v53 = v45;
          _os_log_impl(&dword_18C849000, v43, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@]Failed to set eligibility override because AK3PRegulatoryOverride was none of 0, 1, or 2", buf, 0x16u);

        }
        if (a4)
        {
          AMSError(119, CFSTR("Force override failed"), CFSTR("Failed to set eligibility override because AK3PRegulatoryOverride was none of 0, 1, or 2"), 0);
          v32 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_53;
        }
        goto LABEL_54;
      }
      v33 = os_eligibility_force_domain_set_answers();
      if (v33)
      {
        +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v34)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v34, "OSLogObject");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = objc_opt_class();
          AMSLogKey();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v51 = v36;
          v52 = 2114;
          v53 = v37;
          v54 = 1024;
          LODWORD(v55) = v33;
          _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set forced override; status code %i",
            buf,
            0x1Cu);

        }
        if (a4)
        {
          AMSError(119, CFSTR("Force eligibility failed"), CFSTR("Failed to set the eligibility override"), 0);
          v32 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_53;
        }
        goto LABEL_54;
      }
      +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v38)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v38, "OSLogObject");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = objc_opt_class();
        AMSLogKey();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v40;
        v52 = 2114;
        v53 = v41;
        _os_log_impl(&dword_18C849000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully set forced override", buf, 0x16u);

      }
    }
    else
    {
      +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = objc_opt_class();
        AMSLogKey();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v25;
        v52 = 2114;
        v53 = v26;
        _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Override value of 0 indicates it has been unset; resetting domain answer",
          buf,
          0x16u);

      }
      v27 = os_eligibility_reset_all_domains();
      if (v27)
      {
        +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v28)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v28, "OSLogObject");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = objc_opt_class();
          AMSLogKey();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v51 = v30;
          v52 = 2114;
          v53 = v31;
          v54 = 1024;
          LODWORD(v55) = v27;
          _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to reset domain answer; status code %i",
            buf,
            0x1Cu);

        }
        if (a4)
        {
          AMSError(119, CFSTR("Reset domain failed"), CFSTR("Failed to reset the domain answer"), 0);
          v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:
          v14 = 0;
          *a4 = v32;
          goto LABEL_55;
        }
LABEL_54:
        v14 = 0;
        goto LABEL_55;
      }
      +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v38)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v38, "OSLogObject");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v47 = objc_opt_class();
        AMSLogKey();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v47;
        v52 = 2114;
        v53 = v48;
        _os_log_impl(&dword_18C849000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully reset the domain answer", buf, 0x16u);

      }
    }

    objc_storeStrong((id *)p_override, a3);
LABEL_8:
    v14 = 1;
LABEL_55:
    v8[2](v8);

    goto LABEL_56;
  }
  +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
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
    v17 = objc_opt_class();
    AMSLogKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v17;
    v52 = 2114;
    v53 = v18;
    _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set eligibility override because AK3PRegulatoryOverride was not a number", buf, 0x16u);

  }
  if (a4)
  {
    AMSError(119, CFSTR("Force override failed"), CFSTR("Failed to set eligibility override because AK3PRegulatoryOverride was not a number"), 0);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_56:

  return v14;
}

void __56__AMSRegulatoryEligibilityTask_setForcedOverride_error___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
}

+ (id)setRegulatoryPropertyOnAccount:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C8F2B8];
  v6 = AMSAccountMediaTypeProduction;
  objc_msgSend(v5, "ams_sharedAccountStoreForMediaType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_iTunesAccountsForMediaType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__AMSRegulatoryEligibilityTask_setRegulatoryPropertyOnAccount___block_invoke;
  v13[3] = &unk_1E2545650;
  v15 = v7;
  v16 = a1;
  v14 = v4;
  v9 = v7;
  v10 = v4;
  objc_msgSend(v8, "thenWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __63__AMSRegulatoryEligibilityTask_setRegulatoryPropertyOnAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v41;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v7);
      if ((objc_msgSend(v8, "ams_isRegulatoryAccount") & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v9 = v8;

    if (!v9)
      goto LABEL_17;
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (v12)
    {
      +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
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
        v15 = objc_opt_class();
        AMSLogKey();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(*(void **)(a1 + 32));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v15;
        v46 = 2114;
        v47 = v16;
        v48 = 2114;
        v49 = v17;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ is already regulatory; not updating.",
          buf,
          0x20u);

      }
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAA0]);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    objc_msgSend(v9, "ams_setRegulatoryAccount:", 0);
    objc_msgSend(*(id *)(a1 + 40), "ams_saveAccount:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v27, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_opt_class();
      AMSLogKey();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(*(void **)(a1 + 32));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v45 = v29;
      v46 = 2114;
      v47 = v30;
      v48 = 2114;
      v49 = v31;
      v50 = 2114;
      v51 = v32;
      _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Replacing %{public}@ with %{public}@ as regulatory account.", buf, 0x2Au);

    }
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __63__AMSRegulatoryEligibilityTask_setRegulatoryPropertyOnAccount___block_invoke_57;
    v37 = &unk_1E253D9F0;
    v38 = *(id *)(a1 + 32);
    v39 = *(id *)(a1 + 40);
    objc_msgSend(v26, "thenWithBlock:", &v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "promiseAdapter", v34, v35, v36, v37);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_9:

LABEL_17:
    +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_opt_class();
      AMSLogKey();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(*(void **)(a1 + 32));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v21;
      v46 = 2114;
      v47 = v22;
      v48 = 2114;
      v49 = v23;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Saving %{public}@ as regulatory account.", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "ams_setRegulatoryAccount:", 1);
    objc_msgSend(*(id *)(a1 + 40), "ams_saveAccount:", *(_QWORD *)(a1 + 32));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "promiseAdapter");
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v24 = (void *)v18;
  }

  return v24;
}

uint64_t __63__AMSRegulatoryEligibilityTask_setRegulatoryPropertyOnAccount___block_invoke_57(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ams_setRegulatoryAccount:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "ams_saveAccount:", *(_QWORD *)(a1 + 32));
}

- (void)handleCachedDataUpdate
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedRegulatoryEligibilityConfig](AMSLogConfig, "sharedRegulatoryEligibilityConfig");
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
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting eligibility flow from cached data update.", (uint8_t *)&v8, 0x16u);

  }
  v7 = -[AMSRegulatoryEligibilityTask update](self, "update");
}

- (void)updateAMSDefaults:(id)a3 country:(id)a4 override:(id)a5 result:(id)a6
{
  __CFString *v9;
  __CFString *v10;
  id v11;
  id v12;
  __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v9 = (__CFString *)a3;
  v10 = (__CFString *)a4;
  v11 = a5;
  v12 = a6;
  if (os_variant_has_internal_content()
    && !+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
  {
    v13 = CFSTR("N/A");
    if (v9)
      v14 = v9;
    else
      v14 = CFSTR("N/A");
    v18[0] = CFSTR("username");
    v18[1] = CFSTR("country");
    if (v10)
      v15 = v10;
    else
      v15 = CFSTR("N/A");
    v19[0] = v14;
    v19[1] = v15;
    v18[2] = CFSTR("override");
    if (v11)
    {
      objc_msgSend(v11, "stringValue");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v18[3] = CFSTR("regulatory");
    v16 = CFSTR("yes");
    if (!v12)
      v16 = CFSTR("no");
    v19[2] = v13;
    v19[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)

    +[AMSDefaults setRegulatoryEligibilityAttributes:](AMSDefaults, "setRegulatoryEligibilityAttributes:", v17);
  }

}

- (NSObject)cachedServerDataService
{
  return self->_cachedServerDataService;
}

- (void)setCachedServerDataService:(id)a3
{
  objc_storeStrong((id *)&self->_cachedServerDataService, a3);
}

- (os_unfair_lock_s)overrideLock
{
  return self->_overrideLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedServerDataService, 0);
  objc_storeStrong((id *)&self->_override, 0);
}

@end
