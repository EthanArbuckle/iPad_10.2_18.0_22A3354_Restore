@implementation AMSClientCertificateTask

- (AMSClientCertificateTask)initWithOptions:(id)a3
{
  id v4;
  AMSClientCertificateTask *v5;
  uint64_t v6;
  AMSKeychainOptions *options;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSClientCertificateTask;
  v5 = -[AMSTask init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = (AMSKeychainOptions *)v6;

  }
  return v5;
}

- (id)performClientCertChainRequest
{
  void *v3;
  void *v4;
  int v5;
  objc_class *v6;
  id v7;
  void *v8;
  AMSDaemonConnection *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.amsaccountsd"));

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__19;
  v22 = __Block_byref_object_dispose__19;
  v23 = 0;
  if (!v5
    || (v6 = NSClassFromString(CFSTR("AMSDSecurityService"))) == 0
    || (v7 = objc_alloc_init(v6),
        +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    v9 = objc_alloc_init(AMSDaemonConnection);
    v10 = (void *)v19[5];
    v19[5] = (uint64_t)v9;

    objc_msgSend((id)v19[5], "securityServiceProxyWithDelegate:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__AMSClientCertificateTask_performClientCertChainRequest__block_invoke;
  v17[3] = &unk_1E2540118;
  v17[4] = self;
  objc_msgSend(v8, "thenWithBlock:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v19[5])
  {
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __57__AMSClientCertificateTask_performClientCertChainRequest__block_invoke_2;
    v16[3] = &unk_1E2540140;
    v16[4] = &v18;
    objc_msgSend(v12, "addFinishBlock:", v16);
  }
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __57__AMSClientCertificateTask_performClientCertChainRequest__block_invoke_3;
  v15[3] = &unk_1E253E120;
  v15[4] = self;
  objc_msgSend(v13, "addErrorBlock:", v15);
  _Block_object_dispose(&v18, 8);

  return v13;
}

AMSPromise *__57__AMSClientCertificateTask_performClientCertChainRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSPromise *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = objc_alloc_init(AMSPromise);
  objc_msgSend(*(id *)(a1 + 32), "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPromise completionHandlerAdapter](v4, "completionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performClientCertChainRequestWithOptions:completion:", v5, v6);

  return v4;
}

void __57__AMSClientCertificateTask_performClientCertChainRequest__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __57__AMSClientCertificateTask_performClientCertChainRequest__block_invoke_3(uint64_t a1, void *a2)
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
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform client cert chain request: %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
}

- (AMSKeychainOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
