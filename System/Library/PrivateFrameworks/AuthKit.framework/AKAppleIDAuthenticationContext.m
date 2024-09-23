@implementation AKAppleIDAuthenticationContext

- (id)authKitAccount:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[AKAppleIDAuthenticationContext altDSID](self, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationContext DSID](self, "DSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationContext username](self, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v6, "length"))
    {
      +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "authKitAccountWithDSID:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_13;
      _AKLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v6;
        _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "No existing IdMS account for DSID %@", (uint8_t *)&v17, 0xCu);
      }
      v11 = -7067;
    }
    else if (objc_msgSend(v7, "length"))
    {
      +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "authKitAccountWithAppleID:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_13;
      _AKLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v7;
        _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "No existing IdMS account for username %@", (uint8_t *)&v17, 0xCu);
      }
      v11 = -7023;
    }
    else
    {
      _AKLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "No altDSID, DSID or username passed on context, unable to find account", (uint8_t *)&v17, 2u);
      }
      v11 = -7044;
    }
LABEL_22:

    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (!a3)
      goto LABEL_15;
    goto LABEL_14;
  }
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authKitAccountWithAltDSID:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v5;
      _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "No existing IdMS account for altDSID %@", (uint8_t *)&v17, 0xCu);
    }
    v11 = -7055;
    goto LABEL_22;
  }
LABEL_13:
  v15 = 0;
  if (a3)
LABEL_14:
    *a3 = objc_retainAutorelease(v15);
LABEL_15:

  return v9;
}

- (id)authKitAccountForSilentServiceToken:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t v10[16];

  -[AKAppleIDAuthenticationContext username](self, "username");
  v5 = objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationContext altDSID](self, "altDSID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 | v6 && !-[AKAppleIDAuthenticationContext isUsernameEditable](self, "isUsernameEditable"))
  {
    -[AKAppleIDAuthenticationContext authKitAccount:](self, "authKitAccount:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Cannot pull up IDMS account without immutable username or altDSID.", v10, 2u);
    }

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7044);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAppleIDAuthenticationContext)init
{
  void *v3;
  AKAppleIDAuthenticationContext *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AKAppleIDAuthenticationContext _initWithIdentifier:](self, "_initWithIdentifier:", v3);

  return v4;
}

- (id)_initWithIdentifier:(id)a3
{
  id v4;
  AKAppleIDAuthenticationContext *v5;
  uint64_t v6;
  NSUUID *identifier;
  void *v8;
  void *v9;
  uint64_t v10;
  NSSet *desiredInternalTokens;
  NSString *securityUpgradeContext;
  void *v13;
  uint64_t v14;
  NSString *telemetryFlowID;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AKAppleIDAuthenticationContext;
  v5 = -[AKAppleIDAuthenticationContext init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_isUsernameEditable = 1;
    v5->_isPasswordEditable = 1;
    *(_WORD *)&v5->_shouldSendIdentityTokenForRemoteUI = 257;
    v5->_maximumLoginAttempts = 3;
    v5->_shouldUpdatePersistentServiceTokens = 1;
    v8 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = CFSTR("AKAuthenticationInternalTokenCK");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    desiredInternalTokens = v5->_desiredInternalTokens;
    v5->_desiredInternalTokens = (NSSet *)v10;

    securityUpgradeContext = v5->_securityUpgradeContext;
    v5->_securityUpgradeContext = (NSString *)CFSTR("com.apple.authkit.generic");

    v5->_supportsPiggybacking = 0;
    v5->_enablePasscodeAuth = 1;
    v5->_passcodeOnlyPolicy = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    telemetryFlowID = v5->_telemetryFlowID;
    v5->_telemetryFlowID = (NSString *)v14;

    v5->_isRequestedFromOOPViewService = 0;
    v5->_shouldRequestConfigurationInfo = 1;
    v5->_allowAuthenticationBeforeFirstUnlock = 0;
  }

  return v5;
}

- (AKAppleIDAuthenticationContext)initWithAuthenticatedServerRequestContext:(id)a3
{
  id v4;
  AKAppleIDAuthenticationContext *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSString *altDSID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKAppleIDAuthenticationContext;
  v5 = -[AKAppleIDAuthenticationContext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_identifierForContext:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "altDSID");
    v8 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

  }
  return v5;
}

- (AKAppleIDAuthenticationContext)initWithContext:(id)a3
{
  id v4;
  AKAppleIDAuthenticationContext *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSString *proxiedAppName;
  uint64_t v10;
  NSString *altDSID;
  uint64_t v12;
  NSDictionary *appProvidedData;
  uint64_t v14;
  AKDevice *companionDevice;
  uint64_t v16;
  AKDevice *proxiedDevice;
  uint64_t v18;
  NSString *appProvidedContext;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AKAppleIDAuthenticationContext;
  v5 = -[AKAppleIDAuthenticationContext init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_identifierForContext:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "_proxiedAppName");
    v8 = objc_claimAutoreleasedReturnValue();
    proxiedAppName = v5->_proxiedAppName;
    v5->_proxiedAppName = (NSString *)v8;

    objc_msgSend(v4, "altDSID");
    v10 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    objc_msgSend(v4, "appProvidedData");
    v12 = objc_claimAutoreleasedReturnValue();
    appProvidedData = v5->_appProvidedData;
    v5->_appProvidedData = (NSDictionary *)v12;

    objc_msgSend(v4, "companionDevice");
    v14 = objc_claimAutoreleasedReturnValue();
    companionDevice = v5->_companionDevice;
    v5->_companionDevice = (AKDevice *)v14;

    objc_msgSend(v4, "proxiedDevice");
    v16 = objc_claimAutoreleasedReturnValue();
    proxiedDevice = v5->_proxiedDevice;
    v5->_proxiedDevice = (AKDevice *)v16;

    v5->_serviceType = objc_msgSend(v4, "serviceType");
    objc_msgSend(v4, "appProvidedContext");
    v18 = objc_claimAutoreleasedReturnValue();
    appProvidedContext = v5->_appProvidedContext;
    v5->_appProvidedContext = (NSString *)v18;

  }
  return v5;
}

