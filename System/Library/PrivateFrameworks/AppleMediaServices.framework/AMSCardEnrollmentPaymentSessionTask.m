@implementation AMSCardEnrollmentPaymentSessionTask

+ (void)paymentSessionWithBag:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, id))a4;
  objc_msgSend(a1, "performPaymentSessionEnrollmentWithBag:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v7, "resultWithError:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;

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
      v13 = v12;
      AMSSetLogKeyIfNeeded();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v12;
      v18 = 2114;
      v19 = v14;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Payment session failed with error: %{public}@", buf, 0x20u);

    }
  }
  if (v6)
    v6[2](v6, v8, v9);

}

+ (id)performPaymentSessionEnrollmentWithBag:(id)a3
{
  return (id)objc_msgSend(a1, "_performPaymentSessionWithBag:isForParentalVerification:", a3, 0);
}

+ (id)performPaymentSessionForVerificationWithBag:(id)a3
{
  return (id)objc_msgSend(a1, "_performPaymentSessionWithBag:isForParentalVerification:", a3, 1);
}

+ (id)_performPaymentSessionWithBag:(id)a3 isForParentalVerification:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  AMSMutablePromise *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  AMSMutablePromise *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  objc_class *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  AMSURLRequestEncoder *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  _BYTE buf[24];
  void *v74;
  uint64_t *v75;
  uint64_t v76;

  v4 = a4;
  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  AMSSetLogKeyIfNeeded();
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(AMSMutablePromise);
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
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v67;
    v10 = *(id *)&buf[4];
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing silent-enrollment payment session task", buf, 0x16u);

  }
  objc_msgSend(v6, "BOOLForKey:", 0x1E254C5A0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueWithError:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "BOOLForKey:", 0x1E254C5A0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueWithError:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if ((v15 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ams_activeiTunesAccount");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v40)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v40, "OSLogObject");
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v42;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v67;
          v43 = v42;
          _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment session failed for no active iTunes account", buf, 0x16u);

        }
        AMSError(103, CFSTR("Silent Enrollment Error"), CFSTR("No active iTunes account"), 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSMutablePromise finishWithError:](v7, "finishWithError:", v19);
        v35 = v7;
        goto LABEL_45;
      }
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ams_activeiCloudAccount");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "ams_isActiveAccountCombined");

        if ((v21 & 1) != 0)
        {
          v66 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", v6);
          -[AMSURLRequestEncoder setAccount:](v66, "setAccount:", v19);
          objc_msgSend(v6, "URLForKey:", 0x1E254C5C0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "valueWithError:", 0);
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          +[AMSCardEnrollment paymentServicesMerchantURL](AMSCardEnrollment, "paymentServicesMerchantURL");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_paymentServiceURLStringForMerchantURL:", v62);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v65, "absoluteString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("%@?paymentServiceUrl=%@"), v24, v64);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          if (v4)
          {
            v25 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v65, "absoluteString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("%@?isPVK=true&paymentServiceUrl=%@"), v26, v64);
            v27 = objc_claimAutoreleasedReturnValue();

            v63 = (void *)v27;
          }
          -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v66, "requestWithMethod:URL:parameters:", 2, v65, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = 0;
          objc_msgSend(v28, "resultWithError:", &v68);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v68;

          if (v30)
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
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v33 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v33;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v67;
              *(_WORD *)&buf[22] = 2114;
              v74 = v30;
              v34 = v33;
              _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment session failed to encode request with error: %{public}@", buf, 0x20u);

            }
            -[AMSMutablePromise finishWithError:](v7, "finishWithError:", v30);
            v35 = v7;
          }
          else
          {
            objc_msgSend(v29, "ams_addSilentEnrollmentHeadersForAccount:", v19);
            v69 = 0;
            v70 = &v69;
            v71 = 0x2050000000;
            v52 = (void *)getSSSilentEnrollmentContextClass_softClass;
            v72 = getSSSilentEnrollmentContextClass_softClass;
            if (!getSSSilentEnrollmentContextClass_softClass)
            {
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __getSSSilentEnrollmentContextClass_block_invoke;
              v74 = &unk_1E253DDB8;
              v75 = &v69;
              __getSSSilentEnrollmentContextClass_block_invoke((uint64_t)buf);
              v52 = (void *)v70[3];
            }
            v53 = objc_retainAutorelease(v52);
            _Block_object_dispose(&v69, 8);
            v54 = objc_alloc_init(v53);
            objc_msgSend(v19, "ams_DSID");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setAccountIdentifier:", v55);

            objc_msgSend(v29, "valueForHTTPHeaderField:", CFSTR("X-Apple-ADSID"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setHeaderADSID:", v56);

            objc_msgSend(v29, "valueForHTTPHeaderField:", CFSTR("X-Apple-GS-Token"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setHeaderGSToken:", v57);

            objc_msgSend(v29, "valueForHTTPHeaderField:", CFSTR("Guid"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setHeaderGuid:", v58);

            objc_msgSend(v29, "valueForHTTPHeaderField:", CFSTR("X-MMe-Client-Info"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setHeaderMMeClientInfo:", v59);

            objc_msgSend(v29, "valueForHTTPHeaderField:", CFSTR("X-Mme-Device-Id"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setHeaderMMeDeviceId:", v60);

            objc_msgSend(v54, "setURLString:", v63);
            objc_msgSend(a1, "_performSilentEnrollmentPaymentSessionWithContext:", v54);
            v35 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_44;
        }
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v48)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v48, "OSLogObject");
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v50;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v67;
          v51 = v50;
          _os_log_impl(&dword_18C849000, v49, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment session failed for no combined account", buf, 0x16u);

        }
        AMSError(105, CFSTR("Silent Enrollment Error"), CFSTR("Split Account"), 0);
        v66 = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
        -[AMSMutablePromise finishWithError:](v7, "finishWithError:", v66);
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v44)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v44, "OSLogObject");
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v46;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v67;
          v47 = v46;
          _os_log_impl(&dword_18C849000, v45, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment session failed for no active iCloud account", buf, 0x16u);

        }
        AMSError(103, CFSTR("Silent Enrollment Error"), CFSTR("No active iCloud account"), 0);
        v66 = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
        -[AMSMutablePromise finishWithError:](v7, "finishWithError:", v66);
      }
      v35 = v7;
LABEL_44:

LABEL_45:
      goto LABEL_46;
    }
  }
  else
  {

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v36, "OSLogObject");
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    v38 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v38;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v67;
    v39 = v38;
    _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment session failed for feature not enabled", buf, 0x16u);

  }
  AMSError(5, CFSTR("Silent Enrollment Error"), CFSTR("Feature Not Enabled"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMutablePromise finishWithError:](v7, "finishWithError:", v17);
  v35 = v7;
LABEL_46:

  return v35;
}

+ (id)_paymentServiceURLStringForMerchantURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "ams_URLByDeletingTrailingSlash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rangeOfString:", v5);

  objc_msgSend(v3, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "substringFromIndex:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(":/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invertedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_performSilentEnrollmentPaymentSessionWithContext:(id)a3
{
  id v4;
  AMSMutableLazyPromise *v5;
  id v6;
  AMSMutableLazyPromise *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, a1);
  v5 = [AMSMutableLazyPromise alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__AMSCardEnrollmentPaymentSessionTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke;
  v9[3] = &unk_1E253FB50;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = -[AMSMutableLazyPromise initWithBlock:](v5, "initWithBlock:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __89__AMSCardEnrollmentPaymentSessionTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v5 = (void *)getSSSilentEnrollmentPaymentSessionClass_softClass;
  v16 = getSSSilentEnrollmentPaymentSessionClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getSSSilentEnrollmentPaymentSessionClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getSSSilentEnrollmentPaymentSessionClass_block_invoke;
    v12[3] = &unk_1E253DDB8;
    v12[4] = &v13;
    __getSSSilentEnrollmentPaymentSessionClass_block_invoke((uint64_t)v12);
    v5 = (void *)v14[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v13, 8);
  v8 = (void *)objc_msgSend([v7 alloc], "initWithSilentEnrollmentContext:", *(_QWORD *)(a1 + 32));
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __89__AMSCardEnrollmentPaymentSessionTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke_2;
  v10[3] = &unk_1E253FD98;
  v10[4] = WeakRetained;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v8, "startWithCompletion:", v10);

}

void __89__AMSCardEnrollmentPaymentSessionTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  objc_class *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE buf[24];
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  AMSSetLogKeyIfNeeded();
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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2114;
      v27 = v6;
      v10 = *(id *)&buf[4];
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment session failed with error: %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v5)
    {
      if (!v11)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = objc_opt_class();
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v7;
        v14 = *(id *)&buf[4];
        _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Silent-enrollment payment session returned response dictionary", buf, 0x16u);

      }
      v22 = 0;
      v23 = &v22;
      v24 = 0x2050000000;
      v15 = (void *)_MergedGlobals_90;
      v25 = _MergedGlobals_90;
      if (!_MergedGlobals_90)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getPKPaymentMerchantSessionClass_block_invoke;
        v27 = &unk_1E253DDB8;
        v28 = &v22;
        __getPKPaymentMerchantSessionClass_block_invoke((uint64_t)buf);
        v15 = (void *)v23[3];
      }
      v16 = objc_retainAutorelease(v15);
      _Block_object_dispose(&v22, 8);
      v17 = [v16 alloc];
      v18 = (void *)objc_msgSend(v17, "initWithDictionary:", v5, v22);
      objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v18);

    }
    else
    {
      if (!v11)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = objc_opt_class();
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v7;
        v20 = *(id *)&buf[4];
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment session failed with nil response", buf, 0x16u);

      }
      AMSError(301, CFSTR("Silent Enrollment Error"), CFSTR("No response dictionary"), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v21);

    }
  }

}

@end
