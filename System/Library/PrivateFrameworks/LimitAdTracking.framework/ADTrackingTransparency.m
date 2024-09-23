@implementation ADTrackingTransparency

- (BOOL)personalizedAds
{
  void *v2;
  BOOL v3;

  if (!-[ADTrackingTransparency personalizedAdsSwitchEnabled](self, "personalizedAdsSwitchEnabled"))
    return 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE637C0]) == 1;

  return v3;
}

- (BOOL)shouldPresentPersonalizedAdsOnboarding
{
  int64_t v3;
  void *v4;
  int v5;
  int64_t v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  const char *v11;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!-[ADTrackingTransparency personalizedAdsSwitchEnabled](self, "personalizedAdsSwitchEnabled"))
  {
    v8 = 0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return v8;
    v14 = 138412290;
    v15 = (id)objc_opt_class();
    v9 = v15;
    v10 = MEMORY[0x24BDACB70];
    v11 = "[%@] personalizedAdsSwitchEnabled is NO.";
LABEL_16:
    _os_log_impl(&dword_213A6F000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0xCu);

    return 0;
  }
  if (!-[ADTrackingTransparency personalizedAdsAvailableForAdPlatforms](self, "personalizedAdsAvailableForAdPlatforms"))
  {
    v8 = 0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return v8;
    v14 = 138412290;
    v15 = (id)objc_opt_class();
    v9 = v15;
    v10 = MEMORY[0x24BDACB70];
    v11 = "[%@] personalizedAdsAvailableForAdPlatforms is NO.";
    goto LABEL_16;
  }
  v3 = -[ADTrackingTransparency acknowledgedVersionForPersonalizedAds](self, "acknowledgedVersionForPersonalizedAds");
  if (v3 >= -[ADTrackingTransparency latestVersionForPersonalizedAdsConsent](self, "latestVersionForPersonalizedAdsConsent"))
  {
    v8 = 0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return v8;
    v14 = 138412290;
    v15 = (id)objc_opt_class();
    v9 = v15;
    v10 = MEMORY[0x24BDACB70];
    v11 = "[%@] acknowledgedVersionForPersonalizedAds is already set.";
    goto LABEL_16;
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.AdPlatforms"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("personalizedAdsDefaulted"));
  v6 = -[ADTrackingTransparency acknowledgedVersionForPersonalizedAds](self, "acknowledgedVersionForPersonalizedAds");
  if (v6 >= -[ADTrackingTransparency latestVersionForPersonalizedAdsConsent](self, "latestVersionForPersonalizedAdsConsent")|| ((-[ADTrackingTransparency personalizedAds](self, "personalizedAds") | v5) & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = (id)objc_opt_class();
      v7 = v15;
      _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] shouldPresentPersonalizedAdsOnboarding is TRUE.", (uint8_t *)&v14, 0xCu);

    }
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = (id)objc_opt_class();
      v13 = v15;
      _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] Previous selection for PA was made.", (uint8_t *)&v14, 0xCu);

      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_userAllowedToChangeSettings
{
  BOOL v3;
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[ADTrackingTransparency _isUserEDURestricted](self, "_isUserEDURestricted"))
  {
    v3 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = (id)objc_opt_class();
      v4 = v10;
      v5 = MEMORY[0x24BDACB70];
      v6 = "[%@] The device is in Education Mode.";
LABEL_7:
      _os_log_impl(&dword_213A6F000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0xCu);

      return 0;
    }
  }
  else
  {
    if (!-[ADTrackingTransparency _isUserManagedRestricted](self, "_isUserManagedRestricted"))
    {
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v7, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63978]) == 1;

      return v3;
    }
    v3 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = (id)objc_opt_class();
      v4 = v10;
      v5 = MEMORY[0x24BDACB70];
      v6 = "[%@] The device is in Managed Mode.";
      goto LABEL_7;
    }
  }
  return v3;
}

- (BOOL)personalizedAdsSwitchEnabled
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (-[ADTrackingTransparency isPersonalizedAdsScreenTimeRestricted](self, "isPersonalizedAdsScreenTimeRestricted"))
    return 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE637C0];
  v6 = objc_msgSend(v4, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE637C0]);

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The device has a profile installed that has a restriction on Personalized Advertising. Personalized Ads switch will be disabled and locked.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "effectiveBoolValueForSetting:", v5);

    if (v8 != 2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "There is a profile installed that has a restriction on Limit Ad Tracking Forced AND tracking is still enabled. Correcting config value.", v10, 2u);
      }
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBoolValue:forSetting:", 0, v5);

    }
    return 0;
  }
  return -[ADTrackingTransparency _userAllowedToChangeSettings](self, "_userAllowedToChangeSettings");
}

