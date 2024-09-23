@implementation ASCCredentialRequestContext

- (ASCCredentialRequestContext)initWithRequestTypes:(unint64_t)a3
{
  ASCCredentialRequestContext *v4;
  ASCCredentialRequestContext *v5;
  ASCCredentialRequestContext *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCCredentialRequestContext;
  v4 = -[ASCCredentialRequestContext init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_requestTypes = a3;
    v4->_isClientLinkedOnOrAfterIOS15Aligned = dyld_program_sdk_at_least();
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t requestTypes;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  requestTypes = self->_requestTypes;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", requestTypes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("requestTypes"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_proxiedAppName, CFSTR("appName"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_proxiedAppIdentifier, CFSTR("appIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_proxiedBundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_proxiedTeamIdentifier, CFSTR("teamIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_proxiedAssociatedDomains, CFSTR("associatedDomains"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_proxiedIconData, CFSTR("iconData"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_proxiedIconScale, CFSTR("iconScale"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_proxiedOriginDeviceName, CFSTR("proxiedOriginDeviceName"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_proxySheetHeaderOverride, CFSTR("proxySheetHeaderOverride"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_proxySheetTitleOverride, CFSTR("proxySheetTitleOverride"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_proxySheetSubtitleOverride, CFSTR("proxySheetSubtitleOverride"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_proxySheetNoCredentialsErrorTitleOverride, CFSTR("proxySheetNoCredentialsErrorTitleOverride"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_proxySheetNoCredentialsErrorMessageOverride, CFSTR("proxySheetNoCredentialsErrorMessageOverride"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_requestStyle, CFSTR("requestStyle"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_globalFrameID, CFSTR("webGlobalFrameID"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_requestOptions, CFSTR("requestOptions"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_authenticatedContext, CFSTR("authenticatedContext"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_useAlternativeSecurityKeysIcon, CFSTR("useAlternativeSecurityKeysIcon"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_appleIDAuthorizationRequest, CFSTR("appleIDAuthorizationRequest"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_isClientLinkedOnOrAfterIOS15Aligned, CFSTR("linkedOnOrAfterIOS15Aligned"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_relyingPartyIdentifier, CFSTR("relyingPartyIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_platformKeyCredentialCreationOptions, CFSTR("platformCredentialCreationOptions"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_platformKeyCredentialAssertionOptions, CFSTR("platformCredentialAssertionOptions"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_securityKeyCredentialCreationOptions, CFSTR("securityKeyCredentialCreationOptions"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_securityKeyCredentialAssertionOptions, CFSTR("securityKeyCredentialAssertionOptions"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_savedAccountContext, CFSTR("savedAccountContext"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_isConditionalRegistrationRequest, CFSTR("isConditionalRegistrationRequest"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_windowSceneIdentifier, CFSTR("windowSceneIdentifier"));

}

- (ASCCredentialRequestContext)initWithCoder:(id)a3
{
  id v4;
  ASCCredentialRequestContext *v5;
  void *v6;
  uint64_t v7;
  NSString *proxiedAppName;
  uint64_t v9;
  NSString *proxiedAppIdentifier;
  uint64_t v11;
  NSString *proxiedBundleIdentifier;
  uint64_t v13;
  NSString *proxiedTeamIdentifier;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *proxiedAssociatedDomains;
  uint64_t v20;
  NSData *proxiedIconData;
  uint64_t v22;
  NSNumber *proxiedIconScale;
  uint64_t v24;
  NSString *proxiedOriginDeviceName;
  uint64_t v26;
  NSString *proxySheetHeaderOverride;
  uint64_t v28;
  NSString *proxySheetTitleOverride;
  uint64_t v30;
  NSString *proxySheetSubtitleOverride;
  uint64_t v32;
  NSString *proxySheetNoCredentialsErrorTitleOverride;
  uint64_t v34;
  NSString *proxySheetNoCredentialsErrorMessageOverride;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  ASGlobalFrameIdentifier *globalFrameID;
  uint64_t v40;
  LAContext *authenticatedContext;
  uint64_t v42;
  AKAuthorizationRequest *appleIDAuthorizationRequest;
  uint64_t v44;
  NSString *relyingPartyIdentifier;
  uint64_t v46;
  ASCPublicKeyCredentialCreationOptions *platformKeyCredentialCreationOptions;
  uint64_t v48;
  ASCPublicKeyCredentialAssertionOptions *platformKeyCredentialAssertionOptions;
  uint64_t v50;
  ASCPublicKeyCredentialCreationOptions *securityKeyCredentialCreationOptions;
  uint64_t v52;
  ASCPublicKeyCredentialAssertionOptions *securityKeyCredentialAssertionOptions;
  uint64_t v54;
  NSString *windowSceneIdentifier;
  uint64_t v56;
  WBSSavedAccountContext *savedAccountContext;
  ASCCredentialRequestContext *v58;
  objc_super v60;

  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)ASCCredentialRequestContext;
  v5 = -[ASCCredentialRequestContext init](&v60, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestTypes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requestTypes = objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appName"));
    v7 = objc_claimAutoreleasedReturnValue();
    proxiedAppName = v5->_proxiedAppName;
    v5->_proxiedAppName = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    proxiedAppIdentifier = v5->_proxiedAppIdentifier;
    v5->_proxiedAppIdentifier = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    proxiedBundleIdentifier = v5->_proxiedBundleIdentifier;
    v5->_proxiedBundleIdentifier = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("teamIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    proxiedTeamIdentifier = v5->_proxiedTeamIdentifier;
    v5->_proxiedTeamIdentifier = (NSString *)v13;

    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("associatedDomains"));
    v18 = objc_claimAutoreleasedReturnValue();
    proxiedAssociatedDomains = v5->_proxiedAssociatedDomains;
    v5->_proxiedAssociatedDomains = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconData"));
    v20 = objc_claimAutoreleasedReturnValue();
    proxiedIconData = v5->_proxiedIconData;
    v5->_proxiedIconData = (NSData *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconScale"));
    v22 = objc_claimAutoreleasedReturnValue();
    proxiedIconScale = v5->_proxiedIconScale;
    v5->_proxiedIconScale = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxiedOriginDeviceName"));
    v24 = objc_claimAutoreleasedReturnValue();
    proxiedOriginDeviceName = v5->_proxiedOriginDeviceName;
    v5->_proxiedOriginDeviceName = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxySheetHeaderOverride"));
    v26 = objc_claimAutoreleasedReturnValue();
    proxySheetHeaderOverride = v5->_proxySheetHeaderOverride;
    v5->_proxySheetHeaderOverride = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxySheetTitleOverride"));
    v28 = objc_claimAutoreleasedReturnValue();
    proxySheetTitleOverride = v5->_proxySheetTitleOverride;
    v5->_proxySheetTitleOverride = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxySheetSubtitleOverride"));
    v30 = objc_claimAutoreleasedReturnValue();
    proxySheetSubtitleOverride = v5->_proxySheetSubtitleOverride;
    v5->_proxySheetSubtitleOverride = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxySheetNoCredentialsErrorTitleOverride"));
    v32 = objc_claimAutoreleasedReturnValue();
    proxySheetNoCredentialsErrorTitleOverride = v5->_proxySheetNoCredentialsErrorTitleOverride;
    v5->_proxySheetNoCredentialsErrorTitleOverride = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxySheetNoCredentialsErrorMessageOverride"));
    v34 = objc_claimAutoreleasedReturnValue();
    proxySheetNoCredentialsErrorMessageOverride = v5->_proxySheetNoCredentialsErrorMessageOverride;
    v5->_proxySheetNoCredentialsErrorMessageOverride = (NSString *)v34;

    v36 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestStyle"));
    if (v36 >= 3)
      v37 = 0;
    else
      v37 = v36;
    v5->_requestStyle = v37;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webGlobalFrameID"));
    v38 = objc_claimAutoreleasedReturnValue();
    globalFrameID = v5->_globalFrameID;
    v5->_globalFrameID = (ASGlobalFrameIdentifier *)v38;

    v5->_requestOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestOptions"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticatedContext"));
    v40 = objc_claimAutoreleasedReturnValue();
    authenticatedContext = v5->_authenticatedContext;
    v5->_authenticatedContext = (LAContext *)v40;

    v5->_useAlternativeSecurityKeysIcon = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useAlternativeSecurityKeysIcon"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleIDAuthorizationRequest"));
    v42 = objc_claimAutoreleasedReturnValue();
    appleIDAuthorizationRequest = v5->_appleIDAuthorizationRequest;
    v5->_appleIDAuthorizationRequest = (AKAuthorizationRequest *)v42;

    v5->_isClientLinkedOnOrAfterIOS15Aligned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("linkedOnOrAfterIOS15Aligned"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingPartyIdentifier"));
    v44 = objc_claimAutoreleasedReturnValue();
    relyingPartyIdentifier = v5->_relyingPartyIdentifier;
    v5->_relyingPartyIdentifier = (NSString *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformCredentialCreationOptions"));
    v46 = objc_claimAutoreleasedReturnValue();
    platformKeyCredentialCreationOptions = v5->_platformKeyCredentialCreationOptions;
    v5->_platformKeyCredentialCreationOptions = (ASCPublicKeyCredentialCreationOptions *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformCredentialAssertionOptions"));
    v48 = objc_claimAutoreleasedReturnValue();
    platformKeyCredentialAssertionOptions = v5->_platformKeyCredentialAssertionOptions;
    v5->_platformKeyCredentialAssertionOptions = (ASCPublicKeyCredentialAssertionOptions *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("securityKeyCredentialCreationOptions"));
    v50 = objc_claimAutoreleasedReturnValue();
    securityKeyCredentialCreationOptions = v5->_securityKeyCredentialCreationOptions;
    v5->_securityKeyCredentialCreationOptions = (ASCPublicKeyCredentialCreationOptions *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("securityKeyCredentialAssertionOptions"));
    v52 = objc_claimAutoreleasedReturnValue();
    securityKeyCredentialAssertionOptions = v5->_securityKeyCredentialAssertionOptions;
    v5->_securityKeyCredentialAssertionOptions = (ASCPublicKeyCredentialAssertionOptions *)v52;

    v5->_isConditionalRegistrationRequest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isConditionalRegistrationRequest"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("windowSceneIdentifier"));
    v54 = objc_claimAutoreleasedReturnValue();
    windowSceneIdentifier = v5->_windowSceneIdentifier;
    v5->_windowSceneIdentifier = (NSString *)v54;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("savedAccountContext"));
    v56 = objc_claimAutoreleasedReturnValue();
    savedAccountContext = v5->_savedAccountContext;
    v5->_savedAccountContext = (WBSSavedAccountContext *)v56;

    v58 = v5;
  }

  return v5;
}

- (BOOL)isProxiedRequest
{
  return self->_proxiedAppName
      || self->_proxiedAppIdentifier
      || self->_proxiedBundleIdentifier
      || self->_proxiedTeamIdentifier
      || self->_proxiedAssociatedDomains
      || self->_proxiedIconData
      || self->_proxiedIconScale
      || self->_proxiedOriginDeviceName
      || self->_proxySheetHeaderOverride
      || self->_proxySheetTitleOverride
      || self->_proxySheetSubtitleOverride
      || self->_proxySheetNoCredentialsErrorTitleOverride
      || self->_proxySheetNoCredentialsErrorMessageOverride != 0;
}

- (BOOL)isRegistrationRequest
{
  return (self->_requestTypes & 0x14) != 0;
}

- (BOOL)isUsingWebBrowserOnlyOptions
{
  ASCPublicKeyCredentialAssertionOptions *v3;
  uint64_t v4;
  ASCPublicKeyCredentialCreationOptions *v5;
  BOOL v6;
  void *v8;
  uint64_t v9;
  ASCPublicKeyCredentialAssertionOptions *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ASCPublicKeyCredentialCreationOptions *v17;

  v3 = self->_platformKeyCredentialAssertionOptions;
  -[ASCPublicKeyCredentialAssertionOptions clientDataHash](v3, "clientDataHash");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[ASCPublicKeyCredentialAssertionOptions clientDataJSON](v3, "clientDataJSON");
    v5 = (ASCPublicKeyCredentialCreationOptions *)objc_claimAutoreleasedReturnValue();
    if (v5 || -[ASCPublicKeyCredentialAssertionOptions shouldHideHybrid](v3, "shouldHideHybrid"))
      goto LABEL_5;
    -[ASCPublicKeyCredentialAssertionOptions appIDForSecurityKeys](v3, "appIDForSecurityKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v6 = 1;
      goto LABEL_7;
    }
    v5 = self->_platformKeyCredentialCreationOptions;
    -[ASCPublicKeyCredentialCreationOptions clientDataHash](v5, "clientDataHash");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9
      || (-[ASCPublicKeyCredentialCreationOptions clientDataJSON](v5, "clientDataJSON"),
          (v9 = objc_claimAutoreleasedReturnValue()) != 0)
      || (-[ASCPublicKeyCredentialCreationOptions excludedCredentials](v5, "excludedCredentials"),
          (v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = (ASCPublicKeyCredentialAssertionOptions *)v9;
LABEL_14:
      v6 = 1;
LABEL_15:

      goto LABEL_6;
    }
    if (-[ASCPublicKeyCredentialCreationOptions shouldHideHybrid](v5, "shouldHideHybrid"))
      goto LABEL_5;
    v10 = self->_securityKeyCredentialAssertionOptions;
    -[ASCPublicKeyCredentialAssertionOptions clientDataHash](v10, "clientDataHash");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      || (-[ASCPublicKeyCredentialAssertionOptions clientDataJSON](v10, "clientDataJSON"),
          (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v6 = 1;
LABEL_20:

      goto LABEL_15;
    }
    -[ASCPublicKeyCredentialAssertionOptions appIDForSecurityKeys](v10, "appIDForSecurityKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_14;
    v17 = self->_securityKeyCredentialCreationOptions;
    -[ASCPublicKeyCredentialCreationOptions clientDataHash](v17, "clientDataHash");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_23;
    -[ASCPublicKeyCredentialCreationOptions clientDataJSON](v17, "clientDataJSON");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_25;
    -[ASCPublicKeyCredentialAssertionOptions origin](v3, "origin");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_23;
    -[ASCPublicKeyCredentialAssertionOptions origin](v10, "origin");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      goto LABEL_25;
    -[ASCPublicKeyCredentialCreationOptions origin](v5, "origin");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
LABEL_23:

    }
    else
    {
      -[ASCPublicKeyCredentialCreationOptions origin](v17, "origin");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v6 = self->_authenticatedContext != 0;
        goto LABEL_26;
      }
    }
LABEL_25:
    v6 = 1;
LABEL_26:
    v11 = v17;
    goto LABEL_20;
  }
  v5 = (ASCPublicKeyCredentialCreationOptions *)v4;
LABEL_5:
  v6 = 1;
LABEL_6:

LABEL_7:
  return v6;
}

- (void)setProxiedOriginDeviceName:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
    v4 = v5;
  else
    v4 = 0;
  objc_storeStrong((id *)&self->_proxiedOriginDeviceName, v4);

}

- (void)removePasskeyRequests
{
  self->_requestTypes &= 0xFFFFFFFFFFFFFFF3;
}

- (void)removeSecurityKeyRequests
{
  self->_requestTypes &= 0xFFFFFFFFFFFFFFCFLL;
}

- (void)sanitizeRequestTypesForAutoFillRequestIfNecessary
{
  if (self->_requestStyle == 1)
    self->_requestTypes &= 8uLL;
}

- (void)applyMagicCredentialIDIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint8_t v10[16];

  if ((self->_requestTypes & 8) != 0)
  {
    -[ASCPublicKeyCredentialAssertionOptions allowedCredentials](self->_platformKeyCredentialAssertionOptions, "allowedCredentials");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        objc_msgSend(v4, "credentialID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        +[ASCPublicKeyCredentialDescriptor magicCredentialID](ASCPublicKeyCredentialDescriptor, "magicCredentialID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v6, "isEqualToData:", v7);

        if (v8)
        {
          v9 = WBS_LOG_CHANNEL_PREFIXAuthorization();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v10 = 0;
            _os_log_impl(&dword_20E648000, v9, OS_LOG_TYPE_INFO, "Updating request.", v10, 2u);
          }
          self->_requestTypes = 8;
          -[ASCPublicKeyCredentialAssertionOptions setAllowedCredentials:](self->_platformKeyCredentialAssertionOptions, "setAllowedCredentials:", 0);
        }
      }

    }
  }
}

