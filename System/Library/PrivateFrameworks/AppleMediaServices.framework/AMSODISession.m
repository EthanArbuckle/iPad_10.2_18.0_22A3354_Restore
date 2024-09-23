@implementation AMSODISession

- (AMSODISession)initWithSessionIdentifier:(id)a3 accountType:(unint64_t)a4 bag:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  AMSODISession *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v12;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "AMSODISession: [%@] **WARNING** Calling a deprecated constructor", (uint8_t *)&v15, 0xCu);

  }
  v13 = -[AMSODISession initWithSessionIdentifier:accountType:bundleIdentifier:bag:](self, "initWithSessionIdentifier:accountType:bundleIdentifier:bag:", v9, a4, 0, v8);

  return v13;
}

- (AMSODISession)initWithSessionIdentifier:(id)a3 accountType:(unint64_t)a4 bundleIdentifier:(id)a5 bag:(id)a6
{
  id v10;
  id v11;
  id v12;
  AMSODISession *v13;
  AMSODISession *v14;
  uint64_t v15;
  NSString *bundleIdentifier;
  uint64_t v17;
  NSString *sessionIdentifier;
  void *v19;
  uint64_t v20;
  id v21;
  NSString *cacheIdentifier;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id v28;
  objc_super v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)AMSODISession;
  v13 = -[AMSODISession init](&v29, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_accountType = a4;
    objc_storeStrong((id *)&v13->_bag, a6);
    v15 = objc_msgSend(v11, "copy");
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v10, "copy");
    sessionIdentifier = v14->_sessionIdentifier;
    v14->_sessionIdentifier = (NSString *)v17;

    -[NSLock lock](v14->_lock, "lock");
    -[AMSODISession _createODISession](v14, "_createODISession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v19, "resultWithError:", &v28);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v28;
    cacheIdentifier = v14->_cacheIdentifier;
    v14->_cacheIdentifier = (NSString *)v20;

    if (v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = objc_opt_class();
        AMSLogKey();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v25;
        v32 = 2114;
        v33 = v26;
        _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create remote session instance", buf, 0x16u);

      }
    }
    -[NSLock unlock](v14->_lock, "unlock");

  }
  return v14;
}

- (NSString)cacheIdentifier
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_cacheIdentifier, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setCacheIdentifier:(id)a3
{
  NSLock *lock;
  id v5;
  NSString *v6;
  NSString *cacheIdentifier;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  v6 = (NSString *)objc_msgSend(v5, "copy");

  cacheIdentifier = self->_cacheIdentifier;
  self->_cacheIdentifier = v6;

  -[NSLock unlock](self->_lock, "unlock");
}

- (id)getAssessment
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  AMSMutablePromise *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  _BYTE *v14;
  _BYTE buf[24];
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  AMSDaemonConnection *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  -[AMSODISession bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend((id)v4, "shouldUseODIWithBag:", v5);

  if ((v4 & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v16 = __Block_byref_object_copy__53;
    v17 = __Block_byref_object_dispose__53;
    v18 = objc_alloc_init(AMSDaemonConnection);
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "purchaseServiceProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __30__AMSODISession_getAssessment__block_invoke;
    v12[3] = &unk_1E2541BE0;
    v12[4] = self;
    v13 = v3;
    v14 = buf;
    objc_msgSend(v6, "thenWithBlock:", v12);
    v7 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v3;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping assessment for no bag key", buf, 0x16u);
    }

    AMSError(204, CFSTR("ODI Error"), CFSTR("Bag Value Missing"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(AMSMutablePromise);
    -[AMSMutablePromise finishWithError:](v7, "finishWithError:", v10);

  }
  return v7;
}

AMSMutablePromise *__30__AMSODISession_getAssessment__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  void *v5;
  AMSMutablePromise *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  AMSMutablePromise *v12;
  _QWORD v14[4];
  AMSMutablePromise *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 32), "cacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __30__AMSODISession_getAssessment__block_invoke_2;
  v14[3] = &unk_1E25443A8;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v15 = v6;
  v16 = v7;
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 48);
  v17 = v9;
  v18 = v10;
  objc_msgSend(v3, "getODIAssessmentForSessionIdentifier:clearCache:completion:", v5, 0, v14);

  v11 = v17;
  v12 = v6;

  return v12;
}

