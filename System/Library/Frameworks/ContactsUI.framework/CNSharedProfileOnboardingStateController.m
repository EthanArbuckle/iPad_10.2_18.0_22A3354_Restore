@implementation CNSharedProfileOnboardingStateController

- (int64_t)lastShownOnboardingVersion
{
  void *v2;
  int64_t v3;
  NSObject *v4;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("CNSharedProfileOnboardingLastShownVersion"));

  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_debug_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEBUG, "Last shown onboarding version: %ld", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (BOOL)shouldShowOnboarding
{
  BOOL v3;
  int64_t v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[CNSharedProfileOnboardingStateController alwaysShowSNaPOnboarding](self, "alwaysShowSNaPOnboarding"))
    return 1;
  v4 = -[CNSharedProfileOnboardingStateController lastShownOnboardingVersion](self, "lastShownOnboardingVersion");
  v3 = v4 < 1;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109120;
    v7[1] = v4 < 1;
    _os_log_debug_impl(&dword_18AC56000, v5, OS_LOG_TYPE_DEBUG, "Should show onboarding: newOnboardingAvailable %d", (uint8_t *)v7, 8u);
  }

  return v3;
}

+ (id)log
{
  if (log_cn_once_token_21 != -1)
    dispatch_once(&log_cn_once_token_21, &__block_literal_global_44516);
  return (id)log_cn_once_object_21;
}

- (BOOL)alwaysShowSNaPOnboarding
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("CNSharedProfileOnboardingAlwaysShow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_18AC56000, v5, OS_LOG_TYPE_DEBUG, "Always show SNaP Onboarding enabled", v7, 2u);
    }

  }
  return v4;
}

+ (id)userDefaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.contacts.sharedProfile"));
}

void __47__CNSharedProfileOnboardingStateController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNSharedProfileOnboardingController");
  v1 = (void *)log_cn_once_object_21;
  log_cn_once_object_21 = (uint64_t)v0;

}

+ (void)writeToDefaultsDidSkipPosterSetup:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "Writing to defaults, user has selected to skip poster setup %d", (uint8_t *)v6, 8u);
  }

  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("CNSharedProfileOnboardingDidSkipPosterSetup"));

}

- (BOOL)deviceSupportsPosters
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (int64_t)currentOnboardingVersion
{
  return 1;
}