- (BOOL)isPersonalizedAdsScreenTimeRestricted
{
  void *v2;
  int v3;
  uint8_t v5[16];

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("advertising"));
  if (v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The device has a screen time restriction on Personalized Advertising. Personalized Ads switch will be disabled and locked.", v5, 2u);
  }

  return v3;
}

- (BOOL)_isUserManagedRestricted
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_activeiCloudAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "ams_isManagedAppleID") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "ams_isManagedAppleID");

  return v6;
}

- (BOOL)_isUserEDURestricted
{
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSharedIPad");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBoolValue:forSetting:", 0, *MEMORY[0x24BE63978]);

  }
  return v3;
}

- (BOOL)personalizedAdsAvailableForAdPlatforms
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.AdPlatforms"));
  objc_msgSend(v2, "objectForKey:", CFSTR("AdPlatformsPAAvailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v2, "BOOLForKey:", CFSTR("AdPlatformsPAAvailable"));
  else
    v4 = 1;

  return v4;
}

- (int64_t)latestVersionForPersonalizedAdsConsent
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.AdPlatforms"));
  objc_msgSend(v2, "objectForKey:", CFSTR("LatestPAVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v2, "integerForKey:", CFSTR("LatestPAVersion"));
  else
    v4 = 1;

  return v4;
}

- (int64_t)acknowledgedVersionForPersonalizedAds
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.AdPlatforms"));
  objc_msgSend(v2, "objectForKey:", CFSTR("acknowledgedPersonalizedAdsVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v3 = (void *)objc_msgSend(v2, "integerForKey:", CFSTR("acknowledgedPersonalizedAdsVersion"));

  return (int64_t)v3;
}

- (BOOL)crossAppTrackingAllowedSwitchEnabled
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE639A0];
  v5 = objc_msgSend(v3, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE639A0]);

  if (!v5)
    return -[ADTrackingTransparency _userAllowedToChangeSettings](self, "_userAllowedToChangeSettings");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The device has a profile installed that has a restriction on Limit Ad Tracking Forced  Cross App Tracking switch will be disabled and locked.", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "effectiveBoolValueForSetting:", v4);

  if (v7 != 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "There is a profile installed that has a restriction on Limit Ad Tracking Forced AND tracking is still enabled. Correcting config value.", v10, 2u);
    }
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBoolValue:forSetting:", 1, v4);

  }
  return 0;
}

- (int64_t)accountLevelSwitchDisabledReason
{
  void *v3;
  void *v4;
  int64_t v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[ADTrackingTransparency appTrackingXPCConnection:withInvalidation:](self, "appTrackingXPCConnection:withInvalidation:", &__block_literal_global, &__block_literal_global_13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create connection for accountLevelSwitchDisabledReason()", buf, 2u);
  }
  -[ADTrackingTransparency appTrackingServiceProxy:](self, "appTrackingServiceProxy:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to get accountLevelSwitchDisabledReason", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Starting synchronous remote call to getAccountLevelSwitchDisabledReason()", buf, 2u);
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__ADTrackingTransparency_accountLevelSwitchDisabledReason__block_invoke_14;
  v7[3] = &unk_24D0AA330;
  v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "getAccountLevelSwitchDisabledReasonWithHandler:", v7);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Returned from synchronous remote call to getAccountLevelSwitchDisabledReason()", buf, 2u);
  }
  objc_msgSend(v3, "invalidate");
  v5 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __58__ADTrackingTransparency_accountLevelSwitchDisabledReason__block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __58__ADTrackingTransparency_accountLevelSwitchDisabledReason__block_invoke_12()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Connection invalidated before completing", v0, 2u);
  }
}

void __58__ADTrackingTransparency_accountLevelSwitchDisabledReason__block_invoke_14(uint64_t a1, uint64_t a2)
{
  id v4;
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412546;
    v6 = (id)objc_opt_class();
    v7 = 2050;
    v8 = a2;
    v4 = v6;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] The disabled reason is %{public}ld.", (uint8_t *)&v5, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)shouldDisplayPAUI
{
  void *v3;
  void *v4;
  char v5;
  _QWORD v7[5];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  -[ADTrackingTransparency appTrackingXPCConnection:withInvalidation:](self, "appTrackingXPCConnection:withInvalidation:", &__block_literal_global_16, &__block_literal_global_18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create connection for DisplayPersonalizedAdsUI()", buf, 2u);
  }
  -[ADTrackingTransparency appTrackingServiceProxy:](self, "appTrackingServiceProxy:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to get DisplayPersonalizedAdsUI", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Starting synchronous remote call to DisplayPersonalizedAdsUI()", buf, 2u);
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__ADTrackingTransparency_shouldDisplayPAUI__block_invoke_19;
  v7[3] = &unk_24D0AA398;
  v7[4] = &v9;
  objc_msgSend(v4, "shouldDisplayPersonalizedAdsUI:", v7);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Returned from synchronous remote call to DisplayPersonalizedAdsUI()", buf, 2u);
  }
  objc_msgSend(v3, "invalidate");
  v5 = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __43__ADTrackingTransparency_shouldDisplayPAUI__block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __43__ADTrackingTransparency_shouldDisplayPAUI__block_invoke_17()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Connection invalidated before completing", v0, 2u);
  }
}