void __30__AMSODISession_getAssessment__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v10 = *(_QWORD *)(a1 + 48);
      v14 = 138543618;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ODI assessment failed for unknown reasons", (uint8_t *)&v14, 0x16u);
    }

    AMSError(0, CFSTR("ODI Error"), CFSTR("Unknown error"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v11);

  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

+ (BOOL)isTDMEnhancementAvailable
{
  return _os_feature_enabled_impl();
}

+ (BOOL)provideFeedbackOnPayloadOutcome:(unint64_t)a3 cacheIdentifier:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _BYTE *v27;
  unint64_t v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  AMSDaemonConnection *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  AMSSetLogKeyIfNeeded();
  v22 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)objc_opt_class(), "shouldUseODIWithBag:", v9) & 1) != 0)
  {
    *(_QWORD *)v36 = 0;
    *(_QWORD *)&v36[8] = v36;
    *(_QWORD *)&v36[16] = 0x3032000000;
    v37 = __Block_byref_object_copy__53;
    v38 = __Block_byref_object_dispose__53;
    v39 = objc_alloc_init(AMSDaemonConnection);
    objc_msgSend(*(id *)(*(_QWORD *)&v36[8] + 40), "purchaseServiceProxy", v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __69__AMSODISession_provideFeedbackOnPayloadOutcome_cacheIdentifier_bag___block_invoke;
    v25[3] = &unk_1E25443F8;
    v28 = a3;
    v29 = a1;
    v26 = v8;
    v27 = v36;
    objc_msgSend(v10, "thenWithBlock:", v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "binaryPromiseAdapter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v13 = objc_msgSend(v12, "resultWithError:", &v24);
    v14 = v24;

    if (v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
        *(_DWORD *)buf = 138543874;
        v31 = v17;
        v32 = 2114;
        v33 = v18;
        v34 = 2114;
        v35 = v14;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to provide ODI feedback for connection error: %{public}@", buf, 0x20u);

      }
    }

    _Block_object_dispose(v36, 8);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject", v22);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v36 = 138543618;
      *(_QWORD *)&v36[4] = objc_opt_class();
      *(_WORD *)&v36[12] = 2114;
      *(_QWORD *)&v36[14] = v23;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping feedback for no bag key", v36, 0x16u);
    }

    v13 = 0;
  }

  return v13;
}

AMSMutablePromise *__69__AMSODISession_provideFeedbackOnPayloadOutcome_cacheIdentifier_bag___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  uint64_t v5;
  uint64_t v6;
  AMSMutablePromise *v7;
  uint64_t v8;
  _QWORD v10[4];
  AMSMutablePromise *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v5 = a1[4];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__AMSODISession_provideFeedbackOnPayloadOutcome_cacheIdentifier_bag___block_invoke_2;
  v10[3] = &unk_1E25443D0;
  v6 = a1[6];
  v13 = a1[7];
  v7 = v4;
  v8 = a1[5];
  v11 = v7;
  v12 = v8;
  objc_msgSend(v3, "provideFeedbackOnPayloadOutcome:sessionIdentifier:clearCache:completion:", v6, v5, 1, v10);

  return v7;
}

void __69__AMSODISession_provideFeedbackOnPayloadOutcome_cacheIdentifier_bag___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v6 = objc_opt_class();
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = v3;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to provide ODI feedback for error: %{public}@", (uint8_t *)&v12, 0x20u);

    }
    v8 = *(void **)(a1 + 32);
    v9 = &unk_1E25AF848;
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = &unk_1E25AF860;
  }
  objc_msgSend(v8, "finishWithResult:", v9);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

+ (BOOL)shouldUseODIWithBag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "BOOLForKey:", 0x1E254D0C0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v5, "valueWithError:", &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "BOOLForKey:", 0x1E254D0C0);
    v17 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueWithError:", &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;

    v11 = objc_msgSend(v9, "BOOLValue");
    v7 = v10;
  }
  else
  {
    v11 = 0;
  }

  if (v7)
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
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_opt_class();
      AMSHashIfNeeded(CFSTR("afds-enabled-odi"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v14;
      v21 = 2114;
      v22 = v4;
      v23 = 2114;
      v24 = v15;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] No bag key found: %{public}@", buf, 0x20u);

    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)updateWithAttributes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v20;
  _QWORD v21[4];
  id v22;
  AMSODISession *v23;
  _BYTE *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  AMSDaemonConnection *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[AMSODISession bag](self, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend((id)v6, "shouldUseODIWithBag:", v7);

  if ((v6 & 1) != 0)
  {
    *(_QWORD *)v31 = 0;
    *(_QWORD *)&v31[8] = v31;
    *(_QWORD *)&v31[16] = 0x3032000000;
    v32 = __Block_byref_object_copy__53;
    v33 = __Block_byref_object_dispose__53;
    v34 = objc_alloc_init(AMSDaemonConnection);
    objc_msgSend(*(id *)(*(_QWORD *)&v31[8] + 40), "purchaseServiceProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __38__AMSODISession_updateWithAttributes___block_invoke;
    v21[3] = &unk_1E2541BE0;
    v22 = v4;
    v23 = self;
    v24 = v31;
    objc_msgSend(v8, "thenWithBlock:", v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "binaryPromiseAdapter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v11 = objc_msgSend(v10, "resultWithError:", &v20);
    v12 = v20;

    if (v12)
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
        *(_DWORD *)buf = 138543874;
        v26 = v15;
        v27 = 2114;
        v28 = v16;
        v29 = 2114;
        v30 = v12;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update ODI attributes for connection error: %{public}@", buf, 0x20u);

      }
    }

    _Block_object_dispose(v31, 8);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v31 = 138543618;
      *(_QWORD *)&v31[4] = objc_opt_class();
      *(_WORD *)&v31[12] = 2114;
      *(_QWORD *)&v31[14] = v5;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping update for no bag key", v31, 0x16u);
    }

    v11 = 0;
  }

  return v11;
}

