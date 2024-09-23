@implementation AMSCardEnrollmentEligibilityTask

- (AMSCardEnrollmentEligibilityTask)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSCardEnrollmentEligibilityTask;
  return -[AMSTask init](&v3, sel_init);
}

- (AMSCardEnrollmentEligibilityTask)initWithBag:(id)a3
{
  id v5;
  AMSCardEnrollmentEligibilityTask *v6;
  AMSCardEnrollmentEligibilityTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSCardEnrollmentEligibilityTask;
  v6 = -[AMSTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bag, a3);

  return v7;
}

- (AMSCardEnrollmentEligibilityTask)initWithCountryCode:(id)a3
{
  id v4;
  AMSCardEnrollmentEligibilityTask *v5;
  uint64_t v6;
  NSString *countryCode;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSCardEnrollmentEligibilityTask;
  v5 = -[AMSTask init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v6;

  }
  return v5;
}

- (AMSCardEnrollmentEligibilityTask)initWithBag:(id)a3 countryCode:(id)a4
{
  id v7;
  id v8;
  AMSCardEnrollmentEligibilityTask *v9;
  AMSCardEnrollmentEligibilityTask *v10;
  uint64_t v11;
  NSString *countryCode;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSCardEnrollmentEligibilityTask;
  v9 = -[AMSTask init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bag, a3);
    v11 = objc_msgSend(v8, "copy");
    countryCode = v10->_countryCode;
    v10->_countryCode = (NSString *)v11;

  }
  return v10;
}

- (void)canWriteBillingInfoWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, id);
  void *v9;
  void *v10;
  id v11;
  id v12;

  v8 = (void (**)(id, uint64_t, id))a5;
  -[AMSCardEnrollmentEligibilityTask performCanWriteBillingInfoQueryWithPassTypeIdentifier:serialNumber:](self, "performCanWriteBillingInfoQueryWithPassTypeIdentifier:serialNumber:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v9, "resultWithError:", &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  if (v8)
    v8[2](v8, objc_msgSend(v10, "BOOLValue"), v11);

}

- (id)performCanWriteBillingInfoQueryWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6;
  AMSMutablePromise *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  unint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  AMSURLRequestEncoder *v44;
  void *v45;
  AMSURLRequestEncoder *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  const __CFString **v51;
  const __CFString **v52;
  void *v53;
  NSObject *v54;
  void *v55;
  id v56;
  AMSMutablePromise *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  NSObject *v63;
  void *v64;
  id v65;
  __CFString *v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  _QWORD v109[5];
  id v110;
  _QWORD v111[4];
  id v112;
  AMSCardEnrollmentEligibilityTask *v113;
  id v114;
  const __CFString *v115;
  const __CFString *v116;
  const __CFString *v117;
  const __CFString *v118;
  uint8_t buf[4];
  void *v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  void *v124;
  __int16 v125;
  void *v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v107 = a4;
  v7 = objc_alloc_init(AMSMutablePromise);
  AMSSetLogKeyIfNeeded();
  v108 = (void *)objc_claimAutoreleasedReturnValue();
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
    AMSHashIfNeeded(v6);
    v12 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v107);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v120 = v10;
    v121 = 2114;
    v122 = v108;
    v123 = 2114;
    v124 = v13;
    v125 = 2114;
    v126 = v14;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing can write billing info with passTypeIdentifier: %{public}@, serialNumber: %{public}@", buf, 0x2Au);

    v6 = v12;
  }

  -[AMSCardEnrollmentEligibilityTask bag](self, "bag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend((id)objc_opt_class(), "bagSubProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSCardEnrollmentEligibilityTask setBag:](self, "setBag:", v18);

    -[AMSCardEnrollmentEligibilityTask bag](self, "bag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v20, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v120 = v22;
        v121 = 2114;
        v122 = v108;
        v23 = v22;
        _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load bag", buf, 0x16u);

      }
    }

  }
  -[AMSCardEnrollmentEligibilityTask bag](self, "bag");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "BOOLForKey:", 0x1E254C5A0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "valueWithError:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AMSCardEnrollmentEligibilityTask bag](self, "bag");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "BOOLForKey:", 0x1E254C5A0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "valueWithError:", 0);
    v106 = v6;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    v6 = v106;
    if ((v30 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "ams_activeiTunesAccount");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v58)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v58, "OSLogObject");
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v60 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v120 = v60;
          v121 = 2114;
          v122 = v108;
          v61 = v60;
          _os_log_impl(&dword_18C849000, v59, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Can write billing info failed for no active iTunes account", buf, 0x16u);

        }
        AMSError(103, CFSTR("Silent Enrollment Error"), CFSTR("No active iTunes account"), 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSMutablePromise finishWithError:](v7, "finishWithError:", v34);
        v57 = v7;
        goto LABEL_64;
      }
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "ams_activeiCloudAccount");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "ams_isActiveAccountCombined");

        if ((v36 & 1) != 0)
        {
          v37 = -[AMSCardEnrollmentEligibilityTask _cardTypeForPassTypeIdentifier:serialNumber:](self, "_cardTypeForPassTypeIdentifier:serialNumber:", v106, v107);
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
            v41 = (void *)MEMORY[0x1E0CB37E8];
            v102 = v34;
            v42 = v40;
            objc_msgSend(v41, "numberWithUnsignedInteger:", v37);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v120 = v40;
            v121 = 2114;
            v122 = v108;
            v123 = 2114;
            v124 = v43;
            _os_log_impl(&dword_18C849000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found card type: %{public}@", buf, 0x20u);

            v34 = v102;
          }

          v44 = [AMSURLRequestEncoder alloc];
          -[AMSCardEnrollmentEligibilityTask bag](self, "bag");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = -[AMSURLRequestEncoder initWithBag:](v44, "initWithBag:", v45);

          -[AMSURLRequestEncoder setAccount:](v46, "setAccount:", v32);
          -[AMSURLRequestEncoder setDialogOptions:](v46, "setDialogOptions:", 1);
          -[AMSCardEnrollmentEligibilityTask bag](self, "bag");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "URLForKey:", 0x1E254C580);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "valueWithError:", 0);
          v49 = objc_claimAutoreleasedReturnValue();

          if (v37 == 4)
          {
            v115 = CFSTR("cardType");
            v116 = CFSTR("APPLE_PAY_AQUAMAN");
            v50 = (void *)MEMORY[0x1E0C99D80];
            v51 = &v116;
            v52 = &v115;
          }
          else
          {
            if (v37 != 3)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = (uint64_t)v49;
              if (!v72)
              {
                +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v72, "OSLogObject");
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                v97 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543618;
                v120 = v97;
                v121 = 2114;
                v122 = v108;
                v98 = v97;
                _os_log_impl(&dword_18C849000, v49, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Can write billing info skipping URL decoration", buf, 0x16u);

              }
              goto LABEL_49;
            }
            v117 = CFSTR("cardType");
            v118 = CFSTR("APPLE_PAY_BROADWAY");
            v50 = (void *)MEMORY[0x1E0C99D80];
            v51 = &v118;
            v52 = &v117;
          }
          objc_msgSend(v50, "dictionaryWithObjects:forKeys:count:", v51, v52, 1);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject ams_URLByAppendingQueryParameters:](v49, "ams_URLByAppendingQueryParameters:", v72);
          v73 = objc_claimAutoreleasedReturnValue();
