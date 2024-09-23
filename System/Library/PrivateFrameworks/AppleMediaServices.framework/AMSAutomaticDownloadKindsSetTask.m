@implementation AMSAutomaticDownloadKindsSetTask

- (AMSAutomaticDownloadKindsSetTask)initWithEnabledMediaKinds:(id)a3 account:(id)a4 bag:(id)a5 presentationDelegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AMSAutomaticDownloadKindsSetTask *v14;
  AMSAutomaticDownloadKindsSetTask *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  AMSProcessInfo *clientInfo;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AMSAutomaticDownloadKindsSetTask;
  v14 = -[AMSTask init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_account, a4);
    v16 = objc_msgSend(v10, "copy");
    v17 = (void *)v16;
    if (v16)
      v18 = (void *)v16;
    else
      v18 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v15->_enabledMediaKinds, v18);

    objc_storeStrong((id *)&v15->_bag, a5);
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v19 = objc_claimAutoreleasedReturnValue();
    clientInfo = v15->_clientInfo;
    v15->_clientInfo = (AMSProcessInfo *)v19;

    objc_storeWeak((id *)&v15->_presentationDelegate, v13);
  }

  return v15;
}

- (AMSAutomaticDownloadKindsSetTask)initWithEnabledMediaKinds:(id)a3 account:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSAutomaticDownloadKindsSetTask *v11;
  AMSAutomaticDownloadKindsSetTask *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  AMSProcessInfo *clientInfo;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AMSAutomaticDownloadKindsSetTask;
  v11 = -[AMSTask init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a4);
    v13 = objc_msgSend(v8, "copy");
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v12->_enabledMediaKinds, v15);

    objc_storeStrong((id *)&v12->_bag, a5);
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v16 = objc_claimAutoreleasedReturnValue();
    clientInfo = v12->_clientInfo;
    v12->_clientInfo = (AMSProcessInfo *)v16;

  }
  return v12;
}

- (id)perform
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  AMSAutomaticDownloadKindsResult *v18;
  void *v19;
  AMSAutomaticDownloadKindsResult *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void *v27;
  void *v28;
  AMSURLRequestEncoder *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v42;
  _QWORD v43[5];
  _QWORD v44[4];
  id v45;
  id location;
  _QWORD v47[5];
  _BYTE buf[24];
  uint64_t (*v49)(uint64_t, uint64_t);
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[AMSAutomaticDownloadKindsSetTask account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    AMSError(2, CFSTR("Invalid Parameter"), CFSTR("An account is required."), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[AMSAutomaticDownloadKindsSetTask account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ams_isLocalAccount");

  if (!v5)
  {
    -[AMSAutomaticDownloadKindsSetTask account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E2548220);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;

      if (v11)
      {
        -[AMSAutomaticDownloadKindsSetTask enabledMediaKinds](self, "enabledMediaKinds");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToArray:", v12);

        if (v13)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v14, "OSLogObject");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = objc_opt_class();
            AMSLogKey();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v16;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v17;
            _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Enabled media kinds are the same as our currently set values, skipping network request.", buf, 0x16u);

          }
          v18 = [AMSAutomaticDownloadKindsResult alloc];
          -[AMSAutomaticDownloadKindsSetTask account](self, "account");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[AMSAutomaticDownloadKindsResult initWithAccount:andEnabledMediaKinds:](v18, "initWithAccount:andEnabledMediaKinds:", v19, v11);

          +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v20);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

          return v8;
        }
      }
    }
    else
    {

      v11 = 0;
    }
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAutomaticDownloadKindsSetTask account](self, "account");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v25);
      v26 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      -[AMSAutomaticDownloadKindsSetTask enabledMediaKinds](self, "enabledMediaKinds");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2114;
      v49 = v26;
      LOWORD(v50) = 2114;
      *(_QWORD *)((char *)&v50 + 2) = v28;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing automatic download kinds. account = %{public}@ | enabled media kinds = %{public}@", buf, 0x2Au);

    }
    v29 = [AMSURLRequestEncoder alloc];
    -[AMSAutomaticDownloadKindsSetTask bag](self, "bag");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[AMSURLRequestEncoder initWithBag:](v29, "initWithBag:", v30);

    -[AMSAutomaticDownloadKindsSetTask account](self, "account");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAutomaticDownloadKindsResult setAccount:](v20, "setAccount:", v31);

    -[AMSAutomaticDownloadKindsResult setRequestEncoding:](v20, "setRequestEncoding:", 2);
    AMSLogKey();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAutomaticDownloadKindsResult setLogUUID:](v20, "setLogUUID:", v32);

    -[AMSAutomaticDownloadKindsSetTask clientInfo](self, "clientInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAutomaticDownloadKindsResult setClientInfo:](v20, "setClientInfo:", v33);

    v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[AMSAutomaticDownloadKindsSetTask enabledMediaKinds](self, "enabledMediaKinds");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, CFSTR("media-types"));

    +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "ams_setNullableObject:forKey:", v36, CFSTR("guid"));

    -[AMSAutomaticDownloadKindsSetTask bag](self, "bag");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "URLForKey:", 0x1E254D180);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSAutomaticDownloadKindsResult requestWithMethod:bagURL:parameters:](v20, "requestWithMethod:bagURL:parameters:", 4, v42, v34);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __43__AMSAutomaticDownloadKindsSetTask_perform__block_invoke;
    v47[3] = &unk_1E253DB08;
    v47[4] = self;
    objc_msgSend(v38, "thenWithBlock:", v47);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v44[0] = v39;
    v44[1] = 3221225472;
    v44[2] = __43__AMSAutomaticDownloadKindsSetTask_perform__block_invoke_2;
    v44[3] = &unk_1E253E4F8;
    objc_copyWeak(&v45, &location);
    objc_msgSend(v40, "thenWithBlock:", v44);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v49 = __Block_byref_object_copy__6;
    *(_QWORD *)&v50 = __Block_byref_object_dispose__6;
    *((_QWORD *)&v50 + 1) = self;
    v43[0] = v39;
    v43[1] = 3221225472;
    v43[2] = __43__AMSAutomaticDownloadKindsSetTask_perform__block_invoke_27;
    v43[3] = &unk_1E253E520;
    v43[4] = buf;
    objc_msgSend(v8, "addFinishBlock:", v43);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);

    goto LABEL_20;
  }
  AMSError(2, CFSTR("Invalid Parameter"), CFSTR("We cannot sync the local account's automatic download kinds."), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v8 = (void *)v7;

  return v8;
}

