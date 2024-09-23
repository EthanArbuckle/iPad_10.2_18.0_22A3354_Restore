@implementation AMSCardEnrollment

+ (NSURL)paymentServicesMerchantURL
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_paymentServicesMerchantURLPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v2, "resultWithError:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v5 = v4;
  if (!v3 || v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v8 = (void *)objc_opt_class();
      v9 = v8;
      AMSSetLogKeyIfNeeded();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v8;
      v15 = 2114;
      v16 = v10;
      v17 = 2114;
      v18 = v5;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Payment services call failed with error: %{public}@", buf, 0x20u);

    }
  }

  return (NSURL *)v3;
}

+ (BOOL)beginCardEnrollmentAttemptWithBag:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  AMSKeychainOptions *v7;
  __SecAccessControl *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((!+[AMSCardEnrollment shouldCheckForWalletBiometricsForBag:](AMSCardEnrollment, "shouldCheckForWalletBiometricsForBag:", v5)|| +[AMSDevice isWalletBiometricsEnabled](AMSDevice, "isWalletBiometricsEnabled"))&& (+[AMSCardEnrollment shouldUseApplePayClassicWithBag:](AMSCardEnrollment, "shouldUseApplePayClassicWithBag:", v5)|| +[AMSCardEnrollment shouldUseAutoEnrollmentWithBag:](AMSCardEnrollment, "shouldUseAutoEnrollmentWithBag:", v5)))
  {
    v7 = objc_alloc_init(AMSKeychainOptions);
    -[AMSKeychainOptions setPurpose:](v7, "setPurpose:", 0);
    -[AMSKeychainOptions setStyle:](v7, "setStyle:", +[AMSKeychainOptions preferredAttestationStyle](AMSKeychainOptions, "preferredAttestationStyle"));
    if (!AMSIsEntitledForDirectKeychainAccess())
    {
      if (+[AMSCardEnrollment shouldUseApplePayClassicWithBag:](AMSCardEnrollment, "shouldUseApplePayClassicWithBag:", v5))
      {
        v16 = +[AMSCardEnrollment shouldAttemptApplePayClassicWithBag:account:options:](AMSCardEnrollment, "shouldAttemptApplePayClassicWithBag:account:options:", v5, v6, v7);
      }
      else
      {
        if (!+[AMSCardEnrollment shouldUseAutoEnrollmentWithBag:](AMSCardEnrollment, "shouldUseAutoEnrollmentWithBag:", v5))
        {
          v15 = 0;
          goto LABEL_28;
        }
        v16 = +[AMSCardEnrollment shouldAttemptAutoEnrollmentWithBag:account:options:](AMSCardEnrollment, "shouldAttemptAutoEnrollmentWithBag:account:options:", v5, v6, v7);
      }
      v15 = v16;
LABEL_28:

      goto LABEL_29;
    }
    v19 = 0;
    v8 = +[AMSKeychain copyAccessControlRefWithAccount:options:error:](AMSKeychain, "copyAccessControlRefWithAccount:options:error:", v6, v7, &v19);
    v9 = v19;
    if (v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
        v12 = (void *)objc_opt_class();
        v18 = v12;
        AMSSetLogKeyIfNeeded();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v21 = v12;
        v22 = 2114;
        v23 = v13;
        v24 = 2114;
        v25 = v9;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ACL copy failed with error: %{public}@", buf, 0x20u);

      }
    }
    if (+[AMSCardEnrollment shouldUseApplePayClassicWithBag:](AMSCardEnrollment, "shouldUseApplePayClassicWithBag:", v5, v18))
    {
      v14 = +[AMSCardEnrollment shouldAttemptApplePayClassicWithBag:accessControlRef:](AMSCardEnrollment, "shouldAttemptApplePayClassicWithBag:accessControlRef:", v5, v8);
    }
    else
    {
      if (!+[AMSCardEnrollment shouldUseAutoEnrollmentWithBag:](AMSCardEnrollment, "shouldUseAutoEnrollmentWithBag:", v5))
      {
        v15 = 0;
        if (!v8)
          goto LABEL_21;
        goto LABEL_20;
      }
      v14 = +[AMSCardEnrollment shouldAttemptAutoEnrollmentWithBag:accessControlRef:](AMSCardEnrollment, "shouldAttemptAutoEnrollmentWithBag:accessControlRef:", v5, v8);
    }
    v15 = v14;
    if (!v8)
    {
LABEL_21:

      goto LABEL_28;
    }
LABEL_20:
    CFRelease(v8);
    goto LABEL_21;
  }
  v15 = 0;
LABEL_29:

  return v15;
}

+ (void)clearAutoEnrollmentIdentifier
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[AMSDefaults setDefaultPaymentPassIdentifier:](AMSDefaults, "setDefaultPaymentPassIdentifier:", 0);
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    AMSSetLogKeyIfNeeded();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Removing auto-enrollment identifier", (uint8_t *)&v7, 0x16u);

  }
}

