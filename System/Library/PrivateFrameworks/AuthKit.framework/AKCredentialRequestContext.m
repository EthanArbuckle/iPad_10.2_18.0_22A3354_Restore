@implementation AKCredentialRequestContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *requestIdentifier;
  id v5;

  requestIdentifier = self->_requestIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestIdentifier, CFSTR("_requestIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldForceUI, CFSTR("_shoudlForceUI"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldSkipBiometrics, CFSTR("_shoudlSkipBiometrics"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldSkipAuthorizationUI, CFSTR("_shoudlSkipUI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconName, CFSTR("_iconName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconData, CFSTR("_iconData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconScale, CFSTR("_iconScale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconSize, CFSTR("_iconSize"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldForcePrivateEmail, CFSTR("_shouldForcePrivateEmail"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedClientAppName, CFSTR("_proxiedClientAppName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedClientBundleID, CFSTR("_proxiedClientBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedClientTeamID, CFSTR("_proxiedClientTeamID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedClientAppID, CFSTR("_proxiedClientAppID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedAssociatedDomains, CFSTR("_proxiedAssociatedDomains"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedDeviceName, CFSTR("_proxiedDeviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedDeviceClass, CFSTR("_proxiedDeviceClass"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorizationRequest, CFSTR("_authorizationRequests"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passwordRequest, CFSTR("_passwordRequests"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isWebLogin, CFSTR("_isWebLogin"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFirstPartyLogin, CFSTR("_isFirstPartyLogin"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isRapportLogin, CFSTR("_isRapportLogin"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isEligibleForUpgradeFromPassword, CFSTR("_upgradeFromPassword"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callerBundleID, CFSTR("_callerBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callerSceneID, CFSTR("_callerSceneID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requirePassword, CFSTR("_requirePassword"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedClientServiceID, CFSTR("_proxiedServiceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_upgradeContext, CFSTR("_upgradeContext"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_clientShouldAuthenticateExternally, CFSTR("_clientShouldAuthenticateExternally"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_authSessionTimeout"), self->_authSessionTimeoutInterval);
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalAuthToken, CFSTR("_externalAuthToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalLocalAuthData, CFSTR("_externalLocalAuthData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_continuationRequestIdentifier, CFSTR("_continuationRequestIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_requestOptions, CFSTR("_requestOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionID, CFSTR("_sessionID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldUseProxiedClientBundleIDForSRP, CFSTR("_shouldUseProxiedClientBundleIDForSRP"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isItunesLogin, CFSTR("_isItunesLogin"));

}

- (AKCredentialRequestContext)initWithCoder:(id)a3
{
  id v4;
  AKCredentialRequestContext *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSUUID *requestIdentifier;
  uint64_t v11;
  NSString *iconName;
  uint64_t v13;
  NSData *iconData;
  uint64_t v15;
  NSNumber *iconScale;
  uint64_t v17;
  NSValue *iconSize;
  uint64_t v19;
  NSString *proxiedClientAppName;
  uint64_t v21;
  NSString *proxiedClientBundleID;
  uint64_t v23;
  NSString *proxiedClientTeamID;
  uint64_t v25;
  NSString *proxiedClientAppID;
  uint64_t v27;
  NSArray *proxiedAssociatedDomains;
  uint64_t v29;
  NSString *proxiedDeviceName;
  uint64_t v31;
  NSString *proxiedDeviceClass;
  uint64_t v33;
  AKAuthorizationRequest *authorizationRequest;
  uint64_t v35;
  AKPasswordRequest *passwordRequest;
  uint64_t v37;
  NSString *callerBundleID;
  uint64_t v39;
  NSString *callerSceneID;
  void *v41;
  uint64_t v42;
  NSString *proxiedClientServiceID;
  uint64_t v44;
  AKAuthorizationUpgradeContext *upgradeContext;
  double v46;
  uint64_t v47;
  NSString *externalAuthToken;
  uint64_t v49;
  NSData *externalLocalAuthData;
  uint64_t v51;
  NSString *continuationRequestIdentifier;
  uint64_t v53;
  NSString *sessionID;
  objc_super v56;

  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)AKCredentialRequestContext;
  v5 = -[AKCredentialRequestContext init](&v56, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requestIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v9;

    v5->_shouldForceUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shoudlForceUI"));
    v5->_shouldSkipBiometrics = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shoudlSkipBiometrics"));
    v5->_shouldSkipAuthorizationUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shoudlSkipUI"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_iconName"));
    v11 = objc_claimAutoreleasedReturnValue();
    iconName = v5->_iconName;
    v5->_iconName = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_iconData"));
    v13 = objc_claimAutoreleasedReturnValue();
    iconData = v5->_iconData;
    v5->_iconData = (NSData *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_iconScale"));
    v15 = objc_claimAutoreleasedReturnValue();
    iconScale = v5->_iconScale;
    v5->_iconScale = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_iconSize"));
    v17 = objc_claimAutoreleasedReturnValue();
    iconSize = v5->_iconSize;
    v5->_iconSize = (NSValue *)v17;

    v5->_shouldForcePrivateEmail = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldForcePrivateEmail"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedClientAppName"));
    v19 = objc_claimAutoreleasedReturnValue();
    proxiedClientAppName = v5->_proxiedClientAppName;
    v5->_proxiedClientAppName = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedClientBundleID"));
    v21 = objc_claimAutoreleasedReturnValue();
    proxiedClientBundleID = v5->_proxiedClientBundleID;
    v5->_proxiedClientBundleID = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedClientTeamID"));
    v23 = objc_claimAutoreleasedReturnValue();
    proxiedClientTeamID = v5->_proxiedClientTeamID;
    v5->_proxiedClientTeamID = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedClientAppID"));
    v25 = objc_claimAutoreleasedReturnValue();
    proxiedClientAppID = v5->_proxiedClientAppID;
    v5->_proxiedClientAppID = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_proxiedAssociatedDomains"));
    v27 = objc_claimAutoreleasedReturnValue();
    proxiedAssociatedDomains = v5->_proxiedAssociatedDomains;
    v5->_proxiedAssociatedDomains = (NSArray *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedDeviceName"));
    v29 = objc_claimAutoreleasedReturnValue();
    proxiedDeviceName = v5->_proxiedDeviceName;
    v5->_proxiedDeviceName = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedDeviceClass"));
    v31 = objc_claimAutoreleasedReturnValue();
    proxiedDeviceClass = v5->_proxiedDeviceClass;
    v5->_proxiedDeviceClass = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_authorizationRequests"));
    v33 = objc_claimAutoreleasedReturnValue();
    authorizationRequest = v5->_authorizationRequest;
    v5->_authorizationRequest = (AKAuthorizationRequest *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_passwordRequests"));
    v35 = objc_claimAutoreleasedReturnValue();
    passwordRequest = v5->_passwordRequest;
    v5->_passwordRequest = (AKPasswordRequest *)v35;

    v5->_isWebLogin = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isWebLogin"));
    v5->_isFirstPartyLogin = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isFirstPartyLogin"));
    v5->_isRapportLogin = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isRapportLogin"));
    v5->_isEligibleForUpgradeFromPassword = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_upgradeFromPassword"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_callerBundleID"));
    v37 = objc_claimAutoreleasedReturnValue();
    callerBundleID = v5->_callerBundleID;
    v5->_callerBundleID = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_callerSceneID"));
    v39 = objc_claimAutoreleasedReturnValue();
    callerSceneID = v5->_callerSceneID;
    v5->_callerSceneID = (NSString *)v39;

    v5->_requirePassword = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_requirePassword"));
    +[AKDevice currentDevice](AKDevice, "currentDevice");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_passcodeProtected = objc_msgSend(v41, "isProtectedWithPasscode");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedServiceID"));
    v42 = objc_claimAutoreleasedReturnValue();
    proxiedClientServiceID = v5->_proxiedClientServiceID;
    v5->_proxiedClientServiceID = (NSString *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_upgradeContext"));
    v44 = objc_claimAutoreleasedReturnValue();
    upgradeContext = v5->_upgradeContext;
    v5->_upgradeContext = (AKAuthorizationUpgradeContext *)v44;

    v5->_clientShouldAuthenticateExternally = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_clientShouldAuthenticateExternally"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_authSessionTimeout"));
    v5->_authSessionTimeoutInterval = v46;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_externalAuthToken"));
    v47 = objc_claimAutoreleasedReturnValue();
    externalAuthToken = v5->_externalAuthToken;
    v5->_externalAuthToken = (NSString *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_externalLocalAuthData"));
    v49 = objc_claimAutoreleasedReturnValue();
    externalLocalAuthData = v5->_externalLocalAuthData;
    v5->_externalLocalAuthData = (NSData *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_continuationRequestIdentifier"));
    v51 = objc_claimAutoreleasedReturnValue();
    continuationRequestIdentifier = v5->_continuationRequestIdentifier;
    v5->_continuationRequestIdentifier = (NSString *)v51;

    v5->_requestOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_requestOptions"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sessionID"));
    v53 = objc_claimAutoreleasedReturnValue();
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v53;

    v5->_shouldUseProxiedClientBundleIDForSRP = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldUseProxiedClientBundleIDForSRP"));
    v5->_isItunesLogin = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isItunesLogin"));

  }
  return v5;
}

- (AKCredentialRequestContext)init
{
  AKCredentialRequestContext *v2;
  uint64_t v3;
  NSUUID *requestIdentifier;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKCredentialRequestContext;
  v2 = -[AKCredentialRequestContext init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v2->_requestIdentifier;
    v2->_requestIdentifier = (NSUUID *)v3;

    +[AKDevice currentDevice](AKDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_passcodeProtected = objc_msgSend(v5, "isProtectedWithPasscode");

  }
  return v2;
}

- (AKCredentialRequestContext)initWithUpgradeContext:(id)a3
{
  id v5;
  AKCredentialRequestContext *v6;
  AKCredentialRequestContext *v7;
  AKAuthorizationRequest *v8;
  AKAuthorizationRequest *authorizationRequest;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = -[AKCredentialRequestContext init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_upgradeContext, a3);
    v8 = objc_alloc_init(AKAuthorizationRequest);
    authorizationRequest = v7->_authorizationRequest;
    v7->_authorizationRequest = v8;

    objc_msgSend(v5, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationRequest setClientID:](v7->_authorizationRequest, "setClientID:", v10);

    objc_msgSend(v5, "teamID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationRequest setTeamID:](v7->_authorizationRequest, "setTeamID:", v11);

    objc_msgSend(v5, "nonce");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationRequest setNonce:](v7->_authorizationRequest, "setNonce:", v12);

    objc_msgSend(v5, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationRequest setState:](v7->_authorizationRequest, "setState:", v13);

    -[AKAuthorizationRequest setIsEligibleForUpgradeFromPassword:](v7->_authorizationRequest, "setIsEligibleForUpgradeFromPassword:", 1);
  }

  return v7;
}

- (AKCredentialRequestContext)initWithProxiedClientContext:(id)a3
{
  id v4;
  AKCredentialRequestContext *v5;
  void *v6;
  uint64_t v7;
  NSString *proxiedClientTeamID;
  void *v9;
  uint64_t v10;
  NSString *proxiedClientBundleID;
  void *v12;
  uint64_t v13;
  NSString *proxiedClientAppID;
  void *v15;
  uint64_t v16;
  NSString *proxiedClientAppName;
  void *v18;
  uint64_t v19;
  NSArray *proxiedAssociatedDomains;
  void *v21;
  uint64_t v22;
  NSString *proxiedDeviceClass;
  void *v24;
  uint64_t v25;
  NSString *proxiedDeviceName;

  v4 = a3;
  v5 = -[AKCredentialRequestContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "teamID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    proxiedClientTeamID = v5->_proxiedClientTeamID;
    v5->_proxiedClientTeamID = (NSString *)v7;

    objc_msgSend(v4, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    proxiedClientBundleID = v5->_proxiedClientBundleID;
    v5->_proxiedClientBundleID = (NSString *)v10;

    objc_msgSend(v4, "appID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    proxiedClientAppID = v5->_proxiedClientAppID;
    v5->_proxiedClientAppID = (NSString *)v13;

    objc_msgSend(v4, "appName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    proxiedClientAppName = v5->_proxiedClientAppName;
    v5->_proxiedClientAppName = (NSString *)v16;

    objc_msgSend(v4, "associatedDomains");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    proxiedAssociatedDomains = v5->_proxiedAssociatedDomains;
    v5->_proxiedAssociatedDomains = (NSArray *)v19;

    objc_msgSend(v4, "deviceClass");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    proxiedDeviceClass = v5->_proxiedDeviceClass;
    v5->_proxiedDeviceClass = (NSString *)v22;

    objc_msgSend(v4, "deviceName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    proxiedDeviceName = v5->_proxiedDeviceName;
    v5->_proxiedDeviceName = (NSString *)v25;

    v5->_isRapportLogin = objc_msgSend(v4, "isRapportLogin");
    v5->_shouldSkipAuthorizationUI = objc_msgSend(v4, "shouldSkipAuthorizationUI");
  }

  return v5;
}

- (void)setCredentialRequests:(id)a3
{
  id v4;
  AKPasswordRequest *v5;
  AKPasswordRequest *passwordRequest;
  AKAuthorizationRequest *v7;
  AKAuthorizationRequest *authorizationRequest;

  v4 = a3;
  objc_msgSend(v4, "aaf_firstObjectPassingTest:", &__block_literal_global_13);
  v5 = (AKPasswordRequest *)objc_claimAutoreleasedReturnValue();
  passwordRequest = self->_passwordRequest;
  self->_passwordRequest = v5;

  objc_msgSend(v4, "aaf_firstObjectPassingTest:", &__block_literal_global_96);
  v7 = (AKAuthorizationRequest *)objc_claimAutoreleasedReturnValue();

  authorizationRequest = self->_authorizationRequest;
  self->_authorizationRequest = v7;

}

uint64_t __52__AKCredentialRequestContext_setCredentialRequests___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __52__AKCredentialRequestContext_setCredentialRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_isEligibleForUpgradeFromPassword
{
  return self->_upgradeContext
      || -[AKAuthorizationRequest isEligibleForUpgradeFromPassword](self->_authorizationRequest, "isEligibleForUpgradeFromPassword");
}

- (BOOL)_isSubscriptionLogin
{
  return self->_clientShouldAuthenticateExternally || self->_shouldUseProxiedClientBundleIDForSRP;
}

- (NSString)_proxiedClientAppName
{
  AKAuthorizationUpgradeContext *upgradeContext;
  NSString *v4;

  upgradeContext = self->_upgradeContext;
  if (upgradeContext)
  {
    -[AKAuthorizationUpgradeContext appName](upgradeContext, "appName");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_proxiedClientAppName;
  }
  return v4;
}

- (NSString)_proxiedClientBundleID
{
  AKAuthorizationUpgradeContext *upgradeContext;
  NSString *v4;

  upgradeContext = self->_upgradeContext;
  if (upgradeContext)
  {
    -[AKAuthorizationUpgradeContext bundleID](upgradeContext, "bundleID");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_proxiedClientBundleID;
  }
  return v4;
}

- (NSString)_proxiedClientServiceID
{
  AKAuthorizationUpgradeContext *upgradeContext;
  NSString *v4;

  upgradeContext = self->_upgradeContext;
  if (upgradeContext)
  {
    -[AKAuthorizationUpgradeContext serviceID](upgradeContext, "serviceID");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_proxiedClientServiceID;
  }
  return v4;
}

- (NSString)_proxiedClientTeamID
{
  AKAuthorizationUpgradeContext *upgradeContext;
  NSString *v4;

  upgradeContext = self->_upgradeContext;
  if (upgradeContext)
  {
    -[AKAuthorizationUpgradeContext teamID](upgradeContext, "teamID");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_proxiedClientTeamID;
  }
  return v4;
}

- (NSString)_proxiedClientAppID
{
  AKAuthorizationUpgradeContext *upgradeContext;
  NSString *v4;

  upgradeContext = self->_upgradeContext;
  if (upgradeContext)
  {
    -[AKAuthorizationUpgradeContext appID](upgradeContext, "appID");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_proxiedClientAppID;
  }
  return v4;
}

- (NSArray)credentialRequests
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_passwordRequest)
    objc_msgSend(v3, "addObject:");
  if (self->_authorizationRequest)
    objc_msgSend(v4, "addObject:");
  return (NSArray *)v4;
}

- (BOOL)_requirePassword
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  const __CFString *v10;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[AKCredentialRequestContext authorizationRequest](self, "authorizationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AKCredentialRequestContext authorizationRequest](self, "authorizationRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "authkitAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "continuationTokenForAccount:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 == 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  _AKLogSiwa();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_passcodeProtected)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEFAULT, "Passcode protected: %@", (uint8_t *)&v12, 0xCu);
  }

  if (self->_requirePassword)
    return 1;
  if (self->_passcodeProtected)
    return v8;
  return 1;
}

- (void)set_requirePassword:(BOOL)a3
{
  self->_requirePassword = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AKCredentialRequestContext *v4;
  uint64_t v5;
  NSUUID *requestIdentifier;
  uint64_t v7;
  NSString *iconName;
  uint64_t v9;
  NSData *iconData;
  uint64_t v11;
  NSNumber *iconScale;
  uint64_t v13;
  NSValue *iconSize;
  uint64_t v15;
  NSString *proxiedClientAppName;
  uint64_t v17;
  NSString *proxiedClientBundleID;
  uint64_t v19;
  NSString *proxiedClientTeamID;
  uint64_t v21;
  NSString *proxiedClientAppID;
  uint64_t v23;
  NSArray *proxiedAssociatedDomains;
  uint64_t v25;
  NSString *proxiedDeviceName;
  uint64_t v27;
  NSString *proxiedDeviceClass;
  uint64_t v29;
  AKAuthorizationRequest *authorizationRequest;
  uint64_t v31;
  AKPasswordRequest *passwordRequest;
  uint64_t v33;
  NSString *callerBundleID;
  uint64_t v35;
  NSString *callerSceneID;
  void *v37;
  uint64_t v38;
  NSString *proxiedClientServiceID;
  uint64_t v40;
  AKAuthorizationUpgradeContext *upgradeContext;
  uint64_t v42;
  NSString *externalAuthToken;
  uint64_t v44;
  NSData *externalLocalAuthData;
  uint64_t v46;
  NSString *continuationRequestIdentifier;
  uint64_t v48;
  NSString *sessionID;

  v4 = objc_alloc_init(AKCredentialRequestContext);
  v5 = -[NSUUID copy](self->_requestIdentifier, "copy");
  requestIdentifier = v4->_requestIdentifier;
  v4->_requestIdentifier = (NSUUID *)v5;

  v4->_shouldForceUI = self->_shouldForceUI;
  v4->_shouldSkipBiometrics = self->_shouldSkipBiometrics;
  v4->_shouldSkipAuthorizationUI = self->_shouldSkipAuthorizationUI;
  v7 = -[NSString copy](self->_iconName, "copy");
  iconName = v4->_iconName;
  v4->_iconName = (NSString *)v7;

  v9 = -[NSData copy](self->_iconData, "copy");
  iconData = v4->_iconData;
  v4->_iconData = (NSData *)v9;

  v11 = -[NSNumber copy](self->_iconScale, "copy");
  iconScale = v4->_iconScale;
  v4->_iconScale = (NSNumber *)v11;

  v13 = -[NSValue copy](self->_iconSize, "copy");
  iconSize = v4->_iconSize;
  v4->_iconSize = (NSValue *)v13;

  v4->_shouldForcePrivateEmail = self->_shouldForcePrivateEmail;
  v15 = -[NSString copy](self->_proxiedClientAppName, "copy");
  proxiedClientAppName = v4->_proxiedClientAppName;
  v4->_proxiedClientAppName = (NSString *)v15;

  v17 = -[NSString copy](self->_proxiedClientBundleID, "copy");
  proxiedClientBundleID = v4->_proxiedClientBundleID;
  v4->_proxiedClientBundleID = (NSString *)v17;

  v19 = -[NSString copy](self->_proxiedClientTeamID, "copy");
  proxiedClientTeamID = v4->_proxiedClientTeamID;
  v4->_proxiedClientTeamID = (NSString *)v19;

  v21 = -[NSString copy](self->_proxiedClientAppID, "copy");
  proxiedClientAppID = v4->_proxiedClientAppID;
  v4->_proxiedClientAppID = (NSString *)v21;

  v23 = -[NSArray copy](self->_proxiedAssociatedDomains, "copy");
  proxiedAssociatedDomains = v4->_proxiedAssociatedDomains;
  v4->_proxiedAssociatedDomains = (NSArray *)v23;

  v25 = -[NSString copy](self->_proxiedDeviceName, "copy");
  proxiedDeviceName = v4->_proxiedDeviceName;
  v4->_proxiedDeviceName = (NSString *)v25;

  v27 = -[NSString copy](self->_proxiedDeviceClass, "copy");
  proxiedDeviceClass = v4->_proxiedDeviceClass;
  v4->_proxiedDeviceClass = (NSString *)v27;

  v29 = -[AKAuthorizationRequest copy](self->_authorizationRequest, "copy");
  authorizationRequest = v4->_authorizationRequest;
  v4->_authorizationRequest = (AKAuthorizationRequest *)v29;

  v31 = -[AKPasswordRequest copy](self->_passwordRequest, "copy");
  passwordRequest = v4->_passwordRequest;
  v4->_passwordRequest = (AKPasswordRequest *)v31;

  v4->_isWebLogin = self->_isWebLogin;
  v4->_isFirstPartyLogin = self->_isFirstPartyLogin;
  v4->_isRapportLogin = self->_isRapportLogin;
  v4->_isEligibleForUpgradeFromPassword = self->_isEligibleForUpgradeFromPassword;
  v33 = -[NSString copy](self->_callerBundleID, "copy");
  callerBundleID = v4->_callerBundleID;
  v4->_callerBundleID = (NSString *)v33;

  v35 = -[NSString copy](self->_callerSceneID, "copy");
  callerSceneID = v4->_callerSceneID;
  v4->_callerSceneID = (NSString *)v35;

  v4->_requirePassword = self->_requirePassword;
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_passcodeProtected = objc_msgSend(v37, "isProtectedWithPasscode");

  v38 = -[NSString copy](self->_proxiedClientServiceID, "copy");
  proxiedClientServiceID = v4->_proxiedClientServiceID;
  v4->_proxiedClientServiceID = (NSString *)v38;

  v40 = -[AKAuthorizationUpgradeContext copy](self->_upgradeContext, "copy");
  upgradeContext = v4->_upgradeContext;
  v4->_upgradeContext = (AKAuthorizationUpgradeContext *)v40;

  v4->_clientShouldAuthenticateExternally = self->_clientShouldAuthenticateExternally;
  v4->_authSessionTimeoutInterval = self->_authSessionTimeoutInterval;
  v42 = -[NSString copy](self->_externalAuthToken, "copy");
  externalAuthToken = v4->_externalAuthToken;
  v4->_externalAuthToken = (NSString *)v42;

  v44 = -[NSData copy](self->_externalLocalAuthData, "copy");
  externalLocalAuthData = v4->_externalLocalAuthData;
  v4->_externalLocalAuthData = (NSData *)v44;

  v46 = -[NSString copy](self->_continuationRequestIdentifier, "copy");
  continuationRequestIdentifier = v4->_continuationRequestIdentifier;
  v4->_continuationRequestIdentifier = (NSString *)v46;

  v4->_requestOptions = self->_requestOptions;
  v48 = -[NSString copy](self->_sessionID, "copy");
  sessionID = v4->_sessionID;
  v4->_sessionID = (NSString *)v48;

  v4->_shouldUseProxiedClientBundleIDForSRP = self->_shouldUseProxiedClientBundleIDForSRP;
  v4->_isItunesLogin = self->_isItunesLogin;
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> \nAuthorization Request %@ \nPassword Request: %@ \nProxied App Name: %@\nProxied BundleID: %@\nProxied Team: %@ \nSession ID: %@"), v5, self, self->_authorizationRequest, self->_passwordRequest, self->_proxiedClientAppName, self->_proxiedClientBundleID, self->_proxiedClientTeamID, self->_sessionID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)_sessionID
{
  return self->_sessionID;
}

- (void)set_sessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)_shouldForceUI
{
  return self->_shouldForceUI;
}

- (void)set_shouldForceUI:(BOOL)a3
{
  self->_shouldForceUI = a3;
}

- (BOOL)_shouldSkipBiometrics
{
  return self->_shouldSkipBiometrics;
}

- (void)set_shouldSkipBiometrics:(BOOL)a3
{
  self->_shouldSkipBiometrics = a3;
}

- (BOOL)_shouldSkipAuthorizationUI
{
  return self->_shouldSkipAuthorizationUI;
}

- (void)set_shouldSkipAuthorizationUI:(BOOL)a3
{
  self->_shouldSkipAuthorizationUI = a3;
}

- (NSString)_informativeText
{
  return self->_informativeText;
}

- (void)set_informativeText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)_iconName
{
  return self->_iconName;
}

- (void)set_iconName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)_iconData
{
  return self->_iconData;
}

- (void)set_iconData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)_iconScale
{
  return self->_iconScale;
}

- (void)set_iconScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSValue)_iconSize
{
  return self->_iconSize;
}

- (void)set_iconSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)_shouldForcePrivateEmail
{
  return self->_shouldForcePrivateEmail;
}

- (void)set_shouldForcePrivateEmail:(BOOL)a3
{
  self->_shouldForcePrivateEmail = a3;
}

- (void)set_proxiedClientAppName:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedClientAppName, a3);
}

- (void)set_proxiedClientBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedClientBundleID, a3);
}

