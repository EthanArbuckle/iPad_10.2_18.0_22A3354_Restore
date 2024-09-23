@implementation AMSBiometricsTokenUpdateTask

- (AMSBiometricsTokenUpdateTask)initWithAccount:(id)a3
{
  id v5;
  AMSBiometricsTokenUpdateTask *v6;
  AMSBiometricsTokenUpdateTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSBiometricsTokenUpdateTask;
  v6 = -[AMSTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)performUpdate
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  AMSMutableBinaryPromise *v9;
  void *v10;
  AMSMutableBinaryPromise *v11;
  void *v12;
  uint64_t v13;
  AMSMutableBinaryPromise *v14;
  AMSMutableBinaryPromise *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  AMSMutableBinaryPromise *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = AMSSetLogKeyIfNeeded();
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
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
    v6 = (void *)objc_opt_class();
    v7 = v6;
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v6;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting token update.", buf, 0x16u);

  }
  v9 = objc_alloc_init(AMSMutableBinaryPromise);
  if (+[AMSBiometrics type](AMSBiometrics, "type")
    && +[AMSBiometrics type](AMSBiometrics, "type") != 1)
  {
    -[AMSBiometricsTokenUpdateTask _performBiometricsTokenUpdate](self, "_performBiometricsTokenUpdate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __45__AMSBiometricsTokenUpdateTask_performUpdate__block_invoke;
    v18[3] = &unk_1E253F870;
    v18[4] = self;
    v14 = v9;
    v19 = v14;
    objc_msgSend(v12, "addFinishBlock:", v18);

    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __45__AMSBiometricsTokenUpdateTask_performUpdate__block_invoke_6;
    v17[3] = &unk_1E253E120;
    v17[4] = self;
    -[AMSBinaryPromise addErrorBlock:](v14, "addErrorBlock:", v17);
    v15 = v14;

  }
  else
  {
    AMSError(5, CFSTR("Token Update Error"), CFSTR("Platform does not have LocalAuth"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMutableBinaryPromise finishWithError:](v9, "finishWithError:", v10);
    v11 = v9;

  }
  return v9;
}

void __45__AMSBiometricsTokenUpdateTask_performUpdate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v8;
      v18 = 2114;
      v19 = v10;
      v20 = 2114;
      v21 = v4;
      v11 = "%{public}@: [%{public}@] Completed with error: %{public}@";
      v12 = v7;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 32;
LABEL_10:
      _os_log_impl(&dword_18C849000, v12, v13, v11, (uint8_t *)&v16, v14);

    }
  }
  else
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
      v15 = (void *)objc_opt_class();
      v9 = v15;
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2114;
      v19 = v10;
      v11 = "%{public}@: [%{public}@] Completed successfully";
      v12 = v7;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 22;
      goto LABEL_10;
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess:error:", v4 == 0, v4);
}

void __45__AMSBiometricsTokenUpdateTask_performUpdate__block_invoke_6(uint64_t a1, void *a2)
{
  __CFString *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = &stru_1E2548760;
    v9 = 138543874;
    v10 = v5;
    if (v2)
      v8 = v2;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Biometrics token update failed. %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

- (id)_performBiometricsTokenUpdate
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _BYTE buf[24];
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  AMSDaemonConnection *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
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
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending request to amsaccountsd", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v14 = __Block_byref_object_copy__13;
  v15 = __Block_byref_object_dispose__13;
  v16 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "securityServiceProxyWithDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__AMSBiometricsTokenUpdateTask__performBiometricsTokenUpdate__block_invoke;
  v12[3] = &unk_1E253F760;
  v12[4] = self;
  v12[5] = buf;
  objc_msgSend(v8, "thenWithBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "binaryPromiseAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(buf, 8);
  return v10;
}

AMSMutablePromise *__61__AMSBiometricsTokenUpdateTask__performBiometricsTokenUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AMSMutablePromise *v11;
  uint64_t v12;
  _QWORD v14[4];
  AMSMutablePromise *v15;
  uint64_t v16;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 32), "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "additionalDialogMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 32), "shouldGenerateKeysOnly");
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldRequestConfirmation") & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(*(id *)(a1 + 32), "shouldPromptUser");
  v10 = objc_msgSend(*(id *)(a1 + 32), "isUserInitiated");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__AMSBiometricsTokenUpdateTask__performBiometricsTokenUpdate__block_invoke_2;
  v14[3] = &unk_1E253F678;
  v11 = v4;
  v12 = *(_QWORD *)(a1 + 40);
  v15 = v11;
  v16 = v12;
  objc_msgSend(v3, "performBiometricTokenUpdateWithAccount:clientInfo:additionalDialogMetrics:shouldGenerateKeysOnly:shouldRequestConfirmation:userInitiated:completion:", v5, v6, v7, v8, v9, v10, v14);

  return v11;
}

