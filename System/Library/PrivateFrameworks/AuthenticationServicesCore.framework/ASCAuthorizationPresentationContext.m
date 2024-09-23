@implementation ASCAuthorizationPresentationContext

- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4
{
  return -[ASCAuthorizationPresentationContext initWithRequestContext:appIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:](self, "initWithRequestContext:appIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:", a3, a4, 0, 0);
}

- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4 shouldUseRelyingPartyForServiceName:(BOOL)a5
{
  return -[ASCAuthorizationPresentationContext initWithRequestContext:appIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:](self, "initWithRequestContext:appIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:", a3, a4, a5, 0);
}

- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4 shouldUseRelyingPartyForServiceName:(BOOL)a5 auditTokenData:(id)a6
{
  return -[ASCAuthorizationPresentationContext initWithRequestContext:appIdentifier:frameIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:](self, "initWithRequestContext:appIdentifier:frameIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:", a3, a4, 0, a5, a6);
}

- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4 frameIdentifier:(id)a5 shouldUseRelyingPartyForServiceName:(BOOL)a6
{
  return -[ASCAuthorizationPresentationContext initWithRequestContext:appIdentifier:frameIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:](self, "initWithRequestContext:appIdentifier:frameIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:", a3, a4, a5, a6, 0);
}

- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4 frameIdentifier:(id)a5 shouldUseRelyingPartyForServiceName:(BOOL)a6 auditTokenData:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  ASCAuthorizationPresentationContext *v16;
  uint64_t v17;
  NSString *appIdentifier;
  uint64_t v19;
  WBSGlobalFrameIdentifier *frameIdentifier;
  void *v21;
  uint64_t v22;
  NSString *serviceName;
  uint64_t v24;
  NSString *bundleIdentifier;
  uint64_t v26;
  NSString *teamIdentifier;
  NSString *v28;
  void *v29;
  id v30;
  id v31;
  NSString *v32;
  NSString *v33;
  NSObject *v34;
  uint64_t v35;
  NSString *v36;
  uint64_t v37;
  NSString *v38;
  uint64_t v39;
  NSString *v40;
  void *v41;
  uint64_t v42;
  NSString *v43;
  NSMutableArray *v44;
  NSMutableArray *loginChoices;
  uint64_t v46;
  AKAuthorizationRequest *appleIDAuthorizationRequest;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSString *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  NSString *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  NSString *platformUserVerificationPreference;
  uint64_t v68;
  ASCPublicKeyCredentialCreationOptions *passkeyCreationOptionsForExternalProvider;
  uint64_t v70;
  uint64_t v71;
  NSString *destinationSiteForCrossSiteAssertion;
  void *v73;
  uint64_t v74;
  NSString *v75;
  void *v76;
  uint64_t v77;
  NSArray *proxiedAssociatedDomains;
  void *v79;
  uint64_t v80;
  NSData *proxiedIconData;
  void *v82;
  uint64_t v83;
  NSNumber *proxiedIconScale;
  void *v85;
  uint64_t v86;
  NSString *proxiedOriginDeviceName;
  _BOOL4 v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  NSString *overrideHeader;
  uint64_t v99;
  NSString *overrideTitle;
  uint64_t v101;
  NSString *overrideSubtitle;
  uint64_t v103;
  NSString *overrideNoCredentialsErrorTitle;
  uint64_t v105;
  NSString *overrideNoCredentialsErrorMessage;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  NSArray *allowedCredentialsForSecurityKeyAssertion;
  uint64_t v113;
  NSString *windowSceneIdentifier;
  uint64_t v115;
  NSData *auditTokenData;
  ASCAuthorizationPresentationContext *v117;
  id v119;
  void *v120;
  id v121;
  NSString *v122;
  id v123;
  objc_super v124;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v124.receiver = self;
  v124.super_class = (Class)ASCAuthorizationPresentationContext;
  v16 = -[ASCAuthorizationPresentationContext init](&v124, sel_init);
  if (!v16)
    goto LABEL_42;
  v120 = v15;
  v17 = objc_msgSend(v13, "copy");
  appIdentifier = v16->_appIdentifier;
  v16->_appIdentifier = (NSString *)v17;

  v121 = v14;
  v19 = objc_msgSend(v14, "copy");
  frameIdentifier = v16->_frameIdentifier;
  v16->_frameIdentifier = (WBSGlobalFrameIdentifier *)v19;

  objc_msgSend(v12, "proxiedAppName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "copy");
  serviceName = v16->_serviceName;
  v16->_serviceName = (NSString *)v22;

  if (objc_msgSend(v12, "isProxiedRequest"))
  {
    objc_msgSend(v12, "proxiedBundleIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v16->_bundleIdentifier;
    v16->_bundleIdentifier = (NSString *)v24;

    objc_msgSend(v12, "proxiedTeamIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    teamIdentifier = v16->_teamIdentifier;
    v16->_teamIdentifier = (NSString *)v26;
LABEL_16:

    goto LABEL_17;
  }
  if (objc_msgSend(v13, "length"))
  {
    v28 = v16->_appIdentifier;
    v123 = 0;
    objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithApplicationIdentifier:error:", v28, &v123);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    teamIdentifier = (NSString *)v123;
    if (v29)
    {
      v30 = v29;
    }
    else
    {
      v31 = objc_alloc(MEMORY[0x24BDC1528]);
      v32 = v16->_appIdentifier;
      v122 = teamIdentifier;
      v30 = (id)objc_msgSend(v31, "safari_initWithExtensionApplicationIdentifier:error:", v32, &v122);
      v33 = v122;

      teamIdentifier = v33;
    }

    if (teamIdentifier)
    {
      v34 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[ASCAuthorizationPresentationContext initWithRequestContext:appIdentifier:frameIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:].cold.1(v34, teamIdentifier);
    }
    objc_msgSend(v30, "bundleIdentifier");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v16->_bundleIdentifier;
    v16->_bundleIdentifier = (NSString *)v35;

    objc_msgSend(v30, "teamIdentifier");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v16->_teamIdentifier;
    v16->_teamIdentifier = (NSString *)v37;

    if (!v16->_serviceName)
    {
      objc_msgSend(v30, "localizedName");
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = v16->_serviceName;
      v16->_serviceName = (NSString *)v39;

      if (!v16->_serviceName)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v30, "containingBundleRecord");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "localizedName");
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = v16->_serviceName;
          v16->_serviceName = (NSString *)v42;

        }
      }
    }

    goto LABEL_16;
  }
