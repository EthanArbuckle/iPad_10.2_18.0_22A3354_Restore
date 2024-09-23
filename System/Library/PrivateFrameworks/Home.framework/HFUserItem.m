@implementation HFUserItem

- (id)hasDismissedWalletKeyExpressModeOnboardingOnThisDevice
{
  return -[HFUserItem _hasDismissedWalletKeyFeatureOnboardingForKeyPath:onThisDeviceKeyPath:](self, "_hasDismissedWalletKeyFeatureOnboardingForKeyPath:onThisDeviceKeyPath:", CFSTR("root.home.dismissedWalletKeyExpressModeOnboarding"), CFSTR("HFUserHasDismissedWalletKeyOnboardingOnThisDevice"));
}

- (BOOL)hasDismissedNaturalLightingOnboarding
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissedNaturalLightingOnboarding"), 1, 1);
}

- (BOOL)hasDismissedCameraRecordingReminderBanner
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissedCameraRecordingSetupBanner"), 1, 1);
}

- (BOOL)hasDismissedCameraRecordingOnboarding
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissedCameraRecordingOnboarding"), 1, 1);
}

- (BOOL)hasDismissedAccessCodeOnboarding
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissedAccessCodeOnboarding"), 1, 1);
}

- (HFUserItem)initWithHome:(id)a3 user:(id)a4 nameStyle:(unint64_t)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  HFUserItem *v12;

  v8 = (objc_class *)MEMORY[0x1E0C99EA0];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithSuiteName:", CFSTR("com.apple.Home.group"));
  v12 = -[HFUserItem initWithHome:user:nameStyle:userDefaults:](self, "initWithHome:user:nameStyle:userDefaults:", v10, v9, a5, v11);

  return v12;
}

- (HFUserItem)initWithHome:(id)a3 user:(id)a4 nameStyle:(unint64_t)a5 userDefaults:(id)a6
{
  id v11;
  id v12;
  id v13;
  HFUserItem *v14;
  HFUserItem *v15;
  HFUserNameFormatter *v16;
  HFUserNameFormatter *userNameFormatter;
  uint64_t v18;
  NSUUID *uniqueIdentifier;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HFUserItem;
  v14 = -[HFUserItem init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_home, a3);
    objc_storeStrong((id *)&v15->_hf_home, v15->_home);
    objc_storeStrong((id *)&v15->_user, a4);
    v16 = -[HFUserNameFormatter initWithHome:]([HFUserNameFormatter alloc], "initWithHome:", v11);
    userNameFormatter = v15->_userNameFormatter;
    v15->_userNameFormatter = v16;

    -[HFUserNameFormatter setStyle:](v15->_userNameFormatter, "setStyle:", a5);
    objc_storeStrong((id *)&v15->_userDefaults, a6);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v15->_uniqueIdentifier;
    v15->_uniqueIdentifier = (NSUUID *)v18;

    v15->_isItemGroup = 0;
    v15->_isContainedWithinItemGroup = 0;
    v15->_numberOfItemsContainedWithinGroup = 0;
  }

  return v15;
}

