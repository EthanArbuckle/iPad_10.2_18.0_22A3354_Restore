@implementation AMSFinanceAuthenticateResponse

- (AMSFinanceAuthenticateResponse)initWithResponseDictionary:(id)a3 taskInfo:(id)a4
{
  id v6;
  id v7;
  AMSFinanceAuthenticateResponse *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *dialogDictionary;
  AMSFinanceDialogResponse *v12;
  AMSFinanceDialogResponse *dialogResponse;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  AMSAuthenticateRequest *authenticateRequest;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)AMSFinanceAuthenticateResponse;
  v8 = -[AMSFinanceAuthenticateResponse init](&v23, sel_init);
  if (v8)
  {
    +[AMSFinanceResponse valueForProtocolKey:inResponse:](AMSFinanceResponse, "valueForProtocolKey:inResponse:", CFSTR("dialog"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    dialogDictionary = v8->_dialogDictionary;
    v8->_dialogDictionary = v10;

    if (v8->_dialogDictionary)
    {
      v12 = -[AMSFinanceDialogResponse initWithResponseDictionary:kind:taskInfo:]([AMSFinanceDialogResponse alloc], "initWithResponseDictionary:kind:taskInfo:", v6, 2, v7);
      dialogResponse = v8->_dialogResponse;
      v8->_dialogResponse = v12;

    }
    v14 = (void *)objc_opt_class();
    objc_msgSend(v7, "response");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "authenticationTypeForResponse:responseDictionary:", v15, v6);

    v17 = (void *)objc_opt_class();
    objc_msgSend(v7, "response");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_serviceIdentifierForResponse:taskInfo:", v18, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_authenticateRequestWithAuthType:taskInfo:dialogResponse:serviceIdentifier:", v16, v7, v8->_dialogResponse, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    authenticateRequest = v8->_authenticateRequest;
    v8->_authenticateRequest = (AMSAuthenticateRequest *)v20;

  }
  return v8;
}

+ (unint64_t)authenticationTypeForResponse:(id)a3 responseDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-Allow-Auth-Types"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "containsObject:", CFSTR("loud"));
  v12 = objc_msgSend(v10, "containsObject:", CFSTR("silent"));
  v13 = objc_msgSend(v6, "ams_statusCode");

  if (v13 != 401)
  {
    if ((v12 & 1) == 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("failureType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("failureType"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "longLongValue");

        if (v18 == 2002)
          goto LABEL_12;
      }
      else
      {

      }
      v15 = 2;
      goto LABEL_15;
    }
LABEL_12:
    v15 = 0;
    goto LABEL_15;
  }
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12)
    v14 = 1;
  if (v11)
    v14 = 2;
  if ((v11 & v12 & 1) != 0)
    v15 = 0;
  else
    v15 = v14;
LABEL_15:

  return v15;
}