LABEL_17:
  v16->_serviceType = 0;
  v44 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  loginChoices = v16->_loginChoices;
  v16->_loginChoices = v44;

  objc_msgSend(v12, "appleIDAuthorizationRequest");
  v46 = objc_claimAutoreleasedReturnValue();
  appleIDAuthorizationRequest = v16->_appleIDAuthorizationRequest;
  v16->_appleIDAuthorizationRequest = (AKAuthorizationRequest *)v46;

  if (v8)
  {
    objc_msgSend(v12, "platformKeyCredentialAssertionOptions");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "origin");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "length");

    if (v50)
    {
      v51 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v12, "platformKeyCredentialAssertionOptions");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "origin");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "URLWithString:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v54, "host");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "safari_highLevelDomainForPasswordManager");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v56;
      if (v56)
      {
        v58 = v56;
        v59 = v16->_serviceName;
        v16->_serviceName = v58;
      }
      else
      {
        objc_msgSend(v12, "relyingPartyIdentifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v59, "copy");
        v62 = v16->_serviceName;
        v16->_serviceName = (NSString *)v61;

      }
    }
    else
    {
      objc_msgSend(v12, "relyingPartyIdentifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v54, "copy");
      v55 = v16->_serviceName;
      v16->_serviceName = (NSString *)v60;
    }

    v16->_serviceType = 1;
  }
  objc_msgSend(v12, "platformKeyCredentialCreationOptions");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "platformKeyCredentialAssertionOptions");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (v63)
  {
    objc_msgSend(v63, "userVerificationPreference");
    v66 = objc_claimAutoreleasedReturnValue();
    platformUserVerificationPreference = v16->_platformUserVerificationPreference;
    v16->_platformUserVerificationPreference = (NSString *)v66;

    v68 = objc_msgSend(v63, "copy");
    passkeyCreationOptionsForExternalProvider = v16->_passkeyCreationOptionsForExternalProvider;
    v16->_passkeyCreationOptionsForExternalProvider = (ASCPublicKeyCredentialCreationOptions *)v68;
  }
  else
  {
    objc_msgSend(v64, "userVerificationPreference");
    v70 = objc_claimAutoreleasedReturnValue();
    passkeyCreationOptionsForExternalProvider = (ASCPublicKeyCredentialCreationOptions *)v16->_platformUserVerificationPreference;
    v16->_platformUserVerificationPreference = (NSString *)v70;
  }

  objc_storeStrong((id *)&v16->_passkeyAssertionOptionsForExternalProvider, v65);
  objc_msgSend(v65, "destinationSiteForCrossSiteAssertion");
  v71 = objc_claimAutoreleasedReturnValue();
  destinationSiteForCrossSiteAssertion = v16->_destinationSiteForCrossSiteAssertion;
  v16->_destinationSiteForCrossSiteAssertion = (NSString *)v71;

  if (!v16->_destinationSiteForCrossSiteAssertion)
  {
    objc_msgSend(v12, "securityKeyCredentialAssertionOptions");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "destinationSiteForCrossSiteAssertion");
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = v16->_destinationSiteForCrossSiteAssertion;
    v16->_destinationSiteForCrossSiteAssertion = (NSString *)v74;

  }
  v119 = v13;
  v16->_isProxiedRequest = objc_msgSend(v12, "isProxiedRequest");
  objc_msgSend(v12, "proxiedAssociatedDomains");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "copy");
  proxiedAssociatedDomains = v16->_proxiedAssociatedDomains;
  v16->_proxiedAssociatedDomains = (NSArray *)v77;

  objc_msgSend(v12, "proxiedIconData");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "copy");
  proxiedIconData = v16->_proxiedIconData;
  v16->_proxiedIconData = (NSData *)v80;

  objc_msgSend(v12, "proxiedIconScale");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "copy");
  proxiedIconScale = v16->_proxiedIconScale;
  v16->_proxiedIconScale = (NSNumber *)v83;

  objc_msgSend(v12, "proxiedOriginDeviceName");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "copy");
  proxiedOriginDeviceName = v16->_proxiedOriginDeviceName;
  v16->_proxiedOriginDeviceName = (NSString *)v86;

  v16->_isCABLEAuthenticatorRequest = objc_msgSend(v12, "isCABLEAuthenticatorRequest");
  v88 = v8;
  if (objc_msgSend(v12, "requestStyle") == 1)
  {
    objc_msgSend(v12, "securityKeyCredentialAssertionOptions");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_shouldAllowSecurityKeysFromCABLEView = v89 != 0;

  }
  else
  {
    v16->_shouldAllowSecurityKeysFromCABLEView = 0;
  }
  v90 = v12;
  objc_msgSend(v90, "platformKeyCredentialAssertionOptions");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v91;
  if (v91)
  {
    objc_msgSend(v91, "extensions");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v93, "caBLEAuthenticatorMinimumRequirement");
  }
  else
  {
    objc_msgSend(v90, "platformKeyCredentialCreationOptions");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v95;
    if (v95)
    {
      objc_msgSend(v95, "extensions");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v96, "caBLEAuthenticatorMinimumRequirement");

    }
    else
    {
      v94 = 0;
    }
  }

  v16->_cableAuthenticatorRequirement = v94;
  objc_msgSend(v90, "proxySheetHeaderOverride");
  v97 = objc_claimAutoreleasedReturnValue();
  overrideHeader = v16->_overrideHeader;
  v16->_overrideHeader = (NSString *)v97;

  objc_msgSend(v90, "proxySheetTitleOverride");
  v99 = objc_claimAutoreleasedReturnValue();
  overrideTitle = v16->_overrideTitle;
  v16->_overrideTitle = (NSString *)v99;

  objc_msgSend(v90, "proxySheetSubtitleOverride");
  v101 = objc_claimAutoreleasedReturnValue();
  overrideSubtitle = v16->_overrideSubtitle;
  v16->_overrideSubtitle = (NSString *)v101;

  objc_msgSend(v90, "proxySheetNoCredentialsErrorTitleOverride");
  v103 = objc_claimAutoreleasedReturnValue();
  overrideNoCredentialsErrorTitle = v16->_overrideNoCredentialsErrorTitle;
  v16->_overrideNoCredentialsErrorTitle = (NSString *)v103;

  objc_msgSend(v90, "proxySheetNoCredentialsErrorMessageOverride");
  v105 = objc_claimAutoreleasedReturnValue();
  overrideNoCredentialsErrorMessage = v16->_overrideNoCredentialsErrorMessage;
  v16->_overrideNoCredentialsErrorMessage = (NSString *)v105;

  v16->_useAlternativeSecurityKeysIcon = objc_msgSend(v90, "useAlternativeSecurityKeysIcon");
  if (v88)
  {
    +[ASFeatureManager sharedManager](ASFeatureManager, "sharedManager");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "relyingPartyIdentifier");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_shouldUseFallbackPasskeyUI = objc_msgSend(v107, "shouldUseFallbackUIForRelyingParty:", v108);

  }
  else
  {
    v16->_shouldUseFallbackPasskeyUI = 0;
  }
  objc_msgSend(v90, "securityKeyCredentialAssertionOptions");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "allowedCredentials");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "safari_filterObjectsUsingBlock:", &__block_literal_global_319);
  v111 = objc_claimAutoreleasedReturnValue();

  allowedCredentialsForSecurityKeyAssertion = v16->_allowedCredentialsForSecurityKeyAssertion;
  v16->_allowedCredentialsForSecurityKeyAssertion = (NSArray *)v111;

  objc_msgSend(v90, "windowSceneIdentifier");
  v113 = objc_claimAutoreleasedReturnValue();
  windowSceneIdentifier = v16->_windowSceneIdentifier;
  v16->_windowSceneIdentifier = (NSString *)v113;

  v16->_isConditionalRegistrationRequest = objc_msgSend(v90, "isConditionalRegistrationRequest");
  v15 = v120;
  v115 = objc_msgSend(v120, "copy");
  auditTokenData = v16->_auditTokenData;
  v16->_auditTokenData = (NSData *)v115;

  v117 = v16;
  v14 = v121;
  v13 = v119;
