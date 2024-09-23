@implementation AMSUIWebFetchAttestationVersionAction

- (AMSUIWebFetchAttestationVersionAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebFetchAttestationVersionAction *v8;
  void *v9;
  uint64_t v10;
  ACAccount *account;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebFetchAttestationVersionAction;
  v8 = -[AMSUIWebAction initWithJSObject:context:](&v13, sel_initWithJSObject_context_, v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iTunesAccountFromJSAccount:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    account = v8->_account;
    v8->_account = (ACAccount *)v10;

  }
  return v8;
}

- (id)runAction
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
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
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v26;
  objc_super v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)AMSUIWebFetchAttestationVersionAction;
  v3 = -[AMSUIWebAction runAction](&v27, sel_runAction);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v6;
    v32 = 2114;
    v33 = v7;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching current attestation version.", buf, 0x16u);

  }
  v8 = objc_alloc_init(MEMORY[0x24BE081B8]);
  objc_msgSend(v8, "setPurpose:", 0);
  objc_msgSend(v8, "setStyle:", objc_msgSend(MEMORY[0x24BE081B8], "preferredAttestationStyle"));
  v9 = (void *)MEMORY[0x24BE08080];
  -[AMSUIWebFetchAttestationVersionAction account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v9, "ACLVersionForAccount:options:error:", v10, v8, &v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v26;

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
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
      *(_DWORD *)buf = 138543874;
      v31 = v15;
      v32 = 2114;
      v33 = v16;
      v34 = 2114;
      v35 = v11;
      _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully fetched current attestation version. %{public}@", buf, 0x20u);

    }
    v17 = (void *)MEMORY[0x24BE08340];
    v28[0] = CFSTR("currentVersion");
    v28[1] = CFSTR("minimumVersions");
    v29[0] = v11;
    -[AMSUIWebFetchAttestationVersionAction minimumVersions](self, "minimumVersions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "promiseWithResult:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v12)
    {
      AMSError();
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v23;
      v32 = 2114;
      v33 = v24;
      v34 = 2114;
      v35 = v12;
      _os_log_impl(&dword_211102000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch current attestation version. %{public}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)minimumVersions
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (minimumVersions_ams_once_token___COUNTER__ != -1)
    dispatch_once(&minimumVersions_ams_once_token___COUNTER__, &__block_literal_global_22);
  v2 = (id)minimumVersions_ams_once_object___COUNTER__;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BE08080], "minimumACLVersionForAction:", objc_msgSend(v9, "integerValue", (_QWORD)v13));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v4, "objectForKey:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v10, v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

void __56__AMSUIWebFetchAttestationVersionAction_minimumVersions__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24CB8C1A0;
  v2[1] = &unk_24CB8C1B8;
  v3[0] = AMSUIWebBiometricsActionTypePrimaryTouchID;
  v3[1] = AMSUIWebBiometricsActionTypePrimaryFaceID;
  v2[2] = &unk_24CB8C1D0;
  v2[3] = &unk_24CB8C1E8;
  v3[2] = AMSUIWebBiometricsActionTypePrimarySecurityPreventReplay;
  v3[3] = AMSUIWebBiometricsActionTypePrimaryCardEnrollment;
  v2[4] = &unk_24CB8C200;
  v2[5] = &unk_24CB8C218;
  v3[4] = AMSUIWebBiometricsActionTypePrimaryPaymentDirectivePassword;
  v3[5] = AMSUIWebBiometricsActionTypePrimaryPaymentDirectivePasscode;
  v2[6] = &unk_24CB8C230;
  v2[7] = &unk_24CB8C248;
  v3[6] = AMSUIWebBiometricsActionTypeExtendedTouchID;
  v3[7] = AMSUIWebBiometricsActionTypeExtendedFaceID;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)minimumVersions_ams_once_object___COUNTER__;
  minimumVersions_ams_once_object___COUNTER__ = v0;

}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
