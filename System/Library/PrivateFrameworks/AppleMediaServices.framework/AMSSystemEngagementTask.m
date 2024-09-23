@implementation AMSSystemEngagementTask

- (AMSSystemEngagementTask)initWithRequest:(id)a3
{
  id v5;
  AMSSystemEngagementTask *v6;
  AMSSystemEngagementTask *v7;
  dispatch_group_t v8;
  OS_dispatch_group *dispatchGroup;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSSystemEngagementTask;
  v6 = -[AMSTask init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = dispatch_group_create();
    dispatchGroup = v7->_dispatchGroup;
    v7->_dispatchGroup = (OS_dispatch_group *)v8;

  }
  return v7;
}

- (AMSSystemEngagementTask)initWithRequest:(id)a3 bag:(id)a4
{
  id v7;
  AMSSystemEngagementTask *v8;
  AMSSystemEngagementTask *v9;

  v7 = a4;
  v8 = -[AMSSystemEngagementTask initWithRequest:](self, "initWithRequest:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_bag, a4);

  return v9;
}

- (id)present
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__AMSSystemEngagementTask_present__block_invoke;
  v3[3] = &unk_1E2541E90;
  v3[4] = self;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __34__AMSSystemEngagementTask_present__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  id v31;
  _QWORD *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  AMSMetrics *v41;
  void *v42;
  AMSMetrics *v43;
  id v44;
  void *v46;
  void *v47;
  id v48;
  const __CFString *v49;
  uint64_t v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = AMSSetLogKey(v5);

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
    objc_msgSend(*(id *)(a1 + 32), "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v52 = v9;
    v53 = 2114;
    v54 = v11;
    v55 = 2114;
    v56 = v12;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting system engagement request. Request: %{public}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRemoteListener:", v13);

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v14, "remoteListener");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", v14);

  objc_msgSend(*(id *)(a1 + 32), "remoteListener");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resume");

  objc_msgSend(*(id *)(a1 + 32), "_unlockDeviceIfNeeded");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v17, "resultWithError:", &v48);
  v18 = v48;

  if (v18)
  {
    v19 = 0;
    *a2 = objc_retainAutorelease(v18);
  }
  else
  {
    v20 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
    objc_msgSend(*(id *)(a1 + 32), "remoteListener");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "endpoint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_endpoint");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setXpcEndpoint:", v23);

    objc_msgSend(v20, "setUserInfo:", MEMORY[0x1E0C9AA70]);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.AMSEngagementViewService"), CFSTR("AMSEngagementViewService.RemoteEngagementViewController"));
    v25 = (void *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v24, v20);
    objc_msgSend(*(id *)(a1 + 32), "setRemoteAlertHandle:", v25);

    objc_msgSend(*(id *)(a1 + 32), "remoteAlertHandle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "registerObserver:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "_activateIfWithError:", a2);
    objc_msgSend(*(id *)(a1 + 32), "dispatchGroup");
    v27 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v27);

    objc_msgSend(*(id *)(a1 + 32), "dispatchGroup");
    v28 = objc_claimAutoreleasedReturnValue();
    dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v29, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v47 = v24;
      v31 = v20;
      v32 = a2;
      v33 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "request");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "logKey");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "result");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "error");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v52 = v33;
      a2 = v32;
      v20 = v31;
      v24 = v47;
      v53 = 2114;
      v54 = v34;
      v55 = 2114;
      v56 = v35;
      v57 = 2114;
      v58 = v36;
      _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Engagement task finished. Result: %{public}@, error: %{public}@", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 32), "_invalidateRemoteAlert");
    objc_msgSend(*(id *)(a1 + 32), "setDispatchGroup:", 0);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(*(id *)(a1 + 32), "error");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("AMSEngagementPresented");
      v50 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "ams_errorByAddingUserInfo:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setError:", v40);

    }
    objc_msgSend(*(id *)(a1 + 32), "error");
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    v41 = [AMSMetrics alloc];
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[AMSMetrics initWithContainerID:bag:](v41, "initWithContainerID:bag:", CFSTR("com.apple.AppleMediaServices"), v42);

    v44 = -[AMSMetrics flush](v43, "flush");
    objc_msgSend(*(id *)(a1 + 32), "result");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", a3);
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
    -[AMSSystemEngagementTask request](self, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Remote alert did activate", (uint8_t *)&v9, 0x16u);

  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", a3);
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
    -[AMSSystemEngagementTask request](self, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v6;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Remote alert did deactivate", (uint8_t *)&v16, 0x16u);

  }
  -[AMSSystemEngagementTask presentationTargetHandle](self, "presentationTargetHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
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
      v12 = objc_opt_class();
      -[AMSSystemEngagementTask request](self, "request");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v12;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Resolving due to missing presentation target", (uint8_t *)&v16, 0x16u);

    }
    AMSError(6, 0, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSSystemEngagementTask _finishTaskWithResult:error:](self, "_finishTaskWithResult:error:", 0, v15);

  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    -[AMSSystemEngagementTask request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Remote alert did invalidate. Error: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  AMSError(6, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSSystemEngagementTask _finishTaskWithResult:error:](self, "_finishTaskWithResult:error:", 0, v11);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    -[AMSSystemEngagementTask request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received connection from view service", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE096668);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v11);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0AE188);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v12);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");
  -[AMSSystemEngagementTask setUnderlyingRemoteConnection:](self, "setUnderlyingRemoteConnection:", v5);

  return 1;
}

- (void)engagementTaskDidFinishWithResult:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_opt_class();
    -[AMSSystemEngagementTask request](self, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v13;
    v18 = 2114;
    v19 = v15;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task finished. (result: %{public}@, error: %{public}@)", (uint8_t *)&v16, 0x2Au);

  }
  v10[2](v10);

  -[AMSSystemEngagementTask _finishTaskWithResult:error:](self, "_finishTaskWithResult:error:", v8, v9);
}