LABEL_42:

  return v16;
}

- (id)_initWithCABLEAuthenticatorURL:(id)a3 shouldRequireConsent:(BOOL)a4 passkeyURLType:(int64_t)a5
{
  id v8;
  ASCAuthorizationPresentationContext *v9;
  uint64_t v10;
  NSURL *cableAuthenticatorURL;
  ASCAuthorizationPresentationContext *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASCAuthorizationPresentationContext;
  v9 = -[ASCAuthorizationPresentationContext init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    cableAuthenticatorURL = v9->_cableAuthenticatorURL;
    v9->_cableAuthenticatorURL = (NSURL *)v10;

    v9->_shouldRequireCABLEAuthenticatorConsent = a4;
    v9->_passkeyURLType = a5;
    v12 = v9;
  }

  return v9;
}

- (void)addLoginChoice:(id)a3
{
  NSMutableArray *loginChoices;
  id v5;
  uint64_t v6;

  loginChoices = self->_loginChoices;
  v5 = a3;
  -[NSMutableArray safari_insertObject:inSortedOrderUsingComparator:](loginChoices, "safari_insertObject:inSortedOrderUsingComparator:", v5, &__block_literal_global_4);
  v6 = requestTypeForLoginChoice(v5);

  self->_requestTypes |= v6;
}

