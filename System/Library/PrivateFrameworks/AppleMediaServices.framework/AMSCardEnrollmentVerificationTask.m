@implementation AMSCardEnrollmentVerificationTask

+ (void)verifyPayment:(id)a3 isDefault:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (**v8)(id, uint64_t, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v5 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, uint64_t, id))a5;
  objc_msgSend(a1, "performPaymentVerificationForPayment:isDefault:", a3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v9, "resultWithError:", &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;

  if (v11)
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
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      AMSSetLogKeyIfNeeded();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v14;
      v20 = 2114;
      v21 = v16;
      v22 = 2114;
      v23 = v11;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed with error: %{public}@", buf, 0x20u);

    }
  }
  if (v8)
    v8[2](v8, objc_msgSend(v10, "BOOLValue"), v11);

}

+ (void)verifyPayment:(id)a3 isDefault:(BOOL)a4 bag:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  void (**v10)(id, uint64_t, id);
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v7 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, uint64_t, id))a6;
  objc_msgSend(a1, "performPaymentVerificationForPayment:isDefault:bag:", a3, v7, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v11, "resultWithError:", &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;

  if (v13)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_opt_class();
      v17 = v16;
      AMSSetLogKeyIfNeeded();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v16;
      v22 = 2114;
      v23 = v18;
      v24 = 2114;
      v25 = v13;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed with error: %{public}@", buf, 0x20u);

    }
  }
  if (v10)
    v10[2](v10, objc_msgSend(v12, "BOOLValue"), v13);

}

+ (id)performPaymentVerificationForPayment:(id)a3 isDefault:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  AMSPromise *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AMSPromise *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  AMSSetLogKeyIfNeeded();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(AMSPromise);
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
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = v5;
    v13 = v10;
    objc_msgSend(v11, "numberWithBool:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v10;
    v27 = 2114;
    v28 = v6;
    v29 = 2114;
    v30 = v14;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing silent-enrolllment payment verification with isDefault: %{public}@", (uint8_t *)&v25, 0x20u);

    v5 = v12;
  }

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend((id)objc_opt_class(), "performPaymentVerificationForPayment:isDefault:bag:", v5, v4, v17);
    v18 = (AMSPromise *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_opt_class();
      v25 = 138543618;
      v26 = v21;
      v27 = 2114;
      v28 = v6;
      v22 = v21;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load bag", (uint8_t *)&v25, 0x16u);

    }
    AMSError(203, CFSTR("Silent Enrollment Error"), CFSTR("Bag Load Failed"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPromise finishWithError:](v7, "finishWithError:", v23);
    v18 = v7;

  }
  return v18;
}

