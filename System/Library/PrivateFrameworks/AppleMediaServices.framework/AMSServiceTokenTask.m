@implementation AMSServiceTokenTask

- (AMSServiceTokenTask)initWithAccount:(id)a3 serviceIdentifier:(id)a4
{
  return -[AMSServiceTokenTask initWithAccount:serviceIdentifier:useCachedServiceToken:](self, "initWithAccount:serviceIdentifier:useCachedServiceToken:", a3, a4, 1);
}

- (AMSServiceTokenTask)initWithAccount:(id)a3 serviceIdentifier:(id)a4 useCachedServiceToken:(BOOL)a5
{
  return -[AMSServiceTokenTask initWithAccount:accountStore:serviceIdentifier:useCachedServiceToken:](self, "initWithAccount:accountStore:serviceIdentifier:useCachedServiceToken:", a3, 0, a4, a5);
}

- (AMSServiceTokenTask)initWithAccount:(id)a3 accountStore:(id)a4 serviceIdentifier:(id)a5 useCachedServiceToken:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  AMSServiceTokenTask *v14;
  AMSServiceTokenTask *v15;
  void *v16;
  uint64_t v17;
  Class authKitUpdateTaskClass;
  uint64_t v19;
  NSString *serviceIdentifier;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)AMSServiceTokenTask;
  v14 = -[AMSTask init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_account, a3);
    v16 = v12;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v15->_accountStore, v16);
    if (!v12)

    objc_opt_class();
    v17 = objc_claimAutoreleasedReturnValue();
    authKitUpdateTaskClass = v15->_authKitUpdateTaskClass;
    v15->_authKitUpdateTaskClass = (Class)v17;

    v19 = objc_msgSend(v13, "copy");
    serviceIdentifier = v15->_serviceIdentifier;
    v15->_serviceIdentifier = (NSString *)v19;

    v15->_useCachedServiceToken = a6;
  }

  return v15;
}

- (id)_authKitUpdateTask
{
  AMSAuthenticateOptions *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(AMSAuthenticateOptions);
  -[AMSServiceTokenTask serviceIdentifier](self, "serviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateOptions setServiceIdentifier:](v3, "setServiceIdentifier:", v4);

  -[AMSAuthenticateOptions setServiceTokenOnly:](v3, "setServiceTokenOnly:", 1);
  v5 = objc_alloc(-[AMSServiceTokenTask authKitUpdateTaskClass](self, "authKitUpdateTaskClass"));
  -[AMSServiceTokenTask account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAccount:options:", v6, v3);

  return v7;
}

- (id)perform
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];

  v3 = -[AMSServiceTokenTask useCachedServiceToken](self, "useCachedServiceToken");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    -[AMSServiceTokenTask accountStore](self, "accountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSServiceTokenTask account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSServiceTokenTask serviceIdentifier](self, "serviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_fetchGrandSlamTokenForAccount:withIdentifier:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = __30__AMSServiceTokenTask_perform__block_invoke;
    v14[3] = &unk_1E2543358;
    v14[4] = self;
    objc_msgSend(v8, "continueWithBlock:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __30__AMSServiceTokenTask_perform__block_invoke_10;
  v13[3] = &unk_1E253FFB8;
  v13[4] = self;
  objc_msgSend(v9, "thenWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __30__AMSServiceTokenTask_perform__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (objc_msgSend(v7, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 7))
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      v13 = v12;
      if (v10)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] "), v13, v3);
      }
      else
      {
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "serviceIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v14;
      v34 = 2114;
      v35 = v24;
      v36 = 2114;
      v37 = v25;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@No cached service token found for identifier: %{public}@ | error = %{public}@", buf, 0x20u);

      if (v10)
      {

        v14 = (void *)v3;
      }

    }
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (!v7)
  {
    +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", v6);
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v26 = (void *)v22;
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_25;
  }
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    AMSLogKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = objc_opt_class();
    v20 = v19;
    if (v17)
    {
      AMSLogKey();
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: [%@] "), v20, v3);
    }
    else
    {
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: "), v19);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "serviceIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v33 = v21;
    v34 = 2114;
    v35 = v29;
    v36 = 2114;
    v37 = v30;
    _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cached service token for identifier: %{public}@ | error = %{public}@", buf, 0x20u);

    if (v17)
    {

      v21 = (void *)v3;
    }

  }
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v27;
}

id __30__AMSServiceTokenTask_perform__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_authKitUpdateTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performAuthKitUpdate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__AMSServiceTokenTask_perform__block_invoke_2;
    v9[3] = &unk_1E2545770;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "thenWithBlock:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

id __30__AMSServiceTokenTask_perform__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a2, "authenticationResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_msgSend(*(id *)(a1 + 32), "serviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError(101, CFSTR("Unknown AuthKit Failure"), CFSTR("The AuthKit authentication succeeded, but the results did not contain a service token."), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (ACAccount)account
{
  return self->_account;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (BOOL)useCachedServiceToken
{
  return self->_useCachedServiceToken;
}

- (Class)authKitUpdateTaskClass
{
  return self->_authKitUpdateTaskClass;
}

- (void)setAuthKitUpdateTaskClass:(Class)a3
{
  objc_storeStrong((id *)&self->_authKitUpdateTaskClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authKitUpdateTaskClass, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
