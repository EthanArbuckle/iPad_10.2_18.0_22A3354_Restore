@implementation EMInternalPreferences

+ (BOOL)preferenceEnabled:(unint64_t)a3
{
  char v3;
  void *v5;
  char v6;
  unint64_t v7;
  uint64_t i;
  _BOOL4 v9;
  uint64_t v10;
  _BOOL8 v11;
  _QWORD block[5];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternal");

  if ((v6 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__EMInternalPreferences_preferenceEnabled___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (preferenceEnabled__onceToken != -1)
      dispatch_once(&preferenceEnabled__onceToken, block);
    v7 = atomic_load(&cachedFlags);
    if (!v7)
    {
      v7 = 1;
      for (i = 1; i != 50; ++i)
      {
        v9 = +[EMInternalPreferences _preferenceEnabled:](EMInternalPreferences, "_preferenceEnabled:", i);
        v10 = 1 << i;
        if (!v9)
          v10 = 0;
        v7 |= v10;
      }
      atomic_store(v7, &cachedFlags);
    }
    return (v7 >> v3) & 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__EMInternalPreferences_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_20 != -1)
    dispatch_once(&log_onceToken_20, block);
  return (OS_os_log *)(id)log_log_20;
}

void __28__EMInternalPreferences_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_20;
  log_log_20 = (uint64_t)v1;

}

uint64_t __43__EMInternalPreferences_preferenceEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerForDefaultChanges");
}

+ (void)_registerForDefaultChanges
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  void *v6;
  NSObject *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1;
  *(_QWORD *)&v5 = 134218242;
  v9 = v5;
  do
  {
    +[EMInternalPreferences defaultForPreference:](EMInternalPreferences, "defaultForPreference:", v4, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "addObserver:forKeyPath:options:context:", a1, v6, 0, &kvoContext);
      +[EMInternalPreferences log](EMInternalPreferences, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v9;
        v11 = a1;
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_1B99BB000, v7, OS_LOG_TYPE_DEFAULT, "EMInternalPreferences (%p) adding observer for key path %@ on defaults", buf, 0x16u);
      }

    }
    ++v4;
  }
  while (v4 != 50);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_userDefaultsDidChange, CFSTR("com.apple.mail.EMUserDefaultsDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);

}

