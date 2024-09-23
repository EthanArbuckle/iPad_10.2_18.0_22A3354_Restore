@implementation AMSURLProtocolHandler

void __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v5;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Absinthe action generate.", (uint8_t *)&v8, 0x16u);

    }
  }

}

void __63__AMSURLProtocolHandler_handleResponse_task_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "value");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)_URLIsTrustedFromRequest:(id)a3 bag:(id)a4
{
  id v5;
  id v6;
  AMSMutablePromise *v7;
  void *v8;
  AMSURLSentry *v9;
  void *v10;
  AMSMutablePromise *v11;
  _QWORD v13[4];
  AMSMutablePromise *v14;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(AMSMutablePromise);
  +[AMSNilBagValueFilteringProxy proxyWithBag:](AMSNilBagValueFilteringProxy, "proxyWithBag:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AMSURLSentry initWithBag:]([AMSURLSentry alloc], "initWithBag:", v8);
  objc_msgSend(v6, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__AMSURLProtocolHandler__URLIsTrustedFromRequest_bag___block_invoke;
  v13[3] = &unk_1E253F570;
  v11 = v7;
  v14 = v11;
  -[AMSURLSentry isTrustedURL:completionHandler:](v9, "isTrustedURL:completionHandler:", v10, v13);

  return v11;
}

void __54__AMSURLProtocolHandler__URLIsTrustedFromRequest_bag___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:", v4);

  }
}

- (id)_setResponseCookiesFromResponse:(id)a3 taskInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  _QWORD v22[5];
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "shouldSetCookiesFromResponse"))
  {

LABEL_5:
    objc_msgSend(v7, "properties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "shouldSetCookiesFromResponse") & 1) != 0)
    {

    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v7, "properties");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "account");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "ams_asynchronouslyAddCookiesForResponse:", v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
    }
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) == 0)
    goto LABEL_5;
  v10 = (void *)MEMORY[0x1E0C8F2B8];
  objc_msgSend(v7, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_sharedAccountStoreForProcessInfo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ams_addCookiesForResponse:account:", v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __66__AMSURLProtocolHandler__setResponseCookiesFromResponse_taskInfo___block_invoke;
  v22[3] = &unk_1E253D950;
  v22[4] = self;
  v23 = v7;
  objc_msgSend(v16, "addErrorBlock:", v22);

LABEL_10:
  return v16;
}

void __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  char v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  id v70;
  id obj;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v72 = a1;
    if (v5 && objc_msgSend(v5, "actionType"))
    {
      v8 = 0;
      v9 = 0;
      goto LABEL_39;
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "supportedProtocolVersion") & 1) != 0)
    {
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "actions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v15 = 0;
        v16 = *(_QWORD *)v78;
        while (1)
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v78 != v16)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * v17), "performWithTaskInfo:", *(_QWORD *)(a1 + 48));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v5, "actionType") && objc_msgSend(v18, "actionType"))
            {
              v19 = v18;

              v5 = v19;
            }
            if (v15)
            {
              if (v14)
                goto LABEL_18;
            }
            else
            {
              objc_msgSend(v18, "authenticateResult");
              v15 = objc_claimAutoreleasedReturnValue();
              if (v14)
                goto LABEL_18;
            }
            objc_msgSend(v18, "dialogResult");
            v14 = objc_claimAutoreleasedReturnValue();
LABEL_18:

            ++v17;
          }
          while (v13 != v17);
          v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
          v13 = v20;
          if (!v20)
          {
            v68 = (void *)v15;
            v69 = (void *)v14;
            v70 = v5;
            goto LABEL_30;
          }
        }
      }
      v69 = 0;
      v70 = v5;
      v68 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "versionMismatchURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
        v23 = (void *)objc_opt_class();
        v24 = *(void **)(v72 + 48);
        v25 = v23;
        objc_msgSend(v24, "properties");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logUUID");
        v27 = v5;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableURL(v11);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v84 = v23;
        v85 = 2114;
        v86 = v28;
        v87 = 2114;
        v88 = v29;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Unsupported protocol version, redirecting to: %{public}@", buf, 0x20u);

        v5 = v27;
      }

      +[AMSURLAction redirectActionWithURL:](AMSURLAction, "redirectActionWithURL:", v11);
      v30 = objc_claimAutoreleasedReturnValue();

      v68 = 0;
      v69 = 0;
      v70 = (id)v30;
      a1 = v72;
    }
LABEL_30:

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "pingURLs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v74 != v33)
            objc_enumerationMutation(obj);
          v35 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
          v36 = *(void **)(a1 + 40);
          +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "properties");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "account");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "properties");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "bag");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "_pingURL:session:account:bag:", v35, v37, v39, v41);

          a1 = v72;
        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
      }
      while (v32);
    }

    v5 = v70;
    if (!v70)
    {
      v9 = v68;
      v8 = v69;
LABEL_42:
      objc_msgSend(*(id *)(a1 + 32), "serverError");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        objc_msgSend(*(id *)(a1 + 40), "session");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "delegate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = a1;
        v46 = objc_opt_respondsToSelector();

        objc_msgSend(*(id *)(v45 + 40), "session");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "delegate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_opt_respondsToSelector();

        if ((v46 & 1) != 0)
        {
          objc_msgSend(*(id *)(v45 + 40), "session");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "delegate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v45 + 40), "session");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = *(_QWORD *)(v45 + 56);
          objc_msgSend(*(id *)(v45 + 32), "serverError");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v53) = objc_msgSend(v51, "AMSURLSession:task:shouldFailWithServerError:", v52, v53, v54);

          if ((v53 & 1) == 0)
          {
LABEL_54:
            v7 = 0;
            a1 = v72;
            goto LABEL_47;
          }
        }
        else if ((v49 & 1) != 0)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "OSLogObject");
          v56 = objc_claimAutoreleasedReturnValue();
          v57 = v72;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v58 = (void *)objc_opt_class();
            v59 = *(void **)(v72 + 48);
            v60 = v58;
            objc_msgSend(v59, "properties");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "logUUID");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v84 = v58;
            v85 = 2114;
            v86 = v62;
            _os_log_impl(&dword_18C849000, v56, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Calling legacy delegate for shouldFailWithServerError", buf, 0x16u);

            v57 = v72;
          }

          objc_msgSend(*(id *)(v57 + 40), "session");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "delegate");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v57 + 40), "session");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v57 + 32), "serverError");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v64, "AMSURLSession:shouldFailWithServerError:", v65, v66);

          if (!v67)
            goto LABEL_54;
        }
        a1 = v72;
        objc_msgSend(*(id *)(v72 + 32), "serverError");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
          goto LABEL_47;
        goto LABEL_3;
      }