uint64_t __54__ASCAuthorizationPresentationContext_addLoginChoice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return compareLoginChoices(a2, a3);
}

- (void)updateLoginChoices:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *loginChoices;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  loginChoices = self->_loginChoices;
  self->_loginChoices = v4;

  -[NSMutableArray sortUsingComparator:](self->_loginChoices, "sortUsingComparator:", &__block_literal_global_82);
}

uint64_t __58__ASCAuthorizationPresentationContext_updateLoginChoices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return compareLoginChoices(a2, a3);
}

- (BOOL)isRegistrationRequest
{
  return (self->_requestTypes & 0x14) != 0;
}

- (BOOL)isCombinedPublicKeyCredentialRegistrationRequest
{
  return self->_requestTypes == 20;
}

- (BOOL)hasExternalPasswords
{
  return -[NSMutableArray safari_containsObjectPassingTest:](self->_loginChoices, "safari_containsObjectPassingTest:", &__block_literal_global_84_0);
}

uint64_t __59__ASCAuthorizationPresentationContext_hasExternalPasswords__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "loginChoiceKind") == 1)
    v3 = objc_msgSend(v2, "isExternal");
  else
    v3 = 0;

  return v3;
}

- (NSArray)localAccountLoginChoices
{
  return (NSArray *)-[NSMutableArray safari_filterObjectsUsingBlock:](self->_loginChoices, "safari_filterObjectsUsingBlock:", &__block_literal_global_85);
}

uint64_t __63__ASCAuthorizationPresentationContext_localAccountLoginChoices__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  unint64_t v3;
  uint64_t v4;

  v2 = a2;
  v3 = objc_msgSend(v2, "loginChoiceKind");
  if (v3 < 2)
  {
    v4 = 1;
  }
  else if (v3 == 3)
  {
    v4 = objc_msgSend(v2, "credentialKind") == 1;
  }
  else if (v3 == 2)
  {
    v4 = objc_msgSend(v2, "isRegistrationRequest") ^ 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_getPrimaryLoginChoices:(id *)a3 otherLoginChoices:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  id *v17;
  ASCAuthorizationPresentationContext *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[ASCAuthorizationPresentationContext _passkeyLoginChoices](self, "_passkeyLoginChoices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20 = self;
  v8 = self->_loginChoices;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v13, "loginChoiceKind") == 1 && objc_msgSend(v5, "count") == 1)
        {
          objc_msgSend(v5, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[ASCAuthorizationPresentationContext _passwordLoginChoice:hasSameHighLevelDomainAndUsernameAsPasskeyLoginChoice:](v20, "_passwordLoginChoice:hasSameHighLevelDomainAndUsernameAsPasskeyLoginChoice:", v13, v14);

          if (v15)
            v16 = v7;
          else
            v16 = v6;
        }
        else if ((unint64_t)objc_msgSend(v13, "loginChoiceKind") >= 3)
        {
          v16 = v7;
        }
        else
        {
          v16 = v6;
        }
        objc_msgSend(v16, "addObject:", v13);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v6, "count"))
  {
    v17 = a4;
    *a3 = (id)objc_msgSend(v6, "copy");
  }
  else
  {
    v17 = a3;
  }
  *v17 = (id)objc_msgSend(v7, "copy");

}