- (AKAppleIDAuthenticationContext)initWithCoder:(id)a3
{
  id v4;
  AKAppleIDAuthenticationContext *v5;
  uint64_t v6;
  NSString *reason;
  uint64_t v8;
  NSString *username;
  void *v10;
  uint64_t v11;
  NSString *DSID;
  uint64_t v13;
  NSString *altDSID;
  uint64_t v15;
  NSString *telemetryDeviceSessionID;
  uint64_t v17;
  NSString *telemetryFlowID;
  uint64_t v19;
  NSString *dependentAltDSID;
  void *v21;
  uint64_t v22;
  NSString *proxiedAppBundleID;
  uint64_t v24;
  NSString *proxiedAppName;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *serviceIdentifiers;
  uint64_t v31;
  NSUUID *identifier;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSString *passwordPromptTitle;
  uint64_t v40;
  NSString *defaultButtonString;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSDictionary *httpHeadersForRemoteUI;
  uint64_t v47;
  NSString *remoteUIIdentityToken;
  uint64_t v49;
  NSString *password;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSString *generatedCode;
  uint64_t v60;
  NSNumber *latitude;
  uint64_t v62;
  NSNumber *longitude;
  uint64_t v64;
  NSString *deviceClass;
  uint64_t v66;
  NSString *deviceColor;
  uint64_t v68;
  NSString *deviceEnclosureColor;
  uint64_t v70;
  NSString *notificationDisclaimer;
  void *v72;
  void *v73;
  uint64_t v74;
  AKAnisetteData *proxiedDeviceAnisetteData;
  uint64_t v76;
  AKDevice *proxiedDevice;
  uint64_t v78;
  AKAnisetteData *companionDeviceAnisetteData;
  uint64_t v80;
  AKDevice *companionDevice;
  uint64_t v82;
  NSNumber *isAppleIDLoginEnabled;
  uint64_t v84;
  NSNumber *hasEmptyPassword;
  void *v86;
  uint64_t v87;
  NSString *shortLivedToken;
  uint64_t v89;
  NSString *identityToken;
  void *v91;
  void *v92;
  uint64_t v93;
  NSString *message;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  NSSet *desiredInternalTokens;
  uint64_t v100;
  NSString *title;
  void *v102;
  uint64_t v103;
  NSString *securityUpgradeContext;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  NSDictionary *appProvidedData;
  uint64_t v113;
  NSString *appProvidedContext;
  uint64_t v115;
  NSString *masterKey;
  uint64_t v117;
  NSString *cancelButtonString;
  uint64_t v119;
  NSString *alternativeButtonString;
  uint64_t v121;
  NSString *windowTitle;
  uint64_t v123;
  NSString *privacyBundleIdentifier;
  uint64_t v125;
  NSString *passwordlessToken;
  uint64_t v127;
  NSString *idmsDataToken;
  uint64_t v129;
  NSData *displayImageData;
  uint64_t v131;
  NSString *callerIconBundlePath;
  uint64_t v133;
  NSString *localizedCallerName;
  uint64_t v135;
  NSString *custodianRecoveryToken;
  uint64_t v137;
  NSString *sourceAltDSID;
  uint64_t v139;
  NSString *serviceToken;
  uint64_t v141;
  NSString *proxiedAppleID;
  uint64_t v143;
  AKCompanionKeyEnvelope *companionKeyEnvelope;
  objc_super v146;
  _QWORD v147[2];
  _QWORD v148[3];

  v148[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v146.receiver = self;
  v146.super_class = (Class)AKAppleIDAuthenticationContext;
  v5 = -[AKAppleIDAuthenticationContext init](&v146, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_reason"));
    v6 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_username"));
    v8 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isUsernameEditable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isUsernameEditable = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_DSID"));
    v11 = objc_claimAutoreleasedReturnValue();
    DSID = v5->_DSID;
    v5->_DSID = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v13 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_telemetryDeviceSessionID"));
    v15 = objc_claimAutoreleasedReturnValue();
    telemetryDeviceSessionID = v5->_telemetryDeviceSessionID;
    v5->_telemetryDeviceSessionID = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_telemetryFlowID"));
    v17 = objc_claimAutoreleasedReturnValue();
    telemetryFlowID = v5->_telemetryFlowID;
    v5->_telemetryFlowID = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dependentAltDSID"));
    v19 = objc_claimAutoreleasedReturnValue();
    dependentAltDSID = v5->_dependentAltDSID;
    v5->_dependentAltDSID = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isProxyingForApp"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isProxyingForApp = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedAppBundleID"));
    v22 = objc_claimAutoreleasedReturnValue();
    proxiedAppBundleID = v5->_proxiedAppBundleID;
    v5->_proxiedAppBundleID = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedAppName"));
    v24 = objc_claimAutoreleasedReturnValue();
    proxiedAppName = v5->_proxiedAppName;
    v5->_proxiedAppName = (NSString *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("_serviceIdentifiers"));
    v29 = objc_claimAutoreleasedReturnValue();
    serviceIdentifiers = v5->_serviceIdentifiers;
    v5->_serviceIdentifiers = (NSArray *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceType"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_serviceType = objc_msgSend(v33, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maximumLoginAttempts"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maximumLoginAttempts = objc_msgSend(v34, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isEphemeral"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isEphemeral = objc_msgSend(v35, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldAllowAppleIDCreation"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldAllowAppleIDCreation = objc_msgSend(v36, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldPromptForPasswordOnly"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldPromptForPasswordOnly = objc_msgSend(v37, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_passwordPromptTitle"));
    v38 = objc_claimAutoreleasedReturnValue();
    passwordPromptTitle = v5->_passwordPromptTitle;
    v5->_passwordPromptTitle = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_defaultButtonString"));
    v40 = objc_claimAutoreleasedReturnValue();
    defaultButtonString = v5->_defaultButtonString;
    v5->_defaultButtonString = (NSString *)v40;

    v42 = (void *)MEMORY[0x1E0C99E60];
    v148[0] = objc_opt_class();
    v148[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setWithArray:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("_httpHeadersForRemoteUI"));
    v45 = objc_claimAutoreleasedReturnValue();
    httpHeadersForRemoteUI = v5->_httpHeadersForRemoteUI;
    v5->_httpHeadersForRemoteUI = (NSDictionary *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_remoteUIIdentityToken"));
    v47 = objc_claimAutoreleasedReturnValue();
    remoteUIIdentityToken = v5->_remoteUIIdentityToken;
    v5->_remoteUIIdentityToken = (NSString *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_password"));
    v49 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isPasswordEditable"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isPasswordEditable = objc_msgSend(v51, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldUpdatePersistentServiceTokens"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldUpdatePersistentServiceTokens = objc_msgSend(v52, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldOfferSecurityUpgrade"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldOfferSecurityUpgrade = objc_msgSend(v53, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_needsCredentialRecovery"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_needsCredentialRecovery = objc_msgSend(v54, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_needsNewAppleID"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_needsNewAppleID = objc_msgSend(v55, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_needsPasswordChange"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_needsPasswordChange = objc_msgSend(v56, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldPreventInteractiveAuth"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldPreventInteractiveAuth = objc_msgSend(v57, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_generatedCode"));
    v58 = objc_claimAutoreleasedReturnValue();
    generatedCode = v5->_generatedCode;
    v5->_generatedCode = (NSString *)v58;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_latitude"));
    v60 = objc_claimAutoreleasedReturnValue();
    latitude = v5->_latitude;
    v5->_latitude = (NSNumber *)v60;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_longitude"));
    v62 = objc_claimAutoreleasedReturnValue();
    longitude = v5->_longitude;
    v5->_longitude = (NSNumber *)v62;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deviceClass"));
    v64 = objc_claimAutoreleasedReturnValue();
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = (NSString *)v64;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deviceColor"));
    v66 = objc_claimAutoreleasedReturnValue();
    deviceColor = v5->_deviceColor;
    v5->_deviceColor = (NSString *)v66;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deviceEnclosureColor"));
    v68 = objc_claimAutoreleasedReturnValue();
    deviceEnclosureColor = v5->_deviceEnclosureColor;
    v5->_deviceEnclosureColor = (NSString *)v68;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_notificationDisclaimer"));
    v70 = objc_claimAutoreleasedReturnValue();
    notificationDisclaimer = v5->_notificationDisclaimer;
    v5->_notificationDisclaimer = (NSString *)v70;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldForceInteractiveAuth"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldForceInteractiveAuth = objc_msgSend(v72, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_capabilityForUIDisplay"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_capabilityForUIDisplay = objc_msgSend(v73, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedDeviceAnisetteData"));
    v74 = objc_claimAutoreleasedReturnValue();
    proxiedDeviceAnisetteData = v5->_proxiedDeviceAnisetteData;
    v5->_proxiedDeviceAnisetteData = (AKAnisetteData *)v74;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedDevice"));
    v76 = objc_claimAutoreleasedReturnValue();
    proxiedDevice = v5->_proxiedDevice;
    v5->_proxiedDevice = (AKDevice *)v76;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_companionDeviceAnisetteData"));
    v78 = objc_claimAutoreleasedReturnValue();
    companionDeviceAnisetteData = v5->_companionDeviceAnisetteData;
    v5->_companionDeviceAnisetteData = (AKAnisetteData *)v78;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_companionDevice"));
    v80 = objc_claimAutoreleasedReturnValue();
    companionDevice = v5->_companionDevice;
    v5->_companionDevice = (AKDevice *)v80;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isAppleIDLoginEnabled"));
    v82 = objc_claimAutoreleasedReturnValue();
    isAppleIDLoginEnabled = v5->_isAppleIDLoginEnabled;
    v5->_isAppleIDLoginEnabled = (NSNumber *)v82;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hasEmptyPassword"));
    v84 = objc_claimAutoreleasedReturnValue();
    hasEmptyPassword = v5->_hasEmptyPassword;
    v5->_hasEmptyPassword = (NSNumber *)v84;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldRequestShortLivedToken"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldRequestShortLivedToken = objc_msgSend(v86, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shortLivedToken"));
    v87 = objc_claimAutoreleasedReturnValue();
    shortLivedToken = v5->_shortLivedToken;
    v5->_shortLivedToken = (NSString *)v87;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identityToken"));
    v89 = objc_claimAutoreleasedReturnValue();
    identityToken = v5->_identityToken;
    v5->_identityToken = (NSString *)v89;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldRequestConfigurationInfo"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldRequestConfigurationInfo = objc_msgSend(v91, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isTriggeredByNotification"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isTriggeredByNotification = objc_msgSend(v92, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_message"));
    v93 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v93;

    v5->_anticipateEscrowAttempt = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_anticipateEscrowAttempt"));
    v5->_isFirstTimeLogin = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isFirstTimeLogin"));
    v5->_supportsPiggybacking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsPiggybacking"));
    v95 = (void *)MEMORY[0x1E0C99E60];
    v147[0] = objc_opt_class();
    v147[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 2);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setWithArray:", v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v97, CFSTR("_desiredInternalTokens"));
    v98 = objc_claimAutoreleasedReturnValue();
    desiredInternalTokens = v5->_desiredInternalTokens;
    v5->_desiredInternalTokens = (NSSet *)v98;

    v5->_shouldSkipSettingsLaunchAlert = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldSkipSettingsLaunchAlert"));
    v5->_shouldSendIdentityTokenForRemoteUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldSendIdentityTokenForRemoteUI"));
    v5->_shouldRequestRecoveryPET = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldRequestRecoveryPET"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v100 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v100;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldSkipInitialReachabilityCheck"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldSkipInitialReachabilityCheck = objc_msgSend(v102, "BOOLValue");

    v5->_attemptIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_attemptIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_securityUpgradeContext"));
    v103 = objc_claimAutoreleasedReturnValue();
    securityUpgradeContext = v5->_securityUpgradeContext;
    v5->_securityUpgradeContext = (NSString *)v103;

    v5->_authenticationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_authenticationType"));
    v5->_shouldSendGrandSlamTokensForRemoteUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldSendGrandSlamTokensForRemoteUI"));
    v5->_needsRepair = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_needsRepair"));
    v105 = (void *)MEMORY[0x1E0C99E60];
    v106 = objc_opt_class();
    v107 = objc_opt_class();
    v108 = objc_opt_class();
    v109 = objc_opt_class();
    objc_msgSend(v105, "setWithObjects:", v106, v107, v108, v109, objc_opt_class(), 0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v110, CFSTR("_appProvidedData"));
    v111 = objc_claimAutoreleasedReturnValue();
    appProvidedData = v5->_appProvidedData;
    v5->_appProvidedData = (NSDictionary *)v111;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appProvidedContext"));
    v113 = objc_claimAutoreleasedReturnValue();
    appProvidedContext = v5->_appProvidedContext;
    v5->_appProvidedContext = (NSString *)v113;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_masterKey"));
    v115 = objc_claimAutoreleasedReturnValue();
    masterKey = v5->_masterKey;
    v5->_masterKey = (NSString *)v115;

    v5->_performUIOutOfProcess = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_performUIOutOfProcess"));
    v5->_keepAlive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_keepAlive"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cancelButtonString"));
    v117 = objc_claimAutoreleasedReturnValue();
    cancelButtonString = v5->_cancelButtonString;
    v5->_cancelButtonString = (NSString *)v117;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_alternativeButtonString"));
    v119 = objc_claimAutoreleasedReturnValue();
    alternativeButtonString = v5->_alternativeButtonString;
    v5->_alternativeButtonString = (NSString *)v119;

    v5->_hideAlternativeButton = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hideAlternativeButton"));
    v5->_hideCancelButton = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hideCancelButton"));
    v5->_hideReasonString = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hideReasonString"));
    v5->_clientShouldHandleAlternativeButtonAction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_clientShouldHandleAlternativeButtonAction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_windowTitle"));
    v121 = objc_claimAutoreleasedReturnValue();
    windowTitle = v5->_windowTitle;
    v5->_windowTitle = (NSString *)v121;

    v5->_alwaysShowUsernameField = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_alwaysShowUsernameField"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_privacyBundleIdentifier"));
    v123 = objc_claimAutoreleasedReturnValue();
    privacyBundleIdentifier = v5->_privacyBundleIdentifier;
    v5->_privacyBundleIdentifier = (NSString *)v123;

    v5->_authenticationPromptStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_authenticationPromptStyle"));
    v5->_needsNewChildAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_needsNewChildAccount"));
    v5->_authenticationMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_authenticationMode"));
    v5->_isMDMInformationRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isMDMInformationRequired"));
    v5->_cliMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_cliMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passwordlessToken"));
    v125 = objc_claimAutoreleasedReturnValue();
    passwordlessToken = v5->_passwordlessToken;
    v5->_passwordlessToken = (NSString *)v125;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idmsDataToken"));
    v127 = objc_claimAutoreleasedReturnValue();
    idmsDataToken = v5->_idmsDataToken;
    v5->_idmsDataToken = (NSString *)v127;

    v5->_needsSecurityUpgradeUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_needsSecurityUpgradeUI"));
    v5->_isRKVerification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isRKVerification"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayImageData"));
    v129 = objc_claimAutoreleasedReturnValue();
    displayImageData = v5->_displayImageData;
    v5->_displayImageData = (NSData *)v129;

    v5->_verifyCredentialReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_verifyCredentialReason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_callerIconBundlePath"));
    v131 = objc_claimAutoreleasedReturnValue();
    callerIconBundlePath = v5->_callerIconBundlePath;
    v5->_callerIconBundlePath = (NSString *)v131;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localizedCallerName"));
    v133 = objc_claimAutoreleasedReturnValue();
    localizedCallerName = v5->_localizedCallerName;
    v5->_localizedCallerName = (NSString *)v133;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianRecoveryToken"));
    v135 = objc_claimAutoreleasedReturnValue();
    custodianRecoveryToken = v5->_custodianRecoveryToken;
    v5->_custodianRecoveryToken = (NSString *)v135;

    v5->_forceEligibleForForegroundAuthentication = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_forceEligibleForForegroundAuthentication"));
    v5->_deviceRegionRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_deviceRegionRequired"));
    v5->_disableProximityAuth = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_disableProximityAuth"));
    v5->_shouldBroadcastForProximityAuthOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldBroadcastForProximityAuthOnly"));
    v5->_enablePasscodeAuth = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_enablePasscodeAuth"));
    v5->_passcodeOnlyPolicy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_passcodeOnlyPolicy"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceAltDSID"));
    v137 = objc_claimAutoreleasedReturnValue();
    sourceAltDSID = v5->_sourceAltDSID;
    v5->_sourceAltDSID = (NSString *)v137;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceToken"));
    v139 = objc_claimAutoreleasedReturnValue();
    serviceToken = v5->_serviceToken;
    v5->_serviceToken = (NSString *)v139;

    v5->_isNativeTakeover = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isNativeTakeover"));
    v5->_ignorePasswordCache = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_ignorePasswordCache"));
    v5->_ignoreShouldContinueProxy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_ignoreShouldContinueProxy"));
    v5->_isRequestedFromOOPViewService = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isRequestedFromOOPViewService"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedAppleID"));
    v141 = objc_claimAutoreleasedReturnValue();
    proxiedAppleID = v5->_proxiedAppleID;
    v5->_proxiedAppleID = (NSString *)v141;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_companionKeyEnvelope"));
    v143 = objc_claimAutoreleasedReturnValue();
    companionKeyEnvelope = v5->_companionKeyEnvelope;
    v5->_companionKeyEnvelope = (AKCompanionKeyEnvelope *)v143;

    v5->_piggybackingForTrustedDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_piggybackingForTrustedDevice"));
    v5->_allowAuthenticationBeforeFirstUnlock = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allowAuthenticationBeforeFirstUnlock"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *reason;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  reason = self->_reason;
  v25 = a3;
  objc_msgSend(v25, "encodeObject:forKey:", reason, CFSTR("_reason"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_username, CFSTR("_username"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUsernameEditable);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v5, CFSTR("_isUsernameEditable"));

  objc_msgSend(v25, "encodeObject:forKey:", self->_DSID, CFSTR("_DSID"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_altDSID, CFSTR("_altDSID"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_telemetryDeviceSessionID, CFSTR("_telemetryDeviceSessionID"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_telemetryFlowID, CFSTR("_telemetryFlowID"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_dependentAltDSID, CFSTR("_dependentAltDSID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isProxyingForApp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v6, CFSTR("_isProxyingForApp"));

  objc_msgSend(v25, "encodeObject:forKey:", self->_proxiedAppBundleID, CFSTR("_proxiedAppBundleID"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_proxiedAppName, CFSTR("_proxiedAppName"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_serviceIdentifiers, CFSTR("_serviceIdentifiers"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_serviceType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v7, CFSTR("_serviceType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maximumLoginAttempts);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v8, CFSTR("_maximumLoginAttempts"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEphemeral);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v9, CFSTR("_isEphemeral"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldAllowAppleIDCreation);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v10, CFSTR("_shouldAllowAppleIDCreation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldPromptForPasswordOnly);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v11, CFSTR("_shouldPromptForPasswordOnly"));

  objc_msgSend(v25, "encodeObject:forKey:", self->_passwordPromptTitle, CFSTR("_passwordPromptTitle"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_defaultButtonString, CFSTR("_defaultButtonString"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_httpHeadersForRemoteUI, CFSTR("_httpHeadersForRemoteUI"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_remoteUIIdentityToken, CFSTR("_remoteUIIdentityToken"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_password, CFSTR("_password"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPasswordEditable);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v12, CFSTR("_isPasswordEditable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldUpdatePersistentServiceTokens);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v13, CFSTR("_shouldUpdatePersistentServiceTokens"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldOfferSecurityUpgrade);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v14, CFSTR("_shouldOfferSecurityUpgrade"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_needsCredentialRecovery);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v15, CFSTR("_needsCredentialRecovery"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_needsNewAppleID);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v16, CFSTR("_needsNewAppleID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_needsPasswordChange);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v17, CFSTR("_needsPasswordChange"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldPreventInteractiveAuth);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v18, CFSTR("_shouldPreventInteractiveAuth"));

  objc_msgSend(v25, "encodeObject:forKey:", self->_generatedCode, CFSTR("_generatedCode"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_latitude, CFSTR("_latitude"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_longitude, CFSTR("_longitude"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_deviceClass, CFSTR("_deviceClass"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_deviceColor, CFSTR("_deviceColor"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_deviceEnclosureColor, CFSTR("_deviceEnclosureColor"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_notificationDisclaimer, CFSTR("_notificationDisclaimer"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldForceInteractiveAuth);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v19, CFSTR("_shouldForceInteractiveAuth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_capabilityForUIDisplay);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v20, CFSTR("_capabilityForUIDisplay"));

  objc_msgSend(v25, "encodeObject:forKey:", self->_proxiedDeviceAnisetteData, CFSTR("_proxiedDeviceAnisetteData"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_proxiedDevice, CFSTR("_proxiedDevice"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_companionDeviceAnisetteData, CFSTR("_companionDeviceAnisetteData"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_companionDevice, CFSTR("_companionDevice"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_isAppleIDLoginEnabled, CFSTR("_isAppleIDLoginEnabled"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_hasEmptyPassword, CFSTR("_hasEmptyPassword"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldRequestShortLivedToken);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v21, CFSTR("_shouldRequestShortLivedToken"));

  objc_msgSend(v25, "encodeObject:forKey:", self->_shortLivedToken, CFSTR("_shortLivedToken"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_identityToken, CFSTR("_identityToken"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldRequestConfigurationInfo);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v22, CFSTR("_shouldRequestConfigurationInfo"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTriggeredByNotification);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v23, CFSTR("_isTriggeredByNotification"));

  objc_msgSend(v25, "encodeObject:forKey:", self->_message, CFSTR("_message"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_anticipateEscrowAttempt, CFSTR("_anticipateEscrowAttempt"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_isFirstTimeLogin, CFSTR("_isFirstTimeLogin"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_supportsPiggybacking, CFSTR("_supportsPiggybacking"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_desiredInternalTokens, CFSTR("_desiredInternalTokens"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_shouldSkipSettingsLaunchAlert, CFSTR("_shouldSkipSettingsLaunchAlert"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_shouldSendIdentityTokenForRemoteUI, CFSTR("_shouldSendIdentityTokenForRemoteUI"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_shouldRequestRecoveryPET, CFSTR("_shouldRequestRecoveryPET"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_title, CFSTR("_title"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_helpAnchor, CFSTR("_helpAnchor"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_helpBook, CFSTR("_helpBook"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldSkipInitialReachabilityCheck);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v24, CFSTR("_shouldSkipInitialReachabilityCheck"));

  objc_msgSend(v25, "encodeInteger:forKey:", self->_attemptIndex, CFSTR("_attemptIndex"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_securityUpgradeContext, CFSTR("_securityUpgradeContext"));
  objc_msgSend(v25, "encodeInteger:forKey:", self->_authenticationType, CFSTR("_authenticationType"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_shouldSendGrandSlamTokensForRemoteUI, CFSTR("_shouldSendGrandSlamTokensForRemoteUI"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_needsRepair, CFSTR("_needsRepair"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_appProvidedData, CFSTR("_appProvidedData"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_appProvidedContext, CFSTR("_appProvidedContext"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_masterKey, CFSTR("_masterKey"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_performUIOutOfProcess, CFSTR("_performUIOutOfProcess"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_keepAlive, CFSTR("_keepAlive"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_cancelButtonString, CFSTR("_cancelButtonString"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_alternativeButtonString, CFSTR("_alternativeButtonString"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_hideAlternativeButton, CFSTR("_hideAlternativeButton"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_hideCancelButton, CFSTR("_hideCancelButton"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_hideReasonString, CFSTR("_hideReasonString"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_clientShouldHandleAlternativeButtonAction, CFSTR("_clientShouldHandleAlternativeButtonAction"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_windowTitle, CFSTR("_windowTitle"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_alwaysShowUsernameField, CFSTR("_alwaysShowUsernameField"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_privacyBundleIdentifier, CFSTR("_privacyBundleIdentifier"));
  objc_msgSend(v25, "encodeInteger:forKey:", self->_authenticationPromptStyle, CFSTR("_authenticationPromptStyle"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_needsNewChildAccount, CFSTR("_needsNewChildAccount"));
  objc_msgSend(v25, "encodeInteger:forKey:", self->_authenticationMode, CFSTR("_authenticationMode"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_isMDMInformationRequired, CFSTR("_isMDMInformationRequired"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_cliMode, CFSTR("_cliMode"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_passwordlessToken, CFSTR("passwordlessToken"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_idmsDataToken, CFSTR("idmsDataToken"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_needsSecurityUpgradeUI, CFSTR("_needsSecurityUpgradeUI"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_isRKVerification, CFSTR("_isRKVerification"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_displayImageData, CFSTR("_displayImageData"));
  objc_msgSend(v25, "encodeInteger:forKey:", self->_verifyCredentialReason, CFSTR("_verifyCredentialReason"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_callerIconBundlePath, CFSTR("_callerIconBundlePath"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_localizedCallerName, CFSTR("_localizedCallerName"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_custodianRecoveryToken, CFSTR("_custodianRecoveryToken"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_forceEligibleForForegroundAuthentication, CFSTR("_forceEligibleForForegroundAuthentication"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_deviceRegionRequired, CFSTR("_deviceRegionRequired"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_disableProximityAuth, CFSTR("_disableProximityAuth"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_shouldBroadcastForProximityAuthOnly, CFSTR("_shouldBroadcastForProximityAuthOnly"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_enablePasscodeAuth, CFSTR("_enablePasscodeAuth"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_passcodeOnlyPolicy, CFSTR("_passcodeOnlyPolicy"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_sourceAltDSID, CFSTR("_sourceAltDSID"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_serviceToken, CFSTR("_serviceToken"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_isNativeTakeover, CFSTR("_isNativeTakeover"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_ignorePasswordCache, CFSTR("_ignorePasswordCache"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_ignoreShouldContinueProxy, CFSTR("_ignoreShouldContinueProxy"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_isRequestedFromOOPViewService, CFSTR("_isRequestedFromOOPViewService"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_proxiedAppleID, CFSTR("_proxiedAppleID"));
  objc_msgSend(v25, "encodeObject:forKey:", self->_companionKeyEnvelope, CFSTR("_companionKeyEnvelope"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_piggybackingForTrustedDevice, CFSTR("_piggybackingForTrustedDevice"));
  objc_msgSend(v25, "encodeBool:forKey:", self->_allowAuthenticationBeforeFirstUnlock, CFSTR("_allowAuthenticationBeforeFirstUnlock"));

}

- (id)_sanitizedCopy
{
  AKAppleIDAuthenticationContext *v3;
  uint64_t v4;
  NSString *reason;
  uint64_t v6;
  NSString *username;
  uint64_t v8;
  NSString *DSID;
  NSObject *v10;
  uint64_t v11;
  NSString *altDSID;
  uint64_t v13;
  NSString *telemetryDeviceSessionID;
  uint64_t v15;
  NSString *telemetryFlowID;
  uint64_t v17;
  NSString *dependentAltDSID;
  uint64_t v19;
  NSString *proxiedAppBundleID;
  uint64_t v21;
  NSString *proxiedAppName;
  uint64_t v23;
  NSArray *serviceIdentifiers;
  uint64_t v25;
  NSUUID *identifier;
  uint64_t v27;
  NSString *passwordPromptTitle;
  uint64_t v29;
  NSString *defaultButtonString;
  uint64_t v31;
  NSDictionary *httpHeadersForRemoteUI;
  uint64_t v33;
  NSString *remoteUIIdentityToken;
  uint64_t v35;
  NSString *password;
  uint64_t v37;
  NSString *generatedCode;
  uint64_t v39;
  NSNumber *latitude;
  uint64_t v41;
  NSNumber *longitude;
  uint64_t v43;
  NSString *deviceClass;
  uint64_t v45;
  NSString *deviceColor;
  uint64_t v47;
  NSString *deviceEnclosureColor;
  uint64_t v49;
  NSString *notificationDisclaimer;
  uint64_t v51;
  AKAnisetteData *proxiedDeviceAnisetteData;
  uint64_t v53;
  AKDevice *proxiedDevice;
  uint64_t v55;
  AKAnisetteData *companionDeviceAnisetteData;
  uint64_t v57;
  AKDevice *companionDevice;
  uint64_t v59;
  NSNumber *isAppleIDLoginEnabled;
  uint64_t v61;
  NSNumber *hasEmptyPassword;
  uint64_t v63;
  NSString *shortLivedToken;
  uint64_t v65;
  NSString *identityToken;
  uint64_t v67;
  NSString *message;
  uint64_t v69;
  NSSet *desiredInternalTokens;
  uint64_t v71;
  NSString *title;
  uint64_t v73;
  NSString *helpAnchor;
  uint64_t v75;
  NSString *helpBook;
  uint64_t v77;
  NSDictionary *appProvidedData;
  uint64_t v79;
  NSString *masterKey;
  uint64_t v81;
  NSString *cancelButtonString;
  uint64_t v83;
  NSString *alternativeButtonString;
  uint64_t v85;
  NSString *windowTitle;
  uint64_t v87;
  NSString *privacyBundleIdentifier;
  uint64_t v89;
  NSData *displayImageData;
  uint64_t v91;
  NSString *callerIconBundlePath;
  uint64_t v93;
  NSString *localizedCallerName;
  uint64_t v95;
  NSString *custodianRecoveryToken;
  uint64_t v97;
  NSString *sourceAltDSID;
  uint64_t v99;
  NSString *serviceToken;
  uint64_t v101;
  NSString *proxiedAppleID;
  uint64_t v103;
  AKCompanionKeyEnvelope *companionKeyEnvelope;

  v3 = objc_alloc_init(AKAppleIDAuthenticationContext);
  v4 = -[NSString copy](self->_reason, "copy");
  reason = v3->_reason;
  v3->_reason = (NSString *)v4;

  v6 = -[NSString copy](self->_username, "copy");
  username = v3->_username;
  v3->_username = (NSString *)v6;

  v3->_isUsernameEditable = self->_isUsernameEditable;
  v8 = -[NSString copy](self->_DSID, "copy");
  DSID = v3->_DSID;
  v3->_DSID = (NSString *)v8;

  if (-[NSString ak_isEmailAddress](self->_altDSID, "ak_isEmailAddress"))
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[AKAppleIDAuthenticationContext _sanitizedCopy].cold.1();

  }
  else
  {
    v11 = -[NSString copy](self->_altDSID, "copy");
    altDSID = v3->_altDSID;
    v3->_altDSID = (NSString *)v11;

  }
  v13 = -[NSString copy](self->_telemetryDeviceSessionID, "copy");
  telemetryDeviceSessionID = v3->_telemetryDeviceSessionID;
  v3->_telemetryDeviceSessionID = (NSString *)v13;

  v15 = -[NSString copy](self->_telemetryFlowID, "copy");
  telemetryFlowID = v3->_telemetryFlowID;
  v3->_telemetryFlowID = (NSString *)v15;

  v17 = -[NSString copy](self->_dependentAltDSID, "copy");
  dependentAltDSID = v3->_dependentAltDSID;
  v3->_dependentAltDSID = (NSString *)v17;

  v3->_isProxyingForApp = self->_isProxyingForApp;
  v19 = -[NSString copy](self->_proxiedAppBundleID, "copy");
  proxiedAppBundleID = v3->_proxiedAppBundleID;
  v3->_proxiedAppBundleID = (NSString *)v19;

  v21 = -[NSString copy](self->_proxiedAppName, "copy");
  proxiedAppName = v3->_proxiedAppName;
  v3->_proxiedAppName = (NSString *)v21;

  v23 = -[NSArray copy](self->_serviceIdentifiers, "copy");
  serviceIdentifiers = v3->_serviceIdentifiers;
  v3->_serviceIdentifiers = (NSArray *)v23;

  v25 = -[NSUUID copy](self->_identifier, "copy");
  identifier = v3->_identifier;
  v3->_identifier = (NSUUID *)v25;

  v3->_serviceType = self->_serviceType;
  v3->_maximumLoginAttempts = self->_maximumLoginAttempts;
  v3->_isEphemeral = self->_isEphemeral;
  v3->_shouldAllowAppleIDCreation = self->_shouldAllowAppleIDCreation;
  v3->_shouldPromptForPasswordOnly = self->_shouldPromptForPasswordOnly;
  v27 = -[NSString copy](self->_passwordPromptTitle, "copy");
  passwordPromptTitle = v3->_passwordPromptTitle;
  v3->_passwordPromptTitle = (NSString *)v27;

  v29 = -[NSString copy](self->_defaultButtonString, "copy");
  defaultButtonString = v3->_defaultButtonString;
  v3->_defaultButtonString = (NSString *)v29;

  v31 = -[NSDictionary copy](self->_httpHeadersForRemoteUI, "copy");
  httpHeadersForRemoteUI = v3->_httpHeadersForRemoteUI;
  v3->_httpHeadersForRemoteUI = (NSDictionary *)v31;

  v33 = -[NSString copy](self->_remoteUIIdentityToken, "copy");
  remoteUIIdentityToken = v3->_remoteUIIdentityToken;
  v3->_remoteUIIdentityToken = (NSString *)v33;

  v35 = -[NSString copy](self->_password, "copy");
  password = v3->_password;
  v3->_password = (NSString *)v35;

  v3->_isPasswordEditable = self->_isPasswordEditable;
  v3->_shouldUpdatePersistentServiceTokens = self->_shouldUpdatePersistentServiceTokens;
  v3->_shouldOfferSecurityUpgrade = self->_shouldOfferSecurityUpgrade;
  v3->_needsCredentialRecovery = self->_needsCredentialRecovery;
  v3->_needsNewAppleID = self->_needsNewAppleID;
  v3->_needsPasswordChange = self->_needsPasswordChange;
  v3->_shouldPreventInteractiveAuth = self->_shouldPreventInteractiveAuth;
  v37 = -[NSString copy](self->_generatedCode, "copy");
  generatedCode = v3->_generatedCode;
  v3->_generatedCode = (NSString *)v37;

  v39 = -[NSNumber copy](self->_latitude, "copy");
  latitude = v3->_latitude;
  v3->_latitude = (NSNumber *)v39;

  v41 = -[NSNumber copy](self->_longitude, "copy");
  longitude = v3->_longitude;
  v3->_longitude = (NSNumber *)v41;

  v43 = -[NSString copy](self->_deviceClass, "copy");
  deviceClass = v3->_deviceClass;
  v3->_deviceClass = (NSString *)v43;

  v45 = -[NSString copy](self->_deviceColor, "copy");
  deviceColor = v3->_deviceColor;
  v3->_deviceColor = (NSString *)v45;

  v47 = -[NSString copy](self->_deviceEnclosureColor, "copy");
  deviceEnclosureColor = v3->_deviceEnclosureColor;
  v3->_deviceEnclosureColor = (NSString *)v47;

  v49 = -[NSString copy](self->_notificationDisclaimer, "copy");
  notificationDisclaimer = v3->_notificationDisclaimer;
  v3->_notificationDisclaimer = (NSString *)v49;

  v3->_shouldForceInteractiveAuth = self->_shouldForceInteractiveAuth;
  v3->_capabilityForUIDisplay = -[AKAppleIDAuthenticationContext _capabilityForUIDisplay](self, "_capabilityForUIDisplay");
  v51 = -[AKAnisetteData copy](self->_proxiedDeviceAnisetteData, "copy");
  proxiedDeviceAnisetteData = v3->_proxiedDeviceAnisetteData;
  v3->_proxiedDeviceAnisetteData = (AKAnisetteData *)v51;

  v53 = -[AKDevice copy](self->_proxiedDevice, "copy");
  proxiedDevice = v3->_proxiedDevice;
  v3->_proxiedDevice = (AKDevice *)v53;

  v55 = -[AKAnisetteData copy](self->_companionDeviceAnisetteData, "copy");
  companionDeviceAnisetteData = v3->_companionDeviceAnisetteData;
  v3->_companionDeviceAnisetteData = (AKAnisetteData *)v55;

  v57 = -[AKDevice copy](self->_companionDevice, "copy");
  companionDevice = v3->_companionDevice;
  v3->_companionDevice = (AKDevice *)v57;

  v59 = -[NSNumber copy](self->_isAppleIDLoginEnabled, "copy");
  isAppleIDLoginEnabled = v3->_isAppleIDLoginEnabled;
  v3->_isAppleIDLoginEnabled = (NSNumber *)v59;

  v61 = -[NSNumber copy](self->_hasEmptyPassword, "copy");
  hasEmptyPassword = v3->_hasEmptyPassword;
  v3->_hasEmptyPassword = (NSNumber *)v61;

  v3->_shouldRequestShortLivedToken = self->_shouldRequestShortLivedToken;
  v63 = -[NSString copy](self->_shortLivedToken, "copy");
  shortLivedToken = v3->_shortLivedToken;
  v3->_shortLivedToken = (NSString *)v63;

  v65 = -[NSString copy](self->_identityToken, "copy");
  identityToken = v3->_identityToken;
  v3->_identityToken = (NSString *)v65;

  v3->_shouldRequestConfigurationInfo = self->_shouldRequestConfigurationInfo;
  v3->_isTriggeredByNotification = self->_isTriggeredByNotification;
  v67 = -[NSString copy](self->_message, "copy");
  message = v3->_message;
  v3->_message = (NSString *)v67;

  v3->_anticipateEscrowAttempt = self->_anticipateEscrowAttempt;
  v3->_isFirstTimeLogin = self->_isFirstTimeLogin;
  v3->_supportsPiggybacking = self->_supportsPiggybacking;
  v69 = -[NSSet copy](self->_desiredInternalTokens, "copy");
  desiredInternalTokens = v3->_desiredInternalTokens;
  v3->_desiredInternalTokens = (NSSet *)v69;

  v3->_shouldSkipSettingsLaunchAlert = self->_shouldSkipSettingsLaunchAlert;
  v3->_shouldSendIdentityTokenForRemoteUI = self->_shouldSendIdentityTokenForRemoteUI;
  v3->_shouldRequestRecoveryPET = self->_shouldRequestRecoveryPET;
  v71 = -[NSString copy](self->_title, "copy");
  title = v3->_title;
  v3->_title = (NSString *)v71;

  v73 = -[NSString copy](self->_helpAnchor, "copy");
  helpAnchor = v3->_helpAnchor;
  v3->_helpAnchor = (NSString *)v73;

  v75 = -[NSString copy](self->_helpBook, "copy");
  helpBook = v3->_helpBook;
  v3->_helpBook = (NSString *)v75;

  v3->_shouldSkipInitialReachabilityCheck = -[AKAppleIDAuthenticationContext _shouldSkipInitialReachabilityCheck](self, "_shouldSkipInitialReachabilityCheck");
  v3->_attemptIndex = self->_attemptIndex;
  objc_storeStrong((id *)&v3->_securityUpgradeContext, self->_securityUpgradeContext);
  v3->_authenticationType = self->_authenticationType;
  v3->_shouldSendGrandSlamTokensForRemoteUI = self->_shouldSendGrandSlamTokensForRemoteUI;
  v3->_needsRepair = self->_needsRepair;
  v77 = -[NSDictionary copy](self->_appProvidedData, "copy");
  appProvidedData = v3->_appProvidedData;
  v3->_appProvidedData = (NSDictionary *)v77;

  objc_storeStrong((id *)&v3->_appProvidedContext, self->_appProvidedContext);
  v79 = -[NSString copy](self->_masterKey, "copy");
  masterKey = v3->_masterKey;
  v3->_masterKey = (NSString *)v79;

  v3->_performUIOutOfProcess = self->_performUIOutOfProcess;
  v3->_keepAlive = self->_keepAlive;
  v81 = -[NSString copy](self->_cancelButtonString, "copy");
  cancelButtonString = v3->_cancelButtonString;
  v3->_cancelButtonString = (NSString *)v81;

  v83 = -[NSString copy](self->_alternativeButtonString, "copy");
  alternativeButtonString = v3->_alternativeButtonString;
  v3->_alternativeButtonString = (NSString *)v83;

  v3->_hideAlternativeButton = self->_hideAlternativeButton;
  v3->_hideCancelButton = self->_hideCancelButton;
  v3->_hideReasonString = self->_hideReasonString;
  v3->_clientShouldHandleAlternativeButtonAction = self->_clientShouldHandleAlternativeButtonAction;
  v85 = -[NSString copy](self->_windowTitle, "copy");
  windowTitle = v3->_windowTitle;
  v3->_windowTitle = (NSString *)v85;

  v3->_alwaysShowUsernameField = self->_alwaysShowUsernameField;
  v87 = -[NSString copy](self->_privacyBundleIdentifier, "copy");
  privacyBundleIdentifier = v3->_privacyBundleIdentifier;
  v3->_privacyBundleIdentifier = (NSString *)v87;

  v3->_authenticationPromptStyle = self->_authenticationPromptStyle;
  v3->_needsNewChildAccount = self->_needsNewChildAccount;
  v3->_authenticationMode = self->_authenticationMode;
  v3->_isMDMInformationRequired = self->_isMDMInformationRequired;
  v3->_cliMode = self->_cliMode;
  objc_storeStrong((id *)&v3->_passwordlessToken, self->_passwordlessToken);
  objc_storeStrong((id *)&v3->_idmsDataToken, self->_idmsDataToken);
  v3->_needsSecurityUpgradeUI = self->_needsSecurityUpgradeUI;
  v3->_isRKVerification = self->_isRKVerification;
  v89 = -[NSData copy](self->_displayImageData, "copy");
  displayImageData = v3->_displayImageData;
  v3->_displayImageData = (NSData *)v89;

  v3->_verifyCredentialReason = self->_verifyCredentialReason;
  v91 = -[NSString copy](self->_callerIconBundlePath, "copy");
  callerIconBundlePath = v3->_callerIconBundlePath;
  v3->_callerIconBundlePath = (NSString *)v91;

  v93 = -[NSString copy](self->_localizedCallerName, "copy");
  localizedCallerName = v3->_localizedCallerName;
  v3->_localizedCallerName = (NSString *)v93;

  v95 = -[NSString copy](self->_custodianRecoveryToken, "copy");
  custodianRecoveryToken = v3->_custodianRecoveryToken;
  v3->_custodianRecoveryToken = (NSString *)v95;

  v3->_forceEligibleForForegroundAuthentication = self->_forceEligibleForForegroundAuthentication;
  v3->_deviceRegionRequired = self->_deviceRegionRequired;
  v3->_disableProximityAuth = self->_disableProximityAuth;
  v3->_shouldBroadcastForProximityAuthOnly = -[AKAppleIDAuthenticationContext _shouldBroadcastForProximityAuthOnly](self, "_shouldBroadcastForProximityAuthOnly");
  v3->_enablePasscodeAuth = self->_enablePasscodeAuth;
  v3->_passcodeOnlyPolicy = self->_passcodeOnlyPolicy;
  v97 = -[NSString copy](self->_sourceAltDSID, "copy");
  sourceAltDSID = v3->_sourceAltDSID;
  v3->_sourceAltDSID = (NSString *)v97;

  v99 = -[NSString copy](self->_serviceToken, "copy");
  serviceToken = v3->_serviceToken;
  v3->_serviceToken = (NSString *)v99;

  v3->_isRequestedFromOOPViewService = self->_isRequestedFromOOPViewService;
  v3->_isNativeTakeover = self->_isNativeTakeover;
  v3->_ignorePasswordCache = self->_ignorePasswordCache;
  v3->_ignoreShouldContinueProxy = self->_ignoreShouldContinueProxy;
  v101 = -[NSString copy](self->_proxiedAppleID, "copy");
  proxiedAppleID = v3->_proxiedAppleID;
  v3->_proxiedAppleID = (NSString *)v101;

  v103 = -[AKCompanionKeyEnvelope copy](self->_companionKeyEnvelope, "copy");
  companionKeyEnvelope = v3->_companionKeyEnvelope;
  v3->_companionKeyEnvelope = (AKCompanionKeyEnvelope *)v103;

  v3->_piggybackingForTrustedDevice = self->_piggybackingForTrustedDevice;
  v3->_allowAuthenticationBeforeFirstUnlock = self->_allowAuthenticationBeforeFirstUnlock;
  return v3;
}

- (void)_updateWithValuesFromContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *v6;
  NSString *reason;
  NSString *v8;
  NSString *username;
  NSString *v10;
  NSString *DSID;
  NSString *v12;
  NSString *altDSID;
  NSString *v14;
  NSString *telemetryDeviceSessionID;
  NSString *v16;
  NSString *telemetryFlowID;
  NSArray *v18;
  NSArray *serviceIdentifiers;
  NSString *v20;
  NSString *passwordPromptTitle;
  NSString *v22;
  NSString *defaultButtonString;
  NSDictionary *v24;
  NSDictionary *httpHeadersForRemoteUI;
  NSString *v26;
  NSString *remoteUIIdentityToken;
  NSString *v28;
  NSString *password;
  NSString *v30;
  NSString *generatedCode;
  AKAnisetteData *v32;
  AKAnisetteData *proxiedDeviceAnisetteData;
  AKDevice *v34;
  AKDevice *proxiedDevice;
  AKAnisetteData *v36;
  AKAnisetteData *companionDeviceAnisetteData;
  AKDevice *v38;
  AKDevice *companionDevice;
  NSNumber *v40;
  NSNumber *isAppleIDLoginEnabled;
  NSNumber *v42;
  NSNumber *hasEmptyPassword;
  NSString *v44;
  NSString *shortLivedToken;
  NSString *v46;
  NSString *identityToken;
  NSString *v48;
  NSString *message;
  NSSet *v50;
  NSSet *desiredInternalTokens;
  NSString *v52;
  NSString *masterKey;
  NSString *v54;
  NSString *cancelButtonString;
  NSString *v56;
  NSString *alternativeButtonString;
  NSString *v58;
  NSString *windowTitle;
  NSData *v60;
  NSData *displayImageData;
  NSString *v62;
  NSString *callerIconBundlePath;
  NSString *v64;
  NSString *localizedCallerName;
  NSString *v66;
  NSString *custodianRecoveryToken;
  NSObject *v68;

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContext _updateWithValuesFromContext:].cold.2((uint64_t)self, (uint64_t)v4, v5);

  if (v4)
  {
    v6 = (NSString *)objc_msgSend(*((id *)v4 + 47), "copy");
    reason = self->_reason;
    self->_reason = v6;

    v8 = (NSString *)objc_msgSend(*((id *)v4 + 22), "copy");
    username = self->_username;
    self->_username = v8;

    self->_isUsernameEditable = *((_BYTE *)v4 + 139);
    v10 = (NSString *)objc_msgSend(*((id *)v4 + 51), "copy");
    DSID = self->_DSID;
    self->_DSID = v10;

    v12 = (NSString *)objc_msgSend(*((id *)v4 + 35), "copy");
    altDSID = self->_altDSID;
    self->_altDSID = v12;

    v14 = (NSString *)objc_msgSend(*((id *)v4 + 44), "copy");
    telemetryDeviceSessionID = self->_telemetryDeviceSessionID;
    self->_telemetryDeviceSessionID = v14;

    v16 = (NSString *)objc_msgSend(*((id *)v4 + 45), "copy");
    telemetryFlowID = self->_telemetryFlowID;
    self->_telemetryFlowID = v16;

    objc_storeStrong((id *)&self->_dependentAltDSID, *((id *)v4 + 70));
    v18 = (NSArray *)objc_msgSend(*((id *)v4 + 50), "copy");
    serviceIdentifiers = self->_serviceIdentifiers;
    self->_serviceIdentifiers = v18;

    self->_serviceType = *((_QWORD *)v4 + 36);
    self->_maximumLoginAttempts = *((_QWORD *)v4 + 49);
    self->_isEphemeral = *((_BYTE *)v4 + 145);
    self->_shouldAllowAppleIDCreation = *((_BYTE *)v4 + 140);
    self->_shouldPromptForPasswordOnly = *((_BYTE *)v4 + 156);
    v20 = (NSString *)objc_msgSend(*((id *)v4 + 27), "copy");
    passwordPromptTitle = self->_passwordPromptTitle;
    self->_passwordPromptTitle = v20;

    v22 = (NSString *)objc_msgSend(*((id *)v4 + 48), "copy");
    defaultButtonString = self->_defaultButtonString;
    self->_defaultButtonString = v22;

    v24 = (NSDictionary *)objc_msgSend(*((id *)v4 + 52), "copy");
    httpHeadersForRemoteUI = self->_httpHeadersForRemoteUI;
    self->_httpHeadersForRemoteUI = v24;

    v26 = (NSString *)objc_msgSend(*((id *)v4 + 26), "copy");
    remoteUIIdentityToken = self->_remoteUIIdentityToken;
    self->_remoteUIIdentityToken = v26;

    v28 = (NSString *)objc_msgSend(*((id *)v4 + 28), "copy");
    password = self->_password;
    self->_password = v28;

    self->_shouldUpdatePersistentServiceTokens = *((_BYTE *)v4 + 157);
    self->_shouldOfferSecurityUpgrade = *((_BYTE *)v4 + 146);
    self->_shouldPreventInteractiveAuth = *((_BYTE *)v4 + 128);
    v30 = (NSString *)objc_msgSend(*((id *)v4 + 1), "copy");
    generatedCode = self->_generatedCode;
    self->_generatedCode = v30;

    self->_shouldForceInteractiveAuth = *((_BYTE *)v4 + 129);
    v32 = (AKAnisetteData *)objc_msgSend(*((id *)v4 + 33), "copy");
    proxiedDeviceAnisetteData = self->_proxiedDeviceAnisetteData;
    self->_proxiedDeviceAnisetteData = v32;

    v34 = (AKDevice *)objc_msgSend(*((id *)v4 + 11), "copy");
    proxiedDevice = self->_proxiedDevice;
    self->_proxiedDevice = v34;

    v36 = (AKAnisetteData *)objc_msgSend(*((id *)v4 + 32), "copy");
    companionDeviceAnisetteData = self->_companionDeviceAnisetteData;
    self->_companionDeviceAnisetteData = v36;

    v38 = (AKDevice *)objc_msgSend(*((id *)v4 + 12), "copy");
    companionDevice = self->_companionDevice;
    self->_companionDevice = v38;

    self->_needsNewAppleID = *((_BYTE *)v4 + 142);
    v40 = (NSNumber *)objc_msgSend(*((id *)v4 + 66), "copy");
    isAppleIDLoginEnabled = self->_isAppleIDLoginEnabled;
    self->_isAppleIDLoginEnabled = v40;

    v42 = (NSNumber *)objc_msgSend(*((id *)v4 + 67), "copy");
    hasEmptyPassword = self->_hasEmptyPassword;
    self->_hasEmptyPassword = v42;

    self->_shouldRequestShortLivedToken = *((_BYTE *)v4 + 159);
    v44 = (NSString *)objc_msgSend(*((id *)v4 + 30), "copy");
    shortLivedToken = self->_shortLivedToken;
    self->_shortLivedToken = v44;

    v46 = (NSString *)objc_msgSend(*((id *)v4 + 25), "copy");
    identityToken = self->_identityToken;
    self->_identityToken = v46;

    self->_shouldRequestConfigurationInfo = *((_BYTE *)v4 + 160);
    self->_isTriggeredByNotification = *((_BYTE *)v4 + 144);
    v48 = (NSString *)objc_msgSend(*((id *)v4 + 31), "copy");
    message = self->_message;
    self->_message = v48;

    self->_anticipateEscrowAttempt = *((_BYTE *)v4 + 162);
    self->_isFirstTimeLogin = *((_BYTE *)v4 + 163);
    self->_supportsPiggybacking = *((_BYTE *)v4 + 161);
    v50 = (NSSet *)objc_msgSend(*((id *)v4 + 68), "copy");
    desiredInternalTokens = self->_desiredInternalTokens;
    self->_desiredInternalTokens = v50;

    self->_shouldSkipSettingsLaunchAlert = *((_BYTE *)v4 + 164);
    self->_shouldSendIdentityTokenForRemoteUI = *((_BYTE *)v4 + 124);
    self->_shouldRequestRecoveryPET = *((_BYTE *)v4 + 158);
    objc_storeStrong((id *)&self->_title, *((id *)v4 + 54));
    objc_storeStrong((id *)&self->_helpAnchor, *((id *)v4 + 55));
    objc_storeStrong((id *)&self->_helpBook, *((id *)v4 + 56));
    self->_attemptIndex = *((_QWORD *)v4 + 14);
    objc_storeStrong((id *)&self->_securityUpgradeContext, *((id *)v4 + 69));
    self->_authenticationType = *((_QWORD *)v4 + 37);
    self->_shouldSendGrandSlamTokensForRemoteUI = *((_BYTE *)v4 + 125);
    self->_needsRepair = *((_BYTE *)v4 + 147);
    objc_storeStrong((id *)&self->_appProvidedData, *((id *)v4 + 40));
    objc_storeStrong((id *)&self->_appProvidedContext, *((id *)v4 + 41));
    v52 = (NSString *)objc_msgSend(*((id *)v4 + 34), "copy");
    masterKey = self->_masterKey;
    self->_masterKey = v52;

    self->_keepAlive = *((_BYTE *)v4 + 122);
    v54 = (NSString *)objc_msgSend(*((id *)v4 + 58), "copy");
    cancelButtonString = self->_cancelButtonString;
    self->_cancelButtonString = v54;

    v56 = (NSString *)objc_msgSend(*((id *)v4 + 59), "copy");
    alternativeButtonString = self->_alternativeButtonString;
    self->_alternativeButtonString = v56;

    self->_hideAlternativeButton = *((_BYTE *)v4 + 148);
    self->_hideCancelButton = *((_BYTE *)v4 + 149);
    self->_hideReasonString = *((_BYTE *)v4 + 150);
    self->_clientShouldHandleAlternativeButtonAction = *((_BYTE *)v4 + 151);
    v58 = (NSString *)objc_msgSend(*((id *)v4 + 60), "copy");
    windowTitle = self->_windowTitle;
    self->_windowTitle = v58;

    self->_alwaysShowUsernameField = *((_BYTE *)v4 + 152);
    objc_storeStrong((id *)&self->_privacyBundleIdentifier, *((id *)v4 + 61));
    self->_authenticationPromptStyle = *((_QWORD *)v4 + 57);
    self->_needsNewChildAccount = *((_BYTE *)v4 + 165);
    self->_authenticationMode = *((_QWORD *)v4 + 38);
    self->_isMDMInformationRequired = *((_BYTE *)v4 + 132);
    self->_cliMode = *((_BYTE *)v4 + 133);
    objc_storeStrong((id *)&self->_passwordlessToken, *((id *)v4 + 42));
    objc_storeStrong((id *)&self->_idmsDataToken, *((id *)v4 + 43));
    self->_needsSecurityUpgradeUI = *((_BYTE *)v4 + 166);
    self->_isRKVerification = *((_BYTE *)v4 + 167);
    v60 = (NSData *)objc_msgSend(*((id *)v4 + 63), "copy");
    displayImageData = self->_displayImageData;
    self->_displayImageData = v60;

    self->_verifyCredentialReason = *((_QWORD *)v4 + 72);
    v62 = (NSString *)objc_msgSend(*((id *)v4 + 74), "copy");
    callerIconBundlePath = self->_callerIconBundlePath;
    self->_callerIconBundlePath = v62;

    v64 = (NSString *)objc_msgSend(*((id *)v4 + 75), "copy");
    localizedCallerName = self->_localizedCallerName;
    self->_localizedCallerName = v64;

    v66 = (NSString *)objc_msgSend(*((id *)v4 + 73), "copy");
    custodianRecoveryToken = self->_custodianRecoveryToken;
    self->_custodianRecoveryToken = v66;

    self->_forceEligibleForForegroundAuthentication = *((_BYTE *)v4 + 130);
    self->_deviceRegionRequired = *((_BYTE *)v4 + 154);
    self->_disableProximityAuth = *((_BYTE *)v4 + 153);
    self->_shouldBroadcastForProximityAuthOnly = *((_BYTE *)v4 + 131);
    self->_enablePasscodeAuth = *((_BYTE *)v4 + 168);
    self->_passcodeOnlyPolicy = *((_BYTE *)v4 + 155);
    objc_storeStrong((id *)&self->_sourceAltDSID, *((id *)v4 + 78));
    objc_storeStrong((id *)&self->_serviceToken, *((id *)v4 + 76));
    self->_isNativeTakeover = *((_BYTE *)v4 + 134);
    self->_ignorePasswordCache = *((_BYTE *)v4 + 135);
    self->_ignoreShouldContinueProxy = *((_BYTE *)v4 + 136);
    self->_isRequestedFromOOPViewService = *((_BYTE *)v4 + 137);
    objc_storeStrong((id *)&self->_proxiedAppleID, *((id *)v4 + 77));
    objc_storeStrong((id *)&self->_companionKeyEnvelope, *((id *)v4 + 46));
    self->_piggybackingForTrustedDevice = *((_BYTE *)v4 + 138);
  }
  else
  {
    _AKLogSystem();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
      -[AKAppleIDAuthenticationContext _updateWithValuesFromContext:].cold.1();

  }
}

- (BOOL)_localUserHasEmptyPassword
{
  NSNumber *hasEmptyPassword;
  void *v4;
  char v5;

  hasEmptyPassword = self->_hasEmptyPassword;
  if (hasEmptyPassword)
    return -[NSNumber BOOLValue](hasEmptyPassword, "BOOLValue");
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isProtectedWithPasscode") ^ 1;

  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { UUID: %@ }>"), v5, self, self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  objc_class *v3;
  NSString *password;
  const __CFString *v5;
  NSString *passwordlessToken;
  const __CFString *v7;
  NSString *idmsDataToken;
  const __CFString *v9;
  _BOOL4 isProxyingForApp;
  _BOOL4 shouldRequestShortLivedToken;
  NSString *shortLivedToken;
  const __CFString *v13;
  NSString *identityToken;
  const __CFString *v15;
  _BOOL4 isTriggeredByNotification;
  _BOOL4 shouldSkipSettingsLaunchAlert;
  _BOOL4 v18;
  NSString *masterKey;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v43;
  const __CFString *v44;
  unint64_t attemptIndex;
  _BOOL4 shouldOfferSecurityUpgrade;
  const __CFString *v47;
  _BOOL4 shouldUpdatePersistentServiceTokens;
  const __CFString *v49;
  _BOOL4 isMDMInformationRequired;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  NSNumber *hasEmptyPassword;
  NSNumber *isAppleIDLoginEnabled;
  _BOOL4 shouldPromptForPasswordOnly;
  const __CFString *v57;
  _BOOL4 isEphemeral;
  const __CFString *v59;
  AKDevice *companionDevice;
  AKDevice *proxiedDevice;
  NSString *proxiedAppBundleID;
  NSString *securityUpgradeContext;
  _BOOL4 isUsernameEditable;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  const __CFString *v70;
  NSString *reason;
  NSArray *serviceIdentifiers;
  int64_t serviceType;
  const __CFString *v74;
  NSString *dependentAltDSID;
  NSString *DSID;
  NSString *altDSID;
  NSString *username;
  NSUUID *identifier;
  void *v80;
  void *v81;

  v80 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  username = self->_username;
  identifier = self->_identifier;
  isUsernameEditable = self->_isUsernameEditable;
  DSID = self->_DSID;
  altDSID = self->_altDSID;
  dependentAltDSID = self->_dependentAltDSID;
  password = self->_password;
  if (password)
  {
    if (-[NSString length](password, "length"))
      v5 = CFSTR("(******)");
    else
      v5 = CFSTR("(empty)");
  }
  else
  {
    v5 = CFSTR("(null)");
  }
  v74 = v5;
  serviceIdentifiers = self->_serviceIdentifiers;
  serviceType = self->_serviceType;
  reason = self->_reason;
  isEphemeral = self->_isEphemeral;
  shouldPromptForPasswordOnly = self->_shouldPromptForPasswordOnly;
  passwordlessToken = self->_passwordlessToken;
  if (passwordlessToken)
  {
    if (-[NSString length](passwordlessToken, "length"))
      v7 = CFSTR("(******)");
    else
      v7 = CFSTR("(empty)");
  }
  else
  {
    v7 = CFSTR("(null)");
  }
  v70 = v7;
  idmsDataToken = self->_idmsDataToken;
  if (idmsDataToken)
  {
    if (-[NSString length](idmsDataToken, "length"))
      v9 = CFSTR("(******)");
    else
      v9 = CFSTR("(empty)");
  }
  else
  {
    v9 = CFSTR("(null)");
  }
  v67 = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_authenticationType);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_authenticationMode);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  isMDMInformationRequired = self->_isMDMInformationRequired;
  shouldUpdatePersistentServiceTokens = self->_shouldUpdatePersistentServiceTokens;
  shouldOfferSecurityUpgrade = self->_shouldOfferSecurityUpgrade;
  isProxyingForApp = self->_isProxyingForApp;
  proxiedAppBundleID = self->_proxiedAppBundleID;
  securityUpgradeContext = self->_securityUpgradeContext;
  companionDevice = self->_companionDevice;
  proxiedDevice = self->_proxiedDevice;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maximumLoginAttempts);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  hasEmptyPassword = self->_hasEmptyPassword;
  isAppleIDLoginEnabled = self->_isAppleIDLoginEnabled;
  shouldRequestShortLivedToken = self->_shouldRequestShortLivedToken;
  shortLivedToken = self->_shortLivedToken;
  if (shortLivedToken)
  {
    if (-[NSString length](shortLivedToken, "length"))
      v13 = CFSTR("(******)");
    else
      v13 = CFSTR("(empty)");
  }
  else
  {
    v13 = CFSTR("(null)");
  }
  v53 = v13;
  identityToken = self->_identityToken;
  if (identityToken)
  {
    if (-[NSString length](identityToken, "length"))
      v15 = CFSTR("(******)");
    else
      v15 = CFSTR("(empty)");
  }
  else
  {
    v15 = CFSTR("(null)");
  }
  v52 = v15;
  isTriggeredByNotification = self->_isTriggeredByNotification;
  shouldSkipSettingsLaunchAlert = self->_shouldSkipSettingsLaunchAlert;
  v18 = -[AKAppleIDAuthenticationContext _shouldSkipInitialReachabilityCheck](self, "_shouldSkipInitialReachabilityCheck");
  attemptIndex = self->_attemptIndex;
  masterKey = self->_masterKey;
  if (masterKey)
  {
    if (-[NSString length](masterKey, "length"))
      v20 = CFSTR("(******)");
    else
      v20 = CFSTR("(empty)");
  }
  else
  {
    v20 = CFSTR("(null)");
  }
  v44 = v20;
  if (v18)
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  if (shouldSkipSettingsLaunchAlert)
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  if (isTriggeredByNotification)
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  if (shouldRequestShortLivedToken)
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  if (isProxyingForApp)
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  v43 = v25;
  if (shouldOfferSecurityUpgrade)
    v26 = CFSTR("YES");
  else
    v26 = CFSTR("NO");
  if (shouldUpdatePersistentServiceTokens)
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  v47 = v26;
  v49 = v27;
  if (isMDMInformationRequired)
    v28 = CFSTR("YES");
  else
    v28 = CFSTR("NO");
  v51 = v28;
  if (shouldPromptForPasswordOnly)
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  if (isEphemeral)
    v30 = CFSTR("YES");
  else
    v30 = CFSTR("NO");
  v57 = v29;
  v59 = v30;
  if (isUsernameEditable)
    v31 = CFSTR("YES");
  else
    v31 = CFSTR("NO");
  v65 = v31;
  if (self->_performUIOutOfProcess)
    v32 = CFSTR("YES");
  else
    v32 = CFSTR("NO");
  if (self->_shouldBroadcastForProximityAuthOnly)
    v33 = CFSTR("YES");
  else
    v33 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_verifyCredentialReason);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_enablePasscodeAuth)
    v35 = CFSTR("YES");
  else
    v35 = CFSTR("NO");
  if (self->_passcodeOnlyPolicy)
    v36 = CFSTR("YES");
  else
    v36 = CFSTR("NO");
  if (self->_isNativeTakeover)
    v37 = CFSTR("YES");
  else
    v37 = CFSTR("NO");
  if (self->_ignorePasswordCache)
    v38 = CFSTR("YES");
  else
    v38 = CFSTR("NO");
  if (self->_isRequestedFromOOPViewService)
    v39 = CFSTR("YES");
  else
    v39 = CFSTR("NO");
  if (self->_piggybackingForTrustedDevice)
    v40 = CFSTR("YES");
  else
    v40 = CFSTR("NO");
  objc_msgSend(v80, "stringWithFormat:", CFSTR("<%@: %p {\n\tUUID: %@,\n\tusername: %@,\n\teditable-username: %@,\n\taltDSID: %@,\n\tDSID: %@,\n\tdependentAltDSID: %@,\n\tpassword: %@,\n\tservice-type: %ld,\n\tservice IDs: %@,\n\treason: %@\n\tephemeral: %@,\n\tpassword-only: %@,\n\tpasswordlessToken: %@,\n\tidmsDataToken: %@,\n\tauthentication-type: %@,\n\tauthenticationMode: %@, \n\tisMDMInfoRequired: %@, \n\tupdate-service-tokens: %@,\n\toffer-upgrade: %@,\n\toffer-upgrade-context: %@,\n\tproxying-for-app: %@,\n\tproxied-app-id: %@,\n\tproxied-device: %@,\n\tcompanion-device: %@\n\tmax-login-attempts: %@\n\tappleid-login-enabled: %@\n\thas-empty-password: %@\n\trequest-slt: %@\n\tshort-lived-token: %@\n\tidentity-token: %@\n\ttriggered-by-push: %@\n\tskip-alert: %@\n\tskip-reachability-check: %@\n\tattempt-index: %lu,\n\tmasterKey: %@,\n\tperformUIOutOfProcess: %@,\n\tbroadcastProximityAuthOnly: %@, \n\tVerifyCredentialReason: %@, \n\tEnablePasscodeAuth: %@, \n\tPasscodeOnlyPolicy: %@, \n\tSourceAltDSID: %@, \n\tServiceToken: %@, \n\tisNativeTakeover: %@, \n\tignorePasswordCache: %@, \n\tisRequestedFromOOPViewService: %@, \n\tProxiedAppleID: %@, \n\ttelemetryDeviceSessionID: %@, \n\ttelemetryFlowID: %@, \n\tpiggybackingForTrustedDevice: %@, \n}>"), v81, self, identifier, username, v65, altDSID, DSID, dependentAltDSID, v74, serviceType, serviceIdentifiers, reason, v59, v57, v70, v67,
    v69,
    v68,
    v51,
    v49,
    v47,
    securityUpgradeContext,
    v43,
    proxiedAppBundleID,
    proxiedDevice,
    companionDevice,
    v66,
    isAppleIDLoginEnabled,
    hasEmptyPassword,
    v24,
    v53,
    v52,
    v23,
    v22,
    v21,
    attemptIndex,
    v44,
    v32,
    v33,
    v34,
    v35,
    v36,
    self->_sourceAltDSID,
    self->_serviceToken,
    v37,
    v38,
    v39,
    self->_proxiedAppleID,
    self->_telemetryDeviceSessionID,
    self->_telemetryFlowID,
    v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v41;
}

- (BOOL)isContextEligibleForSilentAuthCoercion
{
  void *v3;
  char v4;

  -[AKAppleIDAuthenticationContext _proxiedAppName](self, "_proxiedAppName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("findmydeviced"));

  if (-[AKAppleIDAuthenticationContext _capabilityForUIDisplay](self, "_capabilityForUIDisplay") == 1)
    return -[AKAppleIDAuthenticationContext isContextEligibleForSilentAuth](self, "isContextEligibleForSilentAuth") & (v4 ^ 1);
  else
    return 0;
}

- (BOOL)isContextEligibleForSilentAuth
{
  BOOL v3;
  void *v5;
  void *v6;
  void *v7;

  if (-[AKAppleIDAuthenticationContext authenticationType](self, "authenticationType") != 2
    || -[AKAppleIDAuthenticationContext shouldPromptForPasswordOnly](self, "shouldPromptForPasswordOnly")
    || -[AKAppleIDAuthenticationContext isEphemeral](self, "isEphemeral")
    || -[AKAppleIDAuthenticationContext isUsernameEditable](self, "isUsernameEditable"))
  {
    return 0;
  }
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationContext authKitAccount:](self, "authKitAccount:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "continuationTokenForAccount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7 != 0;

  return v3;
}

- (BOOL)isContextEligibleForBiometricOrPasscodeAuth
{
  void *v3;
  uint64_t v4;

  if (-[AKAppleIDAuthenticationContext _isVerifyCredentialReasonEligibleForBiometricOrPasscodeAuth](self, "_isVerifyCredentialReasonEligibleForBiometricOrPasscodeAuth"))
  {
    return -[AKAppleIDAuthenticationContext _isEligibleForPasscodeAuth](self, "_isEligibleForPasscodeAuth");
  }
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldAllowExperimentalMode");

  return v4 == 1 && -[AKAppleIDAuthenticationContext _isEligibleForPasscodeAuth](self, "_isEligibleForPasscodeAuth");
}

- (BOOL)isContextEligibleForPasscodeAuth
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  char v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  BOOL v13;
  NSObject *v15;
  void *v16;
  _DWORD v17[2];
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationContext authKitAccount:](self, "authKitAccount:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "shouldAskToBuy") == 1)
    v6 = 1;
  else
    v6 = objc_msgSend(v3, "isAskToBuyForAccount:", v4);

  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContext isContextEligibleForPasscodeAuth].cold.1();

  if (-[AKAppleIDAuthenticationContext serviceType](self, "serviceType") == 2)
    v8 = v6;
  else
    v8 = 1;
  if ((v8 & 1) != 0)
  {
    -[AKAppleIDAuthenticationContext companionDevice](self, "companionDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

    }
    else
    {
      -[AKAppleIDAuthenticationContext proxiedDevice](self, "proxiedDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        _AKLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = 67110144;
          v17[1] = objc_msgSend(v16, "isChildPasscodeEnabled");
          v18 = 1024;
          v19 = -[AKAppleIDAuthenticationContext enablePasscodeAuth](self, "enablePasscodeAuth");
          v20 = 1024;
          v21 = objc_msgSend(v3, "isPasscodeAuthEnabledForAccount:", v4);
          v22 = 1024;
          v23 = objc_msgSend(v3, "userUnderAgeForAccount:", v4);
          v24 = 1024;
          v25 = -[AKAppleIDAuthenticationContext _isEligibleForPasscodeAuth](self, "_isEligibleForPasscodeAuth");
          _os_log_debug_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEBUG, "isContextEligibleForPasscodeAuth: {\n\tisChildPasscodeEnabled: %d, \n\tenablePasscodeAuth: %d, \n\tisPasscodeAuthEnabled: %d, \n\tuserUnderAge: %d, \n\tisEligibleForPasscodeAuth: %d, \n}", (uint8_t *)v17, 0x20u);

        }
        +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
        v10 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject isChildPasscodeEnabled](v10, "isChildPasscodeEnabled")
          && -[AKAppleIDAuthenticationContext enablePasscodeAuth](self, "enablePasscodeAuth")
          && objc_msgSend(v3, "isPasscodeAuthEnabledForAccount:", v4)
          && objc_msgSend(v3, "userUnderAgeForAccount:", v4))
        {
          v13 = -[AKAppleIDAuthenticationContext _isEligibleForPasscodeAuth](self, "_isEligibleForPasscodeAuth");
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17[0]) = 0;
      v11 = "Account is not passcode auth eligible for magic and prox auth flows.";
      goto LABEL_17;
    }
  }
  else
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17[0]) = 0;
      v11 = "Account is not passcode auth eligible. AskToBuy is disabled.";
LABEL_17:
      _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)v17, 2u);
    }
  }
LABEL_18:
  v13 = 0;
LABEL_19:

  return v13;
}

- (BOOL)isConfiguredForTokenUpgrade
{
  uint64_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;

  -[AKAppleIDAuthenticationContext serviceToken](self, "serviceToken");
  v3 = objc_claimAutoreleasedReturnValue();
  +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPltUpgradeEnabled");

  if (v5)
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDAuthenticationContext isConfiguredForTokenUpgrade].cold.1();

    -[AKAppleIDAuthenticationContext passwordlessToken](self, "passwordlessToken");
    v7 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[AKAppleIDAuthenticationContext _shortLivedToken](self, "_shortLivedToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 1;
  }
  else
  {
    -[AKAppleIDAuthenticationContext _identityToken](self, "_identityToken");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10 | v7)
      v11 = (void *)v10;
    else
      v11 = 0;
    v9 = (v10 | v7 | v3) != 0;

  }
  return v9;
}

- (BOOL)_isEligibleForPasscodeAuth
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unsigned int v11;
  _DWORD v12[2];
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationContext authKitAccount:](self, "authKitAccount:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "continuationTokenForAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationContext authKitAccount:](self, "authKitAccount:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passwordResetTokenForAccount:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12[0] = 67110656;
    v12[1] = 1;
    v13 = 2048;
    v14 = -[AKAppleIDAuthenticationContext authenticationType](self, "authenticationType");
    v15 = 1024;
    v16 = -[AKAppleIDAuthenticationContext shouldPromptForPasswordOnly](self, "shouldPromptForPasswordOnly");
    v17 = 1024;
    v18 = -[AKAppleIDAuthenticationContext isEphemeral](self, "isEphemeral");
    v19 = 1024;
    v20 = -[AKAppleIDAuthenticationContext isUsernameEditable](self, "isUsernameEditable");
    v21 = 1024;
    v22 = v5 != 0;
    v23 = 1024;
    v24 = v8 != 0;
    _os_log_debug_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEBUG, "_isEligibleForPasscodeAuth: {\n\thasRequiredCapabilityForUIDisplay: %d, \n\tauthenticationType: %lu, \n\tshouldPromptForPasswordOnly: %d, \n\tisEphemeral: %d, \n\tisUsernameEditable: %d, \n\tvalidContinuationToken: %d, \n\tvalidPasswordResetToken: %d, \n}", (uint8_t *)v12, 0x30u);
  }

  if (-[AKAppleIDAuthenticationContext authenticationType](self, "authenticationType") != 2
    || -[AKAppleIDAuthenticationContext shouldPromptForPasswordOnly](self, "shouldPromptForPasswordOnly")
    || -[AKAppleIDAuthenticationContext isEphemeral](self, "isEphemeral"))
  {
    return 0;
  }
  v11 = (v5 != 0) & ~-[AKAppleIDAuthenticationContext isUsernameEditable](self, "isUsernameEditable");
  if (v8)
    return v11;
  else
    return 0;
}

- (BOOL)_isVerifyCredentialReasonEligibleForBiometricOrPasscodeAuth
{
  return (unint64_t)(-[AKAppleIDAuthenticationContext verifyCredentialReason](self, "verifyCredentialReason") - 1) < 4;
}

- (BOOL)isContextRequestingReauthForExistingService
{
  BOOL v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (self->_isContextRequestingReauthForExistingService)
    return 1;
  -[AKAppleIDAuthenticationContext authKitAccount:](self, "authKitAccount:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "servicesUsingAccount:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "count");
    v2 = v7 != 0;
    if (v7)
      self->_isContextRequestingReauthForExistingService = 1;

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (unint64_t)_capabilityForUIDisplay
{
  unint64_t result;

  result = self->_capabilityForUIDisplay;
  if (!result)
  {
    if (-[AKAppleIDAuthenticationContext conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE270F38))
    {
      result = 3;
    }
    else if (-[AKAppleIDAuthenticationContext conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE26DB68))
    {
      result = 2;
    }
    else
    {
      if ((-[AKAppleIDAuthenticationContext conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE2646D0) & 1) == 0)
        return self->_capabilityForUIDisplay;
      result = 1;
    }
    self->_capabilityForUIDisplay = result;
  }
  return result;
}

- (void)setReason:(id)a3
{
  NSString *v4;
  NSString *reason;
  NSString *interpolatedReason;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", self->_reason) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    reason = self->_reason;
    self->_reason = v4;

    interpolatedReason = self->_interpolatedReason;
    self->_interpolatedReason = 0;

  }
}

- (void)setUsername:(id)a3
{
  NSString *v4;
  NSString *username;
  NSString *interpolatedReason;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", self->_username) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    username = self->_username;
    self->_username = v4;

    interpolatedReason = self->_interpolatedReason;
    self->_interpolatedReason = 0;

  }
}

- (void)_setPassword:(id)a3
{
  id v5;
  NSString **p_password;
  NSString *password;
  NSObject *v8;

  v5 = a3;
  password = self->_password;
  p_password = &self->_password;
  if ((objc_msgSend(v5, "isEqualToString:", password) & 1) == 0)
  {
    objc_storeStrong((id *)p_password, a3);
    if (-[NSString length](*p_password, "length") >= 0xBE)
    {
      if (-[NSString hasSuffix:](*p_password, "hasSuffix:", CFSTR("PET")))
      {
        _AKLogSystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          -[AKAppleIDAuthenticationContext _setPassword:].cold.1();

      }
    }
  }

}

- (BOOL)_shouldRefreshAccountAndUpdateContext
{
  NSString *appProvidedContext;
  _BOOL4 v4;

  appProvidedContext = self->_appProvidedContext;
  if (!appProvidedContext
    || -[NSString isEqualToString:](appProvidedContext, "isEqualToString:", CFSTR("appleIdSettings"))
    || (v4 = -[NSString isEqualToString:](self->_appProvidedContext, "isEqualToString:", CFSTR("appleManagedAccountSignIn"))))
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

+ (id)_identifierForContext:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "_identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setShouldPreventInteractiveAuth:(BOOL)a3
{
  unint64_t v3;

  self->_shouldPreventInteractiveAuth = a3;
  if (a3)
  {
    v3 = 1;
  }
  else
  {
    if (self->_authenticationType != 1)
      return;
    v3 = 0;
  }
  self->_authenticationType = v3;
}

- (BOOL)shouldPreventInteractiveAuth
{
  return self->_shouldPreventInteractiveAuth;
}

- (void)setShouldForceInteractiveAuth:(BOOL)a3
{
  unint64_t v3;

  self->_shouldForceInteractiveAuth = a3;
  if (a3)
  {
    v3 = 2;
  }
  else
  {
    if ((self->_authenticationType & 0xFFFFFFFFFFFFFFFELL) != 2)
      return;
    v3 = 0;
  }
  self->_authenticationType = v3;
}

- (BOOL)shouldForceInteractiveAuth
{
  return self->_shouldForceInteractiveAuth;
}

- (NSString)_interpolatedReason
{
  void *v3;
  uint64_t v4;
  NSString *v5;
  NSString *interpolatedReason;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSObject *v11;

  if (!-[NSString length](self->_interpolatedReason, "length"))
  {
    -[AKAppleIDAuthenticationContext reason](self, "reason");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      -[AKAppleIDAuthenticationContext reason](self, "reason");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      interpolatedReason = self->_interpolatedReason;
      self->_interpolatedReason = v5;

      -[AKAppleIDAuthenticationContext username](self, "username");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[AKUsernameFormatter formattedUsernameFromUsername:](AKUsernameFormatter, "formattedUsernameFromUsername:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "length"))
      {
        -[NSString stringByReplacingOccurrencesOfString:withString:](self->_interpolatedReason, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%username%"), v8);
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        v10 = self->_interpolatedReason;
        self->_interpolatedReason = v9;

      }
      else
      {
        _AKLogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[AKAppleIDAuthenticationContext _interpolatedReason].cold.1();

      }
    }
  }
  return self->_interpolatedReason;
}

- (NSString)_interpolatedReasonWithBlame
{
  void *v2;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  __CFString *v11;
  char v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;

  -[AKAppleIDAuthenticationContext _interpolatedReason](self, "_interpolatedReason");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_username)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    if (self->_isUsernameEditable)
    {
      v5 = 0;
    }
    else
    {
      +[AKDevice currentDevice](AKDevice, "currentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isMultiUserMode");

      if (v8)
      {
        AKSharedDevicePasscodePromptAlertMessageWithServiceType(self->_serviceType);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("INLINE_PASSWORD_ALERT_MESSAGE");
        v12 = objc_msgSend(CFSTR("INLINE_PASSWORD_ALERT_MESSAGE"), "containsString:", CFSTR("REBRAND"));
        if ((v12 & 1) != 0)
        {
          v13 = 0;
        }
        else
        {
          +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v2, "isAABrandingEnabled"))
          {
            objc_msgSend(CFSTR("INLINE_PASSWORD_ALERT_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v13 = 1;
          }
          else
          {
            v13 = 0;
          }
        }
        objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1E2E647A8, CFSTR("Localizable"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[AKUsernameFormatter formattedUsernameFromUsername:](AKUsernameFormatter, "formattedUsernameFromUsername:", self->_username);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", v14, v15);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        if ((v12 & 1) == 0)

      }
    }
  }
  -[AKAppleIDAuthenticationContext _appendBlameIfRequiredTo:](self, "_appendBlameIfRequiredTo:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (id)_appendBlameIfRequiredTo:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  __CFString *v18;
  void *v19;
  uint64_t v21;

  v4 = a3;
  if (v4)
  {
    +[AKDevice currentDevice](AKDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isInternalBuild");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", getprogname());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAppleIDAuthenticationContext _proxiedAppName](self, "_proxiedAppName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PASSWORD_ALERT_MESSAGE_PROXY_INTERNAL_BLAME"), &stru_1E2E647A8, CFSTR("Localizable"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKAppleIDAuthenticationContext _proxiedAppName](self, "_proxiedAppName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", v11, v12, v7);
      }
      else
      {
        v14 = -[AKAppleIDAuthenticationContext serviceType](self, "serviceType");
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v16;
        if (!v14)
        {
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PASSWORD_ALERT_MESSAGE_INTERNAL_BLAME"), &stru_1E2E647A8, CFSTR("Localizable"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", v11, v7);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PASSWORD_ALERT_MESSAGE_SERVICE_TYPE_INTERNAL_BLAME"), &stru_1E2E647A8, CFSTR("Localizable"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[AKAppleIDAuthenticationContext serviceType](self, "serviceType");
        AKStringFromServiceType(v17, v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", v11, v12, v21);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      objc_msgSend(v4, "stringByAppendingString:", v19);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    v13 = v4;
  }
  else
  {
    v13 = 0;
  }
LABEL_11:

  return v13;
}

- (NSString)serviceIdentifier
{
  void *v2;
  void *v3;

  -[AKAppleIDAuthenticationContext serviceIdentifiers](self, "serviceIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setServiceIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKAppleIDAuthenticationContext setServiceIdentifiers:](self, "setServiceIdentifiers:", v6, v7, v8);
  }
}

- (AKDevice)proxiedDevice
{
  return self->_proxiedDevice;
}

- (void)setProxiedDevice:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedDevice, a3);
}

- (AKDevice)companionDevice
{
  return self->_companionDevice;
}

- (void)setCompanionDevice:(id)a3
{
  objc_storeStrong((id *)&self->_companionDevice, a3);
}

- (void)presentBasicLoginUIWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  char v24;
  int v25;
  __CFString *v26;
  char v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  char v37;
  int v38;
  void *v39;
  CFIndex v40;
  void *v41;
  void *v42;
  void *v43;
  __CFUserNotification *v44;
  __CFUserNotification *v45;
  NSString *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  NSString *v51;
  id v52;
  id v53;
  NSString *v54;
  int v55;
  uint8_t buf[8];
  void *v57;
  NSString *username;
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_username && !self->_isUsernameEditable)
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    v55 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Will prompt for password...", buf, 2u);
      v55 = 0;
    }
  }
  else
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Will prompt for username and password...", buf, 2u);
    }
    v55 = 1;
  }

  v6 = self->_passwordPromptTitle;
  if (!v6)
  {
    AKSignInStringFromServiceType(self->_serviceType);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = self->_defaultButtonString;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("INLINE_PASSWORD_ALERT_OK_BUTTON"), &stru_1E2E647A8, CFSTR("Localizable"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  +[AKAlertHandler sharedInstance](AKAlertHandler, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationContext _interpolatedReasonWithBlame](self, "_interpolatedReasonWithBlame");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("INLINE_PASSWORD_ALERT_CANCEL_BUTTON"), &stru_1E2E647A8, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v8;
  objc_msgSend(v10, "notificationDictionaryWithTitle:message:defaultButton:alternateButton:", v6, v11, v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAppleIDAuthenticationContext username](self, "username");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    +[AKDevice currentDevice](AKDevice, "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isMultiUserMode");

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ALERT_TITLE_LOCKSCREEN"), &stru_1E2E647A8, CFSTR("Localizable"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ALERT_MESSAGE_LOCKSCREEN_GENERIC"), &stru_1E2E647A8, CFSTR("Localizable"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = CFSTR("PASSWORD_ALERT_TITLE_LOCKSCREEN");
      v24 = objc_msgSend(CFSTR("PASSWORD_ALERT_TITLE_LOCKSCREEN"), "containsString:", CFSTR("REBRAND"));
      v52 = v4;
      if ((v24 & 1) != 0)
      {
        v25 = 0;
      }
      else
      {
        +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isAABrandingEnabled"))
        {
          objc_msgSend(CFSTR("PASSWORD_ALERT_TITLE_LOCKSCREEN"), "stringByAppendingString:", CFSTR("_REBRAND"));
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v25 = 1;
        }
        else
        {
          v25 = 0;
        }
      }
      objc_msgSend(v19, "localizedStringForKey:value:table:", v23, &stru_1E2E647A8, CFSTR("Localizable"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)

      v51 = v6;
      if ((v24 & 1) == 0)

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("PASSWORD_ALERT_MESSAGE_LOCKSCREEN_GENERIC");
      v27 = objc_msgSend(CFSTR("PASSWORD_ALERT_MESSAGE_LOCKSCREEN_GENERIC"), "containsString:", CFSTR("REBRAND"));
      if ((v27 & 1) != 0)
      {
        v28 = 0;
      }
      else
      {
        +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isAABrandingEnabled"))
        {
          objc_msgSend(CFSTR("PASSWORD_ALERT_MESSAGE_LOCKSCREEN_GENERIC"), "stringByAppendingString:", CFSTR("_REBRAND"));
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v28 = 1;
        }
        else
        {
          v28 = 0;
        }
      }
      objc_msgSend(v21, "localizedStringForKey:value:table:", v26, &stru_1E2E647A8, CFSTR("Localizable"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)

      if ((v27 & 1) == 0)
      v6 = v51;
      v4 = v52;
    }

    objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0DABC18]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0DABC28]);

  }
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isMultiUserMode");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v30)
    v33 = CFSTR("INLINE_PASSWORD_ALERT_PASSCODE_PLACEHOLDER");
  else
    v33 = CFSTR("INLINE_PASSWORD_ALERT_PASSWORD_PLACEHOLDER");
  objc_msgSend(v31, "localizedStringForKey:value:table:", v33, &stru_1E2E647A8, CFSTR("Localizable"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = CFSTR("INLINE_PASSWORD_ALERT_USERNAME_PLACEHOLDER");
    v37 = objc_msgSend(CFSTR("INLINE_PASSWORD_ALERT_USERNAME_PLACEHOLDER"), "containsString:", CFSTR("REBRAND"));
    v53 = v4;
    if ((v37 & 1) != 0)
    {
      v38 = 0;
    }
    else
    {
      +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v50, "isAABrandingEnabled"))
      {
        objc_msgSend(CFSTR("INLINE_PASSWORD_ALERT_USERNAME_PLACEHOLDER"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v38 = 1;
      }
      else
      {
        v38 = 0;
      }
    }
    objc_msgSend(v35, "localizedStringForKey:value:table:", v36, &stru_1E2E647A8, CFSTR("Localizable"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v42;
    v59[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    if ((v37 & 1) == 0)

    v4 = v53;
    if (self->_username)
    {
      username = self->_username;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &username, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = 0;
    }
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0C9B878]);
    if (v43)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v43, *MEMORY[0x1E0C9B880]);

    }
    v41 = &unk_1E2E9A5E0;
    v40 = 1;
  }
  else
  {
    v57 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0C9B878]);
    v40 = 0;
    v41 = &unk_1E2E9A5F8;
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0C9B850]);
  v44 = AKUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0x10000 << v40, 0, (CFDictionaryRef)v14);
  if (v44)
  {
    v45 = v44;
    *(_QWORD *)buf = 0;
    CFUserNotificationReceiveResponse(v44, 0.0, (CFOptionFlags *)buf);
    if (AKUserNotificationResponseAction(buf[0]))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
      v46 = (NSString *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, NSString *))v4 + 2))(v4, 0, 0, 0, v46);
    }
    else
    {
      if (v55)
      {
        v48 = (const __CFString *)*MEMORY[0x1E0C9B880];
        CFUserNotificationGetResponseValue(v45, (CFStringRef)*MEMORY[0x1E0C9B880], 0);
        v46 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v46 = self->_username;
        v48 = (const __CFString *)*MEMORY[0x1E0C9B880];
      }
      CFUserNotificationGetResponseValue(v45, v48, v40);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, NSString *, void *, _QWORD, _QWORD))v4 + 2))(v4, v46, v49, 0, 0);

    }
    CFRelease(v45);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7013);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, 0, v47);

  }
}

- (BOOL)_requiresPasswordInput
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[AKAppleIDAuthenticationContext username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[AKAppleIDAuthenticationContext authKitAccount:](self, "authKitAccount:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (+[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "authenticationModeForAccount:", v4),
        v5,
        v6 == 2))
  {

    return 0;
  }
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[AKAppleIDAuthenticationContext username](self, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Determined that we should show password field for username: %@", (uint8_t *)&v10, 0xCu);

  }
  return 1;
}

- (void)dismissBasicLoginUIWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  char v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;

  v23 = a6;
  v8 = a5;
  v9 = a4;
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContext presentLoginAlertWithError:title:message:completion:].cold.1();

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[AKAlertHandler sharedInstance](AKAlertHandler, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("WRONG_PASSWORD_ALERT_TRY_AGAIN_BUTTON"), &stru_1E2E647A8, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("WRONG_PASSWORD_ALERT_CANCEL_BUTTON"), &stru_1E2E647A8, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "notificationDictionaryWithTitle:message:defaultButton:alternateButton:", v9, v8, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[AKAlertHandler sharedInstance](AKAlertHandler, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __86__AKAppleIDAuthenticationContext_presentLoginAlertWithError_title_message_completion___block_invoke;
  v27[3] = &unk_1E2E5FF30;
  v27[4] = self;
  v28 = v23;
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __86__AKAppleIDAuthenticationContext_presentLoginAlertWithError_title_message_completion___block_invoke_2;
  v25[3] = &unk_1E2E60648;
  v20 = v28;
  v26 = v20;
  v21 = objc_msgSend(v18, "showAlert:primaryAction:altAction:", v17, v27, v25);

  if ((v21 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7013);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v20 + 2))(v20, 0, 0, 0, v22);

  }
}

uint64_t __86__AKAppleIDAuthenticationContext_presentLoginAlertWithError_title_message_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentBasicLoginUIWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __86__AKAppleIDAuthenticationContext_presentLoginAlertWithError_title_message_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, 0, v2);

}

- (void)presentSecondFactorUIWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ENTER_VERITIFCATION_CODE_CANCEL_BUTTON"), &stru_1E2E647A8, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C9B838]);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ENTER_VERITIFCATION_CODE_FAILED_BUTTON"), &stru_1E2E647A8, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C9B830]);

  v10 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C9B820]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resourceURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0C9B860]);

  objc_msgSend(MEMORY[0x1E0CB35E8], "extensionItemWithAppleIDAuthenticationContext:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB36F8];
  v23[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("com.apple.AuthKitUI.AKSecondFactorEntryAlert"), *MEMORY[0x1E0DABBB8]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0DABBC0]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0DABB98]);
  -[AKAppleIDAuthenticationContext _secondFactorQueue](self, "_secondFactorQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__AKAppleIDAuthenticationContext_presentSecondFactorUIWithCompletion___block_invoke;
  block[3] = &unk_1E2E61350;
  v21 = v5;
  v22 = v4;
  block[4] = self;
  v18 = v5;
  v19 = v4;
  dispatch_async(v17, block);

}

void __70__AKAppleIDAuthenticationContext_presentSecondFactorUIWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD block[5];

  v2 = MEMORY[0x194022E4C](*(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_startListeningForSecondFactorCodeEntryNotification");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = AKUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, 0, *(CFDictionaryRef *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 64))
  {
    dispatch_get_global_queue(25, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__AKAppleIDAuthenticationContext_presentSecondFactorUIWithCompletion___block_invoke_2;
    block[3] = &unk_1E2E5E1D0;
    block[4] = v5;
    dispatch_async(v6, block);

  }
  else
  {
    v7 = *(_QWORD *)(v5 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7013);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 72);
    *(_QWORD *)(v9 + 72) = 0;

  }
}

void __70__AKAppleIDAuthenticationContext_presentSecondFactorUIWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[6];
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(_QWORD *)(a1 + 32) + 64), 0.0, &responseFlags);
  v2 = AKUserNotificationResponseAction(responseFlags);
  objc_msgSend(*(id *)(a1 + 32), "_secondFactorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__AKAppleIDAuthenticationContext_presentSecondFactorUIWithCompletion___block_invoke_3;
  block[3] = &unk_1E2E61CF8;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = v2;
  dispatch_async(v3, block);

}

void __70__AKAppleIDAuthenticationContext_presentSecondFactorUIWithCompletion___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[9];
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4 > 3)
      v5 = -7013;
    else
      v5 = qword_1920F13B8[v4];
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v6);

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 72);
    *(_QWORD *)(v7 + 72) = 0;

    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "_stopListeningForSecondFactorCodeEntryNotification");
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 64));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
}

- (void)dismissSecondFactorUIWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AKAppleIDAuthenticationContext _secondFactorQueue](self, "_secondFactorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__AKAppleIDAuthenticationContext_dismissSecondFactorUIWithCompletion___block_invoke;
  v7[3] = &unk_1E2E5FF30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __70__AKAppleIDAuthenticationContext_dismissSecondFactorUIWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  uint8_t v8[16];
  uint8_t buf[16];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v3, OS_LOG_TYPE_DEFAULT, "Canceling second-factor entry prompt.", buf, 2u);
    }

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = 0;

    CFUserNotificationCancel(*(CFUserNotificationRef *)(*(_QWORD *)(a1 + 32) + 64));
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19202F000, v3, OS_LOG_TYPE_DEFAULT, "Nothing to dismiss right now.", v8, 2u);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)presentSecondFactorAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;

  v22 = a6;
  v8 = (objc_class *)MEMORY[0x1E0C99E08];
  v9 = a5;
  v10 = a4;
  v11 = objc_alloc_init(v8);
  +[AKAlertHandler sharedInstance](AKAlertHandler, "sharedInstance");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("WRONG_LOGIN_CODE_TRY_AGAIN_BUTTON"), &stru_1E2E647A8, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("WRONG_LOGIN_CODE_ALERT_CANCEL_BUTTON"), &stru_1E2E647A8, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "notificationDictionaryWithTitle:message:defaultButton:alternateButton:", v10, v9, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[AKAlertHandler sharedInstance](AKAlertHandler, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __93__AKAppleIDAuthenticationContext_presentSecondFactorAlertWithError_title_message_completion___block_invoke;
  v26[3] = &unk_1E2E5FF30;
  v26[4] = self;
  v27 = v22;
  v24[0] = v19;
  v24[1] = 3221225472;
  v24[2] = __93__AKAppleIDAuthenticationContext_presentSecondFactorAlertWithError_title_message_completion___block_invoke_2;
  v24[3] = &unk_1E2E60648;
  v20 = v27;
  v25 = v20;
  LOBYTE(v12) = objc_msgSend(v18, "showAlert:primaryAction:altAction:", v17, v26, v24);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7013);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v20 + 2))(v20, 0, v21);

  }
}

uint64_t __93__AKAppleIDAuthenticationContext_presentSecondFactorAlertWithError_title_message_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentSecondFactorUIWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __93__AKAppleIDAuthenticationContext_presentSecondFactorAlertWithError_title_message_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)_startListeningForSecondFactorCodeEntryNotification
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19202F000, v3, OS_LOG_TYPE_DEFAULT, "Listening for code entry notification...", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)__AKAppleIDLoginCodeWasEntered, CFSTR("com.apple.ak.code.entered"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopListeningForSecondFactorCodeEntryNotification
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19202F000, v3, OS_LOG_TYPE_DEFAULT, "No longer listening for code entry notification.", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.ak.code.entered"), 0);
}

- (void)_handleSecondFactorCodeEntry
{
  NSObject *v3;
  _QWORD block[5];

  -[AKAppleIDAuthenticationContext _secondFactorQueue](self, "_secondFactorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke;
  block[3] = &unk_1E2E5E1D0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  v2 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("AKTemporaryValue"), (CFStringRef)*MEMORY[0x1E0C9B228]);
  if (v3)
  {
    CFPreferencesSetAppValue(CFSTR("AKTemporaryValue"), 0, v2);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke_cold_2();
      goto LABEL_13;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke_cold_3();

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "integerValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);
LABEL_10:

    v11 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v11 + 72);
    *(_QWORD *)(v11 + 72) = 0;
LABEL_13:

    goto LABEL_14;
  }
  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke_cold_1();

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7001);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v8);
    goto LABEL_10;
  }
LABEL_14:
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    _AKLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_19202F000, v12, OS_LOG_TYPE_DEFAULT, "Closing login code prompt.", v13, 2u);
    }

    CFUserNotificationCancel(*(CFUserNotificationRef *)(*(_QWORD *)(a1 + 32) + 64));
  }

}

