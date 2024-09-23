@implementation AMSUIPaymentVerificationProtocolHandler

- (AMSUIPaymentVerificationProtocolHandler)initWithAccount:(id)a3 accountParameters:(id)a4
{
  id v7;
  id v8;
  AMSUIPaymentVerificationProtocolHandler *v9;
  AMSUIPaymentVerificationProtocolHandler *v10;
  uint64_t v11;
  NSMutableDictionary *accountParameters;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSUIPaymentVerificationProtocolHandler;
  v9 = -[AMSURLProtocolHandler init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    v11 = objc_msgSend(v8, "mutableCopy");
    accountParameters = v10->_accountParameters;
    v10->_accountParameters = (NSMutableDictionary *)v11;

  }
  return v10;
}

+ (id)requestAddingHeaders:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__AMSUIPaymentVerificationProtocolHandler_requestAddingHeaders_to___block_invoke;
  v8[3] = &unk_24CB506D0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

uint64_t __67__AMSUIPaymentVerificationProtocolHandler_requestAddingHeaders_to___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

+ (id)headersFromAccount:(id)a3 accountParameters:(id)a4
{
  if (a4)
    objc_msgSend(a1, "_headersFromAccountParameters:", a4);
  else
    objc_msgSend(a1, "_headersFromAccount:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_headersFromAccount:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[6];
  _QWORD v32[6];
  _BYTE buf[24];
  void *v34;
  uint64_t *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE08118], "deviceGUID");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v5, "ams_fetchGrandSlamTokenForAccount:withIdentifier:error:", v3, CFSTR("com.apple.gs.ams.pvkit"), &v26);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v26;

  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v8 = (void *)getAADeviceInfoClass_softClass;
  v30 = getAADeviceInfoClass_softClass;
  if (!getAADeviceInfoClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getAADeviceInfoClass_block_invoke;
    v34 = &unk_24CB4F3E8;
    v35 = &v27;
    __getAADeviceInfoClass_block_invoke((uint64_t)buf);
    v8 = (void *)v28[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v27, 8);
  objc_msgSend(v9, "currentInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientInfoHeader");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE0AD68], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueDeviceIdentifier");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v14 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2114;
      v34 = v7;
      _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to fetch GS Token from account %{public}@", buf, 0x20u);

    }
    v14 = &stru_24CB5A078;
  }
  v19 = *MEMORY[0x24BE07D90];
  v31[0] = *MEMORY[0x24BE07D80];
  v31[1] = v19;
  if (v11)
    v20 = v11;
  else
    v20 = &stru_24CB5A078;
  v32[0] = v14;
  v32[1] = v20;
  if (v13)
    v21 = v13;
  else
    v21 = &stru_24CB5A078;
  v22 = *MEMORY[0x24BE07D88];
  v31[2] = *MEMORY[0x24BE07D98];
  v31[3] = v22;
  if (v4)
    v23 = v4;
  else
    v23 = &stru_24CB5A078;
  v32[2] = v21;
  v32[3] = v23;
  v31[4] = CFSTR("X-Guid");
  v31[5] = CFSTR("X-Apple-Payment-Verification");
  v32[4] = v23;
  v32[5] = CFSTR("1");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)_headersFromAccountParameters:(id)a3
{
  void *v3;
  id v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  _QWORD v18[6];
  _QWORD v19[7];

  v19[6] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE08118];
  v4 = a3;
  objc_msgSend(v3, "deviceGUID");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18[0] = *MEMORY[0x24BE07D80];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gsToken"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_24CB5A078;
  v19[0] = v8;
  v18[1] = *MEMORY[0x24BE07D90];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mmeClientInfo"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_24CB5A078;
  v19[1] = v11;
  v18[2] = *MEMORY[0x24BE07D98];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceId"));
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v12;
  else
    v13 = &stru_24CB5A078;
  v14 = *MEMORY[0x24BE07D88];
  if (v5)
    v15 = v5;
  else
    v15 = &stru_24CB5A078;
  v19[2] = v13;
  v19[3] = v15;
  v18[3] = v14;
  v18[4] = CFSTR("X-Guid");
  v18[5] = CFSTR("X-Apple-Payment-Verification");
  v19[4] = v15;
  v19[5] = CFSTR("1");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (void)_setHeaders:(id)a3 on:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__AMSUIPaymentVerificationProtocolHandler__setHeaders_on___block_invoke;
  v7[3] = &unk_24CB506D0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __58__AMSUIPaymentVerificationProtocolHandler__setHeaders_on___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v7 = a5;
  v31 = *MEMORY[0x24BDAC8D0];
  v10 = (void *)MEMORY[0x24BE081D8];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v10, "sharedConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_opt_class();
    AMSLogKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v15;
    v29 = 2114;
    v30 = v16;
    _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding required headers to request", buf, 0x16u);

  }
  v26.receiver = self;
  v26.super_class = (Class)AMSUIPaymentVerificationProtocolHandler;
  -[AMSURLProtocolHandler reconfigureNewRequest:originalTask:redirect:error:](&v26, sel_reconfigureNewRequest_originalTask_redirect_error_, v12, v11, v7, a6);

  v17 = (void *)objc_opt_class();
  -[AMSUIPaymentVerificationProtocolHandler account](self, "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIPaymentVerificationProtocolHandler accountParameters](self, "accountParameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "headersFromAccount:accountParameters:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_setHeaders:on:", v20, v12);
  -[AMSUIPaymentVerificationProtocolHandler account](self, "account");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ams_DSID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forHTTPHeaderField:", v23, *MEMORY[0x24BE07D78]);

  -[AMSUIPaymentVerificationProtocolHandler account](self, "account");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "ams_altDSID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forHTTPHeaderField:", v25, *MEMORY[0x24BE07D68]);

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a6;
  v9 = (void *)MEMORY[0x24BE081D8];
  v10 = a5;
  objc_msgSend(v9, "sharedConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
    _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting GS token update", buf, 0x16u);

  }
  objc_msgSend(v10, "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v16, "setServiceIdentifier:", CFSTR("com.apple.gs.ams.pvkit"));
  -[AMSUIPaymentVerificationProtocolHandler account](self, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08018]), "initWithAccount:options:", v17, v16);
  objc_msgSend(v18, "performAuthKitUpdate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __99__AMSUIPaymentVerificationProtocolHandler_AMSURLSession_task_handleAuthenticateRequest_completion___block_invoke;
  v21[3] = &unk_24CB506F8;
  v21[4] = self;
  v22 = v8;
  v20 = v8;
  objc_msgSend(v19, "addFinishBlock:", v21);

}

