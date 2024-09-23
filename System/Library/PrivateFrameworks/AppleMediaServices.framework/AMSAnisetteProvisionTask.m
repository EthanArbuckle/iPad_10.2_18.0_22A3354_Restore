@implementation AMSAnisetteProvisionTask

- (AMSAnisetteProvisionTask)initWithData:(id)a3 type:(int64_t)a4 account:(id)a5 bag:(id)a6
{
  id v11;
  id v12;
  id v13;
  AMSAnisetteProvisionTask *v14;
  AMSAnisetteProvisionTask *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AMSAnisetteProvisionTask;
  v14 = -[AMSTask init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_data, a3);
    objc_storeStrong((id *)&v15->_account, a5);
    objc_storeStrong((id *)&v15->_bag, a6);
    v15->_type = a4;
  }

  return v15;
}

- (id)performProvisioning
{
  void *v3;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__AMSAnisetteProvisionTask_performProvisioning__block_invoke;
  v5[3] = &unk_1E253DEE0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  -[AMSTask performBinaryTaskWithBlock:](self, "performBinaryTaskWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

BOOL __47__AMSAnisetteProvisionTask_performProvisioning__block_invoke(uint64_t a1, _QWORD *a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  id v31;
  id v32;
  id v33;
  unsigned int v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[AMSLogConfig sharedAnisetteConfig](AMSLogConfig, "sharedAnisetteConfig");
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
    v9 = objc_msgSend(*(id *)(a1 + 32), "type");
    *(_DWORD *)buf = 138543874;
    v36 = v7;
    v37 = 2114;
    v38 = v8;
    v39 = 2048;
    v40 = v9;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing provisioning. type: %ld", buf, 0x20u);

  }
  v34 = 0;
  v10 = *(void **)(a1 + 32);
  v33 = 0;
  objc_msgSend(v10, "_startProvisioningWithOutputSessionID:error:", &v34, &v33);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (uint64_t)v33;
  if (!(v12 | v11))
  {
    AMSError(307, CFSTR("Anisette Provisioning Failed"), CFSTR("Client data is nil"), 0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  if (v12)
  {
    v13 = 0;
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  v14 = *(void **)(a1 + 32);
  v32 = 0;
  objc_msgSend(v14, "_createFinishProvisioningRequestWithClientData:error:", v11, &v32);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v32;
  if (v15)
  {
    v12 = (uint64_t)v15;
    goto LABEL_11;
  }
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dataTaskPromiseWithRequest:", v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v27, "resultWithError:", &v31);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (uint64_t)v31;

  if (!v12)
  {
    v28 = *(void **)(a1 + 32);
    v30 = 0;
    v29 = objc_msgSend(v28, "_processFinishProvisioningResult:sessionID:error:", v16, v34, &v30);
    v12 = (uint64_t)v30;
    if (!v12 && (v29 & 1) == 0)
    {
      AMSError(307, CFSTR("Anisette Provisioning Failed"), CFSTR("Provisioning finished without an error"), 0);
      v12 = objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_12:
  if (v34)
    fy34trz2st();
  if (v12)
  {
    v17 = objc_retainAutorelease((id)v12);
    *a2 = v17;
    +[AMSLogConfig sharedAnisetteConfig](AMSLogConfig, "sharedAnisetteConfig");
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
      AMSLogableError(v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v20;
      v37 = 2114;
      v38 = v21;
      v39 = 2114;
      v40 = (uint64_t)v22;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Provisioning failed. Error = %{public}@", buf, 0x20u);

    }
  }
  else
  {
    +[AMSLogConfig sharedAnisetteConfig](AMSLogConfig, "sharedAnisetteConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v23;
      v37 = 2114;
      v38 = v24;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Provisioning succeeded.", buf, 0x16u);

    }
  }

  return v12 == 0;
}

- (id)_createFinishProvisioningRequestWithClientData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  AMSURLRequestEncoder *v8;
  void *v9;
  AMSURLRequestEncoder *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id *v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  int64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AMSAnisetteProvisionTask account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [AMSURLRequestEncoder alloc];
  -[AMSAnisetteProvisionTask bag](self, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSURLRequestEncoder initWithBag:](v8, "initWithBag:", v9);

  -[AMSURLRequestEncoder setAccount:](v10, "setAccount:", v7);
  -[AMSURLRequestEncoder setRequestEncoding:](v10, "setRequestEncoding:", 2);
  -[AMSURLRequestEncoder setDialogOptions:](v10, "setDialogOptions:", 1);
  AMSLogKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setLogUUID:](v10, "setLogUUID:", v11);

  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "ams_setNullableObject:forKey:", v13, CFSTR("clientData"));
  +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ams_setNullableObject:forKey:", v14, CFSTR("guid"));

  v15 = -[AMSAnisetteProvisionTask type](self, "type");
  if (v15 == 2)
  {
    -[AMSAnisetteProvisionTask bag](self, "bag");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "URLForKey:", 0x1E254C3C0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    -[AMSURLRequestEncoder requestWithMethod:bagURL:parameters:](v10, "requestWithMethod:bagURL:parameters:", 4, v27, v12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "resultWithError:", a4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_24;
  }
  if (v15 == 1)
  {
    +[AMSKeybag sharedInstance](AMSKeybag, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_DSID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v16, "keybagSyncDataWithAccountID:transactionType:error:", v17, 1, &v45);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v45;

    objc_msgSend(v12, "ams_setNullableObject:forKey:", v18, CFSTR("kbsync"));
    objc_msgSend(v7, "ams_DSID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ams_setNullableObject:forKey:", v20, CFSTR("dsId"));

    if (v19)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v44 = a4;
        v23 = (void *)objc_opt_class();
        v41 = v23;
        AMSLogKey();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "ams_DSID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v40);
        v42 = v18;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v47 = v23;
        a4 = v44;
        v48 = 2114;
        v49 = (uint64_t)v24;
        v50 = 2114;
        v51 = (uint64_t)v25;
        v52 = 2114;
        v53 = (int64_t)v19;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch keybag data for account: %{public}@. Error: %{public}@", buf, 0x2Au);

        v18 = v42;
      }

    }
    -[AMSAnisetteProvisionTask bag](self, "bag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "URLForKey:", 0x1E254C420);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v31, "OSLogObject");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v33 = a4;
    AMSLogKey();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x1E0CB3940];
    v36 = objc_opt_class();
    v37 = v36;
    if (v34)
    {
      AMSLogKey();
      v43 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("%@: [%@] "), v37, v43);
    }
    else
    {
      objc_msgSend(v35, "stringWithFormat:", CFSTR("%@: "), v36);
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v47 = v38;
    v48 = 2048;
    v49 = 1;
    v50 = 2048;
    v51 = 2;
    v52 = 2048;
    v53 = -[AMSAnisetteProvisionTask type](self, "type");
    _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_ERROR, "%{public}@Invalid type. Expected %ld or %ld, got %ld.", buf, 0x2Au);
    if (v34)
    {

      v38 = (void *)v43;
    }

    a4 = v33;
  }

  if (a4)
  {
    AMSError(2, CFSTR("Anisette Provisioning Error"), CFSTR("Invalid type."), 0);
    v30 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
LABEL_24:

  return v30;
}

- (BOOL)_processFinishProvisioningResult:(id)a3 sessionID:(unsigned int)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  const __CFString *v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("transportKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("keybag"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("settingInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;

    if (v9 && v13)
    {
      if (objc_msgSend(v11, "length"))
      {
        +[AMSKeybag sharedInstance](AMSKeybag, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        v15 = objc_msgSend(v14, "importKeybagWithData:error:", v11, &v31);
        v30 = v31;

        if ((v15 & 1) == 0)
        {
          if (a5)
          {
            v28 = v30;
            AMSError(307, CFSTR("Anisette Provisioning Failed"), CFSTR("Failed to import key bag data."), v30);
            v16 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_32;
          }
          v16 = 0;
LABEL_31:
          v28 = v30;
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        v30 = 0;
      }
      if (!objc_msgSend(v11, "length"))
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
          v19 = objc_opt_class();
          AMSLogKey();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v19;
          v36 = 2114;
          v37 = v20;
          _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Anisette provisioning did not provide keybag data", buf, 0x16u);

        }
      }
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v13, 0);
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v9, 0);
      v23 = objc_retainAutorelease(v21);
      objc_msgSend(v23, "bytes");
      objc_msgSend(v23, "length");
      v24 = objc_retainAutorelease(v22);
      objc_msgSend(v24, "bytes");
      objc_msgSend(v24, "length");
      uv5t6nhkui();
      v16 = (_DWORD)v25 == 0;
      if (a5 && (_DWORD)v25)
      {
        v32 = CFSTR("AMSAnisetteErrorCode");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        AMSCustomError(CFSTR("AMSErrorDomain"), 307, CFSTR("Anisette Provisioning Failed"), CFSTR("Failed to finish machine provisioning."), v27, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_31;
    }
  }
  else
  {

    v13 = 0;
  }
  if (a5)
  {
    AMSError(307, CFSTR("Anisette Provisioning Failed"), CFSTR("The finish provisioning request's response was invalid."), 0);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_33:

  return v16;
}

- (id)_startProvisioningWithOutputSessionID:(unsigned int *)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  unsigned int v22;
  uint64_t v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  -[AMSAnisetteProvisionTask data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = -[AMSAnisetteProvisionTask type](self, "type");
    -[AMSAnisetteProvisionTask account](self, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[AMSAnisette _accountIDForType:account:](AMSAnisette, "_accountIDForType:account:", v9, v10);

    v23 = 0;
    v22 = 0;
    -[AMSAnisetteProvisionTask data](self, "data");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "bytes");
    -[AMSAnisetteProvisionTask data](self, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    rsegvyrt87(v11, v13, objc_msgSend(v14, "length"), (uint64_t)&v23, (uint64_t)&v22, (uint64_t)a3);
    v16 = v15;

    if ((_DWORD)v16)
    {
      if (a4)
      {
        v24 = CFSTR("AMSAnisetteErrorCode");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        AMSCustomError(CFSTR("AMSErrorDomain"), 307, CFSTR("Anisette Provisioning Failed"), CFSTR("We failed to start provisioning"), v18, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v19 = 0;
    }
    else
    {
      v21 = objc_alloc(MEMORY[0x1E0C99D50]);
      v19 = (void *)objc_msgSend(v21, "initWithBytes:length:", v23, v22);
    }
    if (v23)
      jk24uiwqrg(v23);
  }
  else
  {
    if (a4)
    {
      AMSError(307, CFSTR("Anisette Provisioning Failed"), CFSTR("No data found"), 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    v19 = 0;
  }
  return v19;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