- (void)_activateIfWithError:(id *)a3
{
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD block[5];
  id v73;
  _OWORD v74[2];
  id v75;
  id v76;
  id v77;
  const __CFString *v78;
  void *v79;
  uint8_t buf[32];
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  -[AMSSystemEngagementTask remoteAlertHandle](self, "remoteAlertHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isValid");

  if ((v6 & 1) == 0)
  {
    AMSError(12, CFSTR("Remote Handle Not Valid"), 0, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return;
  }
  -[AMSSystemEngagementTask remoteAlertHandle](self, "remoteAlertHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isActive");

  if (v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping re-activation: handle already active", buf, 0x16u);

    }
    goto LABEL_38;
  }
  -[AMSSystemEngagementTask clientInfo](self, "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_11;
  v13 = (void *)MEMORY[0x1E0CB36F8];
  -[AMSSystemEngagementTask clientInfo](self, "clientInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0;
  objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v77);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v77;

  if (!v15)
  {
LABEL_11:
    v16 = (void *)MEMORY[0x1E0CB36F8];
    -[AMSSystemEngagementTask request](self, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0;
    objc_msgSend(v16, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, &v76);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v76;

    if (v10)
    {
      *a3 = objc_retainAutorelease(v10);
LABEL_37:

      goto LABEL_38;
    }
    -[AMSSystemEngagementTask _snapshotBagDataPromise](self, "_snapshotBagDataPromise");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0;
    objc_msgSend(v19, "resultWithError:", &v75);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v75;

    v71 = v21;
    if (v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = v18;
        v25 = objc_opt_class();
        -[AMSSystemEngagementTask request](self, "request");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v25;
        v18 = v24;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v27;
        *(_WORD *)&buf[22] = 2114;
        *(_QWORD *)&buf[24] = v71;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to snapshot bag. Error: %{public}@", buf, 0x20u);

      }
    }
    v70 = (void *)v20;
    if (-[AMSSystemEngagementTask disablePresentationTarget](self, "disablePresentationTarget"))
    {
LABEL_20:
      v28 = 0;
      v29 = 0;
LABEL_28:
      v42 = objc_alloc(MEMORY[0x1E0C99E08]);
      v78 = CFSTR("engagementRequestData");
      v79 = v18;
      v43 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v42, "initWithDictionary:", v44);

      if (v70)
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v70, CFSTR("bagData"));
      if (v9)
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v9, CFSTR("clientInfoData"));
      if (v29)
        objc_msgSend(v45, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("attachedToApp"));
      v46 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
      objc_msgSend(v46, "setUserInfo:", v45);
      if (v29)
      {
        v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAFA8]), "initWithTargetProcess:", v29);
        objc_msgSend(v46, "setPresentationTarget:", v47);

        -[AMSSystemEngagementTask _listenForAppForegroundWithHandle:monitorInApp:](self, "_listenForAppForegroundWithHandle:monitorInApp:", v29, v28);
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__AMSSystemEngagementTask__activateIfWithError___block_invoke;
      block[3] = &unk_1E253E2B0;
      block[4] = self;
      v73 = v46;
      v48 = v46;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v18 = v43;
      goto LABEL_37;
    }
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v30, "OSLogObject");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_opt_class();
      AMSLogKey();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSSystemEngagementTask clientInfo](self, "clientInfo");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "bundleIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSSystemEngagementTask clientInfo](self, "clientInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "auditTokenData");
      v68 = v18;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v32;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v33;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v34;
      v81 = 2112;
      v82 = v36;
      _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] looking for handle for bundle: %@ audit: %@", buf, 0x2Au);

      v18 = v68;
    }

    -[AMSSystemEngagementTask clientInfo](self, "clientInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "auditTokenData");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      memset(buf, 0, sizeof(buf));
      -[AMSSystemEngagementTask clientInfo](self, "clientInfo");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "auditTokenData");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "getBytes:length:", buf, 32);

      v74[0] = *(_OWORD *)buf;
      v74[1] = *(_OWORD *)&buf[16];
      objc_msgSend(MEMORY[0x1E0D016E0], "tokenFromAuditToken:", v74);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D01828], "processHandleForAuditToken:", v41);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
      v28 = 0;
      goto LABEL_28;
    }
    -[AMSSystemEngagementTask clientInfo](self, "clientInfo");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bundleIdentifier");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      v51 = (void *)v50;
      +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "bundleIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSSystemEngagementTask clientInfo](self, "clientInfo");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "bundleIdentifier");
      v69 = v18;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v53, "isEqualToString:", v55);

      v18 = v69;
      if ((v56 & 1) == 0)
      {
        -[AMSSystemEngagementTask clientInfo](self, "clientInfo");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "bundleIdentifier");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSystemEngagementTask _processIdentifierForBundleIdentifier:](self, "_processIdentifierForBundleIdentifier:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (v59)
        {
          objc_msgSend(MEMORY[0x1E0D01828], "processHandleForPID:", objc_msgSend(v59, "intValue"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v60)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v60, "OSLogObject");
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            v67 = objc_opt_class();
            AMSLogKey();
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[AMSSystemEngagementTask clientInfo](self, "clientInfo");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "bundleIdentifier");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            *(_QWORD *)&buf[4] = v67;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v62;
            *(_WORD *)&buf[22] = 2112;
            *(_QWORD *)&buf[24] = v59;
            v81 = 2112;
            v82 = v64;
            v83 = 2112;
            v84 = v29;
            _os_log_impl(&dword_18C849000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found pid: %@ for bundle: %@ <%@>", buf, 0x34u);

          }
          v18 = v69;
        }
        else
        {
          v29 = 0;
        }

        goto LABEL_27;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 1;
      goto LABEL_28;
    }
    goto LABEL_20;
  }
  v10 = objc_retainAutorelease(v15);
  *a3 = v10;