void __99__AMSUIPaymentVerificationProtocolHandler_AMSURLSession_task_handleAuthenticateRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _BYTE v28[24];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "authenticationResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB98]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("com.apple.gs.ams.pvkit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "accountParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("gsToken"));

    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v28 = 138543874;
      *(_QWORD *)&v28[4] = v13;
      *(_WORD *)&v28[12] = 2114;
      *(_QWORD *)&v28[14] = v14;
      *(_WORD *)&v28[22] = 2112;
      v29 = v9;
      v15 = "%{public}@: [%{public}@] Received an updated GS token %@";
      v16 = v12;
      v17 = OS_LOG_TYPE_DEFAULT;
      v18 = 32;
LABEL_10:
      _os_log_impl(&dword_211102000, v16, v17, v15, v28, v18);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v28 = 138543618;
      *(_QWORD *)&v28[4] = v19;
      *(_WORD *)&v28[12] = 2114;
      *(_QWORD *)&v28[14] = v14;
      v15 = "%{public}@: [%{public}@] Unable to locate GS Token in auth result";
      v16 = v12;
      v17 = OS_LOG_TYPE_ERROR;
      v18 = 22;
      goto LABEL_10;
    }
  }

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject", *(_OWORD *)v28, *(_QWORD *)&v28[16], v29);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v28 = 138543874;
      *(_QWORD *)&v28[4] = v22;
      *(_WORD *)&v28[12] = 2114;
      *(_QWORD *)&v28[14] = v23;
      *(_WORD *)&v28[22] = 2114;
      v29 = v6;
      _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] token update error: %{public}@", v28, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v24 = objc_alloc(MEMORY[0x24BE08030]);
    objc_msgSend(v5, "account");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithAccount:", v25);

    (*(void (**)(_QWORD, void *, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v26, 0, v27);
  }

}