+ (void)finishCardEnrollmentAttemptWithBag:(id)a3 buyParams:(id)a4 purchaseResult:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  const char *v17;
  void *v18;
  id v19;
  _BOOL8 v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = a3;
  AMSSetLogKeyIfNeeded();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[AMSCardEnrollment shouldUseAutoEnrollmentWithBag:](AMSCardEnrollment, "shouldUseAutoEnrollmentWithBag:", v9);

  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    *(_DWORD *)buf = 138543618;
    v44 = (id)objc_opt_class();
    v45 = 2114;
    v46 = v10;
    v16 = v44;
    v17 = "%{public}@: [%{public}@] Skipping DPAN update check for auto-enrollment requirement";
    goto LABEL_25;
  }
  objc_msgSend(v7, "parameterForKey:", CFSTR("applePayPaymentServiceURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  objc_msgSend(v7, "parameterForKey:", CFSTR("pkPayment"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v18;

    v20 = v19 != 0;
    if (v13 && v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v44 = (id)objc_opt_class();
        v45 = 2114;
        v46 = v10;
        v23 = v44;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished auto-enrollment, performing DPAN update check", buf, 0x16u);

      }
      objc_msgSend(v8, "responseDictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("need-apple-pay-auto-enroll-retry"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v25;
      else
        v14 = 0;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v14, "lowercaseString"),
            v32 = (void *)objc_claimAutoreleasedReturnValue(),
            v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("true")),
            v32,
            v33))
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v34)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v34, "OSLogObject");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v44 = v36;
          v45 = 2114;
          v46 = v10;
          v37 = v36;
          _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Clearing DPAN cache for auto-enrollment, server-driven instruction", buf, 0x16u);

        }
        +[AMSCardEnrollment clearAutoEnrollmentIdentifier](AMSCardEnrollment, "clearAutoEnrollmentIdentifier");
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v38)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v38, "OSLogObject");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v44 = v40;
          v45 = 2114;
          v46 = v10;
          v41 = v40;
          _os_log_impl(&dword_18C849000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating cached DPAN identifier for auto-enrollment", buf, 0x16u);

        }
        +[AMSCardEnrollment updateAutoEnrollmentIdentifier](AMSCardEnrollment, "updateAutoEnrollmentIdentifier");
      }
      goto LABEL_45;
    }
  }
  else
  {

    v20 = 0;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v26 = objc_claimAutoreleasedReturnValue();
  v14 = (id)v26;
  if (v13 && !v20)
  {
    if (!v26)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    *(_DWORD *)buf = 138543618;
    v44 = (id)objc_opt_class();
    v45 = 2114;
    v46 = v10;
    v16 = v44;
    v17 = "%{public}@: [%{public}@] Did not finish auto-enrollment, leaving DPAN cache unchanged";
LABEL_25:
    _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);

LABEL_26:
    goto LABEL_45;
  }
  if (!v26)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "OSLogObject");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = (void *)objc_opt_class();
    v29 = (void *)MEMORY[0x1E0CB37E8];
    v42 = v28;
    objc_msgSend(v29, "numberWithBool:", v13 != 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v44 = v28;
    v45 = 2114;
    v46 = v10;
    v47 = 2114;
    v48 = v30;
    v49 = 2114;
    v50 = v31;
    _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping DPAN update check for auto-enrollment with state: %{public}@ %{public}@", buf, 0x2Au);

  }
LABEL_45:

}

+ (BOOL)shouldAttemptApplePayClassicWithBag:(id)a3 account:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *log;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v42 = a4;
  v10 = a5;
  AMSSetLogKeyIfNeeded();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringForKey:", 0x1E254C520);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v12, "valueWithError:", &v45);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v45;
  objc_msgSend(v13, "uppercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v47 = v18;
      v48 = 2114;
      v49 = v11;
      v50 = 2114;
      v51 = CFSTR("countryCode");
      v19 = v18;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] No bag key found: %{public}@", buf, 0x20u);

    }
    v20 = 0;
  }
  else
  {
    objc_msgSend(v9, "arrayForKey:", 0x1E254C600);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(v21, "valueWithError:", &v44);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v44;

    v41 = v10;
    if (v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v17, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v47 = v23;
        v48 = 2114;
        v49 = v11;
        v50 = 2114;
        v51 = CFSTR("apple-pay-classic-networks");
        v24 = v23;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] No bag key found: %{public}@", buf, 0x20u);

      }
      v20 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_shouldAttemptApplePayClassicWithAccount:options:countryCode:paymentNetworks:", v42, v10, v15, v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      objc_msgSend(v25, "resultWithError:", &v43);
      v22 = objc_claimAutoreleasedReturnValue();
      v14 = v43;

      if (v14)
      {
        v40 = v22;
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v39 = v26;
        objc_msgSend(v26, "OSLogObject");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          log = v27;
          AMSLogKey();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x1E0CB3940];
          v30 = objc_opt_class();
          v37 = (void *)v28;
          if (v28)
          {
            AMSLogKey();
            v31 = objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v35 = objc_claimAutoreleasedReturnValue();
            v36 = (void *)v31;
            objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v30, v31, v35);
          }
          else
          {
            NSStringFromSelector(a2);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: %@ "), v30, v36);
          }
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          AMSLogableError(v14);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v32;
          v48 = 2114;
          v49 = v33;
          _os_log_impl(&dword_18C849000, log, OS_LOG_TYPE_ERROR, "%{public}@ error: %{public}@", buf, 0x16u);
          if (v37)
          {

            v32 = (void *)v35;
          }

          v27 = log;
        }

        v20 = 0;
        v22 = v40;
      }
      else
      {
        v20 = -[NSObject BOOLValue](v22, "BOOLValue");
      }
    }

    v10 = v41;
  }

  return v20;
}