- (id)_secondFactorQueue
{
  OS_dispatch_queue *secondFactorQueue;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;

  secondFactorQueue = self->_secondFactorQueue;
  if (!secondFactorQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ak.twofa", v4);
    v6 = self->_secondFactorQueue;
    self->_secondFactorQueue = v5;

    secondFactorQueue = self->_secondFactorQueue;
  }
  return secondFactorQueue;
}

- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  objc_msgSend(v5, "ak_errorWithCode:", -7027);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v7);

}

- (NSString)username
{
  return self->_username;
}

- (BOOL)_isProxyingForApp
{
  return self->_isProxyingForApp;
}

- (void)_setProxyingForApp:(BOOL)a3
{
  self->_isProxyingForApp = a3;
}

- (NSString)_proxiedAppBundleID
{
  return self->_proxiedAppBundleID;
}

- (void)_setProxiedAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSUUID)_identifier
{
  return self->_identifier;
}

- (NSString)_identityToken
{
  return self->_identityToken;
}

- (void)_setIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)_remoteUIIdentityToken
{
  return self->_remoteUIIdentityToken;
}

- (void)_setRemoteUIIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)_shouldSendIdentityTokenForRemoteUI
{
  return self->_shouldSendIdentityTokenForRemoteUI;
}

- (void)set_shouldSendIdentityTokenForRemoteUI:(BOOL)a3
{
  self->_shouldSendIdentityTokenForRemoteUI = a3;
}