- (void)set_proxiedClientAppID:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedClientAppID, a3);
}

- (void)set_proxiedClientTeamID:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedClientTeamID, a3);
}

- (NSArray)_proxiedAssociatedDomains
{
  return self->_proxiedAssociatedDomains;
}

- (void)set_proxiedAssociatedDomains:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedAssociatedDomains, a3);
}

- (BOOL)_isWebLogin
{
  return self->_isWebLogin;
}

- (void)set_isWebLogin:(BOOL)a3
{
  self->_isWebLogin = a3;
}

- (BOOL)_isFirstPartyLogin
{
  return self->_isFirstPartyLogin;
}

- (void)set_isFirstPartyLogin:(BOOL)a3
{
  self->_isFirstPartyLogin = a3;
}

- (BOOL)_isRapportLogin
{
  return self->_isRapportLogin;
}

- (void)set_isRapportLogin:(BOOL)a3
{
  self->_isRapportLogin = a3;
}

- (NSString)_callerBundleID
{
  return self->_callerBundleID;
}

- (void)set_callerBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_callerBundleID, a3);
}

- (NSString)_callerSceneID
{
  return self->_callerSceneID;
}

- (void)set_callerSceneID:(id)a3
{
  objc_storeStrong((id *)&self->_callerSceneID, a3);
}