LABEL_46:
      v7 = 0;
      goto LABEL_47;
    }
    v9 = v68;
    v8 = v69;
LABEL_39:
    if (objc_msgSend(v5, "actionType"))
      goto LABEL_46;
    goto LABEL_42;
  }
  v7 = v6;
  v8 = 0;
  v9 = 0;
LABEL_3:
  +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v7);
  v10 = objc_claimAutoreleasedReturnValue();

  v5 = (id)v10;
LABEL_47:
  objc_msgSend(v5, "setAuthenticateResult:", v9);
  objc_msgSend(v5, "setDialogResult:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)reportMetricsForContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSURLProtocolHandler metricsHandler](self, "metricsHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportMetricsForContext:", v4);

}

- (AMSURLMetricsLoadURLHandler)metricsHandler
{
  return self->_metricsHandler;
}

- (id)decodeMutableData:(id)a3 task:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  AMSMutablePromise *v10;
  AMSMutablePromise *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  AMSMutablePromise *v16;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(AMSMutablePromise);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__AMSURLProtocolHandler_decodeMutableData_task_error___block_invoke;
  v15[3] = &unk_1E25425C0;
  v16 = v10;
  v11 = v10;
  -[AMSURLProtocolHandler decodeMutableData:task:completionHandler:](self, "decodeMutableData:task:completionHandler:", v9, v8, v15);

  -[AMSPromise resultWithError:](v11, "resultWithError:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)didCreateTask:(id)a3 fromRequest:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  AMSMutablePromise *v10;
  AMSMutablePromise *v11;
  id v12;
  _QWORD v13[4];
  AMSMutablePromise *v14;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(AMSMutablePromise);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__AMSURLProtocolHandler_didCreateTask_fromRequest_error___block_invoke;
  v13[3] = &unk_1E253F570;
  v14 = v10;
  v11 = v10;
  -[AMSURLProtocolHandler didCreateTask:fromRequest:completionHandler:](self, "didCreateTask:fromRequest:completionHandler:", v9, v8, v13);

  v12 = -[AMSPromise resultWithError:](v11, "resultWithError:", a5);
}

+ (double)reversePushSamplingPercentageForTask:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleForKey:", 0x1E254C480);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v7, "valueWithError:", &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v20;

    if (v8)
    {
      objc_msgSend(v8, "doubleValue");
      v11 = v10;
    }
    else
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = (void *)objc_opt_class();
        v15 = v14;
        objc_msgSend(v4, "properties");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v14;
        v23 = 2114;
        v24 = v17;
        v25 = 2114;
        v26 = v18;
        _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Failed to fetch the APS sampling percentage from the bag. error = %{public}@", buf, 0x20u);

      }
      v11 = 0.0;
    }

  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_metricsHandler, 0);
}

- (void)setSession:(id)a3
{
  os_unfair_lock_s *p_propertiesLock;
  id v5;

  p_propertiesLock = &self->_propertiesLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_session, v5);

  os_unfair_lock_unlock(p_propertiesLock);
}

- (AMSURLProtocolHandler)init
{
  AMSURLMetricsLoadURLHandler *v3;
  AMSURLProtocolHandler *v4;

  v3 = -[AMSURLMetricsLoadURLHandler initWithMetrics:]([AMSURLMetricsLoadURLHandler alloc], "initWithMetrics:", objc_opt_class());
  v4 = -[AMSURLProtocolHandler initWithMetricsHandler:](self, "initWithMetricsHandler:", v3);

  return v4;
}

- (AMSURLProtocolHandler)initWithMetricsHandler:(id)a3
{
  id v5;
  AMSURLProtocolHandler *v6;
  AMSURLProtocolHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSURLProtocolHandler;
  v6 = -[AMSURLProtocolHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metricsHandler, a3);
    v7->_propertiesLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)handleResponse:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  -[AMSURLProtocolHandler _handleResponse:task:](self, "_handleResponse:task:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__AMSURLProtocolHandler_handleResponse_task_completionHandler___block_invoke;
  v11[3] = &unk_1E2542E40;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "addFinishBlock:", v11);

}