+ (BOOL)shouldAttemptApplePayClassicWithBag:(id)a3 accessControlRef:(__SecAccessControl *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  char v20;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  AMSSetLogKeyIfNeeded();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForKey:", 0x1E254C520);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v8, "valueWithError:", &v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v23;
  objc_msgSend(v9, "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v25 = v14;
      v26 = 2114;
      v27 = v7;
      v28 = 2114;
      v29 = CFSTR("countryCode");
      v15 = v14;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] No bag key found: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v6, "arrayForKey:", 0x1E254C600);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v16, "valueWithError:", &v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v22;

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(a1, "shouldAttemptApplePayClassicWithCountryCode:paymentNetworks:accessControlRef:", v11, v13, a4);
      goto LABEL_13;
    }
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v13, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v25 = v18;
      v26 = 2114;
      v27 = v7;
      v28 = 2114;
      v29 = CFSTR("apple-pay-classic-networks");
      v19 = v18;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] No bag key found: %{public}@", buf, 0x20u);

    }
  }
  v20 = 0;
LABEL_13:

  return v20;
}

+ (BOOL)shouldAttemptAutoEnrollmentWithBag:(id)a3 account:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  char v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  AMSSetLogKeyIfNeeded();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[AMSDevice biometricState](AMSDevice, "biometricState") != 1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v25 = (id)objc_opt_class();
      v26 = 2114;
      v27 = v11;
      v17 = v25;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Skipping biometric/ACL check for no biometrics", buf, 0x16u);

    }
    v13 = 0;
    goto LABEL_14;
  }
  v23 = 0;
  v12 = +[AMSBiometrics isActionSupportedForType:account:options:error:](AMSBiometrics, "isActionSupportedForType:account:options:error:", 3, v9, v10, &v23);
  v13 = v23;
  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v25 = v20;
      v26 = 2114;
      v27 = v11;
      v28 = 2114;
      v29 = v13;
      v21 = v20;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Skipping biometric/ACL check for error: %{public}@", buf, 0x20u);

    }
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  v14 = objc_msgSend(a1, "isApplePayWalletRefreshedForBag:", v8);
LABEL_15:

  return v14;
}

+ (BOOL)shouldAttemptAutoEnrollmentWithBag:(id)a3 accessControlRef:(__SecAccessControl *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  id v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  AMSSetLogKeyIfNeeded();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[AMSDevice biometricState](AMSDevice, "biometricState") != 1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v16 = 138543618;
    v17 = (id)objc_opt_class();
    v18 = 2114;
    v19 = v7;
    v11 = v17;
    v12 = "%{public}@: [%{public}@] [auto-enrollment] Skipping biometric/ACL check for no biometrics";
LABEL_13:
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0x16u);

LABEL_19:
    v8 = 0;
    goto LABEL_20;
  }
  if (!a4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v16 = 138543618;
    v17 = (id)objc_opt_class();
    v18 = 2114;
    v19 = v7;
    v11 = v17;
    v12 = "%{public}@: [%{public}@] [auto-enrollment] Skipping biometric/ACL check for no ACL";
    goto LABEL_13;
  }
  if (!+[AMSBiometrics isActionSupported:withAccessControl:](AMSBiometrics, "isActionSupported:withAccessControl:", 3, a4))
  {
    +[AMSBiometrics ACLVersionForAccessControl:](AMSBiometrics, "ACLVersionForAccessControl:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543874;
      v17 = (id)objc_opt_class();
      v18 = 2114;
      v19 = v7;
      v20 = 2114;
      v21 = v9;
      v14 = v17;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Skipping biometric/ACL check for bad ACL version: %{public}@", (uint8_t *)&v16, 0x20u);

    }
    goto LABEL_19;
  }
  v8 = objc_msgSend(a1, "isApplePayWalletRefreshedForBag:", v6);
LABEL_20:

  return v8;
}

+ (BOOL)shouldUseApplePayClassicWithBag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "BOOLForKey:", 0x1E254C620);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  objc_msgSend(v5, "valueWithError:", &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v24;

  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      AMSLogableError(v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v11;
      v27 = 2114;
      v28 = v4;
      v29 = 2114;
      v30 = CFSTR("use-apple-pay-classic");
      v31 = 2114;
      v32 = v13;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] No bag key found: %{public}@, error: %{public}@", buf, 0x2Au);

    }
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v15;
    if (v14)
    {
      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v26 = v17;
        v27 = 2114;
        v28 = v4;
        v29 = 2114;
        v30 = CFSTR("use-apple-pay-classic");
        v18 = v17;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [apple-pay-classic] Bag key is not number: %{public}@", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v20, 0);

      goto LABEL_19;
    }
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v21 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v26 = v21;
      v27 = 2114;
      v28 = v4;
      v29 = 2114;
      v30 = CFSTR("use-apple-pay-classic");
      v22 = v21;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] [apple-pay-classic] Bag key is not number: %{public}@", buf, 0x20u);

    }
LABEL_18:

LABEL_19:
    v8 = 0;
    goto LABEL_20;
  }
  v8 = objc_msgSend(v6, "BOOLValue");
LABEL_20:

  return v8;
}