id __43__AMSAutomaticDownloadKindsSetTask_perform__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  AMSURLSession *v6;
  void *v7;
  void *v8;

  v3 = a2;
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AMSURLSession initWithConfiguration:delegate:delegateQueue:]([AMSURLSession alloc], "initWithConfiguration:delegate:delegateQueue:", v5, *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(a1 + 32), "setSession:", v6);

  objc_msgSend(*(id *)(a1 + 32), "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataTaskPromiseWithRequest:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __43__AMSAutomaticDownloadKindsSetTask_perform__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  AMSAutomaticDownloadKindsResult *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  AMSAutomaticDownloadKindsResult *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;

    if (v6 && !objc_msgSend(v6, "integerValue"))
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
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        v10 = objc_opt_class();
        AMSLogKey();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v10;
        v37 = 2114;
        v38 = v11;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully registered automatic media types.", buf, 0x16u);

      }
      v12 = (id *)(a1 + 32);
      v13 = objc_loadWeakRetained(v12);
      objc_msgSend(v13, "enabledMediaKinds");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_loadWeakRetained(v12);
      objc_msgSend(v15, "account");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, 0x1E2548220);

      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_loadWeakRetained(v12);
      objc_msgSend(v18, "account");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)objc_msgSend(v17, "ams_saveAccount:verifyCredentials:", v19, 0);

      v21 = [AMSAutomaticDownloadKindsResult alloc];
      v22 = objc_loadWeakRetained(v12);
      objc_msgSend(v22, "account");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_loadWeakRetained(v12);
      objc_msgSend(v24, "enabledMediaKinds");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[AMSAutomaticDownloadKindsResult initWithAccount:andEnabledMediaKinds:](v21, "initWithAccount:andEnabledMediaKinds:", v23, v25);

      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  else
  {

    v6 = 0;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v30 = objc_loadWeakRetained((id *)(a1 + 32));
    v31 = objc_opt_class();
    AMSLogKey();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v31;
    v37 = 2114;
    v38 = v32;
    v39 = 2048;
    v40 = objc_msgSend(v6, "longValue");
    _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The server responded with invalid status: %ld", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The server responded with a non 0 status code: %ld"), objc_msgSend(v6, "longValue"));
  v26 = (AMSAutomaticDownloadKindsResult *)objc_claimAutoreleasedReturnValue();
  AMSError(305, CFSTR("Invalid Server Response"), v26, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v33);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v27;
}

void __43__AMSAutomaticDownloadKindsSetTask_perform__block_invoke_27(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v9 = 138543874;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Releasing task: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  id v11;

  v11 = a5;
  v8 = (void (**)(id, _QWORD, void *))a6;
  -[AMSAutomaticDownloadKindsSetTask presentationDelegate](self, "presentationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSAutomaticDownloadKindsSetTask presentationDelegate](self, "presentationDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleAuthenticateRequest:completion:", v11, v8);
LABEL_5:

    goto LABEL_6;
  }
  if (v8)
  {
    AMSError(12, CFSTR("AMSAutomaticDownloadKindsSetTask failed"), CFSTR("No presentation delegate to handle authentication request."), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v10);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  id v11;

  v11 = a5;
  v8 = (void (**)(id, _QWORD, void *))a6;
  -[AMSAutomaticDownloadKindsSetTask presentationDelegate](self, "presentationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSAutomaticDownloadKindsSetTask presentationDelegate](self, "presentationDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleDialogRequest:completion:", v11, v8);
LABEL_5:

    goto LABEL_6;
  }
  if (v8)
  {
    AMSError(12, CFSTR("AMSAutomaticDownloadKindsSetTask failed"), CFSTR("No presentation delegate to handle dialog request."), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v10);
    goto LABEL_5;
  }
LABEL_6:

}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_3 != -1)
    dispatch_once(&_MergedGlobals_1_3, &__block_literal_global_14);
  return (NSString *)(id)qword_1ECEACA78;
}

void __49__AMSAutomaticDownloadKindsSetTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACA78;
  qword_1ECEACA78 = (uint64_t)CFSTR("AMSAutomaticDownloadKinds");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACA80 != -1)
    dispatch_once(&qword_1ECEACA80, &__block_literal_global_38);
  return (NSString *)(id)qword_1ECEACA88;
}

void __56__AMSAutomaticDownloadKindsSetTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACA88;
  qword_1ECEACA88 = (uint64_t)CFSTR("1");

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

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSArray)enabledMediaKinds
{
  return self->_enabledMediaKinds;
}

- (AMSRequestPresentationDelegate)presentationDelegate
{
  return (AMSRequestPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_enabledMediaKinds, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
