@implementation _EXDefaults

- (NSSet)plistTypes
{
  if (plistTypes_onceToken != -1)
    dispatch_once(&plistTypes_onceToken, &__block_literal_global_12);
  return (NSSet *)(id)plistTypes_plistTypes;
}

- (NSSet)errorTypes
{
  if (errorTypes_onceToken != -1)
    dispatch_once(&errorTypes_onceToken, &__block_literal_global_2);
  return (NSSet *)(id)errorTypes_errorTypes;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_14);
  return (id)sharedInstance_defaults;
}

- (BOOL)inProcessLaunch
{
  return _os_feature_enabled_impl();
}

- (BOOL)forceSandbox
{
  return _os_feature_enabled_impl();
}

- (BOOL)disableLaunchdCheckinTimeout
{
  return _os_feature_enabled_impl();
}

- (NSString)defaultSandboxProfileName
{
  return (NSString *)CFSTR("plugin");
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EXDefaults;
  return -[_EXDefaults init](&v3, sel_init);
}

- (BOOL)platformShouldExhibitEmbeddedBehavior
{
  return 1;
}

- (BOOL)appleInternal
{
  if (appleInternal_once != -1)
    dispatch_once(&appleInternal_once, &__block_literal_global_54);
  return appleInternal_appleInternal;
}

- (BOOL)useItemProviderXPCConnection
{
  if (useItemProviderXPCConnection_onceToken != -1)
    dispatch_once(&useItemProviderXPCConnection_onceToken, &__block_literal_global_62);
  return useItemProviderXPCConnection_value;
}

- (NSSet)extensionItemTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33___EXDefaults_extensionItemTypes__block_invoke;
  block[3] = &unk_1E2CFC438;
  block[4] = self;
  if (extensionItemTypes_onceToken != -1)
    dispatch_once(&extensionItemTypes_onceToken, block);
  return (NSSet *)(id)extensionItemTypes_types;
}

- (BOOL)queryAllowsDuplicates
{
  return _os_feature_enabled_impl();
}

- (BOOL)preferInProcessDiscovery
{
  if (preferInProcessDiscovery_onceToken != -1)
    dispatch_once(&preferInProcessDiscovery_onceToken, &__block_literal_global_58);
  return preferInProcessDiscovery_value;
}

- (BOOL)implementsNSExtension
{
  return 1;
}

- (BOOL)queryPredicatesEvaluatedOutOfProcess
{
  return 0;
}

- (NSSet)plistAndValueTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33___EXDefaults_plistAndValueTypes__block_invoke;
  block[3] = &unk_1E2CFC438;
  block[4] = self;
  if (plistAndValueTypes_onceToken != -1)
    dispatch_once(&plistAndValueTypes_onceToken, block);
  return (NSSet *)(id)plistAndValueTypes_types;
}

- (NSSet)itemProviderTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32___EXDefaults_itemProviderTypes__block_invoke;
  block[3] = &unk_1E2CFC438;
  block[4] = self;
  if (itemProviderTypes_onceToken != -1)
    dispatch_once(&itemProviderTypes_onceToken, block);
  return (NSSet *)(id)itemProviderTypes_types;
}

- (NSSet)imageTypes
{
  if (imageTypes_onceToken != -1)
    dispatch_once(&imageTypes_onceToken, &__block_literal_global_51);
  return (NSSet *)(id)imageTypes_types;
}

- (BOOL)useLSDExtensionKitServiceForDiscovery
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportExtensionKitConfigPath
{
  return 1;
}

- (BOOL)hostRequiresEntitlements
{
  return _os_feature_enabled_impl();
}

- (BOOL)enforceLegacyExtensionPointAllowList
{
  return 1;
}

- (BOOL)allowPrototypeAPI
{
  return _os_feature_enabled_impl();
}

- (BOOL)allowPrototypeSPI
{
  return _os_feature_enabled_impl();
}

- (BOOL)assertOnDisallowedPrototypeAPIUse
{
  return _os_feature_enabled_impl();
}

- (BOOL)assertOnDisallowedPrototypeSPIUse
{
  return _os_feature_enabled_impl();
}

- (BOOL)startUIHostingSessionImmediately
{
  return 0;
}

- (NSSet)alwaysEnabledExtensionBundleIdentifiers
{
  if (alwaysEnabledExtensionBundleIdentifiers_onceToken != -1)
    dispatch_once(&alwaysEnabledExtensionBundleIdentifiers_onceToken, &__block_literal_global_70);
  return (NSSet *)(id)alwaysEnabledExtensionBundleIdentifiers_alwaysEnabled;
}

- (BOOL)enforceXPCCacheCodeSigning
{
  char v2;
  BOOL v3;
  NSObject *v4;
  uint8_t v6[16];

  if (enforceXPCCacheCodeSigning_onceToken != -1)
    dispatch_once(&enforceXPCCacheCodeSigning_onceToken, &__block_literal_global_81);
  v2 = _os_feature_enabled_impl();
  if (enforceXPCCacheCodeSigning_codeSigningEnforcementIsDisabled)
    v3 = 0;
  else
    v3 = v2;
  if (!v3)
  {
    _EXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_190C25000, v4, OS_LOG_TYPE_DEFAULT, "XPC extension point cache code signing will not be enforced", v6, 2u);
    }

  }
  return v3;
}

- (NSSet)allowedUnsandboxedExtensionPoints
{
  id v2;

  if (_os_feature_enabled_impl())
  {
    if (allowedUnsandboxedExtensionPoints_onceToken != -1)
      dispatch_once(&allowedUnsandboxedExtensionPoints_onceToken, &__block_literal_global_85);
    v2 = (id)allowedUnsandboxedExtensionPoints_allowList;
  }
  else
  {
    v2 = (id)objc_opt_new();
  }
  return (NSSet *)v2;
}

@end