+ (BOOL)shouldCheckForWalletBiometricsForBag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "BOOLForKey:", 0x1E254C500);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  objc_msgSend(v5, "valueWithError:", &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  v8 = objc_msgSend(v6, "BOOLValue");

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7)
  {
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v21 = v12;
      v22 = 2114;
      v23 = v4;
      v24 = 2114;
      v25 = v7;
      v13 = v12;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bag key found for shouldCheckForWalletBiometrics, but the flag is default to enabled, if bag key does not exist , error: %{public}@", buf, 0x20u);

    }
    LOBYTE(v8) = 1;
  }
  else
  {
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class();
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = v14;
      objc_msgSend(v15, "numberWithBool:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v14;
      v22 = 2114;
      v23 = v4;
      v24 = 2114;
      v25 = v17;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Auto Enrollment shouldCheckForWalletBiometrics from the bag: %{public}@", buf, 0x20u);

    }
  }

  return v8;
}

+ (BOOL)shouldUseAutoEnrollmentWithBag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL8 v18;
  double v20;
  void *v21;
  void *v22;
  id v23;
  __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleForKey:", 0x1E254C4C0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v5, "valueWithError:", &v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v28;
  objc_msgSend(v6, "doubleValue");
  v9 = v8;

  if (v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v12 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v30 = v12;
    v31 = 2114;
    v32 = v4;
    v33 = 2114;
    v34 = CFSTR("auto-enrollment-percentage");
    v13 = v12;
LABEL_11:
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] No bag key found: %{public}@", buf, 0x20u);

LABEL_12:
    LOBYTE(v18) = 0;
    goto LABEL_13;
  }
  objc_msgSend(v3, "integerForKey:", 0x1E254C4E0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v14, "valueWithError:", &v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v27;
  v16 = objc_msgSend(v15, "integerValue");

  if (v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v17 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v30 = v17;
    v31 = 2114;
    v32 = v4;
    v33 = 2114;
    v34 = CFSTR("auto-enrollment-session-duration");
    v13 = v17;
    goto LABEL_11;
  }
  v20 = (double)v16;
  v18 = +[AMSDefaults shouldSampleWithPercentage:sessionDuration:identifier:](AMSDefaults, "shouldSampleWithPercentage:sessionDuration:identifier:", 0x1E2551760, v9, (double)v16);
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_opt_class();
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v23 = v21;
    objc_msgSend(v22, "numberWithDouble:", v9);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v30 = v21;
    v31 = 2114;
    v32 = v4;
    v33 = 2114;
    v34 = v24;
    v35 = 2114;
    v36 = v25;
    v37 = 2114;
    v38 = v26;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] [auto-enrollment] Sampling with bag values: %{public}@, %{public}@ and result: %{public}@", buf, 0x34u);

  }
  v7 = 0;
LABEL_13:

  return v18;
}

+ (BOOL)shouldUseExtendedEnrollmentWithBag:(id)a3
{
  id v3;
  int64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!os_variant_has_internal_content())
  {
LABEL_15:
    objc_msgSend(v3, "BOOLForKey:", 0x1E254C540);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v12, "valueWithError:", &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v22;
    v8 = objc_msgSend(v13, "BOOLValue");

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v6, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      v16 = (void *)MEMORY[0x1E0CB37E8];
      v17 = v15;
      objc_msgSend(v16, "numberWithBool:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v15;
      v25 = 2114;
      v26 = v18;
      v27 = 2114;
      v28 = v19;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [UpsellEnrollment] Retrieved extended-enrollment bag value: %{public}@, error: %{public}@", buf, 0x20u);

    }
    goto LABEL_20;
  }
  v4 = +[AMSDefaults cardEnrollmentManual](AMSDefaults, "cardEnrollmentManual");
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = (id)objc_opt_class();
      v11 = v24;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [ExtendedEnrollment] Honoring extended-enrollment bag value", buf, 0xCu);

    }
    goto LABEL_15;
  }
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "OSLogObject");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = (id)objc_opt_class();
        v7 = v24;
        _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [ExtendedEnrollment] Enabling extended-enrollment with default settings", buf, 0xCu);

      }
      LOBYTE(v8) = 1;
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = (id)objc_opt_class();
    v21 = v24;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [ExtendedEnrollment] Skipping extended-enrollment for default settings", buf, 0xCu);

  }
  LOBYTE(v8) = 0;
LABEL_20:

  return v8;
}

+ (BOOL)shouldUseUpsellEnrollmentWithBag:(id)a3
{
  id v3;
  int64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!os_variant_has_internal_content())
  {
LABEL_15:
    objc_msgSend(v3, "BOOLForKey:", 0x1E254C560);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v12, "valueWithError:", &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v22;
    v8 = objc_msgSend(v13, "BOOLValue");

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v6, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      v16 = (void *)MEMORY[0x1E0CB37E8];
      v17 = v15;
      objc_msgSend(v16, "numberWithBool:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v15;
      v25 = 2114;
      v26 = v18;
      v27 = 2114;
      v28 = v19;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [UpsellEnrollment] Retrieved upsell-enrollment bag value: %{public}@, error: %{public}@", buf, 0x20u);

    }
    goto LABEL_20;
  }
  v4 = +[AMSDefaults cardEnrollmentUpsell](AMSDefaults, "cardEnrollmentUpsell");
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = (id)objc_opt_class();
      v11 = v24;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [UpsellEnrollment] Honoring upsell-enrollment bag value", buf, 0xCu);

    }
    goto LABEL_15;
  }
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "OSLogObject");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = (id)objc_opt_class();
        v7 = v24;
        _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [UpsellEnrollment] Enabling upsell-enrollment with default settings", buf, 0xCu);

      }
      LOBYTE(v8) = 1;
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = (id)objc_opt_class();
    v21 = v24;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [UpsellEnrollment] Skipping upsell-enrollment for default settings", buf, 0xCu);

  }
  LOBYTE(v8) = 0;
