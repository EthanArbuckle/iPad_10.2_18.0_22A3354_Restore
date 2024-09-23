@implementation ACAccount(CalAdditions)

- (BOOL)calIsMissingParentAccount
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "authenticationType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F350]))
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)calIsEnabledForCalendar
{
  return objc_msgSend(a1, "_dataclassIsEnabled:", *MEMORY[0x1E0C8F378]);
}

- (uint64_t)_dataclassIsEnabled:()CalAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "parentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "parentAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enabledDataclasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "enabledDataclasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v8 = objc_msgSend(v7, "containsObject:", v4);
  return v8;
}

- (uint64_t)calIsEnabledForReminders
{
  return objc_msgSend(a1, "_dataclassIsEnabled:", *MEMORY[0x1E0C8F400]);
}

- (id)calServerURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (!objc_msgSend(a1, "calIsCalDAVAccount"))
  {
    if (objc_msgSend(a1, "calIsExchangeAccount"))
    {
      objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF68]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
LABEL_11:
    v5 = 0;
    return v5;
  }
  objc_msgSend(a1, "calHostname");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_schemeStringForUseSSL:", objc_msgSend(a1, "calUseSSL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "calPort");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "CDVDefaultPortForScheme:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v2, "length") || !v3 || !v4)
  {

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "CDVURLWithScheme:host:port:path:", v3, v2, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)calIsCalDAVAccount
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "accountType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F058]);

  return v3;
}

- (id)calHostname
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;

  if (objc_msgSend(a1, "calIsCalDAVAccount"))
  {
    objc_msgSend(a1, "valueForAccountPropertyKey:", *MEMORY[0x1E0C8EF90]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          -[ACAccount(CalAdditions) calHostname].cold.1((uint64_t)v2, a1);

        v4 = 0;
        goto LABEL_12;
      }
    }
    v3 = v2;
LABEL_7:
    v4 = v3;
