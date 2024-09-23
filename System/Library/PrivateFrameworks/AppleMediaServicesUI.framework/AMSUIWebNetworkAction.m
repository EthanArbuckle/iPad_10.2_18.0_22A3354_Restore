@implementation AMSUIWebNetworkAction

- (AMSUIWebNetworkAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebNetworkAction *v7;
  AMSUIWebNetworkAction *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  ACAccount *account;
  void *v13;
  void *v14;
  uint64_t v15;
  ACAccount *v16;
  void *v17;
  NSString *v18;
  NSString *body;
  void *v20;
  NSString *v21;
  NSString *gsTokenIdentifier;
  void *v23;
  NSDictionary *v24;
  NSDictionary *headers;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *v31;
  NSString *method;
  void *v33;
  void *v34;
  void *v35;
  NSString *v36;
  NSString *signatureData;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  NSURL *URL;
  objc_super v45;

  v6 = a3;
  v45.receiver = self;
  v45.super_class = (Class)AMSUIWebNetworkAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v45, sel_initWithJSObject_context_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[AMSUIWebAction context](v7, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iTunesAccountFromJSAccount:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    account = v8->_account;
    v8->_account = (ACAccount *)v11;

    if (!v8->_account)
    {
      -[AMSUIWebAction context](v8, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dsid"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "iTunesAccountFromJSDSID:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v8->_account;
      v8->_account = (ACAccount *)v15;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("body"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    body = v8->_body;
    v8->_body = v18;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gsTokenIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    gsTokenIdentifier = v8->_gsTokenIdentifier;
    v8->_gsTokenIdentifier = v21;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("headers"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;

    headers = v8->_headers;
    v8->_headers = v24;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("includeAuthKitTokens"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("includeAuthKitTokens"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_includeAuthKitTokens = objc_msgSend(v27, "BOOLValue");

    }
    else
    {
      v8->_includeAuthKitTokens = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("includeiCloudTokens"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("includeiCloudTokens"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_includeiCloudTokens = objc_msgSend(v29, "BOOLValue");

    }
    else
    {
      v8->_includeiCloudTokens = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("method"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;

    method = v8->_method;
    v8->_method = v31;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requiresCellularAccess"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requiresCellularAccess"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_requiresCellularAccess = objc_msgSend(v34, "BOOLValue");

    }
    else
    {
      v8->_requiresCellularAccess = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("signatureData"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v36 = v35;
    else
      v36 = 0;

    signatureData = v8->_signatureData;
    v8->_signatureData = v36;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("usePrimaryKeychain"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("usePrimaryKeychain"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_usePrimaryKeychain = objc_msgSend(v39, "BOOLValue");

    }
    else
    {
      v8->_usePrimaryKeychain = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v41 = v40;
    else
      v41 = 0;

    if (v41)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v41);
      v42 = objc_claimAutoreleasedReturnValue();
      URL = v8->_URL;
      v8->_URL = (NSURL *)v42;

    }
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
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  objc_class *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void **v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  _QWORD v64[5];
  _QWORD v65[5];
  _QWORD v66[5];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  objc_super v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE buf[24];
  void *v79;
  uint64_t *v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v73.receiver = self;
  v73.super_class = (Class)AMSUIWebNetworkAction;
  v3 = -[AMSUIWebAction runAction](&v73, sel_runAction);
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
    -[AMSUIWebNetworkAction URL](self, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    v79 = v9;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running network action for URL: %{public}@", buf, 0x20u);

  }
  -[AMSUIWebNetworkAction URL](self, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (v11)
  {
    v41 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "promiseWithError:", v25);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x24BDD16B0]);
    -[AMSUIWebNetworkAction URL](self, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithURL:", v13);

    -[AMSUIWebNetworkAction body](self, "body");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataUsingEncoding:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHTTPBody:", v16);

    -[AMSUIWebNetworkAction method](self, "method");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (const __CFString *)v17;
    else
      v19 = CFSTR("GET");
    objc_msgSend(v14, "setHTTPMethod:", v19);

    -[AMSUIWebNetworkAction headers](self, "headers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v71[0] = MEMORY[0x24BDAC760];
    v71[1] = 3221225472;
    v71[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke;
    v71[3] = &unk_24CB506D0;
    v22 = v14;
    v72 = v22;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v71);

    -[AMSUIWebAction context](self, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "additionalHeaders");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v21;
    v69[1] = 3221225472;
    v69[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke_2;
    v69[3] = &unk_24CB50978;
    v25 = v22;
    v70 = v25;
    objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v69);

    if (-[AMSUIWebNetworkAction includeAuthKitTokens](self, "includeAuthKitTokens"))
    {
      objc_msgSend(v25, "ak_addClientInfoHeader");
      objc_msgSend(v25, "ak_addPRKRequestHeader");
      v74 = 0;
      v75 = &v74;
      v76 = 0x2050000000;
      v26 = (void *)getAKAppleIDServerResourceLoadDelegateClass_softClass;
      v77 = getAKAppleIDServerResourceLoadDelegateClass_softClass;
      if (!getAKAppleIDServerResourceLoadDelegateClass_softClass)
      {
        *(_QWORD *)buf = v21;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getAKAppleIDServerResourceLoadDelegateClass_block_invoke;
        v79 = &unk_24CB4F3E8;
        v80 = &v74;
        __getAKAppleIDServerResourceLoadDelegateClass_block_invoke((uint64_t)buf);
        v26 = (void *)v75[3];
      }
      v27 = objc_retainAutorelease(v26);
      _Block_object_dispose(&v74, 8);
      v28 = objc_alloc_init(v27);
      objc_msgSend(v28, "setShouldSendSigningHeaders:", 1);
      objc_msgSend(v28, "signRequest:", v25);

    }
    if (-[AMSUIWebNetworkAction includeiCloudTokens](self, "includeiCloudTokens"))
    {
      -[AMSUIWebAction context](self, "context");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "account");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "accountStore");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebAction context](self, "context");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "account");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "ams_iCloudAccountForAccount:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "accountStore");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = 0;
      v75 = &v74;
      v76 = 0x2020000000;
      v36 = (void **)getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_ptr;
      v77 = getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_ptr;
      if (!getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_ptr)
      {
        *(_QWORD *)buf = v21;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_block_invoke;
        v79 = &unk_24CB4F3E8;
        v80 = &v74;
        __getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_block_invoke((uint64_t)buf);
        v36 = (void **)v75[3];
      }
      _Block_object_dispose(&v74, 8);
      if (!v36)
        getAIDAServiceTypeCloud_cold_1();
      v37 = *v36;
      v68 = 0;
      v38 = v37;
      objc_msgSend(v35, "ams_fetchGrandSlamTokenForAccount:withIdentifier:error:", v34, v38, &v68);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v68;

      if (v40 || !v39)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v43)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v43, "OSLogObject");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = objc_opt_class();
          AMSLogKey();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v45;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v46;
          *(_WORD *)&buf[22] = 2114;
          v79 = v40;
          _os_log_impl(&dword_211102000, v44, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch GS token. %{public}@", buf, 0x20u);

        }
      }
      else
      {
        objc_msgSend(v25, "setValue:forHTTPHeaderField:", v39, *MEMORY[0x24BE07D80]);
      }

    }
    v47 = objc_alloc(MEMORY[0x24BE083F8]);
    -[AMSUIWebAction context](self, "context");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bag");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v47, "initWithBag:", v49);

    -[AMSUIWebNetworkAction account](self, "account");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setAccount:", v51);

    -[AMSUIWebAction context](self, "context");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "clientInfo");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setClientInfo:", v53);

    objc_msgSend(v50, "setEnableRemoteSecuritySigning:", 1);
    AMSLogKey();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setLogUUID:", v54);

    -[AMSUIWebNetworkAction gsTokenIdentifier](self, "gsTokenIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setGsTokenIdentifier:", v55);

    v56 = objc_alloc_init(MEMORY[0x24BE081B8]);
    objc_msgSend(v56, "setPurpose:", -[AMSUIWebNetworkAction usePrimaryKeychain](self, "usePrimaryKeychain") ^ 1);
    objc_msgSend(v56, "setStyle:", objc_msgSend(MEMORY[0x24BE081B8], "preferredAttestationStyle"));
    objc_msgSend(v50, "setKeychainOptions:", v56);
    objc_msgSend(v50, "requestByEncodingRequest:parameters:", v25, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebNetworkAction signatureData](self, "signatureData");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v58;
    if (v58)
    {
      objc_msgSend(v58, "dataUsingEncoding:", 4);
      v66[0] = v21;
      v66[1] = 3221225472;
      v66[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke_42;
      v66[3] = &unk_24CB50720;
      v66[4] = self;
      v67 = (id)objc_claimAutoreleasedReturnValue();
      v60 = v67;
      objc_msgSend(v57, "thenWithBlock:", v66);
      v61 = objc_claimAutoreleasedReturnValue();

      v57 = (void *)v61;
    }
    v65[0] = v21;
    v65[1] = 3221225472;
    v65[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke_2_49;
    v65[3] = &unk_24CB519A0;
    v65[4] = self;
    objc_msgSend(v57, "thenWithBlock:", v65);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v21;
    v64[1] = 3221225472;
    v64[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke_3_52;
    v64[3] = &unk_24CB4F788;
    v64[4] = self;
    objc_msgSend(v62, "thenWithBlock:", v64);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v42;
}

uint64_t __34__AMSUIWebNetworkAction_runAction__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

uint64_t __34__AMSUIWebNetworkAction_runAction__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

id __34__AMSUIWebNetworkAction_runAction__block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mescalSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signData:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke_2_43;
  v18[3] = &unk_24CB51950;
  v8 = v3;
  v19 = v8;
  objc_msgSend(v6, "addSuccessBlock:", v18);
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke_3;
  v17[3] = &unk_24CB4F560;
  v17[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "addErrorBlock:", v17);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke_46;
  v14[3] = &unk_24CB51978;
  v9 = objc_alloc_init(MEMORY[0x24BE08340]);
  v15 = v9;
  v16 = v8;
  v10 = v8;
  objc_msgSend(v6, "addFinishBlock:", v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

void __34__AMSUIWebNetworkAction_runAction__block_invoke_2_43(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forHTTPHeaderField:", v3, *MEMORY[0x24BE07DE0]);

}

void __34__AMSUIWebNetworkAction_runAction__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to sign a request: %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

uint64_t __34__AMSUIWebNetworkAction_runAction__block_invoke_46(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

id __34__AMSUIWebNetworkAction_runAction__block_invoke_2_49(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v3, "ak_addClientInfoHeader");
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "action:didEncodeNetworkRequest:", *(_QWORD *)(a1 + 32), v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "_createSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataTaskPromiseWithRequest:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __34__AMSUIWebNetworkAction_runAction__block_invoke_3_52(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_addCookiesForResult:", v3);

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_sanitizeServerObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("body"));

  objc_msgSend(v3, "responseHeaders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("headers"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = objc_msgSend(v3, "responseStatusCode");

  objc_msgSend(v10, "numberWithInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("status"));

  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_createSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  -[AMSUIWebAction context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AMSUIWebNetworkAction requiresCellularAccess](self, "requiresCellularAccess"))
  {
    v5 = (void *)MEMORY[0x24BDD1858];
    -[AMSUIWebAction context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebAction context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_configurationWithProcessInfo:bag:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "set_CTDataConnectionServiceType:", *MEMORY[0x24BDC2A68]);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE08410]), "initWithConfiguration:", v10);

    v4 = (void *)v11;
  }
  return v4;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (NSString)gsTokenIdentifier
{
  return self->_gsTokenIdentifier;
}

- (void)setGsTokenIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_gsTokenIdentifier, a3);
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_headers, a3);
}

- (BOOL)includeAuthKitTokens
{
  return self->_includeAuthKitTokens;
}

- (void)setIncludeAuthKitTokens:(BOOL)a3
{
  self->_includeAuthKitTokens = a3;
}

- (BOOL)includeiCloudTokens
{
  return self->_includeiCloudTokens;
}

- (void)setIncludeiCloudTokens:(BOOL)a3
{
  self->_includeiCloudTokens = a3;
}

- (NSString)method
{
  return self->_method;
}

- (void)setMethod:(id)a3
{
  objc_storeStrong((id *)&self->_method, a3);
}

- (BOOL)requiresCellularAccess
{
  return self->_requiresCellularAccess;
}

- (void)setRequiresCellularAccess:(BOOL)a3
{
  self->_requiresCellularAccess = a3;
}

- (NSString)signatureData
{
  return self->_signatureData;
}

- (void)setSignatureData:(id)a3
{
  objc_storeStrong((id *)&self->_signatureData, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (BOOL)usePrimaryKeychain
{
  return self->_usePrimaryKeychain;
}

- (void)setUsePrimaryKeychain:(BOOL)a3
{
  self->_usePrimaryKeychain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_gsTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