- (BOOL)hasDismissedAudioAnalysisOnboardingOnThisDevice
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint8_t v11[16];

  -[HFUserItem userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    HFLogForCategory(0x39uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch shared app suite user defaults!", v11, 2u);
    }

  }
  objc_msgSend(v3, "dictionaryForKey:", CFSTR("HFUserHasDismissedAudioAnalysisOnboarding"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "hmf_BOOLForKey:", v8);

  return v9;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (id)_hasDismissedWalletKeyFeatureOnboardingForKeyPath:(id)a3 onThisDeviceKeyPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  char v13;

  v6 = a4;
  if (-[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", a3, 1, 1))
  {
    -[HFUserItem home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_walletKeyUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __84__HFUserItem__hasDismissedWalletKeyFeatureOnboardingForKeyPath_onThisDeviceKeyPath___block_invoke;
    v11[3] = &unk_1EA7364E8;
    v11[4] = self;
    v12 = v6;
    v13 = 1;
    objc_msgSend(v8, "flatMap:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)_getBoolSettingsValueForKeyPath:(id)a3 defaultValue:(BOOL)a4 settingsType:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  char v9;
  void *v10;
  void *v11;

  v6 = a4;
  v8 = a3;
  if (HKFakeFeatureOnboardingSettings())
  {
    v9 = -[HFUserItem _getFakeBoolSettingsValueForKeyPath:defaultValue:](self, "_getFakeBoolSettingsValueForKeyPath:defaultValue:", v8, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFUserItem _getSettingsValueForKeyPath:defaultValue:settingsType:block:](self, "_getSettingsValueForKeyPath:defaultValue:settingsType:block:", v8, v10, a5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "BOOLValue");

  }
  return v9;
}

- (NSSet)homekitObjectIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFUserItem user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (id)_getSettingsValueForKeyPath:(id)a3 defaultValue:(id)a4 settingsType:(unint64_t)a5 block:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, void *);
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  int v25;
  HFUserItem *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, void *))a6;
  if (a5)
  {
    -[HFUserItem _privateSettings](self, "_privateSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFUserItem _privateSettingsValueManager](self, "_privateSettingsValueManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[HFUserItem _hasValidPrivateSettings](self, "_hasValidPrivateSettings"))
    {
      HFLogForCategory(0x39uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138412802;
        v26 = self;
        v27 = 2112;
        v28 = v10;
        v29 = 2112;
        v30 = v11;
        v16 = "%@ Read setting %@ failed - invalid private settings, returning default value %@";
LABEL_19:
        _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v25, 0x20u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
  }
  else
  {
    -[HFUserItem settings](self, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFUserItem hf_settingsValueManager](self, "hf_settingsValueManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[HFUserItem hasValidSettings](self, "hasValidSettings"))
    {
      HFLogForCategory(0x39uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138412802;
        v26 = self;
        v27 = 2112;
        v28 = v10;
        v29 = 2112;
        v30 = v11;
        v16 = "%@ Read setting %@ failed - invalid settings, returning default value %@";
        goto LABEL_19;
      }
LABEL_20:

      v18 = v11;
      goto LABEL_21;
    }
  }
  if (!v14)
    NSLog(CFSTR("Value manager was nil!"));
  objc_msgSend(v13, "hf_accessorySettingAtKeyPath:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v14, "valueForSetting:", v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  HFLogForCategory(0x39uLL);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138413058;
      v26 = self;
      v27 = 2112;
      v28 = v17;
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = v20;
      _os_log_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_DEFAULT, "Read setting item '%@/%@/%@' : value: %@", (uint8_t *)&v25, 0x2Au);
    }

    v23 = v20;
    if (!v12)
      goto LABEL_16;
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = 138413058;
      v26 = self;
      v27 = 2112;
      v28 = v17;
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = v11;
      _os_log_error_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_ERROR, "READ HMSETTING FAILED '%@/%@/%@' - returning default value: %@", (uint8_t *)&v25, 0x2Au);
    }

    v18 = v11;
    if (!v12)
      goto LABEL_16;
  }
  v12[2](v12, v17, v14);
LABEL_16:

LABEL_21:
  return v18;
}

- (id)_privateSettingsValueManager
{
  HFHomeKitSettingsValueManager *v4;
  HFHomeKitSettingsValueManager *v5;
  void *v6;
  void *v7;

  -[HFUserItem _privateSettings](self, "_privateSettings");
  v4 = (HFHomeKitSettingsValueManager *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_getAssociatedObject(self, a2);
    v4 = (HFHomeKitSettingsValueManager *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = [HFHomeKitSettingsValueManager alloc];
      -[HFUserItem _privateSettings](self, "_privateSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFUserItem homekitObjectIdentifiers](self, "homekitObjectIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[HFHomeKitSettingsValueManager initWithSettings:homeKitObjectIdentifiers:](v5, "initWithSettings:homeKitObjectIdentifiers:", v6, v7);

      objc_setAssociatedObject(self, a2, v4, (void *)1);
    }
  }
  return v4;
}

- (id)_privateSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFUserItem user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userSettingsForHome:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "privateSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (HMUser)user
{
  return self->_user;
}

- (BOOL)_hasValidPrivateSettings
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HFUserItem _privateSettings](self, "_privateSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_hf_home, 0);
  objc_storeStrong((id *)&self->_userNameFormatter, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

- (BOOL)hasDismissedCameraUpgradeBanner
{
  return !+[HFCameraUtilities forceDisplayOfDismissedCameraUpgradeBanner](HFCameraUtilities, "forceDisplayOfDismissedCameraUpgradeBanner")&& -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissedCameraUpgradeOfferBanner"), 1, 1);
}

- (BOOL)hasDismissedWelcomeUIBanner
{
  void *v3;
  void *v4;
  char v5;

  +[HFLocalSettingCachingUtility sharedInstance](HFLocalSettingCachingUtility, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem hf_home](self, "hf_home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "getWelcomeBannerDismissedLocalCachedValue:", v4);

  return (v5 & 1) != 0
      || -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissedWelcomeUI"), 0, 1);
}

- (HMHome)hf_home
{
  return self->_hf_home;
}

id __84__HFUserItem__hasDismissedWalletKeyFeatureOnboardingForKeyPath_onThisDeviceKeyPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "userDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      HFLogForCategory(0x39uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v19 = 136315138;
        v20 = "-[HFUserItem _hasDismissedWalletKeyFeatureOnboardingForKeyPath:onThisDeviceKeyPath:]_block_invoke";
        _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "(%s) Failed to fetch shared app suite user defaults!", (uint8_t *)&v19, 0xCu);
      }

    }
    objc_msgSend(v7, "dictionaryForKey:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "hmf_BOOLForKey:", v10);

  }
  else
  {
    v11 = 1;
  }
  if (*(_BYTE *)(a1 + 48))
    v12 = v11;
  else
    v12 = 0;
  HFLogForCategory(0x42uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(unsigned __int8 *)(a1 + 48);
    v19 = 136315906;
    v20 = "-[HFUserItem _hasDismissedWalletKeyFeatureOnboardingForKeyPath:onThisDeviceKeyPath:]_block_invoke";
    v21 = 1024;
    v22 = v14;
    v23 = 1024;
    v24 = v11;
    v25 = 1024;
    v26 = v12;
    _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "(%s) hasDismissedForHome = %{BOOL}d. hasDismissedOnThisDevice = %{BOOL}d. result = %{BOOL}d", (uint8_t *)&v19, 0x1Eu);
  }

  v15 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "futureWithResult:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (HFUserItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_user_nameStyle_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFUserItem.m"), 59, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFUserItem init]",
    v5);

  return 0;
}

