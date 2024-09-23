@implementation AKURLBag

- (id)_urlAtKey:(id)a3 fromURLBag:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("url"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_configurationsFromCache:(BOOL)a3 withError:(id *)a4
{
  void *v4;
  void *v5;

  -[AKURLBag _urlBagFromCache:withError:](self, "_urlBagFromCache:withError:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cfgs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_urlBagFromCache:(BOOL)a3 withError:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  AKAppleIDAuthenticationController *v8;
  void *v9;
  void *v10;

  v5 = a3;
  -[AKURLBag bagProvider](self, "bagProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AKURLBag bagProvider](self, "bagProvider");
    v8 = (AKAppleIDAuthenticationController *)objc_claimAutoreleasedReturnValue();
    -[AKURLBag altDSID](self, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDAuthenticationController urlBagFromCache:altDSID:error:](v8, "urlBagFromCache:altDSID:error:", v5, v9, a4);
  }
  else
  {
    v8 = objc_alloc_init(AKAppleIDAuthenticationController);
    -[AKURLBag altDSID](self, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDAuthenticationController _urlBagFromCache:altDSID:withError:](v8, "_urlBagFromCache:altDSID:withError:", v5, v9, a4);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (AKURLBagDictionaryProvider)bagProvider
{
  AKURLBagDictionaryProvider *v2;
  AKURLBagDictionaryProvider *v3;
  AKURLBagDictionaryProvider *v4;
  AKURLBagDictionaryProvider *v5;

  v2 = self->_bagProvider;
  v3 = v2;
  v4 = (AKURLBagDictionaryProvider *)__sharedMemorySpaceBagProvider;
  if (v2)
    v4 = v2;
  v5 = v4;

  return v5;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (unint64_t)lastKnownIDMSEnvironment
{
  void *v2;
  unint64_t v3;

  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lastKnownIDMSEnvironment");

  return v3;
}

+ (id)bagForAltDSID:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __26__AKURLBag_bagForAltDSID___block_invoke;
    v7[3] = &unk_1E2E60AE8;
    v8 = v4;
    objc_msgSend(a1, "_currentBagsUnderLockWithBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "sharedBag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)sharedBag
{
  if (sharedBag_onceToken != -1)
    dispatch_once(&sharedBag_onceToken, &__block_literal_global_27);
  return (id)sharedBag_sharedURLBag;
}

- (NSURL)iForgotWebURLToIntercept
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("InterceptRecoveryUrl"));
}

- (NSSet)appleIDAuthorizationURLs
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[AKURLBag configurationAtKey:fromCache:](self, "configurationAtKey:fromCache:", CFSTR("appleIDAuthorizationUrls"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)configurationAtKey:(id)a3 fromCache:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a4;
    v6 = a3;
    -[AKURLBag _configurationsFromCache:withError:](self, "_configurationsFromCache:withError:", v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

AKURLBag *__26__AKURLBag_bagForAltDSID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AKURLBag *v4;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (AKURLBag *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[AKURLBag initWithAltDSID:]([AKURLBag alloc], "initWithAltDSID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));
  }

  return v4;
}

void __21__AKURLBag_sharedBag__block_invoke()
{
  AKURLBag *v0;
  void *v1;

  v0 = objc_alloc_init(AKURLBag);
  v1 = (void *)sharedBag_sharedURLBag;
  sharedBag_sharedURLBag = (uint64_t)v0;

}

+ (id)_currentBagsUnderLockWithBlock:(id)a3
{
  uint64_t v3;
  void (**v4)(id, uint64_t);
  void *v5;

  v3 = _currentBagsUnderLockWithBlock__onceToken;
  v4 = (void (**)(id, uint64_t))a3;
  if (v3 != -1)
    dispatch_once(&_currentBagsUnderLockWithBlock__onceToken, &__block_literal_global_247);
  os_unfair_lock_lock((os_unfair_lock_t)&_currentBagsUnderLockWithBlock__lock);
  v4[2](v4, _currentBagsUnderLockWithBlock__currentBags);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&_currentBagsUnderLockWithBlock__lock);
  return v5;
}

void __43__AKURLBag__currentBagsUnderLockWithBlock___block_invoke()
{
  id v0;
  void *v1;

  _currentBagsUnderLockWithBlock__lock = 0;
  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_currentBagsUnderLockWithBlock__currentBags;
  _currentBagsUnderLockWithBlock__currentBags = (uint64_t)v0;

}

- (AKURLBag)initWithAltDSID:(id)a3
{
  id v5;
  AKURLBag *v6;
  AKURLBag *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKURLBag;
  v6 = -[AKURLBag init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_altDSID, a3);

  return v7;
}

+ (AKURLBagDictionaryProvider)sharedMemorySpaceBagProvider
{
  return (AKURLBagDictionaryProvider *)(id)__sharedMemorySpaceBagProvider;
}

+ (void)setSharedMemorySpaceBagProvider:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19202F000, v4, OS_LOG_TYPE_DEFAULT, "AKURLBag SharedMemorySpaceBagProvider ==> %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)__sharedMemorySpaceBagProvider;
  __sharedMemorySpaceBagProvider = (uint64_t)v3;

}

- (NSURL)privateEmailManageURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("managePrivateEmailAddress"));
}

- (NSURL)upgradeEligibilityCheckURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("securityUpgradeEligibility"));
}