- (id)_passkeyLoginChoices
{
  return (id)-[NSMutableArray safari_filterObjectsUsingBlock:](self->_loginChoices, "safari_filterObjectsUsingBlock:", &__block_literal_global_86);
}

BOOL __59__ASCAuthorizationPresentationContext__passkeyLoginChoices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "loginChoiceKind") == 2;
}

- (BOOL)_passwordLoginChoice:(id)a3 hasSameHighLevelDomainAndUsernameAsPasskeyLoginChoice:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "site");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_highLevelDomainForPasswordManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relyingPartyIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_highLevelDomainForPasswordManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", v10))
  {
    objc_msgSend(v5, "username");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userVisibleName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)hasPlatformCredentialRequest
{
  return (self->_requestTypes & 0xC) != 0;
}

- (int64_t)iCloudKeychainPasskeyLoginChoiceCount
{
  void *v3;
  int v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  +[ASFeatureManager sharedManager](ASFeatureManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDeviceConfiguredToAllowPasskeys");

  if (!v4)
    return 0;
  objc_opt_class();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_loginChoices;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "externalCredentialProviderName", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
            ++v8;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)externalPasskeyLoginChoiceCount
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_loginChoices;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "externalCredentialProviderName", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
            ++v6;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)credentialLoginChoices
{
  return (NSArray *)-[NSMutableArray safari_filterObjectsUsingBlock:](self->_loginChoices, "safari_filterObjectsUsingBlock:", &__block_literal_global_88);
}

BOOL __61__ASCAuthorizationPresentationContext_credentialLoginChoices__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "loginChoiceKind") != 5 && objc_msgSend(v2, "loginChoiceKind") != 6;

  return v3;
}

- (NSArray)otherAccountsLoginChoices
{
  return (NSArray *)-[NSMutableArray safari_filterObjectsUsingBlock:](self->_loginChoices, "safari_filterObjectsUsingBlock:", &__block_literal_global_89);
}