LABEL_12:

    return v4;
  }
  if (objc_msgSend(a1, "calIsExchangeAccount"))
  {
    objc_msgSend(a1, "calServerURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "host");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v4 = 0;
  return v4;
}

- (id)valueForAccountPropertyKey:()CalAdditions
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(a1, "calIsExchangeAccount") & 1) != 0
    || (objc_msgSend(a1, "_calDAVDataclassProperties"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsObject:", v4),
        v5,
        v6))
  {
    objc_msgSend(a1, "propertiesForDataclass:", *MEMORY[0x1E0C8F378]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(a1, "calIsCalDAVAccount"))
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)calUseSSL
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(a1, "calIsCalDAVAccount"))
  {
    objc_msgSend(a1, "valueForAccountPropertyKey:", *MEMORY[0x1E0C8F000]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    if (!objc_msgSend(a1, "calIsExchangeAccount"))
      return 0;
    objc_msgSend(a1, "calServerURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(a1, "_useSSLForSchemeString:", v4);

  }
  return v3;
}

- (__CFString)_schemeStringForUseSSL:()CalAdditions
{
  if (a3)
    return CFSTR("https");
  else
    return CFSTR("http");
}

- (id)calPort
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "calIsCalDAVAccount"))
  {
    objc_msgSend(a1, "valueForAccountPropertyKey:", *MEMORY[0x1E0C8EFD8]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(a1, "calIsExchangeAccount"))
  {
    objc_msgSend(a1, "calServerURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "port");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)valueForKey:()CalAdditions forPrincipalWithUID:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "calPrincipals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)calPrincipals
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "valueForAccountPropertyKey:", CFSTR("CalDAVPrincipals"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (uint64_t)calMainPrincipalUID
{
  return objc_msgSend(a1, "valueForAccountPropertyKey:", CFSTR("CalDAVMainPrincipalUID"));
}

- (uint64_t)calIsExchangeAccount
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "accountType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F080]);

  return v3;
}

- (uint64_t)calIsEnabled
{
  if ((objc_msgSend(a1, "calIsEnabledForCalendar") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "calIsEnabledForReminders");
}

- (uint64_t)calUseKerberos
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForAccountPropertyKey:", CFSTR("kCalDAVUseKerberos"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)calRefreshInterval
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "valueForAccountPropertyKey:", CFSTR("kCalDAVRefreshIntervalKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 900;

  return v3;
}

- (uint64_t)calPushDisabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForAccountPropertyKey:", CFSTR("kCalDAVPushDisabled"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)calCollectionSetName
{
  return objc_msgSend(a1, "valueForAccountPropertyKey:", CFSTR("kCalDAVCollectionSetName"));
}

- (uint64_t)calWebServicesRecordGUID
{
  return objc_msgSend(a1, "valueForAccountPropertyKey:", CFSTR("kCalDAVWebServicesRecordGUID"));
}

- (id)calCalDAVChildAccounts
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "childAccounts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "CalFilter:", &__block_literal_global_33);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)calIsAutoRefreshed
{
  return objc_msgSend(a1, "calRefreshInterval") > 0;
}

- (uint64_t)calIsGenericCalDAVAccount
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = 0;
  else
    v3 = objc_msgSend(a1, "calIsCalDAVAccount");

  return v3;
}

- (BOOL)calIsRestrictedForCalendar
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  const __CFBoolean *v9;
  const __CFBoolean *v10;
  CFTypeID v11;
  _BOOL8 v12;

  objc_msgSend(a1, "parentAccount");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (void *)v2;
  else
    v4 = a1;
  v5 = v4;

  objc_msgSend(v5, "accountType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  if (!v8)
    return 0;
  v9 = (const __CFBoolean *)CFPreferencesCopyAppValue(CFSTR("DisableCalendariCloudSetting"), CFSTR("com.apple.icloud.managed"));
  if (!v9)
    return 0;
  v10 = v9;
  v11 = CFGetTypeID(v9);
  v12 = v11 == CFBooleanGetTypeID() && CFBooleanGetValue(v10) != 0;
  CFRelease(v10);
  return v12;
}

- (id)calAccountFullName
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "calMainPrincipalUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForKey:forPrincipalWithUID:", CFSTR("FullName"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCalHostname:()CalAdditions
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  if (!objc_msgSend(a1, "calIsCalDAVAccount"))
  {
    if (!objc_msgSend(a1, "calIsExchangeAccount"))
      goto LABEL_10;
    objc_msgSend(a1, "calServerURL");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_updateURL:withHost:port:useSSL:", v5, v4, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setCalServerURL:", v6);

LABEL_9:
    goto LABEL_10;
  }
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ACAccount(CalAdditions) setCalHostname:].cold.1(a1, (uint64_t)v4, v5);
      goto LABEL_9;
    }
  }
  objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:", v4, *MEMORY[0x1E0C8EF90]);
LABEL_10:

}

- (uint64_t)setCalIsEnabledForCalendar:()CalAdditions
{
  return objc_msgSend(a1, "_setIsEnabled:forDataclass:", a3, *MEMORY[0x1E0C8F378]);
}

- (uint64_t)setCalIsEnabledForReminders:()CalAdditions
{
  uint64_t result;

  result = CalIsReminderBridgeEnabled();
  if ((result & 1) == 0)
    return objc_msgSend(a1, "_setIsEnabled:forDataclass:", a3, *MEMORY[0x1E0C8F400]);
  return result;
}

- (void)setCalMainPrincipalUID:()CalAdditions
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:", v4, CFSTR("CalDAVMainPrincipalUID"));
  objc_msgSend(a1, "createDictionaryForPrincipalWithUID:", v4);

}

- (void)setCalPort:()CalAdditions
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(a1, "calIsCalDAVAccount"))
  {
    objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:", v6, *MEMORY[0x1E0C8EFD8]);
  }
  else if (objc_msgSend(a1, "calIsExchangeAccount"))
  {
    objc_msgSend(a1, "calServerURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_updateURL:withHost:port:useSSL:", v4, 0, v6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setCalServerURL:", v5);

  }
}

- (uint64_t)setCalPrincipals:()CalAdditions
{
  return objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:", a3, CFSTR("CalDAVPrincipals"));
}

- (void)setCalPushDisabled:()CalAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:", v2, CFSTR("kCalDAVPushDisabled"));

}

- (void)setCalRefreshInterval:()CalAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:", v2, CFSTR("kCalDAVRefreshIntervalKey"));

}

- (void)setCalServerURL:()CalAdditions
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(a1, "calIsCalDAVAccount"))
  {
    objc_msgSend(v7, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setCalHostname:", v4);

    objc_msgSend(v7, "port");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setCalPort:", v5);

    objc_msgSend(v7, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setCalUseSSL:", objc_msgSend(a1, "_useSSLForSchemeString:", v6));

  }
  else if (objc_msgSend(a1, "calIsExchangeAccount"))
  {
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C8EF68]);
  }

}