- (id)_handleResponse:(id)a3 task:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v34;
  void *v35;
  __CFString *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  AMSURLProtocolHandler *v45;
  _QWORD v46[4];
  id v47;
  AMSURLProtocolHandler *v48;
  id v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  __CFString *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-Application-Site"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-Jingle-Correlation-Key"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((os_variant_has_internal_content() & 1) != 0)
  {
    v36 = v9;
  }
  else
  {

    v36 = CFSTR("<private>");
  }
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
    v12 = (void *)objc_opt_class();
    v34 = v12;
    objc_msgSend(v8, "properties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "ams_statusCode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v56 = v12;
    v57 = 2114;
    v58 = v14;
    v59 = 2114;
    v60 = v15;
    v61 = 2114;
    v62 = v36;
    v63 = 2114;
    v64 = v37;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] StatusCode: %{public}@; %{public}@; Environment: %{public}@",
      buf,
      0x34u);

  }
  -[AMSURLProtocolHandler _setResponseCookiesFromResponse:taskInfo:](self, "_setResponseCookiesFromResponse:taskInfo:", v6, v8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke;
  v52[3] = &unk_1E2540E68;
  v52[4] = self;
  v17 = v8;
  v53 = v17;
  v18 = v6;
  v54 = v18;
  objc_msgSend(v35, "continueWithBlock:", v52);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v16;
  v50[1] = 3221225472;
  v50[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_81;
  v50[3] = &unk_1E253FD08;
  v50[4] = self;
  v20 = v17;
  v51 = v20;
  objc_msgSend(v19, "catchWithBlock:", v50);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "promiseAdapter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v16;
  v46[1] = 3221225472;
  v46[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_82;
  v46[3] = &unk_1E2546940;
  v23 = v18;
  v47 = v23;
  v48 = self;
  v24 = v20;
  v49 = v24;
  objc_msgSend(v22, "thenWithBlock:", v46);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v16;
  v42[1] = 3221225472;
  v42[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_90;
  v42[3] = &unk_1E25469B0;
  v26 = v24;
  v43 = v26;
  v27 = v23;
  v44 = v27;
  v45 = self;
  objc_msgSend(v25, "continueWithBlock:", v42);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v16;
  v38[1] = 3221225472;
  v38[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_98;
  v38[3] = &unk_1E25469D8;
  v38[4] = self;
  v39 = v27;
  v40 = v26;
  v41 = v7;
  v29 = v7;
  v30 = v26;
  v31 = v27;
  objc_msgSend(v28, "continueWithBlock:", v38);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

id __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  AMSOptional *v7;
  void *v8;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    objc_msgSend(v4, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      objc_msgSend(v4, "setReason:", CFSTR("daemon security"));
  }
  v7 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v4);
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)handleCompletionWithTask:(id)a3 metrics:(id)a4 decodedObject:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  AMSFinanceResponse *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  AMSFinanceResponse *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  AMSFinanceResponse *v26;
  AMSURLProtocolHandler *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AMSFinanceResponse initWithTaskInfo:decodedObject:]([AMSFinanceResponse alloc], "initWithTaskInfo:decodedObject:", v12, v10);
    if (!v13)
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_opt_class();
        objc_msgSend(v12, "properties");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v24;
        v33 = 2114;
        v34 = v17;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to parse decodedObject", buf, 0x16u);

      }
    }
    objc_msgSend(v12, "response");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLProtocolHandler session](self, "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBiometrics handleResponse:session:taskInfo:](AMSBiometrics, "handleResponse:session:taskInfo:", v18, v19, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke;
    v25[3] = &unk_1E25468C8;
    v26 = v13;
    v27 = self;
    v28 = v12;
    v29 = v9;
    v30 = v11;
    v21 = v12;
    v22 = v13;
    objc_msgSend(v20, "addFinishBlock:", v25);

  }
  else
  {
    +[AMSURLAction proceedAction](AMSURLAction, "proceedAction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v11 + 2))(v11, v23);

  }
}

- (AMSURLSession)session
{
  os_unfair_lock_s *p_propertiesLock;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  os_unfair_lock_unlock(p_propertiesLock);
  return (AMSURLSession *)WeakRetained;
}

- (void)decodeMutableData:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  AMSURLProtocolHandler *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  AMSURLProtocolHandler *v35;
  id v36;
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "properties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v26, "mescalType");
  objc_msgSend(v11, "properties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMescal verificationPromiseForTask:data:type:bag:](AMSMescal, "verificationPromiseForTask:data:type:bag:", v9, v8, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "promiseAdapter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __66__AMSURLProtocolHandler_decodeMutableData_task_completionHandler___block_invoke;
  v33[3] = &unk_1E253DDF8;
  v18 = v11;
  v34 = v18;
  v35 = self;
  v36 = v8;
  v37 = v9;
  v25 = v9;
  v24 = v8;
  objc_msgSend(v16, "continueWithBlock:", v33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v17;
  v31[1] = 3221225472;
  v31[2] = __66__AMSURLProtocolHandler_decodeMutableData_task_completionHandler___block_invoke_30;
  v31[3] = &unk_1E2546828;
  v20 = v18;
  v32 = v20;
  objc_msgSend(v19, "catchWithBlock:", v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __66__AMSURLProtocolHandler_decodeMutableData_task_completionHandler___block_invoke_2;
  v27[3] = &unk_1E2546850;
  v29 = self;
  v30 = v10;
  v28 = v20;
  v22 = v20;
  v23 = v10;
  objc_msgSend(v21, "addFinishBlock:", v27);

}

id __66__AMSURLProtocolHandler_decodeMutableData_task_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  void *v24;
  AMSOptional *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (!v7)
  {
    v16 = a1[6];
    objc_msgSend(a1[7], "response");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ams_valueForHTTPHeaderField:", CFSTR("Content-Encoding"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && !objc_msgSend(v18, "caseInsensitiveCompare:", CFSTR("gzip")))
    {
      +[AMSData decompressedDataWithGzippedData:](AMSData, "decompressedDataWithGzippedData:", a1[6]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v21 = v19;

        v16 = v21;
      }

    }
    if (objc_msgSend(v6, "BOOLValue")
      && (objc_msgSend(a1[4], "properties"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "disableResponseDecoding"),
          v22,
          (v23 & 1) == 0))
    {
      objc_msgSend(a1[4], "response");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      +[AMSData objectWithData:response:error:](AMSData, "objectWithData:response:error:", v16, v29, &v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (AMSOptional *)v31;

      if (v25)
      {
        AMSError(4, CFSTR("Data decoding failed"), CFSTR("Failed to decode data in response"), v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v30);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
    }
    else
    {
      v24 = 0;
    }
    v25 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v24);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

    goto LABEL_22;
  }
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(a1[4], "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_opt_class();
    v14 = v13;
    if (v11)
    {
      objc_msgSend(a1[4], "properties");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "logUUID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v3);
    }
    else
    {
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v15;
    v34 = 2114;
    v35 = v27;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@Protocol encountered verification error = %{public}@", buf, 0x16u);
    if (v11)
    {

      v15 = a1;
    }

  }
  AMSError(304, CFSTR("Mescal Verification Failed"), CFSTR("Failed to verify mescal response header"), v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v26;
}

id __66__AMSURLProtocolHandler_decodeMutableData_task_completionHandler___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ams_statusCode") - 200;

  if (v5 > 0x63)
  {
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __66__AMSURLProtocolHandler_decodeMutableData_task_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  void *v7;
  void (*v8)(void);
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a2, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v6)
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "properties");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = objc_opt_class();
        v16 = v15;
        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 32), "properties");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logUUID");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] "), v16, v3);
        }
        else
        {
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: "), v15);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v17;
        v28 = 2114;
        v29 = v24;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@Data decoding failed. error = %{public}@.", buf, 0x16u);
        if (v13)
        {

          v17 = v25;
        }

      }
    }
    else
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "properties");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = objc_opt_class();
        v22 = v21;
        if (v19)
        {
          objc_msgSend(*(id *)(a1 + 32), "properties");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logUUID");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: [%@] "), v22, v3);
        }
        else
        {
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: "), v21);
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v23;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Data decoding finish without a created object or error.", buf, 0xCu);
        if (v19)
        {

          v23 = v25;
        }

      }
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v8();

}

