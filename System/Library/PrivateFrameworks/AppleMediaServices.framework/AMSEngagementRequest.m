@implementation AMSEngagementRequest

- (AMSEngagementRequest)init
{
  AMSEngagementRequest *v2;
  AMSEngagementRequest *v3;
  uint64_t v4;
  NSString *logKey;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSEngagementRequest;
  v2 = -[AMSEngagementRequest init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_anonymousMetrics = 0;
    AMSLogKey();
    v4 = objc_claimAutoreleasedReturnValue();
    logKey = v3->_logKey;
    v3->_logKey = (NSString *)v4;

    *(_WORD *)&v3->_failOnDismiss = 1;
    v3->_suppressInteractiveModalDismissal = 0;
    v3->_destinationStyle = 0;
  }
  return v3;
}

- (AMSEngagementRequest)initWithModel:(id)a3
{
  id v4;
  AMSEngagementRequest *v5;
  uint64_t v6;
  NSData *modelData;

  v4 = a3;
  v5 = -[AMSEngagementRequest init](self, "init");
  if (v5)
  {
    +[AMSEngagementUtils encodeModel:](AMSEngagementUtils, "encodeModel:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    modelData = v5->_modelData;
    v5->_modelData = (NSData *)v6;

  }
  return v5;
}

- (AMSEngagementRequest)initWithModel:(id)a3 destinationStyle:(int64_t)a4
{
  id v6;
  AMSEngagementRequest *v7;
  uint64_t v8;
  NSData *modelData;

  v6 = a3;
  v7 = -[AMSEngagementRequest init](self, "init");
  if (v7)
  {
    +[AMSEngagementUtils encodeModel:](AMSEngagementUtils, "encodeModel:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    modelData = v7->_modelData;
    v7->_modelData = (NSData *)v8;

    v7->_destinationStyle = a4;
  }

  return v7;
}

- (AMSEngagementRequest)initWithRequestDictionary:(id)a3
{
  id v4;
  AMSEngagementRequest *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *account;
  id v12;
  uint64_t v13;
  void *clientData;
  id v15;
  NSDictionary *v16;
  void *v17;
  id v18;
  void *logKey;
  id v20;
  id v21;
  void *metricsOverlay;
  id v23;
  NSDictionary *v24;
  void *v25;
  id v26;
  void *originatingURL;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *URL;
  id v37;
  uint64_t v38;
  id v40;
  NSDictionary *v41;
  void *v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[AMSEngagementRequest init](self, "init");
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
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v8;
      v45 = 2114;
      v46 = v9;
      v47 = 2114;
      v48 = v10;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Decoding engagement request from dict: %{public}@", buf, 0x20u);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("account"));
    account = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = account;

      if (!v12)
        goto LABEL_11;
      -[AMSEngagementRequest _accountFromDictionary:](v5, "_accountFromDictionary:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      account = v5->_account;
      v5->_account = (ACAccount *)v13;
    }
    else
    {
      v12 = 0;
    }

LABEL_11:
    v42 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientData"));
    clientData = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = clientData;

      if (!v15)
      {
        v41 = 0;
LABEL_16:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failOnDismiss"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = v17;

          if (v18)
            v5->_failOnDismiss = objc_msgSend(v18, "BOOLValue");
        }
        else
        {

          v18 = 0;
        }
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("logKey"));
        logKey = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = logKey;

          if (!v20)
          {
            v40 = 0;
LABEL_25:
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metricsOverlay"));
            metricsOverlay = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = metricsOverlay;

              if (!v23)
              {
                v24 = 0;
LABEL_30:
                objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("destinationStyle"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v26 = v25;

                  if (v26)
                    v5->_destinationStyle = objc_msgSend(v26, "integerValue");
                }
                else
                {

                  v26 = 0;
                }
                objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originatingURL"));
                originatingURL = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v28 = originatingURL;

                  if (!v28)
                    goto LABEL_39;
                  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v28);
                  v29 = objc_claimAutoreleasedReturnValue();
                  originatingURL = v5->_originatingURL;
                  v5->_originatingURL = (NSURL *)v29;
                }
                else
                {
                  v28 = 0;
                }

LABEL_39:
                objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("presentationStyle"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v31 = v30;

                  if (v31)
                    v5->_presentationStyle = objc_msgSend(v31, "integerValue");
                }
                else
                {

                  v31 = 0;
                }
                objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("silentlyCheckURL"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v33 = v32;

                  if (v33)
                    v5->_silentlyCheckURL = objc_msgSend(v33, "BOOLValue");
                }
                else
                {

                  v33 = 0;
                }
                objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suppressInteractiveModalDismissal"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suppressInteractiveModalDismissal"));
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v5->_suppressInteractiveModalDismissal = objc_msgSend(v35, "BOOLValue");

                }
                else
                {
                  v5->_suppressInteractiveModalDismissal = 0;
                }

                objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("URL"));
                URL = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v37 = URL;

                  if (!v37)
                  {
LABEL_55:

                    goto LABEL_56;
                  }
                  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v37);
                  v38 = objc_claimAutoreleasedReturnValue();
                  URL = v5->_URL;
                  v5->_URL = (NSURL *)v38;
                }
                else
                {
                  v37 = 0;
                }

                goto LABEL_55;
              }
              v24 = (NSDictionary *)v23;
              metricsOverlay = v5->_metricsOverlay;
              v5->_metricsOverlay = v24;
            }
            else
            {
              v24 = 0;
            }

            goto LABEL_30;
          }
          v21 = v20;
          logKey = v5->_logKey;
          v40 = v21;
          v5->_logKey = (NSString *)v21;
        }
        else
        {
          v40 = 0;
        }

        goto LABEL_25;
      }
      v16 = (NSDictionary *)v15;
      clientData = v5->_clientData;
      v41 = v16;
      v5->_clientData = v16;
    }
    else
    {
      v41 = 0;
    }

    goto LABEL_16;
  }