- (void)setCalUseSSL:()CalAdditions
{
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(a1, "calIsCalDAVAccount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:");
  }
  else
  {
    if (!objc_msgSend(a1, "calIsExchangeAccount"))
      return;
    objc_msgSend(a1, "calServerURL");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_updateURL:withHost:port:useSSL:", v7, 0, 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setCalServerURL:", v6);

  }
}

- (uint64_t)calSupportsPush
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPushSupportedForAccount:", a1);

  return v3;
}

- (uint64_t)calLocalDataMigrationHasTakenPlace
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForAccountPropertyKey:", CFSTR("CalAccountPropertyCalDAVLocalDataMigrationHasTakenPlace"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)calServerSyncHasTakenPlace
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForAccountPropertyKey:", CFSTR("CalAccountPropertyCalDAVSyncHasTakenPlace"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)calAttachmentDownloadHasTakenPlace
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForAccountPropertyKey:", CFSTR("CalAccountPropertyCalDAVAttachmentDownloadHasTakenPlace"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)calSkipCredentialVerification
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForAccountPropertyKey:", CFSTR("CalAccountPropertyCalDAVSkipCredentialVerification"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)setCalCollectionSetName:()CalAdditions
{
  return objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:", a3, CFSTR("kCalDAVCollectionSetName"));
}

- (void)setCalLocalDataMigrationHasTakenPlace:()CalAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:", v2, CFSTR("CalAccountPropertyCalDAVLocalDataMigrationHasTakenPlace"));

}

- (void)setCalServerSyncHasTakenPlace:()CalAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:", v2, CFSTR("CalAccountPropertyCalDAVSyncHasTakenPlace"));

}

- (void)setCalAttachmentDownloadHasTakenPlace:()CalAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:", v2, CFSTR("CalAccountPropertyCalDAVAttachmentDownloadHasTakenPlace"));

}

- (void)setCalSkipCredentialVerification:()CalAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:", v2, CFSTR("CalAccountPropertyCalDAVSkipCredentialVerification"));

}

- (void)setCalUseKerberos:()CalAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:", v2, CFSTR("kCalDAVUseKerberos"));

}

- (uint64_t)setCalWebServicesRecordGUID:()CalAdditions
{
  return objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:", a3, CFSTR("kCalDAVWebServicesRecordGUID"));
}

- (uint64_t)calIsiCloudCalDAVAccount
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a1, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F058]);

  if (!v4)
    return 0;
  objc_msgSend(a1, "parentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "accountType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)calExchangeWebServicesURL
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "calServerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_createExchangeWebServicesURLFromURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)calExternalExchangeWebServicesURL
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "calExternalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_createExchangeWebServicesURLFromURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)calExternalURL
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF60]);
}

- (uint64_t)calIdentityEmailAddress
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFB0]);
}

- (uint64_t)calIsDirty
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend(a1, "isDirty") & 1) != 0)
    return 1;
  objc_msgSend(a1, "dirtyAccountProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "count") != 0;

  return v2;
}

- (uint64_t)calRootFolderID
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF70]);
}

- (uint64_t)calUseExternalURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForAccountPropertyKey:", CFSTR("CalAccountPropertyExchangeUseExternalURL"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)setCalExternalURL:()CalAdditions
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0C8EF60]);
}

- (uint64_t)setCalIdentityEmailAddress:()CalAdditions
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0C8EFB0]);
}

- (uint64_t)setCalRootFolderID:()CalAdditions
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0C8EF70]);
}

- (void)setCalUseExternalURL:()CalAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:", v2, CFSTR("CalAccountPropertyExchangeUseExternalURL"));

}

- (void)addPrincipal:()CalAdditions withUID:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "length"))
  {
    v9 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(a1, "calPrincipals");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v8);
    objc_msgSend(a1, "setCalPrincipals:", v11);

  }
  else
  {
    +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ACAccount(CalAdditions) addPrincipal:withUID:].cold.1();

  }
}