- (id)decodeData:(id)a3 task:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  v9 = (void *)objc_msgSend(a3, "mutableCopy");
  -[AMSURLProtocolHandler decodeMutableData:task:error:](self, "decodeMutableData:task:error:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __54__AMSURLProtocolHandler_decodeMutableData_task_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  AMSOptional *v7;
  id v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (v5)
  {
    v6 = v5;
    v7 = 0;
  }
  else
  {
    v8 = a2;
    v7 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v8);

    v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v7, v6);

}

uint64_t __57__AMSURLProtocolHandler_didCreateTask_fromRequest_error___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)(a1 + 32);
  if (a2)
    v5 = MEMORY[0x1E0C9AAB0];
  else
    v5 = 0;
  return objc_msgSend(v4, "finishWithResult:error:", v5, a3);
}

- (void)didCreateTask:(id)a3 fromRequest:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  AMSURLProtocolHandler *v23;
  id v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "properties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "knownToBeTrusted");

  if (v13)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v11, "properties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLProtocolHandler _URLIsTrustedFromRequest:bag:](self, "_URLIsTrustedFromRequest:bag:", v9, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__AMSURLProtocolHandler_didCreateTask_fromRequest_completionHandler___block_invoke;
  v21[3] = &unk_1E25468A0;
  v22 = v11;
  v23 = self;
  v25 = v8;
  v26 = v10;
  v24 = v9;
  v17 = v8;
  v18 = v10;
  v19 = v9;
  v20 = v11;
  objc_msgSend(v14, "addFinishBlock:", v21);

}

void __69__AMSURLProtocolHandler_didCreateTask_fromRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int8x16_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  int8x16_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    if (v5)
    {
      objc_msgSend(v5, "arrayForKey:", 0x1E254C460);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valuePromise");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __69__AMSURLProtocolHandler_didCreateTask_fromRequest_completionHandler___block_invoke_40;
      v24[3] = &unk_1E253D6D8;
      v20 = *(int8x16_t *)(a1 + 32);
      v9 = (id)v20.i64[0];
      v25 = vextq_s8(v20, v20, 8uLL);
      objc_msgSend(v7, "catchWithBlock:", v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v8;
      v21[1] = 3221225472;
      v21[2] = __69__AMSURLProtocolHandler_didCreateTask_fromRequest_completionHandler___block_invoke_41;
      v21[3] = &unk_1E2546878;
      v21[4] = *(_QWORD *)(a1 + 40);
      v22 = *(id *)(a1 + 56);
      v23 = *(id *)(a1 + 64);
      objc_msgSend(v10, "addSuccessBlock:", v21);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
  }
  else
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "properties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURL(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v13;
      v28 = 2114;
      v29 = v15;
      v30 = 2114;
      v31 = v17;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL not trusted: %{public}@", buf, 0x20u);

    }
    v18 = *(_QWORD *)(a1 + 64);
    AMSError(300, CFSTR("Invalid Request"), CFSTR("URL not trusted"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v19);

  }
}