LABEL_49:

          v105 = (void *)v73;
          -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v46, "requestWithMethod:URL:parameters:", 2, v73, 0);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = 0;
          objc_msgSend(v74, "resultWithError:", &v114);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = v114;

          v104 = v76;
          if (v76)
          {
            v77 = v75;
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v78)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v78, "OSLogObject");
            v79 = objc_claimAutoreleasedReturnValue();
            v80 = v104;
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            {
              v81 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v120 = v81;
              v121 = 2114;
              v122 = v108;
              v123 = 2114;
              v124 = v104;
              v82 = v81;
              _os_log_impl(&dword_18C849000, v79, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Can write billing info failed to encode request with error: %{public}@", buf, 0x20u);

            }
            -[AMSMutablePromise finishWithError:](v7, "finishWithError:", v104);
            v57 = v7;
            v75 = v77;
            v83 = v105;
            v6 = v106;
          }
          else
          {
            objc_msgSend(v75, "ams_addSilentEnrollmentHeadersForAccount:", v34);
            +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "valueForHTTPHeaderField:", CFSTR("X-Apple-Store-Front"));
            v6 = v106;
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v101)
            {
              v100 = v75;
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v85)
              {
                +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v103 = v34;
              objc_msgSend(v85, "OSLogObject", v84);
              v86 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
              {
                v87 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543618;
                v120 = v87;
                v121 = 2114;
                v122 = v108;
                v88 = v87;
                _os_log_impl(&dword_18C849000, v86, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Can write billing info will attach store front header manually", buf, 0x16u);

              }
              +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "accountMediaType");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              -[AMSCardEnrollmentEligibilityTask bag](self, "bag");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = v100;
              +[AMSURLRequestDecoration addStoreFrontHeaderToRequest:forAccount:mediaType:bag:](AMSURLRequestDecoration, "addStoreFrontHeaderToRequest:forAccount:mediaType:bag:", v100, v32, v90, v91);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              v111[0] = MEMORY[0x1E0C809B0];
              v111[1] = 3221225472;
              v111[2] = __103__AMSCardEnrollmentEligibilityTask_performCanWriteBillingInfoQueryWithPassTypeIdentifier_serialNumber___block_invoke;
              v111[3] = &unk_1E253FD08;
              v112 = v108;
              v113 = self;
              objc_msgSend(v92, "catchWithBlock:", v111);
              v93 = objc_claimAutoreleasedReturnValue();

              v84 = (void *)v93;
              v6 = v106;
              v34 = v103;
            }
            v83 = v105;
            objc_msgSend(v84, "promiseAdapter");
            v94 = v84;
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v109[0] = MEMORY[0x1E0C809B0];
            v109[1] = 3221225472;
            v109[2] = __103__AMSCardEnrollmentEligibilityTask_performCanWriteBillingInfoQueryWithPassTypeIdentifier_serialNumber___block_invoke_41;
            v109[3] = &unk_1E253D688;
            v109[4] = self;
            v110 = v75;
            objc_msgSend(v95, "thenWithBlock:", v109);
            v57 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();

            v80 = 0;
          }

          goto LABEL_63;
        }
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v68)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v68, "OSLogObject");
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          v70 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v120 = v70;
          v121 = 2114;
          v122 = v108;
          v71 = v70;
          _os_log_impl(&dword_18C849000, v69, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Can write billing info failed for no combined account", buf, 0x16u);

        }
        v66 = CFSTR("Split Account");
        v67 = 105;
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v62)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v62, "OSLogObject");
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v64 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v120 = v64;
          v121 = 2114;
          v122 = v108;
          v65 = v64;
          _os_log_impl(&dword_18C849000, v63, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Can write billing info failed for no active iCloud account", buf, 0x16u);

        }
        v66 = CFSTR("No active iCloud account");
        v67 = 103;
      }
      AMSError(v67, CFSTR("Silent Enrollment Error"), v66, 0);
      v46 = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
      -[AMSMutablePromise finishWithError:](v7, "finishWithError:", v46);
      v57 = v7;
LABEL_63:

LABEL_64:
      goto LABEL_65;
    }
  }
  else
  {

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v53)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v53, "OSLogObject");
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
  {
    v55 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v120 = v55;
    v121 = 2114;
    v122 = v108;
    v56 = v55;
    _os_log_impl(&dword_18C849000, v54, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Can write billing info failed for feature not enabled", buf, 0x16u);

  }
  AMSError(5, CFSTR("Silent Enrollment Error"), CFSTR("Feature Not Enabled"), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMutablePromise finishWithError:](v7, "finishWithError:", v32);
  v57 = v7;
LABEL_65:

  return v57;
}

id __103__AMSCardEnrollmentEligibilityTask_performCanWriteBillingInfoQueryWithPassTypeIdentifier_serialNumber___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_opt_class();
    if (v7)
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@] "), v8, *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: "), v8, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to add storefront header to request. Continuing without header. error = %{public}@", buf, 0x16u);

  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __103__AMSCardEnrollmentEligibilityTask_performCanWriteBillingInfoQueryWithPassTypeIdentifier_serialNumber___block_invoke_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performSilentEnrollmentCheckWithRequest:", *(_QWORD *)(a1 + 40));
}

