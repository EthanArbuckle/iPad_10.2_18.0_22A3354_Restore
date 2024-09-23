@implementation AMSAuthenticateTask

- (AMSAuthenticateTask)init
{
  return -[AMSAuthenticateTask initWithAccount:options:](self, "initWithAccount:options:", 0, 0);
}

- (AMSAuthenticateTask)initWithAccount:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AMSAuthenticateTask *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_createFallbackBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSAuthenticateTask initWithAccount:options:bag:](self, "initWithAccount:options:bag:", v7, v6, v8);

  return v9;
}

- (AMSAuthenticateTask)initWithAccount:(id)a3 options:(id)a4 bag:(id)a5
{
  id v8;
  AMSAuthenticateOptions *v9;
  id v10;
  id v11;
  AMSAuthenticateTask *v12;
  AMSAuthenticateTask *v13;
  AMSMutablePromise *v14;
  AMSMutablePromise *resultPromise;
  AMSAuthenticateOptions *v16;
  NSMutableArray *v17;
  NSMutableArray *errors;
  AMSAuthenticateMetrics *v19;
  AMSAuthenticateMetricsProtocol *metrics;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *password;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *rawPassword;
  void *v29;
  uint64_t v30;
  NSString *altDSID;
  uint64_t v32;
  NSNumber *DSID;
  void *v34;
  uint64_t v35;
  NSString *username;
  objc_super v38;

  v8 = a3;
  v9 = (AMSAuthenticateOptions *)a4;
  v10 = a5;
  v11 = AMSSetLogKeyIfNeeded();
  v38.receiver = self;
  v38.super_class = (Class)AMSAuthenticateTask;
  v12 = -[AMSTask init](&v38, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bag, a5);
    v14 = objc_alloc_init(AMSMutablePromise);
    resultPromise = v13->_resultPromise;
    v13->_resultPromise = v14;

    v16 = v9;
    if (!v9)
      v16 = objc_alloc_init(AMSAuthenticateOptions);
    objc_storeStrong((id *)&v13->_options, v16);
    if (!v9)

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    errors = v13->_errors;
    v13->_errors = v17;

    v19 = -[AMSAuthenticateMetrics initWithBag:]([AMSAuthenticateMetrics alloc], "initWithBag:", v10);
    metrics = v13->_metrics;
    v13->_metrics = (AMSAuthenticateMetricsProtocol *)v19;

    objc_msgSend(v8, "credential");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "password");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    password = v13->_password;
    v13->_password = (NSString *)v23;

    objc_msgSend(v8, "credential");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "credentialItemForKey:", *MEMORY[0x1E0C8F258]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    rawPassword = v13->_rawPassword;
    v13->_rawPassword = (NSString *)v27;

    objc_msgSend(v8, "ams_altDSID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "copy");
    altDSID = v13->_altDSID;
    v13->_altDSID = (NSString *)v30;

    objc_msgSend(v8, "ams_DSID");
    v32 = objc_claimAutoreleasedReturnValue();
    DSID = v13->_DSID;
    v13->_DSID = (NSNumber *)v32;

    objc_msgSend(v8, "username");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "copy");
    username = v13->_username;
    v13->_username = (NSString *)v35;

    v13->_isLocalAccountProvided = objc_msgSend(v8, "ams_isLocalAccount");
  }

  return v13;
}

- (AMSAuthenticateTask)initWithAuthenticationResults:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AMSAuthenticateTask *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_createFallbackBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSAuthenticateTask initWithAuthenticationResults:options:bag:](self, "initWithAuthenticationResults:options:bag:", v7, v6, v8);

  return v9;
}

- (AMSAuthenticateTask)initWithAuthenticationResults:(id)a3 options:(id)a4 bag:(id)a5
{
  id v8;
  AMSAuthenticateOptions *v9;
  id v10;
  id v11;
  AMSAuthenticateTask *v12;
  AMSAuthenticateTask *v13;
  uint64_t v14;
  NSDictionary *initialAuthenticationResults;
  AMSMutablePromise *v16;
  AMSMutablePromise *resultPromise;
  AMSAuthenticateOptions *v18;
  NSMutableArray *v19;
  NSMutableArray *errors;
  AMSAuthenticateMetrics *v21;
  AMSAuthenticateMetricsProtocol *metrics;
  objc_super v24;

  v8 = a3;
  v9 = (AMSAuthenticateOptions *)a4;
  v10 = a5;
  v11 = AMSSetLogKeyIfNeeded();
  v24.receiver = self;
  v24.super_class = (Class)AMSAuthenticateTask;
  v12 = -[AMSTask init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bag, a5);
    v14 = objc_msgSend(v8, "copy");
    initialAuthenticationResults = v13->_initialAuthenticationResults;
    v13->_initialAuthenticationResults = (NSDictionary *)v14;

    v16 = objc_alloc_init(AMSMutablePromise);
    resultPromise = v13->_resultPromise;
    v13->_resultPromise = v16;

    v18 = v9;
    if (!v9)
      v18 = objc_alloc_init(AMSAuthenticateOptions);
    objc_storeStrong((id *)&v13->_options, v18);
    if (!v9)

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    errors = v13->_errors;
    v13->_errors = v19;

    v21 = -[AMSAuthenticateMetrics initWithBag:]([AMSAuthenticateMetrics alloc], "initWithBag:", v10);
    metrics = v13->_metrics;
    v13->_metrics = (AMSAuthenticateMetricsProtocol *)v21;

  }
  return v13;
}

- (AMSAuthenticateTask)initWithRequest:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  AMSAuthenticateTask *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "logKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = AMSSetLogKey(v9);

  }
  self->_isServerRequested = objc_msgSend(v6, "isServerRequested");
  objc_msgSend(v6, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AMSAuthenticateTask initWithAccount:options:bag:](self, "initWithAccount:options:bag:", v11, v12, v7);

  return v13;
}

- (AMSAuthenticateTask)initWithRequest:(id)a3
{
  id v4;
  void *v5;
  AMSAuthenticateTask *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_createFallbackBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AMSAuthenticateTask initWithRequest:bag:](self, "initWithRequest:bag:", v4, v5);

  return v6;
}

