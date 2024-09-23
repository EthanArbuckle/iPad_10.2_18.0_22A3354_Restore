@implementation MCManagedPreferencesManager

+ (id)managedPreferencesPathForDomain:(id)a3
{
  return (id)_CFPreferencesCopyPathForManagedDomain();
}

+ (id)managedPreferencesForDomain:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(a1, "managedPreferencesPathForDomain:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)setManagedPreferences:(id)a3 forDomain:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count"))
  {
    v7 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_DEFAULT, "MCManagedPreferencesManager removing managed preferences for domain: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  v8 = _CFPreferencesWriteManagedDomain() != 0;

  return v8;
}

+ (BOOL)addManagedPreferences:(id)a3 toDomain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "managedPreferencesForDomain:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  objc_msgSend(v12, "addEntriesFromDictionary:", v7);
  v13 = objc_msgSend(a1, "setManagedPreferences:forDomain:", v12, v6);

  return v13;
}

+ (BOOL)removeManagedPreferences:(id)a3 fromDomain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "managedPreferencesForDomain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (v9)
  {
    objc_msgSend(v9, "removeObjectsForKeys:", v6);
    v10 = objc_msgSend(a1, "setManagedPreferences:forDomain:", v9, v7);
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

+ (void)sendManagedPreferencesChangedNotificationForDomains:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    _CFPreferencesManagementStatusChangedForDomains();
    _CFPreferencesPostValuesChangedInDomains();
  }

}

+ (id)globalManagedPreferencesDomain
{
  return CFSTR(".GlobalPreferences");
}

+ (void)updateGlobalManagedPreferencesByAddingPreferences:(id)a3 removingPreferences:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(a1, "globalManagedPreferencesDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCManagedPreferencesManager addManagedPreferences:toDomain:](MCManagedPreferencesManager, "addManagedPreferences:toDomain:", v6, v8);

    if (!objc_msgSend(v7, "count"))
      goto LABEL_6;
    goto LABEL_5;
  }
  if (objc_msgSend(v7, "count"))
  {
LABEL_5:
    objc_msgSend(a1, "globalManagedPreferencesDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCManagedPreferencesManager removeManagedPreferences:fromDomain:](MCManagedPreferencesManager, "removeManagedPreferences:fromDomain:", v7, v9);

LABEL_6:
    objc_msgSend(a1, "globalManagedPreferencesDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sendManagedPreferencesChangedNotificationForDomains:", v11);

  }
}

@end