LABEL_38:

}

void __48__AMSSystemEngagementTask__activateIfWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "remoteAlertHandle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateWithContext:", *(_QWORD *)(a1 + 40));

}

- (void)_finishTaskWithResult:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!-[AMSTask isFinished](self, "isFinished"))
  {
    -[AMSSystemEngagementTask underlyingRemoteConnection](self, "underlyingRemoteConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[AMSSystemEngagementTask setUnderlyingRemoteConnection:](self, "setUnderlyingRemoteConnection:", 0);
    -[AMSSystemEngagementTask setError:](self, "setError:", v6);
    -[AMSSystemEngagementTask setResult:](self, "setResult:", v10);
    -[AMSSystemEngagementTask dispatchGroup](self, "dispatchGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[AMSSystemEngagementTask dispatchGroup](self, "dispatchGroup");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_group_leave(v9);

    }
  }

}

- (void)_invalidateRemoteAlert
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AMSSystemEngagementTask__invalidateRemoteAlert__block_invoke;
  block[3] = &unk_1E253DBD8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __49__AMSSystemEngagementTask__invalidateRemoteAlert__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "remoteAlertHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "remoteAlertHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setPresentationTargetHandle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "displayWillForegroundToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "displayWillForegroundToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", v6);

    objc_msgSend(*(id *)(a1 + 32), "setDisplayWillForegroundToken:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "displayDidBecomeActiveToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "displayDidBecomeActiveToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", v9);

    objc_msgSend(*(id *)(a1 + 32), "setDisplayDidBecomeActiveToken:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "displayLayoutMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setDisplayLayoutMonitor:", 0);
}