- (id)performAuthentication
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__AMSAuthenticateTask_performAuthentication__block_invoke;
  v3[3] = &unk_1E253DB80;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __44__AMSAuthenticateTask_performAuthentication__block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  AMSAuthenticateMetricsContext *v36;
  void *v37;
  AMSAuthenticateMetricsContext *v38;
  void *v39;
  id v40;
  AMSMutablePromise *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[5];
  id v54;
  id v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "initialAuthenticationResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  +[AMSLogConfig sharedAccountsOversizeConfig](AMSLogConfig, "sharedAccountsOversizeConfig");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v49 = objc_opt_class();
      AMSLogKey();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "altDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "DSID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "username");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "options");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v57 = v49;
      v58 = 2114;
      v59 = v50;
      v60 = 2114;
      v61 = v14;
      v62 = 2114;
      v63 = v16;
      v64 = 2114;
      v65 = v18;
      v66 = 2114;
      v67 = v19;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing an iTunes authentication. altDSID = %{public}@ | DSID = %{public}@ | username = %{public}@ | options = %{public}@", buf, 0x3Eu);

    }
  }
  else
  {
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "initialAuthenticationResults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ak_redactedCopy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "options");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v57 = v7;
      v58 = 2114;
      v59 = v8;
      v60 = 2114;
      v61 = v11;
      v62 = 2114;
      v63 = v12;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing an authentication with pre-initialized authentication results. authenticationResults = %{public}@ | options = %{public}@", buf, 0x2Au);

    }
  }

  if (!objc_msgSend(*(id *)(a1 + 32), "isLocalAccountProvided"))
  {
    v27 = *(void **)(a1 + 32);
    v55 = 0;
    objc_msgSend(v27, "_accountForAuthenticationWithError:", &v55);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v55;
    v30 = *(void **)(a1 + 32);
    if (v29)
    {
      objc_msgSend(v30, "resultPromise");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "finishWithError:", v29);

      objc_msgSend(*(id *)(a1 + 32), "resultPromise");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

      goto LABEL_33;
    }
    if (objc_msgSend(v30, "_isMetricsEnabled"))
    {
      v36 = [AMSAuthenticateMetricsContext alloc];
      objc_msgSend(*(id *)(a1 + 32), "options");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[AMSAuthenticateMetricsContext initWithOptions:account:](v36, "initWithOptions:account:", v37, v28);

      -[AMSAuthenticateMetricsContext setIsServerRequested:](v38, "setIsServerRequested:", objc_msgSend(*(id *)(a1 + 32), "isServerRequested"));
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (id)objc_msgSend(v39, "enqueueWithEvent:context:", 0, v38);

    }
    v41 = objc_alloc_init(AMSMutablePromise);
    objc_msgSend(*(id *)(a1 + 32), "options");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v42, "enableAccountCreation") & 1) != 0)
    {
      objc_msgSend(v28, "username");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43 == 0;

      if (v44)
      {
        objc_msgSend(*(id *)(a1 + 32), "_runCreateAccountDialog");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSMutablePromise finishWithPromise:](v41, "finishWithPromise:", v45);

LABEL_31:
        v46 = MEMORY[0x1E0C809B0];
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __44__AMSAuthenticateTask_performAuthentication__block_invoke_40;
        v53[3] = &unk_1E253E080;
        v53[4] = *(_QWORD *)(a1 + 32);
        v54 = v28;
        -[AMSPromise resultWithCompletion:](v41, "resultWithCompletion:", v53);
        objc_initWeak((id *)buf, *(id *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 32), "resultPromise");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v46;
        v51[1] = 3221225472;
        v51[2] = __44__AMSAuthenticateTask_performAuthentication__block_invoke_2;
        v51[3] = &unk_1E253E0A8;
        objc_copyWeak(&v52, (id *)buf);
        objc_msgSend(v47, "addFinishBlock:", v51);

        objc_msgSend(*(id *)(a1 + 32), "resultPromise");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_destroyWeak(&v52);
        objc_destroyWeak((id *)buf);

        goto LABEL_32;
      }
    }
    else
    {

    }
    -[AMSMutablePromise finishWithResult:](v41, "finishWithResult:", MEMORY[0x1E0C9AAB0], v49);
    goto LABEL_31;
  }
  v20 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v20)
  {
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject", v49);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_opt_class();
      AMSLogKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v24;
      v58 = 2114;
      v59 = v25;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Local account provided. Unable to proceed with the authentication because the account provided is a local account.", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v26, 0);
  }
  else
  {
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject", v49);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      v33 = objc_opt_class();
      AMSLogKey();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v33;
      v58 = 2114;
      v59 = v34;
      _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Local account provided. Unable to proceed with the authentication because the account provided is a local account.", buf, 0x16u);

    }
  }

  AMSError(2, CFSTR("Local Account Provided"), CFSTR("Unable to proceed with the authentication because the account provided is a local account."), 0);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resultPromise");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "finishWithError:", v29);

  objc_msgSend(*(id *)(a1 + 32), "resultPromise");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v32;
}

void __44__AMSAuthenticateTask_performAuthentication__block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(a2, "BOOLValue");
  v5 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v5, "resultPromise");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithError:", v10);

  }
  else
  {
    objc_msgSend(v5, "initialAuthenticationResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    if (v7)
      objc_msgSend(v8, "_performAuthenticationWithInitialResultsAndAccount:", v9);
    else
      objc_msgSend(v8, "_performAuthenticationAndGeneratePasswordWithAccount:", v9);
  }

}

void __44__AMSAuthenticateTask_performAuthentication__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_isMetricsEnabled"))
  {
    objc_msgSend(WeakRetained, "metrics");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "flushEvents");

  }
}

+ (NSString)bagSubProfile
{
  return +[AMSURLRequestEncoder bagSubProfile](AMSURLRequestEncoder, "bagSubProfile");
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSURLRequestEncoder bagSubProfileVersion](AMSURLRequestEncoder, "bagSubProfileVersion");
}

+ (id)createBagForSubProfile
{
  return +[AMSURLRequestEncoder createBagForSubProfile](AMSURLRequestEncoder, "createBagForSubProfile");
}

- (id)_accountForAuthenticationWithError:(id *)a3
{
  void *v4;
  void *v5;
  _UNKNOWN **v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  uint64_t v90;
  void *v91;
  NSObject *v92;
  uint64_t v93;
  void *v94;
  NSObject *v95;
  uint64_t v96;
  void *v97;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  uint8_t buf[4];
  uint64_t v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  void *v113;
  __int16 v114;
  void *v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  -[AMSAuthenticateTask _accountStoreForAuthentication](self, "_accountStoreForAuthentication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateTask initialAuthenticationResults](self, "initialAuthenticationResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = &off_1E2519000;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0x1E0C8F000;
  if (!v5)
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v101 = objc_opt_class();
      AMSLogKey();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAuthenticateTask altDSID](self, "altDSID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAuthenticateTask DSID](self, "DSID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v35);
      v103 = v4;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAuthenticateTask username](self, "username");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v107 = v101;
      v108 = 2114;
      v109 = v32;
      v110 = 2114;
      v111 = v34;
      v112 = 2114;
      v113 = v36;
      v114 = 2114;
      v115 = v38;
      _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Looking for an existing account. altDSID = %{public}@ | DSID = %{public}@ | username = %{public}@", buf, 0x34u);

      v6 = &off_1E2519000;
      v9 = 0x1E0C8F000;

      v4 = v103;
    }

    -[AMSAuthenticateTask altDSID](self, "altDSID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      -[AMSAuthenticateTask DSID](self, "DSID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39)
      {
        -[AMSAuthenticateTask username](self, "username");
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (v73)
          goto LABEL_20;
        objc_msgSend(v4, "ams_demoAccount");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "username");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSAuthenticateTask setUsername:](self, "setUsername:", v75);

        -[AMSAuthenticateTask username](self, "username");
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v76)
        {
LABEL_20:
          -[AMSAuthenticateTask altDSID](self, "altDSID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSAuthenticateTask DSID](self, "DSID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSAuthenticateTask username](self, "username");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "ams_iTunesAccountWithAltDSID:DSID:username:", v40, v41, v42);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