- (BOOL)isPhotosReadyForOnboarding
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int AppBooleanValue;
  int v9;
  BOOL v10;
  BOOL v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  +[CNPhotoLibraryProvider photoLibraryWithError:](CNPhotoLibraryProvider, "photoLibraryWithError:", &v14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v14;
  if (v2)
  {
    objc_msgSend(v2, "ratioOfAssetsAtOrAboveSceneAnalysisVersion:", 88);
    v5 = v4;
    objc_msgSend(v2, "ratioOfAssetsAtOrAboveFaceAnalysisVersion:", 11);
    v7 = v6;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PHAWallpaperSuggestionGenerationWeeklyTaskLibraryIsProcessedEnough"), CFSTR("com.apple.photoanalysisd"), 0);
    v9 = AppBooleanValue;
    v10 = v5 >= 0.75;
    if (v7 < 0.75)
      v10 = 0;
    if (AppBooleanValue)
      v11 = v10;
    else
      v11 = 0;
    objc_msgSend((id)objc_opt_class(), "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v16 = v5;
      v17 = 2048;
      v18 = v7;
      v19 = 1024;
      v20 = v9 != 0;
      _os_log_impl(&dword_18AC56000, v12, OS_LOG_TYPE_DEFAULT, "Is Photos app ready for onboarding: scene analysis ratio %.2f, face analysis ratio %.2f, suggestions defaults: %d", buf, 0x1Cu);
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = *(double *)&v3;
      _os_log_error_impl(&dword_18AC56000, v12, OS_LOG_TYPE_ERROR, "Unable to open photo library for onboarding %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)canShowOnboardingAllowingMultiplePhoneNumbers:(BOOL)a3
{
  void *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint8_t v14[16];

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFeatureEnabled:", 16);

  if (!v7)
    goto LABEL_6;
  v8 = -[CNSharedProfileOnboardingStateController accountCanCreateSNaP](self, "accountCanCreateSNaP");
  if (v8)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "featureFlags");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isFeatureEnabled:", 14);

      if (v11)
      {
        if (-[CNSharedProfileOnboardingStateController multiplePhoneNumbersTiedToAppleID](self, "multiplePhoneNumbersTiedToAppleID"))
        {
LABEL_6:
          LOBYTE(v8) = 0;
          return v8;
        }
      }
    }
    objc_msgSend((id)objc_opt_class(), "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_debug_impl(&dword_18AC56000, v12, OS_LOG_TYPE_DEBUG, "User can show onboarding", v14, 2u);
    }

    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)multiplePhoneNumbersTiedToAppleID
{
  return objc_msgSend(getIMNicknameControllerClass(), "multiplePhoneNumbersTiedToAppleID");
}

- (BOOL)iCloudSignedInToUseNicknames
{
  void *v2;
  char v3;

  objc_msgSend(getIMNicknameControllerClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "iCloudSignedInToUseNicknames");

  return v3;
}

- (BOOL)accountCanCreateSNaP
{
  void *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _BOOL4 v8;
  __int16 v10;
  __int16 v11;

  if (!-[CNSharedProfileOnboardingStateController iCloudSignedInToUseNicknames](self, "iCloudSignedInToUseNicknames"))
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11 = 0;
      v6 = "Cannot create SNaP on account because iCloud is not signed in";
      v7 = (uint8_t *)&v11;
LABEL_9:
      _os_log_impl(&dword_18AC56000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
    }
LABEL_10:

    return 0;
  }
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isFeatureEnabled:", 14) & 1) == 0)
  {
    v8 = -[CNSharedProfileOnboardingStateController multiplePhoneNumbersTiedToAppleID](self, "multiplePhoneNumbersTiedToAppleID");

    if (!v8)
      return 1;
    objc_msgSend((id)objc_opt_class(), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = 0;
      v6 = "Cannot create SNaP on account because multiple numbers are associated with Apple ID";
      v7 = (uint8_t *)&v10;
      goto LABEL_9;
    }
    goto LABEL_10;
  }

  return 1;
}

- (void)writeToDefaultsLastShownOnboardingVersion
{
  -[CNSharedProfileOnboardingStateController writeToDefaultsOnboardingVersion:](self, "writeToDefaultsOnboardingVersion:", 1);
}

- (void)writeToDefaultsOnboardingVersion:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "Writing to defaults, onboarding versions %ld", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInteger:forKey:", a3, CFSTR("CNSharedProfileOnboardingLastShownVersion"));

}

- (BOOL)hasCompletedOnboarding
{
  void *v2;
  int v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CNSharedProfileOnboardingCompleted"));

  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_debug_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEBUG, "Has completed onboarding: %d", (uint8_t *)v6, 8u);
  }

  return v3;
}

- (void)writeToDefaultsCompletedOnboarding:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "Writing to defaults, completed onboarding %d", (uint8_t *)v6, 8u);
  }

  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("CNSharedProfileOnboardingCompleted"));

}

- (BOOL)didSkipPosterSetup
{
  void *v2;
  int v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CNSharedProfileOnboardingDidSkipPosterSetup"));

  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_debug_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEBUG, "User skipped poster setup: %d", (uint8_t *)v6, 8u);
  }

  return v3;
}

- (int64_t)lastShowOnboardingVersionInSettings
{
  void *v2;
  int64_t v3;
  NSObject *v4;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("CNSharedProfileOnboardingLastShownSettingsVersion"));

  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_debug_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEBUG, "Last shown settings onboarding version: %ld", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (void)writeToDefaultsLastShownSettingsOnboardingVersion
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  objc_msgSend((id)objc_opt_class(), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18AC56000, v2, OS_LOG_TYPE_DEFAULT, "Writing to defaults, user has seen settings onboarding", v4, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInteger:forKey:", 1, CFSTR("CNSharedProfileOnboardingLastShownSettingsVersion"));

}

@end