BOOL __64__ASCAuthorizationPresentationContext_otherAccountsLoginChoices__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "loginChoiceKind") == 5 || objc_msgSend(v2, "loginChoiceKind") == 6;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *loginChoices;
  void *v5;
  id v6;

  loginChoices = self->_loginChoices;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", loginChoices, CFSTR("loginChoices"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_appIdentifier, CFSTR("appIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_frameIdentifier, CFSTR("frameIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_teamIdentifier, CFSTR("teamIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_serviceName, CFSTR("serviceName"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_serviceType, CFSTR("serviceType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_destinationSiteForCrossSiteAssertion, CFSTR("destinationSiteForCrossSiteAssertion"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_proxiedAssociatedDomains, CFSTR("associatedDomains"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_proxiedIconData, CFSTR("iconData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_proxiedIconScale, CFSTR("iconScale"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_requestTypes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("requestTypes"));

  objc_msgSend(v6, "encodeBool:forKey:", self->_isProxiedRequest, CFSTR("isProxiedRequestKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_proxiedOriginDeviceName, CFSTR("proxiedOriginDeviceName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_allowedCredentialsForSecurityKeyAssertion, CFSTR("allowedCredentialsForSecurityKeyAssertion"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_useAlternativeSecurityKeysIcon, CFSTR("useAlternativeSecurityKeysIcon"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_appleIDAuthorizationRequest, CFSTR("appleIDAuthorizationRequest"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_platformUserVerificationPreference, CFSTR("platformUserVerificationPreference"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_shouldUseFallbackPasskeyUI, CFSTR("shouldUseFallbackPasskeyUI"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_cableAuthenticatorURL, CFSTR("cableAuthenticatorURL"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isCABLEAuthenticatorRequest, CFSTR("isCABLEAuthenticatorRequest"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_shouldRequireCABLEAuthenticatorConsent, CFSTR("shouldRequireCABLEAuthenticatorConsent"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_shouldAllowSecurityKeysFromCABLEView, CFSTR("shouldAllowSecurityKeysFromCABLEView"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_cableAuthenticatorRequirement, CFSTR("cableAuthenticatorRequirement"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_passkeyURLType, CFSTR("passkeyURLType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_overrideHeader, CFSTR("overrideHeader"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_overrideTitle, CFSTR("overrideTitle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_overrideSubtitle, CFSTR("overrideSubtitle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_overrideNoCredentialsErrorTitle, CFSTR("overrideNoCredentialsErrorTitle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_overrideNoCredentialsErrorMessage, CFSTR("overrideNoCredentialsErrorMessage"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_windowSceneIdentifier, CFSTR("windowSceneIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_passkeyCreationOptionsForExternalProvider, CFSTR("passkeyCreationOptionsForExternalProvider"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_passkeyAssertionOptionsForExternalProvider, CFSTR("passkeyAssertionOptionsForExternalProvider"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isConditionalRegistrationRequest, CFSTR("isConditionalRegistrationRequest"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_auditTokenData, CFSTR("auditTokenData"));

}

- (ASCAuthorizationPresentationContext)initWithCoder:(id)a3
{
  id v4;
  ASCAuthorizationPresentationContext *v5;
  uint64_t v6;
  NSString *appIdentifier;
  uint64_t v8;
  WBSGlobalFrameIdentifier *frameIdentifier;
  uint64_t v10;
  NSString *bundleIdentifier;
  uint64_t v12;
  NSString *teamIdentifier;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMutableArray *loginChoices;
  uint64_t v18;
  NSString *serviceName;
  uint64_t v20;
  NSString *destinationSiteForCrossSiteAssertion;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *proxiedAssociatedDomains;
  uint64_t v27;
  NSData *proxiedIconData;
  uint64_t v29;
  NSNumber *proxiedIconScale;
  void *v31;
  uint64_t v32;
  NSString *proxiedOriginDeviceName;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSArray *allowedCredentialsForSecurityKeyAssertion;
  uint64_t v39;
  AKAuthorizationRequest *appleIDAuthorizationRequest;
  uint64_t v41;
  NSString *platformUserVerificationPreference;
  uint64_t v43;
  NSURL *cableAuthenticatorURL;
  uint64_t v45;
  NSString *overrideHeader;
  uint64_t v47;
  NSString *overrideTitle;
  uint64_t v49;
  NSString *overrideSubtitle;
  uint64_t v51;
  NSString *overrideNoCredentialsErrorTitle;
  uint64_t v53;
  NSString *overrideNoCredentialsErrorMessage;
  uint64_t v55;
  NSString *windowSceneIdentifier;
  uint64_t v57;
  ASCPublicKeyCredentialCreationOptions *passkeyCreationOptionsForExternalProvider;
  uint64_t v59;
  ASCPublicKeyCredentialAssertionOptions *passkeyAssertionOptionsForExternalProvider;
  uint64_t v61;
  NSData *auditTokenData;
  ASCAuthorizationPresentationContext *v63;
  objc_super v65;

  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)ASCAuthorizationPresentationContext;
  v5 = -[ASCAuthorizationPresentationContext init](&v65, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frameIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    frameIdentifier = v5->_frameIdentifier;
    v5->_frameIdentifier = (WBSGlobalFrameIdentifier *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("teamIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v12;

    ASAllLoginChoiceClasses();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setByAddingObject:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("loginChoices"));
    v16 = objc_claimAutoreleasedReturnValue();
    loginChoices = v5->_loginChoices;
    v5->_loginChoices = (NSMutableArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceName"));
    v18 = objc_claimAutoreleasedReturnValue();
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v18;

    v5->_serviceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("serviceType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationSiteForCrossSiteAssertion"));
    v20 = objc_claimAutoreleasedReturnValue();
    destinationSiteForCrossSiteAssertion = v5->_destinationSiteForCrossSiteAssertion;
    v5->_destinationSiteForCrossSiteAssertion = (NSString *)v20;

    v22 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("associatedDomains"));
    v25 = objc_claimAutoreleasedReturnValue();
    proxiedAssociatedDomains = v5->_proxiedAssociatedDomains;
    v5->_proxiedAssociatedDomains = (NSArray *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconData"));
    v27 = objc_claimAutoreleasedReturnValue();
    proxiedIconData = v5->_proxiedIconData;
    v5->_proxiedIconData = (NSData *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconScale"));
    v29 = objc_claimAutoreleasedReturnValue();
    proxiedIconScale = v5->_proxiedIconScale;
    v5->_proxiedIconScale = (NSNumber *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestTypes"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requestTypes = objc_msgSend(v31, "unsignedIntegerValue");
    v5->_isProxiedRequest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isProxiedRequestKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxiedOriginDeviceName"));
    v32 = objc_claimAutoreleasedReturnValue();
    proxiedOriginDeviceName = v5->_proxiedOriginDeviceName;
    v5->_proxiedOriginDeviceName = (NSString *)v32;

    v34 = (void *)MEMORY[0x24BDBCF20];
    v35 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("allowedCredentialsForSecurityKeyAssertion"));
    v37 = objc_claimAutoreleasedReturnValue();
    allowedCredentialsForSecurityKeyAssertion = v5->_allowedCredentialsForSecurityKeyAssertion;
    v5->_allowedCredentialsForSecurityKeyAssertion = (NSArray *)v37;

    v5->_useAlternativeSecurityKeysIcon = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useAlternativeSecurityKeysIcon"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleIDAuthorizationRequest"));
    v39 = objc_claimAutoreleasedReturnValue();
    appleIDAuthorizationRequest = v5->_appleIDAuthorizationRequest;
    v5->_appleIDAuthorizationRequest = (AKAuthorizationRequest *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformUserVerificationPreference"));
    v41 = objc_claimAutoreleasedReturnValue();
    platformUserVerificationPreference = v5->_platformUserVerificationPreference;
    v5->_platformUserVerificationPreference = (NSString *)v41;

    v5->_shouldUseFallbackPasskeyUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldUseFallbackPasskeyUI"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cableAuthenticatorURL"));
    v43 = objc_claimAutoreleasedReturnValue();
    cableAuthenticatorURL = v5->_cableAuthenticatorURL;
    v5->_cableAuthenticatorURL = (NSURL *)v43;

    v5->_isCABLEAuthenticatorRequest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCABLEAuthenticatorRequest"));
    v5->_shouldRequireCABLEAuthenticatorConsent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldRequireCABLEAuthenticatorConsent"));
    v5->_shouldAllowSecurityKeysFromCABLEView = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldAllowSecurityKeysFromCABLEView"));
    v5->_cableAuthenticatorRequirement = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cableAuthenticatorRequirement"));
    v5->_passkeyURLType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("passkeyURLType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overrideHeader"));
    v45 = objc_claimAutoreleasedReturnValue();
    overrideHeader = v5->_overrideHeader;
    v5->_overrideHeader = (NSString *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overrideTitle"));
    v47 = objc_claimAutoreleasedReturnValue();
    overrideTitle = v5->_overrideTitle;
    v5->_overrideTitle = (NSString *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overrideSubtitle"));
    v49 = objc_claimAutoreleasedReturnValue();
    overrideSubtitle = v5->_overrideSubtitle;
    v5->_overrideSubtitle = (NSString *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overrideNoCredentialsErrorTitle"));
    v51 = objc_claimAutoreleasedReturnValue();
    overrideNoCredentialsErrorTitle = v5->_overrideNoCredentialsErrorTitle;
    v5->_overrideNoCredentialsErrorTitle = (NSString *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overrideNoCredentialsErrorMessage"));
    v53 = objc_claimAutoreleasedReturnValue();
    overrideNoCredentialsErrorMessage = v5->_overrideNoCredentialsErrorMessage;
    v5->_overrideNoCredentialsErrorMessage = (NSString *)v53;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("windowSceneIdentifier"));
    v55 = objc_claimAutoreleasedReturnValue();
    windowSceneIdentifier = v5->_windowSceneIdentifier;
    v5->_windowSceneIdentifier = (NSString *)v55;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passkeyCreationOptionsForExternalProvider"));
    v57 = objc_claimAutoreleasedReturnValue();
    passkeyCreationOptionsForExternalProvider = v5->_passkeyCreationOptionsForExternalProvider;
    v5->_passkeyCreationOptionsForExternalProvider = (ASCPublicKeyCredentialCreationOptions *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passkeyAssertionOptionsForExternalProvider"));
    v59 = objc_claimAutoreleasedReturnValue();
    passkeyAssertionOptionsForExternalProvider = v5->_passkeyAssertionOptionsForExternalProvider;
    v5->_passkeyAssertionOptionsForExternalProvider = (ASCPublicKeyCredentialAssertionOptions *)v59;

    v5->_isConditionalRegistrationRequest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isConditionalRegistrationRequest"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditTokenData"));
    v61 = objc_claimAutoreleasedReturnValue();
    auditTokenData = v5->_auditTokenData;
    v5->_auditTokenData = (NSData *)v61;

    v63 = v5;
  }

  return v5;
}

- (int64_t)_passkeyURLType
{
  return self->_passkeyURLType;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (WBSGlobalFrameIdentifier)frameIdentifier
{
  return self->_frameIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSArray)loginChoices
{
  return &self->_loginChoices->super;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)destinationSiteForCrossSiteAssertion
{
  return self->_destinationSiteForCrossSiteAssertion;
}

- (void)setDestinationSiteForCrossSiteAssertion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (unint64_t)requestTypes
{
  return self->_requestTypes;
}

- (BOOL)isProxiedRequest
{
  return self->_isProxiedRequest;
}

- (void)setIsProxiedRequest:(BOOL)a3
{
  self->_isProxiedRequest = a3;
}

- (NSArray)proxiedAssociatedDomains
{
  return self->_proxiedAssociatedDomains;
}

- (void)setProxiedAssociatedDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)proxiedIconData
{
  return self->_proxiedIconData;
}

- (void)setProxiedIconData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)proxiedIconScale
{
  return self->_proxiedIconScale;
}

- (void)setProxiedIconScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)proxiedOriginDeviceName
{
  return self->_proxiedOriginDeviceName;
}

- (void)setProxiedOriginDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (AKAuthorizationRequest)appleIDAuthorizationRequest
{
  return self->_appleIDAuthorizationRequest;
}

- (void)setAppleIDAuthorizationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDAuthorizationRequest, a3);
}

- (NSString)platformUserVerificationPreference
{
  return self->_platformUserVerificationPreference;
}

- (NSURL)cableAuthenticatorURL
{
  return self->_cableAuthenticatorURL;
}

- (BOOL)isCABLEAuthenticatorRequest
{
  return self->_isCABLEAuthenticatorRequest;
}

- (BOOL)shouldRequireCABLEAuthenticatorConsent
{
  return self->_shouldRequireCABLEAuthenticatorConsent;
}

- (BOOL)shouldAllowSecurityKeysFromCABLEView
{
  return self->_shouldAllowSecurityKeysFromCABLEView;
}

- (int64_t)cableAuthenticatorRequirement
{
  return self->_cableAuthenticatorRequirement;
}

- (NSString)overrideHeader
{
  return self->_overrideHeader;
}

- (NSString)overrideTitle
{
  return self->_overrideTitle;
}

- (NSString)overrideSubtitle
{
  return self->_overrideSubtitle;
}

- (NSString)overrideNoCredentialsErrorTitle
{
  return self->_overrideNoCredentialsErrorTitle;
}

- (NSString)overrideNoCredentialsErrorMessage
{
  return self->_overrideNoCredentialsErrorMessage;
}

- (BOOL)useAlternativeSecurityKeysIcon
{
  return self->_useAlternativeSecurityKeysIcon;
}

- (BOOL)shouldUseFallbackPasskeyUI
{
  return self->_shouldUseFallbackPasskeyUI;
}

- (NSString)windowSceneIdentifier
{
  return self->_windowSceneIdentifier;
}

- (NSArray)allowedCredentialsForSecurityKeyAssertion
{
  return self->_allowedCredentialsForSecurityKeyAssertion;
}

- (ASCPublicKeyCredentialCreationOptions)passkeyCreationOptionsForExternalProvider
{
  return self->_passkeyCreationOptionsForExternalProvider;
}

- (ASCPublicKeyCredentialAssertionOptions)passkeyAssertionOptionsForExternalProvider
{
  return self->_passkeyAssertionOptionsForExternalProvider;
}

- (BOOL)isConditionalRegistrationRequest
{
  return self->_isConditionalRegistrationRequest;
}

- (NSData)auditTokenData
{
  return self->_auditTokenData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_passkeyAssertionOptionsForExternalProvider, 0);
  objc_storeStrong((id *)&self->_passkeyCreationOptionsForExternalProvider, 0);
  objc_storeStrong((id *)&self->_allowedCredentialsForSecurityKeyAssertion, 0);
  objc_storeStrong((id *)&self->_windowSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideNoCredentialsErrorMessage, 0);
  objc_storeStrong((id *)&self->_overrideNoCredentialsErrorTitle, 0);
  objc_storeStrong((id *)&self->_overrideSubtitle, 0);
  objc_storeStrong((id *)&self->_overrideTitle, 0);
  objc_storeStrong((id *)&self->_overrideHeader, 0);
  objc_storeStrong((id *)&self->_cableAuthenticatorURL, 0);
  objc_storeStrong((id *)&self->_platformUserVerificationPreference, 0);
  objc_storeStrong((id *)&self->_appleIDAuthorizationRequest, 0);
  objc_storeStrong((id *)&self->_proxiedOriginDeviceName, 0);
  objc_storeStrong((id *)&self->_proxiedIconScale, 0);
  objc_storeStrong((id *)&self->_proxiedIconData, 0);
  objc_storeStrong((id *)&self->_proxiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_destinationSiteForCrossSiteAssertion, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_frameIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_loginChoices, 0);
}

- (void)initWithRequestContext:(void *)a1 appIdentifier:(void *)a2 frameIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_20E648000, v3, OS_LOG_TYPE_ERROR, "Unable to fetch bundle record for app identifier on credential request context with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