+ (NSMutableDictionary)_fakeHMSettings
{
  if (_MergedGlobals_4_2 != -1)
    dispatch_once(&_MergedGlobals_4_2, &__block_literal_global_22_5);
  return (NSMutableDictionary *)(id)qword_1F03ED328;
}

void __29__HFUserItem__fakeHMSettings__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1F03ED328;
  qword_1F03ED328 = v0;

}

- (unint64_t)nameStyle
{
  void *v2;
  unint64_t v3;

  -[HFUserItem userNameFormatter](self, "userNameFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HFUserItem *v4;
  void *v5;
  void *v6;
  HFUserItem *v7;

  v4 = +[HFUserItem allocWithZone:](HFUserItem, "allocWithZone:", a3);
  -[HFUserItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFUserItem initWithHome:user:nameStyle:](v4, "initWithHome:user:nameStyle:", v5, v6, -[HFUserItem nameStyle](self, "nameStyle"));

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  HFMutableItemUpdateOutcome *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc_init(HFMutableItemUpdateOutcome);
  -[HFUserItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_handleForUser:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HFUserItem userNameFormatter](self, "userNameFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringForObjectValue:", v7);
  }
  else
  {
    -[HFUserItem user](self, "user");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, CFSTR("userID"));
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, CFSTR("title"));
  -[HFUserItem _accessDescription](self, "_accessDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, CFSTR("userAccessDescription"));

  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", CFSTR("Home.HomeSettings.UserHandle"), CFSTR("HFResultDisplayAccessibilityIDKey"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_accessDescription
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _HFLocalizedStringWithDefaultValue(CFSTR("HFUserAccessDescription"), CFSTR("HFUserAccessDescription"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hf_userIsOwner:", v5);

  if (v6)
  {
    v7 = CFSTR("HFUserOwnerAccessSuffix");
LABEL_5:
    _HFLocalizedStringWithDefaultValue(v7, v7, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[HFUserItem home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem user](self, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "hf_userIsAdministrator:", v9);

  if (v10)
  {
    v7 = CFSTR("HFUserAdminAccessSuffix");
    goto LABEL_5;
  }
  -[HFUserItem home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem user](self, "user");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "hf_userIsRestrictedGuest:", v15);

  if (!v16)
    return v3;
  -[HFUserItem home](self, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem user](self, "user");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "homeAccessControlForUser:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "restrictedGuestAccessSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "guestAccessSchedule");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFScheduleBuilder scheduleBuilderFromHomeAccessSchedule:](HFScheduleBuilder, "scheduleBuilderFromHomeAccessSchedule:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "build");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFScheduleUtilities localizedStringForSchedule:](HFScheduleUtilities, "localizedStringForSchedule:", v22);
  v12 = objc_claimAutoreleasedReturnValue();

  v3 = v19;
LABEL_6:

  v3 = (void *)v12;
  return v3;
}

- (NSSet)hf_dependentHomeKitObjectsForDownstreamItems
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "addObject:", self);
  -[HFUserItem settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v4);

  -[HFUserItem _privateSettings](self, "_privateSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v5);

  return (NSSet *)v3;
}

- (HFHomeKitSettingsAdapterManager)hf_settingsAdapterManager
{
  HFHomeKitSettingsAdapterManager *v4;

  objc_getAssociatedObject(self, a2);
  v4 = (HFHomeKitSettingsAdapterManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[HFHomeKitSettingsAdapterManager initWithHomeKitSettingsVendor:]([HFHomeKitSettingsAdapterManager alloc], "initWithHomeKitSettingsVendor:", self);
    objc_setAssociatedObject(self, a2, v4, (void *)1);
  }
  return v4;
}

- (HFHomeKitSettingsValueManager)hf_settingsValueManager
{
  HFHomeKitSettingsValueManager *v4;
  HFHomeKitSettingsValueManager *v5;
  void *v6;
  void *v7;

  -[HFUserItem settings](self, "settings");
  v4 = (HFHomeKitSettingsValueManager *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_getAssociatedObject(self, a2);
    v4 = (HFHomeKitSettingsValueManager *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = [HFHomeKitSettingsValueManager alloc];
      -[HFUserItem settings](self, "settings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFUserItem homekitObjectIdentifiers](self, "homekitObjectIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[HFHomeKitSettingsValueManager initWithSettings:homeKitObjectIdentifiers:](v5, "initWithSettings:homeKitObjectIdentifiers:", v6, v7);

      objc_setAssociatedObject(self, a2, v4, (void *)1);
    }
  }
  return v4;
}

- (HMSettings)settings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFUserItem user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userSettingsForHome:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMSettings *)v6;
}