- (void)logRequest
{
  unint64_t requestTypes;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  void *platformKeyCredentialCreationOptions;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t requestStyle;
  const __CFString *v16;
  ASGlobalFrameIdentifier *globalFrameID;
  unint64_t requestOptions;
  _BYTE v19[12];
  __int16 v20;
  ASGlobalFrameIdentifier *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  requestTypes = self->_requestTypes;
  if (requestTypes)
  {
    v4 = 1;
    do
    {
LABEL_3:
      while ((requestTypes & v4) == 0)
        v4 *= 2;
    }
    while (!v4);
    switch(v4)
    {
      case 1:
        v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          v6 = v5;
          v7 = "Password request";
          goto LABEL_16;
        }
        goto LABEL_27;
      case 2:
        v10 = WBS_LOG_CHANNEL_PREFIXAuthorization();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          v6 = v10;
          v7 = "Apple ID request";
LABEL_16:
          _os_log_impl(&dword_20E648000, v6, OS_LOG_TYPE_INFO, v7, v19, 2u);
        }
        goto LABEL_27;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_27;
      case 4:
        v11 = WBS_LOG_CHANNEL_PREFIXAuthorization();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_20E648000, v11, OS_LOG_TYPE_INFO, "Platform registration request:", v19, 2u);
        }
        platformKeyCredentialCreationOptions = self->_platformKeyCredentialCreationOptions;
        goto LABEL_26;
      case 8:
        v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_20E648000, v12, OS_LOG_TYPE_INFO, "Platform assertion request:", v19, 2u);
        }
        platformKeyCredentialCreationOptions = self->_platformKeyCredentialAssertionOptions;
        goto LABEL_26;
      default:
        if (v4 == 16)
        {
          v13 = WBS_LOG_CHANNEL_PREFIXAuthorization();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v19 = 0;
            _os_log_impl(&dword_20E648000, v13, OS_LOG_TYPE_INFO, "Security key registration request:", v19, 2u);
          }
          platformKeyCredentialCreationOptions = self->_securityKeyCredentialCreationOptions;
        }
        else
        {
          if (v4 != 32)
            goto LABEL_27;
          v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v19 = 0;
            _os_log_impl(&dword_20E648000, v8, OS_LOG_TYPE_INFO, "Security key assertion request:", v19, 2u);
          }
          platformKeyCredentialCreationOptions = self->_securityKeyCredentialAssertionOptions;
        }