LABEL_56:

  return v5;
}

- (AMSEngagementRequest)initWithJSONDictionary:(id)a3
{
  id v4;
  void *v5;
  AMSEngagementRequest *v6;
  void *v7;
  id v8;
  AMSEngagementRequest *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v6 = objc_alloc_init(AMSEngagementRequest);
    -[AMSEngagementRequest setFailOnDismiss:](v6, "setFailOnDismiss:", 0);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    -[AMSEngagementRequest setClientData:](v6, "setClientData:", v8);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metricsOverlay"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    -[AMSEngagementRequest setMetricsOverlay:](v6, "setMetricsOverlay:", v11);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("destinationStyle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    -[AMSEngagementRequest setDestinationStyle:](v6, "setDestinationStyle:", objc_msgSend(v13, "integerValue"));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suppressInteractiveModalDismissal"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suppressInteractiveModalDismissal"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSEngagementRequest setSuppressInteractiveModalDismissal:](v6, "setSuppressInteractiveModalDismissal:", objc_msgSend(v15, "BOOLValue"));

    }
    else
    {
      -[AMSEngagementRequest setSuppressInteractiveModalDismissal:](v6, "setSuppressInteractiveModalDismissal:", 0);
    }

    -[AMSEngagementRequest setPresentationStyle:](v6, "setPresentationStyle:", -[AMSEngagementRequest _engagementPresentationStyleFromDictionary:](v6, "_engagementPresentationStyleFromDictionary:", v5));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = 0;
      v9 = 0;
LABEL_28:

      goto LABEL_29;
    }
    v17 = v16;

    if (!v17)
    {
      v9 = 0;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSEngagementRequest setURL:](v6, "setURL:", v18);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("account"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = 0;
      goto LABEL_26;
    }
    v16 = v19;

    if (v16)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("dsid"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("dsid"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");

      if (v21 != -1)
      {
        v22 = (void *)MEMORY[0x1E0C8F2B8];
        +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "ams_sharedAccountStoreForClient:", v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "ams_iTunesAccountWithDSID:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSEngagementRequest setAccount:](v6, "setAccount:", v25);

        goto LABEL_26;
      }
    }
LABEL_27:
    v9 = v6;
    goto LABEL_28;
  }
  v9 = 0;
LABEL_30:

  return v9;
}