LABEL_20:

  return v8;
}

+ (void)updateAutoEnrollmentIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_currentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "resultWithError:", &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;

  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v18 = v9;
      v19 = 2114;
      v20 = v3;
      v21 = 2114;
      v22 = v6;
      v10 = v9;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [auto-enrollment] Failed to obtain current DPAN identifier during update operation with error: %{public}@", buf, 0x20u);

    }
  }
  +[AMSDefaults setDefaultPaymentPassIdentifier:](AMSDefaults, "setDefaultPaymentPassIdentifier:", v5);
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_opt_class();
    v14 = v13;
    AMSHashIfNeeded(v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v13;
    v19 = 2114;
    v20 = v3;
    v21 = 2114;
    v22 = v15;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Updating extended enrollment identifier with value: %{public}@", buf, 0x20u);

  }
}

+ (BOOL)isAURUMWithBag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "doubleForKey:", 0x1E254C4C0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valuePromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "integerForKey:", 0x1E254C4E0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valuePromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  AMSSetLogKeyIfNeeded();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "binaryPromiseAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v9;
  objc_msgSend(v7, "binaryPromiseAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBinaryPromise promiseWithAll:](AMSBinaryPromise, "promiseWithAll:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v13 = objc_msgSend(v12, "resultWithError:", &v26);
  v14 = v26;

  if (v14)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v28 = v17;
      v29 = 2114;
      v30 = v8;
      v31 = 2114;
      v32 = v14;
      v18 = v17;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [auto-enrollment] Failed AURUM check with error: %{public}@", buf, 0x20u);

    }
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_opt_class();
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v23 = v21;
    objc_msgSend(v22, "numberWithBool:", v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v21;
    v29 = 2114;
    v30 = v8;
    v31 = 2114;
    v32 = v24;
    _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] AURUM check completed with result: %{public}@", buf, 0x20u);

  }
  return v13;
}

+ (BOOL)isApplePayWalletRefreshedForBag:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "stringForKey:", 0x1E254C520);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v4, "valueWithError:", &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  objc_msgSend(v5, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2114;
      v19 = v12;
      v20 = 2114;
      v21 = CFSTR("countryCode");
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] No bag key found: %{public}@", buf, 0x20u);

    }
    v13 = 0;
  }
  else
  {
    v13 = objc_msgSend(a1, "_shouldAttemptAutoEnrollmentWithCountryCode:", v7);
  }

  return v13;
}

+ (BOOL)shouldAttemptApplePayClassicWithCountryCode:(id)a3 paymentNetworks:(id)a4 accessControlRef:(__SecAccessControl *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE buf[24];
  void *v47;
  _QWORD v48[4];

  v48[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  AMSSetLogKeyIfNeeded();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2114;
    v47 = v8;
    LOWORD(v48[0]) = 2114;
    *(_QWORD *)((char *)v48 + 2) = v9;
    v13 = *(id *)&buf[4];
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Performing availability check for countryCode: %{public}@, paymentNetworks: %{public}@", buf, 0x2Au);

  }
  if (+[AMSDevice biometricState](AMSDevice, "biometricState") != 1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      v24 = v23;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Skipping biometric/ACL check for no biometrics", buf, 0x16u);

    }
    goto LABEL_27;
  }
  if (!a5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      v26 = v25;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Skipping biometric/ACL check for no ACL", buf, 0x16u);

    }
    goto LABEL_27;
  }
  if (!+[AMSBiometrics isActionSupported:withAccessControl:](AMSBiometrics, "isActionSupported:withAccessControl:", 4, a5))
  {
    +[AMSBiometrics ACLVersionForAccessControl:](AMSBiometrics, "ACLVersionForAccessControl:", a5);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v14, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      v47 = v16;
      v29 = v28;
      _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Skipping biometric/ACL check for bad ACL version: %{public}@", buf, 0x20u);

    }
LABEL_27:
    LOBYTE(v22) = 0;
    goto LABEL_28;
  }
  objc_msgSend(a1, "_shouldAttemptApplePayClassicWithCountryCode:paymentNetworks:", v8, v9);
  v14 = objc_claimAutoreleasedReturnValue();
  v41 = 0;
  -[NSObject resultWithError:](v14, "resultWithError:", &v41);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v41;
  v17 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      v47 = v16;
      v21 = v20;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [apple-pay-classic] biometric/ACL check failed with error: %{public}@", buf, 0x20u);

    }
    LOBYTE(v22) = 0;
  }
  else
  {
    if (v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v31, "OSLogObject");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v10;
        v39 = v33;
        _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Performing biometric/ACL check", buf, 0x16u);

      }
      v42 = 0;
      v43 = &v42;
      v44 = 0x2050000000;
      v34 = (void *)_MergedGlobals_89;
      v45 = _MergedGlobals_89;
      if (!_MergedGlobals_89)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getPKAuthenticatorClass_block_invoke;
        v47 = &unk_1E253DDB8;
        v48[0] = &v42;
        __getPKAuthenticatorClass_block_invoke((uint64_t)buf);
        v34 = (void *)v43[3];
      }
      v35 = objc_retainAutorelease(v34);
      _Block_object_dispose(&v42, 8);
      v22 = objc_msgSend(v35, "canPerformPSD2StyleBuyForAccessControlRef:", a5);
    }
    else
    {
      v22 = 0;
    }
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", v39);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_opt_class();
      v37 = (void *)MEMORY[0x1E0CB37E8];
      v40 = v36;
      objc_msgSend(v37, "numberWithBool:", v22);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      v47 = v38;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Biometric/ACL check did complete with result: %{public}@", buf, 0x20u);

    }
  }