+ (id)performPaymentVerificationForPayment:(id)a3 isDefault:(BOOL)a4 bag:(id)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  AMSMutablePromise *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  AMSMutablePromise *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  void *v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  objc_class *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  id v71;
  id v72;
  AMSURLRequestEncoder *v73;
  void *v74;
  void *v75;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  _BYTE buf[24];
  void *v84;
  uint64_t *v85;
  uint64_t v86;

  v6 = a4;
  v86 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v7 = a5;
  AMSSetLogKeyIfNeeded();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(AMSMutablePromise);
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
    v12 = (void *)objc_opt_class();
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = v12;
    objc_msgSend(v13, "numberWithBool:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    v84 = v15;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing silent-enrolllment payment verification with isDefault: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v7, "BOOLForKey:", 0x1E254C5A0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueWithError:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_24;
  }
  objc_msgSend(v7, "BOOLForKey:", 0x1E254C5A0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueWithError:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  if ((v20 & 1) == 0)
  {
LABEL_24:
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v43)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v43, "OSLogObject");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v8;
      v46 = v45;
      _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed for feature not enabled", buf, 0x16u);

    }
    AMSError(5, CFSTR("Silent Enrollment Error"), CFSTR("Feature Not Enabled"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMutablePromise finishWithError:](v9, "finishWithError:", v22);
    v42 = v9;
    goto LABEL_51;
  }
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ams_activeiTunesAccount");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "ams_activeiCloudAccount");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "ams_isActiveAccountCombined");

      if ((v25 & 1) != 0)
      {
        v73 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", v7);
        -[AMSURLRequestEncoder setAccount:](v73, "setAccount:", v74);
        -[AMSURLRequestEncoder setRequestEncoding:](v73, "setRequestEncoding:", 1);
        objc_msgSend(v77, "token");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "paymentData");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v27, "OSLogObject");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = (void *)objc_opt_class();
          v30 = (void *)MEMORY[0x1E0CB37E8];
          v71 = v29;
          objc_msgSend(v30, "numberWithBool:", v6);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v8;
          *(_WORD *)&buf[22] = 2114;
          v84 = v31;
          _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Is card default? %{public}@", buf, 0x20u);

        }
        objc_msgSend(v7, "URLForKey:", 0x1E254C5E0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "valueWithError:", 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
          v34 = &unk_1E25B01B8;
        else
          v34 = &unk_1E25B01E0;
        objc_msgSend(v33, "ams_URLByAppendingQueryParameters:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v73, "requestWithMethod:URL:parameters:", 4, v35, v70);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = 0;
        objc_msgSend(v36, "resultWithError:", &v78);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v78;

        if (v72)
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
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v40 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v40;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v8;
            *(_WORD *)&buf[22] = 2114;
            v84 = v72;
            v41 = v40;
            _os_log_impl(&dword_18C849000, v39, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed to encode request with error: %{public}@", buf, 0x20u);

          }
          -[AMSMutablePromise finishWithError:](v9, "finishWithError:", v72);
          v42 = v9;
        }
        else
        {
          objc_msgSend(v37, "ams_addSilentEnrollmentHeadersForAccount:", v74);
          v79 = 0;
          v80 = &v79;
          v81 = 0x2050000000;
          v59 = (void *)getSSSilentEnrollmentContextClass_softClass_0;
          v82 = getSSSilentEnrollmentContextClass_softClass_0;
          if (!getSSSilentEnrollmentContextClass_softClass_0)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __getSSSilentEnrollmentContextClass_block_invoke_0;
            v84 = &unk_1E253DDB8;
            v85 = &v79;
            __getSSSilentEnrollmentContextClass_block_invoke_0((uint64_t)buf);
            v59 = (void *)v80[3];
          }
          v60 = objc_retainAutorelease(v59);
          _Block_object_dispose(&v79, 8);
          v61 = objc_alloc_init(v60);
          objc_msgSend(v74, "ams_DSID");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setAccountIdentifier:", v62);

          objc_msgSend(v37, "valueForHTTPHeaderField:", CFSTR("X-Apple-ADSID"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setHeaderADSID:", v63);

          objc_msgSend(v37, "valueForHTTPHeaderField:", CFSTR("X-Apple-GS-Token"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setHeaderGSToken:", v64);

          objc_msgSend(v37, "valueForHTTPHeaderField:", CFSTR("Guid"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setHeaderGuid:", v65);

          objc_msgSend(v37, "valueForHTTPHeaderField:", CFSTR("X-MMe-Client-Info"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setHeaderMMeClientInfo:", v66);

          objc_msgSend(v37, "valueForHTTPHeaderField:", CFSTR("X-Mme-Device-Id"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setHeaderMMeDeviceId:", v67);

          objc_msgSend(v61, "setParameters:", v70);
          objc_msgSend(v35, "absoluteString");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setURLString:", v68);

          objc_msgSend(a1, "_performSilentEnrollmentPaymentSessionWithContext:", v61);
          v42 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_49;
      }
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v55)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v55, "OSLogObject");
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v57;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v8;
        v58 = v57;
        _os_log_impl(&dword_18C849000, v56, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed for no combined account", buf, 0x16u);

      }
      AMSError(105, CFSTR("Silent Enrollment Error"), CFSTR("Split Account"), 0);
      v73 = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
      -[AMSMutablePromise finishWithError:](v9, "finishWithError:", v73);
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v51)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v51, "OSLogObject");
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v8;
        v54 = v53;
        _os_log_impl(&dword_18C849000, v52, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed for no active iCloud account", buf, 0x16u);

      }
      AMSError(103, CFSTR("Silent Enrollment Error"), CFSTR("No active iCloud account"), 0);
      v73 = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
      -[AMSMutablePromise finishWithError:](v9, "finishWithError:", v73);
    }
    v42 = v9;
LABEL_49:

    goto LABEL_51;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v47)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v47, "OSLogObject");
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    v49 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v49;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    v50 = v49;
    _os_log_impl(&dword_18C849000, v48, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed for no active iTunes account", buf, 0x16u);

  }
  AMSError(103, CFSTR("Silent Enrollment Error"), CFSTR("No active iTunes account"), 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMutablePromise finishWithError:](v9, "finishWithError:", v75);
  v42 = v9;

LABEL_51:
  return v42;
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
  v9[2] = __87__AMSCardEnrollmentVerificationTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke;
  v9[3] = &unk_1E253FB50;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = -[AMSMutableLazyPromise initWithBlock:](v5, "initWithBlock:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __87__AMSCardEnrollmentVerificationTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke(uint64_t a1, void *a2)
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
  v5 = (void *)getSSSilentEnrollmentVerificationClass_softClass;
  v16 = getSSSilentEnrollmentVerificationClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getSSSilentEnrollmentVerificationClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getSSSilentEnrollmentVerificationClass_block_invoke;
    v12[3] = &unk_1E253DDB8;
    v12[4] = &v13;
    __getSSSilentEnrollmentVerificationClass_block_invoke((uint64_t)v12);
    v5 = (void *)v14[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v13, 8);
  v8 = (void *)objc_msgSend([v7 alloc], "initWithSilentEnrollmentContext:", *(_QWORD *)(a1 + 32));
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __87__AMSCardEnrollmentVerificationTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke_2;
  v10[3] = &unk_1E253FD98;
  v10[4] = WeakRetained;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v8, "startWithCompletion:", v10);

}

void __87__AMSCardEnrollmentVerificationTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  _BYTE v28[24];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
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
      *(_DWORD *)v28 = 138543874;
      *(_QWORD *)&v28[4] = objc_opt_class();
      *(_WORD *)&v28[12] = 2114;
      *(_QWORD *)&v28[14] = v7;
      *(_WORD *)&v28[22] = 2114;
      v29 = v6;
      v10 = *(id *)&v28[4];
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed with error: %{public}@", v28, 0x20u);

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
        *(_DWORD *)v28 = 138543618;
        *(_QWORD *)&v28[4] = objc_opt_class();
        *(_WORD *)&v28[12] = 2114;
        *(_QWORD *)&v28[14] = v7;
        v14 = *(id *)&v28[4];
        _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Silent-enrollment payment verification returned response dictionary", v28, 0x16u);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("paymentId"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v16)
      {
        if (!v17)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v18, "OSLogObject", *(_OWORD *)v28, *(_QWORD *)&v28[16]);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)objc_opt_class();
          *(_DWORD *)v28 = 138543618;
          *(_QWORD *)&v28[4] = v20;
          *(_WORD *)&v28[12] = 2114;
          *(_QWORD *)&v28[14] = v7;
          v21 = v20;
          _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Silent-enrollment payment verification successfully parsed paymentId", v28, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
      }
      else
      {
        if (!v17)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v18, "OSLogObject", *(_QWORD *)v28, *(_OWORD *)&v28[8]);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = (void *)objc_opt_class();
          *(_DWORD *)v28 = 138543618;
          *(_QWORD *)&v28[4] = v25;
          *(_WORD *)&v28[12] = 2114;
          *(_QWORD *)&v28[14] = v7;
          v26 = v25;
          _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Silent-enrollment payment verification failed to parse paymentId", v28, 0x16u);

        }
        AMSError(301, CFSTR("Silent Enrollment Error"), CFSTR("No paymentId"), 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v27);

      }
    }
    else
    {
      if (!v11)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v28 = 138543618;
        *(_QWORD *)&v28[4] = objc_opt_class();
        *(_WORD *)&v28[12] = 2114;
        *(_QWORD *)&v28[14] = v7;
        v23 = *(id *)&v28[4];
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed with nil response", v28, 0x16u);

      }
      AMSError(301, CFSTR("Silent Enrollment Error"), CFSTR("No response dictionary"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v15);
    }

  }
}

@end
