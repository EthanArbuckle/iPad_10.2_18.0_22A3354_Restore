@implementation IPSettingsUtilities

+ (void)setLanguage:(id)a3
{
  objc_msgSend(a1, "setLanguage:postNotification:", a3, 1);
}

+ (void)setLanguage:(id)a3 postNotification:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "setPreferredLanguageAndUpdateLocale:", a3);
  objc_msgSend(a1, "runPostLanguageChangeOperationsWithNotifications:", v4);
}

+ (void)setRegion:(id)a3
{
  objc_msgSend(a1, "setRegion:changeLanguageVariant:postNotification:", a3, 1, 1);
}

+ (void)setRegion:(id)a3 postNotification:(BOOL)a4
{
  objc_msgSend(a1, "setRegion:changeLanguageVariant:postNotification:", a3, 1, a4);
}

+ (void)setRegion:(id)a3 changeLanguageVariant:(BOOL)a4 postNotification:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  +[IPLanguageListManager manager](IPLanguageListManager, "manager");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRegion:updateFirstLanguage:", v8, v6);
  objc_msgSend(MEMORY[0x1E0C99DC8], "setLocaleAfterRegionChange:", v8);

  v9 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(v17, "preferredLanguages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredLanguages:", v10);

  v11 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(v17, "deviceLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v11, "_language:usesSameLocalizationAs:", v12, v14);

  if ((v11 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(v17, "deviceLanguage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLocaleAfterLanguageChange:", v16);

  }
  objc_msgSend(a1, "runPostLanguageChangeOperationsWithNotifications:", v5);

}

+ (void)setLanguageAndRegion:(id)a3
{
  objc_msgSend(a1, "setLanguageAndRegion:postNotification:", a3, 1);
}

+ (void)setLanguageAndRegion:(id)a3 postNotification:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "setLanguageAndRegion:", a3);
  objc_msgSend(a1, "runPostLanguageChangeOperationsWithNotifications:", v4);
}

+ (void)runPostLanguageChangeOperationsWithNotifications:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  xpc_object_t v13;
  int v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v16;
  __CFNotificationCenter *v17;
  _QWORD v18[4];
  id v19;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

  if ((v7 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DC8], "enableDefaultKeyboardForPreferredLanguages");
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginActivityWithOptions:reason:", 0xFFFFFFLL, CFSTR("com.apple.InternationalSettings.setLanguagesToIdMS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__IPSettingsUtilities_runPostLanguageChangeOperationsWithNotifications___block_invoke;
  v18[3] = &unk_1E7068DF0;
  v10 = v9;
  v19 = v10;
  objc_msgSend(a1, "writeLanguageAndLocaleConfigurationIfNeededWithCompletion:", v18);
  objc_msgSend(a1, "mirrorToWatchIfNecessary");
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "regionCode");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = xpc_string_create((const char *)objc_msgSend(v12, "cStringUsingEncoding:", 1));
  v14 = os_eligibility_set_input();

  if (v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[IPSettingsUtilities runPostLanguageChangeOperationsWithNotifications:].cold.1(v14);
    if (!v3)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v3)
  {
LABEL_6:
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AppleLanguagePreferencesChangedNotification"), 0, 0, 1u);
    v16 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v16, CFSTR("AppleKeyboardsPreferencesChangedNotification"), 0, 0, 1u);
    v17 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v17, CFSTR("com.apple.language.changed"), 0, 0, 1u);
  }
LABEL_7:

}

void __72__IPSettingsUtilities_runPostLanguageChangeOperationsWithNotifications___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endActivity:", *(_QWORD *)(a1 + 32));

}

+ (void)writeLanguageAndLocaleConfigurationIfNeededWithCompletion:(id)a3
{
  void (**v3)(_QWORD);
  void *v4;
  char v5;
  NSObject *v6;
  _QWORD block[4];
  void (**v8)(_QWORD);

  v3 = (void (**)(_QWORD))a3;
  objc_msgSend(getUMUserManagerClass(), "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMultiUser");

  if ((v5 & 1) != 0)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__IPSettingsUtilities_writeLanguageAndLocaleConfigurationIfNeededWithCompletion___block_invoke;
    block[3] = &unk_1E7068E40;
    v8 = v3;
    dispatch_async(v6, block);

  }
  else if (v3)
  {
    v3[2](v3);
  }

}

void __81__IPSettingsUtilities_writeLanguageAndLocaleConfigurationIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(getUMUserManagerClass(), "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alternateDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v21[0] = CFSTR("AppleLanguages");
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = CFSTR("AppleLocale");
    v22[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v9 = (void *)getAKAppleIDAuthenticationControllerClass_softClass;
    v20 = getAKAppleIDAuthenticationControllerClass_softClass;
    v10 = MEMORY[0x1E0C809B0];
    if (!getAKAppleIDAuthenticationControllerClass_softClass)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __getAKAppleIDAuthenticationControllerClass_block_invoke;
      v16[3] = &unk_1E7068E68;
      v16[4] = &v17;
      __getAKAppleIDAuthenticationControllerClass_block_invoke((uint64_t)v16);
      v9 = (void *)v18[3];
    }
    v11 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v17, 8);
    v12 = (void *)objc_opt_new();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __81__IPSettingsUtilities_writeLanguageAndLocaleConfigurationIfNeededWithCompletion___block_invoke_2;
    v14[3] = &unk_1E7068E18;
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v12, "setConfigurationInfo:forIdentifier:forAltDSID:completion:", v8, CFSTR("com.apple.idms.config.Language"), v4, v14);

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      (*(void (**)(void))(v13 + 16))();
  }

}

uint64_t __81__IPSettingsUtilities_writeLanguageAndLocaleConfigurationIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)mirrorToWatchIfNecessary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  IPWatchLocaleController *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D51838], "activePairedDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D516D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = objc_alloc_init(IPWatchLocaleController);
  if (-[IPWatchLocaleController isMirroringEnabled](v7, "isMirroringEnabled") && (v6 & 1) == 0)
    -[IPWatchLocaleController mirrorLanguagesAndLocaleToWatch](v7, "mirrorLanguagesAndLocaleToWatch");

}

+ (void)runPostLanguageChangeOperationsWithNotifications:(int)a1 .cold.1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1B96C1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to set eligibility input: %d", (uint8_t *)v1, 8u);
}

@end