LABEL_28:
  return v22;
}

+ (BOOL)shouldAttemptApplePayClassicWithCountryCode:(id)a3 paymentNetworks:(id)a4 account:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v32;
  id v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  AMSSetLogKeyIfNeeded();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "OSLogObject");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v37 = (id)objc_opt_class();
    v38 = 2114;
    v39 = v14;
    v40 = 2114;
    v41 = v10;
    v42 = 2114;
    v43 = v11;
    v17 = v37;
    _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Performing availability check for countryCode: %{public}@, paymentNetworks: %{public}@", buf, 0x2Au);

  }
  v34 = v13;
  if (+[AMSDevice biometricState](AMSDevice, "biometricState") == 1)
  {
    v33 = v10;
    objc_msgSend(a1, "_shouldAttemptApplePayClassicWithAccount:options:countryCode:paymentNetworks:", v12, v13, v10, v11);
    v18 = objc_claimAutoreleasedReturnValue();
    v35 = 0;
    -[NSObject resultWithError:](v18, "resultWithError:", &v35);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v35;
    v21 = objc_msgSend(v19, "BOOLValue");

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_opt_class();
      v32 = v11;
      v25 = v12;
      v26 = (void *)MEMORY[0x1E0CB37E8];
      v27 = v24;
      objc_msgSend(v26, "numberWithBool:", v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v24;
      v38 = 2114;
      v39 = v14;
      v40 = 2114;
      v41 = v28;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Biometric/ACL check did complete with result: %{public}@", buf, 0x20u);

      v12 = v25;
      v11 = v32;

    }
    v10 = v33;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v37 = v29;
      v38 = 2114;
      v39 = v14;
      v30 = v29;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Skipping biometric/ACL check for no biometrics", buf, 0x16u);

    }
    LOBYTE(v21) = 0;
  }

  return v21;
}

+ (id)_cardEligibilityStatusForCountryCode:(id)a3
{
  id v3;
  AMSMutableLazyPromise *v4;
  id v5;
  AMSMutableLazyPromise *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = [AMSMutableLazyPromise alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__AMSCardEnrollment__cardEligibilityStatusForCountryCode___block_invoke;
  v8[3] = &unk_1E253FBC0;
  v9 = v3;
  v5 = v3;
  v6 = -[AMSMutableLazyPromise initWithBlock:](v4, "initWithBlock:", v8);

  return v6;
}

void __58__AMSCardEnrollment__cardEligibilityStatusForCountryCode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v4 = (void *)getPKInAppPaymentServiceClass_softClass;
  v16 = getPKInAppPaymentServiceClass_softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getPKInAppPaymentServiceClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getPKInAppPaymentServiceClass_block_invoke;
    v12[3] = &unk_1E253DDB8;
    v12[4] = &v13;
    __getPKInAppPaymentServiceClass_block_invoke((uint64_t)v12);
    v4 = (void *)v14[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v13, 8);
  v7 = objc_alloc_init(v6);
  v8 = *(_QWORD *)(a1 + 32);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __58__AMSCardEnrollment__cardEligibilityStatusForCountryCode___block_invoke_2;
  v10[3] = &unk_1E253FB98;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v7, "cardsAvailableForAMPWithCountryCode:completion:", v8, v10);

}

void __58__AMSCardEnrollment__cardEligibilityStatusForCountryCode___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v3);

}

+ (id)_currentIdentifier
{
  void *v3;
  AMSMutableLazyPromise *v4;
  id v5;
  AMSMutableLazyPromise *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [AMSMutableLazyPromise alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__AMSCardEnrollment__currentIdentifier__block_invoke;
  v8[3] = &unk_1E253FC10;
  v9 = v3;
  v10 = a1;
  v5 = v3;
  v6 = -[AMSMutableLazyPromise initWithBlock:](v4, "initWithBlock:", v8);

  return v6;
}

void __39__AMSCardEnrollment__currentIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v4 = (void *)getPKPaymentServiceClass_softClass;
  v18 = getPKPaymentServiceClass_softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getPKPaymentServiceClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getPKPaymentServiceClass_block_invoke;
    v14[3] = &unk_1E253DDB8;
    v14[4] = &v15;
    __getPKPaymentServiceClass_block_invoke((uint64_t)v14);
    v4 = (void *)v16[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v15, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithDelegate:", 0);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __39__AMSCardEnrollment__currentIdentifier__block_invoke_2;
  v11[3] = &unk_1E253FBE8;
  v12 = v3;
  v10 = *(_OWORD *)(a1 + 32);
  v8 = (id)v10;
  v13 = v10;
  v9 = v3;
  objc_msgSend(v7, "defaultPaymentPassIngestionSpecificIdentifier:", v11);

}

uint64_t __39__AMSCardEnrollment__currentIdentifier__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    v8 = v6;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Empty DPAN identifier found", (uint8_t *)&v9, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", CFSTR("*EMPTY*"));
}