- (BOOL)_shouldSendGrandSlamTokensForRemoteUI
{
  return self->_shouldSendGrandSlamTokensForRemoteUI;
}

- (void)set_shouldSendGrandSlamTokensForRemoteUI:(BOOL)a3
{
  self->_shouldSendGrandSlamTokensForRemoteUI = a3;
}

- (NSString)_passwordPromptTitle
{
  return self->_passwordPromptTitle;
}

- (void)set_passwordPromptTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)_password
{
  return self->_password;
}

- (BOOL)_isPasswordEditable
{
  return self->_isPasswordEditable;
}

- (void)set_isPasswordEditable:(BOOL)a3
{
  self->_isPasswordEditable = a3;
}

- (NSString)_shortLivedToken
{
  return self->_shortLivedToken;
}

- (void)_setShortLivedToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)_message
{
  return self->_message;
}

- (void)_setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (BOOL)_shouldSkipInitialReachabilityCheck
{
  return self->_shouldSkipInitialReachabilityCheck;
}

- (void)set_shouldSkipInitialReachabilityCheck:(BOOL)a3
{
  self->_shouldSkipInitialReachabilityCheck = a3;
}

- (unint64_t)_attemptIndex
{
  return self->_attemptIndex;
}

- (void)set_attemptIndex:(unint64_t)a3
{
  self->_attemptIndex = a3;
}