- (BOOL)hasValidSettings
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HFUserItem settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_setSettingsValueForKeyPath:(id)a3 settingsType:(unint64_t)a4 usingBlock:(id)a5
{
  HFUserItem *v9;
  void (**v10)(id, void *, void *);
  void *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  HFUserItem *v23;
  const __CFString *v24;
  int v25;
  HFUserItem *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  HFUserItem *v30;
  __int16 v31;
  _WORD v32[15];

  *(_QWORD *)&v32[11] = *MEMORY[0x1E0C80C00];
  v9 = (HFUserItem *)a3;
  v10 = (void (**)(id, void *, void *))a5;
  if (a4)
  {
    -[HFUserItem _privateSettings](self, "_privateSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFUserItem _privateSettingsValueManager](self, "_privateSettingsValueManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HFUserItem _hasValidPrivateSettings](self, "_hasValidPrivateSettings");
  }
  else
  {
    -[HFUserItem settings](self, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFUserItem hf_settingsValueManager](self, "hf_settingsValueManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HFUserItem hasValidSettings](self, "hasValidSettings");
  }
  v14 = v13;
  if (v13 && v12)
  {
    objc_msgSend(v11, "hf_accessorySettingAtKeyPath:", v9);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v15, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x39uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        v25 = 138413058;
        v26 = self;
        v27 = 2112;
        v28 = v15;
        v29 = 2112;
        v30 = v9;
        v31 = 2112;
        *(_QWORD *)v32 = v16;
        _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "Updating setting item '%@/%@/%@' to value: %@", (uint8_t *)&v25, 0x2Au);
      }

      objc_msgSend(v12, "changeValueForSetting:toValue:", v15, v16);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v18)
      {
        v25 = 138412802;
        v26 = self;
        v27 = 2112;
        v28 = v15;
        v29 = 2112;
        v30 = v9;
        _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "Setting item '%@/%@/%@' not updated", (uint8_t *)&v25, 0x20u);
      }

      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v19;

  }
  else
  {
    HFLogForCategory(0x39uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v23 = (HFUserItem *)objc_claimAutoreleasedReturnValue();
      v25 = 138413314;
      v24 = CFSTR("private");
      v26 = v23;
      v27 = 2112;
      if (!a4)
        v24 = CFSTR("public");
      v28 = v24;
      v29 = 2112;
      v30 = self;
      v31 = 1024;
      *(_DWORD *)v32 = v14;
      v32[2] = 2112;
      *(_QWORD *)&v32[3] = v12;
      _os_log_error_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_ERROR, "%@: No valid %@ settings or value manager found on user: %@ - valid settings %{BOOL}d, value manager %@", (uint8_t *)&v25, 0x30u);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (id)_setBoolSettingsValueForKeyPath:(id)a3 newValue:(BOOL)a4 settingsType:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v10;
  _QWORD v11[4];
  BOOL v12;

  v6 = a4;
  v8 = a3;
  if (HKFakeFeatureOnboardingSettings())
  {
    -[HFUserItem _setFakeBoolSettingsValueForKeyPath:newValue:](self, "_setFakeBoolSettingsValueForKeyPath:newValue:", v8, v6);

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__HFUserItem__setBoolSettingsValueForKeyPath_newValue_settingsType___block_invoke;
    v11[3] = &__block_descriptor_33_e63___NSNumber_24__0__HMSetting_8__HFHomeKitSettingsValueManager_16l;
    v12 = v6;
    -[HFUserItem _setSettingsValueForKeyPath:settingsType:usingBlock:](self, "_setSettingsValueForKeyPath:settingsType:usingBlock:", v8, a5, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
}

uint64_t __68__HFUserItem__setBoolSettingsValueForKeyPath_newValue_settingsType___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)_isSettingsValueForKeyPath:(id)a3 atMaximumValue:(int64_t)a4 settingsType:(unint64_t)a5
{
  void *v6;
  int64_t v7;

  -[HFUserItem _getSettingsValueForKeyPath:defaultValue:settingsType:block:](self, "_getSettingsValueForKeyPath:defaultValue:settingsType:block:", a3, &unk_1EA7CC508, a5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7 >= a4;
}

- (id)_incrementSettingsValueForKeyPath:(id)a3 stepValue:(int64_t)a4 maximumValue:(int64_t)a5 settingsType:(unint64_t)a6
{
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__HFUserItem__incrementSettingsValueForKeyPath_stepValue_maximumValue_settingsType___block_invoke;
  v7[3] = &__block_descriptor_48_e63___NSNumber_24__0__HMSetting_8__HFHomeKitSettingsValueManager_16l;
  v7[4] = a5;
  v7[5] = a4;
  -[HFUserItem _setSettingsValueForKeyPath:settingsType:usingBlock:](self, "_setSettingsValueForKeyPath:settingsType:usingBlock:", a3, a6, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __84__HFUserItem__incrementSettingsValueForKeyPath_stepValue_maximumValue_settingsType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v6, "valueForSetting:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;
    v10 = objc_msgSend(v9, "integerValue");

    v11 = 0;
    if (v10 < *(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40) + v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_getFakeBoolSettingsValueForKeyPath:(id)a3 defaultValue:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  void *v19;
  void *v20;
  int v21;
  HFUserItem *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  HFLogForCategory(0x39uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%@ ACCESSING FAKE SETTINGS FOR %@ - DO NOT FILE RADARS.", (uint8_t *)&v21, 0x16u);
  }

  if (!HKFakeFeatureOnboardingSettings())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFUserItem.m"), 397, CFSTR("This is only useful for layout & design testing. Do not use unless you know what you are doing"));

  }
  +[HFUserItem _fakeHMSettings](HFUserItem, "_fakeHMSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFUserItem _fakeHMSettings](HFUserItem, "_fakeHMSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v7);

  }
  objc_opt_class();
  +[HFUserItem _fakeHMSettings](HFUserItem, "_fakeHMSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFUserItem.m"), 404, CFSTR("This should not happen"));

  }
  v17 = objc_msgSend(v16, "BOOLValue");

  return v17;
}