uint64_t __43__ADTrackingTransparency_shouldDisplayPAUI__block_invoke_19(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)accountRestrictionReason
{
  id v3;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (-[ADTrackingTransparency _isUserEDURestricted](self, "_isUserEDURestricted"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = (id)objc_opt_class();
      v3 = v7;
      _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] The device is in Education Mode.", (uint8_t *)&v6, 0xCu);

    }
    return 3;
  }
  else if (-[ADTrackingTransparency _isUserManagedRestricted](self, "_isUserManagedRestricted"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = (id)objc_opt_class();
      v5 = v7;
      _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] The device has a Managed account.", (uint8_t *)&v6, 0xCu);

    }
    return 4;
  }
  else
  {
    return -[ADTrackingTransparency accountLevelSwitchDisabledReason](self, "accountLevelSwitchDisabledReason");
  }
}

- (NSArray)adSwitchDisabledReasons
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ADTrackingTransparency isPersonalizedAdsScreenTimeRestricted](self, "isPersonalizedAdsScreenTimeRestricted"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE637C0]);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (-[ADTrackingTransparency _isUserEDURestricted](self, "_isUserEDURestricted"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  if (-[ADTrackingTransparency _isUserManagedRestricted](self, "_isUserManagedRestricted"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  v10 = -[ADTrackingTransparency accountLevelSwitchDisabledReason](self, "accountLevelSwitchDisabledReason");
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v13;
}

- (int64_t)crossAppTrackingAllowedSwitchDisabledReason
{
  void *v3;
  int v4;
  id v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE639A0]);

  if (!v4)
    return -[ADTrackingTransparency accountRestrictionReason](self, "accountRestrictionReason");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = (id)objc_opt_class();
    v5 = v8;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] The device has a profile installed that has a restriction on Allow Apps to Request to Track.", (uint8_t *)&v7, 0xCu);

  }
  return 6;
}

- (BOOL)crossAppTrackingAllowed
{
  void *v2;
  BOOL v3;

  if (!-[ADTrackingTransparency crossAppTrackingAllowedSwitchEnabled](self, "crossAppTrackingAllowedSwitchEnabled"))
    return 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE639A0]) != 1;

  return v3;
}

- (void)setCrossAppTrackingAllowed:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoolValue:forSetting:", !v3, *MEMORY[0x24BE639A0]);

}

- (int64_t)personalizedAdsSwitchDisabledReason
{
  id v3;
  void *v5;
  int v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (-[ADTrackingTransparency isPersonalizedAdsScreenTimeRestricted](self, "isPersonalizedAdsScreenTimeRestricted"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = (id)objc_opt_class();
      v3 = v9;
      _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] The device has a screen time restriction on Personalized Ads.", (uint8_t *)&v8, 0xCu);

    }
    return 8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE637C0]);

    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412290;
        v9 = (id)objc_opt_class();
        v7 = v9;
        _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] The device has a profile installed that has a restriction on Personalized Ads.", (uint8_t *)&v8, 0xCu);

      }
      return 7;
    }
    else
    {
      return -[ADTrackingTransparency accountRestrictionReason](self, "accountRestrictionReason");
    }
  }
}

- (BOOL)personalizedAdsAvailable
{
  _BOOL4 v2;
  const __CFString *v3;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = -[ADTrackingTransparency shouldDisplayPAUI](self, "shouldDisplayPAUI");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = CFSTR("will NOT");
    if (v2)
      v3 = CFSTR("will");
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The Personalized Ads UI %{public}@ render.", (uint8_t *)&v5, 0xCu);
  }
  return v2;
}

