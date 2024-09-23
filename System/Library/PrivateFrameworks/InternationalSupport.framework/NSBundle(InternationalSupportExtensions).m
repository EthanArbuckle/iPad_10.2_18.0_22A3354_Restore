@implementation NSBundle(InternationalSupportExtensions)

- (id)localizedStringInDeviceLanguageForKey:()InternationalSupportExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (localizedStringInDeviceLanguageForKey__onceToken != -1)
    dispatch_once(&localizedStringInDeviceLanguageForKey__onceToken, &__block_literal_global);
  os_unfair_lock_lock((os_unfair_lock_t)&localizedStringInDeviceLanguageForKey__lock);
  objc_msgSend((id)localizedStringInDeviceLanguageForKey____sharedPreferredLocalizationCache, "objectForKey:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "_globalPreferredLanguages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(a1, "localizations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredLocalizationsFromArray:forPreferences:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)localizedStringInDeviceLanguageForKey____sharedPreferredLocalizationCache, "setObject:forKey:", v5, a1);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&localizedStringInDeviceLanguageForKey__lock);
  objc_msgSend(a1, "localizedStringForKey:value:table:localization:", v4, 0, 0, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