- (void)_setFakeBoolSettingsValueForKeyPath:(id)a3 newValue:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  HFUserItem *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  HFLogForCategory(0x39uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%@ ACCESSING FAKE SETTINGS FOR %@ - DO NOT FILE RADARS.", (uint8_t *)&v12, 0x16u);
  }

  if (!HKFakeFeatureOnboardingSettings())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFUserItem.m"), 413, CFSTR("This is only useful for layout & design testing. Do not use unless you know what you are doing"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFUserItem _fakeHMSettings](HFUserItem, "_fakeHMSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v7);

}

- (BOOL)hasDismissedVoiceProfileOnboarding
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissedIdentifyVoiceOnboarding"), 1, 1);
}

- (id)setDismissIdentifyVoiceOnboarding:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissedIdentifyVoiceOnboarding"), a3, 1);
}

- (BOOL)hasDismissedIdentifyVoiceReminderBanner
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissedIdentifyVoiceSetupBanner"), 1, 1);
}

- (id)setDismissIdentifyVoiceReminderBanner:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissedIdentifyVoiceSetupBanner"), a3, 1);
}

- (BOOL)hasDismissedAnnounceOnboarding
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissedAnnounceOnboarding"), 1, 1);
}

- (id)setDismissAnnounceOnboarding:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissedAnnounceOnboarding"), a3, 1);
}

- (BOOL)hasDismissedHomeTheaterOnboarding
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissedHomeTheaterOnboarding"), 1, 1);
}

- (id)setDismissHomeTheaterOnboarding:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissedHomeTheaterOnboarding"), a3, 1);
}

- (BOOL)hasDismissedTVViewingProfilesOnboarding
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissedTVViewingProfileOnboarding"), 1, 1);
}

- (id)setDismissTVViewingProfilesOnboarding:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissedTVViewingProfileOnboarding"), a3, 1);
}

- (BOOL)hasDismissedTVViewingProfilesReminderBanner
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissedTVViewingProfileSetupBanner"), 1, 1);
}