- (NSURL)upgradeUIURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("securityUpgrade"));
}

- (NSURL)validateCodeURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("validateCode"));
}

- (NSURL)escapeHatchURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("secondaryAuth"));
}

- (NSURL)privacyRepairURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("privacyRepair"));
}

- (NSURL)goldilocksIncompatibleDevicesURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("goldilocksIncompatibleDevices"));
}

+ (id)keyForEscapeHatchURL
{
  return CFSTR("secondaryAuth");
}

- (NSURL)checkInURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("postData"));
}

- (NSURL)osAttestationURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("saveAttestedOSVersion"));
}

- (NSURL)notificationAckURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("teardown"));
}

- (NSURL)iForgotURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("iForgot"));
}

- (NSURL)iForgotContinuationURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("iForgotResetNotification"));
}

+ (BOOL)looksLikeiForgotURLKey:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iForgotAppleIdLocked")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("iForgot")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("iForgotResetNotification"));
  }

  return v4;
}

- (NSURL)createAppleIDURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("createAccount"));
}

- (NSURL)deviceListURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("device_list_self"));
}

- (NSURL)trustedDevicesURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("trustedDevices"));
}

- (NSURL)trustedDevicesSummaryURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("trustedDevicesSummaryUrl"));
}

- (NSURL)deviceInfoURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("fetchDeviceInfo"));
}

- (NSURL)absintheCertURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("qualifyCert"));
}

- (NSURL)absintheSessionURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("qualifySession"));
}

- (NSURL)tokenUpgradeURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("tokenUpgrade"));
}

- (NSURL)configurationInfoURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("postConfigData"));
}

- (NSURL)fetchConfigDataURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("fetchConfigData"));
}

- (NSURL)changePasswordURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("changePasswordUrl"));
}

- (NSURL)manageSiwaForChildUrl
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("manageSiwaForChildUrl"));
}

- (NSURL)validateVettingTokenURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("validateVettingToken"));
}

- (NSURL)renewRecoveryTokenURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("renewRecoveryToken"));
}

- (NSURL)circleURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("circle"));
}

- (NSURL)fetchFollowUps
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("followUpItems"));
}

- (NSURL)fetchUserInfoURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("fetchUserInfo"));
}

- (NSURL)fetchGlobalConfigURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("fetchGlobalConfigs"));
}

- (NSURL)fetchAppInfoURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("fetchAuthorizedApps"));
}

- (NSURL)fetchPrimaryBundleIDURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("fetchPrimaryApp"));
}

- (NSURL)fetchAuthenticationModeURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("fetchAuthMode"));
}

- (NSURL)storeModernRecoveryURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("storeModernRecoveryKey"));
}

- (BOOL)isPhoneNumberSupportedConfig
{
  void *v2;
  char v3;

  -[AKURLBag configurationAtKey:](self, "configurationAtKey:", CFSTR("is-phone-number-supported"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isBackgroundiCloudSignInEnabled
{
  void *v2;
  char v3;

  -[AKURLBag configurationAtKey:](self, "configurationAtKey:", CFSTR("background-iCloud-SignIn-enable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)disablePSCreateAndForgetLink
{
  void *v2;
  void *v3;
  char v4;

  -[AKURLBag configurationAtKey:](self, "configurationAtKey:", CFSTR("disablePSCreateAndForgetLink"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (NSURL)acsURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("acsURL"));
}

- (NSURL)repairURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("repair"));
}

- (NSURL)userVerificationURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("userVerificationResult"));
}

- (NSURL)deleteAuthorizedAppURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("deleteAuthorizedApp"));
}

- (NSURL)startFidoAuthURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("startFidoAuth"));
}

- (NSURL)finishFidoAuthURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("finishFidoAuth"));
}

- (NSURL)startFidoRecoveryAuthURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("startFidoRecoveryAuth"));
}

- (NSURL)finishFidoRecoveryAuthURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("finishFidoRecoveryAuth"));
}

- (NSSet)appleOwnedDomains
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[AKURLBag configurationAtKey:fromCache:](self, "configurationAtKey:fromCache:", CFSTR("appleOwnedDomains"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSURL)appleIDAuthorizeHTMLResponseURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("appleIDAuthorizeHTMLResponse"));
}

- (NSURL)createChildAccountURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("createChildAccount"));
}

- (NSDictionary)custodianCodeConfiguration
{
  return (NSDictionary *)-[AKURLBag configurationAtKey:fromCache:](self, "configurationAtKey:fromCache:", CFSTR("custodian"), 1);
}

- (NSDictionary)inheritanceConfiguration
{
  return (NSDictionary *)-[AKURLBag configurationAtKey:fromCache:](self, "configurationAtKey:fromCache:", CFSTR("inheritance-cfg"), 1);
}

- (NSString)APSEnvironment
{
  void *v2;
  void *v3;

  -[AKURLBag _requestEnvironmentsWithError:](self, "_requestEnvironmentsWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("apsEnv"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)IDMSEnvironment
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[AKURLBag _requestEnvironmentsWithError:](self, "_requestEnvironmentsWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("idmsEnv"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend((id)objc_opt_class(), "_IDMSEnvironmentFromString:", v3);
  return v4;
}

- (BOOL)IsInlineFlowSupportedConfig
{
  void *v2;
  char v3;

  -[AKURLBag configurationAtKey:](self, "configurationAtKey:", CFSTR("is-in-line-flow-supported"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isSettingsInlineLogoViewDisabled
{
  void *v2;
  char v3;

  -[AKURLBag configurationAtKey:](self, "configurationAtKey:", CFSTR("settingsInlineLogoViewDisabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isEasyStudentSignInDisabled
{
  void *v2;
  char v3;

  -[AKURLBag configurationAtKey:](self, "configurationAtKey:", CFSTR("easyStudentSignInDisabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)continuationHeaderPrefix
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[AKURLBag configurationAtKey:](self, "configurationAtKey:", CFSTR("continuation-header-prefix"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("X-Apple-I-Cont");
  v4 = v2;

  return v4;
}

- (NSArray)securityUpgradeServiceNames
{
  return (NSArray *)-[AKURLBag configurationAtKey:fromCache:](self, "configurationAtKey:fromCache:", CFSTR("2faUpgradeAccountTypePriority"), 1);
}

+ (unint64_t)IDMSEnvironmentFromBag:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(a1, "_requestEnvironmentsWithBag:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("idmsEnv"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(a1, "_IDMSEnvironmentFromString:", v5);
  return v6;
}

+ (unint64_t)_IDMSEnvironmentFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("IdMS1")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("IdMS2")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("IdMS3")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)configurationAtKey:(id)a3
{
  return -[AKURLBag configurationAtKey:fromCache:](self, "configurationAtKey:fromCache:", a3, 0);
}

- (id)ttrConfigurationAtKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  -[AKURLBag configurationAtKey:](self, "configurationAtKey:", CFSTR("ttr-cfgs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)requestNewURLBagIfNecessaryWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__AKURLBag_requestNewURLBagIfNecessaryWithCompletion___block_invoke;
  v6[3] = &unk_1E2E5E248;
  v7 = v4;
  v5 = v4;
  -[AKURLBag _fetchURLBagFromCache:withCompletion:](self, "_fetchURLBagFromCache:withCompletion:", 0, v6);

}

uint64_t __54__AKURLBag_requestNewURLBagIfNecessaryWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (BOOL)requestNewURLBagIfNecessaryWithError:(id *)a3
{
  void *v3;
  BOOL v4;

  -[AKURLBag _requestNewURLBagIfNecessaryWithError:](self, "_requestNewURLBagIfNecessaryWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)configurationValueForKey:(id)a3 completion:(id)a4
{
  -[AKURLBag configurationValueForKey:fromCache:completion:](self, "configurationValueForKey:fromCache:completion:", a3, 0, a4);
}

- (void)configurationValueForKey:(id)a3 fromCache:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__AKURLBag_configurationValueForKey_fromCache_completion___block_invoke;
  v12[3] = &unk_1E2E5F0B0;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[AKURLBag _fetchURLBagFromCache:withCompletion:](self, "_fetchURLBagFromCache:withCompletion:", v6, v12);

}

void __58__AKURLBag_configurationValueForKey_fromCache_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("cfgs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      if (v8)
        (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v7, 0);
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7097);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v10);

    }
    goto LABEL_10;
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:underlyingError:", -7122, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v6);
LABEL_10:

  }
}

- (void)urlForKey:(id)a3 completion:(id)a4
{
  -[AKURLBag urlForKey:fromCache:completion:](self, "urlForKey:fromCache:completion:", a3, 0, a4);
}

- (id)urlDictionaryAtKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  if (a3)
  {
    v4 = a3;
    -[AKURLBag _requestNewURLBagIfNecessaryWithError:](self, "_requestNewURLBagIfNecessaryWithError:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6;
    v8 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)urlForKey:(id)a3 fromCache:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__AKURLBag_urlForKey_fromCache_completion___block_invoke;
  v12[3] = &unk_1E2E5FF58;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[AKURLBag _fetchURLBagFromCache:withCompletion:](self, "_fetchURLBagFromCache:withCompletion:", v6, v12);

}

void __43__AKURLBag_urlForKey_fromCache_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (v13)
  {
    v6 = (void *)a1[4];
    v7 = a1[5];
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("urls"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlAtKey:fromURLBag:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = a1[6];
    if (v9)
    {
      if (v10)
        (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v9, 0);
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7097);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v12);

    }
    goto LABEL_10;
  }
  v11 = a1[6];
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:underlyingError:", -7122, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v9);
LABEL_10:

  }
}

- (id)_urlAtKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[AKURLBag _requestNewURLBagIfNecessaryWithError:](self, "_requestNewURLBagIfNecessaryWithError:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKURLBag _urlAtKey:fromURLBag:](self, "_urlAtKey:fromURLBag:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)isBaaEnabledForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;

  v4 = a3;
  if (!v4)
  {
    v7 = 0;
    goto LABEL_11;
  }
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isInternalBuild"))
  {
    v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("postData"));

    if ((v6 & 1) != 0)
    {
      v7 = 1;
      goto LABEL_11;
    }
  }
  else
  {

  }
  -[AKURLBag _requestNewURLBagIfNecessaryWithError:](self, "_requestNewURLBagIfNecessaryWithError:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("baa"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

LABEL_11:
  return v7;
}

- (NSDictionary)baaConfiguration
{
  return (NSDictionary *)-[AKURLBag configurationAtKey:fromCache:](self, "configurationAtKey:fromCache:", CFSTR("baa-support"), 1);
}

- (unint64_t)baaValidity
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[AKURLBag baaConfiguration](self, "baaConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("cert-validity-in-days"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (NSString)baaCertIssuer
{
  void *v2;
  void *v3;

  -[AKURLBag baaConfiguration](self, "baaConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("cert-to-use"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_requestNewURLBagIfNecessaryWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[AKURLBag _urlBagFromCache:withError:](self, "_urlBagFromCache:withError:", 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("urls"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)environmentValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__AKURLBag_environmentValueForKey_completion___block_invoke;
  v10[3] = &unk_1E2E5F0B0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[AKURLBag _fetchURLBagFromCache:withCompletion:](self, "_fetchURLBagFromCache:withCompletion:", 0, v10);

}

void __46__AKURLBag_environmentValueForKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("env"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      if (v8)
        (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v7, 0);
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7097);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v10);

    }
    goto LABEL_10;
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:underlyingError:", -7122, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v6);
LABEL_10:

  }
}

- (id)_requestEnvironmentsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[AKURLBag _urlBagFromCache:withError:](self, "_urlBagFromCache:withError:", 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_requestEnvironmentsWithBag:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_requestEnvironmentsWithBag:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("env"));
}

- (void)_fetchURLBagFromCache:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  void *v9;
  AKAppleIDAuthenticationController *v10;
  id v11;

  v4 = a3;
  v6 = (void (**)(id, void *, id))a4;
  -[AKURLBag bagProvider](self, "bagProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v7)
    {
      -[AKURLBag bagProvider](self, "bagProvider");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[AKURLBag altDSID](self, "altDSID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchURLBagForAltDSID:fromCache:completion:", v9, 1, v6);
    }
    else
    {
      v11 = 0;
      -[AKURLBag _urlBagFromCache:withError:](self, "_urlBagFromCache:withError:", 1, &v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      if (v6)
        v6[2](v6, v9, v8);
    }
  }
  else
  {
    if (v7)
    {
      -[AKURLBag bagProvider](self, "bagProvider");
      v10 = (AKAppleIDAuthenticationController *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = objc_alloc_init(AKAppleIDAuthenticationController);
    }
    v8 = v10;
    -[AKURLBag altDSID](self, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchURLBagForAltDSID:completion:", v9, v6);
  }

}

- (void)forceUpdateBagWithUrlSwitchData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AKURLBagDictionaryProvider *bagProvider;
  uint64_t v10;
  AKAppleIDAuthenticationController *v11;

  v6 = a4;
  v7 = a3;
  -[AKURLBag bagProvider](self, "bagProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    bagProvider = self->_bagProvider;
    -[AKURLBag altDSID](self, "altDSID");
    v11 = (AKAppleIDAuthenticationController *)objc_claimAutoreleasedReturnValue();
    -[AKURLBagDictionaryProvider forceURLBagUpdateForAltDSID:urlSwitchData:completion:](bagProvider, "forceURLBagUpdateForAltDSID:urlSwitchData:completion:");
  }
  else
  {
    v11 = objc_alloc_init(AKAppleIDAuthenticationController);
    -[AKURLBag altDSID](self, "altDSID");
    v10 = objc_claimAutoreleasedReturnValue();
    -[AKAppleIDAuthenticationController forceURLBagUpdateForAltDSID:urlSwitchData:completion:](v11, "forceURLBagUpdateForAltDSID:urlSwitchData:completion:", v10, v7, v6);

    v6 = v7;
    v7 = (id)v10;
  }

}

- (NSURL)webAccessDisableURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("webAccessDisable"));
}

- (NSURL)webAccessEnableURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("webAccessEnable"));
}

- (NSURL)dataRecoveryServiceDisableURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("dataRecoveryServiceDisable"));
}

- (NSURL)dataRecoveryServiceEnableURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("dataRecoveryServiceEnable"));
}

- (NSURL)walrusKBURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("walrusKB"));
}

- (NSURL)walrusCountryAnchorKBURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("walrusCountryAnchorKB"));
}

- (NSURL)webAccessKBURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("webAccessKB"));
}

- (NSURL)contactKeyVerificationIneligibleDevicesURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("contactKeyVerificationIneligibleDevices"));
}

- (NSURL)startPasskeyRegistrationURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("startPasskeyRegistration"));
}

- (NSURL)finishPasskeyRegistrationURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("finishPasskeyRegistration"));
}

- (NSURL)generateVerificationTokenURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("generateVerificationToken"));
}

- (NSURL)unenrollPasskeyURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("deletePasskey"));
}

- (BOOL)isPasskeyCleanupDisabled
{
  void *v2;
  void *v3;
  char v4;

  -[AKURLBag configurationAtKey:](self, "configurationAtKey:", CFSTR("passkeyCleanupDisabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isFirstPartyURLEntitlementCheckDisabled
{
  id v3;
  id v4;
  char v5;

  objc_opt_class();
  -[AKURLBag configurationAtKey:](self, "configurationAtKey:", CFSTR("firstPartyURLEntitlementCheckDisabled"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (BOOL)isTokenCacheDisabled
{
  id v3;
  id v4;
  char v5;

  objc_opt_class();
  -[AKURLBag configurationAtKey:](self, "configurationAtKey:", CFSTR("tokenCacheDisabled"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (BOOL)isMIDDriftTTRDisabled
{
  id v3;
  id v4;
  char v5;

  objc_opt_class();
  -[AKURLBag configurationAtKey:](self, "configurationAtKey:", CFSTR("midDriftTTRDisabled"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (NSURL)siwaGenerateShareToken
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("generateSharedToken"));
}

- (NSURL)siwaUpdateShareToken
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("updateSharedToken"));
}

- (NSURL)siwaRevokeShareToken
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("revokeSharedToken"));
}

- (NSURL)siwaFetchSharedGroups
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("fetchSharedTokenGroups"));
}

- (NSURL)siwaRotateShareTokens
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("rollSharedToken"));
}

- (NSURL)siwaManagementURL
{
  return (NSURL *)-[AKURLBag _urlAtKey:](self, "_urlAtKey:", CFSTR("siwaManagementUrl"));
}

- (NSArray)allKeys
{
  void *v2;
  void *v3;

  -[AKURLBag _requestNewURLBagIfNecessaryWithError:](self, "_requestNewURLBagIfNecessaryWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isTrustedDeviceListHashDisabled
{
  void *v2;
  void *v3;
  char v4;

  -[AKURLBag configurationAtKey:](self, "configurationAtKey:", CFSTR("trustedDeviceListHashDisabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setBagProvider:(id)a3
{
  objc_storeStrong((id *)&self->_bagProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagProvider, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
