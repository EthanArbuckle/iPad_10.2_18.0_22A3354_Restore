@implementation DMCMultiUserModeUtilities

+ (BOOL)isSharediPad
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = (void *)MKBUserTypeDeviceMode();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5A0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5F0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4E5B0]))
      v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D4E5E8]);
    else
      v6 = 0;

  }
  else
  {
    v4 = 0;
    NSLog(CFSTR("MKBUserTypeDeviceMode returned NULL: %@"), 0);
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isEphemeralMultiUser
{
  return +[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad");
}

+ (BOOL)inSharediPadUserSession
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint8_t v9[16];

  if (!objc_msgSend(a1, "isSharediPad"))
  {
LABEL_7:
    LOBYTE(v6) = 0;
    return v6;
  }
  v3 = DMCUMUserManagerClass();
  if (!v3)
  {
    v7 = DMCLogObjects()[1];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_ERROR, "Failed to load user manager class. Returning NO for inSharediPadUserSession.", v9, 2u);
    }
    goto LABEL_7;
  }
  objc_msgSend(v3, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "isSharediPad"))
    v6 = objc_msgSend(v5, "isLoginUser") ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

+ (BOOL)deviceHasMultipleUsers
{
  id v2;
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  uint8_t v8[16];

  v2 = DMCUMUserManagerClass();
  if (v2)
  {
    objc_msgSend(v2, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allUsers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (unint64_t)objc_msgSend(v4, "count") > 1;

  }
  else
  {
    v6 = DMCLogObjects()[1];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A4951000, v6, OS_LOG_TYPE_ERROR, "Failed to load user manager class. Returning NO for deviceHasMultipleUsers.", v8, 2u);
    }
    return 0;
  }
  return v5;
}

+ (BOOL)isPrimaryUserSession
{
  if (isPrimaryUserSession_onceToken != -1)
    dispatch_once(&isPrimaryUserSession_onceToken, &__block_literal_global_14);
  return isPrimaryUserSession_result;
}

