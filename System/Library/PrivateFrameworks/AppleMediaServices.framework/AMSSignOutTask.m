@implementation AMSSignOutTask

- (AMSSignOutTask)initWithAccounts:(id)a3
{
  id v5;
  AMSSignOutTask *v6;
  AMSSignOutTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSSignOutTask;
  v6 = -[AMSTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accounts, a3);

  return v7;
}

- (id)performTask
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__AMSSignOutTask_performTask__block_invoke;
  v5[3] = &unk_1E253DB80;
  v5[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "binaryPromiseAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __29__AMSSignOutTask_performTask__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "accounts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
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
      *(_DWORD *)buf = 138543618;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Signing out of all iTunes accounts.", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", AMSAccountMediaTypeAppStoreBeta, AMSAccountMediaTypeAppStoreSandbox, AMSAccountMediaTypeProduction, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ams_iTunesAccountsForMediaTypes:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "thenWithBlock:", &__block_literal_global_118);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __29__AMSSignOutTask_performTask__block_invoke_3;
  v13[3] = &unk_1E253D638;
  v13[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "thenWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __29__AMSSignOutTask_performTask__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "ams_filterUsingTest:", &__block_literal_global_6_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "_signOutOfAccount:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __29__AMSSignOutTask_performTask__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_isLocalAccount") ^ 1;
}

id __29__AMSSignOutTask_performTask__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__AMSSignOutTask_performTask__block_invoke_4;
  v6[3] = &unk_1E2545900;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "ams_mapWithTransform:", v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    +[AMSBinaryPromise promiseWithAll:](AMSBinaryPromise, "promiseWithAll:", v2);
  else
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "promiseAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_signOutOfAccount:(id)a3
{
  id v3;
  char v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  AMSBinaryPromise *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "ams_isiTunesAccount");
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((v4 & 1) != 0)
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
      AMSHashIfNeeded(v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v8;
      v24 = 2114;
      v25 = v9;
      v26 = 2114;
      v27 = v10;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Signing out of an account. account = %{public}@", buf, 0x20u);

    }
    v11 = objc_alloc_init(AMSBinaryPromise);
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBinaryPromise completionHandlerAdapter](v11, "completionHandlerAdapter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAccount:withCompletionHandler:", v3, v13);
  }
  else
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v15;
      v24 = 2114;
      v25 = v16;
      v26 = 2114;
      v27 = v17;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Ignoring a non-iTunes account. account = %{public}@", buf, 0x20u);

    }
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ can only operate on iTunes accounts."), v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    AMSError(2, CFSTR("Non-iTunes Account"), v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v13);
    v11 = (AMSBinaryPromise *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_accounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accounts, 0);
}

@end