LABEL_34:
            if ((objc_msgSend(v23, "isActive") & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "currentPersona");
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v59, "isEnterprisePersona"))
              {
                objc_msgSend(v59, "userPersonaUniqueString");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6[274], "sharedAccountsConfig");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v61)
                {
                  objc_msgSend(v6[274], "sharedConfig");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v61, "OSLogObject");
                v62 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                {
                  v63 = v4;
                  AMSLogKey();
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  v65 = (void *)MEMORY[0x1E0CB3940];
                  v66 = objc_opt_class();
                  v67 = v66;
                  if (v64)
                  {
                    AMSLogKey();
                    a3 = (id *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "stringWithFormat:", CFSTR("%@: [%@] "), v67, a3);
                  }
                  else
                  {
                    objc_msgSend(v65, "stringWithFormat:", CFSTR("%@: "), v66);
                  }
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  AMSHashIfNeeded(v60);
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v107 = (uint64_t)v68;
                  v108 = 2114;
                  v109 = v82;
                  _os_log_impl(&dword_18C849000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@The current persona is an enterprise persona. Adding a persona identifier to the account. personaIdentifier = %{public}@", buf, 0x16u);
                  if (v64)
                  {

                    v68 = a3;
                  }

                  v4 = v63;
                  v6 = &off_1E2519000;
                  v9 = 0x1E0C8F000uLL;
                }

                objc_msgSend(v23, "setObject:forKeyedSubscript:", v60, *MEMORY[0x1E0C8EFC8]);
              }

            }
            -[AMSAuthenticateTask options](self, "options");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "clientInfo");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "accountMediaType");
            v85 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(v9 + 696), "ams_sharedAccountStoreForMediaType:", v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "ams_activeiTunesAccount");
            v87 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v87)
            {
              -[AMSAuthenticateTask options](self, "options");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = objc_msgSend(v88, "canMakeAccountActive");

              objc_msgSend(v6[274], "sharedAccountsConfig");
              v90 = objc_claimAutoreleasedReturnValue();
              v91 = (void *)v90;
              if (v89)
              {
                if (!v90)
                {
                  objc_msgSend(v6[274], "sharedConfig");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v91, "OSLogObject");
                v92 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                {
                  v93 = objc_opt_class();
                  AMSLogKey();
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v107 = v93;
                  v108 = 2114;
                  v109 = v94;
                  v110 = 2114;
                  v111 = v85;
                  _os_log_impl(&dword_18C849000, v92, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The device doesn't have an active account for %{public}@. We'll make the account active if we successfully authenticate it.", buf, 0x20u);

                }
                objc_msgSend(v23, "ams_setActive:forMediaType:", 1, v85);
              }
              else
              {
                if (!v90)
                {
                  objc_msgSend(v6[274], "sharedConfig");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v91, "OSLogObject");
                v95 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
                {
                  v96 = objc_opt_class();
                  AMSLogKey();
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v107 = v96;
                  v108 = 2114;
                  v109 = v97;
                  _os_log_impl(&dword_18C849000, v95, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We would normally make the account active, but canMakeAccountActive is set to false.", buf, 0x16u);

                }
              }
            }
            -[AMSAuthenticateTask _updateAccountWithProvidedInformation:](self, "_updateAccountWithProvidedInformation:", v23);
            v72 = v23;

            goto LABEL_74;
          }
          goto LABEL_27;
        }
        +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v39)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v39, "OSLogObject");
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          v78 = objc_opt_class();
          AMSLogKey();
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSAuthenticateTask username](self, "username");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v107 = v78;
          v108 = 2114;
          v109 = v79;
          v110 = 2114;
          v111 = v81;
          _os_log_impl(&dword_18C849000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Using the device's demo account. username = %{public}@", buf, 0x20u);

        }
      }
    }

    goto LABEL_20;
  }
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateTask initialAuthenticationResults](self, "initialAuthenticationResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ak_redactedCopy");
    v14 = v4;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v107 = v11;
    v108 = 2114;
    v109 = v12;
    v110 = 2114;
    v111 = v16;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Looking for an existing account matching authentication results. authenticationResults = %{public}@", buf, 0x20u);

    v4 = v14;
    v9 = 0x1E0C8F000uLL;

    v6 = &off_1E2519000;
  }

  v17 = *(void **)(v9 + 696);
  objc_msgSend(v4, "ams_mediaType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ams_accountTypeIdentifierForMediaType:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSAuthenticateTask initialAuthenticationResults](self, "initialAuthenticationResults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF40]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "ams_accountWithAltDSID:DSID:username:accountTypeIdentifier:", v21, 0, 0, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = v22;
    objc_msgSend(v22, "username");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
LABEL_33:

      goto LABEL_34;
    }
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v25 = objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v25, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v99 = objc_opt_class();
      AMSLogKey();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAuthenticateTask initialAuthenticationResults](self, "initialAuthenticationResults");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "ak_redactedCopy");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v28);
      v102 = v4;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v107 = v99;
      v108 = 2114;
      v109 = v27;
      v110 = 2114;
      v111 = v29;
      v112 = 2114;
      v113 = v30;
      _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Found an account matching the given authentication results’ altDSID, but it has no username. authenticationResults = %{public}@ | account = %{public}@", buf, 0x2Au);

      v6 = &off_1E2519000;
      v4 = v102;

    }
    v9 = 0x1E0C8F000;
  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v104 = v4;
      v43 = objc_opt_class();
      AMSLogKey();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAuthenticateTask initialAuthenticationResults](self, "initialAuthenticationResults");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "ak_redactedCopy");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v107 = v43;
      v9 = 0x1E0C8F000uLL;
      v108 = 2114;
      v109 = v44;
      v110 = 2114;
      v111 = v47;
      _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find an account matching the given authentication results. authenticationResults = %{public}@", buf, 0x20u);

      v6 = &off_1E2519000;
      v4 = v104;
    }
  }

LABEL_27:
  v48 = +[AMSRestrictions allowActiveAccountModifications](AMSRestrictions, "allowActiveAccountModifications");
  objc_msgSend(v6[274], "sharedAccountsConfig");
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v49;
  if (v48)
  {
    if (!v49)
    {
      objc_msgSend(v6[274], "sharedConfig");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v50, "OSLogObject");
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = objc_opt_class();
      AMSLogKey();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v107 = v52;
      v108 = 2114;
      v109 = v53;
      _os_log_impl(&dword_18C849000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to find an existing account. We'll create a new one instead.", buf, 0x16u);

    }
    v54 = *(void **)(v9 + 696);
    -[AMSAuthenticateTask options](self, "options");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "clientInfo");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "accountMediaType");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "ams_accountTypeIdentifierForMediaType:", v57);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_ams_accountTypeWithAccountTypeIdentifier:error:", v19, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v21);
    objc_msgSend(v23, "setActive:", 0);
    goto LABEL_33;
  }
  if (!v49)
  {
    objc_msgSend(v6[274], "sharedConfig");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v50, "OSLogObject");
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
  {
    v70 = objc_opt_class();
    AMSLogKey();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v107 = v70;
    v108 = 2114;
    v109 = v71;
    _os_log_impl(&dword_18C849000, v69, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find an existing account. Unable to proceed with the authentication because account modifications are not allowed.", buf, 0x16u);

  }
  if (a3)
  {
    AMSError(8, CFSTR("Account Modifications Disabled"), CFSTR("Account modifications are disabled. Unable to sign into a new account."), 0);
    v72 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v72 = 0;
  }
LABEL_74:

  return v72;
}