uint64_t __49__DMCMultiUserModeUtilities_isPrimaryUserSession__block_invoke()
{
  uint64_t result;
  BOOL v1;

  result = +[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad");
  if ((result & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    result = getuid();
    v1 = (_DWORD)result == 501;
  }
  isPrimaryUserSession_result = v1;
  return result;
}

+ (id)configureToSharedDeviceWithPreferenceDomain:(__CFString *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  CFPropertyListRef v7;
  void *v8;
  void *v9;
  uint8_t v11[16];

  v4 = DMCLogObjects()[1];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_DEFAULT, "Configuring device to shared device", v11, 2u);
  }
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("MCSharedDeviceUserQuotaSize"), a3);
  if (v5)
  {
    +[DMCMultiUserModeUtilities _configureQuotaSizeForSharedDeviceImmediately:](DMCMultiUserModeUtilities, "_configureQuotaSizeForSharedDeviceImmediately:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFPreferencesCopyAppValue(CFSTR("MCMaximumResidentUsers"), a3);
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = &unk_1E4D41648;
    +[DMCMultiUserModeUtilities _configureResidentUsersNumberForSharedDeviceImmediately:](DMCMultiUserModeUtilities, "_configureResidentUsersNumberForSharedDeviceImmediately:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)configureQuotaSizeForSharedDevice:(id)a3 preferenceDomain:(__CFString *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v5 = a3;
  if (+[DMCMultiUserModeUtilities isFirstSetupBuddyDone](DMCMultiUserModeUtilities, "isFirstSetupBuddyDone"))
  {
    +[DMCMultiUserModeUtilities _configureQuotaSizeForSharedDeviceImmediately:](DMCMultiUserModeUtilities, "_configureQuotaSizeForSharedDeviceImmediately:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = DMCLogObjects()[1];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_DEFAULT, "We are in buddy, caching the user quota info", v9, 2u);
    }
    CFPreferencesSetAppValue(CFSTR("MCSharedDeviceUserQuotaSize"), v5, a4);
    CFPreferencesAppSynchronize(a4);
    v6 = 0;
  }

  return v6;
}

+ (id)configureResidentUsersNumberForSharedDevice:(id)a3 preferenceDomain:(__CFString *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v5 = a3;
  if (+[DMCMultiUserModeUtilities isFirstSetupBuddyDone](DMCMultiUserModeUtilities, "isFirstSetupBuddyDone"))
  {
    +[DMCMultiUserModeUtilities _configureResidentUsersNumberForSharedDeviceImmediately:](DMCMultiUserModeUtilities, "_configureResidentUsersNumberForSharedDeviceImmediately:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = DMCLogObjects()[1];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_DEFAULT, "We are in buddy, caching the maximum resident user info", v9, 2u);
    }
    CFPreferencesSetAppValue(CFSTR("MCMaximumResidentUsers"), v5, a4);
    CFPreferencesAppSynchronize(a4);
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isFirstSetupBuddyDone
{
  return (DMCIsSetupBuddyDone() & 1) != 0 || getuid() != 501;
}

+ (BOOL)configureUserSessionTimeout:(double)a3
{
  void *v3;
  BOOL v4;

  if (a3 <= 0.0)
    return +[DMCMultiUserModeUtilities _updateMultiUserDeviceConfigurationFileWithKey:value:](DMCMultiUserModeUtilities, "_updateMultiUserDeviceConfigurationFileWithKey:value:", CFSTR("UserSessionTimeout"), &unk_1E4D41660);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DMCMultiUserModeUtilities _updateMultiUserDeviceConfigurationFileWithKey:value:](DMCMultiUserModeUtilities, "_updateMultiUserDeviceConfigurationFileWithKey:value:", CFSTR("UserSessionTimeout"), v3);

  return v4;
}

+ (BOOL)configureTemporarySessionTimeout:(double)a3
{
  void *v3;
  BOOL v4;

  if (a3 <= 0.0)
    return +[DMCMultiUserModeUtilities _updateMultiUserDeviceConfigurationFileWithKey:value:](DMCMultiUserModeUtilities, "_updateMultiUserDeviceConfigurationFileWithKey:value:", CFSTR("TemporarySessionTimeout"), &unk_1E4D41660);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DMCMultiUserModeUtilities _updateMultiUserDeviceConfigurationFileWithKey:value:](DMCMultiUserModeUtilities, "_updateMultiUserDeviceConfigurationFileWithKey:value:", CFSTR("TemporarySessionTimeout"), v3);

  return v4;
}

+ (BOOL)configureTemporarySessionOnly:(BOOL)a3 useDynamicQuotaSize:(BOOL)a4 restoreQuotaSizeWhenDisabled:(BOOL)a5 preferenceDomain:(__CFString *)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  if (+[DMCMultiUserModeUtilities temporarySessionOnly](DMCMultiUserModeUtilities, "temporarySessionOnly") == a3&& +[DMCMultiUserModeUtilities useDynamicQuotaSize](DMCMultiUserModeUtilities, "useDynamicQuotaSize") == v8)
  {
    return 1;
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DMCMultiUserModeUtilities _updateMultiUserDeviceConfigurationFileWithKey:value:](DMCMultiUserModeUtilities, "_updateMultiUserDeviceConfigurationFileWithKey:value:", CFSTR("UseDynamicQuota"), v11);

    if (v8)
    {
      if (+[DMCMultiUserModeUtilities isFirstSetupBuddyDone](DMCMultiUserModeUtilities, "isFirstSetupBuddyDone"))
      {
        objc_msgSend(DMCUMUserManagerClass(), "sharedManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "userQuotaSize");
      }
      else
      {
        v12 = (void *)CFPreferencesCopyAppValue(CFSTR("MCSharedDeviceUserQuotaSize"), a6);
        v13 = objc_msgSend(v12, "unsignedLongValue");
      }
      v18 = v13;

      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[DMCMultiUserModeUtilities _updateMultiUserDeviceConfigurationFileWithKey:value:](DMCMultiUserModeUtilities, "_updateMultiUserDeviceConfigurationFileWithKey:value:", CFSTR("MCPreviousQuotaSize"), v19);

      }
      v20 = (id)objc_msgSend(a1, "configureResidentUsersNumberForSharedDevice:preferenceDomain:", &unk_1E4D41678, a6);
    }
  }
  else if (v7)
  {
    v14 = +[DMCMultiUserModeUtilities _previousQuotaSize](DMCMultiUserModeUtilities, "_previousQuotaSize");
    NSLog(CFSTR("%s previous quota size is: %lu"), "+[DMCMultiUserModeUtilities configureTemporarySessionOnly:useDynamicQuotaSize:restoreQuotaSizeWhenDisabled:preferenceDomain:]", v14);
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(a1, "configureQuotaSizeForSharedDevice:preferenceDomain:", v15, a6);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = +[DMCMultiUserModeUtilities _updateMultiUserDeviceConfigurationFileWithKey:value:](DMCMultiUserModeUtilities, "_updateMultiUserDeviceConfigurationFileWithKey:value:", CFSTR("TemporarySessionOnly"), v21);

  return v22;
}

+ (double)userSessionTimeout
{
  void *v2;
  void *v3;
  int v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DMCMultiUserDeviceConfigurationFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  v5 = 0.0;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0C99D80];
    DMCMultiUserDeviceConfigurationFilePath();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "DMCDictionaryFromFile:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UserSessionTimeout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v5 = v10;

  }
  return v5;
}