AMSMutablePromise *__38__AMSODISession_updateWithAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  uint64_t v5;
  void *v6;
  AMSMutablePromise *v7;
  uint64_t v8;
  AMSMutablePromise *v9;
  AMSMutablePromise *v10;
  _QWORD v12[5];
  AMSMutablePromise *v13;
  uint64_t v14;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cacheIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__AMSODISession_updateWithAttributes___block_invoke_2;
  v12[3] = &unk_1E2544420;
  v12[4] = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 48);
  v13 = v7;
  v14 = v8;
  objc_msgSend(v3, "updateODIWithAttributes:forSessionIdentifier:completion:", v5, v6, v12);

  v9 = v13;
  v10 = v7;

  return v10;
}

void __38__AMSODISession_updateWithAttributes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v6 = objc_opt_class();
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = v3;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update ODI attributes for error: %{public}@", (uint8_t *)&v12, 0x20u);

    }
    v8 = *(void **)(a1 + 40);
    v9 = &unk_1E25AF848;
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    v9 = &unk_1E25AF860;
  }
  objc_msgSend(v8, "finishWithResult:", v9);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

- (id)_createODISession
{
  void *v3;
  uint64_t v4;
  void *v5;
  AMSMutableLazyPromise *v6;
  AMSMutablePromise *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v12[5];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  -[AMSODISession bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend((id)v4, "shouldUseODIWithBag:", v5);

  if ((v4 & 1) != 0)
  {
    v6 = [AMSMutableLazyPromise alloc];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __34__AMSODISession__createODISession__block_invoke;
    v12[3] = &unk_1E253FBC0;
    v12[4] = self;
    v7 = -[AMSMutableLazyPromise initWithBlock:](v6, "initWithBlock:", v12);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = objc_opt_class();
      v15 = 2114;
      v16 = v3;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping create session for no bag key", buf, 0x16u);
    }

    v7 = objc_alloc_init(AMSMutablePromise);
    AMSError(204, CFSTR("ODI Error"), CFSTR("Bag Value Missing"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMutablePromise finishWithError:](v7, "finishWithError:", v10);

  }
  return v7;
}

void __34__AMSODISession__createODISession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  AMSDaemonConnection *v16;

  v3 = a2;
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__53;
  v15 = __Block_byref_object_dispose__53;
  v16 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v12[5], "purchaseServiceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__AMSODISession__createODISession__block_invoke_2;
  v8[3] = &unk_1E2541BE0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "thenWithBlock:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithPromise:", v7);

  _Block_object_dispose(&v11, 8);
}

AMSMutablePromise *__34__AMSODISession__createODISession__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  AMSMutablePromise *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  AMSMutablePromise *v14;
  _QWORD v16[4];
  AMSMutablePromise *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "accountType");
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __34__AMSODISession__createODISession__block_invoke_3;
  v16[3] = &unk_1E2544448;
  v8 = v4;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v17 = v8;
  v18 = v9;
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 48);
  v19 = v11;
  v20 = v12;
  objc_msgSend(v3, "createODISessionWithSessionIdentifier:accountType:bundleIdentifier:completion:", v5, v6, v7, v16);

  v13 = v19;
  v14 = v8;

  return v14;
}

void __34__AMSODISession__createODISession__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v10 = *(_QWORD *)(a1 + 48);
      v14 = 138543618;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ODI session failed for unknown reasons", (uint8_t *)&v14, 0x16u);
    }

    AMSError(0, CFSTR("ODI Error"), CFSTR("Unknown error"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v11);

  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

- (unint64_t)accountType
{
  return self->_accountType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)isTDMEnhancementAvailable
{
  return self->_TDMEnhancementAvailable;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
}

@end
