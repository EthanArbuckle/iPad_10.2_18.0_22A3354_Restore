@implementation AMSAgeVerificationTask

- (AMSAgeVerificationTask)initWithAccount:(id)a3 bag:(id)a4 options:(id)a5 presentationDelegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AMSAgeVerificationTask *v15;
  AMSAgeVerificationTask *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AMSAgeVerificationTask;
  v15 = -[AMSTask init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    objc_storeStrong((id *)&v16->_bag, a4);
    objc_storeStrong((id *)&v16->_options, a5);
    objc_storeStrong((id *)&v16->_presentationDelegate, a6);
  }

  return v16;
}

- (id)isVerificationNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  AMSAgeVerificationTask *v25;

  v3 = (void *)objc_opt_class();
  -[AMSAgeVerificationTask account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAgeVerificationTask bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_errorCheckWithAccount:bag:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAgeVerificationTask account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagAgeVerificationExpiration);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSAgeVerificationTask bag](self, "bag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "BOOLForKey:", CFSTR("isExplicitContentAgeVerificationRequired"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valuePromise");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSAgeVerificationTask bag](self, "bag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "integerForKey:", CFSTR("korAgeVerificationWarningThresholdDays"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valuePromise");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __46__AMSAgeVerificationTask_isVerificationNeeded__block_invoke;
    v21[3] = &unk_1E253DE20;
    v22 = v16;
    v23 = v10;
    v24 = v8;
    v25 = self;
    v17 = v8;
    v18 = v10;
    v19 = v16;
    objc_msgSend(v13, "thenWithBlock:", v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

id __46__AMSAgeVerificationTask_isVerificationNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__AMSAgeVerificationTask_isVerificationNeeded__block_invoke_2;
  v10[3] = &unk_1E253DDF8;
  v4 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v3;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v13 = v5;
  v14 = v6;
  v7 = v3;
  objc_msgSend(v4, "continueWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __46__AMSAgeVerificationTask_isVerificationNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  __CFString *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSAgeVerificationCore _resultForAccountVerificationExpirationTimestamp:withBagControlledAgeVerificationRequired:bagWarningThresholdDays:at:](AMSAgeVerificationCore, "_resultForAccountVerificationExpirationTimestamp:withBagControlledAgeVerificationRequired:bagWarningThresholdDays:at:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 56), "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = AMSAccountFlagAgeVerificationExpiration;
    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "requiredType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545666;
    v17 = v7;
    v18 = 2114;
    v19 = v8;
    v20 = 2114;
    v21 = CFSTR("isExplicitContentAgeVerificationRequired");
    v22 = 2114;
    v23 = v9;
    v24 = 2114;
    v25 = CFSTR("korAgeVerificationWarningThresholdDays");
    v26 = 2114;
    v27 = v3;
    v28 = 2114;
    v29 = v10;
    v30 = 2114;
    v31 = v11;
    v32 = 2114;
    v33 = v15;
    v34 = 2114;
    v35 = v12;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@=%{public}@ and %{public}@=%{public}@. For account %{public}@, %{public}@=%{public}@, therefore requiredType=%{public}@", buf, 0x66u);

  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)performTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_class();
  -[AMSAgeVerificationTask account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAgeVerificationTask bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_errorCheckWithAccount:bag:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSAgeVerificationTask account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAgeVerificationTask bag](self, "bag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAgeVerificationTask _performTaskForAccount:withBag:](self, "_performTaskForAccount:withBag:", v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)_errorCheckWithAccount:(id)a3 bag:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v9 = CFSTR("Age Verification requires an account");
LABEL_6:
    AMSCustomError(CFSTR("AMSErrorDomain"), 2, v9, 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!v6)
  {
    v9 = CFSTR("Age Verification requires a bag");
    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (id)_performTaskForAccount:(id)a3 withBag:(id)a4
{
  void *v4;
  void *v5;

  AMSCustomError(CFSTR("AMSErrorDomain"), 12, CFSTR("Not available on this platform, try AMSUIAgeVerificationTask"), 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_startObservingAccountStoreChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountStoreDidChangeNotification_, *MEMORY[0x1E0C8F1C0], 0);

}

- (void)_stopObservingAccountStoreChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C8F1C0], 0);

}

- (void)_handleAccountStoreDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSAgeVerificationTask _handleAccountStoreDidChangeNotification:at:](self, "_handleAccountStoreDidChangeNotification:at:", v5, v6);

}

- (void)_handleAccountStoreDidChangeNotification:(id)a3 at:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[AMSAgeVerificationTask account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_activeiTunesAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ams_altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", v10))
  {

  }
  else
  {
    objc_msgSend(v8, "ams_DSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ams_DSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_5;
  }
  v14 = v8;

  v6 = v14;
LABEL_5:
  objc_msgSend(v6, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagAgeVerificationExpiration);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[AMSAgeVerificationCore _isAgeVerificationNeededForExpiration:at:](AMSAgeVerificationCore, "_isAgeVerificationNeededForExpiration:at:", v15, v5);

  if (!v16)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      v19 = objc_opt_class();
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v19;
      v24 = 2114;
      v25 = v20;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dismissing System Alert Dialog", (uint8_t *)&v22, 0x16u);

    }
    -[AMSAgeVerificationTask _stopObservingAccountStoreChanges](self, "_stopObservingAccountStoreChanges");
    -[AMSAgeVerificationTask task](self, "task");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_dismiss");

  }
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1 != -1)
    dispatch_once(&_MergedGlobals_1, &__block_literal_global_5);
  return (NSString *)(id)qword_1ECEACA18;
}

void __39__AMSAgeVerificationTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACA18;
  qword_1ECEACA18 = (uint64_t)CFSTR("AMSAgeVerification");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACA20 != -1)
    dispatch_once(&qword_1ECEACA20, &__block_literal_global_24);
  return (NSString *)(id)qword_1ECEACA28;
}

void __46__AMSAgeVerificationTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACA28;
  qword_1ECEACA28 = (uint64_t)CFSTR("1");

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

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSString)pincode
{
  return self->_pincode;
}

- (void)setPincode:(id)a3
{
  objc_storeStrong((id *)&self->_pincode, a3);
}

- (AMSRequestPresentationDelegate)presentationDelegate
{
  return self->_presentationDelegate;
}

- (AMSQRCodeDialogTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_presentationDelegate, 0);
  objc_storeStrong((id *)&self->_pincode, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
