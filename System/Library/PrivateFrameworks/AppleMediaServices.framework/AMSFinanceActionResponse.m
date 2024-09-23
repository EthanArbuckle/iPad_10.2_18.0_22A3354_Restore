@implementation AMSFinanceActionResponse

- (AMSFinanceActionResponse)initWithTaskInfo:(id)a3
{
  id v5;
  AMSFinanceActionResponse *v6;
  AMSFinanceActionResponse *v7;
  AMSFinanceActionResponse *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)AMSFinanceActionResponse;
    v6 = -[AMSFinanceActionResponse init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_taskInfo, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)actionWithActionDictionary:(id)a3 taskInfo:(id)a4
{
  id v5;
  id v6;
  AMSFinanceActionResponse *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  AMSFinanceActionResponse *v16;
  uint64_t v17;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;

  v5 = a3;
  v6 = a4;
  v7 = -[AMSFinanceActionResponse initWithTaskInfo:]([AMSFinanceActionResponse alloc], "initWithTaskInfo:", v6);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("retry"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("retry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFinanceActionResponse setShouldRetry:](v7, "setShouldRetry:", objc_msgSend(v9, "BOOLValue"));

  }
  else
  {
    -[AMSFinanceActionResponse setShouldRetry:](v7, "setShouldRetry:", 0);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tidContinue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tidContinue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFinanceActionResponse setTidContinue:](v7, "setTidContinue:", objc_msgSend(v11, "BOOLValue"));

  }
  else
  {
    -[AMSFinanceActionResponse setTidContinue:](v7, "setTidContinue:", 0);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFinanceActionResponse setURL:](v7, "setURL:", v14);

      goto LABEL_12;
    }
  }
  else
  {

  }
  -[AMSFinanceActionResponse setURL:](v7, "setURL:", 0);
  v13 = 0;
LABEL_12:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kind"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("GoBack")))
    {
      if (objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("RetryRestoreAll")))
      {
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("Goto")))
        {
          v16 = v7;
          v17 = 3;
        }
        else
        {
          if (!objc_msgSend(v15, "isEqualToString:", CFSTR("OpenURL")))
          {
            if (objc_msgSend(v15, "isEqualToString:", CFSTR("GotoFinance")))
            {
              -[AMSFinanceActionResponse setKind:](v7, "setKind:", 4);
              -[AMSFinanceActionResponse URL](v7, "URL");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v19;
              v21 = CFSTR("itms-ui");
            }
            else
            {
              if (!objc_msgSend(v15, "isEqualToString:", CFSTR("GotoFinanceV2")))
                goto LABEL_22;
              -[AMSFinanceActionResponse setKind:](v7, "setKind:", 4);
              -[AMSFinanceActionResponse URL](v7, "URL");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v19;
              v21 = CFSTR("ams-ui");
            }
            objc_msgSend(v19, "ams_URLByReplacingSchemeWithScheme:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[AMSFinanceActionResponse setURL:](v7, "setURL:", v22);

            goto LABEL_22;
          }
          v16 = v7;
          v17 = 4;
        }
      }
      else
      {
        v16 = v7;
        v17 = 5;
      }
    }
    else
    {
      v16 = v7;
      v17 = 2;
    }
    -[AMSFinanceActionResponse setKind:](v16, "setKind:", v17);
  }
LABEL_22:

  return v7;
}

+ (id)actionWithUpdatedCreditString:(id)a3 account:(id)a4 taskInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  AMSFinanceActionResponse *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[AMSFinanceActionResponse initWithTaskInfo:]([AMSFinanceActionResponse alloc], "initWithTaskInfo:", v7);

  -[AMSFinanceActionResponse setKind:](v10, "setKind:", 1);
  -[AMSFinanceActionResponse setAccount:](v10, "setAccount:", v8);

  -[AMSFinanceActionResponse setCreditString:](v10, "setCreditString:", v9);
  return v10;
}

