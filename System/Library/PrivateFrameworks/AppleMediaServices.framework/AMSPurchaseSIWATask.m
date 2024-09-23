@implementation AMSPurchaseSIWATask

- (AMSPurchaseSIWATask)initWithPurchaseSIWA:(id)a3 bag:(id)a4
{
  id v6;
  AMSPurchaseSIWATask *v7;
  AMSPurchaseSIWATask *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSPurchaseSIWATask;
  v7 = -[AMSPurchaseTask initWithPurchase:bag:](&v10, sel_initWithPurchase_bag_, v6, a4);
  v8 = v7;
  if (v7)
    -[AMSPurchaseSIWATask setPurchaseSIWA:](v7, "setPurchaseSIWA:", v6);

  return v8;
}

- (BOOL)performPreActionRequestForTaskInfo:(id)a3 requiresAuthorization:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  const char *v27;
  void *v28;
  BOOL v29;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v6 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = -[AMSPurchaseSIWATask _willRequireAskToBuyForTaskInfo:](self, "_willRequireAskToBuyForTaskInfo:", v8);
  if ((_DWORD)v9)
  {
    -[AMSPurchaseTask purchaseInfo](self, "purchaseInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasBeenAuthedForBuy");

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
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v40 = (id)objc_opt_class();
        v41 = 2114;
        v42 = v10;
        v15 = v40;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cancelling SiWA because pre-auth and AtB is enabled for this purchase", buf, 0x16u);

      }
      -[AMSPurchaseSIWATask _cancelAuthorization](self, "_cancelAuthorization");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v17 = (id)objc_msgSend(v16, "resultWithError:", &v38);
      v18 = v38;

      if (v18)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v19, "OSLogObject");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v40 = v21;
          v41 = 2114;
          v42 = v10;
          v43 = 2114;
          v44 = v18;
          v22 = v21;
          _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to cancel pre-auth SiWA authorization with error %{public}@", buf, 0x20u);

        }
      }
      AMSError(12, CFSTR("Cancelled initiated SiWA due to pre-auth and AtB"), CFSTR("Did not continue SiWA authorization due to pre-auth and AtB being enabled"), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPurchaseSIWATask setSiwaError:](self, "setSiwaError:", v23);

    }
    else
    {
      AMSError(12, CFSTR("Skipped SiWA due to AtB"), CFSTR("Did not begin SiWA authorization due to AtB being enabled"), 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      -[AMSPurchaseSIWATask setSiwaError:](self, "setSiwaError:", v18);
    }

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    v28 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v40 = v28;
    v41 = 2114;
    v42 = v10;
    v26 = v28;
    v27 = "%{public}@: [%{public}@] Skipping SiWA commencement because AtB is enabled for this purchase";
LABEL_24:
    _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, v27, buf, 0x16u);

LABEL_25:
LABEL_26:
    v29 = 1;
    goto LABEL_27;
  }
  if (-[AMSPurchaseSIWATask _beginAuthorizationWasPerformed](self, "_beginAuthorizationWasPerformed"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 138543618;
    v40 = (id)objc_opt_class();
    v41 = 2114;
    v42 = v10;
    v26 = v40;
    v27 = "%{public}@: [%{public}@] Will not commence SiWA authorization during pre-action step due to it already being performed";
    goto LABEL_24;
  }
  -[AMSPurchaseSIWATask setPurchaseRequiresAuthorization:](self, "setPurchaseRequiresAuthorization:", v6);
  -[AMSPurchaseSIWATask _beginAuthorization](self, "_beginAuthorization");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v32 = (id)objc_msgSend(v31, "resultWithError:", &v37);
  v24 = v37;

  if (v24)
  {
    -[AMSPurchaseSIWATask setSiwaError:](self, "setSiwaError:", v24);
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v33, "OSLogObject");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v40 = v35;
      v41 = 2114;
      v42 = v10;
      v43 = 2114;
      v44 = v24;
      v36 = v35;
      _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to begin SiWA authorization with error %{public}@", buf, 0x20u);

    }
  }
  if (objc_msgSend(v24, "code") != -7003 && objc_msgSend(v24, "code") != -7034)
    goto LABEL_26;
  if (a5)
  {
    v24 = objc_retainAutorelease(v24);
    v29 = 0;
    *a5 = v24;
  }
  else
  {
    v29 = 0;
  }
LABEL_27:

  return v29;
}

