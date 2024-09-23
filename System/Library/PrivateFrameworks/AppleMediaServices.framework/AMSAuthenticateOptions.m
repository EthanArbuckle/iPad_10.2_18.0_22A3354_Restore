@implementation AMSAuthenticateOptions

- (AMSAuthenticateOptions)init
{
  return -[AMSAuthenticateOptions initWithOptionsDictionary:](self, "initWithOptionsDictionary:", 0);
}

- (AMSAuthenticateOptions)initWithOptionsDictionary:(id)a3
{
  id v4;
  AMSAuthenticateOptions *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *appProvidedData;
  uint64_t v15;
  NSString *appProvidedContext;
  uint64_t v17;
  NSString *cancelButtonString;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  AMSProcessInfo *clientInfo;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  AMSProcessInfo *v29;
  uint64_t v30;
  NSString *companionDeviceClientInfo;
  uint64_t v32;
  NSString *companionDeviceUDID;
  uint64_t v34;
  NSDictionary *createAccountQueryParams;
  void *v36;
  id v37;
  uint64_t v38;
  NSString *defaultButtonString;
  uint64_t v40;
  NSString *debugReason;
  uint64_t v42;
  NSString *delegateAuthChallenge;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSDictionary *HTTPHeaders;
  void *v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  NSString *passwordlessToken;
  void *v59;
  uint64_t v60;
  NSString *logKey;
  uint64_t v62;
  NSString *metricsIdentifier;
  uint64_t v64;
  NSString *promptTitle;
  uint64_t v66;
  NSString *proxyAppBundleID;
  uint64_t v68;
  NSString *proxyAppName;
  uint64_t v70;
  NSString *reason;
  void *v72;
  uint64_t v73;
  NSString *serviceIdentifier;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  NSString *userAgent;
  uint64_t v80;
  NSString *userAgentSuffix;
  id v83;
  objc_super v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)AMSAuthenticateOptions;
  v5 = -[AMSAuthenticateOptions init](&v84, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
    if (v4)
      v6 = v4;
    v7 = v6;

    objc_msgSend(v7, "ams_objectForKey:defaultValue:", CFSTR("AMSAuthenticateOptionsAllowPasswordGeneration"), &unk_1E25AEF90);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowPasswordGeneration = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v7, "ams_objectForKey:defaultValue:", CFSTR("AMSAuthenticateOptionsAllowSecondaryCredentialSource"), MEMORY[0x1E0C9AAA0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowSecondaryCredentialSource = objc_msgSend(v9, "BOOLValue");

    v10 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v7, "ams_objectForKey:defaultValue:", CFSTR("AMSAuthenticateOptionsAllowServerDialogs"), MEMORY[0x1E0C9AAB0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowServerDialogs = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v7, "ams_objectForKey:defaultValue:", CFSTR("AMSAuthenticateOptionsAuthenticationTypeKey"), &unk_1E25AEFA8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_authenticationType = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsAppProvidedData"));
    v13 = objc_claimAutoreleasedReturnValue();
    appProvidedData = v5->_appProvidedData;
    v5->_appProvidedData = (NSDictionary *)v13;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsAppProvidedContext"));
    v15 = objc_claimAutoreleasedReturnValue();
    appProvidedContext = v5->_appProvidedContext;
    v5->_appProvidedContext = (NSString *)v15;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsCancelButtonString"));
    v17 = objc_claimAutoreleasedReturnValue();
    cancelButtonString = v5->_cancelButtonString;
    v5->_cancelButtonString = (NSString *)v17;

    objc_msgSend(v7, "ams_objectForKey:defaultValue:", CFSTR("AMSAuthenticateOptionsCanMakeAccountActiveKey"), v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canMakeAccountActive = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsClientInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v83 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v20, &v83);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v83;
      clientInfo = v5->_clientInfo;
      v5->_clientInfo = (AMSProcessInfo *)v21;

      if (v22)
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
          AMSLogKey();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          AMSLogableError(v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v86 = v26;
          v87 = 2114;
          v88 = v27;
          _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "AMSAuthenticateOptions: [%{public}@] Failed to unarchive the client info. error = %{public}@", buf, 0x16u);

        }
      }

    }
    if (!v5->_clientInfo)
    {
      +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v5->_clientInfo;
      v5->_clientInfo = (AMSProcessInfo *)v28;

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CFAE88]);
    v30 = objc_claimAutoreleasedReturnValue();
    companionDeviceClientInfo = v5->_companionDeviceClientInfo;
    v5->_companionDeviceClientInfo = (NSString *)v30;

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CFAE90]);
    v32 = objc_claimAutoreleasedReturnValue();
    companionDeviceUDID = v5->_companionDeviceUDID;
    v5->_companionDeviceUDID = (NSString *)v32;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsCreateAccountQueryParamsKey"));
    v34 = objc_claimAutoreleasedReturnValue();
    createAccountQueryParams = v5->_createAccountQueryParams;
    v5->_createAccountQueryParams = (NSDictionary *)v34;

    objc_msgSend(v7, "ams_objectForKey:defaultValue:", CFSTR("AMSAuthenticateOptionsCredentialSourceKey"), &unk_1E25AEF90);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = v36;
    else
      v37 = 0;

    v5->_credentialSource = objc_msgSend(v37, "unsignedIntegerValue");
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsDefaultButtonString"));
    v38 = objc_claimAutoreleasedReturnValue();
    defaultButtonString = v5->_defaultButtonString;
    v5->_defaultButtonString = (NSString *)v38;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsDebugReason"));
    v40 = objc_claimAutoreleasedReturnValue();
    debugReason = v5->_debugReason;
    v5->_debugReason = (NSString *)v40;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsDelegateAuthChallengeKey"));
    v42 = objc_claimAutoreleasedReturnValue();
    delegateAuthChallenge = v5->_delegateAuthChallenge;
    v5->_delegateAuthChallenge = (NSString *)v42;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsDelegateAuthEnabledKey"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsDelegateAuthEnabledKey"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_delegateAuthEnabled = objc_msgSend(v45, "BOOLValue");

    }
    else
    {
      v5->_delegateAuthEnabled = 0;
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsEnableAccountCreationKey"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsEnableAccountCreationKey"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_enableAccountCreation = objc_msgSend(v47, "BOOLValue");

    }
    else
    {
      v5->_enableAccountCreation = 0;
    }

    v48 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v7, "ams_objectForKey:defaultValue:", CFSTR("AMSAuthenticateOptionsEphemeralKey"), MEMORY[0x1E0C9AAA0]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ephemeral = objc_msgSend(v49, "BOOLValue");

    objc_msgSend(v7, "ams_objectForKey:defaultValue:", CFSTR("AMSAuthenticateOptionsForceSyncToPairedWatchKey"), v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_forceSyncToPairedWatch = objc_msgSend(v50, "BOOLValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsHTTPHeadersKey"));
    v51 = objc_claimAutoreleasedReturnValue();
    HTTPHeaders = v5->_HTTPHeaders;
    v5->_HTTPHeaders = (NSDictionary *)v51;

    objc_msgSend(v7, "ams_objectForKey:defaultValue:", CFSTR("AMSAuthenticateOptionsIgnoreAccountConversion"), v48);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v54 = v53;
    else
      v54 = 0;

    v5->_ignoreAccountConversion = objc_msgSend(v54, "BOOLValue");
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CFAE98]);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v56 = v55;
    else
      v56 = 0;

    v57 = objc_msgSend(v56, "copy");
    passwordlessToken = v5->_passwordlessToken;
    v5->_passwordlessToken = (NSString *)v57;

    AMSSetLogKeyIfNeeded();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_objectForKey:defaultValue:", CFSTR("AMSAuthenticateOptionsLogKeyKey"), v59);
    v60 = objc_claimAutoreleasedReturnValue();
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v60;

    objc_msgSend(v7, "objectForKey:", CFSTR("AMSAuthenticateOptionsMetricsIdentifierKey"));
    v62 = objc_claimAutoreleasedReturnValue();
    metricsIdentifier = v5->_metricsIdentifier;
    v5->_metricsIdentifier = (NSString *)v62;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsPromptTitle"));
    v64 = objc_claimAutoreleasedReturnValue();
    promptTitle = v5->_promptTitle;
    v5->_promptTitle = (NSString *)v64;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsProxyAppBundleIDKey"));
    v66 = objc_claimAutoreleasedReturnValue();
    proxyAppBundleID = v5->_proxyAppBundleID;
    v5->_proxyAppBundleID = (NSString *)v66;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsProxyAppNameKey"));
    v68 = objc_claimAutoreleasedReturnValue();
    proxyAppName = v5->_proxyAppName;
    v5->_proxyAppName = (NSString *)v68;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsReason"));
    v70 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v70;

    objc_msgSend(v7, "ams_objectForKey:defaultValue:", CFSTR("AMSAuthenticateOptionsRemoteProxyAuthenticationKey"), MEMORY[0x1E0C9AAA0]);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_remoteProxyAuthentication = objc_msgSend(v72, "BOOLValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsServiceIdentifierKey"));
    v73 = objc_claimAutoreleasedReturnValue();
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSString *)v73;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsServiceTokenOnly"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsServiceTokenOnly"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_serviceTokenOnly = objc_msgSend(v76, "BOOLValue");

    }
    else
    {
      v5->_serviceTokenOnly = 0;
    }

    objc_msgSend(v7, "ams_objectForKey:defaultValue:", CFSTR("AMSAuthenticateOptionsServiceType"), &unk_1E25AEFC0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_serviceType = objc_msgSend(v77, "integerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsUserAgentKey"));
    v78 = objc_claimAutoreleasedReturnValue();
    userAgent = v5->_userAgent;
    v5->_userAgent = (NSString *)v78;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsUserAgentSuffixKey"));
    v80 = objc_claimAutoreleasedReturnValue();
    userAgentSuffix = v5->_userAgentSuffix;
    v5->_userAgentSuffix = (NSString *)v80;

  }
  else
  {
    v7 = v4;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSAuthenticateOptions optionsDictionary](self, "optionsDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCodingKeyOptionsDictionary"));

}