+ (void)handleExternalGotoURL:(id)a3
{
  objc_msgSend(a1, "handleExternalGotoURL:taskInfo:", a3, 0);
}

+ (void)handleExternalGotoURL:(id)a3 taskInfo:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
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
    AMSLogableURL(v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v15;
    v20 = 2114;
    v21 = v16;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Action opening standard URL: %{public}@", buf, 0x16u);
    if (v11)
    {

      v15 = (void *)v4;
    }

  }
  if (v8 && objc_msgSend(a1, "_stashTIDContinueHeadersForTaskInfo:", v8))
  {
    objc_msgSend(v7, "ams_URLByAppendingQueryParameter:name:", CFSTR("1"), CFSTR("signatureResumption"));
    v17 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v17;
  }
  +[AMSOpenURL openStandardURL:](AMSOpenURL, "openStandardURL:", v7);

}

+ (id)handleGotoURL:(id)a3 taskInfo:(id)a4 gotoType:(int64_t)a5 accountURL:(BOOL)a6 tidContinue:(BOOL)a7 retryOnSuccess:(BOOL)a8
{
  uint64_t v8;
  _BOOL4 v9;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  AMSOpenActionResult *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v49;
  _BOOL4 v51;
  unsigned int v52;
  _BOOL4 v53;
  void *v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v9 = a8;
  v51 = a6;
  v53 = a7;
  v60 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
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
    AMSLogKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = objc_opt_class();
    v19 = v18;
    if (v16)
    {
      AMSLogKey();
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: [%@] "), v19, v8);
    }
    else
    {
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: "), v18);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v57 = v20;
    v58 = 2114;
    v59 = v21;
    _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Action opening Goto URL: %{public}@", buf, 0x16u);
    if (v16)
    {

      v20 = (void *)v8;
    }

  }
  v22 = 0;
  if (v12 && v13)
  {
    objc_msgSend(a1, "_stashTIDContinueHeadersForTaskInfo:", v13);
    objc_msgSend(a1, "_presentEngagementForURL:taskInfo:", v12, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    objc_msgSend(v23, "resultWithError:", &v55);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v55;

    if (v24)
    {
      v26 = 1;
    }
    else
    {
      objc_msgSend(v25, "userInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("AMSEngagementPresented"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v25, "userInfo");
        v49 = v9;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("AMSEngagementPresented"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "BOOLValue");

        v26 = v31;
        v9 = v49;
      }
      else
      {
        v26 = 0;
      }

    }
    if (objc_msgSend(v25, "code") == 4097)
    {
      objc_msgSend(v25, "domain");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

    }
    else
    {
      v33 = 0;
    }
    if (((v26 | v33) & 1) == 0)
    {
      objc_msgSend(a1, "_deepLinkForURL:taskInfo:gotoType:isAccountURL:tidContinue:", v12, v13, a5, v51, v53);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "properties");
      v52 = v26;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "clientInfo");
      v54 = v24;
      v36 = v12;
      v37 = v25;
      v38 = v9;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "properties");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "bag");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = +[AMSOpenURL openURL:clientInfo:bag:](AMSOpenURL, "openURL:clientInfo:bag:", v34, v39, v41);

      v9 = v38;
      v25 = v37;
      v12 = v36;
      v24 = v54;

      v26 = v52;
    }
    if (!(_DWORD)v26)
      goto LABEL_28;
    if (v25)
    {
      +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v25);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    if (v24)
    {
      objc_msgSend(v13, "task");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "originalRequest");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "ams_requestActionFromRequest:", v45);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_28:
      v43 = 0;
    }