- (AKAnisetteData)companionDeviceAnisetteData
{
  return self->_companionDeviceAnisetteData;
}

- (void)setCompanionDeviceAnisetteData:(id)a3
{
  objc_storeStrong((id *)&self->_companionDeviceAnisetteData, a3);
}

- (AKAnisetteData)proxiedDeviceAnisetteData
{
  return self->_proxiedDeviceAnisetteData;
}

- (void)setProxiedDeviceAnisetteData:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedDeviceAnisetteData, a3);
}

- (NSString)_masterKey
{
  return self->_masterKey;
}

- (void)_setMasterKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)_performUIOutOfProcess
{
  return self->_performUIOutOfProcess;
}

- (void)set_performUIOutOfProcess:(BOOL)a3
{
  self->_performUIOutOfProcess = a3;
}

- (BOOL)_keepAlive
{
  return self->_keepAlive;
}

- (void)set_keepAlive:(BOOL)a3
{
  self->_keepAlive = a3;
}

- (BOOL)_isForcedEligibleForForegroundAuthentication
{
  return self->_forceEligibleForForegroundAuthentication;
}

- (void)set_forceEligibleForForegroundAuthentication:(BOOL)a3
{
  self->_forceEligibleForForegroundAuthentication = a3;
}

- (BOOL)_shouldBroadcastForProximityAuthOnly
{
  return self->_shouldBroadcastForProximityAuthOnly;
}