- (void)_listenForAppForegroundWithHandle:(id)a3 monitorInApp:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id location;
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[4];
  id v60;
  id v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v4 = a4;
  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[AMSTask isFinished](self, "isFinished");
  if (v6 && !v7)
  {
    objc_msgSend(v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      -[AMSSystemEngagementTask request](self, "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v63 = v11;
      v64 = 2114;
      v65 = v13;
      v66 = 2112;
      v67 = v8;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Listening for app foreground: %@", buf, 0x20u);

    }
    -[AMSSystemEngagementTask presentationTargetHandle](self, "presentationTargetHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (v15)
    {
      v61 = 0;
      objc_msgSend(MEMORY[0x1E0D87D68], "handleForLegacyHandle:error:", v6, &v61);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v61;
      objc_initWeak((id *)buf, self);
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke;
      v59[3] = &unk_1E25461D0;
      objc_copyWeak(&v60, (id *)buf);
      objc_msgSend(v16, "monitorForDeath:", v59);
      -[AMSSystemEngagementTask setPresentationTargetHandle:](self, "setPresentationTargetHandle:", v16);
      objc_destroyWeak(&v60);
      objc_destroyWeak((id *)buf);

    }
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v4)
    {
      if (!v18)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_opt_class();
        -[AMSSystemEngagementTask request](self, "request");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "logKey");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v21;
        v64 = 2114;
        v65 = v23;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Monitoring for in app notifications", buf, 0x16u);

      }
      -[AMSSystemEngagementTask displayDidBecomeActiveToken](self, "displayDidBecomeActiveToken");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 == 0;

      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke_89;
        v58[3] = &unk_1E25461F8;
        v58[4] = self;
        objc_msgSend(v26, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationDidBecomeActiveNotification"), 0, 0, v58);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSystemEngagementTask setDisplayDidBecomeActiveToken:](self, "setDisplayDidBecomeActiveToken:", v27);

      }
      -[AMSSystemEngagementTask displayWillForegroundToken](self, "displayWillForegroundToken");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28 == 0;

      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke_93;
        v57[3] = &unk_1E25461F8;
        v57[4] = self;
        objc_msgSend(v30, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationWillEnterForegroundNotification"), 0, 0, v57);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSystemEngagementTask setDisplayWillForegroundToken:](self, "setDisplayWillForegroundToken:", v31);

      }
    }
    else
    {
      if (!v18)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = objc_opt_class();
        -[AMSSystemEngagementTask request](self, "request");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "logKey");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSystemEngagementTask displayLayoutMonitor](self, "displayLayoutMonitor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v63 = v33;
        v64 = 2114;
        v65 = v35;
        v66 = 2112;
        v67 = v36;
        _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Monitoring for app forgrond: %@", buf, 0x20u);

      }
      -[AMSSystemEngagementTask displayLayoutMonitor](self, "displayLayoutMonitor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37 == 0;

      if (v38)
      {
        objc_initWeak(&location, self);
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v39)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v39, "OSLogObject");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = objc_opt_class();
          -[AMSSystemEngagementTask request](self, "request");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "logKey");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSSystemEngagementTask displayLayoutMonitor](self, "displayLayoutMonitor");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v63 = v41;
          v64 = 2114;
          v65 = v43;
          v66 = 2112;
          v67 = v44;
          _os_log_impl(&dword_18C849000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] (2) Monitoring for app forgrond: %@", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke_95;
        v53[3] = &unk_1E2546220;
        objc_copyWeak(&v55, &location);
        v54 = v8;
        objc_msgSend(v45, "setTransitionHandler:", v53);
        objc_msgSend(v45, "setNeedsUserInteractivePriority:", 1);
        objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSystemEngagementTask setDisplayLayoutMonitor:](self, "setDisplayLayoutMonitor:", v46);

        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v47)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v47, "OSLogObject");
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = objc_opt_class();
          -[AMSSystemEngagementTask request](self, "request");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "logKey");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSSystemEngagementTask displayLayoutMonitor](self, "displayLayoutMonitor");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v63 = v49;
          v64 = 2114;
          v65 = v51;
          v66 = 2112;
          v67 = v52;
          _os_log_impl(&dword_18C849000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] (3) Monitoring for app forgrond: %@", buf, 0x20u);

        }
        objc_destroyWeak(&v55);

        objc_destroyWeak(&location);
      }
    }

  }
}

