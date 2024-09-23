@implementation AMSSyncAccountFlagsTask

- (AMSSyncAccountFlagsTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSSyncAccountFlagsTask *v9;
  AMSSyncAccountFlagsTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSSyncAccountFlagsTask;
  v9 = -[AMSTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

- (id)performSync
{
  objc_super v3;
  _QWORD v4[5];

  v4[1] = 3221225472;
  v4[2] = __38__AMSSyncAccountFlagsTask_performSync__block_invoke;
  v4[3] = &unk_1E2546120;
  v4[4] = self;
  v3.receiver = self;
  v3.super_class = (Class)AMSSyncAccountFlagsTask;
  v4[0] = MEMORY[0x1E0C809B0];
  -[AMSTask performTaskWithBlock:](&v3, sel_performTaskWithBlock_, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

AMSSyncAccountFlagsResult *__38__AMSSyncAccountFlagsTask_performSync__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  int v5;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AMSURLRequestEncoder *v16;
  void *v17;
  AMSURLRequestEncoder *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  AMSURLRequestEncoder *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  AMSSyncAccountFlagsResult *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v65;
  void *v66;
  NSObject *log;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  _QWORD *v72;
  void *v73;
  id v74;
  id v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ams_isLocalAccount");

  if (v5)
  {
    AMSError(2, CFSTR("Invalid Parameter"), CFSTR("We can't sync flags from the local account."), 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    return (AMSSyncAccountFlagsResult *)0;
  }
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    objc_msgSend(*(id *)(a1 + 32), "account");
    v72 = a2;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ams_accountFlags");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v77 = v9;
    v78 = 2114;
    v79 = v10;
    v80 = 2114;
    v81 = v12;
    v82 = 2114;
    v83 = v15;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing account flags. account = %{public}@ | flags = %{public}@", buf, 0x2Au);

    a2 = v72;
  }

  v16 = [AMSURLRequestEncoder alloc];
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AMSURLRequestEncoder initWithBag:](v16, "initWithBag:", v17);

  objc_msgSend(*(id *)(a1 + 32), "account");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setAccount:](v18, "setAccount:", v19);

  -[AMSURLRequestEncoder setRequestEncoding:](v18, "setRequestEncoding:", 3);
  AMSLogKey();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setLogUUID:](v18, "setLogUUID:", v20);

  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "account");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ams_accountFlags");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = v23;
  else
    v25 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("accountFlags"));

  +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ams_setNullableObject:forKey:", v26, CFSTR("guid"));

  objc_msgSend(*(id *)(a1 + 32), "bag");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "URLForKey:", 0x1E254C360);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
  {
    v29 = v18;
    v30 = 2;
    v31 = v28;
    v32 = 0;
  }
  else
  {
    v29 = v18;
    v30 = 4;
    v31 = v28;
    v32 = v21;
  }
  -[AMSURLRequestEncoder requestWithMethod:bagURL:parameters:](v29, "requestWithMethod:bagURL:parameters:", v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  objc_msgSend(v33, "resultWithError:", &v75);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v75;
  if (v35)
  {
    v36 = v35;
    v37 = 0;
  }
  else
  {
    v71 = v28;
    +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v34;
    v40 = v38;
    v73 = v39;
    objc_msgSend(v38, "dataTaskPromiseWithRequest:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0;
    objc_msgSend(v41, "resultWithError:", &v74);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v74;

    if (!v36)
    {
      v70 = v37;
      objc_msgSend(v37, "object");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v42 = v44;
      else
        v42 = 0;
      v34 = v73;

      objc_msgSend(v42, "ams_accountFlags");
      v45 = objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = (void *)v46;
      if (v45)
      {
        if (!v46)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v47, "OSLogObject");
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = objc_opt_class();
          AMSLogKey();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v77 = v49;
          v78 = 2114;
          v79 = v50;
          _os_log_impl(&dword_18C849000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully synced the account flags.", buf, 0x16u);

        }
        v43 = -[AMSSyncAccountFlagsResult initWithAccountFlags:]([AMSSyncAccountFlagsResult alloc], "initWithAccountFlags:", v45);
        objc_msgSend(*(id *)(a1 + 32), "account");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "ams_accountFlags");
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = (void *)v45;
        v54 = (void *)v52;
        v68 = v53;
        v55 = objc_msgSend(v53, "isEqualToDictionary:", v52);

        v37 = v70;
        v28 = v71;
        if ((v55 & 1) == 0)
        {
          +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v56)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v56, "OSLogObject");
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            log = v57;
            v58 = objc_opt_class();
            AMSLogKey();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v77 = v58;
            v57 = log;
            v78 = 2114;
            v79 = v59;
            _os_log_impl(&dword_18C849000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The server provided updated account flags.", buf, 0x16u);

            v37 = v70;
          }

          objc_msgSend(*(id *)(a1 + 32), "account");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "ams_setAccountFlags:", v68);

          objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "account");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (id)objc_msgSend(v61, "ams_saveAccount:verifyCredentials:", v62, 0);

        }
        v34 = v73;
      }
      else
      {
        if (!v46)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v47, "OSLogObject");
        v64 = objc_claimAutoreleasedReturnValue();
        v37 = v70;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          v69 = objc_opt_class();
          AMSLogKey();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "object");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v77 = v69;
          v78 = 2114;
          v79 = v65;
          v80 = 2114;
          v81 = v66;
          _os_log_impl(&dword_18C849000, v64, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The response was invalid. response = %{public}@", buf, 0x20u);

          v34 = v73;
        }

        AMSError(301, CFSTR("Invalid Response"), CFSTR("The request was successful, but the server's response was invalid."), 0);
        v43 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
        v28 = v71;
      }
      goto LABEL_18;
    }
    v34 = v73;
  }
  v42 = objc_retainAutorelease(v36);
  v43 = 0;
  *a2 = v42;
LABEL_18:

  return v43;
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