id __69__AMSURLProtocolHandler_didCreateTask_fromRequest_completionHandler___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
    objc_msgSend(*(id *)(a1 + 40), "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v6;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No reverse push patterns found in bag. error = %{public}@", (uint8_t *)&v12, 0x20u);

  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA60]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __69__AMSURLProtocolHandler_didCreateTask_fromRequest_completionHandler___block_invoke_41(uint64_t a1, uint64_t a2)
{
  if (objc_msgSend(*(id *)(a1 + 32), "shouldEnableReversePushForTask:apsEnabledPatterns:", *(_QWORD *)(a1 + 40), a2))objc_msgSend(*(id *)(a1 + 40), "set_APSRelayTopic:", CFSTR("com.apple.private.alloy.itunes.apsr"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  AMSURLProtocolHandler *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  AMSURLProtocolHandler *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  AMSURLProtocolHandler *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  AMSURLProtocolHandler *v63;
  _QWORD v64[5];
  id v65;
  id v66;

  v7 = a5;
  v10 = a4;
  v41 = a6;
  v11 = a3;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v39 = v12;
  v40 = v10;
  if (v7)
  {
    objc_msgSend(v10, "response");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v10, "response");
    else
      objc_msgSend(v12, "originalResponse");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSURLProtocolHandler _setResponseCookiesFromResponse:taskInfo:](self, "_setResponseCookiesFromResponse:taskInfo:", v19, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v17;
    v64[1] = 3221225472;
    v64[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke;
    v64[3] = &unk_1E2540E68;
    v64[4] = self;
    v65 = v10;
    v66 = v13;
    objc_msgSend(v20, "continueWithBlock:", v64);
    v21 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v21;
  }
  v60[0] = v17;
  v60[1] = 3221225472;
  v60[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_56;
  v60[3] = &unk_1E2546918;
  v22 = v13;
  v61 = v22;
  v23 = v15;
  v62 = v23;
  v63 = self;
  objc_msgSend(v16, "thenWithBlock:", v60);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v17;
  v57[1] = 3221225472;
  v57[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_60;
  v57[3] = &unk_1E253D9F0;
  v25 = v23;
  v58 = v25;
  v26 = v22;
  v59 = v26;
  objc_msgSend(v24, "thenWithBlock:", v57);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v17;
  v53[1] = 3221225472;
  v53[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2_61;
  v53[3] = &unk_1E2546918;
  v28 = v25;
  v54 = v28;
  v29 = v26;
  v55 = v29;
  v56 = self;
  objc_msgSend(v27, "thenWithBlock:", v53);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v17;
  v49[1] = 3221225472;
  v49[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_64;
  v49[3] = &unk_1E2546918;
  v31 = v28;
  v50 = v31;
  v32 = v29;
  v51 = v32;
  v52 = self;
  objc_msgSend(v30, "thenWithBlock:", v49);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v17;
  v45[1] = 3221225472;
  v45[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_66;
  v45[3] = &unk_1E2546918;
  v34 = v32;
  v46 = v34;
  v47 = v31;
  v48 = self;
  v35 = v31;
  objc_msgSend(v33, "thenWithBlock:", v45);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v17;
  v42[1] = 3221225472;
  v42[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_68;
  v42[3] = &unk_1E253E978;
  v43 = v34;
  v44 = v41;
  v37 = v34;
  v38 = v41;
  objc_msgSend(v36, "addSuccessBlock:", v42);

}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = objc_opt_class();
      v11 = v10;
      if (v8)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v3);
      }
      else
      {
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2114;
      v25 = v13;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to set response cookies. Continuing with request reconfiguration. error = %{public}@", buf, 0x16u);
      if (v8)
      {

        v12 = (void *)v3;
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "originalRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "HTTPBody");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v14, "HTTPBody");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setHTTPBody:", v16);

  }
  objc_msgSend(v14, "HTTPMethod");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v14, "HTTPMethod");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setHTTPMethod:", v18);

  }
  objc_msgSend(v14, "valueForHTTPHeaderField:", CFSTR("Content-Type"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setValue:forHTTPHeaderField:", v19, CFSTR("Content-Type"));
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_56(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_addCookiesForAccount:clientInfo:bag:", v3, v4, v5);

  if ((objc_msgSend(*(id *)(a1 + 40), "excludeIdentifierHeadersForAccount") & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ams_addIdentifierHeadersForAccount:", v7);

  }
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "clientInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountMediaType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSURLRequestDecoration addStoreFrontHeaderToRequest:forAccount:mediaType:bag:](AMSURLRequestDecoration, "addStoreFrontHeaderToRequest:forAccount:mediaType:bag:", v8, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2;
  v16[3] = &unk_1E25468F0;
  v16[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v13, "catchWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add storefront header. Continuing with request reconfiguration. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_60(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "ams_isLocalAccount") & 1) != 0 || (objc_msgSend(v2, "ams_isEphemeralAccount") & 1) != 0)
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "ams_addAuthKitHeaders");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2_61(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  if (objc_msgSend(*(id *)(a1 + 32), "reversePushType") == 2)
  {
    objc_msgSend(&unk_1E25AFB60, "stringValue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setValue:forHTTPHeaderField:", v2, CFSTR("x-apple-aps-delivery-type"));

  }
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buyParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSURLRequestDecoration addAbsintheHeadersToRequest:buyParams:bag:shouldUseRemoteSigningIfAvailable:](AMSURLRequestDecoration, "addAbsintheHeadersToRequest:buyParams:bag:shouldUseRemoteSigningIfAvailable:", v3, v5, v6, objc_msgSend(*(id *)(a1 + 32), "remoteSecuritySigningEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_63;
  v10[3] = &unk_1E25468F0;
  v10[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v7, "catchWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add Absinthe headers. Continuing with request reconfiguration. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_64(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  if (objc_msgSend(*(id *)(a1 + 32), "mescalType"))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = objc_msgSend(*(id *)(a1 + 32), "mescalType");
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "logUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSURLRequestDecoration addMescalHeaderToRequest:type:bag:logKey:](AMSURLRequestDecoration, "addMescalHeaderToRequest:type:bag:logKey:", v2, v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2_65;
  v9[3] = &unk_1E25468F0;
  v9[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v6, "catchWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2_65(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add Mescal headers. Continuing with request reconfiguration. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_66(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  objc_msgSend(*(id *)(a1 + 32), "ams_removeAnisetteHeaders");
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "anisetteType");
  objc_msgSend(*(id *)(a1 + 40), "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSURLRequestDecoration addAnisetteHeadersToRequest:account:type:bag:](AMSURLRequestDecoration, "addAnisetteHeadersToRequest:account:type:bag:", v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2_67;
  v9[3] = &unk_1E25468F0;
  v9[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v6, "catchWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2_67(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add Anisette headers. Continuing with request reconfiguration. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  AMSMutablePromise *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = objc_alloc_init(AMSMutablePromise);
  -[AMSPromise completionHandlerAdapter](v12, "completionHandlerAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLProtocolHandler reconfigureNewRequest:originalTask:redirect:completionHandler:](self, "reconfigureNewRequest:originalTask:redirect:completionHandler:", v10, v11, v7, v13);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_error___block_invoke;
  v17[3] = &unk_1E253DAE0;
  v18 = v10;
  v14 = v10;
  -[AMSMutablePromise thenWithBlock:](v12, "thenWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "resultWithError:", a6);

}

id __75__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) == v3)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "allHTTPHeaderFields");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAllHTTPHeaderFields:", v5);

    objc_msgSend(v4, "HTTPMethod");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setHTTPMethod:", v6);

    objc_msgSend(*(id *)(a1 + 32), "setHTTPShouldHandleCookies:", objc_msgSend(v4, "HTTPShouldHandleCookies"));
    objc_msgSend(*(id *)(a1 + 32), "setHTTPShouldUsePipelining:", objc_msgSend(v4, "HTTPShouldUsePipelining"));
    objc_msgSend(v4, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setURL:", v7);

    objc_msgSend(v4, "HTTPBodyStream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "setHTTPBodyStream:", v8);
    }
    else
    {
      objc_msgSend(v4, "HTTPBody");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setHTTPBody:", v10);

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

id __46__AMSURLProtocolHandler__handleResponse_task___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v39[5];
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
      objc_msgSend(*(id *)(a1 + 40), "properties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v7;
      v43 = 2114;
      v44 = v9;
      v45 = 2114;
      v46 = v10;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to set response cookies on account. Continuing with request. error = %{public}@", buf, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "ams_valueForHTTPHeaderField:", CFSTR("X-Set-Apple-Store-Front"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldSetStorefrontFromResponse");

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "properties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "account");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 40), "properties");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "clientInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "accountMediaType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ams_setStorefront:forMediaType:", v11, v18);

        if (objc_msgSend(v15, "ams_isEphemeralAccount"))
        {
          +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
            v21 = objc_opt_class();
            objc_msgSend(*(id *)(a1 + 40), "properties");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "logUUID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v42 = v21;
            v43 = 2114;
            v44 = v23;
            v45 = 2114;
            v46 = v11;
            _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] ^Ephemeral Account^ skipping save, set StoreFront: %{public}@", buf, 0x20u);

          }
          +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
        v34 = (void *)MEMORY[0x1E0C8F2B8];
        objc_msgSend(*(id *)(a1 + 40), "properties");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "clientInfo");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "ams_sharedAccountStoreForProcessInfo:", v36);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(v32, "ams_saveAccount:verifyCredentials:", v15, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_75;
          v39[3] = &unk_1E253D950;
          v37 = *(void **)(a1 + 40);
          v39[4] = *(_QWORD *)(a1 + 32);
          v40 = v37;
          objc_msgSend(v24, "addErrorBlock:", v39);

LABEL_26:
LABEL_27:

          goto LABEL_28;
        }
        +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
        v33 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v25, "OSLogObject");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = (void *)objc_opt_class();
          v28 = *(void **)(a1 + 40);
          v29 = v27;
          objc_msgSend(v28, "properties");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "logUUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = (uint64_t)v27;
          v43 = 2114;
          v44 = v31;
          v45 = 2114;
          v46 = v11;
          _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Set store front received (%{public}@) with no account to set it on", buf, 0x20u);

        }
        AMSError(0, CFSTR("Failed to save account with updated storefront"), CFSTR("No account was provided"), 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v32);
        v33 = objc_claimAutoreleasedReturnValue();
      }
      v24 = (void *)v33;
      goto LABEL_26;
    }
  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v24;
}

void __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_75(uint64_t a1, void *a2)
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
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
    v7 = *(void **)(a1 + 40);
    v8 = v6;
    objc_msgSend(v7, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v6;
    v13 = 2114;
    v14 = v10;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set the storefront. error = %{public}@", (uint8_t *)&v11, 0x20u);

  }
}

id __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_81(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
    objc_msgSend(*(id *)(a1 + 40), "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to save account with updated storefront. Response handling will continue.", (uint8_t *)&v8, 0x16u);

  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_82(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AMSOptional *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-Partner"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPartnerHeader:", v2);

  }
  objc_msgSend(*(id *)(a1 + 32), "ams_valueForHTTPHeaderField:", CFSTR("x-apple-aps-delivery-type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 32), "ams_valueForHTTPHeaderField:", CFSTR("x-apple-aps-delivery-type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 < 1)
    goto LABEL_14;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
    objc_msgSend(*(id *)(a1 + 48), "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v9;
    v20 = 2114;
    v21 = v11;
    v22 = 2048;
    v23 = v6;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Reverse push received response header %ld", (uint8_t *)&v18, 0x20u);

  }
  if (v6 != 1001)
    goto LABEL_14;
  objc_msgSend(*(id *)(a1 + 48), "properties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setReversePushType:", 2);

  +[AMSURLAction retryAction](AMSURLAction, "retryAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setReason:", CFSTR("reverse push"));
  objc_msgSend(v13, "setRetryIdentifier:", 0x1E25642C0);
  if (v13 && objc_msgSend(v13, "actionType"))
    goto LABEL_18;
LABEL_15:
  if (objc_msgSend(*(id *)(a1 + 32), "ams_statusCode") != 401
    || (objc_msgSend(*(id *)(a1 + 32), "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-Allow-Auth-Types")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        !v14))
  {
LABEL_18:
    v16 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v13);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  +[AMSFinanceAuthenticateResponse performAuthFromResponse:taskInfo:](AMSFinanceAuthenticateResponse, "performAuthFromResponse:taskInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v15;
}

id __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  AMSOptional *v9;
  void *v10;
  int v11;
  AMSOptional *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[5];

  v5 = a3;
  objc_msgSend(a2, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v6 && objc_msgSend(v6, "actionType"))
  {
    v9 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v7);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (+[AMSDefaults enableRemoteSecuritySigning](AMSDefaults, "enableRemoteSecuritySigning")
      && (objc_msgSend(*(id *)(a1 + 32), "properties"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "remoteSecuritySigningEnabled"),
          v10,
          v11))
    {
      +[AMSSigningSecurityService sharedService](AMSSigningSecurityService, "sharedService");
      v12 = (AMSOptional *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "properties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSOptional handleResponse:bag:](v12, "handleResponse:bag:", v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "continueWithBlock:", &__block_literal_global_132);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "properties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bag");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSAbsinthe handleResponse:bag:](AMSAbsinthe, "handleResponse:bag:", v17, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v12 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v20);
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)v20;
    }

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_3;
    v22[3] = &unk_1E2546988;
    v22[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v8, "addFinishBlock:", v22);
  }

  return v8;
}

id __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_98(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  AMSOptional *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  AMSOptional *v45;
  void *v46;
  AMSOptional *v47;
  id v49;
  void *v50;
  char v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v50 = v5;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = a1[5];
      objc_msgSend(v50, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v49 = v6;
      if (!v8 || !objc_msgSend(v8, "actionType"))
      {
        objc_msgSend(a1[6], "properties");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "anisetteType");
        objc_msgSend(a1[6], "properties");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bag");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "properties");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "account");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSAnisette handleResponse:type:bag:account:](AMSAnisette, "handleResponse:type:bag:account:", v7, v11, v13, v15);
        v16 = objc_claimAutoreleasedReturnValue();

        v6 = v49;
        v9 = (void *)v16;
        if (!v16)
          goto LABEL_32;
      }
      if (!objc_msgSend(v9, "actionType"))
      {
LABEL_32:
        v51 = 0;
        +[AMSURLSession sharedAuthKitSession](AMSURLSession, "sharedAuthKitSession");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[7], "currentRequest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleResponse:forRequest:shouldRetry:", v7, v18, &v51);

        if (v51)
        {
          +[AMSURLAction retryAction](AMSURLAction, "retryAction");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "setRetryIdentifier:", 0x1E2564220);
          +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v20, "OSLogObject");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = objc_opt_class();
            objc_msgSend(a1[6], "properties");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "logUUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v53 = v22;
            v54 = 2114;
            v55 = v24;
            _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrying for AuthKit anisette", buf, 0x16u);

          }
          v9 = v19;
        }
      }
      v25 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v9);
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9 || !objc_msgSend(v9, "actionType"))
      {
        objc_msgSend(a1[4], "session");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
            v30 = objc_opt_class();
            objc_msgSend(a1[6], "properties");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "logUUID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v53 = v30;
            v54 = 2114;
            v55 = v32;
            _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL session is unexpectedly nil for Fraud Report, using default session", buf, 0x16u);

          }
          +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(a1[6], "properties");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "account");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "properties");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "bag");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_opt_new();
        AMSFraudReportHandleResponse(v27, v7, v34, v36, v37);
        v38 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)v38;
        v6 = v49;
      }

    }
    else
    {
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
      v41 = (void *)objc_opt_class();
      v42 = v41;
      AMSLogKey();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = (uint64_t)v41;
      v54 = 2114;
      v55 = v43;
      v56 = 2114;
      v57 = v44;
      _os_log_impl(&dword_18C849000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Error occurred when handling response. error = %{public}@", buf, 0x20u);

    }
    v45 = [AMSOptional alloc];
    +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v6);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[AMSOptional initWithValue:](v45, "initWithValue:", v46);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v47);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v26;
}