+ (id)_paymentServicesMerchantURLPromise
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  AMSDaemonConnection *v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v7[5], "securityServiceProxyWithDelegate:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__AMSCardEnrollment__paymentServicesMerchantURLPromise__block_invoke;
  v5[3] = &unk_1E253F6C8;
  v5[4] = &v6;
  objc_msgSend(v2, "thenWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v6, 8);
  return v3;
}

AMSMutablePromise *__55__AMSCardEnrollment__paymentServicesMerchantURLPromise__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  AMSMutablePromise *v5;
  uint64_t v6;
  _QWORD v8[4];
  AMSMutablePromise *v9;
  uint64_t v10;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__AMSCardEnrollment__paymentServicesMerchantURLPromise__block_invoke_2;
  v8[3] = &unk_1E253FC38;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  objc_msgSend(v3, "paymentServicesMerchantURLWithCompletion:", v8);

  return v5;
}

void __55__AMSCardEnrollment__paymentServicesMerchantURLPromise__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = *(void **)(a1 + 32);
  if (a3)
    objc_msgSend(v4, "finishWithError:");
  else
    objc_msgSend(v4, "finishWithResult:", a2);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

+ (id)_shouldAttemptApplePayClassicWithAccount:(id)a3 options:(id)a4 countryCode:(id)a5 paymentNetworks:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _BYTE *v36;
  id v37;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  _BYTE v40[20];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v29 = a4;
  v11 = a5;
  v12 = a6;
  AMSSetLogKeyIfNeeded();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_opt_class();
    NSStringFromSelector(a2);
    v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    v39 = v17;
    *(_WORD *)v40 = 2114;
    *(_QWORD *)&v40[2] = v18;
    *(_WORD *)&v40[10] = 2114;
    *(_QWORD *)&v40[12] = v19;
    _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ | countryCode = %{public}@ | paymentNetworks = %{public}@", buf, 0x34u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v39 = __Block_byref_object_copy__14;
  *(_QWORD *)v40 = __Block_byref_object_dispose__14;
  *(_QWORD *)&v40[8] = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "securityServiceProxyWithDelegate:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __98__AMSCardEnrollment__shouldAttemptApplePayClassicWithAccount_options_countryCode_paymentNetworks___block_invoke;
  v30[3] = &unk_1E253FC88;
  v37 = a1;
  v21 = v13;
  v31 = v21;
  v22 = v28;
  v32 = v22;
  v23 = v29;
  v33 = v23;
  v24 = v11;
  v34 = v24;
  v25 = v12;
  v35 = v25;
  v36 = buf;
  objc_msgSend(v20, "thenWithBlock:", v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(buf, 8);
  return v26;
}

AMSMutablePromise *__98__AMSCardEnrollment__shouldAttemptApplePayClassicWithAccount_options_countryCode_paymentNetworks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  AMSMutablePromise *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  AMSMutablePromise *v13;
  uint64_t v14;
  AMSMutablePromise *v15;
  AMSMutablePromise *v16;
  _QWORD v18[4];
  id v19;
  AMSMutablePromise *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Proxy object obtained, proxying to security service.", buf, 0x16u);
  }

  v8 = objc_alloc_init(AMSMutablePromise);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__AMSCardEnrollment__shouldAttemptApplePayClassicWithAccount_options_countryCode_paymentNetworks___block_invoke_48;
  v18[3] = &unk_1E253FC60;
  v22 = *(_QWORD *)(a1 + 80);
  v12 = *(_QWORD *)(a1 + 40);
  v19 = *(id *)(a1 + 32);
  v13 = v8;
  v14 = *(_QWORD *)(a1 + 72);
  v20 = v13;
  v21 = v14;
  objc_msgSend(v3, "shouldAttemptApplePayWithAccount:options:countryCode:paymentNetworks:completion:", v12, v9, v10, v11, v18);

  v15 = v20;
  v16 = v13;

  return v16;
}

