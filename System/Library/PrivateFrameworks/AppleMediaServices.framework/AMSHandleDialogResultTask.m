@implementation AMSHandleDialogResultTask

- (AMSHandleDialogResultTask)initWithRequest:(id)a3 result:(id)a4 error:(id)a5 bag:(id)a6
{
  return -[AMSHandleDialogResultTask initWithResult:bag:](self, "initWithResult:bag:", a4, a6, a5);
}

- (AMSHandleDialogResultTask)initWithResult:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSHandleDialogResultTask *v9;
  AMSHandleDialogResultTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSHandleDialogResultTask;
  v9 = -[AMSTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_result, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

- (AMSDialogRequest)request
{
  void *v2;
  void *v3;

  -[AMSHandleDialogResultTask result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSDialogRequest *)v3;
}

- (id)perform
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__AMSHandleDialogResultTask_perform__block_invoke;
  v3[3] = &unk_1E253DF08;
  v3[4] = self;
  -[AMSTask performBinaryTaskWithBlock:](self, "performBinaryTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __36__AMSHandleDialogResultTask_perform__block_invoke(uint64_t a1, _QWORD *a2)
{
  _UNKNOWN **v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  AMSURLRequestEncoder *v27;
  void *v28;
  AMSURLRequestEncoder *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  _QWORD *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v102;
  id v103;
  id v104;
  void *v105;
  __CFString *v106;
  void *v107;
  _QWORD v108[5];
  _QWORD v109[5];
  id v110;
  uint8_t buf[4];
  uint64_t v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  void *v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v4 = &off_1E2519000;
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
    v7 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v112 = v7;
    v113 = 2114;
    v114 = v9;
    v115 = 2114;
    v116 = v10;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling dialog result: %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "result");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectedActionIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("AMSDialogResultDismissIdentifier");
  if (v12)
    v14 = (__CFString *)v12;
  v15 = v14;

  objc_msgSend(*(id *)(a1 + 32), "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v15;
  objc_msgSend(v16, "locateActionWithIdentifier:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

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
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_opt_class();
      v22 = *(void **)(a1 + 32);
      v23 = v21;
      objc_msgSend(v22, "request");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logKey");
      v25 = a2;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v112 = (uint64_t)v21;
      v113 = 2114;
      v114 = v26;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing request", buf, 0x16u);

      a2 = v25;
    }

    v27 = [AMSURLRequestEncoder alloc];
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[AMSURLRequestEncoder initWithBag:](v27, "initWithBag:", v28);

    objc_msgSend(*(id *)(a1 + 32), "account");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setAccount:](v29, "setAccount:", v30);

    AMSLogKey();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setLogUUID:](v29, "setLogUUID:", v31);

    objc_msgSend(v17, "request");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder requestByEncodingRequest:parameters:](v29, "requestByEncodingRequest:parameters:", v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = 0;
    objc_msgSend(v33, "resultWithError:", &v110);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v110;

    v107 = v35;
    if (v35)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v36, "OSLogObject");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = a2;
        v39 = (void *)objc_opt_class();
        v40 = *(void **)(a1 + 32);
        v104 = v39;
        objc_msgSend(v40, "request");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "logKey");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v112 = (uint64_t)v39;
        a2 = v38;
        v113 = 2114;
        v114 = v42;
        v115 = 2114;
        v116 = v107;
        _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error creating request: %{public}@", buf, 0x20u);

      }
      v105 = 0;
    }
    else
    {
      +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "dataTaskPromiseWithRequest:", v34);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = MEMORY[0x1E0C809B0];
      v109[0] = MEMORY[0x1E0C809B0];
      v109[1] = 3221225472;
      v109[2] = __36__AMSHandleDialogResultTask_perform__block_invoke_3;
      v109[3] = &unk_1E253E120;
      v109[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v43, "addErrorBlock:", v109);
      v108[0] = v44;
      v108[1] = 3221225472;
      v108[2] = __36__AMSHandleDialogResultTask_perform__block_invoke_4;
      v108[3] = &unk_1E253D398;
      v108[4] = *(_QWORD *)(a1 + 32);
      v105 = v43;
      objc_msgSend(v43, "addSuccessBlock:", v108);
    }

    v4 = &off_1E2519000;
  }
  else
  {
    v107 = 0;
    v105 = 0;
  }
  objc_msgSend(v17, "deepLink");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    v46 = objc_msgSend(v17, "inferLinkDestination");
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v47;
    if (v46)
    {
      if (!v47)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v48, "OSLogObject");
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = (void *)objc_opt_class();
        v51 = *(void **)(a1 + 32);
        v102 = v50;
        objc_msgSend(v51, "request");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "logKey");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "deepLink");
        v54 = a2;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableURL(v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v112 = (uint64_t)v50;
        v113 = 2114;
        v114 = v53;
        v115 = 2112;
        v116 = v56;
        _os_log_impl(&dword_18C849000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening url: %@", buf, 0x20u);

        a2 = v54;
      }

      objc_msgSend(*(id *)(a1 + 32), "clientInfo");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_msgSend(v57, "copy");
      v59 = v58;
      if (v58)
      {
        v60 = v58;
      }
      else
      {
        +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
        v60 = (id)objc_claimAutoreleasedReturnValue();
      }
      v69 = v60;

      objc_msgSend(*(id *)(a1 + 32), "proxyBundleId");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      if (v70)
      {
        objc_msgSend(*(id *)(a1 + 32), "proxyBundleId");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setProxyAppBundleID:", v71);

      }
      objc_msgSend(v17, "deepLink");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "bag");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = +[AMSOpenURL openURL:clientInfo:bag:](AMSOpenURL, "openURL:clientInfo:bag:", v72, v69, v73);

      v4 = &off_1E2519000;
    }
    else
    {
      if (!v47)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v48, "OSLogObject");
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = (void *)objc_opt_class();
        v63 = *(void **)(a1 + 32);
        v103 = v62;
        objc_msgSend(v63, "request");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "logKey");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "deepLink");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableURL(v66);
        v67 = a2;
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v112 = (uint64_t)v62;
        v113 = 2114;
        v114 = v65;
        v115 = 2112;
        v116 = v68;
        _os_log_impl(&dword_18C849000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening standard URL: %@", buf, 0x20u);

        a2 = v67;
        v4 = &off_1E2519000;

      }
      objc_msgSend(v17, "deepLink");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSOpenURL openStandardURL:](AMSOpenURL, "openStandardURL:", v69);
    }

  }
  if (objc_msgSend(v17, "ams_actionType") == 7)
  {
    objc_msgSend(v4[274], "sharedConfig");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v75)
    {
      objc_msgSend(v4[274], "sharedConfig");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v75, "OSLogObject");
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      v77 = (void *)objc_opt_class();
      v78 = *(void **)(a1 + 32);
      v79 = v77;
      objc_msgSend(v78, "request");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "logKey");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v112 = (uint64_t)v77;
      v113 = 2114;
      v114 = v81;
      _os_log_impl(&dword_18C849000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting QR code dialog action", buf, 0x16u);

    }
    objc_msgSend(v17, "dialogRequest");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "result");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "logKey");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSHandleQRDialogResult handleQRDialogPresentationForRequest:result:logKey:](AMSHandleQRDialogResult, "handleQRDialogPresentationForRequest:result:logKey:", v82, v83, v85);

  }
  objc_msgSend(*(id *)(a1 + 32), "request");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "metricsEvent");
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {
    objc_msgSend(v17, "ams_metricsDictionary");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "count");

    if (v89)
    {
      objc_msgSend(*(id *)(a1 + 32), "request");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "metricsEvent");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ams_metricsDictionary");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "addPropertiesWithDictionary:", v92);

    }
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "metricsEvent");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "enqueueEvent:", v96);

  }
  objc_msgSend(v17, "metricsEvent");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (v97)
  {
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "metricsEvent");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "enqueueEvent:", v100);

  }
  if (a2)
    *a2 = 0;

  return 1;
}

void __36__AMSHandleDialogResultTask_perform__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
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
    v6 = (void *)objc_opt_class();
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v6;
    v13 = 2114;
    v14 = v10;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error completing the dialog result request: %{public}@", (uint8_t *)&v11, 0x20u);

  }
}

void __36__AMSHandleDialogResultTask_perform__block_invoke_4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
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
    v4 = (void *)objc_opt_class();
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v4;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Completed dialog result request successfully", (uint8_t *)&v9, 0x16u);

  }
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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

- (NSString)proxyBundleId
{
  return self->_proxyBundleId;
}

- (void)setProxyBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (AMSDialogResult)result
{
  return self->_result;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_proxyBundleId, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