- (id)calPrincipalURLForMainPrincipal
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "calMainPrincipalUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "calPrincipalURLForPrincipalWithUID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)calPrincipalURLForPrincipalWithUID:()CalAdditions
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "valueForKey:forPrincipalWithUID:", CFSTR("PrincipalPath"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "calServerURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v4, "length"))
  {
    objc_msgSend(v5, "CDVURLWithPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)createDictionaryForPrincipalWithUID:()CalAdditions
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "calPrincipals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(a1, "addPrincipal:withUID:", MEMORY[0x1E0C9AA70], v6);

}

- (uint64_t)diffWithAccount:()CalAdditions
{
  return objc_msgSend(a1, "_diffWithAccount:firstPropertyOnly:", a3, 0);
}

- (id)firstDifferentPropertyWithAccount:()CalAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_diffWithAccount:firstPropertyOnly:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)removeAccountPropertyForKey:()CalAdditions
{
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((objc_msgSend(a1, "calIsExchangeAccount") & 1) != 0
    || (objc_msgSend(a1, "_calDAVDataclassProperties"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "containsObject:", v12),
        v4,
        v5))
  {
    v6 = *MEMORY[0x1E0C8F378];
    objc_msgSend(a1, "propertiesForDataclass:", *MEMORY[0x1E0C8F378]);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(a1, "propertiesForDataclass:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionaryWithDictionary:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "removeObjectForKey:", v12);
        objc_msgSend(a1, "setProperties:forDataclass:", v11, v6);

      }
    }
  }
  else if (objc_msgSend(a1, "calIsCalDAVAccount"))
  {
    objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, v12);
  }

}

- (BOOL)removePrincipalWithUID:()CalAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "calPrincipals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(a1, "calPrincipals");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "removeObjectForKey:", v4);
    objc_msgSend(a1, "setCalPrincipals:", v9);

  }
  return v6 != 0;
}

- (uint64_t)setValue:()CalAdditions forKey:forPrincipalWithUID:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(a1, "valueForKey:forPrincipalWithUID:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v8);

    if (!v12)
    {
      objc_msgSend(a1, "createDictionaryForPrincipalWithUID:", v10);
      v15 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(a1, "calPrincipals");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dictionaryWithDictionary:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setObject:forKeyedSubscript:", v8, v9);
      objc_msgSend(a1, "addPrincipal:withUID:", v18, v10);

      v14 = 1;
      goto LABEL_9;
    }
    +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412802;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = a1;
      _os_log_impl(&dword_18FC12000, v13, OS_LOG_TYPE_DEFAULT, "Attempting to set %@ on principal with UID %@ by using its current value. This is a no-op change, and we won't dirty the account by making it. %@", (uint8_t *)&v20, 0x20u);
    }
  }
  else
  {
    +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v20 = 138412802;
      v21 = v8;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = a1;
      _os_log_error_impl(&dword_18FC12000, v13, OS_LOG_TYPE_ERROR, "Attempting to set %@ on principal with UID %@ by using a nil key. %@", (uint8_t *)&v20, 0x20u);
    }
  }

  v14 = 0;
LABEL_9:

  return v14;
}

- (id)calSyncingAccountUsingChildAccounts:()CalAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncableDataclasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C8F378];
  v8 = objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0C8F378]);

  if (v8)
  {
    v9 = a1;
  }
  else
  {
    if (!v4)
    {
      objc_msgSend(a1, "childAccounts");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = v4;
    v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v4);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v14, "accountType", (_QWORD)v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "syncableDataclasses");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsObject:", v7);

          if ((v17 & 1) != 0)
          {
            v9 = v14;

            goto LABEL_17;
          }
        }
        v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
          continue;
        break;
      }
    }

    +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ACAccount(CalAdditions) calSyncingAccountUsingChildAccounts:].cold.1(a1);

    v9 = 0;
  }
LABEL_17:

  return v9;
}