- (id)setDismissTVViewingProfilesReminderBanner:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissedTVViewingProfileSetupBanner"), a3, 1);
}

- (id)setDismissNaturalLightingOnboarding:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissedNaturalLightingOnboarding"), a3, 1);
}

- (id)setDismissCameraRecordingOnboarding:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissedCameraRecordingOnboarding"), a3, 1);
}

- (id)setDismissCameraRecordingReminderBanner:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissedCameraRecordingSetupBanner"), a3, 1);
}

- (id)setDismissCameraUpgradeBanner:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissedCameraUpgradeOfferBanner"), a3, 1);
}

- (id)setEnableIdentifyVoice:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.siri.identifyVoice"), a3, 0);
}

- (BOOL)isIdentifyVoiceEnabled
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.siri.identifyVoice"), 1, 0);
}

- (id)setPlaybackInfluencesForYou:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.music.playbackInfluencesForYou"), a3, 0);
}

- (BOOL)isPlaybackInfluencesForYouEnabled
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.music.playbackInfluencesForYou"), 1, 0);
}

- (id)setAllowiTunesAccount:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.music.allowiTunesAccount"), a3, 0);
}

- (BOOL)isAllowiTunesAccountEnabled
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.music.allowiTunesAccount"), 1, 0);
}

- (id)setDismissUserSplitMediaAccountWarning:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissedUserSplitMediaAccountWarning"), a3, 1);
}

- (BOOL)hasDismissedUserSplitMediaAccountWarning
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissedUserSplitMediaAccountWarning"), 1, 1);
}

- (id)setCompletedNonOwnerUserHomeSwitchingUI:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.completedSwitchingHomesOnboardingUI"), a3, 1);
}

- (BOOL)hasCompletedNonOwnerUserHomeSwitchingUI
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.completedSwitchingHomesOnboardingUI"), 0, 1);
}

- (id)setDismissedWelcomeUIBanner:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  +[HFLocalSettingCachingUtility sharedInstance](HFLocalSettingCachingUtility, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem hf_home](self, "hf_home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWelcomeBannerDismissedLocalCachedValue:home:", v3, v6);

  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissedWelcomeUI"), v3, 1);
}

- (id)setEnableAnnounce:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  -[HFUserItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeAccessControlForUser:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D519C0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__HFUserItem_setEnableAnnounce___block_invoke;
  v12[3] = &unk_1EA729EA0;
  v13 = v7;
  v14 = a3;
  v9 = v7;
  objc_msgSend(v8, "futureWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __32__HFUserItem_setEnableAnnounce___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__HFUserItem_setEnableAnnounce___block_invoke_2;
  v7[3] = &unk_1EA726968;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "updateAnnounceAccess:completionHandler:", v5, v7);

}

uint64_t __32__HFUserItem_setEnableAnnounce___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