- (id)modelForClass:(Class)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  -[AMSEngagementRequest modelData](self, "modelData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSEngagementUtils modelFromData:class:error:](AMSEngagementUtils, "modelFromData:class:error:", v6, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accountFromDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dsid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "integerValue"));
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {

    v5 = 0;
  }
  v6 = 0;
LABEL_6:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("username"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accountPreSet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6 | v8)
  {
    objc_msgSend(v11, "ams_iTunesAccountWithAltDSID:DSID:username:", 0, v6, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v12, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F170]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v14);

    }
    objc_msgSend(v13, "ams_DSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      objc_msgSend(v13, "ams_setDSID:", v6);
    objc_msgSend(v13, "username");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      objc_msgSend(v13, "setUsername:", v8);
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("activeItunes")))
  {
    objc_msgSend(v12, "ams_activeiTunesAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (AMSEngagementRequest)initWithCoder:(id)a3
{
  id v4;
  AMSEngagementRequest *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  ACAccount *account;
  void *v14;
  uint64_t v15;
  NSDictionary *clientData;
  uint64_t v17;
  NSString *logKey;
  void *v19;
  uint64_t v20;
  NSDictionary *metricsOverlay;
  uint64_t v22;
  NSData *modelData;
  uint64_t v24;
  NSURL *originatingURL;
  uint64_t v26;
  NSURL *URL;
  objc_super v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)AMSEngagementRequest;
  v5 = -[AMSEngagementRequest init](&v29, sel_init);
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
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "debugDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v8;
      v32 = 2114;
      v33 = v9;
      v34 = 2114;
      v35 = v11;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Decoding engagement request: %{public}@", buf, 0x20u);

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account"));
    v12 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (ACAccount *)v12;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("clientData"));
    v15 = objc_claimAutoreleasedReturnValue();
    clientData = v5->_clientData;
    v5->_clientData = (NSDictionary *)v15;

    v5->_failOnDismiss = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("failOnDismiss"));
    v5->_suppressInteractiveModalDismissal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suppressInteractiveModalDismissal"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logKey"));
    v17 = objc_claimAutoreleasedReturnValue();
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v17;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("metricsOverlay"));
    v20 = objc_claimAutoreleasedReturnValue();
    metricsOverlay = v5->_metricsOverlay;
    v5->_metricsOverlay = (NSDictionary *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelData"));
    v22 = objc_claimAutoreleasedReturnValue();
    modelData = v5->_modelData;
    v5->_modelData = (NSData *)v22;

    v5->_destinationStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("destinationStyle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingURL"));
    v24 = objc_claimAutoreleasedReturnValue();
    originatingURL = v5->_originatingURL;
    v5->_originatingURL = (NSURL *)v24;

    v5->_presentationStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("presentationStyle"));
    v5->_silentlyCheckURL = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("silentlyCheckURL"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v26 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[AMSEngagementRequest account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("account"));

  -[AMSEngagementRequest clientData](self, "clientData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("clientData"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSEngagementRequest failOnDismiss](self, "failOnDismiss"), CFSTR("failOnDismiss"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSEngagementRequest suppressInteractiveModalDismissal](self, "suppressInteractiveModalDismissal"), CFSTR("suppressInteractiveModalDismissal"));
  -[AMSEngagementRequest logKey](self, "logKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("logKey"));

  -[AMSEngagementRequest metricsOverlay](self, "metricsOverlay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("metricsOverlay"));

  -[AMSEngagementRequest modelData](self, "modelData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("modelData"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSEngagementRequest destinationStyle](self, "destinationStyle"), CFSTR("destinationStyle"));
  -[AMSEngagementRequest originatingURL](self, "originatingURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("originatingURL"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSEngagementRequest presentationStyle](self, "presentationStyle"), CFSTR("presentationStyle"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSEngagementRequest silentlyCheckURL](self, "silentlyCheckURL"), CFSTR("silentlyCheckURL"));
  -[AMSEngagementRequest URL](self, "URL");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("URL"));

}

- (int64_t)_engagementPresentationStyleFromDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  objc_msgSend(v3, "valueForKey:", CFSTR("style"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;

    if (v5)
    {
LABEL_7:
      if (_MergedGlobals_103 != -1)
        dispatch_once(&_MergedGlobals_103, &__block_literal_global_49);
      objc_msgSend((id)qword_1ECEAD1A8, "valueForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
        v8 = objc_msgSend(v6, "integerValue");
      else
        v8 = 0;

      goto LABEL_14;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("clientData.style"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v5;

    if (!v5)
    {
      v8 = 0;
      goto LABEL_15;
    }
    goto LABEL_7;
  }
  v8 = 0;
LABEL_14:

LABEL_15:
  return v8;
}

void __67__AMSEngagementRequest__engagementPresentationStyleFromDictionary___block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD1A8;
  qword_1ECEAD1A8 = (uint64_t)&unk_1E25B0230;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (BOOL)anonymousMetrics
{
  return self->_anonymousMetrics;
}

- (void)setAnonymousMetrics:(BOOL)a3
{
  self->_anonymousMetrics = a3;
}

- (NSDictionary)clientData
{
  return self->_clientData;
}

- (void)setClientData:(id)a3
{
  objc_storeStrong((id *)&self->_clientData, a3);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (BOOL)failOnDismiss
{
  return self->_failOnDismiss;
}

- (void)setFailOnDismiss:(BOOL)a3
{
  self->_failOnDismiss = a3;
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setMetricsOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_metricsOverlay, a3);
}

- (NSURL)originatingURL
{
  return self->_originatingURL;
}

- (void)setOriginatingURL:(id)a3
{
  objc_storeStrong((id *)&self->_originatingURL, a3);
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (BOOL)silentlyCheckURL
{
  return self->_silentlyCheckURL;
}

- (void)setSilentlyCheckURL:(BOOL)a3
{
  self->_silentlyCheckURL = a3;
}

- (int64_t)destinationStyle
{
  return self->_destinationStyle;
}

- (void)setDestinationStyle:(int64_t)a3
{
  self->_destinationStyle = a3;
}

- (BOOL)suppressInteractiveModalDismissal
{
  return self->_suppressInteractiveModalDismissal;
}

- (void)setSuppressInteractiveModalDismissal:(BOOL)a3
{
  self->_suppressInteractiveModalDismissal = a3;
}

- (NSData)modelData
{
  return self->_modelData;
}

- (void)setModelData:(id)a3
{
  objc_storeStrong((id *)&self->_modelData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelData, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_originatingURL, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
