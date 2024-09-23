@implementation AMSFraudReportGetFSRHeadersForFraudReportResponse

id __AMSFraudReportGetFSRHeadersForFraudReportResponse_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v24 = v6;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_INFO, "AMSFraudReport [%{public}@] Successfully fetched a new fraud report score.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rs=%ld;ns=%ld"),
    objc_msgSend(v3, "reportedScore"),
    objc_msgSend(v3, "newScore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  v21[0] = CFSTR("X-Apple-FSR-Data");
  v21[1] = CFSTR("X-Apple-FSR-AID");
  objc_msgSend(*(id *)(a1 + 40), "ams_fsrAnonymousID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v3, "finalizedElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
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
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "AMSFraudReport: [%{public}@] finalizedElement is unexpectedly nil.", buf, 0xCu);
    }

  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("X-Apple-FSR-Token"));
  objc_msgSend(v3, "nameSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v24 = v18;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "AMSFraudReport: [%{public}@] namespace is unexpectedly nil.", buf, 0xCu);
    }

  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("X-Apple-FSR-NameSpace"));
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
