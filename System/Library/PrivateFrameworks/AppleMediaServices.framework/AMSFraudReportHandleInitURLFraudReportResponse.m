@implementation AMSFraudReportHandleInitURLFraudReportResponse

void __AMSFraudReportHandleInitURLFraudReportResponse_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_INFO, "AMSFraudReport [%{public}@] Successfully called init URL.", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      AMSLogableError(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Failed to call init URL: %{public}@.", (uint8_t *)&v12, 0x16u);

    }
  }

}

@end