+ (id)performAuthFromResponse:(id)a3 taskInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
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

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "authenticationTypeForResponse:responseDictionary:", v6, 0);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v8;
    objc_msgSend((id)objc_opt_class(), "_serviceIdentifierForResponse:taskInfo:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_authenticateRequestWithAuthType:taskInfo:dialogResponse:serviceIdentifier:", v11, v7, 0, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "properties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringForKey:", 0x1E254D300);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueWithError:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v6, "ams_valueForHTTPHeaderField:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v12, "options");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setServiceTokenOnly:", 1);

      }
    }
    objc_msgSend(v6, "ams_valueForHTTPHeaderField:", CFSTR("Location"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(a1, "_performAuthRequest:actionResult:redirectURL:taskInfo:", v12, 0, v20, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)performWithTaskInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AMSDialogResult *v7;
  void *v8;
  void *v9;
  void *v10;
  AMSDialogResult *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  -[AMSFinanceAuthenticateResponse dialogResponse](self, "dialogResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFinanceAuthenticateResponse _locateActionableButtonUsingDialogResponse:](self, "_locateActionableButtonUsingDialogResponse:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [AMSDialogResult alloc];
  -[AMSFinanceAuthenticateResponse dialogResponse](self, "dialogResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dialogRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AMSDialogResult initWithOriginalRequest:selectedActionIdentifier:](v7, "initWithOriginalRequest:selectedActionIdentifier:", v9, v10);

  objc_msgSend(v6, "deepLink");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "ams_rawURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(v6, "deepLink");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v15;

  }
  v16 = (void *)objc_opt_class();
  -[AMSFinanceAuthenticateResponse authenticateRequest](self, "authenticateRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_performSyncAuthRequest:actionResult:redirectURL:taskInfo:", v17, v11, v12, v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_authenticateRequestWithAuthType:(unint64_t)a3 taskInfo:(id)a4 dialogResponse:(id)a5 serviceIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  AMSAuthenticateOptions *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  AMSAuthenticateRequest *v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  unint64_t v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v9, "properties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "dialogOptions") & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(v9, "properties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "dialogOptions");

    if ((v14 & 4) == 0)
      goto LABEL_10;
  }
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
    v17 = (void *)objc_opt_class();
    v64 = v17;
    objc_msgSend(v9, "properties");
    v18 = v11;
    v19 = v9;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logUUID");
    v21 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v72 = v17;
    v73 = 2114;
    v74 = v22;
    v75 = 2048;
    v76 = a3;
    v77 = 2048;
    v78 = 1;
    _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overriding the authentication type. originalAuthenticationType = %lu | newAuthenticationType = %lu", buf, 0x2Au);

    v10 = v21;
    v9 = v19;
    v11 = v18;

  }
  a3 = 1;
LABEL_10:
  v23 = objc_alloc_init(AMSAuthenticateOptions);
  -[AMSAuthenticateOptions setAuthenticationType:](v23, "setAuthenticationType:", a3);
  -[AMSAuthenticateOptions setAllowServerDialogs:](v23, "setAllowServerDialogs:", a3 != 1);
  -[AMSAuthenticateOptions setAllowSecondaryCredentialSource:](v23, "setAllowSecondaryCredentialSource:", 0);
  -[AMSAuthenticateOptions setCanMakeAccountActive:](v23, "setCanMakeAccountActive:", 0);
  objc_msgSend(v9, "properties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "clientInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v9, "properties");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "clientInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateOptions setClientInfo:](v23, "setClientInfo:", v27);

  }
  v65 = v11;
  -[AMSAuthenticateOptions setServiceIdentifier:](v23, "setServiceIdentifier:", v11);
  if (v10)
  {
    objc_msgSend(v10, "dialogRequest");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "title");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateOptions setPromptTitle:](v23, "setPromptTitle:", v29);

    objc_msgSend(v10, "dialogRequest");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "message");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateOptions setReason:](v23, "setReason:", v31);

    v62 = v10;
    v32 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "response");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "URL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v9;
    v37 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v36, "response");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "ams_statusCode"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v36;
    objc_msgSend(v36, "response");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-Jingle-Correlation-Key"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("url: %@; status: %@; correlation: %@"), v35, v39, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateOptions setDebugReason:](v23, "setDebugReason:", v43);

    v10 = v62;
    objc_msgSend(v62, "dialogRequest");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "buttonActions");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v45, "count") <= 2)
    {
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v46 = v45;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v67;
        while (2)
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v67 != v49)
              objc_enumerationMutation(v46);
            v51 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
            if (objc_msgSend(v51, "ams_actionType") && objc_msgSend(v51, "ams_actionType") != 6)
            {
              objc_msgSend(v51, "title");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              -[AMSAuthenticateOptions setDefaultButtonString:](v23, "setDefaultButtonString:", v52);

              goto LABEL_26;
            }
          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
          if (v48)
            continue;
          break;
        }
      }
LABEL_26:

    }
    v9 = v63;
  }
  else
  {
    -[AMSAuthenticateOptions setDebugReason:](v23, "setDebugReason:", CFSTR("no dialogResponse in AMSFinanceAuthenticateResponse"));
  }
  objc_msgSend(v9, "properties");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "account");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "ams_isLocalAccount");

  if ((v55 & 1) != 0)
  {
    v56 = 0;
  }
  else
  {
    objc_msgSend(v9, "properties");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "account");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v58 = -[AMSAuthenticateRequest initWithAccount:options:]([AMSAuthenticateRequest alloc], "initWithAccount:options:", v56, v23);
  objc_msgSend(v9, "properties");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "logUUID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateRequest setLogKey:](v58, "setLogKey:", v60);

  -[AMSAuthenticateRequest setIsServerRequested:](v58, "setIsServerRequested:", 1);
  return v58;
}

- (id)_locateActionableButtonUsingDialogResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "dialogRequest", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
      if (objc_msgSend(v11, "ams_actionType"))
      {
        v12 = v11;

        v8 = v12;
      }
      if (objc_msgSend(v11, "ams_actionType") == 1)
      {
        objc_msgSend(v11, "ams_subtarget");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsString:", CFSTR("signup"));

        if (!v15)
          break;
      }
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_performAuthRequest:(id)a3 actionResult:(id)a4 redirectURL:(id)a5 taskInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(a1, "_presentAuthRequest:taskInfo:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __88__AMSFinanceAuthenticateResponse__performAuthRequest_actionResult_redirectURL_taskInfo___block_invoke;
  v21[3] = &unk_1E2541F00;
  v25 = v13;
  v26 = a1;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  objc_msgSend(v14, "continueWithBlock:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __88__AMSFinanceAuthenticateResponse__performAuthRequest_actionResult_redirectURL_taskInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 64), "_handleAuthResult:authError:originalRequest:actionResult:redirectURL:taskInfo:", a2, a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (id)_performSyncAuthRequest:(id)a3 actionResult:(id)a4 redirectURL:(id)a5 taskInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "_presentAuthRequest:taskInfo:", v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v14, "resultWithError:", &v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;

  objc_msgSend((id)objc_opt_class(), "_handleAuthResult:authError:originalRequest:actionResult:redirectURL:taskInfo:", v15, v16, v13, v12, v11, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "resultWithError:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "value");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_handleAuthResult:(id)a3 authError:(id)a4 originalRequest:(id)a5 actionResult:(id)a6 redirectURL:(id)a7 taskInfo:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  id v55;
  void *v56;
  const char *v57;
  NSObject *v58;
  os_log_type_t v59;
  uint64_t v60;
  void *v61;
  int64_t v62;
  void *v63;
  AMSOptional *v64;
  void *v65;
  id v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  uint8_t buf[4];
  uint64_t v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v76 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v75 = a7;
  v17 = a8;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v18, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v76;
  v73 = v15;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_opt_class();
    v69 = v16;
    v22 = v21;
    objc_msgSend(v17, "properties");
    v23 = a1;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "logUUID");
    v25 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v79 = (uint64_t)v21;
    v80 = 2114;
    v81 = v26;
    v82 = 1024;
    LODWORD(v83) = v76 != 0;
    _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authentication finished (success: %d)", buf, 0x1Cu);

    v17 = v25;
    a1 = v23;

    v15 = v73;
    v16 = v69;
  }

  v74 = v14;
  if (v14)
  {
    objc_msgSend(a1, "_handleDialogFromAuthError:taskInfo:", v14, v17);
    +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v29 = v27;
      if (objc_msgSend(v27, "actionType"))
        goto LABEL_39;
    }
  }
  else
  {
    objc_msgSend(a1, "_updateTaskWithAuthedAccount:taskInfo:", v76, v17);
    objc_msgSend(a1, "_updateTaskWithLastCredentialSource:taskInfo:", v76, v17);
    v28 = 0;
  }
  v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v16, "originalRequest");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "selectedActionIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "locateActionWithIdentifier:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = v33;
  if (objc_msgSend(v33, "ams_URLType") == 1 || objc_msgSend(v33, "ams_actionType") == 5)
  {
    +[AMSFinanceDialogResponse handleDialogResult:taskInfo:](AMSFinanceDialogResponse, "handleDialogResult:taskInfo:", v16, v17);
    v34 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v75)
      +[AMSURLAction redirectActionWithURL:](AMSURLAction, "redirectActionWithURL:");
    else
      +[AMSURLAction retryAction](AMSURLAction, "retryAction");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v34;

  objc_msgSend(v29, "setRetryIdentifier:", 0x1E254B620);
  objc_msgSend(v29, "setReason:", CFSTR("authentication"));
  objc_msgSend(v29, "setDialogResult:", v16);
  objc_msgSend(v29, "setAuthenticateResult:", v76);
  objc_msgSend(v15, "options");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "serviceIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v68 = v36;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v37, "OSLogObject");
    v38 = objc_claimAutoreleasedReturnValue();
    v67 = v17;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_opt_class();
      AMSLogKey();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "authKitUpdateResult");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "authenticationResults");
      v70 = v16;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "ak_redactedCopy");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v79 = v39;
      v20 = v76;
      v80 = 2114;
      v81 = v40;
      v82 = 2112;
      v83 = v68;
      v84 = 2112;
      v85 = v44;
      _os_log_impl(&dword_18C849000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Auth request service identifier: %@. Authentication results: %@", buf, 0x2Au);

      v16 = v70;
    }

    objc_msgSend(MEMORY[0x1E0CFAC38], "currentInfo");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "clientInfoHeader");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSDevice uniqueDeviceId](AMSDevice, "uniqueDeviceId");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "authKitUpdateResult");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "authenticationResults");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF70]);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v49 = v48;
    else
      v49 = 0;
    v36 = v68;

    objc_msgSend(v49, "objectForKeyedSubscript:", v68);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v77, CFSTR("X-MMe-Client-Info"));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v71, CFSTR("X-Mme-Device-Id"));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v50, CFSTR("X-Apple-GS-Token"));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v68, CFSTR("X-Apple-GS-Token-Identifier"));
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v51;
    if (v50)
    {
      if (!v51)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v52, "OSLogObject");
      v53 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      v54 = objc_opt_class();
      AMSLogKey();
      v55 = v16;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v79 = v54;
      v80 = 2114;
      v81 = v56;
      v82 = 2112;
      v83 = v50;
      v57 = "%{public}@: [%{public}@] Received an updated GrandSlam token %@";
      v58 = v53;
      v59 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (!v51)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v52, "OSLogObject");
      v53 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      v60 = objc_opt_class();
      AMSLogKey();
      v55 = v16;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v79 = v60;
      v80 = 2114;
      v81 = v56;
      v82 = 2112;
      v83 = v20;
      v57 = "%{public}@: [%{public}@] Unable to locate GrandSlam token in auth result: %@";
      v58 = v53;
      v59 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_18C849000, v58, v59, v57, buf, 0x20u);

    v16 = v55;
    v36 = v68;
