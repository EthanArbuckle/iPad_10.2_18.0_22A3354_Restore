@implementation AMSFraudReportGetSignatureForRequestAfterAddingDeviceIdentityCertificatesOnVM

void __AMSFraudReportGetSignatureForRequestAfterAddingDeviceIdentityCertificatesOnVM_block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  CFDataRef v17;
  CFDataRef v18;
  void *v19;
  id v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  const __CFData *v36;
  const __CFData *v37;
  id v38;
  id v39;
  const __CFData *v40;
  const __CFData *v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if ((unint64_t)objc_msgSend(v8, "count") <= 1)
    {
      v11 = a1[4];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected at least 2 certificates (leaf BAA + intermediate), but only got %lu"), objc_msgSend(v8, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSError(12, CFSTR("Fewer host certificates than expected"), v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "finishWithError:", v13);

LABEL_15:
      goto LABEL_23;
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = SecCertificateCopyData((SecCertificateRef)v15);
    v18 = SecCertificateCopyData((SecCertificateRef)v16);
    v19 = (void *)objc_msgSend(a1[5], "mutableCopy");
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("is_vm"));
    v20 = a1[6];
    v44 = 0;
    v21 = AMSSetRequestBodyWithParametersAndCertificates(v20, v19, v17, v18, (uint64_t)&v44);
    v22 = v44;
    v23 = v22;
    if ((v21 & 1) != 0)
    {
      objc_msgSend(a1[6], "HTTPBody");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v38 = a1[7];
        v39 = a1[4];
        v40 = v17;
        v41 = v18;
        v42 = a1[6];
        v43 = a1[5];
        DeviceIdentityCreateHostSignatureWithCompletion();

        v25 = v38;
      }
      else
      {
        v37 = v17;
        v31 = v23;
        +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v32, "OSLogObject");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = a1[7];
          *(_DWORD *)buf = 138543362;
          v46 = v34;
          _os_log_impl(&dword_18C849000, v33, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error signing the fraud report score payload. No data to sign, request body is nil.", buf, 0xCu);
        }

        v35 = a1[4];
        +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "finishWithResult:", v25);
        v23 = v31;
        v17 = v37;
      }

    }
    else
    {
      v36 = v17;
      v26 = v22;
      +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v27, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = a1[7];
        *(_DWORD *)buf = 138543618;
        v46 = v29;
        v47 = 2114;
        v48 = v26;
        _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error signing the fraud report score payload. Unable to set request body: %{public}@.", buf, 0x16u);
      }

      v30 = a1[4];
      +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "finishWithResult:", v24);
      v23 = v26;
      v17 = v36;
    }

  }
  else
  {
    v14 = a1[4];
    if (!v9)
    {
      AMSError(12, CFSTR("Unable to retrieve host certificates"), CFSTR("DeviceIdentity didn't return host certificates nor error"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "finishWithError:", v12);
      goto LABEL_15;
    }
    objc_msgSend(a1[4], "finishWithError:", v9);
  }
LABEL_23:

}

void __AMSFraudReportGetSignatureForRequestAfterAddingDeviceIdentityCertificatesOnVM_block_invoke_20(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CFDataRef v20;
  void *v21;
  AMSOptional *v22;
  int v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  AMSOptional *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v7)
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
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v14 = *(_QWORD *)(a1 + 32);
    v34 = 138543618;
    v35 = v14;
    v36 = 2114;
    v37 = (uint64_t)v9;
    v13 = "AMSFraudReport [%{public}@] Error signing the fraud report score payload. Cannot create signature: %{public}@";
    goto LABEL_16;
  }
  if (!v8)
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
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v15 = *(_QWORD *)(a1 + 32);
    v34 = 138543618;
    v35 = v15;
    v36 = 2114;
    v37 = (uint64_t)v9;
    v13 = "AMSFraudReport [%{public}@] Error signing the fraud report score payload. Cannot get certificates: %{public}@";
    goto LABEL_16;
  }
  if ((unint64_t)objc_msgSend(v8, "count") > 1)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = SecCertificateCopyData((SecCertificateRef)v18);
    v20 = SecCertificateCopyData((SecCertificateRef)v19);
    if (objc_msgSend(*(id *)(a1 + 48), "isEqualToData:", v17)
      && (objc_msgSend(*(id *)(a1 + 56), "isEqualToData:", v20) & 1) != 0)
    {
      v21 = *(void **)(a1 + 40);
      v22 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v7);
    }
    else
    {
      v23 = *(unsigned __int8 *)(a1 + 80);
      +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (!v23)
      {
        if (!v24)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v25, "OSLogObject");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = *(_QWORD *)(a1 + 32);
          v34 = 138543362;
          v35 = v30;
          _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_DEFAULT, "AMSFraudReport [%{public}@] Certificate data when signing differs from initial certificate data, retrying signing once.", (uint8_t *)&v34, 0xCu);
        }

        v31 = AMSSetLogKey(*(void **)(a1 + 32));
        v32 = *(void **)(a1 + 40);
        AMSFraudReportGetSignatureForRequestAfterAddingDeviceIdentityCertificatesOnVM(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "finishWithPromise:", v33);

        goto LABEL_34;
      }
      if (!v24)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v25, "OSLogObject");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = *(_QWORD *)(a1 + 32);
        v34 = 138543362;
        v35 = v27;
        _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error signing the fraud report score payload. Certificate data when signing differs even after retry.", (uint8_t *)&v34, 0xCu);
      }

      v21 = *(void **)(a1 + 40);
      +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
      v22 = (AMSOptional *)objc_claimAutoreleasedReturnValue();
    }
    v28 = v22;
    objc_msgSend(v21, "finishWithResult:", v22);

LABEL_34:
    goto LABEL_18;
  }
  +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    goto LABEL_17;
  v12 = *(_QWORD *)(a1 + 32);
  v34 = 138543618;
  v35 = v12;
  v36 = 2048;
  v37 = objc_msgSend(v8, "count");
  v13 = "AMSFraudReport [%{public}@] Error signing the fraud report score payload. Too few certificates returned, expecte"
        "d at least 2, but received %lu";
LABEL_16:
  _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v34, 0x16u);
LABEL_17:

  v16 = *(void **)(a1 + 40);
  +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "finishWithResult:", v17);
LABEL_18:

}

@end
