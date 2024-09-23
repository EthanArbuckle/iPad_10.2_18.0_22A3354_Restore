@implementation AMSFinanceDelegateAuthenticateChallengeResponse

- (AMSFinanceDelegateAuthenticateChallengeResponse)initWithResponseDictionary:(id)a3 taskInfo:(id)a4
{
  id v7;
  id v8;
  AMSFinanceDelegateAuthenticateChallengeResponse *v9;
  AMSFinanceDelegateAuthenticateChallengeResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSFinanceDelegateAuthenticateChallengeResponse;
  v9 = -[AMSFinanceDelegateAuthenticateChallengeResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_responseDictionary, a3);
    objc_storeStrong((id *)&v10->_taskInfo, a4);
  }

  return v10;
}

+ (BOOL)isDelegateAuthChallengeForTaskInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-DelegateAuth-Challenge"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6 != 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v9;
    v14 = 2114;
    v15 = v4;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Is delegate auth challenge? %{public}@", (uint8_t *)&v12, 0x20u);

  }
  return v6 != 0;
}

- (id)performWithTaskInfo:(id)a3
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", a3);
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
    AMSSetLogKeyIfNeeded();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate auth action not implemented", (uint8_t *)&v8, 0x16u);

  }
  return 0;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setResponseDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_responseDictionary, a3);
}

- (AMSURLTaskInfo)taskInfo
{
  return self->_taskInfo;
}

- (void)setTaskInfo:(id)a3
{
  objc_storeStrong((id *)&self->_taskInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