- (void)_pingURL:(id)a3 session:(id)a4 account:(id)a5 bag:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "URLForKey:", 0x1E254CD60);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valuePromise");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __54__AMSURLProtocolHandler__pingURL_session_account_bag___block_invoke;
    v30[3] = &unk_1E2544EC0;
    v30[4] = self;
    v31 = v10;
    v32 = v14;
    v33 = v12;
    objc_msgSend(v16, "continueWithBlock:", v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v17;
    v28[1] = 3221225472;
    v28[2] = __54__AMSURLProtocolHandler__pingURL_session_account_bag___block_invoke_2;
    v28[3] = &unk_1E253EBD8;
    v28[4] = self;
    v29 = v11;
    objc_msgSend(v18, "thenWithBlock:", v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v17;
    v27[1] = 3221225472;
    v27[2] = __54__AMSURLProtocolHandler__pingURL_session_account_bag___block_invoke_113;
    v27[3] = &unk_1E253FFE0;
    v27[4] = self;
    objc_msgSend(v19, "addFinishBlock:", v27);

  }
  else
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      AMSLogKey();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = objc_opt_class();
      v25 = v24;
      if (v22)
      {
        AMSLogKey();
        self = (AMSURLProtocolHandler *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] "), v25, self);
      }
      else
      {
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: "), v24);
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v26;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_INFO, "%{public}@Skipping ping-url as bag was not provided.", buf, 0xCu);
      if (v22)
      {

        v26 = self;
      }

    }
  }

}