- (void)set_shouldBroadcastForProximityAuthOnly:(BOOL)a3
{
  self->_shouldBroadcastForProximityAuthOnly = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (unint64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(unint64_t)a3
{
  self->_authenticationType = a3;
}

- (unint64_t)authenticationMode
{
  return self->_authenticationMode;
}

- (void)setAuthenticationMode:(unint64_t)a3
{
  self->_authenticationMode = a3;
}

- (BOOL)isMDMInformationRequired
{
  return self->_isMDMInformationRequired;
}

- (void)setIsMDMInformationRequired:(BOOL)a3
{
  self->_isMDMInformationRequired = a3;
}

- (NSString)_proxiedAppName
{
  return self->_proxiedAppName;
}

- (void)_setProxiedAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSDictionary)appProvidedData
{
  return self->_appProvidedData;
}

- (void)setAppProvidedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)appProvidedContext
{
  return self->_appProvidedContext;
}

- (void)setAppProvidedContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (BOOL)cliMode
{
  return self->_cliMode;
}

- (void)setCliMode:(BOOL)a3
{
  self->_cliMode = a3;
}

- (NSString)passwordlessToken
{
  return self->_passwordlessToken;
}

- (void)setPasswordlessToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)idmsDataToken
{
  return self->_idmsDataToken;
}