LABEL_26:
        objc_msgSend(platformKeyCredentialCreationOptions, "logRequest", *(_QWORD *)v19);
LABEL_27:
        requestTypes &= ~v4;
        v4 *= 2;
        if (!requestTypes)
          break;
        goto LABEL_3;
    }
  }
  v14 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    requestStyle = self->_requestStyle;
    if (requestStyle > 2)
      v16 = CFSTR("Unknown");
    else
      v16 = off_24C97F860[requestStyle];
    requestOptions = self->_requestOptions;
    globalFrameID = self->_globalFrameID;
    *(_DWORD *)v19 = 138544130;
    *(_QWORD *)&v19[4] = v16;
    v20 = 2114;
    v21 = globalFrameID;
    v22 = 2050;
    v23 = requestOptions;
    v24 = 2114;
    v25 = CFSTR("authenticatedContext");
    _os_log_impl(&dword_20E648000, v14, OS_LOG_TYPE_INFO, "style: %{public}@\nframeID: %{public}@\noptions: %{public}lx\ncontext: %{public}@\n", v19, 0x2Au);
  }
}

- (unint64_t)requestTypes
{
  return self->_requestTypes;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ASCPublicKeyCredentialCreationOptions)platformKeyCredentialCreationOptions
{
  return self->_platformKeyCredentialCreationOptions;
}

- (void)setPlatformKeyCredentialCreationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_platformKeyCredentialCreationOptions, a3);
}

- (ASCPublicKeyCredentialCreationOptions)securityKeyCredentialCreationOptions
{
  return self->_securityKeyCredentialCreationOptions;
}

- (void)setSecurityKeyCredentialCreationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_securityKeyCredentialCreationOptions, a3);
}

- (ASCPublicKeyCredentialAssertionOptions)platformKeyCredentialAssertionOptions
{
  return self->_platformKeyCredentialAssertionOptions;
}

- (void)setPlatformKeyCredentialAssertionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_platformKeyCredentialAssertionOptions, a3);
}

- (ASCPublicKeyCredentialAssertionOptions)securityKeyCredentialAssertionOptions
{
  return self->_securityKeyCredentialAssertionOptions;
}

- (void)setSecurityKeyCredentialAssertionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_securityKeyCredentialAssertionOptions, a3);
}

- (AKAuthorizationRequest)appleIDAuthorizationRequest
{
  return self->_appleIDAuthorizationRequest;
}

- (void)setAppleIDAuthorizationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDAuthorizationRequest, a3);
}

- (BOOL)isConditionalRegistrationRequest
{
  return self->_isConditionalRegistrationRequest;
}

- (void)setIsConditionalRegistrationRequest:(BOOL)a3
{
  self->_isConditionalRegistrationRequest = a3;
}