- (id)performPreauthenticate
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[AMSPurchaseSIWATask setPurchaseRequiresAuthorization:](self, "setPurchaseRequiresAuthorization:", 1);
  -[AMSPurchaseSIWATask _beginAuthorization](self, "_beginAuthorization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__AMSPurchaseSIWATask_performPreauthenticate__block_invoke;
  v6[3] = &unk_1E2545180;
  v6[4] = self;
  objc_msgSend(v3, "continueWithBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __45__AMSPurchaseSIWATask_performPreauthenticate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setSiwaError:", v4);
  if (v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend(v8, "purchaseSIWA");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v7;
      v17 = 2114;
      v18 = v11;
      v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to begin SiWA authorization during pre-authentication with error %{public}@", buf, 0x20u);

    }
  }
  v14.receiver = *(id *)(a1 + 32);
  v14.super_class = (Class)AMSPurchaseSIWATask;
  objc_msgSendSuper2(&v14, sel_performPreauthenticate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)preauthenticateOptions
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSPurchaseSIWATask;
  -[AMSPurchaseTask preauthenticateOptions](&v7, sel_preauthenticateOptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchaseSIWATask purchaseSIWA](self, "purchaseSIWA");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appProvidedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAppProvidedData:", v5);

  return v3;
}

- (id)performPurchaseSIWA
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[AMSPurchaseTask performPurchase](self, "performPurchase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__AMSPurchaseSIWATask_performPurchaseSIWA__block_invoke;
  v6[3] = &unk_1E25451A8;
  v6[4] = self;
  objc_msgSend(v3, "continueWithBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __42__AMSPurchaseSIWATask_performPurchaseSIWA__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  AMSPurchaseSIWAAuthorizationResult *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  AMSPurchaseSIWAAuthorizationResult *v33;
  void *v34;
  NSObject *v35;
  id v36;
  AMSPurchaseSIWAAuthorizationResult *v37;
  void *v38;
  AMSPurchaseSIWAResult *v39;
  NSObject *v40;
  id v41;
  AMSPurchaseSIWAResult *v42;
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "purchaseSIWA");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(*(id *)(a1 + 32), "_siwaDidCommence");
  if (!v6)
  {
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
        *(_DWORD *)buf = 138543618;
        v47 = (id)objc_opt_class();
        v48 = 2114;
        v49 = v8;
        v36 = v47;
        _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successful purchase occurred however SiWA did not commence", buf, 0x16u);

      }
      v37 = [AMSPurchaseSIWAAuthorizationResult alloc];
      objc_msgSend(*(id *)(a1 + 32), "siwaError");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[AMSPurchaseSIWAAuthorizationResult initWithAuthorization:error:](v37, "initWithAuthorization:error:", 0, v38);

      v39 = -[AMSPurchaseSIWAResult initWithPurchaseResult:authorizationResult:]([AMSPurchaseSIWAResult alloc], "initWithPurchaseResult:authorizationResult:", v5, v27);
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v39);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_39;
    }
    v21 = objc_msgSend(*(id *)(a1 + 32), "purchaseRequiresAuthorization");
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v21)
    {
      if (!v22)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v47 = (id)objc_opt_class();
        v48 = 2114;
        v49 = v8;
        v25 = v47;
        _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Continuing SiWA authorization after a successful purchase", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "_continueAuthorization");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      objc_msgSend(v26, "resultWithError:", &v44);
      v27 = (AMSPurchaseSIWAAuthorizationResult *)objc_claimAutoreleasedReturnValue();
      v28 = v44;

      if (v28)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v29)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v29, "OSLogObject");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v47 = v31;
          v48 = 2114;
          v49 = v8;
          v50 = 2114;
          v51 = v28;
          v32 = v31;
          _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to continue SiWA authorization with error %{public}@", buf, 0x20u);

        }
        v33 = -[AMSPurchaseSIWAAuthorizationResult initWithAuthorization:error:]([AMSPurchaseSIWAAuthorizationResult alloc], "initWithAuthorization:error:", 0, v28);

        goto LABEL_38;
      }
    }
    else
    {
      if (!v22)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "OSLogObject");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v47 = (id)objc_opt_class();
        v48 = 2114;
        v49 = v8;
        v41 = v47;
        _os_log_impl(&dword_18C849000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] ASN was active so using cached SiWA authorization", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "authorization");
      v27 = (AMSPurchaseSIWAAuthorizationResult *)objc_claimAutoreleasedReturnValue();
    }
    v33 = -[AMSPurchaseSIWAAuthorizationResult initWithAuthorization:error:]([AMSPurchaseSIWAAuthorizationResult alloc], "initWithAuthorization:error:", v27, 0);