LABEL_34:

    v15 = v73;
    v17 = v67;
  }
  objc_msgSend(v20, "account");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = +[AMSBiometrics stateForAccount:](AMSBiometrics, "stateForAccount:", v61);

  if (v20 && v62 == 1)
    objc_msgSend(v30, "setObject:forKeyedSubscript:", 0x1E254D740, CFSTR("X-Apple-TID-Action"));
  v63 = (void *)objc_msgSend(v30, "copy");
  objc_msgSend(v29, "setUpdatedHeaders:", v63);

LABEL_39:
  v64 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v29);
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  return v65;
}

+ (void)_handleDialogFromAuthError:(id)a3 taskInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateErrorDialog"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;

    if (v9)
    {
LABEL_7:
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
        v16 = (void *)objc_opt_class();
        v17 = v16;
        objc_msgSend(v6, "properties");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v16;
        v23 = 2114;
        v24 = v19;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authentication returned a dialog.", (uint8_t *)&v21, 0x16u);

      }
      v20 = +[AMSFinanceDialogResponse performFinanceDialog:taskInfo:](AMSFinanceDialogResponse, "performFinanceDialog:taskInfo:", v9, v6);

      goto LABEL_13;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateErrorDialog"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_13;
  }
  v9 = v13;

  if (v9)
    goto LABEL_7;
LABEL_13:

}