- (AMSAuthenticateOptions)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  AMSAuthenticateOptions *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "ams_PLISTClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("kCodingKeyOptionsDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    self = -[AMSAuthenticateOptions initWithOptionsDictionary:](self, "initWithOptionsDictionary:", v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)authenticationType
{
  return self->_authenticationType;
}

- (id)optionsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _QWORD v58[13];
  _QWORD v59[15];

  v59[13] = *MEMORY[0x1E0C80C00];
  v47 = objc_alloc(MEMORY[0x1E0C99E08]);
  v58[0] = CFSTR("AMSAuthenticateOptionsAllowPasswordGeneration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AMSAuthenticateOptions allowPasswordGeneration](self, "allowPasswordGeneration"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v50;
  v58[1] = CFSTR("AMSAuthenticateOptionsAllowSecondaryCredentialSource");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSAuthenticateOptions allowSecondaryCredentialSource](self, "allowSecondaryCredentialSource"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v49;
  v58[2] = CFSTR("AMSAuthenticateOptionsAllowServerDialogs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSAuthenticateOptions allowServerDialogs](self, "allowServerDialogs"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v48;
  v58[3] = CFSTR("AMSAuthenticateOptionsAuthenticationTypeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AMSAuthenticateOptions authenticationType](self, "authenticationType"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v46;
  v58[4] = CFSTR("AMSAuthenticateOptionsCanMakeAccountActiveKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSAuthenticateOptions canMakeAccountActive](self, "canMakeAccountActive"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v59[4] = v45;
  v58[5] = CFSTR("AMSAuthenticateOptionsCredentialSourceKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AMSAuthenticateOptions credentialSource](self, "credentialSource"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v59[5] = v44;
  v58[6] = CFSTR("AMSAuthenticateOptionsDelegateAuthEnabledKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSAuthenticateOptions delegateAuthEnabled](self, "delegateAuthEnabled"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v59[6] = v43;
  v58[7] = CFSTR("AMSAuthenticateOptionsEnableAccountCreationKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSAuthenticateOptions enableAccountCreation](self, "enableAccountCreation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v59[7] = v3;
  v58[8] = CFSTR("AMSAuthenticateOptionsEphemeralKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSAuthenticateOptions ephemeral](self, "ephemeral"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v59[8] = v4;
  v58[9] = CFSTR("AMSAuthenticateOptionsIgnoreAccountConversion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSAuthenticateOptions ignoreAccountConversion](self, "ignoreAccountConversion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v59[9] = v5;
  v58[10] = CFSTR("AMSAuthenticateOptionsRemoteProxyAuthenticationKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSAuthenticateOptions isRemoteProxyAuthentication](self, "isRemoteProxyAuthentication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v59[10] = v6;
  v58[11] = CFSTR("AMSAuthenticateOptionsServiceType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSAuthenticateOptions serviceType](self, "serviceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59[11] = v7;
  v58[12] = CFSTR("AMSAuthenticateOptionsServiceTokenOnly");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSAuthenticateOptions serviceTokenOnly](self, "serviceTokenOnly"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v59[12] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v47, "initWithDictionary:", v9);

  -[AMSAuthenticateOptions appProvidedContext](self, "appProvidedContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v11, CFSTR("AMSAuthenticateOptionsAppProvidedContext"));

  -[AMSAuthenticateOptions appProvidedData](self, "appProvidedData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v12, CFSTR("AMSAuthenticateOptionsAppProvidedData"));

  -[AMSAuthenticateOptions cancelButtonString](self, "cancelButtonString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v13, CFSTR("AMSAuthenticateOptionsCancelButtonString"));

  v14 = (void *)MEMORY[0x1E0CB36F8];
  -[AMSAuthenticateOptions clientInfo](self, "clientInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  objc_msgSend(v14, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v51);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v51;

  if (!v16)
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
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v20;
      v54 = 2114;
      v55 = v21;
      v56 = 2114;
      v57 = v22;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to archive the client info. error = %{public}@", buf, 0x20u);

    }
  }
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v16, CFSTR("AMSAuthenticateOptionsClientInfo"));
  -[AMSAuthenticateOptions companionDeviceClientInfo](self, "companionDeviceClientInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v23, *MEMORY[0x1E0CFAE88]);

  -[AMSAuthenticateOptions companionDeviceUDID](self, "companionDeviceUDID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v24, *MEMORY[0x1E0CFAE90]);

  -[AMSAuthenticateOptions createAccountQueryParams](self, "createAccountQueryParams");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v25, CFSTR("AMSAuthenticateOptionsCreateAccountQueryParamsKey"));

  -[AMSAuthenticateOptions debugReason](self, "debugReason");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v26, CFSTR("AMSAuthenticateOptionsDebugReason"));

  -[AMSAuthenticateOptions defaultButtonString](self, "defaultButtonString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v27, CFSTR("AMSAuthenticateOptionsDefaultButtonString"));

  -[AMSAuthenticateOptions delegateAuthChallenge](self, "delegateAuthChallenge");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v28, CFSTR("AMSAuthenticateOptionsDelegateAuthChallengeKey"));

  -[AMSAuthenticateOptions logKey](self, "logKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v29, CFSTR("AMSAuthenticateOptionsLogKeyKey"));

  -[AMSAuthenticateOptions metricsIdentifier](self, "metricsIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v30, CFSTR("AMSAuthenticateOptionsMetricsIdentifierKey"));

  -[AMSAuthenticateOptions HTTPHeaders](self, "HTTPHeaders");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v31, CFSTR("AMSAuthenticateOptionsHTTPHeadersKey"));

  -[AMSAuthenticateOptions passwordlessToken](self, "passwordlessToken");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v32, *MEMORY[0x1E0CFAE98]);

  -[AMSAuthenticateOptions promptTitle](self, "promptTitle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v33, CFSTR("AMSAuthenticateOptionsPromptTitle"));

  -[AMSAuthenticateOptions proxyAppBundleID](self, "proxyAppBundleID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v34, CFSTR("AMSAuthenticateOptionsProxyAppBundleIDKey"));

  -[AMSAuthenticateOptions proxyAppName](self, "proxyAppName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v35, CFSTR("AMSAuthenticateOptionsProxyAppNameKey"));

  -[AMSAuthenticateOptions reason](self, "reason");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v36, CFSTR("AMSAuthenticateOptionsReason"));

  -[AMSAuthenticateOptions serviceIdentifier](self, "serviceIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v37, CFSTR("AMSAuthenticateOptionsServiceIdentifierKey"));

  -[AMSAuthenticateOptions userAgent](self, "userAgent");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v38, CFSTR("AMSAuthenticateOptionsUserAgentKey"));

  -[AMSAuthenticateOptions userAgentSuffix](self, "userAgentSuffix");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v39, CFSTR("AMSAuthenticateOptionsUserAgentSuffixKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSAuthenticateOptions forceSyncToPairedWatch](self, "forceSyncToPairedWatch"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v40, CFSTR("AMSAuthenticateOptionsForceSyncToPairedWatchKey"));

  v41 = (void *)objc_msgSend(v10, "copy");
  return v41;
}

- (id)optionsDictionaryForRemoteProxyAuthentication
{
  _BYTE *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (_BYTE *)-[AMSAuthenticateOptions copy](self, "copy");
  v3[27] = 1;
  objc_msgSend(v3, "optionsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLinkType:", 2);
  objc_msgSend(v6, "serializedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      -[AMSAuthenticateOptions logKey](self, "logKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v10;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode AKDevice. Proxied authentication will fail.", (uint8_t *)&v15, 0x16u);

    }
  }
  objc_msgSend(v5, "ams_setNullableObject:forKey:", v7, *MEMORY[0x1E0CFAE08]);
  v13 = (void *)objc_msgSend(v5, "copy");

  return v13;
}

- (void)setAuthenticationType:(unint64_t)a3
{
  unint64_t v3;

  v3 = 2;
  if (a3 != 3)
    v3 = a3;
  self->_authenticationType = v3;
}

- (id)description
{
  void *v3;
  void *v4;

  -[AMSAuthenticateOptions optionsDictionary](self, "optionsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;

    if (!v5)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[AMSAuthenticateOptions optionsDictionary](self, "optionsDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "optionsDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToDictionary:", v7);

  }
  else
  {
    v5 = 0;
    v8 = 0;
    v6 = v4;
  }

LABEL_7:
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[AMSAuthenticateOptions optionsDictionary](self, "optionsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithOptionsDictionary:", v6);

  return v7;
}

- (id)mediaType
{
  void *v2;
  void *v3;

  -[AMSAuthenticateOptions clientInfo](self, "clientInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountMediaType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)presentingViewController
{
  return 0;
}

- (void)setMediaType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSAuthenticateOptions clientInfo](self, "clientInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountMediaType:", v4);

}

- (BOOL)allowServerDialogs
{
  return self->_allowServerDialogs;
}

- (void)setAllowServerDialogs:(BOOL)a3
{
  self->_allowServerDialogs = a3;
}

- (NSString)appProvidedContext
{
  return self->_appProvidedContext;
}

- (void)setAppProvidedContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)appProvidedData
{
  return self->_appProvidedData;
}

- (void)setAppProvidedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)cancelButtonString
{
  return self->_cancelButtonString;
}

- (void)setCancelButtonString:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonString, a3);
}

- (BOOL)canMakeAccountActive
{
  return self->_canMakeAccountActive;
}

- (void)setCanMakeAccountActive:(BOOL)a3
{
  self->_canMakeAccountActive = a3;
}

- (NSDictionary)createAccountQueryParams
{
  return self->_createAccountQueryParams;
}

- (void)setCreateAccountQueryParams:(id)a3
{
  objc_storeStrong((id *)&self->_createAccountQueryParams, a3);
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (unint64_t)credentialSource
{
  return self->_credentialSource;
}

- (void)setCredentialSource:(unint64_t)a3
{
  self->_credentialSource = a3;
}

- (NSString)debugReason
{
  return self->_debugReason;
}

- (void)setDebugReason:(id)a3
{
  objc_storeStrong((id *)&self->_debugReason, a3);
}

- (NSString)defaultButtonString
{
  return self->_defaultButtonString;
}

- (void)setDefaultButtonString:(id)a3
{
  objc_storeStrong((id *)&self->_defaultButtonString, a3);
}

- (NSString)delegateAuthChallenge
{
  return self->_delegateAuthChallenge;
}

- (void)setDelegateAuthChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_delegateAuthChallenge, a3);
}

- (BOOL)delegateAuthEnabled
{
  return self->_delegateAuthEnabled;
}

- (void)setDelegateAuthEnabled:(BOOL)a3
{
  self->_delegateAuthEnabled = a3;
}

- (BOOL)enableAccountCreation
{
  return self->_enableAccountCreation;
}

- (void)setEnableAccountCreation:(BOOL)a3
{
  self->_enableAccountCreation = a3;
}

- (NSDictionary)HTTPHeaders
{
  return self->_HTTPHeaders;
}

- (void)setHTTPHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_HTTPHeaders, a3);
}

- (NSURL)iconBundleURL
{
  return self->_iconBundleURL;
}

- (void)setIconBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconBundleURL, a3);
}

- (BOOL)ignoreAccountConversion
{
  return self->_ignoreAccountConversion;
}

- (void)setIgnoreAccountConversion:(BOOL)a3
{
  self->_ignoreAccountConversion = a3;
}

- (BOOL)forceSyncToPairedWatch
{
  return self->_forceSyncToPairedWatch;
}

- (void)setForceSyncToPairedWatch:(BOOL)a3
{
  self->_forceSyncToPairedWatch = a3;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (unint64_t)multiUserAuthentication
{
  return self->_multiUserAuthentication;
}

- (void)setMultiUserAuthentication:(unint64_t)a3
{
  self->_multiUserAuthentication = a3;
}

- (NSString)promptTitle
{
  return self->_promptTitle;
}

- (void)setPromptTitle:(id)a3
{
  objc_storeStrong((id *)&self->_promptTitle, a3);
}

- (NSString)proxyAppBundleID
{
  return self->_proxyAppBundleID;
}

- (void)setProxyAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_proxyAppBundleID, a3);
}

- (NSString)proxyAppName
{
  return self->_proxyAppName;
}

- (void)setProxyAppName:(id)a3
{
  objc_storeStrong((id *)&self->_proxyAppName, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_storeStrong((id *)&self->_userAgent, a3);
}

- (NSString)userAgentSuffix
{
  return self->_userAgentSuffix;
}

- (void)setUserAgentSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_userAgentSuffix, a3);
}

- (BOOL)usernameEditable
{
  return self->_usernameEditable;
}

- (void)setUsernameEditable:(BOOL)a3
{
  self->_usernameEditable = a3;
}

- (BOOL)serviceTokenOnly
{
  return self->_serviceTokenOnly;
}

- (void)setServiceTokenOnly:(BOOL)a3
{
  self->_serviceTokenOnly = a3;
}

- (unint64_t)allowPasswordGeneration
{
  return self->_allowPasswordGeneration;
}

- (void)setAllowPasswordGeneration:(unint64_t)a3
{
  self->_allowPasswordGeneration = a3;
}

- (BOOL)allowSecondaryCredentialSource
{
  return self->_allowSecondaryCredentialSource;
}

- (void)setAllowSecondaryCredentialSource:(BOOL)a3
{
  self->_allowSecondaryCredentialSource = a3;
}

- (NSString)companionDeviceClientInfo
{
  return self->_companionDeviceClientInfo;
}

- (void)setCompanionDeviceClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_companionDeviceClientInfo, a3);
}

