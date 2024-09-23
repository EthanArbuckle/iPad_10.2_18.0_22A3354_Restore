@implementation AMSFraudReportHandleCallbackFraudReportResponse

id __AMSFraudReportHandleCallbackFraudReportResponse_block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(a1[5], "ams_fsrCallbackUrl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      AMSFraudReportCallURL(a1[6], v9, 5, v5, a1[7]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __AMSFraudReportHandleCallbackFraudReportResponse_block_invoke_33;
      v22[3] = &unk_1E253FFE0;
      v23 = a1[4];
      objc_msgSend(v10, "resultWithCompletion:", v22);

      v11 = v23;
    }
    else
    {
      +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = a1[4];
        *(_DWORD *)buf = 138543362;
        v25 = v19;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "AMSFraudReport: [%{public}@] Failed to create callback URL, not calling.", buf, 0xCu);
      }

    }
    +[AMSURLAction proceedAction](AMSURLAction, "proceedAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = a1[4];
      AMSLogableError(v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v14;
      v26 = 2114;
      v27 = v15;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error fetching a new fraud report score: %{public}@.", buf, 0x16u);

    }
    +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

void __AMSFraudReportHandleCallbackFraudReportResponse_block_invoke_33(uint64_t a1, uint64_t a2, void *a3)
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
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_INFO, "AMSFraudReport [%{public}@] Successfully reported the new fraud score to the callback url.", (uint8_t *)&v12, 0xCu);
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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      AMSLogableError(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "AMSFraudReport [%{public}@] Failed reporting the new fraud score to the callback url: %{public}@.", (uint8_t *)&v12, 0x16u);

    }
  }

}

@end