+ (id)_encoderWithBag:(id)a3 account:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (objc_class *)MEMORY[0x24BE083F8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithBag:", v7);

  objc_msgSend(v8, "setAccount:", v6);
  v9 = objc_alloc_init(MEMORY[0x24BE081B8]);
  objc_msgSend(v9, "setAuthenticationFallbackVisible:", 0);
  objc_msgSend(v9, "setDisplayAuthenticationReason:", 0);
  objc_msgSend(v9, "setStyle:", objc_msgSend(MEMORY[0x24BE081B8], "preferredAttestationStyle"));
  objc_msgSend(v9, "setPurpose:", 1);
  objc_msgSend(v8, "setKeychainOptions:", v9);

  return v8;
}

+ (id)_sessionWithBag:(id)a3 account:(id)a4 accountParameters:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  AMSUIPaymentVerificationProtocolHandler *v14;
  void *v15;

  v7 = (void *)MEMORY[0x24BDD1858];
  v8 = (void *)MEMORY[0x24BE08328];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "currentProcess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_configurationWithProcessInfo:bag:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[AMSUIPaymentVerificationProtocolHandler initWithAccount:accountParameters:]([AMSUIPaymentVerificationProtocolHandler alloc], "initWithAccount:accountParameters:", v10, v9);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08410]), "initWithConfiguration:delegate:delegateQueue:", v13, v14, 0);
  objc_msgSend(v15, "setProtocolHandler:", v14);

  return v15;
}

+ (id)_promiseToFetchURLResponseForAccount:(id)a3 accountParameters:(id)a4 url:(id)a5 bag:(id)a6 requestBody:(id)a7 bodyEncoding:(int64_t)a8 contentType:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;

  v14 = a6;
  v15 = a9;
  v16 = a7;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  +[AMSUIPaymentVerificationProtocolHandler _encoderWithBag:account:](AMSUIPaymentVerificationProtocolHandler, "_encoderWithBag:account:", v14, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v16)
    objc_msgSend(v20, "setRequestEncoding:", a8);
  +[AMSUIPaymentVerificationProtocolHandler _sessionWithBag:account:accountParameters:](AMSUIPaymentVerificationProtocolHandler, "_sessionWithBag:account:accountParameters:", v14, v19, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIPaymentVerificationProtocolHandler headersFromAccount:accountParameters:](AMSUIPaymentVerificationProtocolHandler, "headersFromAccount:accountParameters:", v19, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "requestWithMethod:URL:headers:parameters:", 4, v17, v23, v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __143__AMSUIPaymentVerificationProtocolHandler__promiseToFetchURLResponseForAccount_accountParameters_url_bag_requestBody_bodyEncoding_contentType___block_invoke;
  v29[3] = &unk_24CB50720;
  v30 = v15;
  v31 = v22;
  v25 = v22;
  v26 = v15;
  objc_msgSend(v24, "thenWithBlock:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

id __143__AMSUIPaymentVerificationProtocolHandler__promiseToFetchURLResponseForAccount_accountParameters_url_bag_requestBody_bodyEncoding_contentType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v5, CFSTR("Content-Type"));
  objc_msgSend(*(id *)(a1 + 40), "dataTaskPromiseWithRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_accountToUseFromGivenAccount:(id)a3 accountParameters:(id)a4 accountStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a5;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("altDsId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ams_iTunesAccountWithAltDSID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v9 = v11;
    }
    else
    {
      objc_msgSend(v8, "ams_activeiCloudAccount");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ams_altDSID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v10);

      if (v15)
      {
        objc_msgSend(v8, "ams_iTunesAccountForAccount:", v13);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (void *)v16;
        else
          v18 = v13;
        v9 = v18;

      }
      else
      {
        v9 = 0;
      }

    }
  }

  return v9;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSMutableDictionary)accountParameters
{
  return self->_accountParameters;
}

- (void)setAccountParameters:(id)a3
{
  objc_storeStrong((id *)&self->_accountParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountParameters, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