- (id)_accountStoreForAuthentication
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[AMSAuthenticateTask options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountMediaType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C8F2B8];
  if (v5)
  {
    -[AMSAuthenticateTask options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountMediaType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ams_sharedAccountStoreForMediaType:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_attemptCompanionAuthenticationForAccount:(id)a3
{
  void *v3;
  void *v4;

  AMSError(5, CFSTR("Platform not supported"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_attemptMultiUserTokenAuthenticationForAccount:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (id)_attemptPasswordReuseAuthenticationForAccount:(id)a3
{
  id v4;
  AMSMutablePromise *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  AMSMutablePromise *v21;
  id v22;
  AMSAuthenticateTask *v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  -[AMSAuthenticateTask options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "authenticationType") == 2
    || (objc_msgSend(v4, "ams_password"), (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_10;
  }
  v8 = (void *)v7;
  -[AMSAuthenticateTask options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_10:
    AMSError(2, CFSTR("Password reuse not available for account"), CFSTR("The account state does not support password reuse."), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMutablePromise finishWithError:](v5, "finishWithError:", v18);

    goto LABEL_11;
  }
  +[AMSLogConfig sharedAccountsOversizeConfig](AMSLogConfig, "sharedAccountsOversizeConfig");
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
    v13 = objc_opt_class();
    AMSLogKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v13;
    v26 = 2114;
    v27 = v14;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to authenticate the account by reusing its password.", buf, 0x16u);

  }
  -[AMSAuthenticateTask options](self, "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "credentialSource");

  -[AMSAuthenticateTask _performAuthenticationUsingAccount:credentialSource:](self, "_performAuthenticationUsingAccount:credentialSource:", v4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __69__AMSAuthenticateTask__attemptPasswordReuseAuthenticationForAccount___block_invoke;
  v20[3] = &unk_1E253DCC8;
  v21 = v5;
  v22 = v4;
  v23 = self;
  objc_msgSend(v17, "resultWithCompletion:", v20);

LABEL_11:
  return v5;
}

void __69__AMSAuthenticateTask__attemptPasswordReuseAuthenticationForAccount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "ams_setPassword:", 0);
    +[AMSLogConfig sharedAccountsOversizeConfig](AMSLogConfig, "sharedAccountsOversizeConfig");
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
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to authenticate the account by reusing its password. error = %{public}@", (uint8_t *)&v13, 0x20u);

    }
    if (v5)
    {
      v11 = v5;
    }
    else
    {
      AMSError(2, CFSTR("Password reuse not available for account"), CFSTR("Password reuse failed however verify credentials did not return an error"), 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v11);

  }
}

- (id)_createAuthKitUpdateTaskForAccount:(id)a3
{
  id v4;
  AMSAuthKitUpdateTask *v5;
  void *v6;
  AMSAuthKitUpdateTask *v7;
  void *v8;

  v4 = a3;
  v5 = [AMSAuthKitUpdateTask alloc];
  -[AMSAuthenticateTask options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSAuthKitUpdateTask initWithAccount:options:](v5, "initWithAccount:options:", v4, v6);

  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_createFallbackBag
{
  uint64_t v2;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
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
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, v2);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v10;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Falling back to sub profile bag", buf, 0xCu);
    if (v6)
    {

      v10 = (void *)v2;
    }

  }
  objc_msgSend(a1, "createBagForSubProfile");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_finishWithVerifiedAccount:(id)a3 andAuthKitUpdateResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v10;
      v44 = 2114;
      v45 = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully authenticated the account.", buf, 0x16u);

    }
    -[AMSAuthenticateTask _accountStoreForAuthentication](self, "_accountStoreForAuthentication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateTask options](self, "options");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mediaType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ams_activeiTunesAccountForMediaType:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __73__AMSAuthenticateTask__finishWithVerifiedAccount_andAuthKitUpdateResult___block_invoke;
    v38[3] = &unk_1E253E0D0;
    v38[4] = self;
    v39 = v6;
    v40 = v12;
    v41 = v7;
    v16 = v12;
    objc_msgSend(v15, "addFinishBlock:", v38);

    -[AMSAuthenticateTask resultPromise](self, "resultPromise");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_25;
  }
  -[AMSAuthenticateTask errors](self, "errors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  -[AMSAuthenticateTask errors](self, "errors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 < 2)
  {
    v24 = objc_msgSend(v20, "count");

    if (v24 != 1)
    {
      AMSError(100, CFSTR("Authentication Failed"), CFSTR("The authentication failed with an unknown error."), 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    -[AMSAuthenticateTask errors](self, "errors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(100, CFSTR("Authentication Failed"), CFSTR("The authentication failed."), v22);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = (void *)objc_msgSend(v20, "copy");
    AMSErrorWithMultipleUnderlyingErrors(100, CFSTR("Authentication Failed"), CFSTR("The authentication failed."), v22);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (id)v23;

LABEL_13:
  -[AMSAuthenticateTask _sanitizeError:](self, "_sanitizeError:", v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v26, "OSLogObject");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    AMSLogKey();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0CB3940];
    v30 = objc_opt_class();
    v31 = v30;
    if (v28)
    {
      AMSLogKey();
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: [%@] "), v31, v37);
    }
    else
    {
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: "), v30);
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v25);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = (uint64_t)v32;
    v44 = 2114;
    v45 = v33;
    _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@The authentication failed. error = %{public}@", buf, 0x16u);
    if (v28)
    {

      v32 = (void *)v37;
    }

  }
  -[AMSAuthenticateTask resultPromise](self, "resultPromise");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "finishWithError:", v25);

  if ((objc_msgSend(v16, "ams_recursiveHasDomain:code:", CFSTR("AMSErrorDomain"), 308) & 1) == 0)
  {
    objc_msgSend(v7, "account");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateTask _postFollowUpForFailedAuthenticationWithAccount:](self, "_postFollowUpForFailedAuthenticationWithAccount:", v35);

  }
  -[AMSAuthenticateTask resultPromise](self, "resultPromise");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
  return v17;
}

void __73__AMSAuthenticateTask__finishWithVerifiedAccount_andAuthKitUpdateResult___block_invoke(id *a1, void *a2)
{
  uint64_t v2;
  id v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  AMSAuthenticateResult *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(a1[4], "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canMakeAccountActive");
  if (v4 || !v6)
  {

LABEL_10:
    objc_msgSend(a1[4], "options");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "canMakeAccountActive"))
    {
      v16 = objc_msgSend(a1[5], "isActive");

      if ((v16 & 1) != 0)
      {
LABEL_28:
        v31 = -[AMSAuthenticateResult initWithAccount:]([AMSAuthenticateResult alloc], "initWithAccount:", a1[5]);
        -[AMSAuthenticateResult setAuthKitUpdateResult:](v31, "setAuthKitUpdateResult:", a1[7]);
        objc_msgSend(a1[4], "resultPromise");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "finishWithResult:", v31);

        goto LABEL_29;
      }
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = objc_opt_class();
        v21 = v20;
        if (v18)
        {
          AMSLogKey();
          v2 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] "), v21, v2);
        }
        else
        {
          objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: "), v20);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(a1[5]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v37 = v22;
        v38 = 2114;
        v39 = v29;
        v40 = 2114;
        v41 = v30;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@We tried to make the account active, but after authentication a different account is active. account = %{public}@ | activeAccount = %{public}@", buf, 0x20u);
        if (v18)
        {

          v22 = (void *)v2;
        }

      }
    }

    goto LABEL_28;
  }
  v7 = objc_msgSend(a1[5], "isActive");

  if ((v7 & 1) != 0)
    goto LABEL_10;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = objc_opt_class();
    v13 = v12;
    if (v10)
    {
      AMSLogKey();
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] "), v13, v2);
    }
    else
    {
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(a1[5]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v14;
    v38 = 2114;
    v39 = v23;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@We tried to make the account active, but after authentication it isn’t active. Making it active and saving it. account = %{public}@", buf, 0x16u);
    if (v10)
    {

      v14 = (void *)v2;
    }

  }
  v24 = a1[5];
  objc_msgSend(a1[4], "options");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mediaType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "ams_setActive:forMediaType:", 1, v26);

  objc_msgSend(a1[6], "ams_saveAccount:withOptions:", a1[5], 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __73__AMSAuthenticateTask__finishWithVerifiedAccount_andAuthKitUpdateResult___block_invoke_69;
  v33[3] = &unk_1E253DB30;
  v28 = a1[5];
  v33[4] = a1[4];
  v34 = v28;
  v35 = a1[7];
  objc_msgSend(v27, "addFinishBlock:", v33);

LABEL_29:
}

