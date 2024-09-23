@implementation AMSAuthorizeMachineTask

- (AMSAuthorizeMachineTask)initWithAccount:(id)a3 authorizeReason:(unint64_t)a4 bag:(id)a5
{
  id v9;
  id v10;
  AMSAuthorizeMachineTask *v11;
  AMSAuthorizeMachineTask *v12;
  uint64_t v13;
  NSString *logKey;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AMSAuthorizeMachineTask;
  v11 = -[AMSTask init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_validAccount, a3);
    v12->_authorizeReason = a4;
    objc_storeStrong((id *)&v12->_bag, a5);
    AMSGenerateLogCorrelationKey();
    v13 = objc_claimAutoreleasedReturnValue();
    logKey = v12->_logKey;
    v12->_logKey = (NSString *)v13;

  }
  return v12;
}

- (AMSAuthorizeMachineTask)initWithUsername:(id)a3 authorizeReason:(unint64_t)a4 bag:(id)a5 presentationDelegate:(id)a6
{
  id v10;
  id v11;
  AMSAuthorizeMachineTask *v12;
  AMSAuthenticateOptions *v13;
  AMSAuthenticateRequest *v14;
  void *v15;
  AMSAuthenticateRequest *authenticateRequest;

  v10 = a3;
  v11 = a6;
  v12 = -[AMSAuthorizeMachineTask initWithAccount:authorizeReason:bag:](self, "initWithAccount:authorizeReason:bag:", 0, a4, a5);
  if (v12)
  {
    v13 = objc_alloc_init(AMSAuthenticateOptions);
    -[AMSAuthenticateOptions setAuthenticationType:](v13, "setAuthenticationType:", 2);
    -[AMSAuthenticateOptions setCanMakeAccountActive:](v13, "setCanMakeAccountActive:", 0);
    -[AMSAuthenticateOptions setCredentialSource:](v13, "setCredentialSource:", 2);
    -[AMSAuthenticateOptions setDebugReason:](v13, "setDebugReason:", CFSTR("Apple ID authentication for machine task authorization"));
    v14 = -[AMSAuthenticateRequest initWithDSID:altDSID:username:options:]([AMSAuthenticateRequest alloc], "initWithDSID:altDSID:username:options:", 0, 0, v10, v13);
    -[AMSAuthorizeMachineTask logKey](v12, "logKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateRequest setLogKey:](v14, "setLogKey:", v15);

    authenticateRequest = v12->_authenticateRequest;
    v12->_authenticateRequest = v14;

    objc_storeWeak((id *)&v12->_presentationDelegate, v11);
  }

  return v12;
}

- (id)performDeauthorization
{
  self->_deauthorize = 1;
  return -[AMSAuthorizeMachineTask _performAuthorization](self, "_performAuthorization");
}

- (id)_performAuthorization
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[AMSAuthorizeMachineTask _checkRequestThrottle](self, "_checkRequestThrottle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__AMSAuthorizeMachineTask__performAuthorization__block_invoke;
  v7[3] = &unk_1E253E440;
  v7[4] = self;
  objc_msgSend(v3, "thenWithBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "binaryPromiseAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __48__AMSAuthorizeMachineTask__performAuthorization__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "_buildRequestTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AMSAuthorizeMachineTask__performAuthorization__block_invoke_2;
  v5[3] = &unk_1E253E418;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "thenWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __48__AMSAuthorizeMachineTask__performAuthorization__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  AMSLogKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("keybag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
    goto LABEL_13;
  }
  v8 = v7;

  if (!v8)
  {
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  +[AMSKeybag sharedInstance](AMSKeybag, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v9, "importKeybagWithData:error:", v8, &v16);
  v10 = v16;

  if (v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      v19 = 2114;
      v20 = v3;
      v21 = 2114;
      v22 = v10;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to import keybag data error: %{public}@", buf, 0x20u);
    }

  }
LABEL_14:
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("AMSAuthorizeMachine");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;

  v8 = a6;
  v9 = a5;
  -[AMSAuthorizeMachineTask presentationDelegate](self, "presentationDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleAuthenticateRequest:completion:", v9, v8);

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;

  v8 = a6;
  v9 = a5;
  -[AMSAuthorizeMachineTask presentationDelegate](self, "presentationDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleDialogRequest:completion:", v9, v8);

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  void (**v6)(id, _QWORD, id);
  id v7;

  if (a6)
  {
    v6 = (void (**)(id, _QWORD, id))a6;
    AMSError(12, CFSTR("Engagement request not supported"), CFSTR("Engagement request not supported on authorize machine calls."), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);

  }
}

- (id)_buildRequest
{
  void *v3;
  id v4;
  AMSURLRequestEncoder *v5;
  void *v6;
  AMSURLRequestEncoder *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  __CFString **v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;

  v18 = 0;
  -[AMSAuthorizeMachineTask _buildRequestParametersWithError:](self, "_buildRequestParametersWithError:", &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;
  if (v3)
  {
    v5 = [AMSURLRequestEncoder alloc];
    -[AMSAuthorizeMachineTask bag](self, "bag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AMSURLRequestEncoder initWithBag:](v5, "initWithBag:", v6);

    -[AMSAuthorizeMachineTask validAccount](self, "validAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setAccount:](v7, "setAccount:", v8);

    -[AMSAuthorizeMachineTask clientInfo](self, "clientInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setClientInfo:](v7, "setClientInfo:", v9);

    -[AMSURLRequestEncoder setAnisetteType:](v7, "setAnisetteType:", 1);
    -[AMSAuthorizeMachineTask bag](self, "bag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AMSAuthorizeMachineTask isDeauthorize](self, "isDeauthorize");
    v12 = AMSBagKeyDeauthorizeMachineURL;
    if (!v11)
      v12 = AMSBagKeyAuthorizeMachineURL;
    objc_msgSend(v10, "URLForKey:", *v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSURLRequestEncoder requestWithMethod:bagURL:parameters:](v7, "requestWithMethod:bagURL:parameters:", 4, v13, v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__AMSAuthorizeMachineTask__buildRequest__block_invoke;
    v17[3] = &unk_1E253DB08;
    v17[4] = self;
    objc_msgSend(v14, "thenWithBlock:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

id __40__AMSAuthorizeMachineTask__buildRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "setCachePolicy:", 1);
  objc_msgSend(*(id *)(a1 + 32), "familyMemberAccountDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v6, CFSTR("X-FM-Dsid"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "authorizeReason") == 2)
    objc_msgSend(v3, "setTimeoutInterval:", 15.0);
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_buildRequestParametersWithError:(id *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  __CFString *v15;
  __CFString *v16;
  unint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  id v20;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[AMSAuthorizeMachineTask authorizeReason](self, "authorizeReason") == 2)
    v6 = 8;
  else
    v6 = 1;
  -[AMSAuthorizeMachineTask validAccount](self, "validAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthorizeMachineTask _keybagSyncStringForAccount:withTransactionType:error:](self, "_keybagSyncStringForAccount:withTransactionType:error:", v7, v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("kbsync"));
    +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uppercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("guid"));

    +[AMSDevice deviceName](AMSDevice, "deviceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("machineName"));

    -[AMSAuthorizeMachineTask validAccount](self, "validAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ams_DSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("ownerDsid"));

    v14 = -[AMSAuthorizeMachineTask authorizeReason](self, "authorizeReason");
    if (v14 == 1)
      v15 = CFSTR("family");
    else
      v15 = 0;
    if (v14 == 2)
      v15 = CFSTR("refetch");
    if (v15)
    {
      v16 = v15;
      v17 = -[AMSAuthorizeMachineTask authorizeReason](self, "authorizeReason");
      if (v17 == 1)
        v18 = CFSTR("family");
      else
        v18 = 0;
      if (v17 == 2)
        v19 = CFSTR("refetch");
      else
        v19 = v18;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("reason"));

    }
    v20 = v5;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_authenticate
{
  uint64_t v3;
  void *v4;
  void *v5;
  AMSPromise *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[5];

  -[AMSAuthorizeMachineTask presentationDelegate](self, "presentationDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[AMSAuthorizeMachineTask authenticateRequest](self, "authenticateRequest"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = objc_alloc_init(AMSPromise);
    -[AMSAuthorizeMachineTask presentationDelegate](self, "presentationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthorizeMachineTask authenticateRequest](self, "authenticateRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPromise completionHandlerAdapter](v6, "completionHandlerAdapter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleAuthenticateRequest:completion:", v8, v9);

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40__AMSAuthorizeMachineTask__authenticate__block_invoke;
    v13[3] = &unk_1E253E238;
    v13[4] = self;
    -[AMSPromise addFinishBlock:](v6, "addFinishBlock:", v13);
    return v6;
  }
  else
  {
    AMSError(12, CFSTR("Interactive Authorization Failed"), CFSTR("Could not present authenticate request, presentation delegate not set"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
}

void __40__AMSAuthorizeMachineTask__authenticate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
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
      objc_msgSend(*(id *)(a1 + 32), "logKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Machine authorization/deauthorization account authentication failed: %{public}@", (uint8_t *)&v10, 0x16u);

    }
    goto LABEL_9;
  }
  if (v5)
  {
    objc_msgSend(v5, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setValidAccount:", v7);
LABEL_9:

  }
}

- (id)_buildRequestTask
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  -[AMSAuthorizeMachineTask authenticateRequest](self, "authenticateRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    -[AMSAuthorizeMachineTask _authenticate](self, "_authenticate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __44__AMSAuthorizeMachineTask__buildRequestTask__block_invoke;
    v10[3] = &unk_1E253E468;
    v10[4] = self;
    objc_msgSend(v5, "thenWithBlock:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AMSAuthorizeMachineTask _buildRequest](self, "_buildRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __44__AMSAuthorizeMachineTask__buildRequestTask__block_invoke_2;
  v9[3] = &unk_1E253DB08;
  v9[4] = self;
  objc_msgSend(v6, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __44__AMSAuthorizeMachineTask__buildRequestTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_buildRequest");
}

id __44__AMSAuthorizeMachineTask__buildRequestTask__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  AMSURLSession *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v3 = a2;
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AMSURLSession initWithConfiguration:delegate:delegateQueue:]([AMSURLSession alloc], "initWithConfiguration:delegate:delegateQueue:", v5, *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(a1 + 32), "setSession:", v6);

  v7 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__AMSAuthorizeMachineTask__buildRequestTask__block_invoke_3;
  v12[3] = &unk_1E253E490;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "setReconfigureRequestHandler:", v12);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProtocolHandler:", v7);

  objc_msgSend(*(id *)(a1 + 32), "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataTaskPromiseWithRequest:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __44__AMSAuthorizeMachineTask__buildRequestTask__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v18 = 0;
  objc_msgSend(v4, "_buildRequestParametersWithError:", &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  if (v5)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 100, 0, &v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "logKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v7, "length");
        *(_DWORD *)buf = 138543618;
        v20 = v12;
        v21 = 2048;
        v22 = v13;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting updated request parameters for authorization/deauthorization, %lu bytes", buf, 0x16u);

      }
      objc_msgSend(v3, "setHTTPBody:", v7);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject stringValue](v10, "stringValue");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forHTTPHeaderField:", v14, CFSTR("Content-Length"));
    }
    else
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v10, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "logKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        v21 = 2114;
        v22 = (uint64_t)v8;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Serializing reconfigured request parameters for authorization/deauthorization failed: %{public}@", buf, 0x16u);

      }
    }

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "logKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2114;
      v22 = (uint64_t)v6;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Building reconfigured request parameters for authorization/deauthorization failed: %{public}@", buf, 0x16u);

    }
    v8 = v6;
  }

}

- (id)_checkRequestThrottle
{
  void *v3;
  void *v4;
  void *v5;

  if (-[AMSAuthorizeMachineTask isDeauthorize](self, "isDeauthorize"))
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSBagProtocol integerForKey:](self->_bag, "integerForKey:", 0x1E254C660);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valuePromise");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "thenWithBlock:", &__block_literal_global_12);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

id __48__AMSAuthorizeMachineTask__checkRequestThrottle__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  v3 = objc_msgSend(v2, "integerValue");
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_1_1);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemUptime");
  v6 = (uint64_t)v5;

  if (v6 - qword_1ECEACA48 >= v3)
  {
    qword_1ECEACA48 = v6;
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_1_1);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_1_1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Previous request was within %@s of this one"), v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(308, CFSTR("Request Throttled"), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_keybagSyncStringForAccount:(id)a3 withTransactionType:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v6 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[AMSKeybag sharedInstance](AMSKeybag, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_DSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = &unk_1E25AF008;
  v19 = 0;
  objc_msgSend(v8, "keybagSyncDataWithAccountID:transactionType:error:", v10, v6, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;

  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v15;
      v22 = 2114;
      v23 = v16;
      v24 = 2114;
      v25 = v12;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain keybag data for account error: %{public}@", buf, 0x20u);

    }
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }
  objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (ACAccount)validAccount
{
  return self->_validAccount;
}

- (void)setValidAccount:(id)a3
{
  objc_storeStrong((id *)&self->_validAccount, a3);
}

- (unint64_t)authorizeReason
{
  return self->_authorizeReason;
}

- (void)setAuthorizeReason:(unint64_t)a3
{
  self->_authorizeReason = a3;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSNumber)familyMemberAccountDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFamilyMemberAccountDSID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (AMSRequestPresentationDelegate)presentationDelegate
{
  return (AMSRequestPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (AMSAuthenticateRequest)authenticateRequest
{
  return self->_authenticateRequest;
}

- (void)setAuthenticateRequest:(id)a3
{
  objc_storeStrong((id *)&self->_authenticateRequest, a3);
}

- (BOOL)isDeauthorize
{
  return self->_deauthorize;
}

- (void)setDeauthorize:(BOOL)a3
{
  self->_deauthorize = a3;
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_authenticateRequest, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_familyMemberAccountDSID, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_validAccount, 0);
}

@end
