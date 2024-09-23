@implementation AMSSaveAccount

void __AMSSaveAccount_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  objc_class *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = (objc_class *)objc_opt_class();
  AMSCheckErrorForUnitTestAccess(v5, v4);
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v2);
    }
    else
    {
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(*(void **)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v12;
    v17 = 2114;
    v18 = v13;
    v19 = 2114;
    v20 = v14;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to save an account. account = %{public}@ | error = %{public}@", buf, 0x20u);
    if (v8)
    {

      v12 = (void *)v2;
    }

  }
}

@end