LABEL_29:
    if (!v43 && v9)
    {
      +[AMSURLAction retryAction](AMSURLAction, "retryAction");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setRetryIdentifier:", CFSTR("GotoAction"));
    }
    if (!v43)
    {
      objc_msgSend(v24, "ams_buyParams");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v46
        || (+[AMSURLAction retryAction](AMSURLAction, "retryAction"),
            (v43 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        +[AMSURLAction proceedAction](AMSURLAction, "proceedAction");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_msgSend(v24, "ams_buyParams");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setUpdatedBuyParams:", v47);

    v22 = objc_alloc_init(AMSOpenActionResult);
    -[AMSOpenActionResult setEngagementPresented:](v22, "setEngagementPresented:", v26);
    -[AMSOpenActionResult setInterruptionResult:](v22, "setInterruptionResult:", v24 != 0);
    -[AMSOpenActionResult setAction:](v22, "setAction:", v43);

  }
  return v22;
}

- (id)performWithTaskInfo:(id)a3
{
  int64_t v4;
  void *v5;

  v4 = -[AMSFinanceActionResponse kind](self, "kind", a3);
  switch(v4)
  {
    case 4:
      -[AMSFinanceActionResponse _performOpenStandardURL](self, "_performOpenStandardURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[AMSFinanceActionResponse _handleGotoAction](self, "_handleGotoAction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[AMSFinanceActionResponse _performCreditDisplayUpdate](self, "_performCreditDisplayUpdate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

+ (id)_bodyObjectFromRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
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
  v3 = a3;
  objc_msgSend(v3, "allHTTPHeaderFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Content-Type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "HTTPBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    v16 = 0;
    +[AMSData objectWithData:encoding:error:](AMSData, "objectWithData:encoding:error:", v6, +[AMSData dataEncodingFromContentType:](AMSData, "dataEncodingFromContentType:", v5), &v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;
    if (v8)
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
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = objc_opt_class();
        AMSLogKey();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v18 = v11;
        v19 = 2114;
        v20 = v12;
        v21 = 2114;
        v22 = v8;
        _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode body object from request. Falling back to string encoding. %{public}@", buf, 0x20u);

      }
      v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
    }
    else
    {
      v13 = v7;
    }
    v14 = v13;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_performCreditDisplayUpdate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
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
  id v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[AMSFinanceActionResponse account](self, "account");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[AMSFinanceActionResponse creditString](self, "creditString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

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
        v8 = (void *)objc_opt_class();
        v9 = v8;
        -[AMSFinanceActionResponse taskInfo](self, "taskInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "properties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "logUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v8;
        v24 = 2114;
        v25 = v12;
        _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing creditDisplay response action", (uint8_t *)&v22, 0x16u);

      }
      -[AMSFinanceActionResponse account](self, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFinanceActionResponse creditString](self, "creditString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ams_setCreditsString:", v14);

      v15 = (void *)MEMORY[0x1E0C8F2B8];
      -[AMSFinanceActionResponse taskInfo](self, "taskInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "properties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "clientInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ams_sharedAccountStoreForProcessInfo:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (id)objc_msgSend(v19, "ams_saveAccount:verifyCredentials:", v13, 0);
    }
  }
  return 0;
}

- (id)_performGotoURL
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[AMSFinanceActionResponse URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
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
    v7 = v6;
    -[AMSFinanceActionResponse taskInfo](self, "taskInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing Goto response action", (uint8_t *)&v14, 0x16u);

  }
  -[AMSFinanceActionResponse URL](self, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSURLAction redirectActionWithURL:](AMSURLAction, "redirectActionWithURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_performOpenStandardURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AMSFinanceActionResponse URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_class();
    -[AMSFinanceActionResponse URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFinanceActionResponse taskInfo](self, "taskInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleExternalGotoURL:taskInfo:", v5, v6);

  }
  return 0;
}

- (id)_handleGotoAction
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[AMSFinanceActionResponse URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
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
    v7 = v6;
    -[AMSFinanceActionResponse taskInfo](self, "taskInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v6;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Action opening app URL", (uint8_t *)&v17, 0x16u);

  }
  v11 = (void *)objc_opt_class();
  -[AMSFinanceActionResponse URL](self, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFinanceActionResponse taskInfo](self, "taskInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleGotoURL:taskInfo:gotoType:accountURL:tidContinue:retryOnSuccess:", v12, v13, 1, 0, -[AMSFinanceActionResponse tidContinue](self, "tidContinue"), -[AMSFinanceActionResponse shouldRetry](self, "shouldRetry"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "action");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_presentEngagementForURL:(id)a3 taskInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  AMSEngagementRequest *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  AMSPromise *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v40[5];
  _QWORD v41[2];
  _QWORD v42[2];
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
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
    v10 = objc_opt_class();
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v10;
    v45 = 2114;
    v46 = v11;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting inline engagement.", buf, 0x16u);

  }
  objc_msgSend(v7, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    AMSError(2, CFSTR("Finance Engagement Error"), CFSTR("No delegate to present the engagement"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v32, "OSLogObject");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v34 = objc_opt_class();
    AMSLogKey();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v44 = v34;
    v45 = 2114;
    v46 = v35;
    v47 = 2114;
    v48 = v14;
    v36 = "%{public}@: [%{public}@] Failed to present engagement (no delegate). %{public}@";
    goto LABEL_21;
  }
  if (!v6)
  {
    AMSError(2, CFSTR("Finance Engagement Error"), CFSTR("No URL for engagement"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v32, "OSLogObject");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v37 = objc_opt_class();
    AMSLogKey();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v44 = v37;
    v45 = 2114;
    v46 = v35;
    v47 = 2114;
    v48 = v14;
    v36 = "%{public}@: [%{public}@] Failed to present engagement (no URL). %{public}@";
    goto LABEL_21;
  }
  if ((objc_msgSend(a1, "_isModernURL:taskInfo:", v6, v7) & 1) == 0)
  {
    AMSError(2, CFSTR("Finance Engagement Error"), CFSTR("URL does not match patterns"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v32, "OSLogObject");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v38 = objc_opt_class();
    AMSLogKey();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v44 = v38;
    v45 = 2114;
    v46 = v35;
    v47 = 2114;
    v48 = v14;
    v36 = "%{public}@: [%{public}@] Failed to present engagement (patterns). %{public}@";
LABEL_21:
    _os_log_impl(&dword_18C849000, v33, OS_LOG_TYPE_ERROR, v36, buf, 0x20u);

LABEL_22:
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v14);
    v28 = (AMSPromise *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "task");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "originalRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("url"));

  objc_msgSend(v7, "task");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "originalRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bodyObjectFromRequest:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("body"));

  v22 = objc_alloc_init(AMSEngagementRequest);
  objc_msgSend(v7, "properties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "account");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSEngagementRequest setAccount:](v22, "setAccount:", v24);

  AMSLogKey();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSEngagementRequest setLogKey:](v22, "setLogKey:", v25);

  -[AMSEngagementRequest setFailOnDismiss:](v22, "setFailOnDismiss:", 1);
  -[AMSEngagementRequest setSilentlyCheckURL:](v22, "setSilentlyCheckURL:", 1);
  v41[0] = CFSTR("inlineInterrupt");
  v41[1] = CFSTR("request");
  v42[0] = MEMORY[0x1E0C9AAB0];
  v42[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSEngagementRequest setClientData:](v22, "setClientData:", v26);

  objc_msgSend(v6, "ams_URLByReplacingSchemeWithScheme:", CFSTR("https"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSEngagementRequest setURL:](v22, "setURL:", v27);

  v28 = objc_alloc_init(AMSPromise);
  objc_msgSend(v7, "session");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "task");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPromise completionHandlerAdapter](v28, "completionHandlerAdapter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "AMSURLSession:task:handleEngagementRequest:completion:", v29, v30, v22, v31);

  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __62__AMSFinanceActionResponse__presentEngagementForURL_taskInfo___block_invoke;
  v40[3] = &__block_descriptor_40_e41_v24__0__AMSEngagementResult_8__NSError_16l;
  v40[4] = a1;
  -[AMSPromise addFinishBlock:](v28, "addFinishBlock:", v40);

LABEL_23:
  return v28;
}

void __62__AMSFinanceActionResponse__presentEngagementForURL_taskInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a2)
  {
    if (!v5)
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
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      v10 = "%{public}@: [%{public}@] Engagement succeeded.";
      v11 = v7;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 22;
LABEL_10:
      _os_log_impl(&dword_18C849000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v14;
      v17 = 2114;
      v18 = v9;
      v19 = 2114;
      v20 = v4;
      v10 = "%{public}@: [%{public}@] Engagement failed. %{public}@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
      goto LABEL_10;
    }
  }

}

+ (BOOL)_stashTIDContinueHeadersForTaskInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBiometrics resumptionHeadersFromRequest:](AMSBiometrics, "resumptionHeadersFromRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = +[AMSKeychain stashResumptionHeaders:error:](AMSKeychain, "stashResumptionHeaders:error:", v5, 0);
  else
    v6 = 0;

  return v6;
}

+ (id)_deepLinkForURL:(id)a3 taskInfo:(id)a4 gotoType:(int64_t)a5 isAccountURL:(BOOL)a6 tidContinue:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  __CFString **v16;
  uint64_t v17;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = v12;
  v15 = v14;
  if (v8)
  {
    objc_msgSend(a1, "_URLForCommerceUIFromURL:taskInfo:tidContinue:", v14, v13, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a5 == 3)
  {
    v16 = &AMSUIURLScheme;
    goto LABEL_7;
  }
  if (a5 == 2)
  {
    v16 = ITMSUIURLScheme;
LABEL_7:
    objc_msgSend(v15, "ams_URLByReplacingSchemeWithScheme:", *v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v17;
  }

  return v15;
}

+ (BOOL)_isModernURL:(id)a3 taskInfo:(id)a4
{
  id v5;
  id v6;
  AMSURLParser *v7;
  void *v8;
  void *v9;
  AMSURLParser *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [AMSURLParser alloc];
  objc_msgSend(v5, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSURLParser initWithBag:](v7, "initWithBag:", v9);

  -[AMSURLParser typeForURL:](v10, "typeForURL:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  objc_msgSend(v11, "resultWithError:", &v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v21;

  if (v13 || !v12)
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
      v17 = objc_opt_class();
      objc_msgSend(v5, "properties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v17;
      v24 = 2114;
      v25 = v19;
      v26 = 2114;
      v27 = v13;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to parse URL. %{public}@", buf, 0x20u);

    }
    v14 = 0;
  }
  else
  {
    v14 = objc_msgSend(v12, "integerValue") != 1;
  }

  return v14;
}

+ (id)_URLForCommerceUIFromURL:(id)a3 taskInfo:(id)a4 tidContinue:(BOOL)a5
{
  _BOOL4 v5;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
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
  void *v25;

  v5 = a5;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("account"), CFSTR("action"));
  objc_msgSend(v8, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accountType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("accountType"));

  objc_msgSend(v8, "properties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ams_DSID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("dsid"));

  objc_msgSend(v8, "properties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "account");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "username");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("username"));

  if (v5)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("signatureResumption"));
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ams_URLByReplaceingQueryParameters:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "absoluteString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "ams_URLByAppendingQueryParameter:name:", v24, CFSTR("url"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)creditString
{
  return self->_creditString;
}

- (void)setCreditString:(id)a3
{
  objc_storeStrong((id *)&self->_creditString, a3);
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (AMSURLTaskInfo)taskInfo
{
  return self->_taskInfo;
}

- (void)setTaskInfo:(id)a3
{
  objc_storeStrong((id *)&self->_taskInfo, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (BOOL)shouldRetry
{
  return self->_shouldRetry;
}

- (void)setShouldRetry:(BOOL)a3
{
  self->_shouldRetry = a3;
}

- (BOOL)tidContinue
{
  return self->_tidContinue;
}

- (void)setTidContinue:(BOOL)a3
{
  self->_tidContinue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_creditString, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