void __73__AMSAuthenticateTask__finishWithVerifiedAccount_andAuthKitUpdateResult___block_invoke_69(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  AMSAuthenticateResult *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = objc_opt_class();
      v11 = v10;
      if (v8)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v3);
      }
      else
      {
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2114;
      v20 = v15;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@There was a problem saving the verified active account. error: %{public}@", buf, 0x16u);
      if (v8)
      {

        v12 = (void *)v3;
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "resultPromise");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "finishWithError:", v5);

  }
  else
  {
    v13 = -[AMSAuthenticateResult initWithAccount:]([AMSAuthenticateResult alloc], "initWithAccount:", *(_QWORD *)(a1 + 40));
    -[AMSAuthenticateResult setAuthKitUpdateResult:](v13, "setAuthKitUpdateResult:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "resultPromise");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishWithResult:", v13);

  }
}

- (id)_handleDialogFromError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  const __CFString *v43;
  void *v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateErrorDialog"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_16;
  }
  v7 = v6;

  if (!v7)
  {
LABEL_16:
    v24 = v4;
    v7 = 0;
    goto LABEL_26;
  }
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    v10 = objc_opt_class();
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v10;
    v47 = 2114;
    v48 = v11;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The authentication's error contained an encoded AMSDialogRequest. Decoding it.", buf, 0x16u);

  }
  v42 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v42);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v42;
  if (v12)
  {
    -[AMSAuthenticateTask delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
        v17 = objc_opt_class();
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v17;
        v47 = 2114;
        v48 = v18;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending dialog request to delegate.", buf, 0x16u);

      }
      objc_initWeak((id *)buf, self);
      -[AMSAuthenticateTask _runDialogRequest:](self, "_runDialogRequest:", v12);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __46__AMSAuthenticateTask__handleDialogFromError___block_invoke;
      v40[3] = &unk_1E253E0F8;
      objc_copyWeak(&v41, (id *)buf);
      objc_msgSend(v38, "thenWithBlock:", v40);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "waitUntilFinished");
      objc_msgSend(v4, "userInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "mutableCopy");
      v22 = v21;
      if (v21)
        v23 = v21;
      else
        v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v31 = v23;

      objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("AMSAuthenticateErrorDialog"));
      objc_msgSend(v4, "domain");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v4, "code");
      objc_msgSend(v4, "ams_title");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ams_message");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ams_underlyingError");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      AMSCustomError(v32, v33, v34, v35, v31, v36);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v41);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v43 = CFSTR("AMSAuthenticateErrorDialog");
      v44 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ams_errorByAddingUserInfo:", v30);
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v25, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_opt_class();
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v39);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v27;
      v47 = 2114;
      v48 = v28;
      v49 = 2114;
      v50 = v29;
      _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode the AMSDialogRequest. error = %{public}@", buf, 0x20u);

    }
    v24 = v4;
  }

LABEL_26:
  return v24;
}

id __46__AMSAuthenticateTask__handleDialogFromError___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  AMSHandleDialogResultTask *v5;
  void *v6;
  AMSHandleDialogResultTask *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = [AMSHandleDialogResultTask alloc];
  objc_msgSend(WeakRetained, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSHandleDialogResultTask initWithResult:bag:](v5, "initWithResult:bag:", v3, v6);

  -[AMSHandleDialogResultTask perform](v7, "perform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "promiseAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_isMetricsEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[AMSAuthenticateTask options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metricsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AMSAuthenticateTask options](self, "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metricsIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_performAuthenticationAndGeneratePasswordWithAccount:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke;
  v6[3] = &unk_1E253DC00;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AMSAuthenticateTask _attemptMultiUserTokenAuthenticationForAccount:completion:](self, "_attemptMultiUserTokenAuthenticationForAccount:completion:", v5, v6);

}

void __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "errors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_addNullableObject:", v6);

  }
  if (v5)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully authenticated the account.", buf, 0x16u);

    }
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "_finishWithVerifiedAccount:andAuthKitUpdateResult:", v5, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_attemptCompanionAuthenticationForAccount:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_83;
    v15[3] = &unk_1E253DC00;
    v14 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v14;
    objc_msgSend(v13, "resultWithCompletion:", v15);

  }
}

void __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_83(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_attemptPasswordReuseAuthenticationForAccount:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_84;
  v4[3] = &unk_1E253DC00;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "resultWithCompletion:", v4);

}