void __98__AMSCardEnrollment__shouldAttemptApplePayClassicWithAccount_options_countryCode_paymentNetworks___block_invoke_48(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    v9 = *(_QWORD *)(a1 + 32);
    if ((_DWORD)a2)
      v10 = CFSTR("true");
    else
      v10 = CFSTR("false");
    AMSLogableError(v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 2114;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Proxy object returned. result = %{public}@ error = %{public}@", (uint8_t *)&v16, 0x2Au);

  }
  v12 = *(void **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishWithResult:", v13);

  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = 0;

}

+ (id)_shouldAttemptApplePayClassicWithCountryCode:(id)a3 paymentNetworks:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _BYTE *v26;
  id v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  _BYTE v30[20];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  AMSSetLogKeyIfNeeded();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_opt_class();
    NSStringFromSelector(a2);
    v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2114;
    v29 = v13;
    *(_WORD *)v30 = 2114;
    *(_QWORD *)&v30[2] = v14;
    *(_WORD *)&v30[10] = 2114;
    *(_QWORD *)&v30[12] = v15;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ | countryCode = %{public}@ | paymentNetworks = %{public}@", buf, 0x34u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__14;
  *(_QWORD *)v30 = __Block_byref_object_dispose__14;
  *(_QWORD *)&v30[8] = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "securityServiceProxyWithDelegate:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__AMSCardEnrollment__shouldAttemptApplePayClassicWithCountryCode_paymentNetworks___block_invoke;
  v22[3] = &unk_1E253FCB0;
  v27 = a1;
  v17 = v9;
  v23 = v17;
  v18 = v7;
  v24 = v18;
  v19 = v8;
  v25 = v19;
  v26 = buf;
  objc_msgSend(v16, "thenWithBlock:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(buf, 8);
  return v20;
}

AMSMutablePromise *__82__AMSCardEnrollment__shouldAttemptApplePayClassicWithCountryCode_paymentNetworks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  AMSMutablePromise *v8;
  uint64_t v9;
  uint64_t v10;
  AMSMutablePromise *v11;
  uint64_t v12;
  AMSMutablePromise *v13;
  AMSMutablePromise *v14;
  _QWORD v16[4];
  id v17;
  AMSMutablePromise *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v22 = v6;
    v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Proxy object obtained, proxying to security service.", buf, 0x16u);
  }

  v8 = objc_alloc_init(AMSMutablePromise);
  v10 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__AMSCardEnrollment__shouldAttemptApplePayClassicWithCountryCode_paymentNetworks___block_invoke_52;
  v16[3] = &unk_1E253FC60;
  v20 = *(_QWORD *)(a1 + 64);
  v17 = *(id *)(a1 + 32);
  v11 = v8;
  v12 = *(_QWORD *)(a1 + 56);
  v18 = v11;
  v19 = v12;
  objc_msgSend(v3, "shouldAttemptApplePayWithCountryCode:paymentNetworks:completion:", v10, v9, v16);

  v13 = v18;
  v14 = v11;

  return v14;
}

void __82__AMSCardEnrollment__shouldAttemptApplePayClassicWithCountryCode_paymentNetworks___block_invoke_52(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    v9 = *(_QWORD *)(a1 + 32);
    if ((_DWORD)a2)
      v10 = CFSTR("true");
    else
      v10 = CFSTR("false");
    AMSLogableError(v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 2114;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Proxy object returned. result = %{public}@ error = %{public}@", (uint8_t *)&v16, 0x2Au);

  }
  v12 = *(void **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishWithResult:", v13);

  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = 0;

}

+ (BOOL)_shouldAttemptAutoEnrollmentWithCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  BOOL v36;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDefaults defaultPaymentPassIdentifier](AMSDefaults, "defaultPaymentPassIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_currentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v7, "resultWithError:", &v48);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v48;

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v50 = v13;
      v51 = 2114;
      v52 = v5;
      v53 = 2114;
      v54 = v9;
      v14 = v13;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [auto-enrollment] Failed to obtain current DPAN identifier during auto-enrollment check with error: %{public}@", buf, 0x20u);

    }
LABEL_25:

    goto LABEL_26;
  }
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  -[NSObject OSLogObject](v11, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_opt_class();
    v42 = v16;
    AMSHashIfNeeded(v8);
    v45 = v8;
    v17 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v4);
    v20 = v4;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v50 = v16;
    v51 = 2114;
    v52 = v5;
    v53 = 2114;
    v54 = v18;
    v55 = 2114;
    v56 = v19;
    v57 = 2114;
    v58 = v21;
    _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Comparing current extended enrollment identifier: %{public}@, with cached identifier: %{public}@, countryCode: %{public}@", buf, 0x34u);

    v4 = v20;
    v6 = v17;
    v8 = v45;

  }
  if (v6 && objc_msgSend(v6, "isEqualToString:", v8))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject", v42);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v50 = v22;
      v51 = 2114;
      v52 = v5;
      v23 = v22;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Skipping auto-enrollment due to identical identifiers", buf, 0x16u);

    }
    goto LABEL_26;
  }
  v46 = v4;
  objc_msgSend(a1, "_cardEligibilityStatusForCountryCode:", v4, v42);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v24, "resultWithError:", &v47);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v47;
  v43 = objc_msgSend(v25, "integerValue");

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v26, "OSLogObject", v43);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = (void *)objc_opt_class();
    v29 = (void *)MEMORY[0x1E0CB37E8];
    v30 = v8;
    v31 = v6;
    v32 = v28;
    objc_msgSend(v29, "numberWithInteger:", v44);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v50 = v28;
    v51 = 2114;
    v52 = v5;
    v53 = 2114;
    v54 = v33;
    _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Auto-enrollment card eligibility status: %{public}@", buf, 0x20u);

    v6 = v31;
    v8 = v30;
  }

  v4 = v46;
  if (v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v34 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v50 = v34;
      v51 = 2114;
      v52 = v5;
      v53 = 2114;
      v54 = v9;
      v35 = v34;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [auto-enrollment] Failed to obtain card eligibility status during auto-enrollment with error: %{public}@", buf, 0x20u);

    }
    goto LABEL_25;
  }
  if (v44 == 1)
  {
    v36 = 1;
    goto LABEL_27;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v38 = (void *)objc_opt_class();
    v39 = (void *)MEMORY[0x1E0CB37E8];
    v40 = v38;
    objc_msgSend(v39, "numberWithInteger:", v44);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v50 = v38;
    v51 = 2114;
    v52 = v5;
    v53 = 2114;
    v54 = v41;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Skipping auto-enrollment due to card eligility status: %{public}@", buf, 0x20u);

    v4 = v46;
  }
LABEL_26:

  v36 = 0;
LABEL_27:

  return v36;
}

@end