- (void)setIdmsDataToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (BOOL)isNativeTakeover
{
  return self->_isNativeTakeover;
}

- (void)setIsNativeTakeover:(BOOL)a3
{
  self->_isNativeTakeover = a3;
}

- (BOOL)ignorePasswordCache
{
  return self->_ignorePasswordCache;
}

- (void)setIgnorePasswordCache:(BOOL)a3
{
  self->_ignorePasswordCache = a3;
}

- (BOOL)_ignoreShouldContinueProxy
{
  return self->_ignoreShouldContinueProxy;
}

- (void)set_ignoreShouldContinueProxy:(BOOL)a3
{
  self->_ignoreShouldContinueProxy = a3;
}

- (BOOL)isRequestedFromOOPViewService
{
  return self->_isRequestedFromOOPViewService;
}

- (void)setIsRequestedFromOOPViewService:(BOOL)a3
{
  self->_isRequestedFromOOPViewService = a3;
}

- (NSString)telemetryDeviceSessionID
{
  return self->_telemetryDeviceSessionID;
}

- (void)setTelemetryDeviceSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (AKCompanionKeyEnvelope)companionKeyEnvelope
{
  return self->_companionKeyEnvelope;
}

- (void)setCompanionKeyEnvelope:(id)a3
{
  objc_storeStrong((id *)&self->_companionKeyEnvelope, a3);
}

- (BOOL)piggybackingForTrustedDevice
{
  return self->_piggybackingForTrustedDevice;
}

- (void)setPiggybackingForTrustedDevice:(BOOL)a3
{
  self->_piggybackingForTrustedDevice = a3;
}

- (BOOL)isUsernameEditable
{
  return self->_isUsernameEditable;
}

- (void)setIsUsernameEditable:(BOOL)a3
{
  self->_isUsernameEditable = a3;
}