LABEL_38:
    v42 = -[AMSPurchaseSIWAResult initWithPurchaseResult:authorizationResult:]([AMSPurchaseSIWAResult alloc], "initWithPurchaseResult:authorizationResult:", v5, v33);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v42);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_39:
    goto LABEL_40;
  }
  if (v9)
  {
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
      *(_DWORD *)buf = 138543618;
      v47 = (id)objc_opt_class();
      v48 = 2114;
      v49 = v8;
      v12 = v47;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cancelling SiWA authorization due to a failed purchase", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_cancelAuthorization");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v14 = (id)objc_msgSend(v13, "resultWithError:", &v45);
    v15 = v45;

    if (v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v47 = v18;
        v48 = 2114;
        v49 = v8;
        v50 = 2114;
        v51 = v15;
        v19 = v18;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to cancel SiWA authorization with error %{public}@", buf, 0x20u);

      }
    }

  }
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v20;
}

- (id)_beginAuthorization
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  AMSPromise *v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void *v33;
  AMSPurchaseSIWATask *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *);
  void *v38;
  AMSPurchaseSIWATask *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[AMSPurchaseSIWATask purchaseSIWA](self, "purchaseSIWA");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v5;
    v42 = 2114;
    v43 = v8;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Commencing begin authorization", buf, 0x16u);

  }
  v9 = -[AMSPurchaseSIWATask newAuthorizationController](self, "newAuthorizationController");
  v10 = -[AMSPurchaseSIWATask purchaseRequiresAuthorization](self, "purchaseRequiresAuthorization");
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
  {
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      -[AMSPurchaseSIWATask purchaseSIWA](self, "purchaseSIWA");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v14;
      v42 = 2114;
      v43 = v17;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invoking beginAuthorization", buf, 0x16u);

    }
    v18 = objc_alloc_init(AMSPromise);
    -[AMSPurchaseSIWATask requestContext](self, "requestContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPromise completionHandlerAdapter](v18, "completionHandlerAdapter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginAuthorizationWithContext:completion:", v19, v20);

    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __42__AMSPurchaseSIWATask__beginAuthorization__block_invoke;
    v38 = &unk_1E25451D0;
    v39 = self;
    v21 = &v35;
  }
  else
  {
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_opt_class();
      v24 = v23;
      -[AMSPurchaseSIWATask purchaseSIWA](self, "purchaseSIWA");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v23;
      v42 = 2114;
      v43 = v26;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invoking performAuthorization", buf, 0x16u);

    }
    v18 = objc_alloc_init(AMSPromise);
    -[AMSPurchaseSIWATask requestContext](self, "requestContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPromise completionHandlerAdapter](v18, "completionHandlerAdapter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performAuthorizationWithContext:completion:", v27, v28);

    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __42__AMSPurchaseSIWATask__beginAuthorization__block_invoke_17;
    v33 = &unk_1E25451F8;
    v34 = self;
    v21 = &v30;
  }
  -[AMSPromise addSuccessBlock:](v18, "addSuccessBlock:", v21, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39);

  return v18;
}

void __42__AMSPurchaseSIWATask__beginAuthorization__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "selectedRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setContinuationRequestIdentifier:", v3);

}

uint64_t __42__AMSPurchaseSIWATask__beginAuthorization__block_invoke_17(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAuthorization:", a2);
}

- (id)_continueAuthorization
{
  void *v3;
  AMSPromise *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[AMSPurchaseTask purchaseInfo](self, "purchaseInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchaseSIWATask _updateRequestContextWithPurchaseInfo:](self, "_updateRequestContextWithPurchaseInfo:", v3);

  v4 = objc_alloc_init(AMSPromise);
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[AMSPurchaseSIWATask purchaseSIWA](self, "purchaseSIWA");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v7;
    v17 = 2114;
    v18 = v10;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Commencing continue authorization", (uint8_t *)&v15, 0x16u);

  }
  v11 = -[AMSPurchaseSIWATask newAuthorizationController](self, "newAuthorizationController");
  -[AMSPurchaseSIWATask requestContext](self, "requestContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPromise completionHandlerAdapter](v4, "completionHandlerAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "continueAuthorizationWithContext:completion:", v12, v13);

  return v4;
}

