@implementation AMSAppleCardSilentEnrollmentProtocolHandler

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v7 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSAppleCardSilentEnrollmentProtocolHandler;
  -[AMSURLProtocolHandler reconfigureNewRequest:originalTask:redirect:error:](&v18, sel_reconfigureNewRequest_originalTask_redirect_error_, v10, a4, v7, a6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ams_activeiCloudAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v10, "ams_addSilentEnrollmentHeadersForAccount:", v12);
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)objc_opt_class();
        v16 = v15;
        AMSSetLogKeyIfNeeded();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v15;
        v21 = 2114;
        v22 = v17;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find active iCloud account", buf, 0x16u);

      }
    }

  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v7;
  id v8;
  void *v9;
  AMSAuthenticateTask *v10;

  v7 = a6;
  v8 = a5;
  v10 = -[AMSAuthenticateTask initWithRequest:]([AMSAuthenticateTask alloc], "initWithRequest:", v8);

  -[AMSAuthenticateTask performAuthentication](v10, "performAuthentication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addFinishBlock:", v7);

}

@end