- (void)personalizedAdsAvailable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];

  v4 = a3;
  -[ADTrackingTransparency appTrackingXPCConnection:withInvalidation:](self, "appTrackingXPCConnection:withInvalidation:", &__block_literal_global_33, &__block_literal_global_35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create connection for DisplayPersonalizedAdsUI()", buf, 2u);
  }
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_38);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Started asynchronous remote call to DisplayPersonalizedAdsUI()", buf, 2u);
    }
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__ADTrackingTransparency_personalizedAdsAvailable___block_invoke_39;
    v8[3] = &unk_24D0AA440;
    v10 = v4;
    v9 = v5;
    objc_msgSend(v6, "shouldDisplayPersonalizedAdsUI:", v8);

  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to get DisplayPersonalizedAdsUI", buf, 2u);
    }
    if (v4)
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    objc_msgSend(v5, "invalidate");
  }

}

void __51__ADTrackingTransparency_personalizedAdsAvailable___block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __51__ADTrackingTransparency_personalizedAdsAvailable___block_invoke_34()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Connection invalidated", v0, 2u);
  }
}

void __51__ADTrackingTransparency_personalizedAdsAvailable___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = a2;
    v4 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 134218242;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Received error code %ld from remote call: %@", (uint8_t *)&v6, 0x16u);

  }
}

uint64_t __51__ADTrackingTransparency_personalizedAdsAvailable___block_invoke_39(uint64_t a1, uint64_t a2)
{
  const __CFString *v4;
  uint64_t v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("will NOT");
    if ((_DWORD)a2)
      v4 = CFSTR("will");
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The Personalized Ads UI %{public}@ render.", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)setAcknowledgedVersionForPersonalizedAds:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.AdPlatforms"));
  objc_msgSend(v5, "setInteger:forKey:", a3, CFSTR("acknowledgedPersonalizedAdsVersion"));
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PersonalizedAdsPreferenceDidChange"), 0);

}

- (BOOL)shouldShowPersonalizedAdsToggle
{
  void *v3;
  char v4;
  int64_t v5;
  char v6;

  if (!-[ADTrackingTransparency personalizedAdsSwitchEnabled](self, "personalizedAdsSwitchEnabled"))
    return 1;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.AdPlatforms"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("personalizedAdsDefaulted"));
  v5 = -[ADTrackingTransparency acknowledgedVersionForPersonalizedAds](self, "acknowledgedVersionForPersonalizedAds");
  if (v5 >= -[ADTrackingTransparency latestVersionForPersonalizedAdsConsent](self, "latestVersionForPersonalizedAdsConsent"))v6 = 1;
  else
    v6 = v4 ^ 1;

  return v6;
}

- (void)setPersonalizedAds:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v3 = a3;
  -[ADTrackingTransparency appTrackingXPCConnection:withInvalidation:](self, "appTrackingXPCConnection:withInvalidation:", &__block_literal_global_44, &__block_literal_global_46);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_48);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Starting asynchronous remote call to setPersonalizedAds()", buf, 2u);
      }
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __45__ADTrackingTransparency_setPersonalizedAds___block_invoke_49;
      v8[3] = &unk_24D0AA4C8;
      v9 = v5;
      objc_msgSend(v6, "setPersonalizedAds:withCompletionHandler:", v3, v8);

    }
    else if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to set personalized ads.", buf, 2u);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create connection to setPersonalizedAds()", buf, 2u);
  }

}

void __45__ADTrackingTransparency_setPersonalizedAds___block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __45__ADTrackingTransparency_setPersonalizedAds___block_invoke_45()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Connection invalidated", v0, 2u);
  }
}

void __45__ADTrackingTransparency_setPersonalizedAds___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = a2;
    v4 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 134218242;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Received error code %ld from remote call: %@", (uint8_t *)&v6, 0x16u);

  }
}

uint64_t __45__ADTrackingTransparency_setPersonalizedAds___block_invoke_49(uint64_t a1, int a2)
{
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("was NOT");
    if (a2)
      v4 = CFSTR("was");
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The Personalized Ads value %@ set.", (uint8_t *)&v6, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Returned from asynchronous remote call to setPersonalizedAds()", (uint8_t *)&v6, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)appTrackingXPCConnection:(id)a3 withInvalidation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ap.adprivacyd.opt-out"), 4096);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D17FD8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v8);

    objc_msgSend(v7, "setInvalidationHandler:", v6);
    objc_msgSend(v7, "setInterruptionHandler:", v5);
    objc_msgSend(v7, "resume");
    v9 = v7;
  }

  return v7;
}

- (id)appTrackingServiceProxy:(id)a3
{
  return (id)objc_msgSend(a3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_70);
}

void __50__ADTrackingTransparency_appTrackingServiceProxy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = a2;
    v4 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 134218242;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Received error code %ld from remote call: %@", (uint8_t *)&v6, 0x16u);

  }
}

@end