- (NSString)_proxiedDeviceName
{
  return self->_proxiedDeviceName;
}

- (void)set_proxiedDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedDeviceName, a3);
}

- (NSString)_proxiedDeviceClass
{
  return self->_proxiedDeviceClass;
}

- (void)set_proxiedDeviceClass:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedDeviceClass, a3);
}

- (void)set_proxiedClientServiceID:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedClientServiceID, a3);
}

- (AKAuthorizationUpgradeContext)_upgradeContext
{
  return self->_upgradeContext;
}

- (BOOL)_clientShouldAuthenticateExternally
{
  return self->_clientShouldAuthenticateExternally;
}

- (void)set_clientShouldAuthenticateExternally:(BOOL)a3
{
  self->_clientShouldAuthenticateExternally = a3;
}

- (double)_authSessionTimeoutInterval
{
  return self->_authSessionTimeoutInterval;
}

- (void)set_authSessionTimeoutInterval:(double)a3
{
  self->_authSessionTimeoutInterval = a3;
}

- (NSString)_externalAuthToken
{
  return self->_externalAuthToken;
}

- (void)set_externalAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSData)_externalLocalAuthData
{
  return self->_externalLocalAuthData;
}

- (void)set_externalLocalAuthData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)_continuationRequestIdentifier
{
  return self->_continuationRequestIdentifier;
}

