@implementation AMSURLSecurityPolicy

+ (AMSURLSecurityPolicy)defaultPolicy
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__AMSURLSecurityPolicy_defaultPolicy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_152 != -1)
    dispatch_once(&_MergedGlobals_152, block);
  return (AMSURLSecurityPolicy *)(id)qword_1ECEAD968;
}

void __37__AMSURLSecurityPolicy_defaultPolicy__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTrustMode:", 1);
  v1 = (void *)qword_1ECEAD968;
  qword_1ECEAD968 = v0;

}

- (AMSURLSecurityPolicy)initWithTrustMode:(int64_t)a3
{
  return -[AMSURLSecurityPolicy initWithTrustMode:pinnedCertificated:](self, "initWithTrustMode:pinnedCertificated:", a3, 0);
}

- (AMSURLSecurityPolicy)initWithTrustMode:(int64_t)a3 pinnedCertificated:(id)a4
{
  id v7;
  AMSURLSecurityPolicy *v8;
  AMSURLSecurityPolicy *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMSURLSecurityPolicy;
  v8 = -[AMSURLSecurityPolicy init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_trustMode = a3;
    objc_storeStrong((id *)&v8->_pinnedCertificates, a4);
  }

  return v9;
}

- (BOOL)evaluateTrust:(__SecTrust *)a3 forTask:(id)a4
{
  id v6;
  int64_t v7;
  BOOL v8;
  BOOL v9;

  v6 = a4;
  v7 = -[AMSURLSecurityPolicy trustMode](self, "trustMode");
  if (v7 == 2)
  {
    v8 = -[AMSURLSecurityPolicy _evaluatePinnedCertificatesWithTrust:forTask:](self, "_evaluatePinnedCertificatesWithTrust:forTask:", a3, v6);
  }
  else
  {
    if (v7 != 1)
    {
      v9 = 1;
      goto LABEL_7;
    }
    v8 = -[AMSURLSecurityPolicy _evaluateExtendedValidationWithTrust:forTask:](self, "_evaluateExtendedValidationWithTrust:forTask:", a3, v6);
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (BOOL)_evaluateExtendedValidationWithTrust:(__SecTrust *)a3 forTask:(id)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  CFErrorRef error;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  CFErrorRef v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AMSURLSecurityPolicy _shouldSkipValidation](self, "_shouldSkipValidation"))
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
        v9 = (void *)objc_opt_class();
        v10 = v9;
        objc_msgSend(v6, "properties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "logUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = (uint64_t)v9;
        v33 = 2114;
        v34 = v12;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ignoring extended validation (EV) for trust", buf, 0x16u);

      }
      goto LABEL_8;
    }
    error = 0;
    if (!SecTrustEvaluateWithError(a3, &error) || error)
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v18, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_opt_class();
        objc_msgSend(v6, "properties");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logUUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v32 = v20;
        v33 = 2114;
        v34 = v22;
        v35 = 2114;
        v36 = error;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid trust (EV) error: %{public}@", buf, 0x20u);

      }
      if (error)
        CFRelease(error);
    }
    else
    {
      v14 = (const __CFDictionary *)SecTrustCopyInfo();
      if (v14)
      {
        v15 = v14;
        CFDictionaryGetValue(v14, (const void *)*MEMORY[0x1E0CD7050]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v17 = objc_msgSend(v16, "BOOLValue");
          CFRelease(v15);

          if ((v17 & 1) != 0)
          {
LABEL_8:
            v13 = 1;
LABEL_29:

            return v13;
          }
        }
        else
        {
          CFRelease(v15);

        }
      }
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_opt_class();
        v26 = v25;
        objc_msgSend(v6, "properties");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logUUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = (uint64_t)v25;
        v33 = 2114;
        v34 = v28;
        _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Trust failed extended validation (EV)", buf, 0x16u);

      }
    }
    v13 = 0;
    goto LABEL_29;
  }
  return 0;
}

- (BOOL)_evaluatePinnedCertificatesWithTrust:(__SecTrust *)a3 forTask:(id)a4
{
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  SecCertificateRef v19;
  CFIndex CertificateCount;
  CFIndex v21;
  __SecCertificate *CertificateAtIndex;
  CFDataRef v23;
  void *v24;
  char v25;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  CFErrorRef error;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  CFErrorRef v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AMSURLSecurityPolicy _shouldSkipValidation](self, "_shouldSkipValidation"))
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "OSLogObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_opt_class();
        v10 = v9;
        objc_msgSend(v6, "properties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "logUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = (uint64_t)v9;
        v46 = 2114;
        v47 = v12;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ignoring certificate pinning validation", buf, 0x16u);

      }
LABEL_8:
      v13 = 1;
LABEL_36:

      return v13;
    }
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[AMSURLSecurityPolicy pinnedCertificates](self, "pinnedCertificates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(v14);
          v19 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((_QWORD *)&v40 + 1) + 8 * i));
          objc_msgSend(v7, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      }
      while (v16);
    }

    SecTrustSetAnchorCertificates(a3, (CFArrayRef)v7);
    error = 0;
    if (!SecTrustEvaluateWithError(a3, &error) || error)
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v33)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v33, "OSLogObject");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = objc_opt_class();
        objc_msgSend(v6, "properties");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logUUID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v35;
        v46 = 2114;
        v47 = v37;
        v48 = 2114;
        v49 = error;
        _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid trust (pinned) error: %{public}@", buf, 0x20u);

      }
      if (error)
        CFRelease(error);
    }
    else
    {
      CertificateCount = SecTrustGetCertificateCount(a3);
      if ((CertificateCount & 0x8000000000000000) == 0)
      {
        v21 = CertificateCount;
        do
        {
          CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, v21);
          v23 = SecCertificateCopyData(CertificateAtIndex);
          -[AMSURLSecurityPolicy pinnedCertificates](self, "pinnedCertificates");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "containsObject:", v23);

          if ((v25 & 1) != 0)
            goto LABEL_8;
        }
        while (v21-- >= 1);
      }
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
        v29 = (void *)objc_opt_class();
        v30 = v29;
        objc_msgSend(v6, "properties");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "logUUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = (uint64_t)v29;
        v46 = 2114;
        v47 = v32;
        _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Trust failed certificate pinning validation", buf, 0x16u);

      }
    }
    v13 = 0;
    goto LABEL_36;
  }
  return 0;
}

- (BOOL)_shouldSkipValidation
{
  int has_internal_content;

  has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
    LOBYTE(has_internal_content) = +[AMSDefaults QAMode](AMSDefaults, "QAMode")
                                || +[AMSDefaults ignoreServerTrustEvaluation](AMSDefaults, "ignoreServerTrustEvaluation")|| +[AMSDefaults ss_ignoreServerTrustEvaluation](AMSDefaults, "ss_ignoreServerTrustEvaluation");
  return has_internal_content;
}

- (int64_t)trustMode
{
  return self->_trustMode;
}

- (void)setTrustMode:(int64_t)a3
{
  self->_trustMode = a3;
}

- (NSSet)pinnedCertificates
{
  return self->_pinnedCertificates;
}

- (void)setPinnedCertificates:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedCertificates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedCertificates, 0);
}

@end