- (int64_t)requestStyle
{
  return self->_requestStyle;
}

- (void)setRequestStyle:(int64_t)a3
{
  self->_requestStyle = a3;
}

- (unint64_t)requestOptions
{
  return self->_requestOptions;
}

- (void)setRequestOptions:(unint64_t)a3
{
  self->_requestOptions = a3;
}

- (ASGlobalFrameIdentifier)globalFrameID
{
  return self->_globalFrameID;
}

- (void)setGlobalFrameID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (LAContext)authenticatedContext
{
  return self->_authenticatedContext;
}

- (void)setAuthenticatedContext:(id)a3
{
  objc_storeStrong((id *)&self->_authenticatedContext, a3);
}

- (NSString)windowSceneIdentifier
{
  return self->_windowSceneIdentifier;
}

- (void)setWindowSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (WBSSavedAccountContext)savedAccountContext
{
  return self->_savedAccountContext;
}

- (void)setSavedAccountContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)proxiedAppName
{
  return self->_proxiedAppName;
}

- (void)setProxiedAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)proxiedAppIdentifier
{
  return self->_proxiedAppIdentifier;
}

- (void)setProxiedAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)proxiedBundleIdentifier
{
  return self->_proxiedBundleIdentifier;
}

- (void)setProxiedBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)proxiedTeamIdentifier
{
  return self->_proxiedTeamIdentifier;
}