void __61__AMSBiometricsTokenUpdateTask__performBiometricsTokenUpdate__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = *(void **)(a1 + 32);
  if (a3)
    objc_msgSend(v4, "finishWithError:");
  else
    objc_msgSend(v4, "finishWithResult:", MEMORY[0x1E0C9AAB0]);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
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
    v10 = (void *)objc_opt_class();
    v11 = v10;
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v10;
    v23 = 2114;
    v24 = v12;
    v25 = 2114;
    v26 = v13;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling authenticate request. Request: %{public}@", buf, 0x20u);

  }
  -[AMSBiometricsTokenUpdateTask presentationDelegate](self, "presentationDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v6, "options");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowPasswordGeneration:", 2);

    -[AMSBiometricsTokenUpdateTask presentationDelegate](self, "presentationDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__AMSBiometricsTokenUpdateTask_handleAuthenticateRequest_completion___block_invoke;
    v18[3] = &unk_1E253F898;
    v18[4] = self;
    v19 = v6;
    v20 = v7;
    objc_msgSend(v16, "handleAuthenticateRequest:completion:", v19, v18);

  }
  else
  {
    AMSError(6, CFSTR("Token Update Error"), CFSTR("Could not handle authenticate request, presentation delegate not set"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v17);

  }
}

void __69__AMSBiometricsTokenUpdateTask_handleAuthenticateRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
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
    v9 = (void *)objc_opt_class();
    v10 = v9;
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(*(void **)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v9;
    v15 = 2114;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate handled authenticate request. Request: %{public}@", (uint8_t *)&v13, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
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
    v10 = (void *)objc_opt_class();
    v11 = v10;
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v10;
    v21 = 2114;
    v22 = v12;
    v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling dialog request. Request: %{public}@", buf, 0x20u);

  }
  -[AMSBiometricsTokenUpdateTask presentationDelegate](self, "presentationDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[AMSBiometricsTokenUpdateTask presentationDelegate](self, "presentationDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__AMSBiometricsTokenUpdateTask_handleDialogRequest_completion___block_invoke;
    v16[3] = &unk_1E253F8C0;
    v16[4] = self;
    v17 = v6;
    v18 = v7;
    objc_msgSend(v14, "handleDialogRequest:completion:", v17, v16);

  }
  else
  {
    AMSError(6, CFSTR("Token Update Error"), CFSTR("Could not handle dialog request, presentation delegate not set"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);

  }
}

void __63__AMSBiometricsTokenUpdateTask_handleDialogRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
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
    v9 = (void *)objc_opt_class();
    v10 = v9;
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = 138543874;
    v14 = v9;
    v15 = 2114;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate handled dialog request. Request: %{public}@", (uint8_t *)&v13, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

+ (NSString)bagSubProfile
{
  return +[AMSPurchaseQueue bagSubProfile](AMSPurchaseQueue, "bagSubProfile");
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSPurchaseQueue bagSubProfileVersion](AMSPurchaseQueue, "bagSubProfileVersion");
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)additionalDialogMetrics
{
  return self->_additionalDialogMetrics;
}

- (void)setAdditionalDialogMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_additionalDialogMetrics, a3);
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (AMSRequestPresentationDelegate)presentationDelegate
{
  return (AMSRequestPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (BOOL)shouldGenerateKeysOnly
{
  return self->_shouldGenerateKeysOnly;
}

- (void)setShouldGenerateKeysOnly:(BOOL)a3
{
  self->_shouldGenerateKeysOnly = a3;
}

- (BOOL)shouldRequestConfirmation
{
  return self->_shouldRequestConfirmation;
}

- (void)setShouldRequestConfirmation:(BOOL)a3
{
  self->_shouldRequestConfirmation = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (BOOL)shouldPromptUser
{
  return self->_shouldPromptUser;
}

- (void)setShouldPromptUser:(BOOL)a3
{
  self->_shouldPromptUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_additionalDialogMetrics, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