void __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  AMSMutablePromise *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  AMSMutablePromise *v30;
  AMSMutablePromise *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[4];
  AMSMutablePromise *v36;
  _QWORD v37[5];
  id v38;
  AMSMutablePromise *v39;
  _QWORD v40[5];
  _QWORD v41[5];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v10;
      v44 = 2114;
      v45 = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully authenticated the account.", buf, 0x16u);

    }
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "_finishWithVerifiedAccount:andAuthKitUpdateResult:", v5, 0);
    goto LABEL_24;
  }
  if ((objc_msgSend(v6, "ams_hasDomain:code:", CFSTR("AMSServerErrorDomain"), 5001) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "errors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ams_addNullableObject:", v7);

LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "_processAuthKitUpdateResult:error:", 0, v7);
    goto LABEL_24;
  }
  v14 = objc_msgSend(v7, "ams_hasDomain:code:", CFSTR("AMSServerErrorDomain"), 5304);
  objc_msgSend(*(id *)(a1 + 32), "errors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ams_addNullableObject:", v7);

  if ((v14 & 1) != 0)
    goto LABEL_10;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    v18 = objc_opt_class();
    AMSLogKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v18;
    v44 = 2114;
    v45 = v19;
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initial authentication results not present, generating a password for authentication.", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "options");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "authenticationType") == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "ams_rawPassword");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
        v24 = objc_opt_class();
        AMSLogKey();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v24;
        v44 = 2114;
        v45 = v25;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing the account's raw password to force an interactive authentication.", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "ams_setRawPassword:", 0);
    }
  }
  else
  {

  }
  v26 = objc_alloc_init(AMSMutablePromise);
  v27 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_85;
  v41[3] = &unk_1E253E120;
  v41[4] = *(_QWORD *)(a1 + 32);
  -[AMSPromise addErrorBlock:](v26, "addErrorBlock:", v41);
  v40[0] = v27;
  v40[1] = 3221225472;
  v40[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_87;
  v40[3] = &unk_1E253E148;
  v40[4] = *(_QWORD *)(a1 + 32);
  -[AMSPromise addSuccessBlock:](v26, "addSuccessBlock:", v40);
  objc_msgSend(*(id *)(a1 + 32), "_createAuthKitUpdateTaskForAccount:", *(_QWORD *)(a1 + 40));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v27;
  v37[1] = 3221225472;
  v37[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_89;
  v37[3] = &unk_1E253E170;
  v29 = *(void **)(a1 + 40);
  v37[4] = *(_QWORD *)(a1 + 32);
  v38 = v29;
  v30 = v26;
  v39 = v30;
  objc_msgSend(v28, "addSuccessBlock:", v37);
  v35[0] = v27;
  v35[1] = 3221225472;
  v35[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_2;
  v35[3] = &unk_1E253E120;
  v36 = v30;
  v31 = v30;
  objc_msgSend(v28, "addErrorBlock:", v35);
  v33[0] = v27;
  v33[1] = 3221225472;
  v33[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_3;
  v33[3] = &unk_1E253E198;
  v32 = *(void **)(a1 + 40);
  v33[4] = *(_QWORD *)(a1 + 32);
  v34 = v32;
  -[AMSPromise addFinishBlock:](v31, "addFinishBlock:", v33);

LABEL_24:
}

void __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_85(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    v10 = v9;
    if (v7)
    {
      AMSLogKey();
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v10, v2);
    }
    else
    {
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v12;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to generate a password. error = %{public}@", buf, 0x16u);
    if (v7)
    {

      v11 = (void *)v2;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "errors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v4);

  objc_msgSend(*(id *)(a1 + 32), "_processAuthKitUpdateResult:error:", 0, v4);
}

void __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_87(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully generated a password. Performing the authentication.", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_processAuthKitUpdateResult:error:", v3, 0);

}

void __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_89(uint64_t a1, void *a2)
{
  void *v3;
  AMSAuthenticateMetricsContext *v4;
  void *v5;
  AMSAuthenticateMetricsContext *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_isMetricsEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [AMSAuthenticateMetricsContext alloc];
    objc_msgSend(*(id *)(a1 + 32), "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AMSAuthenticateMetricsContext initWithOptions:account:](v4, "initWithOptions:account:", v5, *(_QWORD *)(a1 + 40));
    v7 = (id)objc_msgSend(v3, "enqueueWithEvent:context:", 1, v6);

  }
  v8 = *(void **)(a1 + 48);
  objc_msgSend(v10, "performAuthKitUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishWithPromise:", v9);

}

uint64_t __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  AMSAuthenticateMetricsContext *v4;
  void *v5;
  AMSAuthenticateMetricsContext *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_isMetricsEnabled"))
  {
    v4 = [AMSAuthenticateMetricsContext alloc];
    objc_msgSend(*(id *)(a1 + 32), "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AMSAuthenticateMetricsContext initWithOptions:account:](v4, "initWithOptions:account:", v5, *(_QWORD *)(a1 + 40));

    -[AMSAuthenticateMetricsContext setError:](v6, "setError:", v9);
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "enqueueWithEvent:context:", 2, v6);

  }
}

- (id)_performAuthenticationUsingAccount:(id)a3 credentialSource:(unint64_t)a4
{
  uint64_t v4;
  id v7;
  AMSMutablePromise *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  AMSMutablePromise *v21;
  AMSMutablePromise *v22;
  _QWORD v24[4];
  AMSMutablePromise *v25;
  AMSAuthenticateTask *v26;
  unint64_t v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_alloc_init(AMSMutablePromise);
  if (!a4)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = objc_opt_class();
      v14 = v13;
      if (v11)
      {
        AMSLogKey();
        v4 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v4);
      }
      else
      {
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v15;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@The account’s credential source is unknown.", buf, 0xCu);
      if (v11)
      {

        v15 = (void *)v4;
      }

    }
  }
  -[AMSAuthenticateTask options](self, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");

  objc_msgSend(v17, "setCredentialSource:", a4);
  objc_msgSend(v17, "optionsDictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C8F340]);
  -[AMSAuthenticateTask _accountStoreForAuthentication](self, "_accountStoreForAuthentication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__AMSAuthenticateTask__performAuthenticationUsingAccount_credentialSource___block_invoke;
  v24[3] = &unk_1E253D660;
  v27 = a4;
  v21 = v8;
  v25 = v21;
  v26 = self;
  objc_msgSend(v20, "verifyCredentialsForAccount:options:completion:", v7, v19, v24);

  v22 = v21;
  return v22;
}

void __75__AMSAuthenticateTask__performAuthenticationUsingAccount_credentialSource___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  v8 = v5;
  if (v5)
  {
    objc_msgSend(v5, "ams_setLastAuthenticationCredentialSource:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v8);
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_handleDialogFromError:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithError:", v7);

  }
}

- (void)_performAuthenticationWithInitialResultsAndAccount:(id)a3
{
  id v4;
  AMSAuthKitUpdateResult *v5;
  void *v6;
  void *v7;
  AMSAuthKitUpdateResult *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [AMSAuthKitUpdateResult alloc];
  -[AMSAuthenticateTask initialAuthenticationResults](self, "initialAuthenticationResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateTask options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AMSAuthKitUpdateResult initWithAccount:authenticationResults:options:](v5, "initWithAccount:authenticationResults:options:", v4, v6, v7);

  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    v11 = objc_opt_class();
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing the authentication with initial authentication results.", (uint8_t *)&v13, 0x16u);

  }
  -[AMSAuthenticateTask _processAuthKitUpdateResult:error:](self, "_processAuthKitUpdateResult:error:", v8, 0);

}

- (void)_postFollowUpForFailedAuthenticationWithAccount:(id)a3
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;

  }
}

- (void)_processAuthKitUpdateResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(v6, "credentialSource");
    -[AMSAuthenticateTask options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCredentialSource:", v8);

    -[AMSAuthenticateTask options](self, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v10, "serviceTokenOnly");

    if ((_DWORD)v9)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
        v13 = objc_opt_class();
        AMSLogKey();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v13;
        v25 = 2114;
        v26 = v14;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request only requires service token; skipping credential verification",
          buf,
          0x16u);

      }
      objc_msgSend(v6, "account");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[AMSAuthenticateTask _finishWithVerifiedAccount:andAuthKitUpdateResult:](self, "_finishWithVerifiedAccount:andAuthKitUpdateResult:", v15, v6);

    }
    else
    {
      objc_msgSend(v6, "account");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAuthenticateTask options](self, "options");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAuthenticateTask _performAuthenticationUsingAccount:credentialSource:](self, "_performAuthenticationUsingAccount:credentialSource:", v18, objc_msgSend(v19, "credentialSource"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __57__AMSAuthenticateTask__processAuthKitUpdateResult_error___block_invoke;
      v21[3] = &unk_1E253DC00;
      v21[4] = self;
      v22 = v6;
      objc_msgSend(v20, "resultWithCompletion:", v21);

    }
  }
  else
  {
    v17 = -[AMSAuthenticateTask _finishWithVerifiedAccount:andAuthKitUpdateResult:](self, "_finishWithVerifiedAccount:andAuthKitUpdateResult:", 0, 0);
  }

}