+ (double)temporarySessionTimeout
{
  void *v2;
  void *v3;
  int v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DMCMultiUserDeviceConfigurationFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  v5 = 0.0;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0C99D80];
    DMCMultiUserDeviceConfigurationFilePath();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "DMCDictionaryFromFile:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TemporarySessionTimeout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v5 = v10;

  }
  return v5;
}

+ (BOOL)temporarySessionOnly
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DMCMultiUserDeviceConfigurationFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (!v4)
    return 0;
  v5 = (void *)MEMORY[0x1E0C99D80];
  DMCMultiUserDeviceConfigurationFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "DMCDictionaryFromFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TemporarySessionOnly"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

+ (BOOL)useDynamicQuotaSize
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DMCMultiUserDeviceConfigurationFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (!v4)
    return 0;
  v5 = (void *)MEMORY[0x1E0C99D80];
  DMCMultiUserDeviceConfigurationFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "DMCDictionaryFromFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UseDynamicQuota"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

+ (BOOL)configureMAIDDefaultDomains:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a1) = objc_msgSend(a1, "_updateMultiUserDeviceConfigurationFileWithKey:value:", CFSTR("ManagedAppleIDDefaultDomains"), v5);
  return (char)a1;
}

+ (id)managedAppleIDDefaultDomains
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DMCMultiUserDeviceConfigurationFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99D80];
    DMCMultiUserDeviceConfigurationFilePath();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "DMCDictionaryFromFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ManagedAppleIDDefaultDomains"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (BOOL)configureOnlineAuthenticationGracePeriod:(id)a3
{
  return objc_msgSend(a1, "_updateMultiUserDeviceConfigurationFileWithKey:value:", CFSTR("OnlineAuthenticationGracePeriod"), a3);
}

+ (id)onlineAuthenticationGracePeriod
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DMCMultiUserDeviceConfigurationFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99D80];
    DMCMultiUserDeviceConfigurationFilePath();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "DMCDictionaryFromFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("OnlineAuthenticationGracePeriod"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (BOOL)configureShouldSkipLanguageAndLocaleSetupForNewUsers:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_updateMultiUserDeviceConfigurationFileWithKey:value:", CFSTR("SkipLanguageAndLocaleSetupForNewUsers"), v4);

  return (char)a1;
}