- (id)_accountPropertiesKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (objc_msgSend(a1, "calIsCalDAVAccount"))
  {
    v2 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(a1, "_calDAVDataclassProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "arrayWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "accountProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
  else
  {
    if (!objc_msgSend(a1, "calIsExchangeAccount"))
    {
LABEL_7:
      v8 = 0;
      return v8;
    }
    objc_msgSend(a1, "propertiesForDataclass:", *MEMORY[0x1E0C8F378]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v5)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_createExchangeWebServicesURLFromURL:()CalAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    goto LABEL_2;
  objc_msgSend(a1, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  v6 = v4;
  if (!v9)
    goto LABEL_4;
  objc_msgSend(v4, "resourceSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "hasPrefix:", CFSTR("//")))
  {
LABEL_2:
    v6 = v4;
  }
  else
  {
    objc_msgSend(v4, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "username");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLUserAllowedCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "substringFromIndex:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@@%@"), v10, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_4:

  return v6;
}

- (id)_diffWithAccount:()CalAdditions firstPropertyOnly:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_diffAccountPropertiesWithAccount:firstPropertyOnly:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  if (!objc_msgSend(v7, "count") || (a4 & 1) == 0)
  {
    objc_msgSend(a1, "_diffPropertiesWithAccount:firstPropertyOnly:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", v9);

  }
  return v7;
}

- (id)_diffAccountPropertiesWithAccount:()CalAdditions firstPropertyOnly:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accountPropertiesKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  objc_msgSend(v6, "_accountPropertiesKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v9);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(a1, "valueForAccountPropertyKey:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForAccountPropertyKey:", v15);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v16 | v17)
        {
          if ((objc_msgSend((id)v16, "isEqual:", v17) & 1) == 0)
          {
            objc_msgSend(v19, "addObject:", v15);
            if (a4)
            {

              goto LABEL_13;
            }
          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_13:

  return v19;
}

- (id)_diffPropertiesWithAccount:()CalAdditions firstPropertyOnly:
{
  void *v4;
  id v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  int v54;
  id v55;
  _QWORD v57[4];
  id v58;
  uint64_t *v59;
  char v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 1;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __72__ACAccount_CalAdditions___diffPropertiesWithAccount_firstPropertyOnly___block_invoke;
  v57[3] = &unk_1E2A85950;
  v59 = &v61;
  v9 = v8;
  v58 = v9;
  v60 = a4;
  v10 = (void (**)(_QWORD))MEMORY[0x19400A168](v57);
  if (*((_BYTE *)v62 + 24))
  {
    objc_msgSend(a1, "accountDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v7, "accountDescription"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "accountDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v11)
      {

        if ((v14 & 1) != 0)
          goto LABEL_9;
        goto LABEL_8;
      }

      if ((v14 & 1) == 0)
      {
LABEL_8:
        objc_msgSend(v9, "addObject:", CFSTR("accountDescription"));
        v10[2](v10);
      }
    }
  }
LABEL_9:
  if (*((_BYTE *)v62 + 24))
  {
    v15 = objc_msgSend(a1, "isActive");
    if (v15 != objc_msgSend(v7, "isActive"))
    {
      objc_msgSend(v9, "addObject:", CFSTR("active"));
      v10[2](v10);
    }
  }
  if (*((_BYTE *)v62 + 24))
  {
    v16 = objc_msgSend(a1, "isAuthenticated");
    if (v16 != objc_msgSend(v7, "isAuthenticated"))
    {
      objc_msgSend(v9, "addObject:", CFSTR("authenticated"));
      v10[2](v10);
    }
  }
  if (*((_BYTE *)v62 + 24))
  {
    objc_msgSend(a1, "credential");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 || (objc_msgSend(v7, "credential"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "credential");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "credential");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (v17)
      {

        if ((v20 & 1) != 0)
          goto LABEL_23;
        goto LABEL_22;
      }

      if ((v20 & 1) == 0)
      {
LABEL_22:
        objc_msgSend(v9, "addObject:", CFSTR("credential"));
        v10[2](v10);
      }
    }
  }
LABEL_23:
  if (*((_BYTE *)v62 + 24))
  {
    objc_msgSend(a1, "enabledDataclasses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 || (objc_msgSend(v7, "enabledDataclasses"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "enabledDataclasses");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "enabledDataclasses");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (v21)
      {

        if ((v24 & 1) != 0)
          goto LABEL_31;
        goto LABEL_30;
      }

      if ((v24 & 1) == 0)
      {
LABEL_30:
        objc_msgSend(v9, "addObject:", CFSTR("enabledDataclasses"));
        v10[2](v10);
      }
    }
  }
LABEL_31:
  if (*((_BYTE *)v62 + 24))
  {
    objc_msgSend(a1, "provisionedDataclasses");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 || (objc_msgSend(v7, "provisionedDataclasses"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "provisionedDataclasses");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "provisionedDataclasses");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if (v25)
      {

        if ((v28 & 1) != 0)
          goto LABEL_39;
        goto LABEL_38;
      }

      if ((v28 & 1) == 0)
      {
LABEL_38:
        objc_msgSend(v9, "addObject:", CFSTR("provisionedDataclasses"));
        v10[2](v10);
      }
    }
  }
LABEL_39:
  if (*((_BYTE *)v62 + 24))
  {
    objc_msgSend(a1, "username");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 || (objc_msgSend(v7, "username"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "username");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "username");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (v29)
      {

        if ((v32 & 1) != 0)
          goto LABEL_47;
        goto LABEL_46;
      }

      if ((v32 & 1) == 0)
      {
LABEL_46:
        objc_msgSend(v9, "addObject:", CFSTR("username"));
        v10[2](v10);
      }
    }
  }
LABEL_47:
  if (*((_BYTE *)v62 + 24))
  {
    v33 = objc_msgSend(a1, "isVisible");
    if (v33 != objc_msgSend(v7, "isVisible"))
    {
      objc_msgSend(v9, "addObject:", CFSTR("visible"));
      v10[2](v10);
    }
  }
  if (*((_BYTE *)v62 + 24))
  {
    objc_msgSend(a1, "accountType");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34 || (objc_msgSend(v7, "accountType"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "accountType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountType");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqual:", v36);

      if (v34)
      {

        if ((v37 & 1) != 0)
          goto LABEL_58;
        goto LABEL_57;
      }

      if ((v37 & 1) == 0)
      {
LABEL_57:
        objc_msgSend(v9, "addObject:", CFSTR("accountType"));
        v10[2](v10);
      }
    }
  }
LABEL_58:
  if (*((_BYTE *)v62 + 24))
  {
    objc_msgSend(a1, "creationDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 || (objc_msgSend(v7, "creationDate"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "creationDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "creationDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v39, "isEqual:", v40);

      if (v38)
      {

        if ((v41 & 1) != 0)
          goto LABEL_66;
        goto LABEL_65;
      }

      if ((v41 & 1) == 0)
      {
LABEL_65:
        objc_msgSend(v9, "addObject:", CFSTR("creationDate"));
        v10[2](v10);
      }
    }
  }
LABEL_66:
  if (*((_BYTE *)v62 + 24))
  {
    objc_msgSend(a1, "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42 || (objc_msgSend(v7, "identifier"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "identifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v43, "isEqual:", v44);

      if (v42)
      {

        if ((v45 & 1) != 0)
          goto LABEL_74;
        goto LABEL_73;
      }

      if ((v45 & 1) == 0)
      {
LABEL_73:
        objc_msgSend(v9, "addObject:", CFSTR("identifier"));
        v10[2](v10);
      }
    }
  }
LABEL_74:
  if (*((_BYTE *)v62 + 24))
  {
    objc_msgSend(a1, "owningBundleID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46 || (objc_msgSend(v7, "owningBundleID"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "owningBundleID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "owningBundleID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v47, "isEqual:", v48);

      if (v46)
      {

        if ((v49 & 1) != 0)
          goto LABEL_82;
        goto LABEL_81;
      }

      if ((v49 & 1) == 0)
      {
LABEL_81:
        objc_msgSend(v9, "addObject:", CFSTR("owningBundleID"));
        v10[2](v10);
      }
    }
  }
LABEL_82:
  if (*((_BYTE *)v62 + 24))
  {
    objc_msgSend(a1, "parentAccountIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50 || (objc_msgSend(v7, "parentAccountIdentifier"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "parentAccountIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "parentAccountIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "isEqual:", v52);

      if (v50)
      {

        if ((v53 & 1) != 0)
          goto LABEL_90;
        goto LABEL_89;
      }

      if ((v53 & 1) == 0)
      {
LABEL_89:
        objc_msgSend(v9, "addObject:", CFSTR("parentAccountIdentifier"));
        v10[2](v10);
      }
    }
  }
LABEL_90:
  if (*((_BYTE *)v62 + 24))
  {
    v54 = objc_msgSend(a1, "supportsAuthentication");
    if (v54 != objc_msgSend(v7, "supportsAuthentication"))
    {
      objc_msgSend(v9, "addObject:", CFSTR("supportsAuthentication"));
      v10[2](v10);
    }
  }
  v55 = v9;

  _Block_object_dispose(&v61, 8);
  return v55;
}