- (BOOL)isAnnounceEnabled
{
  void *v3;
  void *v4;
  void *v5;

  -[HFUserItem home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeAccessControlForUser:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isAnnounceAccessAllowed");
  return (char)v4;
}

- (id)setDismissWalletKeyExpressModeOnboarding:(BOOL)a3 forWalletKeyUUID:(id)a4
{
  return -[HFUserItem _setDismissWalletKeyFeatureOnboarding:forWalletKeyUUID:featureDescription:keyPath:keyOnThisDevice:](self, "_setDismissWalletKeyFeatureOnboarding:forWalletKeyUUID:featureDescription:keyPath:keyOnThisDevice:", a3, a4, CFSTR("Express Mode"), CFSTR("root.home.dismissedWalletKeyExpressModeOnboarding"), CFSTR("HFUserHasDismissedWalletKeyOnboardingOnThisDevice"));
}

- (id)_setDismissWalletKeyFeatureOnboarding:(BOOL)a3 forWalletKeyUUID:(id)a4 featureDescription:(id)a5 keyPath:(id)a6 keyOnThisDevice:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  BOOL v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD aBlock[5];
  id v42;
  id v43;
  BOOL v44;
  _QWORD v45[4];

  v10 = a3;
  v45[2] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__HFUserItem__setDismissWalletKeyFeatureOnboarding_forWalletKeyUUID_featureDescription_keyPath_keyOnThisDevice___block_invoke;
  aBlock[3] = &unk_1EA736510;
  aBlock[4] = self;
  v16 = v13;
  v42 = v16;
  v44 = v10;
  v17 = v14;
  v43 = v17;
  v18 = a6;
  v19 = _Block_copy(aBlock);
  v20 = v19;
  if (v12)
  {
    v21 = (void *)MEMORY[0x1E0D519C0];
    v38[0] = v15;
    v38[1] = 3221225472;
    v38[2] = __112__HFUserItem__setDismissWalletKeyFeatureOnboarding_forWalletKeyUUID_featureDescription_keyPath_keyOnThisDevice___block_invoke_64;
    v38[3] = &unk_1EA736538;
    v22 = &v40;
    v40 = v19;
    v39 = v12;
    objc_msgSend(v21, "futureWithBlock:", v38);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v39;
  }
  else
  {
    -[HFUserItem home](self, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
    v33 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v15;
    v34[1] = 3221225472;
    v34[2] = __112__HFUserItem__setDismissWalletKeyFeatureOnboarding_forWalletKeyUUID_featureDescription_keyPath_keyOnThisDevice___block_invoke_2;
    v34[3] = &unk_1EA736560;
    v22 = &v36;
    v36 = v20;
    v34[4] = self;
    v35 = v16;
    v37 = v10;
    objc_msgSend(v26, "flatMap:", v34);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "recoverIgnoringError");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v33;
    v12 = 0;
    v24 = v35;
  }

  -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", v18, v10, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0D519C0];
  v45[0] = v23;
  v45[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "combineAllFutures:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

void __112__HFUserItem__setDismissWalletKeyFeatureOnboarding_forWalletKeyUUID_featureDescription_keyPath_keyOnThisDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x39uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(unsigned __int8 *)(a1 + 56);
    v16 = 138413314;
    v17 = v5;
    v18 = 2080;
    v19 = "-[HFUserItem _setDismissWalletKeyFeatureOnboarding:forWalletKeyUUID:featureDescription:keyPath:keyOnThisDevice:]_block_invoke";
    v20 = 2112;
    v21 = v6;
    v22 = 1024;
    v23 = v7;
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Setting Wallet Key %@ Onboarding value: %{BOOL}d for walletKeyUUID: %@", (uint8_t *)&v16, 0x30u);
  }

  objc_msgSend(*(id *)(a1 + 32), "userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    HFLogForCategory(0x39uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v16 = 138412802;
      v17 = v14;
      v18 = 2080;
      v19 = "-[HFUserItem _setDismissWalletKeyFeatureOnboarding:forWalletKeyUUID:featureDescription:keyPath:keyOnThisDevi"
            "ce:]_block_invoke";
      v20 = 2112;
      v21 = v15;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "(%@:%s) Failed to fetch shared app suite user defaults for %@", (uint8_t *)&v16, 0x20u);
    }

  }
  objc_msgSend(v8, "dictionaryForKey:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, v13);

  objc_msgSend(v8, "setObject:forKey:", v11, *(_QWORD *)(a1 + 48));
}

void __112__HFUserItem__setDismissWalletKeyFeatureOnboarding_forWalletKeyUUID_featureDescription_keyPath_keyOnThisDevice___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  v5 = a2;
  v4(v2, v3);
  objc_msgSend(v5, "finishWithNoResult");

}

id __112__HFUserItem__setDismissWalletKeyFeatureOnboarding_forWalletKeyUUID_featureDescription_keyPath_keyOnThisDevice___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "walletKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    HFLogForCategory(0x39uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(unsigned __int8 *)(a1 + 56);
      v11 = 138413058;
      v12 = v8;
      v13 = 2080;
      v14 = "-[HFUserItem _setDismissWalletKeyFeatureOnboarding:forWalletKeyUUID:featureDescription:keyPath:keyOnThisDevi"
            "ce:]_block_invoke_2";
      v15 = 2112;
      v16 = v9;
      v17 = 1024;
      v18 = v10;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "(%@:%s) Attempting to set wallet key %@ onboarding value: %{BOOL}d but it looks like Wallet Key doesn't exist!", (uint8_t *)&v11, 0x26u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)setDismissAccessCodeOnboarding:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissedAccessCodeOnboarding"), a3, 1);
}

- (BOOL)hasDismissedAccessoryFirmwareUpdateOnboarding
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissedAccessoryFirmwareUpdateOnboarding"), 1, 1);
}

- (id)setDismissAccessoryFirmwareUpdateOnboarding:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissedAccessoryFirmwareUpdateOnboarding"), a3, 1);
}

- (BOOL)shouldHideAddSceneButton
{
  return -[HFUserItem _isSettingsValueForKeyPath:atMaximumValue:settingsType:](self, "_isSettingsValueForKeyPath:atMaximumValue:settingsType:", CFSTR("root.home.addSceneButtonPresentedCount"), 4, 1);
}

- (id)incrementAddSceneButtonPresentedCount
{
  return -[HFUserItem _incrementSettingsValueForKeyPath:stepValue:maximumValue:settingsType:](self, "_incrementSettingsValueForKeyPath:stepValue:maximumValue:settingsType:", CFSTR("root.home.addSceneButtonPresentedCount"), 1, 4, 1);
}