+ (BOOL)shouldSkipLanguageAndLocaleSetupForNewUsers
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  if (!+[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DMCMultiUserDeviceConfigurationFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (!v4)
    return 0;
  v5 = (void *)MEMORY[0x1E0C99D80];
  DMCMultiUserDeviceConfigurationFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "DMCDictionaryFromFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SkipLanguageAndLocaleSetupForNewUsers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

+ (BOOL)configureAwaitUserConfiguration:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Enabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
    objc_msgSend(a1, "markCurrentUserAsConfigured");
  v7 = objc_msgSend(a1, "_updateMultiUserDeviceConfigurationFileWithKey:value:", CFSTR("AwaitUserConfiguration"), v4);

  return v7;
}

+ (BOOL)awaitUserConfigurationEnabled
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  if (!+[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DMCMultiUserDeviceConfigurationFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (!v4)
    return 0;
  v5 = (void *)MEMORY[0x1E0C99D80];
  DMCMultiUserDeviceConfigurationFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "DMCDictionaryFromFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AwaitUserConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Enabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  return v10;
}

+ (BOOL)markCurrentUserAsConfigured
{
  sem_t *v2;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  int *v6;
  char *v7;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!+[DMCMultiUserModeUtilities inSharediPadUserSession](DMCMultiUserModeUtilities, "inSharediPadUserSession"))goto LABEL_4;
  v2 = sem_open("dmc_isCurrentUserConfigured", 512, 256, 0);
  if (v2 != (sem_t *)-1)
  {
    sem_close(v2);
    DMCSendUserSettingsChangedNotification();
LABEL_4:
    LOBYTE(v3) = 1;
    return v3;
  }
  v4 = *DMCLogObjects();
  v3 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    v5 = v4;
    v6 = __error();
    v7 = strerror(*v6);
    *(_DWORD *)buf = 136446466;
    v10 = "dmc_isCurrentUserConfigured";
    v11 = 2082;
    v12 = v7;
    _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_ERROR, "Failed to create semaphore %{public}s: %{public}s", buf, 0x16u);

    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (BOOL)isCurrentUserConfigured
{
  sem_t *v3;

  if (!+[DMCMultiUserModeUtilities inSharediPadUserSession](DMCMultiUserModeUtilities, "inSharediPadUserSession")|| !objc_msgSend(a1, "awaitUserConfigurationEnabled"))
  {
    return 1;
  }
  v3 = sem_open("dmc_isCurrentUserConfigured", 0);
  if (v3 != (sem_t *)-1)
  {
    sem_close(v3);
    return 1;
  }
  return 0;
}

+ (BOOL)_updateMultiUserDeviceConfigurationFileWithKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  DMCMultiUserDeviceConfigurationFilePath();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_updateMultiUserConfigurationFileAtPath:key:value:", v8, v7, v6);

  DMCSendSettingsChangedNotification();
  return (char)a1;
}

+ (BOOL)_updateMultiUserUserConfigurationFileWithKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  DMCMultiUserUserConfigurationFilePath();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_updateMultiUserConfigurationFileAtPath:key:value:", v8, v7, v6);

  DMCSendUserSettingsChangedNotification();
  return (char)a1;
}

+ (BOOL)_updateMultiUserConfigurationFileAtPath:(id)a3 key:(id)a4 value:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "DMCDictionaryFromFile:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_opt_new();
  v15 = v14;

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, v10);
  v16 = objc_msgSend(v15, "DMCWriteToBinaryFile:", v7);
  if (v16)
    DMCSetSkipBackupAttributeToItemAtPath(v7, 1);

  return v16;
}

+ (unint64_t)_previousQuotaSize
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DMCMultiUserDeviceConfigurationFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (!v4)
    return 0;
  v5 = (void *)MEMORY[0x1E0C99D80];
  DMCMultiUserDeviceConfigurationFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "DMCDictionaryFromFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MCPreviousQuotaSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongValue");

  return v9;
}