void __57__AMSAuthenticateTask__processAuthKitUpdateResult_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v5 = a2;
  v10 = v5;
  if (!v5)
  {
    v6 = *(void **)(a1 + 32);
    v7 = a3;
    objc_msgSend(v6, "errors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ams_addNullableObject:", v7);

    v5 = 0;
  }
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "_finishWithVerifiedAccount:andAuthKitUpdateResult:", v5, *(_QWORD *)(a1 + 40));

}

- (id)_runCreateAccountDialog
{
  uint64_t v2;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v32[5];
  id v33;
  SEL v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    v10 = v9;
    if (v7)
    {
      AMSLogKey();
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v10, v2);
    }
    else
    {
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v11;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Running create account dialog.", buf, 0xCu);
    if (v7)
    {

      v11 = (void *)v2;
    }

  }
  v12 = (void *)MEMORY[0x1E0C8F2B8];
  -[AMSAuthenticateTask options](self, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accountMediaType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ams_sharedAccountStoreForMediaType:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "ams_activeiCloudAccount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = objc_opt_class();
      v23 = v22;
      if (v20)
      {
        AMSLogKey();
        self = (AMSAuthenticateTask *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: [%@] "), v23, self);
      }
      else
      {
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: "), v22);
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v24;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping dialog as the user is signed in to iCloud.", buf, 0xCu);
      if (v20)
      {

        v24 = self;
      }

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSAuthenticateTask bag](self, "bag");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      +[AMSPurchaseTask createBagForSubProfile](AMSPurchaseTask, "createBagForSubProfile");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSAuthenticateTask bag](self, "bag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "URLForKey:", 0x1E254D2E0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "valuePromise");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __46__AMSAuthenticateTask__runCreateAccountDialog__block_invoke;
    v32[3] = &unk_1E253E1E8;
    v32[4] = self;
    v33 = v25;
    v34 = a2;
    v29 = v25;
    objc_msgSend(v28, "continueWithBlock:", v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v30;
}

id __46__AMSAuthenticateTask__runCreateAccountDialog__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 204))
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_opt_class();
      v12 = v11;
      if (v9)
      {
        AMSLogKey();
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v12, a1);
      }
      else
      {
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: "), v11);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(CFSTR("signup"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      v31 = 2114;
      v32 = v17;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping dialog as the bag is missing a value for %{public}@", buf, 0x16u);
      if (v9)
      {

        v13 = (void *)a1;
      }

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (v6)
  {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v16 = (void *)v14;
    goto LABEL_17;
  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_runCreateAccountDialogWithBag:", *(_QWORD *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __46__AMSAuthenticateTask__runCreateAccountDialog__block_invoke_94;
    v26[3] = &unk_1E253E1C0;
    v26[4] = *(_QWORD *)(a1 + 32);
    v27 = v5;
    v28 = *(id *)(a1 + 40);
    objc_msgSend(v15, "thenWithBlock:", v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB3940];
      v23 = objc_opt_class();
      if (v21)
      {
        AMSLogKey();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 48));
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v23, v24, a1);
      }
      else
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: %@ "), v23, v24);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v25;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@The bag load promise finished with neither a result nor a failure.", buf, 0xCu);
      if (v21)
      {

        v25 = (void *)a1;
      }

    }
    AMSError(0, 0, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_17:
  return v16;
}

id __46__AMSAuthenticateTask__runCreateAccountDialog__block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "selectedActionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("create"));

  if (v5)
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
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v8;
      v30 = 2114;
      v31 = v9;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Create account selected", buf, 0x16u);

    }
    v10 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clientInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadCreateAppleIDWithClientInfo:url:bag:", v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "selectedActionIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("signin"));

    if (v15)
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
        v18 = objc_opt_class();
        AMSLogKey();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        v30 = 2114;
        v31 = v19;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authenticate existing account selected", buf, 0x16u);

      }
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "selectedActionIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AMSErrorWithFormat(6, CFSTR("Purchase Account Prompt Failed"), CFSTR("User cancelled by selecting: %@"), v21, v22, v23, v24, v25, (uint64_t)v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v26);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v13;
}

+ (BOOL)loadCreateAppleIDWithClientInfo:(id)a3 bag:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    +[AMSPurchaseTask createBagForSubProfile](AMSPurchaseTask, "createBagForSubProfile");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "URLForKey:", 0x1E254D2E0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v10, "valueWithError:", &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;

  if (v11)
  {
    objc_msgSend(a1, "loadCreateAppleIDWithClientInfo:url:bag:", v8, v11, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v13, "resultWithError:", &v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;

    if (v14)
    {
      v16 = objc_msgSend(v14, "BOOLValue");
    }
    else
    {
      v16 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v15);
    }

  }
  else
  {
    v16 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }

  return v16;
}