- (unint64_t)_cardTypeForPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  BOOL v10;
  int v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  unint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  _BYTE *v47;
  _BYTE buf[24];
  void *v49;
  _QWORD v50[2];
  _BYTE v51[24];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  AMSSetLogKeyIfNeeded();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v51 = 0;
  *(_QWORD *)&v51[8] = v51;
  *(_QWORD *)&v51[16] = 0x2050000000;
  v8 = (void *)_MergedGlobals_3_2;
  v52 = _MergedGlobals_3_2;
  if (!_MergedGlobals_3_2)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getPKPassLibraryClass_block_invoke;
    v49 = &unk_1E253DDB8;
    v50[0] = v51;
    __getPKPassLibraryClass_block_invoke((uint64_t)buf);
    v8 = *(void **)(*(_QWORD *)&v51[8] + 24);
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(v51, 8);
  v43 = objc_alloc_init(v9);
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  v11 = !v10;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v11)
  {
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = (void *)objc_opt_class();
      v26 = v25;
      AMSHashIfNeeded(v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v44;
      *(_WORD *)&buf[22] = 2114;
      v49 = v27;
      LOWORD(v50[0]) = 2114;
      *(_QWORD *)((char *)v50 + 2) = v28;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Indeterminate passTypeIdentifier: %{public}@, serialNumer: %{public}@", buf, 0x2Au);

    }
    goto LABEL_34;
  }
  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_opt_class();
    v16 = v15;
    AMSHashIfNeeded(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v44;
    *(_WORD *)&buf[22] = 2114;
    v49 = v17;
    LOWORD(v50[0]) = 2114;
    *(_QWORD *)((char *)v50 + 2) = v18;
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to determine card type for passTypeIdentifier: %{public}@, serialNumber: %{public}@", buf, 0x2Au);

  }
  objc_msgSend(v43, "passWithPassTypeIdentifier:serialNumber:", v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    *(_QWORD *)v51 = 0;
    *(_QWORD *)&v51[8] = v51;
    *(_QWORD *)&v51[16] = 0x2050000000;
    v19 = (void *)qword_1ECEACCB0;
    v52 = qword_1ECEACCB0;
    if (!qword_1ECEACCB0)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getPKPaymentPassClass_block_invoke;
      v49 = &unk_1E253DDB8;
      v50[0] = v51;
      __getPKPaymentPassClass_block_invoke((uint64_t)buf);
      v19 = *(void **)(*(_QWORD *)&v51[8] + 24);
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(v51, 8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v13;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v49) = 0;
      -[NSObject paymentApplications](v21, "paymentApplications");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __80__AMSCardEnrollmentEligibilityTask__cardTypeForPassTypeIdentifier_serialNumber___block_invoke;
      v45[3] = &unk_1E253FD30;
      v45[4] = self;
      v23 = v44;
      v46 = v23;
      v47 = buf;
      objc_msgSend(v22, "enumerateObjectsUsingBlock:", v45);

      if ((-[NSObject hasAssociatedPeerPaymentAccount](v21, "hasAssociatedPeerPaymentAccount") & 1) != 0)
      {
        v24 = 2;
      }
      else
      {
        -[NSObject associatedAccountServiceAccountIdentifier](v21, "associatedAccountServiceAccountIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          v24 = 3;
        }
        else if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        {
          v24 = 4;
        }
        else
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v39)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v39, "OSLogObject");
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v41 = (void *)objc_opt_class();
            *(_DWORD *)v51 = 138543618;
            *(_QWORD *)&v51[4] = v41;
            *(_WORD *)&v51[12] = 2114;
            *(_QWORD *)&v51[14] = v23;
            v42 = v41;
            _os_log_impl(&dword_18C849000, v40, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Card is unknown type of PKPaymentPass", v51, 0x16u);

          }
          v24 = 0;
        }
      }

      _Block_object_dispose(buf, 8);
      v13 = v21;
      goto LABEL_35;
    }
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v21, "OSLogObject");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = (void *)objc_opt_class();
      v34 = v33;
      v35 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v44;
      *(_WORD *)&buf[22] = 2114;
      v49 = v35;
      v36 = v35;
      _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Pass is not a PKPaymentPass: %{public}@", buf, 0x20u);

    }