id __54__AMSURLProtocolHandler__pingURL_session_account_bag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  AMSURLRequestEncoder *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_opt_class();
      v12 = v11;
      if (v9)
      {
        AMSLogKey();
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v12, a1);
      }
      else
      {
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: "), v11);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v13;
      v38 = 2114;
      v39 = v32;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_INFO, "%{public}@Response ping-url failed to fetch metrics url string. error = %{public}@", buf, 0x16u);
      if (v9)
      {

        v13 = (void *)a1;
      }

    }
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v14, "host");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "host");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    if (v17)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v14, 0);
      objc_msgSend(v14, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "queryItems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "indexOfObjectPassingTest:", &__block_literal_global_105);
      if (objc_msgSend(v19, "hasPrefix:", v20) && v22 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSince1970");
        v25 = v24;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), (uint64_t)(v25 * 1000.0));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("eventTime"), v34);
        v35 = v19;
        v27 = (void *)objc_msgSend(v21, "mutableCopy");
        objc_msgSend(v27, "replaceObjectAtIndex:withObject:", v22, v26);
        v28 = (void *)objc_msgSend(v27, "copy");
        objc_msgSend(v18, "setQueryItems:", v28);

        objc_msgSend(v18, "URL");
        v29 = objc_claimAutoreleasedReturnValue();

        v19 = v35;
        v14 = (id)v29;
      }

    }
    v30 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", *(_QWORD *)(a1 + 48));
    -[AMSURLRequestEncoder setUrlKnownToBeTrusted:](v30, "setUrlKnownToBeTrusted:", 1);
    -[AMSURLRequestEncoder setAccount:](v30, "setAccount:", *(_QWORD *)(a1 + 56));
    -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v30, "requestWithMethod:URL:parameters:", 2, v14, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v31;
}

uint64_t __54__AMSURLProtocolHandler__pingURL_session_account_bag___block_invoke_103(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("eventTime"));

  return v3;
}

id __54__AMSURLProtocolHandler__pingURL_session_account_bag___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_opt_class();
    v11 = v10;
    if (v8)
    {
      objc_msgSend(v4, "properties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logUUID");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v2);
    }
    else
    {
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    v20 = 2114;
    v21 = v14;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_INFO, "%{public}@Pinging %{public}@.", buf, 0x16u);

    if (v8)
    {

      v12 = v17;
    }

  }
  objc_msgSend(v4, "setTimeoutInterval:", 20.0);
  objc_msgSend(*(id *)(a1 + 40), "dataTaskPromiseWithRequest:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __54__AMSURLProtocolHandler__pingURL_session_account_bag___block_invoke_113(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "logUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      v13 = v12;
      if (v10)
      {
        objc_msgSend(v5, "logUUID");
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] "), v13, a1);
      }
      else
      {
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_INFO, "%{public}@Ping-url succeeded.", buf, 0xCu);
      if (v10)
      {

        v14 = (void *)a1;
      }

    }
  }
  else
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(0, "logUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = objc_opt_class();
      v18 = v17;
      if (v15)
      {
        objc_msgSend(0, "logUUID");
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] "), v18, a1);
      }
      else
      {
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: "), v17);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v19;
      v23 = 2114;
      v24 = v20;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@Ping-url failed. %{public}@", buf, 0x16u);
      if (v15)
      {

        v19 = (void *)a1;
      }

    }
  }

}

void __66__AMSURLProtocolHandler__setResponseCookiesFromResponse_taskInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
    v6 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v6;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to add cookies for response. error = %{public}@", (uint8_t *)&v10, 0x20u);

  }
}

- (BOOL)shouldEnableReversePushForTask:(id)a3 apsEnabledPatterns:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  os_log_type_t v41;
  BOOL v42;
  void *v44;
  _BOOL4 v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  _QWORD v64[4];
  NSObject *v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "reversePushType");

  objc_msgSend(v7, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "purchaseInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "properties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[AMSDefaults QAMode](AMSDefaults, "QAMode"))
  {
    if (v11)
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = objc_opt_class();
      if (v13)
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] "), v17, v13);
      else
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: "), v17, v63);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v34;
      v35 = "%{public}@Reverse push disabled (QAMode)";
      goto LABEL_49;
    }
    goto LABEL_53;
  }
  if ((unint64_t)(v9 - 1) > 1)
  {
    if (v9 == 3)
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v14, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        v22 = objc_opt_class();
        if (v13)
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: [%@] "), v22, v13);
        else
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: "), v22, v63);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v67 = v44;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Reverse push explicitly enabled by caller", buf, 0xCu);

      }
