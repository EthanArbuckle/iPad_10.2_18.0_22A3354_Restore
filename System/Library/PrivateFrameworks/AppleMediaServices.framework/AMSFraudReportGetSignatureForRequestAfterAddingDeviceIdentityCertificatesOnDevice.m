@implementation AMSFraudReportGetSignatureForRequestAfterAddingDeviceIdentityCertificatesOnDevice

id __AMSFraudReportGetSignatureForRequestAfterAddingDeviceIdentityCertificatesOnDevice_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  __SecKey *v10;
  CFDataRef Signature;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  AMSOptional *v19;
  void *v20;
  id v22;
  _BYTE error[12];
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v3, "BAACert");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "IntermediateRootCert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  LODWORD(v5) = AMSSetRequestBodyWithParametersAndCertificates(v4, v5, v6, v7, (uint64_t)&v22);
  v8 = v22;

  if (!(_DWORD)v5)
  {
    +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)error = 138543618;
      *(_QWORD *)&error[4] = v14;
      v24 = 2114;
      v25 = v8;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error signing the fraud report score payload. Unable to set request body: %{public}@.", error, 0x16u);
    }
    goto LABEL_22;
  }
  objc_msgSend(*(id *)(a1 + 32), "HTTPBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v13, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)error = 138543362;
      *(_QWORD *)&error[4] = v16;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error signing the fraud report score payload. No data to sign, request body is nil.", error, 0xCu);
    }
    goto LABEL_21;
  }
  v10 = (__SecKey *)objc_msgSend(v3, "BIKKeyRef");
  if (v10)
  {
    *(_QWORD *)error = 0;
    Signature = SecKeyCreateSignature(v10, (SecKeyAlgorithm)*MEMORY[0x1E0CD6DF8], (CFDataRef)v9, (CFErrorRef *)error);
    v12 = 0;
    if (!Signature)
    {
      v12 = objc_retainAutorelease(*(id *)error);

    }
  }
  else
  {
    v12 = 0;
    Signature = 0;
  }
  v13 = v12;
  if (!Signature)
  {
    +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v15, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)error = 138543618;
      *(_QWORD *)&error[4] = v18;
      v24 = 2114;
      v25 = v13;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error signing the fraud report score payload. Cannot create signature: %{public}@", error, 0x16u);
    }

LABEL_21:
LABEL_22:
    Signature = 0;
  }

  v19 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", Signature);
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
