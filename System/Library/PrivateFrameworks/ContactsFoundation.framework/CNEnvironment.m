@implementation CNEnvironment

id __32__CNEnvironment_isInternalBuild__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", os_variant_has_internal_content());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 128);
    *(_QWORD *)(v4 + 128) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  }
  return v2;
}

id __33__CNEnvironment_isGreenTeaDevice__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 136);
    *(_QWORD *)(v4 + 136) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  }
  return v2;
}

id __35__CNEnvironment_defaultCountryCode__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[15];
  if (!v3)
  {
    objc_msgSend(v2, "getDefaultCountryCode");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 120);
    *(_QWORD *)(v5 + 120) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  }
  return v3;
}

- (id)getDefaultCountryCode
{
  return +[CNPhoneNumberHelper defaultCountryCode](CNPhoneNumberHelper, "defaultCountryCode");
}

- (CNAuthorizationContext)authorizationContext
{
  return (CNAuthorizationContext *)objc_getProperty(self, a2, 80, 1);
}

+ (CNEnvironmentBase)defaultEnvironment
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CNEnvironment_defaultEnvironment__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultEnvironment_cn_once_token_2 != -1)
    dispatch_once(&defaultEnvironment_cn_once_token_2, block);
  return (CNEnvironmentBase *)(id)defaultEnvironment_cn_once_object_2;
}

+ (char)environmentStackKey
{
  return "com.apple.contacts.environment-stack";
}

void __35__CNEnvironment_defaultEnvironment__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultEnvironment_cn_once_object_2;
  defaultEnvironment_cn_once_object_2 = (uint64_t)v1;

}

- (CNEnvironment)init
{
  CNEnvironment *v2;
  CNFileManager *v3;
  CNFileManager *fileManager;
  uint64_t v5;
  CNUserDefaults *userDefaults;
  uint64_t v7;
  CNFeatureFlags *featureFlags;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  CNSchedulerProvider *schedulerProvider;
  uint64_t v15;
  CNTimeProvider *timeProvider;
  uint64_t v17;
  NSNotificationCenter *notificationCenter;
  uint64_t v19;
  NSDistributedNotificationCenter *distributedNotificationCenter;
  CNEntitlementVerifier *v21;
  CNEntitlementVerification *entitlementVerifier;
  uint64_t v23;
  CNAuthorizationContext *authorizationContext;
  uint64_t v25;
  CNLocalizationServices *localizationServices;
  CNProbabilityUtility *v27;
  CNProbabilityUtility *probabilityUtility;
  uint64_t v29;
  CNWatchdog *watchdog;
  uint64_t v31;
  NSMutableDictionary *storage;
  CNEnvironment *v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)CNEnvironment;
  v2 = -[CNEnvironment init](&v35, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CNFileManager);
    fileManager = v2->_fileManager;
    v2->_fileManager = v3;

    +[CNUserDefaults standardPreferences](CNUserDefaults, "standardPreferences");
    v5 = objc_claimAutoreleasedReturnValue();
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (CNUserDefaults *)v5;

    +[CNFeatureFlags currentFlags](CNFeatureFlags, "currentFlags");
    v7 = objc_claimAutoreleasedReturnValue();
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = (CNFeatureFlags *)v7;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (__CFString *)v10;
    else
      v12 = &stru_1E29BCC70;
    objc_storeStrong((id *)&v2->_mainBundleIdentifier, v12);

    +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
    v13 = objc_claimAutoreleasedReturnValue();
    schedulerProvider = v2->_schedulerProvider;
    v2->_schedulerProvider = (CNSchedulerProvider *)v13;

    +[CNTimeProvider defaultProvider](CNTimeProvider, "defaultProvider");
    v15 = objc_claimAutoreleasedReturnValue();
    timeProvider = v2->_timeProvider;
    v2->_timeProvider = (CNTimeProvider *)v15;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSNotificationCenter *)v17;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v19 = objc_claimAutoreleasedReturnValue();
    distributedNotificationCenter = v2->_distributedNotificationCenter;
    v2->_distributedNotificationCenter = (NSDistributedNotificationCenter *)v19;

    v21 = objc_alloc_init(CNEntitlementVerifier);
    entitlementVerifier = v2->_entitlementVerifier;
    v2->_entitlementVerifier = (CNEntitlementVerification *)v21;

    +[CNAuthorizationContext sharedInstance](CNAuthorizationContext, "sharedInstance");
    v23 = objc_claimAutoreleasedReturnValue();
    authorizationContext = v2->_authorizationContext;
    v2->_authorizationContext = (CNAuthorizationContext *)v23;

    +[CNLocalizationServices defaultServices](CNLocalizationServices, "defaultServices");
    v25 = objc_claimAutoreleasedReturnValue();
    localizationServices = v2->_localizationServices;
    v2->_localizationServices = (CNLocalizationServices *)v25;

    v27 = objc_alloc_init(CNProbabilityUtility);
    probabilityUtility = v2->_probabilityUtility;
    v2->_probabilityUtility = v27;

    +[CNWatchdog defaultWatchdog](CNWatchdog, "defaultWatchdog");
    v29 = objc_claimAutoreleasedReturnValue();
    watchdog = v2->_watchdog;
    v2->_watchdog = (CNWatchdog *)v29;

    v31 = objc_opt_new();
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v31;

    v33 = v2;
  }

  return v2;
}