- (NSString)companionDeviceUDID
{
  return self->_companionDeviceUDID;
}

- (void)setCompanionDeviceUDID:(id)a3
{
  objc_storeStrong((id *)&self->_companionDeviceUDID, a3);
}

- (BOOL)isDemoAccountSetup
{
  return self->_demoAccountSetup;
}

- (void)setDemoAccountSetup:(BOOL)a3
{
  self->_demoAccountSetup = a3;
}

- (BOOL)ephemeral
{
  return self->_ephemeral;
}

- (void)setEphemeral:(BOOL)a3
{
  self->_ephemeral = a3;
}

- (NSString)metricsIdentifier
{
  return self->_metricsIdentifier;
}

- (void)setMetricsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_metricsIdentifier, a3);
}

- (NSString)passwordlessToken
{
  return self->_passwordlessToken;
}

- (void)setPasswordlessToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (BOOL)isRemoteProxyAuthentication
{
  return self->_remoteProxyAuthentication;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_passwordlessToken, 0);
  objc_storeStrong((id *)&self->_metricsIdentifier, 0);
  objc_storeStrong((id *)&self->_companionDeviceUDID, 0);
  objc_storeStrong((id *)&self->_companionDeviceClientInfo, 0);
  objc_storeStrong((id *)&self->_userAgentSuffix, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_proxyAppName, 0);
  objc_storeStrong((id *)&self->_proxyAppBundleID, 0);
  objc_storeStrong((id *)&self->_promptTitle, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_iconBundleURL, 0);
  objc_storeStrong((id *)&self->_HTTPHeaders, 0);
  objc_storeStrong((id *)&self->_delegateAuthChallenge, 0);
  objc_storeStrong((id *)&self->_defaultButtonString, 0);
  objc_storeStrong((id *)&self->_debugReason, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_createAccountQueryParams, 0);
  objc_storeStrong((id *)&self->_cancelButtonString, 0);
  objc_storeStrong((id *)&self->_appProvidedData, 0);
  objc_storeStrong((id *)&self->_appProvidedContext, 0);
}

@end