- (id)setDismissedAudioAnalysisOnboardingOnThisDevice:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v15[16];

  v3 = a3;
  -[HFUserItem userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    HFLogForCategory(0x39uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch shared app suite user defaults!", v15, 2u);
    }

  }
  objc_msgSend(v5, "dictionaryForKey:", CFSTR("HFUserHasDismissedAudioAnalysisOnboarding"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v12);

  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("HFUserHasDismissedAudioAnalysisOnboarding"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)hasDismissedHomeHubMigrationBanner
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v14;
  void *v15;
  _BOOL4 v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[HFUserItem userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    HFLogForCategory(0x39uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "Failed to fetch shared app suite user defaults!", buf, 2u);
    }

  }
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("HFUserHasDismissedHomeHubMigrationBannerForThisDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v22 = 0;
    v6 = objc_msgSend(v4, "hmf_integerForKey:error:", CFSTR("majorVersion"), &v22);
    v7 = v22;
    if (v7)
    {
      HFLogForCategory(0x39uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = (uint64_t)v7;
        _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Failed to decode major OS version for when home hub migration banner was dismissed! Error: %@", buf, 0xCu);
      }
LABEL_16:
      v9 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v21 = 0;
    v10 = objc_msgSend(v5, "hmf_integerForKey:error:", CFSTR("minorVersion"), &v21);
    v11 = v21;
    if (v11)
    {
      v8 = v11;
      HFLogForCategory(0x39uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = (uint64_t)v8;
        _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "Failed to decode minor OS version for when home hub migration banner was dismissed! Error: %@", buf, 0xCu);
      }

      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      objc_msgSend(v14, "operatingSystemVersion");

    v16 = v10 < 0 && v6 == 0;
    v17 = v6 < 0 || v16;
    HFLogForCategory(0x39uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17 == 1)
    {
      if (v19)
      {
        *(_DWORD *)buf = 134218752;
        v24 = v6;
        v25 = 2048;
        v26 = v10;
        v27 = 2048;
        v28 = 0;
        v29 = 2048;
        v30 = 0;
        v20 = "Ignoring previous user dismissal for home hub migration banner due to updated system software. Previous OS"
              " version: %ld.%ld | Current OS version: %ld.%ld";
LABEL_32:
        _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0x2Au);
      }
    }
    else if (v19)
    {
      *(_DWORD *)buf = 134218752;
      v24 = v6;
      v25 = 2048;
      v26 = v10;
      v27 = 2048;
      v28 = 0;
      v29 = 2048;
      v30 = 0;
      v20 = "User did previously dismiss home hub migration banner on OS version: %ld.%ld | Current OS version: %ld.%ld";
      goto LABEL_32;
    }

    v8 = 0;
    v9 = v17 ^ 1;
    goto LABEL_17;
  }
  HFLogForCategory(0x39uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "User defaults for home hub migration banner dismissal with major/minor OS version does not exist!", buf, 2u);
  }
  v9 = 0;
LABEL_18:

  return v9;
}

- (id)setDismissedHomeHubMigrationBanner:(BOOL)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  -[HFUserItem userDefaults](self, "userDefaults", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    HFLogForCategory(0x39uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch shared app suite user defaults!", (uint8_t *)&v13, 2u);
    }

  }
  objc_msgSend(v3, "dictionaryForKey:", CFSTR("HFUserHasDismissedHomeHubMigrationBannerForThisDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = 0;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "operatingSystemVersion");
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("majorVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("minorVersion"));

  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("HFUserHasDismissedHomeHubMigrationBannerForThisDevice"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)hasDismissedUtilityOnboarding
{
  return -[HFUserItem _getBoolSettingsValueForKeyPath:defaultValue:settingsType:](self, "_getBoolSettingsValueForKeyPath:defaultValue:settingsType:", CFSTR("root.home.dismissed2024EnergyOnboarding"), 0, 1);
}

- (id)setDismissUtilityOnboarding:(BOOL)a3
{
  return -[HFUserItem _setBoolSettingsValueForKeyPath:newValue:settingsType:](self, "_setBoolSettingsValueForKeyPath:newValue:settingsType:", CFSTR("root.home.dismissed2024EnergyOnboarding"), a3, 1);
}

- (BOOL)isItemGroup
{
  return self->_isItemGroup;
}

- (BOOL)isContainedWithinItemGroup
{
  return self->_isContainedWithinItemGroup;
}

- (unint64_t)numberOfItemsContainedWithinGroup
{
  return self->_numberOfItemsContainedWithinGroup;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (HFUserNameFormatter)userNameFormatter
{
  return self->_userNameFormatter;
}

- (void)setHf_home:(id)a3
{
  objc_storeStrong((id *)&self->_hf_home, a3);
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

@end