+ (id)loadCreateAppleIDWithClientInfo:(id)a3 url:(id)a4 bag:(id)a5
{
  void *v5;
  AMSMutablePromise *v6;
  uint64_t v7;
  AMSMutablePromise *v8;
  AMSMutablePromise *v9;
  AMSMutablePromise *v10;
  AMSMutablePromise *v11;
  _QWORD v13[4];
  AMSMutablePromise *v14;
  _QWORD v15[4];
  AMSMutablePromise *v16;

  +[AMSOpenURL openURL:clientInfo:bag:](AMSOpenURL, "openURL:clientInfo:bag:", a4, a3, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(AMSMutablePromise);
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__AMSAuthenticateTask_loadCreateAppleIDWithClientInfo_url_bag___block_invoke;
  v15[3] = &unk_1E253E120;
  v8 = v6;
  v16 = v8;
  objc_msgSend(v5, "addErrorBlock:", v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __63__AMSAuthenticateTask_loadCreateAppleIDWithClientInfo_url_bag___block_invoke_2;
  v13[3] = &unk_1E253DBD8;
  v9 = v8;
  v14 = v9;
  objc_msgSend(v5, "addSuccessBlock:", v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

uint64_t __63__AMSAuthenticateTask_loadCreateAppleIDWithClientInfo_url_bag___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __63__AMSAuthenticateTask_loadCreateAppleIDWithClientInfo_url_bag___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  AMSError(6, CFSTR("Authenticate Cancelled"), CFSTR("Create account was selected"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

- (id)_runCreateAccountDialogWithBag:(id)a3
{
  id v4;
  AMSDialogRequest *v5;
  void *v6;
  AMSDialogRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = [AMSDialogRequest alloc];
  AMSLocalizedString(CFSTR("PURCHASE_SIGNIN"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSDialogRequest initWithTitle:message:](v5, "initWithTitle:message:", v6, 0);

  AMSLogKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDialogRequest setLogKey:](v7, "setLogKey:", v8);

  AMSLocalizedString(CFSTR("PURCHASE_EXISTING_APPLE_ACCOUNT"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDialogAction actionWithTitle:identifier:](AMSDialogAction, "actionWithTitle:identifier:", v9, CFSTR("signin"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDialogRequest addButtonAction:](v7, "addButtonAction:", v10);

  AMSLocalizedString(CFSTR("PURCHASE_CREATE_APPLE_ACCOUNT"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDialogAction actionWithTitle:identifier:](AMSDialogAction, "actionWithTitle:identifier:", v11, CFSTR("create"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDialogRequest addButtonAction:](v7, "addButtonAction:", v12);

  AMSLocalizedString(CFSTR("CANCEL"), v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSDialogAction actionWithTitle:style:](AMSDialogAction, "actionWithTitle:style:", v13, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDialogRequest addButtonAction:](v7, "addButtonAction:", v14);

  -[AMSAuthenticateTask _runDialogRequest:](self, "_runDialogRequest:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_runDialogRequest:(id)a3
{
  id v4;
  AMSMutablePromise *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  AMSMutablePromise *v12;

  v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  -[AMSAuthenticateTask delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AMSAuthenticateTask delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__AMSAuthenticateTask__runDialogRequest___block_invoke;
    v11[3] = &unk_1E253E210;
    v12 = v5;
    objc_msgSend(v8, "authenticateTask:handleDialogRequest:completion:", self, v4, v11);

  }
  else
  {
    AMSError(11, CFSTR("Dialog Delegate Not Found"), CFSTR("Unable to present dialog due to missing delegate"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMutablePromise finishWithError:](v5, "finishWithError:", v9);

  }
  return v5;
}

uint64_t __41__AMSAuthenticateTask__runDialogRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

- (id)_sanitizeError:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "ams_recursiveHasDomain:code:", *MEMORY[0x1E0CFFF10], -7003))
  {
    AMSError(6, CFSTR("Authentication Failed"), CFSTR("User cancelled"), v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (void)_updateAccountWithProvidedInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  int v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ams_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    -[AMSAuthenticateTask altDSID](self, "altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (!v7)
      goto LABEL_9;
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v10;
      v49 = 2114;
      v50 = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The caller provided an altDSID, and the account didn't have one.", (uint8_t *)&v47, 0x16u);

    }
    -[AMSAuthenticateTask altDSID](self, "altDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_setAltDSID:", v5);
  }

LABEL_9:
  objc_msgSend(v4, "ams_DSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
LABEL_10:

    goto LABEL_11;
  }
  -[AMSAuthenticateTask DSID](self, "DSID");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    -[AMSAuthenticateTask DSID](self, "DSID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isEqualToNumber:", &unk_1E25AEFD8);

    if ((v42 & 1) == 0)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v43, "OSLogObject");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = objc_opt_class();
        AMSLogKey();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 138543618;
        v48 = v45;
        v49 = 2114;
        v50 = v46;
        _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The caller provided a DSID, and the account didn't have one.", (uint8_t *)&v47, 0x16u);

      }
      -[AMSAuthenticateTask DSID](self, "DSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ams_setDSID:", v12);
      goto LABEL_10;
    }
  }
LABEL_11:
  -[AMSAuthenticateTask username](self, "username");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v4, "username");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateTask username](self, "username");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_19;
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_opt_class();
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "username");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAuthenticateTask username](self, "username");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138544130;
      v48 = v19;
      v49 = 2114;
      v50 = v20;
      v51 = 2114;
      v52 = v22;
      v53 = 2114;
      v54 = v24;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The caller provided an updated username. oldUsername = %{public}@ | newUsername = %{public}@", (uint8_t *)&v47, 0x2Au);

    }
    -[AMSAuthenticateTask username](self, "username");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUsername:", v13);
  }

LABEL_19:
  -[AMSAuthenticateTask options](self, "options");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isDemoAccountSetup");

  if (v26)
    objc_msgSend(v4, "ams_setDemoAccount:", 1);
  -[AMSAuthenticateTask password](self, "password");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v28, "OSLogObject");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_opt_class();
      AMSLogKey();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v30;
      v49 = 2114;
      v50 = v31;
      _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We have a password (PET) we can use.", (uint8_t *)&v47, 0x16u);

    }
    -[AMSAuthenticateTask password](self, "password");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_setPassword:", v32);

  }
  -[AMSAuthenticateTask rawPassword](self, "rawPassword");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      v36 = objc_opt_class();
      AMSLogKey();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v36;
      v49 = 2114;
      v50 = v37;
      _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We have a raw password we can use.", (uint8_t *)&v47, 0x16u);

    }
    -[AMSAuthenticateTask rawPassword](self, "rawPassword");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_setRawPassword:", v38);

  }
  objc_msgSend((id)objc_opt_class(), "_updateAccountPasswordUsingSecondaryAccounts:", v4);

}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (id)homeID
{
  void *v2;
  void *v3;

  -[AMSAuthenticateTask homeIdentifier](self, "homeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setHomeID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithUUIDString:", v5);

  -[AMSAuthenticateTask setHomeIdentifier:](self, "setHomeIdentifier:", v6);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (AMSAuthenticateTaskDelegate)delegate
{
  return (AMSAuthenticateTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AMSAuthenticateOptions)options
{
  return self->_options;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)multiUserToken
{
  return self->_multiUserToken;
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (void)setRawPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
  objc_storeStrong((id *)&self->_DSID, a3);
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)setHomeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeIdentifier, a3);
}

- (NSUUID)homeUserIdentifier
{
  return self->_homeUserIdentifier;
}

- (void)setHomeUserIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeUserIdentifier, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDictionary)initialAuthenticationResults
{
  return self->_initialAuthenticationResults;
}

- (AMSMutablePromise)resultPromise
{
  return self->_resultPromise;
}

- (void)setResultPromise:(id)a3
{
  objc_storeStrong((id *)&self->_resultPromise, a3);
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_storeStrong((id *)&self->_errors, a3);
}

- (BOOL)isLocalAccountProvided
{
  return self->_isLocalAccountProvided;
}

- (void)setIsLocalAccountProvided:(BOOL)a3
{
  self->_isLocalAccountProvided = a3;
}

- (BOOL)isServerRequested
{
  return self->_isServerRequested;
}

- (void)setIsServerRequested:(BOOL)a3
{
  self->_isServerRequested = a3;
}

- (AMSAuthenticateMetricsProtocol)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_resultPromise, 0);
  objc_storeStrong((id *)&self->_initialAuthenticationResults, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_homeUserIdentifier, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_rawPassword, 0);
  objc_storeStrong((id *)&self->_multiUserToken, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