- (void)setProxiedTeamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)proxiedAssociatedDomains
{
  return self->_proxiedAssociatedDomains;
}

- (void)setProxiedAssociatedDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSData)proxiedIconData
{
  return self->_proxiedIconData;
}

- (void)setProxiedIconData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)proxiedIconScale
{
  return self->_proxiedIconScale;
}

- (void)setProxiedIconScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)proxiedOriginDeviceName
{
  return self->_proxiedOriginDeviceName;
}

- (NSString)proxySheetHeaderOverride
{
  return self->_proxySheetHeaderOverride;
}

- (void)setProxySheetHeaderOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)proxySheetTitleOverride
{
  return self->_proxySheetTitleOverride;
}

- (void)setProxySheetTitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)proxySheetSubtitleOverride
{
  return self->_proxySheetSubtitleOverride;
}

- (void)setProxySheetSubtitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)proxySheetNoCredentialsErrorTitleOverride
{
  return self->_proxySheetNoCredentialsErrorTitleOverride;
}

- (void)setProxySheetNoCredentialsErrorTitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)proxySheetNoCredentialsErrorMessageOverride
{
  return self->_proxySheetNoCredentialsErrorMessageOverride;
}

- (void)setProxySheetNoCredentialsErrorMessageOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (BOOL)useAlternativeSecurityKeysIcon
{
  return self->_useAlternativeSecurityKeysIcon;
}

- (void)setUseAlternativeSecurityKeysIcon:(BOOL)a3
{
  self->_useAlternativeSecurityKeysIcon = a3;
}

- (BOOL)isClientLinkedOnOrAfterIOS15Aligned
{
  return self->_isClientLinkedOnOrAfterIOS15Aligned;
}

- (BOOL)isCABLEAuthenticatorRequest
{
  return self->_isCABLEAuthenticatorRequest;
}

- (void)setIsCABLEAuthenticatorRequest:(BOOL)a3
{
  self->_isCABLEAuthenticatorRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxySheetNoCredentialsErrorMessageOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetNoCredentialsErrorTitleOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetSubtitleOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetTitleOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetHeaderOverride, 0);
  objc_storeStrong((id *)&self->_proxiedOriginDeviceName, 0);
  objc_storeStrong((id *)&self->_proxiedIconScale, 0);
  objc_storeStrong((id *)&self->_proxiedIconData, 0);
  objc_storeStrong((id *)&self->_proxiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_proxiedTeamIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedAppIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedAppName, 0);
  objc_storeStrong((id *)&self->_savedAccountContext, 0);
  objc_storeStrong((id *)&self->_windowSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_authenticatedContext, 0);
  objc_storeStrong((id *)&self->_globalFrameID, 0);
  objc_storeStrong((id *)&self->_appleIDAuthorizationRequest, 0);
  objc_storeStrong((id *)&self->_securityKeyCredentialAssertionOptions, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialAssertionOptions, 0);
  objc_storeStrong((id *)&self->_securityKeyCredentialCreationOptions, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialCreationOptions, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

@end
