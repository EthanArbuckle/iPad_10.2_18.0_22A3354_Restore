@implementation AACloudPolicyRestrictions

+ (id)_managedIcloudPolicyIdentifierForDataclass
{
  if (_managedIcloudPolicyIdentifierForDataclass_onceToken != -1)
    dispatch_once(&_managedIcloudPolicyIdentifierForDataclass_onceToken, &__block_literal_global_6);
  return (id)_managedIcloudPolicyIdentifierForDataclass_iCloudPolicyIdentifiersDictionary;
}

void __71__AACloudPolicyRestrictions__managedIcloudPolicyIdentifierForDataclass__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("DisableBookmarksiCloudSetting"), *MEMORY[0x1E0C8EE20]);
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("DisableFMMiCloudSetting"), *MEMORY[0x1E0C8EE78]);
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("DisableAddressBookiCloudSetting"), *MEMORY[0x1E0C8EE68]);
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("DisableCalendariCloudSetting"), *MEMORY[0x1E0C8EE58]);
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("DisableMailiCloudSetting"), *MEMORY[0x1E0C8EEB0]);
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("DisableNotesiCloudSetting"), *MEMORY[0x1E0C8EED8]);
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("DisableRemindersiCloudSetting"), *MEMORY[0x1E0C8EEF8]);
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("DisableKeychainCloudSync"), *MEMORY[0x1E0C8EEA8]);
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("DisableCloudSync"), *MEMORY[0x1E0C8EF28]);
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("DisablePhotosiCloudSetting"), *MEMORY[0x1E0C8EEE8]);
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("DisableFreeformiCloudSetting"), *MEMORY[0x1E0C8EE88]);
  v1 = (void *)_managedIcloudPolicyIdentifierForDataclass_iCloudPolicyIdentifiersDictionary;
  _managedIcloudPolicyIdentifierForDataclass_iCloudPolicyIdentifiersDictionary = (uint64_t)v0;

}

+ (id)_policyRestrictionIdentifierForDataclass:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[AACloudPolicyRestrictions _managedIcloudPolicyIdentifierForDataclass](AACloudPolicyRestrictions, "_managedIcloudPolicyIdentifierForDataclass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)policyRestrictsDataclass:(id)a3
{
  id v3;
  const __CFString *v4;
  __CFString *v5;
  int AppBooleanValue;
  BOOL v7;
  NSObject *v8;

  v3 = a3;
  +[AACloudPolicyRestrictions _policyRestrictionIdentifierForDataclass:](AACloudPolicyRestrictions, "_policyRestrictionIdentifierForDataclass:", v3);
  v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  v5 = (__CFString *)v4;
  if (v4)
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(v4, CFSTR("com.apple.icloud.managed"), 0);
    v7 = AppBooleanValue != 0;
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[AACloudPolicyRestrictions policyRestrictsDataclass:].cold.2((uint64_t)v3, AppBooleanValue != 0, v8);
  }
  else
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[AACloudPolicyRestrictions policyRestrictsDataclass:].cold.1((uint64_t)v3, v8);
    v7 = 0;
  }

  return v7;
}

+ (void)policyRestrictsDataclass:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19EACA000, a2, OS_LOG_TYPE_DEBUG, "Policy identifier does not exist for %@", (uint8_t *)&v2, 0xCu);
}

+ (void)policyRestrictsDataclass:(os_log_t)log .cold.2(uint64_t a1, char a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("YES");
  if ((a2 & 1) == 0)
    v3 = CFSTR("NO");
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_19EACA000, log, OS_LOG_TYPE_DEBUG, "Policy restriction for %@ is %@", (uint8_t *)&v4, 0x16u);
}

@end