- (void)_setIsEnabled:()CalAdditions forDataclass:
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a4;
  objc_msgSend(a1, "parentAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ACAccount(CalAdditions) _setIsEnabled:forDataclass:].cold.1((uint64_t)v6, (uint64_t)a1, v8);

  }
  else if (objc_msgSend(a1, "_dataclassIsEnabled:", v6) != (_DWORD)a3)
  {
    objc_msgSend(a1, "setEnabled:forDataclass:", a3, v6);
  }

}

- (void)_setCalInternalValue:()CalAdditions forAccountPropertyKey:
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  id v22;

  v22 = a3;
  v6 = a4;
  if (v22)
  {
    if ((objc_msgSend(a1, "calIsExchangeAccount") & 1) != 0
      || (objc_msgSend(a1, "_calDAVDataclassProperties"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "containsObject:", v6),
          v7,
          v8))
    {
      v9 = *MEMORY[0x1E0C8F378];
      objc_msgSend(a1, "propertiesForDataclass:", *MEMORY[0x1E0C8F378]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0C99E08];
      if (v10)
      {
        objc_msgSend(a1, "propertiesForDataclass:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dictionaryWithDictionary:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v13, "objectForKeyedSubscript:", v6);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14
        || (v15 = (void *)v14,
            objc_msgSend(v13, "objectForKeyedSubscript:", v6),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "isEqual:", v22),
            v16,
            v15,
            (v17 & 1) == 0))
      {
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, v6);
        objc_msgSend(a1, "setProperties:forDataclass:", v13, v9);
      }

    }
    else if (objc_msgSend(a1, "calIsCalDAVAccount"))
    {
      objc_msgSend(a1, "objectForKeyedSubscript:", v6);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18
        || (v19 = (void *)v18,
            objc_msgSend(a1, "objectForKeyedSubscript:", v6),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = objc_msgSend(v20, "isEqual:", v22),
            v20,
            v19,
            (v21 & 1) == 0))
      {
        objc_msgSend(a1, "setObject:forKeyedSubscript:", v22, v6);
      }
    }
  }
  else
  {
    objc_msgSend(a1, "removeAccountPropertyForKey:", v6);
  }

}