LABEL_34:
    v24 = 0;
    goto LABEL_35;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  -[NSObject OSLogObject](v21, "OSLogObject");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v44;
    v31 = v30;
    _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No card found", buf, 0x16u);

  }
  v13 = 0;
  v24 = 1;
LABEL_35:

  return v24;
}

void __80__AMSCardEnrollmentEligibilityTask__cardTypeForPassTypeIdentifier_serialNumber___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "paymentNetworkIdentifier") == 123)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      v9 = v7;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found barcode network identifier", (uint8_t *)&v10, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (id)_performSilentEnrollmentCheckWithRequest:(id)a3
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
  objc_initWeak(&location, self);
  v5 = [AMSMutableLazyPromise alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__AMSCardEnrollmentEligibilityTask__performSilentEnrollmentCheckWithRequest___block_invoke;
  v9[3] = &unk_1E253FB50;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = -[AMSMutableLazyPromise initWithBlock:](v5, "initWithBlock:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __77__AMSCardEnrollmentEligibilityTask__performSilentEnrollmentCheckWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  AMSURLResponseDecoder *v9;
  AMSAppleCardSilentEnrollmentProtocolHandler *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __77__AMSCardEnrollmentEligibilityTask__performSilentEnrollmentCheckWithRequest___block_invoke_2;
  v15 = &unk_1E253DB58;
  v16 = WeakRetained;
  v17 = v3;
  v5 = v3;
  v6 = _Block_copy(&v12);
  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v7, "addIndexesInRange:", 200, 100, v12, v13, v14, v15, v16);
  objc_msgSend(v7, "addIndexesInRange:", 400, 100);
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(AMSURLResponseDecoder);
  -[AMSURLResponseDecoder setAllowedStatusCodes:](v9, "setAllowedStatusCodes:", v7);
  objc_msgSend(v8, "setResponseDecoder:", v9);
  v10 = objc_alloc_init(AMSAppleCardSilentEnrollmentProtocolHandler);
  objc_msgSend(v8, "setDelegate:", v10);
  objc_msgSend(v8, "setProtocolHandler:", v10);
  objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", *(_QWORD *)(a1 + 32), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resume");

}

void __77__AMSCardEnrollmentEligibilityTask__performSilentEnrollmentCheckWithRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  _BYTE v23[24];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
      *(_DWORD *)v23 = 138543874;
      *(_QWORD *)&v23[4] = objc_opt_class();
      *(_WORD *)&v23[12] = 2114;
      *(_QWORD *)&v23[14] = v7;
      *(_WORD *)&v23[22] = 2114;
      v24 = v6;
      v10 = *(id *)&v23[4];
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Can write billing info failed with network error: %{public}@", v23, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(v5, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("eligible"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v23 = 138543874;
        *(_QWORD *)&v23[4] = objc_opt_class();
        *(_WORD *)&v23[12] = 2114;
        *(_QWORD *)&v23[14] = v7;
        *(_WORD *)&v23[22] = 2114;
        v24 = v12;
        v15 = *(id *)&v23[4];
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Can write billing info completed with response: %{public}@", v23, 0x20u);

      }
      v16 = *(void **)(a1 + 40);
      v17 = (void *)MEMORY[0x1E0CB37E8];
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = objc_msgSend(v12, "BOOLValue");
      else
        v18 = 0;
      objc_msgSend(v17, "numberWithInt:", v18, *(_OWORD *)v23, *(_QWORD *)&v23[16], v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "finishWithResult:", v22);

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
        *(_DWORD *)v23 = 138543618;
        *(_QWORD *)&v23[4] = objc_opt_class();
        *(_WORD *)&v23[12] = 2114;
        *(_QWORD *)&v23[14] = v7;
        v21 = *(id *)&v23[4];
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Can write billing info failed to deserialize response", v23, 0x16u);

      }
      AMSError(301, CFSTR("Silent Enrollment Error"), CFSTR("Failed to deserialize JSON response"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v12);
    }

  }
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