+ (id)_configureQuotaSizeForSharedDeviceImmediately:(id)a3
{
  id v4;
  BOOL v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_semaphore_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  v5 = +[DMCMultiUserModeUtilities isFirstSetupBuddyDone](DMCMultiUserModeUtilities, "isFirstSetupBuddyDone");
  v6 = objc_msgSend(v4, "unsignedLongLongValue");
  if (v5 || (unint64_t)objc_msgSend(a1, "_getDiskSize") > 0x800000000)
    v7 = 2000000000;
  else
    v7 = 1000000000;
  if (v6 <= v7)
    v6 = v7;
  v8 = objc_msgSend(a1, "getDiskAvailableSize");
  v9 = v8 - 2000000000;
  if (v6 < v8 - 2000000000)
    v9 = v6;
  if ((double)v8 * 0.98 <= (double)v9)
    v10 = (double)v8 * 0.98;
  else
    v10 = (double)v9;
  DMCUMUserSessionProvisionTypeKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v11;
  DMCUMUserSessionProvisionTypeEducation();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v12;
  DMCUMEducationUserSizeKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)v10 & 0xFFFFFFFFFFF00000);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = dispatch_semaphore_create(0);
  objc_msgSend(DMCUMUserManagerClass(), "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __75__DMCMultiUserModeUtilities__configureQuotaSizeForSharedDeviceImmediately___block_invoke;
  v21[3] = &unk_1E4D379A8;
  v23 = &v24;
  v18 = v16;
  v22 = v18;
  objc_msgSend(v17, "setupUMUserSessionProvisioning:WithCompletionHandler:", v15, v21);

  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  v19 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v19;
}

void __75__DMCMultiUserModeUtilities__configureQuotaSizeForSharedDeviceImmediately___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = DMCLogObjects()[1];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_DEFAULT, "Finished configuring quota size with result: %{public}@, error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)_configureResidentUsersNumberForSharedDeviceImmediately:(id)a3
{
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = objc_msgSend(a3, "unsignedIntValue");
  v5 = objc_msgSend(a1, "getDiskAvailableSize");
  if (+[DMCMultiUserModeUtilities isFirstSetupBuddyDone](DMCMultiUserModeUtilities, "isFirstSetupBuddyDone"))
  {
    v6 = v5 - 2000000000;
  }
  else
  {
    v7 = objc_msgSend(a1, "_getDiskSize");
    v8 = -16000000000;
    if (v7 < 0x800000001)
      v8 = -8000000000;
    v6 = v8 + v5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (v6 / v4) & 0xFFFFFFFFFFF00000);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[DMCMultiUserModeUtilities _configureQuotaSizeForSharedDeviceImmediately:](DMCMultiUserModeUtilities, "_configureQuotaSizeForSharedDeviceImmediately:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (unint64_t)getDiskAvailableSize
{
  unint64_t v2;
  NSObject *v3;
  int v5;
  unint64_t v6;
  char v7[16];
  statfs v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(&v8, 0, 512);
  strcpy(v7, "/private/var");
  if (statfs(v7, &v8))
    v2 = 0;
  else
    v2 = v8.f_bavail * v8.f_bsize;
  v3 = DMCLogObjects()[1];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134349056;
    v6 = v2;
    _os_log_impl(&dword_1A4951000, v3, OS_LOG_TYPE_DEFAULT, "Available disk size: %{public}lld", (uint8_t *)&v5, 0xCu);
  }
  return v2;
}

+ (unint64_t)_getDiskSize
{
  unint64_t result;
  const void *v3;
  const __CFNumber *Value;
  const __CFNumber *v5;
  CFTypeID v6;
  unint64_t valuePtr;

  valuePtr = 0;
  +[DMCMobileGestalt diskUsage](DMCMobileGestalt, "diskUsage");
  result = objc_claimAutoreleasedReturnValue();
  if (result)
  {
    v3 = (const void *)result;
    Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x1E0DE2CB8]);
    if (Value)
    {
      v5 = Value;
      v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID())
        CFNumberGetValue(v5, kCFNumberLongLongType, &valuePtr);
    }
    CFRelease(v3);
    return valuePtr;
  }
  return result;
}

@end
