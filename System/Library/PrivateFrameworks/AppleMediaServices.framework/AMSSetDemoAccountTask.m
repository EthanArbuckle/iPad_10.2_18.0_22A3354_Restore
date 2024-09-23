@implementation AMSSetDemoAccountTask

- (AMSSetDemoAccountTask)initWithUsername:(id)a3 password:(id)a4
{
  id v7;
  id v8;
  AMSSetDemoAccountTask *v9;
  uint64_t v10;
  AMSProcessInfo *clientInfo;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSSetDemoAccountTask;
  v9 = -[AMSTask init](&v13, sel_init);
  if (v9)
  {
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v10 = objc_claimAutoreleasedReturnValue();
    clientInfo = v9->_clientInfo;
    v9->_clientInfo = (AMSProcessInfo *)v10;

    objc_storeStrong((id *)&v9->_password, a4);
    objc_storeStrong((id *)&v9->_username, a3);
  }

  return v9;
}

- (id)performTask
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__AMSSetDemoAccountTask_performTask__block_invoke;
  v3[3] = &unk_1E2541E90;
  v3[4] = self;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __36__AMSSetDemoAccountTask_performTask__block_invoke(uint64_t a1, AMSAuthenticateTask **a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  AMSBinaryPromise *v18;
  void *v19;
  BOOL v20;
  AMSAuthenticateTask *v21;
  AMSAuthenticateTask *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  id v50;
  void *v52;
  id v53;
  id v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    objc_msgSend(*(id *)(a1 + 32), "username");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "clientInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v56 = v5;
    v57 = 2114;
    v58 = v6;
    v59 = 2114;
    v60 = v8;
    v61 = 2114;
    v62 = v10;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting up the demo account. username = %{public}@ | clientInfo = %{public}@", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ams_demoAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_12;
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
    v15 = objc_opt_class();
    AMSLogKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v56 = v15;
    v57 = 2114;
    v58 = v16;
    v59 = 2114;
    v60 = v17;
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing the existing demo account. existingAccount = %{public}@", buf, 0x20u);

  }
  v18 = objc_alloc_init(AMSBinaryPromise);
  -[AMSBinaryPromise completionHandlerAdapter](v18, "completionHandlerAdapter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAccount:withCompletionHandler:", v12, v19);

  v54 = 0;
  v20 = -[AMSBinaryPromise resultWithError:](v18, "resultWithError:", &v54);
  v21 = (AMSAuthenticateTask *)v54;
  v22 = v21;
  if (v20)
  {

LABEL_12:
    v18 = objc_alloc_init(AMSAuthenticateOptions);
    -[AMSBinaryPromise setAuthenticationType:](v18, "setAuthenticationType:", 1);
    objc_msgSend(*(id *)(a1 + 32), "clientInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBinaryPromise setClientInfo:](v18, "setClientInfo:", v23);

    -[AMSBinaryPromise setDemoAccountSetup:](v18, "setDemoAccountSetup:", 1);
    -[AMSBinaryPromise setDebugReason:](v18, "setDebugReason:", CFSTR("AMSSetDemoAccountTask performTask"));
    v22 = -[AMSAuthenticateTask initWithAccount:options:]([AMSAuthenticateTask alloc], "initWithAccount:options:", 0, v18);
    objc_msgSend(*(id *)(a1 + 32), "password");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateTask setRawPassword:](v22, "setRawPassword:", v24);

    objc_msgSend(*(id *)(a1 + 32), "username");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateTask setUsername:](v22, "setUsername:", v25);

    -[AMSAuthenticateTask performAuthentication](v22, "performAuthentication");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    objc_msgSend(v26, "resultWithError:", &v53);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v53;

    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v27)
    {
      if (!v29)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "OSLogObject");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v49 = v28;
        v32 = v12;
        v33 = objc_opt_class();
        AMSLogKey();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "account");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v35);
        v52 = v11;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v56 = v33;
        v12 = v32;
        v28 = v49;
        v57 = 2114;
        v58 = v34;
        v59 = 2114;
        v60 = v36;
        _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully setup the demo account. account = %{public}@", buf, 0x20u);

        v11 = v52;
      }

      objc_msgSend(v27, "account");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v29)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "OSLogObject");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = objc_opt_class();
        AMSLogKey();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v28);
        v50 = v28;
        v46 = v12;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v56 = v44;
        v57 = 2114;
        v58 = v45;
        v59 = 2114;
        v60 = v47;
        _os_log_impl(&dword_18C849000, v43, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to setup the demo account. error = %{public}@", buf, 0x20u);

        v12 = v46;
        v28 = v50;

      }
      v37 = 0;
      if (a2)
        *a2 = (AMSAuthenticateTask *)objc_retainAutorelease(v28);
    }

    goto LABEL_32;
  }
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v38, "OSLogObject");
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    v40 = objc_opt_class();
    AMSLogKey();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v22);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v56 = v40;
    v57 = 2114;
    v58 = v41;
    v59 = 2114;
    v60 = v42;
    _os_log_impl(&dword_18C849000, v39, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to remove the existing demo account. error = %{public}@", buf, 0x20u);

  }
  if (a2)
  {
    v22 = objc_retainAutorelease(v22);
    v37 = 0;
    *a2 = v22;
  }
  else
  {
    v37 = 0;
  }
LABEL_32:

  return v37;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

@end
