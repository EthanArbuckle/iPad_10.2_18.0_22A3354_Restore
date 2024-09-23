@implementation AMSSubscriptionEntitlementsTask

- (AMSSubscriptionEntitlementsTask)initWithMediaType:(int64_t)a3
{
  AMSSubscriptionEntitlementsTask *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSSubscriptionEntitlementsTask;
  result = -[AMSTask init](&v5, sel_init);
  if (result)
    result->_mediaType = a3;
  return result;
}

- (id)performExternalLookup
{
  objc_super v3;
  _QWORD v4[5];

  v4[1] = 3221225472;
  v4[2] = __56__AMSSubscriptionEntitlementsTask_performExternalLookup__block_invoke;
  v4[3] = &unk_1E253DB80;
  v4[4] = self;
  v3.receiver = self;
  v3.super_class = (Class)AMSSubscriptionEntitlementsTask;
  v4[0] = MEMORY[0x1E0C809B0];
  -[AMSTask performTaskWithPromiseBlock:](&v3, sel_performTaskWithPromiseBlock_, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __56__AMSSubscriptionEntitlementsTask_performExternalLookup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "mediaType");
  v3 = *(void **)(a1 + 32);
  if (v2 == 2)
    objc_msgSend(v3, "_fetchEntitlementsFromIC");
  else
    objc_msgSend(v3, "_fetchEntitlementsFromASD");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)updateCacheForMediaType:(int64_t)a3 account:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  _UNKNOWN **v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  AMSSubscriptionEntitlementsTask *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  int64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if ((unint64_t)a3 > 7)
    goto LABEL_20;
  v32 = 0;
  v10 = objc_msgSend(a1, "_segmentForMediaType:error:", a3, &v32);
  v11 = v32;
  v12 = &off_1E2519000;
  if (v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v34 = v15;
      v35 = 2114;
      v36 = v16;
      v37 = 2048;
      v38 = a3;
      v39 = 2114;
      v40 = v11;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch ASD segment for mediaType: %ld. %{public}@", buf, 0x2Au);

    }
    goto LABEL_8;
  }
  if (objc_msgSend(v9, "count"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25 = a3;
    objc_msgSend(v24, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_opt_class();
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v27;
      v25 = a3;
      v12 = &off_1E2519000;
      v35 = 2114;
      v36 = v28;
      v37 = 2048;
      v38 = a3;
      _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Caching ASD entitlement data for mediaType: %ld", buf, 0x20u);

    }
    objc_msgSend(getASDSubscriptionEntitlementsClass(), "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ams_DSID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSubscriptionEntitlementsWithDictionary:forAccountID:segment:", v9, v30, v10);

    if (v25 == 2)
      goto LABEL_9;
LABEL_20:
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
LABEL_8:

LABEL_9:
  objc_msgSend(v12[274], "sharedConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(v12[274], "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_opt_class();
    AMSLogKey();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v19;
    v35 = 2114;
    v36 = v20;
    v37 = 2048;
    v38 = a3;
    _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Reloading entitlement data for mediaType: %ld", buf, 0x20u);

  }
  v21 = -[AMSSubscriptionEntitlementsTask initWithMediaType:]([AMSSubscriptionEntitlementsTask alloc], "initWithMediaType:", a3);
  -[AMSSubscriptionEntitlementsTask setCachePolicy:](v21, "setCachePolicy:", 1);
  -[AMSSubscriptionEntitlementsTask performExternalLookup](v21, "performExternalLookup");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "binaryPromiseAdapter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  return v23;
}

- (id)_fetchEntitlementsFromASD
{
  unint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v10 = 0;
  v3 = +[AMSSubscriptionEntitlementsTask _segmentForMediaType:error:](AMSSubscriptionEntitlementsTask, "_segmentForMediaType:error:", -[AMSSubscriptionEntitlementsTask mediaType](self, "mediaType"), &v10);
  v4 = v10;
  if (v4)
  {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(getASDSubscriptionEntitlementsClass(), "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AMSSubscriptionEntitlementsTask _shouldIgnoreCaches](self, "_shouldIgnoreCaches"))
      -[AMSSubscriptionEntitlementsTask _reloadASDSubscriptionForSegment:controller:](self, "_reloadASDSubscriptionForSegment:controller:", v3, v6);
    else
      -[AMSSubscriptionEntitlementsTask _queryCachedASDSubscriptionForSegment:controller:reloadIfNeeded:](self, "_queryCachedASDSubscriptionForSegment:controller:reloadIfNeeded:", v3, v6, -[AMSSubscriptionEntitlementsTask _shouldIgnoreRemoteData](self, "_shouldIgnoreRemoteData") ^ 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__AMSSubscriptionEntitlementsTask__fetchEntitlementsFromASD__block_invoke;
    v9[3] = &unk_1E253D638;
    v9[4] = self;
    objc_msgSend(v7, "thenWithBlock:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __60__AMSSubscriptionEntitlementsTask__fetchEntitlementsFromASD__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully fetched subscriptions", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_resultFromASDEntitlements:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_fetchEntitlementsFromIC
{
  AMSMutablePromise *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  AMSMutablePromise *v22;
  AMSMutablePromise *v23;
  AMSMutablePromise *v24;
  _QWORD v26[5];
  AMSMutablePromise *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE buf[24];
  void *v33;
  uint64_t *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(AMSMutablePromise);
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching Music subscription entitlements", buf, 0x16u);

  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v8 = (void *)qword_1ECEAD8A0;
  v31 = qword_1ECEAD8A0;
  v9 = MEMORY[0x1E0C809B0];
  if (!qword_1ECEAD8A0)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getICMusicSubscriptionStatusControllerClass_block_invoke;
    v33 = &unk_1E253DDB8;
    v34 = &v28;
    __getICMusicSubscriptionStatusControllerClass_block_invoke((uint64_t)buf);
    v8 = (void *)v29[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v28, 8);
  objc_msgSend(v10, "sharedStatusController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v12 = (void *)qword_1ECEAD8A8;
  v31 = qword_1ECEAD8A8;
  if (!qword_1ECEAD8A8)
  {
    *(_QWORD *)buf = v9;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getICStoreRequestContextClass_block_invoke;
    v33 = &unk_1E253DDB8;
    v34 = &v28;
    __getICStoreRequestContextClass_block_invoke((uint64_t)buf);
    v12 = (void *)v29[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v28, 8);
  v14 = [v13 alloc];
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v15 = (void *)qword_1ECEAD8B0;
  v31 = qword_1ECEAD8B0;
  if (!qword_1ECEAD8B0)
  {
    *(_QWORD *)buf = v9;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getICUserIdentityClass_block_invoke;
    v33 = &unk_1E253DDB8;
    v34 = &v28;
    __getICUserIdentityClass_block_invoke((uint64_t)buf);
    v15 = (void *)v29[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v28, 8);
  objc_msgSend(v16, "activeAccount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithIdentity:", v17);

  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v19 = (void *)qword_1ECEAD8B8;
  v31 = qword_1ECEAD8B8;
  if (!qword_1ECEAD8B8)
  {
    *(_QWORD *)buf = v9;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getICMusicSubscriptionStatusRequestClass_block_invoke;
    v33 = &unk_1E253DDB8;
    v34 = &v28;
    __getICMusicSubscriptionStatusRequestClass_block_invoke((uint64_t)buf);
    v19 = (void *)v29[3];
  }
  v20 = objc_retainAutorelease(v19);
  _Block_object_dispose(&v28, 8);
  v21 = (void *)objc_msgSend([v20 alloc], "initWithStoreRequestContext:", v18);
  objc_msgSend(v21, "setShouldBypassEnforcementOfPrivacyAcknowledgement:", 1);
  if (-[AMSSubscriptionEntitlementsTask _shouldIgnoreCaches](self, "_shouldIgnoreCaches"))
  {
    objc_msgSend(v21, "setShouldIgnoreCache:", 1);
  }
  else
  {
    objc_msgSend(v21, "setAllowsFallbackToExpiredStatus:", 1);
    objc_msgSend(v21, "setAllowsFallbackToStatusNeedingReload:", 1);
    if (-[AMSSubscriptionEntitlementsTask _shouldIgnoreRemoteData](self, "_shouldIgnoreRemoteData"))
      objc_msgSend(v21, "setShouldReturnLastKnownStatusOnly:", 1);
  }
  if (-[AMSSubscriptionEntitlementsTask extendedCarrierCheck](self, "extendedCarrierCheck"))
  {
    objc_msgSend(v21, "setCarrierBundleProvisioningStyle:", 2);
    objc_msgSend(v21, "setReason:", 1);
  }
  v26[0] = v9;
  v26[1] = 3221225472;
  v26[2] = __59__AMSSubscriptionEntitlementsTask__fetchEntitlementsFromIC__block_invoke;
  v26[3] = &unk_1E2546038;
  v26[4] = self;
  v22 = v3;
  v27 = v22;
  objc_msgSend(v11, "performSubscriptionStatusRequest:withCompletionHandler:", v21, v26);
  v23 = v27;
  v24 = v22;

  return v24;
}

void __59__AMSSubscriptionEntitlementsTask__fetchEntitlementsFromIC__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Lookup failed. %{public}@", (uint8_t *)&v17, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  else
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Lookup succeeded", (uint8_t *)&v17, 0x16u);

    }
    v15 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_resultFromICResponse:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finishWithResult:", v16);

  }
}

- (id)_queryCachedASDSubscriptionForSegment:(unint64_t)a3 controller:(id)a4 reloadIfNeeded:(BOOL)a5
{
  id v8;
  AMSMutablePromise *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  AMSMutablePromise *v14;
  id v15;
  AMSMutablePromise *v16;
  AMSMutablePromise *v17;
  _QWORD v19[5];
  id v20;
  AMSMutablePromise *v21;
  unint64_t v22;
  BOOL v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = objc_alloc_init(AMSMutablePromise);
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v25 = v12;
    v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching ASD cached subscriptions", buf, 0x16u);

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __99__AMSSubscriptionEntitlementsTask__queryCachedASDSubscriptionForSegment_controller_reloadIfNeeded___block_invoke;
  v19[3] = &unk_1E2546060;
  v23 = a5;
  v22 = a3;
  v19[4] = self;
  v20 = v8;
  v14 = v9;
  v21 = v14;
  v15 = v8;
  objc_msgSend(v15, "getCachedSubscriptionEntitlementsForSegment:withResultHandler:", a3, v19);
  v16 = v21;
  v17 = v14;

  return v17;
}

void __99__AMSSubscriptionEntitlementsTask__queryCachedASDSubscriptionForSegment_controller_reloadIfNeeded___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a4;
  v8 = v7;
  if (a3 && *(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "_reloadASDSubscriptionForSegment:controller:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "finishWithPromise:", v9);
LABEL_9:

    goto LABEL_10;
  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v7);
  }
  else
  {
    v10 = *(void **)(a1 + 48);
    if (!v11)
    {
      AMSError(0, CFSTR("Cached Subscription Status Failed"), CFSTR("Neither a result nor error returned"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "finishWithError:", v9);
      goto LABEL_9;
    }
    objc_msgSend(v10, "finishWithResult:");
  }
LABEL_10:

}

- (id)_reloadASDSubscriptionForSegment:(unint64_t)a3 controller:(id)a4
{
  id v5;
  AMSMutablePromise *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  AMSMutablePromise *v11;
  _QWORD v13[4];
  AMSMutablePromise *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(AMSMutablePromise);
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    *(_DWORD *)buf = 138543618;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Forcing ASD fetch for subscriptions", buf, 0x16u);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__AMSSubscriptionEntitlementsTask__reloadASDSubscriptionForSegment_controller___block_invoke;
  v13[3] = &unk_1E2546088;
  v11 = v6;
  v14 = v11;
  objc_msgSend(v5, "getSubscriptionEntitlementsForSegment:ignoreCaches:requestingBundleId:withCacheInfoResultHandler:", a3, 1, CFSTR("com.apple.AppStore"), v13);

  return v11;
}

void __79__AMSSubscriptionEntitlementsTask__reloadASDSubscriptionForSegment_controller___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a5;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v7);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    if (v10)
    {
      objc_msgSend(v8, "finishWithResult:");
    }
    else
    {
      AMSError(0, CFSTR("Reload Subscription Status Failed"), CFSTR("Neither a result nor error returned"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "finishWithError:", v9);

    }
  }

}

- (id)_resultFromASDEntitlements:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  AMSSubscriptionEntitlement *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  AMSSubscriptionEntitlementsResult *v44;
  AMSSubscriptionEntitlementsResult *v46;
  id obj;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v46 = objc_alloc_init(AMSSubscriptionEntitlementsResult);
  v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v50;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if (v6)
        {
          if (v7)
            goto LABEL_8;
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "appVersion");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7)
            goto LABEL_8;
        }
        objc_msgSend(v10, "appAdamID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
        v11 = objc_alloc_init(AMSSubscriptionEntitlement);
        -[AMSSubscriptionEntitlement setAutoRenewEnabled:](v11, "setAutoRenewEnabled:", objc_msgSend(v10, "autoRenewEnabled"));
        objc_msgSend(v10, "expiryDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setExpiration:](v11, "setExpiration:", v12);

        objc_msgSend(v10, "chargeStoreFrontID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setChargeStoreFrontID:](v11, "setChargeStoreFrontID:", v13);

        objc_msgSend(v10, "externalSubscriptionID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setExternalSubscriptionID:](v11, "setExternalSubscriptionID:", v14);

        objc_msgSend(v10, "familyRank");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setFamilyRank:](v11, "setFamilyRank:", v15);

        -[AMSSubscriptionEntitlement setFamilySubscription:](v11, "setFamilySubscription:", objc_msgSend(v10, "hasFamily"));
        objc_msgSend(v10, "inAppAdamID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setInAppAdamId:](v11, "setInAppAdamId:", v16);

        objc_msgSend(v10, "inAppVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setInAppVersion:](v11, "setInAppVersion:", v17);

        objc_msgSend(v10, "offerID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setOfferId:](v11, "setOfferId:", v18);

        objc_msgSend(v10, "entitlementOriginType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setEntitlementOriginType:](v11, "setEntitlementOriginType:", v19);

        objc_msgSend(v10, "entitlementSourceAdamID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setEntitlementSourceAdamId:](v11, "setEntitlementSourceAdamId:", v20);

        objc_msgSend(v10, "featureAccessTypeID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setFeatureAccessTypeId:](v11, "setFeatureAccessTypeId:", v21);

        objc_msgSend(v10, "freeTrialPeriodID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setFreeTrialPeriodId:](v11, "setFreeTrialPeriodId:", v22);

        objc_msgSend(v10, "poolType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setPoolType:](v11, "setPoolType:", v23);

        objc_msgSend(v10, "promoScenarioID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setPromoScenarioId:](v11, "setPromoScenarioId:", v24);

        objc_msgSend(v10, "startDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setStartDate:](v11, "setStartDate:", v25);

        objc_msgSend(v10, "subscriptionBundleID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setSubscriptionBundleId:](v11, "setSubscriptionBundleId:", v26);

        objc_msgSend(v10, "vendorAdHocOfferID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setVendorAdHocOfferId:](v11, "setVendorAdHocOfferId:", v27);

        objc_msgSend(v10, "vendorID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setVendorId:](v11, "setVendorId:", v28);

        -[AMSSubscriptionEntitlement setPeriod:](v11, "setPeriod:", 0);
        -[AMSSubscriptionEntitlement setPeriod:](v11, "setPeriod:", -[AMSSubscriptionEntitlement period](v11, "period") | objc_msgSend(v10, "isTrialPeriod"));
        if (objc_msgSend(v10, "isOfferPeriod"))
          v29 = 2;
        else
          v29 = 0;
        -[AMSSubscriptionEntitlement setPeriod:](v11, "setPeriod:", -[AMSSubscriptionEntitlement period](v11, "period") | v29);
        if (objc_msgSend(v10, "isInGracePeriod"))
          v30 = 4;
        else
          v30 = 0;
        -[AMSSubscriptionEntitlement setPeriod:](v11, "setPeriod:", -[AMSSubscriptionEntitlement period](v11, "period") | v30);
        objc_msgSend(v10, "initialPurchaseTimestamp");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "doubleValue");
        -[AMSSubscriptionEntitlement setInitialPurchaseTimestamp:](v11, "setInitialPurchaseTimestamp:", v32 / 1000.0);

        objc_msgSend(v10, "startDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement setRenewDate:](v11, "setRenewDate:", v33);

        objc_msgSend(v10, "serviceBeginsTimestamp");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "doubleValue");
        -[AMSSubscriptionEntitlement setServiceBeginsTimestamp:](v11, "setServiceBeginsTimestamp:", v35 / 1000.0);

        -[AMSSubscriptionEntitlement setPurchaser:](v11, "setPurchaser:", objc_msgSend(v10, "isPurchaser"));
        -[AMSSubscriptionEntitlement setSource:](v11, "setSource:", 1);
        objc_msgSend(v10, "expiryDate");
        v36 = objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "expiryDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v37, "compare:", v38) == -1;

        }
        -[AMSSubscriptionEntitlement setStatus:](v11, "setStatus:", v36);
        objc_msgSend(v10, "inAppAdamID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringValue");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40;
        if (v40)
        {
          v42 = v40;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "UUIDString");
          v42 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v11, v42);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (!v5)
        goto LABEL_25;
    }
  }
  v6 = 0;
  v7 = 0;
LABEL_25:

  -[AMSSubscriptionEntitlementsResult setEntitlements:](v46, "setEntitlements:", v48);
  -[AMSSubscriptionEntitlementsResult setAppAdamId:](v46, "setAppAdamId:", v7);
  -[AMSSubscriptionEntitlementsResult setAppVersion:](v46, "setAppVersion:", v6);
  v44 = v46;

  return v44;
}

- (id)_resultFromICResponse:(id)a3
{
  void *v3;
  AMSSubscriptionEntitlementsResult *v4;
  void *v5;
  AMSSubscriptionEntitlement *v6;
  AMSSubscriptionEntitlement *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "subscriptionStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(AMSSubscriptionEntitlementsResult);
  -[AMSSubscriptionEntitlementsResult setAppAdamId:](v4, "setAppAdamId:", 0);
  -[AMSSubscriptionEntitlementsResult setAppVersion:](v4, "setAppVersion:", 0);
  objc_msgSend(v3, "responseDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSSubscriptionEntitlementsResult setServerResponse:](v4, "setServerResponse:", v5);

  v6 = objc_alloc_init(AMSSubscriptionEntitlement);
  -[AMSSubscriptionEntitlement setStatus:](v6, "setStatus:", objc_msgSend(v3, "isMatchEnabled"));
  v7 = objc_alloc_init(AMSSubscriptionEntitlement);
  -[AMSSubscriptionEntitlement setAutoRenewEnabled:](v7, "setAutoRenewEnabled:", objc_msgSend(v3, "isAutoRenewEnabled"));
  objc_msgSend(v3, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSSubscriptionEntitlement setExpiration:](v7, "setExpiration:", v8);

  v9 = objc_msgSend(v3, "statusType") == 1 && objc_msgSend(v3, "reasonType") == 2;
  -[AMSSubscriptionEntitlement setFamilySubscription:](v7, "setFamilySubscription:", v9);
  -[AMSSubscriptionEntitlement setFreeTrialEligible:](v7, "setFreeTrialEligible:", objc_msgSend(v3, "isEligibleForFreeTrial"));
  -[AMSSubscriptionEntitlement setPurchaser:](v7, "setPurchaser:", objc_msgSend(v3, "isPurchaser"));
  -[AMSSubscriptionEntitlement setCarrierErrorCode:](v7, "setCarrierErrorCode:", objc_msgSend(v3, "carrierBundlingErrorCode"));
  objc_msgSend(v3, "cellularOperatorName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSSubscriptionEntitlement setCarrierOperatorName:](v7, "setCarrierOperatorName:", v10);

  objc_msgSend(v3, "sessionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSSubscriptionEntitlement setCarrierSessionId:](v7, "setCarrierSessionId:", v11);

  objc_msgSend(v3, "phoneNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSSubscriptionEntitlement setCarrierPhoneNumber:](v7, "setCarrierPhoneNumber:", v12);

  objc_msgSend(v3, "studentExpirationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSSubscriptionEntitlement setStudentExpirationDate:](v7, "setStudentExpirationDate:", v13);

  objc_msgSend(v3, "initialPurchaseTimestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  -[AMSSubscriptionEntitlement setInitialPurchaseTimestamp:](v7, "setInitialPurchaseTimestamp:");

  objc_msgSend(v3, "serviceBeginsTimestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSince1970");
  -[AMSSubscriptionEntitlement setServiceBeginsTimestamp:](v7, "setServiceBeginsTimestamp:");

  v16 = objc_msgSend(v3, "carrierBundlingStatusType");
  if (v16 <= 4)
    -[AMSSubscriptionEntitlement setCarrierStatus:](v7, "setCarrierStatus:", dword_18CF5CCF8[v16]);
  -[AMSSubscriptionEntitlement setPeriod:](v7, "setPeriod:", 0);
  -[AMSSubscriptionEntitlement setPeriod:](v7, "setPeriod:", -[AMSSubscriptionEntitlement period](v7, "period") | objc_msgSend(v3, "isInFreeTrial"));
  v17 = objc_msgSend(v3, "sourceType");
  if (v17 <= 2)
    -[AMSSubscriptionEntitlement setSource:](v7, "setSource:", v17);
  -[AMSSubscriptionEntitlement setStatus:](v7, "setStatus:", objc_msgSend(v3, "statusType") == 1);
  v20[0] = CFSTR("music-match");
  v20[1] = CFSTR("music");
  v21[0] = v6;
  v21[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSSubscriptionEntitlementsResult setEntitlements:](v4, "setEntitlements:", v18);

  return v4;
}

+ (unint64_t)_segmentForMediaType:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((unint64_t)a3 < 8)
    return objc_msgSend(off_1E25460D8[a3], "unsignedLongValue");
  if (a4)
  {
    AMSErrorWithFormat(12, CFSTR("Entitlements Failure"), CFSTR("Unhandled segment for mediaType: %ld"), (uint64_t)a4, v4, v5, v6, v7, a3);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 1;
}

- (BOOL)_shouldIgnoreCaches
{
  return -[AMSSubscriptionEntitlementsTask cachePolicy](self, "cachePolicy") == 1;
}

- (BOOL)_shouldIgnoreRemoteData
{
  return -[AMSSubscriptionEntitlementsTask cachePolicy](self, "cachePolicy") == 2;
}

- (int64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(int64_t)a3
{
  self->_cachePolicy = a3;
}

- (BOOL)extendedCarrierCheck
{
  return self->_extendedCarrierCheck;
}

- (void)setExtendedCarrierCheck:(BOOL)a3
{
  self->_extendedCarrierCheck = a3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

@end
