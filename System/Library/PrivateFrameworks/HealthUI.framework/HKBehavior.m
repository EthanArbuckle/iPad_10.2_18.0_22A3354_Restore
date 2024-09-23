@implementation HKBehavior

void __50___HKBehavior_HealthUI__hkui_isRunningInHealthApp__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  hkui_isRunningInHealthApp_isRunningInHealthApp = objc_msgSend(v0, "isEqualToString:", *MEMORY[0x1E0CB7630]);

}

void __55___HKBehavior_HealthUI__hkui_isRunningInPreferencesApp__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  hkui_isRunningInPreferencesApp_isRunningInPreferencesApp = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Preferences"));

}

void __44___HKBehavior_HealthUI__hkui_isRunningInApp__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "objectForKey:", CFSTR("CFBundlePackageType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  hkui_isRunningInApp_isRunningInApp = objc_msgSend(v1, "isEqualToString:", CFSTR("APPL"));

}

@end