void __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    objc_msgSend(WeakRetained, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v4;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] App has died", buf, 0x16u);

  }
  v9 = CFSTR("AMSEngagementPresented");
  v10 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AMSCustomError(CFSTR("AMSErrorDomain"), 12, CFSTR("System Engagement Task Failed"), CFSTR("App terminated"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_finishTaskWithResult:error:", 0, v8);
}

void __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke_89(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v4;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] App foregrounded (did become active)", buf, 0x16u);

  }
  v7 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v7, "_activateIfWithError:", &v9);
  v8 = v9;
  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "_finishTaskWithResult:error:", 0, v8);

}

void __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke_93(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v4;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] App foregrounded (will become active)", buf, 0x16u);

  }
  v7 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v7, "_activateIfWithError:", &v9);
  v8 = v9;
  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "_finishTaskWithResult:error:", 0, v8);

}

void __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke_95(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  char v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id obj;
  uint64_t v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  int v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v41 = a2;
  v7 = a3;
  v39 = a4;
  v44 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v40 = v7;
  objc_msgSend(v7, "elements");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
  if (!v9)
  {
    v24 = v7;
    goto LABEL_37;
  }
  v10 = v9;
  v11 = *(_QWORD *)v53;
  v46 = -1;
  v42 = *(_QWORD *)v53;
  v43 = WeakRetained;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v53 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v13, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(v44 + 32));

        if (v15)
          v46 = objc_msgSend(v13, "level");
      }
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_opt_class();
        objc_msgSend(WeakRetained, "request");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logKey");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v10;
        v22 = objc_msgSend(v13, "level");
        objc_msgSend(v13, "bundleIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v58 = v18;
        v59 = 2114;
        v60 = v20;
        v61 = 2048;
        v62 = v22;
        v10 = v21;
        v63 = 2112;
        v64 = v23;
        v65 = 1024;
        v66 = v46;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Level: %ld Bundle: %@ appLevel: %d", buf, 0x30u);

        v11 = v42;
        WeakRetained = v43;
      }

    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
  }
  while (v10);

  v24 = v40;
  if ((v46 & 0x8000000000000000) == 0)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v40, "elements");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v26)
    {
      v27 = v26;
      v28 = WeakRetained;
      v29 = *(_QWORD *)v49;
      v30 = 1;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v49 != v29)
            objc_enumerationMutation(v25);
          v32 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          if (objc_msgSend(v32, "level") == v46)
          {
            objc_msgSend(v32, "bundleIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
              v30 = 0;
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v27);

      WeakRetained = v28;
      if ((v30 & 1) == 0)
        goto LABEL_38;
    }
    else
    {

    }
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
      v36 = objc_opt_class();
      objc_msgSend(WeakRetained, "request");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "logKey");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v36;
      v59 = 2114;
      v60 = v38;
      _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] App foregrounded", buf, 0x16u);

    }
    v47 = 0;
    objc_msgSend(WeakRetained, "_activateIfWithError:", &v47);
    obj = v47;
    if (obj)
      objc_msgSend(WeakRetained, "_finishTaskWithResult:error:", 0, obj);
    else
      obj = 0;
