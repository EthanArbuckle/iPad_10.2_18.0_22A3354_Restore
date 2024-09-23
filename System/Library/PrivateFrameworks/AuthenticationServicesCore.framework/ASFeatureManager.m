@implementation ASFeatureManager

+ (ASFeatureManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_12);
  return (ASFeatureManager *)(id)sharedManager_sharedInstance;
}

void __33__ASFeatureManager_sharedManager__block_invoke()
{
  ASFeatureManager *v0;
  void *v1;

  v0 = objc_alloc_init(ASFeatureManager);
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;

}

- (ASFeatureManager)init
{
  ASFeatureManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *internalQueue;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  WBSAutoFillQuirksManager *quirksManager;
  ASFeatureManager *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ASFeatureManager;
  v2 = -[ASFeatureManager init](&v15, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.AuthenticationServicesCore.ASFeatureManager", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc(MEMORY[0x24BE82CA8]);
    objc_msgSend(MEMORY[0x24BDD1488], "safari_safariCoreBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLForResource:withExtension:", CFSTR("WBSAutoFillQuirks"), CFSTR("plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_autoFillQuirksDownloadDirectoryURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "initWithBuiltInQuirksURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:", v8, v10, CFSTR("AutoFillQuirks"), CFSTR("1"), *MEMORY[0x24BE82FB0], 86400.0);
    quirksManager = v2->_quirksManager;
    v2->_quirksManager = (WBSAutoFillQuirksManager *)v11;

    -[WBSAutoFillQuirksManager setShouldAttemptToDownloadConfiguration:](v2->_quirksManager, "setShouldAttemptToDownloadConfiguration:", 0);
    -[WBSAutoFillQuirksManager beginLoadingQuirksFromDisk](v2->_quirksManager, "beginLoadingQuirksFromDisk");
    v13 = v2;

  }
  return v2;
}

- (BOOL)isAirDropPasswordsAvailable
{
  return objc_msgSend(MEMORY[0x24BE82CC8], "isAirDropPasswordsEnabled");
}

- (BOOL)isDeviceConfiguredToAllowPasskeys
{
  id v2;
  char v3;

  v2 = objc_alloc_init(MEMORY[0x24BDDA938]);
  v3 = objc_msgSend(v2, "canEvaluatePolicy:error:", 2, 0);

  return v3;
}

- (BOOL)arePasskeysDisallowedForRelyingParty:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[ASFeatureManager _shouldApplyPasskeyQuirks](self, "_shouldApplyPasskeyQuirks")
    && !-[ASFeatureManager shouldUseFallbackUIForRelyingParty:](self, "shouldUseFallbackUIForRelyingParty:", v4))
  {
    v5 = -[WBSAutoFillQuirksManager arePasskeysDisallowedForRelyingParty:](self->_quirksManager, "arePasskeysDisallowedForRelyingParty:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldUseFallbackUIForRelyingParty:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[ASFeatureManager _shouldApplyPasskeyQuirks](self, "_shouldApplyPasskeyQuirks"))
    v5 = -[WBSAutoFillQuirksManager shouldUseFallbackUIForRelyingParty:](self->_quirksManager, "shouldUseFallbackUIForRelyingParty:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isClientEntitledForInternalTestingWithAuditToken:(id *)a3
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x24BE82CC8], "isInternalInstall");
  if (v3)
    LOBYTE(v3) = WBSAuditTokenHasEntitlement();
  return v3;
}

- (BOOL)canRequestEnterpriseAttestationForRelyingParty:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ASFeatureManager _fetchCurrentManagedConfiguration](self, "_fetchCurrentManagedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isConfiguredForEnterpriseAttestationForRelyingParty:", v4);

  return v6;
}

- (id)entepriseAttestationIdentityPersistentReferenceForRelyingParty:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ASFeatureManager _fetchCurrentManagedConfiguration](self, "_fetchCurrentManagedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entepriseAttestationIdentityPersistentReferenceForRelyingParty:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)shouldAllowAddingNewPasswords
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getWBUFeatureManagerClass_softClass;
  v9 = getWBUFeatureManagerClass_softClass;
  if (!getWBUFeatureManagerClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getWBUFeatureManagerClass_block_invoke;
    v5[3] = &unk_24C97FA20;
    v5[4] = &v6;
    __getWBUFeatureManagerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_msgSend(v3, "shouldAllowAddingNewPasswords");
}

- (BOOL)_shouldApplyPasskeyQuirks
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DisablePasskeysSiteSpecificHacks")) ^ 1;

  return v3;
}

- (id)_fetchCurrentManagedConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v9;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "as_authenticationServicesManagedConfigurationURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  +[ASManagedConfiguration loadFromDiskWithPlistURL:error:](_TtC26AuthenticationServicesCore22ASManagedConfiguration, "loadFromDiskWithPlistURL:error:", v3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ASFeatureManager _fetchCurrentManagedConfiguration].cold.1(v7, v5);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quirksManager, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)_fetchCurrentManagedConfiguration
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
  _os_log_fault_impl(&dword_20E648000, v3, OS_LOG_TYPE_FAULT, "Could not not load managed configuration: %{public}@.", (uint8_t *)&v5, 0xCu);

}

@end