- (id)_cancelAuthorization
{
  void *v3;
  AMSPromise *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[AMSPurchaseTask purchaseInfo](self, "purchaseInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchaseSIWATask _updateRequestContextWithPurchaseInfo:](self, "_updateRequestContextWithPurchaseInfo:", v3);

  v4 = objc_alloc_init(AMSPromise);
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[AMSPurchaseSIWATask purchaseSIWA](self, "purchaseSIWA");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v7;
    v17 = 2114;
    v18 = v10;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Commencing cancel authorization", (uint8_t *)&v15, 0x16u);

  }
  v11 = -[AMSPurchaseSIWATask newAuthorizationController](self, "newAuthorizationController");
  -[AMSPurchaseSIWATask requestContext](self, "requestContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPromise errorOnlyCompletionHandlerAdapter](v4, "errorOnlyCompletionHandlerAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancelAuthorizationWithContext:completion:", v12, v13);

  return v4;
}

- (void)_updateRequestContextWithPurchaseInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[AMSPurchaseSIWATask continuationRequestIdentifier](self, "continuationRequestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchaseSIWATask requestContext](self, "requestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set_continuationRequestIdentifier:", v5);

  objc_msgSend(v18, "localAuthContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "externalizedContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchaseSIWATask requestContext](self, "requestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "set_externalLocalAuthData:", v8);

  -[AMSPurchaseSIWATask requestContext](self, "requestContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_externalLocalAuthData");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
LABEL_5:

    goto LABEL_6;
  }
  -[AMSPurchaseSIWATask purchaseSIWA](self, "purchaseSIWA");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serviceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v18, "idmsTokens");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPurchaseSIWATask purchaseSIWA](self, "purchaseSIWA");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serviceID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPurchaseSIWATask requestContext](self, "requestContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "set_externalAuthToken:", v16);

    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)_beginAuthorizationWasPerformed
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[AMSPurchaseSIWATask continuationRequestIdentifier](self, "continuationRequestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[AMSPurchaseSIWATask authorization](self, "authorization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[AMSPurchaseSIWATask siwaError](self, "siwaError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (BOOL)_siwaDidCommence
{
  void *v3;
  BOOL v4;

  if (!-[AMSPurchaseSIWATask _beginAuthorizationWasPerformed](self, "_beginAuthorizationWasPerformed"))
    return 0;
  -[AMSPurchaseSIWATask siwaError](self, "siwaError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)_willRequireAskToBuyForTaskInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_valueForHTTPHeaderField:", CFSTR("buyproductwillrequireatb"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("true"));

  return v6;
}

- (id)newAuthorizationController
{
  return objc_alloc_init(MEMORY[0x1E0D00158]);
}

- (AKCredentialRequestContext)requestContext
{
  AKCredentialRequestContext *requestContext;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  AKCredentialRequestContext *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  requestContext = self->_requestContext;
  if (!requestContext)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D00260]);
    -[AMSPurchaseSIWATask purchaseSIWA](self, "purchaseSIWA");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "teamID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTeamID:", v6);

    -[AMSPurchaseSIWATask purchaseSIWA](self, "purchaseSIWA");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBundleID:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D001D0]), "initWithProxiedClientContext:", v4);
    v10 = objc_alloc_init(MEMORY[0x1E0D00170]);
    v11 = *MEMORY[0x1E0CFFFD0];
    v15[0] = *MEMORY[0x1E0CFFFD8];
    v15[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRequestedScopes:", v12);

    objc_msgSend(v9, "setAuthorizationRequest:", v10);
    v13 = self->_requestContext;
    self->_requestContext = (AKCredentialRequestContext *)v9;

    requestContext = self->_requestContext;
  }
  return requestContext;
}

- (AMSPurchaseSIWA)purchaseSIWA
{
  return self->_purchaseSIWA;
}

- (void)setPurchaseSIWA:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseSIWA, a3);
}

- (void)setRequestContext:(id)a3
{
  objc_storeStrong((id *)&self->_requestContext, a3);
}

- (NSUUID)continuationRequestIdentifier
{
  return self->_continuationRequestIdentifier;
}

- (void)setContinuationRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSError)siwaError
{
  return self->_siwaError;
}

- (void)setSiwaError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)purchaseRequiresAuthorization
{
  return self->_purchaseRequiresAuthorization;
}

- (void)setPurchaseRequiresAuthorization:(BOOL)a3
{
  self->_purchaseRequiresAuthorization = a3;
}

- (AKAuthorization)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
  objc_storeStrong((id *)&self->_authorization, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_siwaError, 0);
  objc_storeStrong((id *)&self->_continuationRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_purchaseSIWA, 0);
}

@end