LABEL_37:

  }
LABEL_38:

}

- (id)_processIdentifierForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0D87D68], "handleForPredicate:error:", v3, &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;
  if (v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    v22 = 2114;
    v23 = v5;
    v10 = "%{public}@: [%{public}@] Failed to fetch handle: %{public}@";
    v11 = v7;
    v12 = 32;
    goto LABEL_11;
  }
  v13 = objc_msgSend(v4, "pid");
  if ((v13 + 1) > 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v14 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v14;
    v20 = 2114;
    v21 = v9;
    v10 = "%{public}@: [%{public}@] Failed to fetch handle. -1 or 0";
    v11 = v7;
    v12 = 22;
LABEL_11:
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);

  }
LABEL_12:

  v15 = 0;
LABEL_13:

  return v15;
}

- (id)_snapshotBagDataPromise
{
  void *v3;
  AMSPromise *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AMSSystemEngagementTask bag](self, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(AMSPromise);
    -[AMSSystemEngagementTask bag](self, "bag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPromise completionHandlerAdapter](v4, "completionHandlerAdapter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createSnapshotWithCompletion:", v6);

    -[AMSPromise thenWithBlock:](v4, "thenWithBlock:", &__block_literal_global_124);
  }
  else
  {
    AMSError(12, CFSTR("Snapshot failed"), CFSTR("Bag was not provided"), 0);
    v4 = (AMSPromise *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v4);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __50__AMSSystemEngagementTask__snapshotBagDataPromise__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compile");
}

- (id)_unlockDeviceIfNeeded
{
  AMSMutableBinaryPromise *v2;

  v2 = objc_alloc_init(AMSMutableBinaryPromise);
  SBSGetScreenLockStatus();
  -[AMSMutableBinaryPromise finishWithSuccess](v2, "finishWithSuccess");
  return v2;
}

void __48__AMSSystemEngagementTask__unlockDeviceIfNeeded__block_invoke(uint64_t a1, int a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess");
  }
  else
  {
    AMSError(11, CFSTR("Failed to unlock"), 0, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithError:", v3);

  }
}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("AMSUIDynamic");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
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

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (BOOL)disablePresentationTarget
{
  return self->_disablePresentationTarget;
}

- (void)setDisablePresentationTarget:(BOOL)a3
{
  self->_disablePresentationTarget = a3;
}

- (AMSEngagementRequest)request
{
  return self->_request;
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchGroup, a3);
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutMonitor, a3);
}

- (NSObject)displayDidBecomeActiveToken
{
  return self->_displayDidBecomeActiveToken;
}

- (void)setDisplayDidBecomeActiveToken:(id)a3
{
  objc_storeStrong((id *)&self->_displayDidBecomeActiveToken, a3);
}

- (NSObject)displayWillForegroundToken
{
  return self->_displayWillForegroundToken;
}

- (void)setDisplayWillForegroundToken:(id)a3
{
  objc_storeStrong((id *)&self->_displayWillForegroundToken, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (RBSProcessHandle)presentationTargetHandle
{
  return self->_presentationTargetHandle;
}

- (void)setPresentationTargetHandle:(id)a3
{
  objc_storeStrong((id *)&self->_presentationTargetHandle, a3);
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, a3);
}

- (NSXPCListener)remoteListener
{
  return self->_remoteListener;
}

- (void)setRemoteListener:(id)a3
{
  objc_storeStrong((id *)&self->_remoteListener, a3);
}

- (AMSEngagementResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSXPCConnection)underlyingRemoteConnection
{
  return self->_underlyingRemoteConnection;
}

- (void)setUnderlyingRemoteConnection:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingRemoteConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRemoteConnection, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_remoteListener, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_presentationTargetHandle, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_displayWillForegroundToken, 0);
  objc_storeStrong((id *)&self->_displayDidBecomeActiveToken, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