- (id)_calDAVDataclassProperties
{
  if (_calDAVDataclassProperties_onceToken != -1)
    dispatch_once(&_calDAVDataclassProperties_onceToken, &__block_literal_global_85);
  return (id)_calDAVDataclassProperties_calDAVDataclassProperties;
}

- (id)_updateURL:()CalAdditions withHost:port:useSSL:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
    objc_msgSend(v13, "setHost:", v10);
  if (v11)
    objc_msgSend(v14, "setPort:", v11);
  if (v12)
  {
    objc_msgSend(a1, "_schemeStringForUseSSL:", objc_msgSend(v12, "BOOLValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setScheme:", v15);

  }
  objc_msgSend(v14, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (uint64_t)_useSSLForSchemeString:()CalAdditions
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("https"));

  return v4;
}

- (id)calTopLevelAccount
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    do
    {
      objc_msgSend(v1, "parentAccount");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "parentAccount");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = v3;
    }
    while (v4);
  }
  else
  {
    v3 = v1;
  }
  return v3;
}

- (void)calHostname
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);

}

- (void)setCalHostname:()CalAdditions .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  id v6;
  uint8_t v7[22];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  OUTLINED_FUNCTION_1_7();
  v8 = 2114;
  v9 = v5;
  v6 = v5;
  _os_log_fault_impl(&dword_18FC12000, a3, OS_LOG_TYPE_FAULT, "Ignoring attempt to set Hostname for account %{public}@ to something that's not a string (%@, which is a %{public}@)", v7, 0x20u);

  OUTLINED_FUNCTION_9();
}

- (void)addPrincipal:()CalAdditions withUID:.cold.1()
{
  void *v0;
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x20u);

  OUTLINED_FUNCTION_9();
}

- (void)calSyncingAccountUsingChildAccounts:()CalAdditions .cold.1(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xCu);

}

- (void)_setIsEnabled:()CalAdditions forDataclass:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_18FC12000, log, OS_LOG_TYPE_ERROR, "Attempting to enable/disable %@ on a child account %@.", (uint8_t *)&v3, 0x16u);
}

@end
