@implementation AMSFraudReportHandleRetryFraudReportResponse

id __AMSFraudReportHandleRetryFraudReportResponse_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[AMSURLAction retryAction](AMSURLAction, "retryAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setReason:", CFSTR("fraud report score updated"));
    objc_msgSend(v7, "setRetryIdentifier:", 0x1E2564260);
    objc_msgSend(v7, "setUpdatedHeaders:", v5);
    +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      AMSLogableError(v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error fetching a new fraud report score: %{public}@.", (uint8_t *)&v17, 0x16u);

    }
    +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

@end