- (void)set_continuationRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BOOL)_shouldUseProxiedClientBundleIDForSRP
{
  return self->_shouldUseProxiedClientBundleIDForSRP;
}

- (void)set_shouldUseProxiedClientBundleIDForSRP:(BOOL)a3
{
  self->_shouldUseProxiedClientBundleIDForSRP = a3;
}

- (BOOL)_isItunesLogin
{
  return self->_isItunesLogin;
}

- (void)set_isItunesLogin:(BOOL)a3
{
  self->_isItunesLogin = a3;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (unint64_t)requestOptions
{
  return self->_requestOptions;
}

- (void)setRequestOptions:(unint64_t)a3
{
  self->_requestOptions = a3;
}

- (AKAuthorizationRequest)authorizationRequest
{
  return self->_authorizationRequest;
}

- (void)setAuthorizationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationRequest, a3);
}

- (AKPasswordRequest)passwordRequest
{
  return self->_passwordRequest;
}

- (void)setPasswordRequest:(id)a3
{
  objc_storeStrong((id *)&self->_passwordRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordRequest, 0);
  objc_storeStrong((id *)&self->_authorizationRequest, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_continuationRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_externalLocalAuthData, 0);
  objc_storeStrong((id *)&self->_externalAuthToken, 0);
  objc_storeStrong((id *)&self->_upgradeContext, 0);
  objc_storeStrong((id *)&self->_proxiedClientServiceID, 0);
  objc_storeStrong((id *)&self->_proxiedDeviceClass, 0);
  objc_storeStrong((id *)&self->_proxiedDeviceName, 0);
  objc_storeStrong((id *)&self->_callerSceneID, 0);
  objc_storeStrong((id *)&self->_callerBundleID, 0);
  objc_storeStrong((id *)&self->_proxiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_proxiedClientTeamID, 0);
  objc_storeStrong((id *)&self->_proxiedClientAppID, 0);
  objc_storeStrong((id *)&self->_proxiedClientBundleID, 0);
  objc_storeStrong((id *)&self->_proxiedClientAppName, 0);
  objc_storeStrong((id *)&self->_iconSize, 0);
  objc_storeStrong((id *)&self->_iconScale, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