+ (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == &kvoContext)
  {
    atomic_store(0, &cachedFlags);
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___EMInternalPreferences;
    objc_msgSendSuper2(&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

+ (id)observeChangesForPreference:(unint64_t)a3 usingBlock:(id)a4
{
  +[EMInternalPreferences observeChangesForPreference:autoCancelToken:usingBlock:](EMInternalPreferences, "observeChangesForPreference:autoCancelToken:usingBlock:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)observeChangesForPreference:(unint64_t)a3 autoCancelToken:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;

  v5 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isInternal");

  if ((v10 & 1) != 0)
  {
    objc_msgSend(a1, "defaultForPreference:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__EMInternalPreferences_observeChangesForPreference_autoCancelToken_usingBlock___block_invoke;
    v15[3] = &unk_1E70F3948;
    v17 = a1;
    v18 = a3;
    v16 = v8;
    objc_msgSend(v12, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v11, 1, v5, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __80__EMInternalPreferences_observeChangesForPreference_autoCancelToken_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "BOOLValue");
  else
    objc_msgSend(*(id *)(a1 + 40), "preferenceEnabled:", *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (BOOL)_preferenceEnabled:(unint64_t)a3
{
  void *v5;
  char v6;
  NSObject *v8;

  objc_msgSend(a1, "defaultForPreference:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (a3 <= 0x32)
  {
    if (((1 << a3) & 0x3FFFFEFFFFFFCLL) != 0)
    {
      v6 = objc_msgSend(a1, "_userDefaultEnabledForKey:defaultValue:", v5, 0);
    }
    else
    {
      if (((1 << a3) & 0x4000000000001) == 0)
      {
        if (a3 != 28)
          goto LABEL_4;
        v6 = objc_msgSend(a1, "_userDefaultEnabledForKey:defaultValue:", v5, _os_feature_enabled_impl());
      }
      +[EMInternalPreferences log](EMInternalPreferences, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[EMInternalPreferences _preferenceEnabled:].cold.1(a3, v8);

    }
  }
LABEL_4:

  return v6;
}

+ (void)setPreference:(unint64_t)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  objc_msgSend(a1, "defaultForPreference:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(a1, "_setUserDefaultEnabled:forKey:", v4, v6);

}

+ (id)defaultForPreference:(unint64_t)a3
{
  void *v4;
  char v5;
  __CFString *v6;
  NSObject *v7;
  __CFString **v8;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternal");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
    switch(a3)
    {
      case 0uLL:
      case 0x32uLL:
        +[EMInternalPreferences log](EMInternalPreferences, "log");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          +[EMInternalPreferences defaultForPreference:].cold.1(v7);

        goto LABEL_6;
      case 2uLL:
        v8 = EMUserDefaultForceInMemoryThreading;
        goto LABEL_55;
      case 3uLL:
        v8 = EMUserDefaultQueryResultComparison;
        goto LABEL_55;
      case 4uLL:
        v8 = EMUserDefaultNewQueryResults;
        goto LABEL_55;
      case 5uLL:
        v8 = EMUserDefaultSharingFromSafariUI;
        goto LABEL_55;
      case 6uLL:
        v8 = EMUserDefaultForceAccountIsManaged;
        goto LABEL_55;
      case 7uLL:
        v8 = EMUserDefaultShowDebugInfo;
        goto LABEL_55;
      case 8uLL:
        v8 = EMUserDefaultSearchFlagColors;
        goto LABEL_55;
      case 9uLL:
        v8 = EMUserDefaultFavoriteFlagColorMailbox;
        goto LABEL_55;
      case 0xAuLL:
        v8 = EMUserDefaultAdditionalPointerInteractions;
        goto LABEL_55;
      case 0xBuLL:
        v8 = EMUserDefaultRemoteContentRequestShortInterval;
        goto LABEL_55;
      case 0xCuLL:
        v8 = EMUserDefaultAlwaysVerifyServerProvidedRemoteContentLinks;
        goto LABEL_55;
      case 0xDuLL:
        v8 = EMUserDefaultLogRemoteContentLinksUnredacted;
        goto LABEL_55;
      case 0xEuLL:
        v8 = EMUserDefaultDisableSnapshotInvalidation;
        goto LABEL_55;
      case 0xFuLL:
        v8 = EMUserDefaultDisableInitialMessageSelection;
        goto LABEL_55;
      case 0x10uLL:
        v8 = EMUserDefaultDisableStateRestoration;
        goto LABEL_55;
      case 0x11uLL:
        v8 = EMUserDefaultEnableThreadedMessagesInWidget;
        goto LABEL_55;
      case 0x12uLL:
        v8 = EMUserDefaultDisableServerSideSearch;
        goto LABEL_55;
      case 0x13uLL:
        v8 = EMUserDefaultRemindMeDebugDate;
        goto LABEL_55;
      case 0x14uLL:
        v8 = EMUserDefaultSuggestionsFollowUpDebugStartDate;
        goto LABEL_55;
      case 0x15uLL:
        v8 = EMUserDefaultSuggestionsFollowUpDebugEndDate;
        goto LABEL_55;
      case 0x16uLL:
        v8 = EMUserDefaultIgnoreBIMIAllowlist;
        goto LABEL_55;
      case 0x17uLL:
        v8 = EMUserDefaultAllowBIMIWithDKIMSignature;
        goto LABEL_55;
      case 0x18uLL:
        v8 = EMUserDefaultAlertOnBlankCell;
        goto LABEL_55;
      case 0x19uLL:
        v8 = EMUserDefaultShouldBlockXPCQueue;
        goto LABEL_55;
      case 0x1AuLL:
        v8 = EMUserDefaultShouldBlockSQLQueries;
        goto LABEL_55;
      case 0x1BuLL:
        v8 = EMUserDefaultIndexingTurboMode;
        goto LABEL_55;
      case 0x1CuLL:
        v8 = EMUserDefaultAdoptMessageSecurity;
        goto LABEL_55;
      case 0x1DuLL:
        v8 = EMUserDefaultEncryptedMailMostSecure;
        goto LABEL_55;
      case 0x1EuLL:
        v8 = EMUserDefaultSignUsingPKCS7MIME;
        goto LABEL_55;
      case 0x1FuLL:
        v8 = EMUserDefaultSkipEncryptedMailDeviceCheck;
        goto LABEL_55;
      case 0x20uLL:
        v8 = EMUserDefaultForceAdvertiseGCMCapability;
        goto LABEL_55;
      case 0x21uLL:
        v8 = EMUserDefaultForceAdvertiseSubjectEncryptionCapability;
        goto LABEL_55;
      case 0x22uLL:
        v8 = EMUserDefaultForceEncryptWithGCM;
        goto LABEL_55;
      case 0x23uLL:
        v8 = EMUserDefaultForceEncryptSubject;
        goto LABEL_55;
      case 0x24uLL:
        v8 = EMUserDefaultForceMiniTip;
        goto LABEL_55;
      case 0x25uLL:
        v8 = EMUserDefaultDisableIndexing;
        goto LABEL_55;
      case 0x26uLL:
        v8 = EMUserDefaultDisableQueryLogSubmission;
        goto LABEL_55;
      case 0x27uLL:
        v8 = EMUserDefaultVerifyMessageBodyWithDKIM;
        goto LABEL_55;
      case 0x28uLL:
        v8 = EMUserDefaultSimulateDelayedFreeSpaceStatus;
        goto LABEL_55;
      case 0x29uLL:
        v8 = EMUserDefaultUseFlaggedForCYUInsteadOfUrgent;
        goto LABEL_55;
      case 0x2AuLL:
        v8 = EMUserDefaultRemoveTimeLimitForHighlights;
        goto LABEL_55;
      case 0x2BuLL:
        v8 = EMUserDefaultDynamicallyUpdateGeneratedSummaries;
        goto LABEL_55;
      case 0x2CuLL:
        v8 = EMUserDefaultHideMaildIndexedResults;
        goto LABEL_55;
      case 0x2DuLL:
        v8 = EMUserDefaultHideSearchIndexerResults;
        goto LABEL_55;
      case 0x2EuLL:
        v8 = EMUserDefaultGenerateFakeSummaries;
        goto LABEL_55;
      case 0x2FuLL:
        v8 = EMUserDefaultGenerateFakeManualSummaries;
        goto LABEL_55;
      case 0x30uLL:
        v8 = EMUserDefaultOverrideAsGreymatterSupportedDevice;
        goto LABEL_55;
      case 0x31uLL:
        v8 = EMUserDefaultOverrideGreymatterAvailability;
LABEL_55:
        v6 = *v8;
        break;
      default:
        return v6;
    }
  }
  else
  {
LABEL_6:
    v6 = 0;
  }
  return v6;
}

+ (BOOL)_userDefaultEnabledForKey:(id)a3 defaultValue:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    a4 = objc_msgSend(v7, "BOOLValue");

  return a4;
}

+ (void)_setUserDefaultEnabled:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v4, v6);

}

+ (BOOL)_hasUserDefaultValueForKey:(id)a3 expectedValue:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;

  v5 = a3;
  v6 = (unint64_t)a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringForKey:", v5);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v6 | v8)
    v9 = objc_msgSend((id)v6, "isEqual:", v8);
  else
    v9 = 1;

  return v9;
}

+ (void)_preferenceEnabled:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1B99BB000, a2, OS_LOG_TYPE_ERROR, "Reading invalid preference: %lu", (uint8_t *)&v2, 0xCu);
}

+ (void)defaultForPreference:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "Getting default for invalid preference", v1, 2u);
}

@end
