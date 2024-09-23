@implementation AMSFraudReportShouldCallInitURL

void __AMSFraudReportShouldCallInitURL_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v13[0] = v2;
    v12[0] = CFSTR("initURL");
    v12[1] = CFSTR("date");
    v4 = (void *)objc_opt_new();
    v13[1] = v4;
    v12[2] = CFSTR("requestInterval");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 48));
  }
  else
  {
    +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 56);
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "AMSFraudReport: [%{public}@] Unable to get init URL string, deleting persisted state for current key.", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));
  }

}

@end