+ (id)_presentAuthRequest:(id)a3 taskInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  AMSPromise *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();
  v10 = objc_opt_respondsToSelector();
  if ((v9 & 1) != 0 || (v10 & 1) != 0)
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
      v20 = (void *)objc_opt_class();
      v30 = v20;
      objc_msgSend(v6, "properties");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v20;
      v34 = 2114;
      v35 = v22;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing authentication", buf, 0x16u);

    }
    v17 = objc_alloc_init(AMSPromise);
    if ((v9 & 1) != 0)
    {
      objc_msgSend(v6, "task");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPromise completionHandlerAdapter](v17, "completionHandlerAdapter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "AMSURLSession:task:handleAuthenticateRequest:completion:", v7, v16, v5, v23);

    }
    else
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_opt_class();
        v31 = v26;
        objc_msgSend(v6, "properties");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logUUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        v34 = 2114;
        v35 = v28;
        _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Calling legacy delegate for authentication handling", buf, 0x16u);

      }
      -[AMSPromise completionHandlerAdapter](v17, "completionHandlerAdapter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "AMSURLSession:handleAuthenticateRequest:completion:", v7, v5, v16);
    }
  }
  else
  {
    AMSErrorWithFormat(2, CFSTR("Finance Authentication Error"), CFSTR("No delegate to perform authentication: %@"), v11, v12, v13, v14, v15, (uint64_t)v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v16);
    v17 = (AMSPromise *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

+ (id)_serviceIdentifierForResponse:(id)a3 taskInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v52;
  id v53;
  id v54;
  void *v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
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
    v9 = (void *)objc_opt_class();
    v10 = v9;
    objc_msgSend(v6, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v57 = v9;
    v58 = 2114;
    v59 = v12;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Getting service identifier from response", buf, 0x16u);

  }
  objc_msgSend(v5, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-Auth-Services"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(" "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "containsObject:", CFSTR("GS"));
  v18 = objc_msgSend(v5, "ams_statusCode");
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (id)v19;
  if (v18 == 401 && v17)
  {
    if (!v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_opt_class();
      v53 = v22;
      objc_msgSend(v6, "properties");
      v23 = v5;
      v24 = v16;
      v25 = v13;
      v26 = v6;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "logUUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v22;
      v58 = 2114;
      v59 = v28;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Auth services header contain GS", buf, 0x16u);

      v6 = v26;
      v13 = v25;
      v16 = v24;
      v5 = v23;

    }
    objc_msgSend(v5, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-GS-Token-Identifier"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    if (v29)
    {
      if (!v30)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v31, "OSLogObject");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_opt_class();
        v54 = v33;
        objc_msgSend(v6, "properties");
        v34 = v6;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "logUUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v57 = v33;
        v58 = 2114;
        v59 = v36;
        v60 = 2112;
        v61 = v29;
        _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found GS token header: %@", buf, 0x20u);

        v6 = v34;
      }

      v20 = v29;
      v37 = v20;
    }
    else
    {
      if (!v30)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v31, "OSLogObject");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "properties");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "logUUID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v6;
        v47 = (void *)objc_opt_class();
        v52 = v47;
        objc_msgSend(v46, "properties");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "gsTokenIdentifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v57 = v45;
        v58 = 2114;
        v59 = v47;
        v6 = v46;
        v60 = 2112;
        v61 = v49;
        _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No GS token header. Falling back to that of the task info: %@", buf, 0x20u);

      }
      objc_msgSend(v6, "properties");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "gsTokenIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0;
    }
  }
  else
  {
    if (!v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = (void *)objc_opt_class();
      v40 = v39;
      objc_msgSend(v6, "properties");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "logUUID");
      v42 = v6;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v39;
      v58 = 2114;
      v59 = v43;
      _os_log_impl(&dword_18C849000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Auth services missing GS", buf, 0x16u);

      v6 = v42;
    }

    v37 = 0;
  }

  return v37;
}

+ (void)_updateTaskWithAuthedAccount:(id)a3 taskInfo:(id)a4
{
  void *v4;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a3, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
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
      objc_msgSend(v7, "properties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = objc_opt_class();
      v15 = v14;
      if (v12)
      {
        objc_msgSend(v7, "properties");
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "logUUID");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, v4);
      }
      else
      {
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v16;
      v24 = 2114;
      v25 = v17;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Updating account on URL task. account = %{public}@", buf, 0x16u);
      if (v12)
      {

        v16 = a1;
      }

    }
    objc_msgSend(v7, "properties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAccount:", v8);

    objc_msgSend(v7, "properties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "purchaseInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "purchase");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAccount:", v8);

  }
}

+ (void)_updateTaskWithLastCredentialSource:(id)a3 taskInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreviousAuthorizationCredentialSource:", objc_msgSend(v6, "ams_lastAuthenticationCredentialSource"));

  if (!objc_msgSend(v5, "previousAuthorizationCredentialSource"))
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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      objc_msgSend(v5, "properties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine the credential source from authentication.", (uint8_t *)&v13, 0x16u);

    }
  }

}

- (AMSAuthenticateRequest)authenticateRequest
{
  return self->_authenticateRequest;
}

- (NSDictionary)dialogDictionary
{
  return self->_dialogDictionary;
}

- (void)setDialogDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dialogDictionary, a3);
}

- (AMSFinanceDialogResponse)dialogResponse
{
  return self->_dialogResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogResponse, 0);
  objc_storeStrong((id *)&self->_dialogDictionary, 0);
  objc_storeStrong((id *)&self->_authenticateRequest, 0);
}

@end