LABEL_57:

      if (+[AMSProcessInfo BOOLForEntitlement:](AMSProcessInfo, "BOOLForEntitlement:", CFSTR("aps-connection-initiate")))
      {
        v42 = 1;
        goto LABEL_54;
      }
      v45 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v46 = objc_claimAutoreleasedReturnValue();
      v14 = v46;
      if (v45)
      {
        if (!v46)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        -[NSObject OSLogObject](v14, "OSLogObject");
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = (objc_class *)objc_opt_class();
          NSStringFromClass(v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v67 = v49;
          _os_log_impl(&dword_18C849000, v47, OS_LOG_TYPE_ERROR, "%{public}@: Reverse push would have been attempted, but the current process lacks the correct entitlement", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v14 = objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject postNotificationName:object:userInfo:](v14, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v15, 0);
        goto LABEL_51;
      }
      if (!v46)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        goto LABEL_51;
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v34;
      v35 = "%{public}@: Reverse push would have been attempted, but the current process lacks the correct entitlement";
      v40 = v15;
      v41 = OS_LOG_TYPE_FAULT;
      goto LABEL_50;
    }
    if (+[AMSDefaults reversePushEnabled](AMSDefaults, "reversePushEnabled") == 2)
    {
      if (v11)
      {
        +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        -[NSObject OSLogObject](v14, "OSLogObject");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          goto LABEL_51;
        v23 = (void *)MEMORY[0x1E0CB3940];
        v24 = objc_opt_class();
        if (v13)
          objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] "), v24, v13);
        else
          objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: "), v24, v63);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v67 = v34;
        v35 = "%{public}@Reverse push disabled (AMSDefaults)";
        v40 = v15;
        v41 = OS_LOG_TYPE_DEBUG;
        goto LABEL_50;
      }
      goto LABEL_53;
    }
    v25 = 1.0;
    if (+[AMSDefaults reversePushEnabled](AMSDefaults, "reversePushEnabled") != 1)
    {
      objc_msgSend((id)objc_opt_class(), "reversePushSamplingPercentageForTask:", v5);
      v25 = v26;
    }
    +[AMSRandomNumberGenerator normalizedRandomDouble](AMSRandomNumberGenerator, "normalizedRandomDouble");
    if (v27 <= 0.0 || v27 > v25)
    {
      if (!v11)
        goto LABEL_53;
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      v36 = (void *)objc_opt_class();
      v37 = v36;
      objc_msgSend(v7, "properties");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "logUUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v67 = v36;
      v68 = 2114;
      v69 = v39;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Reverse push not sampled", buf, 0x16u);

    }
    else
    {
      objc_msgSend(v5, "currentRequest");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "URL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "absoluteString");
      v14 = objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        if (!v11)
          goto LABEL_52;
        +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v15 = objc_claimAutoreleasedReturnValue();
        }
        -[NSObject OSLogObject](v15, "OSLogObject");
        v37 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          goto LABEL_97;
        v51 = (void *)MEMORY[0x1E0CB3940];
        v52 = objc_opt_class();
        if (v13)
          objc_msgSend(v51, "stringWithFormat:", CFSTR("%@: [%@] "), v52, v13);
        else
          objc_msgSend(v51, "stringWithFormat:", CFSTR("%@: "), v52, v63);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v67 = v59;
        v60 = "%{public}@Reverse push disabled because we can’t find a URL";
        goto LABEL_96;
      }
      if (objc_msgSend(v6, "count"))
      {
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __75__AMSURLProtocolHandler_shouldEnableReversePushForTask_apsEnabledPatterns___block_invoke;
        v64[3] = &unk_1E253D348;
        v14 = v14;
        v65 = v14;
        if (!objc_msgSend(v6, "ams_anyWithTest:", v64))
        {
          if (v11)
          {
            +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v55)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v55, "OSLogObject");
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              v57 = (void *)MEMORY[0x1E0CB3940];
              v58 = objc_opt_class();
              if (v13)
                objc_msgSend(v57, "stringWithFormat:", CFSTR("%@: [%@] "), v58, v13);
              else
                objc_msgSend(v57, "stringWithFormat:", CFSTR("%@: "), v58, v63);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v67 = v62;
              _os_log_impl(&dword_18C849000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@Reverse push sampled, but not enabled", buf, 0xCu);

            }
          }
          v15 = v65;
          goto LABEL_51;
        }
        +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
          v32 = (void *)MEMORY[0x1E0CB3940];
          v33 = objc_opt_class();
          if (v13)
            objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: [%@] "), v33, v13);
          else
            objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: "), v33, v63);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v67 = v61;
          _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Reverse push enabled", buf, 0xCu);

        }
        v20 = v65;
        goto LABEL_57;
      }
      if (!v11)
        goto LABEL_52;
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v15, "OSLogObject");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v53 = (void *)MEMORY[0x1E0CB3940];
        v54 = objc_opt_class();
        if (v13)
          objc_msgSend(v53, "stringWithFormat:", CFSTR("%@: [%@] "), v54, v13);
        else
          objc_msgSend(v53, "stringWithFormat:", CFSTR("%@: "), v54, v63);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v67 = v59;
        v60 = "%{public}@Reverse push sampled, but failed to find patterns.";
LABEL_96:
        _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_ERROR, v60, buf, 0xCu);

      }
    }
LABEL_97:

    goto LABEL_51;
  }
  if (v11)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_51;
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = objc_opt_class();
    if (v13)
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: [%@] "), v19, v13);
    else
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: "), v19, v63);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v67 = v34;
    v35 = "%{public}@Reverse push disabled by caller";
LABEL_49:
    v40 = v15;
    v41 = OS_LOG_TYPE_DEFAULT;
LABEL_50:
    _os_log_impl(&dword_18C849000, v40, v41, v35, buf, 0xCu);

LABEL_51:
LABEL_52:

  }
LABEL_53:
  v42 = 0;
LABEL_54:

  return v42;
}

BOOL __75__AMSURLProtocolHandler_shouldEnableReversePushForTask_apsEnabledPatterns___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:", a2, 1024) != 0x7FFFFFFFFFFFFFFFLL;
}

@end