- (CNEntitlementVerification)entitlementVerifier
{
  return (CNEntitlementVerification *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isGreenTeaDevice
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__CNEnvironment_isGreenTeaDevice__block_invoke;
  v5[3] = &unk_1E29B8C60;
  v5[4] = self;
  cn_objectResultWithObjectLock(self, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (CNSchedulerProvider)schedulerProvider
{
  return (CNSchedulerProvider *)objc_getProperty(self, a2, 40, 1);
}

id __41__CNEnvironment_valueForKey_onCacheMiss___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    (*(void (**)(void))(a1[6] + 16))();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", v3, a1[5]);
  }

  return v3;
}

- (id)valueForKey:(id)a3 onCacheMiss:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__CNEnvironment_valueForKey_onCacheMiss___block_invoke;
  v12[3] = &unk_1E29B92E0;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  cn_objectResultWithObjectLock(self, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isInternalBuild
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__CNEnvironment_isInternalBuild__block_invoke;
  v5[3] = &unk_1E29B8C60;
  v5[4] = self;
  cn_objectResultWithObjectLock(self, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (CNTimeProvider)timeProvider
{
  return (CNTimeProvider *)objc_getProperty(self, a2, 48, 1);
}

- (CNWatchdog)watchdog
{
  return (CNWatchdog *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)defaultCountryCode
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__CNEnvironment_defaultCountryCode__block_invoke;
  v3[3] = &unk_1E29B8C60;
  v3[4] = self;
  cn_objectResultWithObjectLock(self, v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isCommLimitsEnabled
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__CNEnvironment_isCommLimitsEnabled__block_invoke;
  v5[3] = &unk_1E29B8C60;
  v5[4] = self;
  cn_objectResultWithObjectLock(self, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

id __36__CNEnvironment_isCommLimitsEnabled__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[18];
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isCommLimitsEnabledImpl"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 144);
    *(_QWORD *)(v5 + 144) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  }
  return v3;
}

- (BOOL)isCommLimitsEnabledImpl
{
  return 1;
}

- (BOOL)isKeychainEnabled
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__CNEnvironment_isKeychainEnabled__block_invoke;
  v5[3] = &unk_1E29B8C60;
  v5[4] = self;
  cn_objectResultWithObjectLock(self, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

id __34__CNEnvironment_isKeychainEnabled__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[19];
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isKeychainEnabledImpl"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 152);
    *(_QWORD *)(v5 + 152) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  }
  return v3;
}

- (BOOL)isKeychainEnabledImpl
{
  return 1;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__CNEnvironment_setValue_forKey___block_invoke;
  v10[3] = &unk_1E29B9308;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  cn_runWithObjectLock(self, v10);

}

uint64_t __33__CNEnvironment_setValue_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (CNFileManager)fileManager
{
  return (CNFileManager *)objc_getProperty(self, a2, 16, 1);
}

- (CNUserDefaults)userDefaults
{
  return (CNUserDefaults *)objc_getProperty(self, a2, 24, 1);
}

- (CNFeatureFlags)featureFlags
{
  return (CNFeatureFlags *)objc_getProperty(self, a2, 32, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 56, 1);
}

- (NSDistributedNotificationCenter)distributedNotificationCenter
{
  return (NSDistributedNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (CNLocalizationServices)localizationServices
{
  return (CNLocalizationServices *)objc_getProperty(self, a2, 88, 1);
}

- (CNProbabilityUtility)probabilityUtility
{
  return (CNProbabilityUtility *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)mainBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isKeychainEnabledStorage, 0);
  objc_storeStrong((id *)&self->_isCommLimitsEnabledStorage, 0);
  objc_storeStrong((id *)&self->_isGreenTeaDeviceStorage, 0);
  objc_storeStrong((id *)&self->_isInternalBuildStorage, 0);
  objc_storeStrong((id *)&self->_defaultCountryCode, 0);
  objc_storeStrong((id *)&self->_mainBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_probabilityUtility, 0);
  objc_storeStrong((id *)&self->_localizationServices, 0);
  objc_storeStrong((id *)&self->_authorizationContext, 0);
  objc_storeStrong((id *)&self->_entitlementVerifier, 0);
  objc_storeStrong((id *)&self->_distributedNotificationCenter, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (_TtP18ContactsFoundation24CNKeychainFacadeProtocol_)keychainFacade
{
  CNEnvironment *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_18F879B68();

  return (_TtP18ContactsFoundation24CNKeychainFacadeProtocol_ *)v3;
}

@end