- (BOOL)shouldAllowAppleIDCreation
{
  return self->_shouldAllowAppleIDCreation;
}

- (void)setShouldAllowAppleIDCreation:(BOOL)a3
{
  self->_shouldAllowAppleIDCreation = a3;
}

- (BOOL)needsCredentialRecovery
{
  return self->_needsCredentialRecovery;
}

- (void)setNeedsCredentialRecovery:(BOOL)a3
{
  self->_needsCredentialRecovery = a3;
}

- (BOOL)needsNewAppleID
{
  return self->_needsNewAppleID;
}

- (void)setNeedsNewAppleID:(BOOL)a3
{
  self->_needsNewAppleID = a3;
}

- (BOOL)needsPasswordChange
{
  return self->_needsPasswordChange;
}

- (void)setNeedsPasswordChange:(BOOL)a3
{
  self->_needsPasswordChange = a3;
}

- (BOOL)isTriggeredByNotification
{
  return self->_isTriggeredByNotification;
}

- (void)setTriggeredByNotification:(BOOL)a3
{
  self->_isTriggeredByNotification = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)defaultButtonString
{
  return self->_defaultButtonString;
}

- (void)setDefaultButtonString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (int64_t)maximumLoginAttempts
{
  return self->_maximumLoginAttempts;
}

- (void)setMaximumLoginAttempts:(int64_t)a3
{
  self->_maximumLoginAttempts = a3;
}

- (NSArray)serviceIdentifiers
{
  return self->_serviceIdentifiers;
}

- (void)setServiceIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (BOOL)isEphemeral
{
  return self->_isEphemeral;
}

- (void)setIsEphemeral:(BOOL)a3
{
  self->_isEphemeral = a3;
}

- (NSString)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NSDictionary)httpHeadersForRemoteUI
{
  return self->_httpHeadersForRemoteUI;
}

- (void)setHttpHeadersForRemoteUI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (id)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong(&self->_clientInfo, a3);
}

- (BOOL)shouldOfferSecurityUpgrade
{
  return self->_shouldOfferSecurityUpgrade;
}

- (void)setShouldOfferSecurityUpgrade:(BOOL)a3
{
  self->_shouldOfferSecurityUpgrade = a3;
}

- (BOOL)needsRepair
{
  return self->_needsRepair;
}

- (void)setNeedsRepair:(BOOL)a3
{
  self->_needsRepair = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)helpAnchor
{
  return self->_helpAnchor;
}

- (void)setHelpAnchor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSString)helpBook
{
  return self->_helpBook;
}

- (void)setHelpBook:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (int64_t)authenticationPromptStyle
{
  return self->_authenticationPromptStyle;
}

- (void)setAuthenticationPromptStyle:(int64_t)a3
{
  self->_authenticationPromptStyle = a3;
}

- (NSString)cancelButtonString
{
  return self->_cancelButtonString;
}

- (void)setCancelButtonString:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonString, a3);
}

- (NSString)alternativeButtonString
{
  return self->_alternativeButtonString;
}

- (void)setAlternativeButtonString:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeButtonString, a3);
}

- (BOOL)hideAlternativeButton
{
  return self->_hideAlternativeButton;
}

- (void)setHideAlternativeButton:(BOOL)a3
{
  self->_hideAlternativeButton = a3;
}

- (BOOL)hideCancelButton
{
  return self->_hideCancelButton;
}

- (void)setHideCancelButton:(BOOL)a3
{
  self->_hideCancelButton = a3;
}

- (BOOL)hideReasonString
{
  return self->_hideReasonString;
}

- (void)setHideReasonString:(BOOL)a3
{
  self->_hideReasonString = a3;
}

- (BOOL)clientShouldHandleAlternativeButtonAction
{
  return self->_clientShouldHandleAlternativeButtonAction;
}

- (void)setClientShouldHandleAlternativeButtonAction:(BOOL)a3
{
  self->_clientShouldHandleAlternativeButtonAction = a3;
}

- (NSString)windowTitle
{
  return self->_windowTitle;
}

- (void)setWindowTitle:(id)a3
{
  objc_storeStrong((id *)&self->_windowTitle, a3);
}

- (BOOL)alwaysShowUsernameField
{
  return self->_alwaysShowUsernameField;
}

- (void)setAlwaysShowUsernameField:(BOOL)a3
{
  self->_alwaysShowUsernameField = a3;
}

- (NSString)privacyBundleIdentifier
{
  return self->_privacyBundleIdentifier;
}

- (void)setPrivacyBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (BOOL)disableProximityAuth
{
  return self->_disableProximityAuth;
}

- (void)setDisableProximityAuth:(BOOL)a3
{
  self->_disableProximityAuth = a3;
}

- (id)proximityAIDAHandler
{
  return self->_proximityAIDAHandler;
}

- (void)setProximityAIDAHandler:(id)a3
{
  self->_proximityAIDAHandler = a3;
}

- (NSData)displayImageData
{
  return self->_displayImageData;
}

- (void)setDisplayImageData:(id)a3
{
  objc_storeStrong((id *)&self->_displayImageData, a3);
}

- (BOOL)deviceRegionRequired
{
  return self->_deviceRegionRequired;
}

- (void)setDeviceRegionRequired:(BOOL)a3
{
  self->_deviceRegionRequired = a3;
}

- (BOOL)isPasscodeOnlyPolicy
{
  return self->_passcodeOnlyPolicy;
}

- (void)setPasscodeOnlyPolicy:(BOOL)a3
{
  self->_passcodeOnlyPolicy = a3;
}

- (unint64_t)securityCode
{
  return self->_securityCode;
}

- (void)setSecurityCode:(unint64_t)a3
{
  self->_securityCode = a3;
}

- (BOOL)shouldPromptForPasswordOnly
{
  return self->_shouldPromptForPasswordOnly;
}

- (void)setShouldPromptForPasswordOnly:(BOOL)a3
{
  self->_shouldPromptForPasswordOnly = a3;
}

- (BOOL)shouldUpdatePersistentServiceTokens
{
  return self->_shouldUpdatePersistentServiceTokens;
}

- (void)setShouldUpdatePersistentServiceTokens:(BOOL)a3
{
  self->_shouldUpdatePersistentServiceTokens = a3;
}

- (AKAnisetteServiceProtocol)anisetteDataProvider
{
  return self->_anisetteDataProvider;
}

- (void)setAnisetteDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_anisetteDataProvider, a3);
}

- (NSNumber)isAppleIDLoginEnabled
{
  return self->_isAppleIDLoginEnabled;
}

- (void)setAppleIDLoginEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (NSNumber)hasEmptyPassword
{
  return self->_hasEmptyPassword;
}

- (void)setHasEmptyPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (BOOL)shouldRequestRecoveryPET
{
  return self->_shouldRequestRecoveryPET;
}

- (void)setShouldRequestRecoveryPET:(BOOL)a3
{
  self->_shouldRequestRecoveryPET = a3;
}

- (BOOL)shouldRequestShortLivedToken
{
  return self->_shouldRequestShortLivedToken;
}

- (void)setShouldRequestShortLivedToken:(BOOL)a3
{
  self->_shouldRequestShortLivedToken = a3;
}

- (BOOL)shouldRequestConfigurationInfo
{
  return self->_shouldRequestConfigurationInfo;
}

- (void)setShouldRequestConfigurationInfo:(BOOL)a3
{
  self->_shouldRequestConfigurationInfo = a3;
}

- (BOOL)supportsPiggybacking
{
  return self->_supportsPiggybacking;
}

- (void)setSupportsPiggybacking:(BOOL)a3
{
  self->_supportsPiggybacking = a3;
}

- (BOOL)anticipateEscrowAttempt
{
  return self->_anticipateEscrowAttempt;
}

- (void)setAnticipateEscrowAttempt:(BOOL)a3
{
  self->_anticipateEscrowAttempt = a3;
}

- (NSSet)desiredInternalTokens
{
  return self->_desiredInternalTokens;
}

- (void)setDesiredInternalTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (BOOL)isFirstTimeLogin
{
  return self->_isFirstTimeLogin;
}

- (void)setFirstTimeLogin:(BOOL)a3
{
  self->_isFirstTimeLogin = a3;
}

- (BOOL)shouldSkipSettingsLaunchAlert
{
  return self->_shouldSkipSettingsLaunchAlert;
}

- (void)setShouldSkipSettingsLaunchAlert:(BOOL)a3
{
  self->_shouldSkipSettingsLaunchAlert = a3;
}

- (NSString)securityUpgradeContext
{
  return self->_securityUpgradeContext;
}

- (void)setSecurityUpgradeContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (BOOL)needsNewChildAccount
{
  return self->_needsNewChildAccount;
}

- (void)setNeedsNewChildAccount:(BOOL)a3
{
  self->_needsNewChildAccount = a3;
}

- (BOOL)needsSecurityUpgradeUI
{
  return self->_needsSecurityUpgradeUI;
}

- (void)setNeedsSecurityUpgradeUI:(BOOL)a3
{
  self->_needsSecurityUpgradeUI = a3;
}

- (BOOL)isRKVerification
{
  return self->_isRKVerification;
}

- (void)setIsRKVerification:(BOOL)a3
{
  self->_isRKVerification = a3;
}

- (NSString)dependentAltDSID
{
  return self->_dependentAltDSID;
}

- (void)setDependentAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (NSString)cellularDataAttributionAppBundleID
{
  return self->_cellularDataAttributionAppBundleID;
}

- (void)setCellularDataAttributionAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (int64_t)verifyCredentialReason
{
  return self->_verifyCredentialReason;
}

- (void)setVerifyCredentialReason:(int64_t)a3
{
  self->_verifyCredentialReason = a3;
}

- (NSString)custodianRecoveryToken
{
  return self->_custodianRecoveryToken;
}

- (void)setCustodianRecoveryToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (NSString)callerIconBundlePath
{
  return self->_callerIconBundlePath;
}

- (void)setCallerIconBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (NSString)localizedCallerName
{
  return self->_localizedCallerName;
}

- (void)setLocalizedCallerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (BOOL)enablePasscodeAuth
{
  return self->_enablePasscodeAuth;
}

- (void)setEnablePasscodeAuth:(BOOL)a3
{
  self->_enablePasscodeAuth = a3;
}

- (NSString)serviceToken
{
  return self->_serviceToken;
}

- (void)setServiceToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (NSString)proxiedAppleID
{
  return self->_proxiedAppleID;
}

- (void)setProxiedAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (NSString)sourceAltDSID
{
  return self->_sourceAltDSID;
}

- (void)setSourceAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (BOOL)allowAuthenticationBeforeFirstUnlock
{
  return self->_allowAuthenticationBeforeFirstUnlock;
}

- (void)setAllowAuthenticationBeforeFirstUnlock:(BOOL)a3
{
  self->_allowAuthenticationBeforeFirstUnlock = a3;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (NSString)displayTitle
{
  return self->_displayTitle;
}

- (void)setDisplayTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayTitle, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_sourceAltDSID, 0);
  objc_storeStrong((id *)&self->_proxiedAppleID, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_localizedCallerName, 0);
  objc_storeStrong((id *)&self->_callerIconBundlePath, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryToken, 0);
  objc_storeStrong((id *)&self->_cellularDataAttributionAppBundleID, 0);
  objc_storeStrong((id *)&self->_dependentAltDSID, 0);
  objc_storeStrong((id *)&self->_securityUpgradeContext, 0);
  objc_storeStrong((id *)&self->_desiredInternalTokens, 0);
  objc_storeStrong((id *)&self->_hasEmptyPassword, 0);
  objc_storeStrong((id *)&self->_isAppleIDLoginEnabled, 0);
  objc_storeStrong((id *)&self->_anisetteDataProvider, 0);
  objc_storeStrong((id *)&self->_displayImageData, 0);
  objc_storeStrong((id *)&self->_privacyBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_windowTitle, 0);
  objc_storeStrong((id *)&self->_alternativeButtonString, 0);
  objc_storeStrong((id *)&self->_cancelButtonString, 0);
  objc_storeStrong((id *)&self->_helpBook, 0);
  objc_storeStrong((id *)&self->_helpAnchor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_httpHeadersForRemoteUI, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_serviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_defaultButtonString, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_companionKeyEnvelope, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_telemetryDeviceSessionID, 0);
  objc_storeStrong((id *)&self->_idmsDataToken, 0);
  objc_storeStrong((id *)&self->_passwordlessToken, 0);
  objc_storeStrong((id *)&self->_appProvidedContext, 0);
  objc_storeStrong((id *)&self->_appProvidedData, 0);
  objc_storeStrong((id *)&self->_proxiedAppName, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_masterKey, 0);
  objc_storeStrong((id *)&self->_proxiedDeviceAnisetteData, 0);
  objc_storeStrong((id *)&self->_companionDeviceAnisetteData, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_shortLivedToken, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_passwordPromptTitle, 0);
  objc_storeStrong((id *)&self->_remoteUIIdentityToken, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_proxiedAppBundleID, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_interpolatedReason, 0);
  objc_storeStrong((id *)&self->_companionDevice, 0);
  objc_storeStrong((id *)&self->_proxiedDevice, 0);
  objc_storeStrong((id *)&self->_secondFactorQueue, 0);
  objc_storeStrong(&self->_secondFactoryEntryCompletion, 0);
  objc_storeStrong((id *)&self->_notificationDisclaimer, 0);
  objc_storeStrong((id *)&self->_deviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_generatedCode, 0);
}

- (NSString)generatedCode
{
  return self->_generatedCode;
}

- (void)setGeneratedCode:(id)a3
{
  NSString *v4;
  NSString *generatedCode;

  if (self->_generatedCode != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    generatedCode = self->_generatedCode;
    self->_generatedCode = v4;

  }
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
  NSNumber *v4;
  NSNumber *latitude;

  if (self->_latitude != a3)
  {
    v4 = (NSNumber *)objc_msgSend(a3, "copy");
    latitude = self->_latitude;
    self->_latitude = v4;

  }
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
  NSNumber *v4;
  NSNumber *longitude;

  if (self->_longitude != a3)
  {
    v4 = (NSNumber *)objc_msgSend(a3, "copy");
    longitude = self->_longitude;
    self->_longitude = v4;

  }
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  NSString *v4;
  NSString *deviceClass;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  deviceClass = self->_deviceClass;
  self->_deviceClass = v4;

}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
  NSString *v4;
  NSString *deviceColor;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  deviceColor = self->_deviceColor;
  self->_deviceColor = v4;

}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (void)setDeviceEnclosureColor:(id)a3
{
  NSString *v4;
  NSString *deviceEnclosureColor;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  deviceEnclosureColor = self->_deviceEnclosureColor;
  self->_deviceEnclosureColor = v4;

}

- (NSString)notificationDisclaimer
{
  return self->_notificationDisclaimer;
}

- (void)setNotificationDisclaimer:(id)a3
{
  NSString *v4;
  NSString *notificationDisclaimer;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  notificationDisclaimer = self->_notificationDisclaimer;
  self->_notificationDisclaimer = v4;

}

- (void)_sanitizedCopy
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_19202F000, v0, v1, "Client passed auth context with email value in altDSID property - this is an error, do not do this.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_updateWithValuesFromContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_19202F000, v0, v1, "Cannot update auth context with nil context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_updateWithValuesFromContext:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_19202F000, log, OS_LOG_TYPE_DEBUG, "%@ being updated by %@", (uint8_t *)&v3, 0x16u);
}

- (void)isContextEligibleForPasscodeAuth
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Begin passcode auth eligibility check", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)isConfiguredForTokenUpgrade
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Plt upgrade enabled, checking if plt is nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_setPassword:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_19202F000, v0, v1, "Client set raw password to a PET - this is an error, please do not do this.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_interpolatedReason
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "self.username is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)presentLoginAlertWithError:title:message:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Showing login error...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Notified that 2FA code was entered, but code is empty!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Dropping 2FA code because we are currently holding a reply block.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Passing 2FA code to akd.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
