@implementation WBSPrivateBrowsingExplanationConfiguration(SafariServicesExtras)

+ (id)defaultConfiguration
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0D8AB10]);
  if (deviceSupportedBiometryType_onceToken != -1)
    dispatch_once(&deviceSupportedBiometryType_onceToken, &__block_literal_global_67);
  objc_msgSend(v0, "setBiometryType:", deviceSupportedBiometryType_deviceSupportedBiometryType);
  +[_SFManagedFeatureObserver sharedObserver](_SFManagedFeatureObserver, "sharedObserver");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setUserHasPassword:", objc_msgSend(v1, "doesUserHavePasscodeSet"));

  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setPrivacyProxyAvailabilityManager:", v2);

  +[_SFSearchEngineController sharedInstance](_SFSearchEngineController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultSearchEngineForPrivateBrowsing:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setPrivateBrowsingSearchEngine:", v4);

  return v0;
}

@end
