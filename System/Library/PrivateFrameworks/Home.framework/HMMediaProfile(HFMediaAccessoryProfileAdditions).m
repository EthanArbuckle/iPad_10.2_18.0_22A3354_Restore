@implementation HMMediaProfile(HFMediaAccessoryProfileAdditions)

- (id)accessories
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_setWithSafeObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mediaProfiles
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_setWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_home
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    HFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = a1;
      v14 = 2112;
      v15 = v11;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "%@:%@ nil home. Please file a radar against “Home App | New Bugs” with any info you have on what you were doing.", (uint8_t *)&v12, 0x16u);

    }
    if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", -1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleError:operationType:options:retryBlock:cancelBlock:", v7, CFSTR("HFOperationRemoveHomePodAlarm"), 0, 0, 0);

    }
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)hf_parentRoom
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "room");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_isCurrentAccessory
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isCurrentAccessory");

  return v2;
}

- (uint64_t)hf_offersAutomation
{
  return 1;
}

- (id)symptomsHandler
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "symptomsHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)symptoms
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "symptomsHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "symptoms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_fakeDebugSymptoms
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_fakeDebugSymptoms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_isReachable
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_360_0);

  return v2;
}

- (uint64_t)hf_supportsStereoPairing
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  int v14;

  objc_msgSend(a1, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 1;

  LODWORD(v2) = objc_msgSend(a1, "isItemGroup");
  objc_msgSend(a1, "hf_home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_backingAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_mediaSystemForAccessory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hf_isHomePod");

  v10 = (void *)MEMORY[0x1E0CBA668];
  objc_msgSend(a1, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "supportsMediaSystem:", v12);

  v14 = v3 & ~(_DWORD)v2;
  if (v6)
    v14 = 0;
  return v14 & v9 & v13;
}

- (uint64_t)hf_supportsMusicAlarm
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "hf_backingAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsMusicAlarm");

  HFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)v3)
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    objc_msgSend(a1, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Accessory Supports Music Alarm (%@) mediaProfileContainer (%@)", (uint8_t *)&v8, 0x16u);

  }
  return v3;
}

- (uint64_t)hf_showsAudioSettings
{
  return 0;
}

- (uint64_t)hf_supportsSoftwareUpdate
{
  return 1;
}

- (uint64_t)hf_isAppleMusicReachable
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_362);

  return v2;
}

- (uint64_t)hf_isAccessorySettingsReachable
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_363);

  return v2;
}

- (HFMediaValueManager)hf_mediaValueSource
{
  HFMediaValueManager *v4;

  objc_getAssociatedObject(a1, a2);
  v4 = (HFMediaValueManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[HFMediaValueManager initWithMediaProfileContainer:]([HFMediaValueManager alloc], "initWithMediaProfileContainer:", a1);
    objc_setAssociatedObject(a1, a2, v4, (void *)0x301);
  }
  return v4;
}

- (HFHomeKitSettingsAdapterManager)hf_settingsAdapterManager
{
  HFHomeKitSettingsAdapterManager *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, a2);
  v4 = (HFHomeKitSettingsAdapterManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    HFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315394;
      v8 = "-[HMMediaProfile(HFMediaAccessoryProfileAdditions) hf_settingsAdapterManager]";
      v9 = 2112;
      v10 = a1;
      _os_log_debug_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEBUG, "%s Creating new HFHomeKitSettingsAdapterManager for HMMediaProfile %@", (uint8_t *)&v7, 0x16u);
    }

    v4 = -[HFHomeKitSettingsAdapterManager initWithHomeKitSettingsVendor:]([HFHomeKitSettingsAdapterManager alloc], "initWithHomeKitSettingsVendor:", a1);
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

- (id)hf_categoryCapitalizedLocalizedDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_userFriendlyLocalizedCapitalizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_categoryLowercaseLocalizedDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_userFriendlyLocalizedLowercaseDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_dependentHomeKitObjectsForDownstreamItems
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

  objc_msgSend(v2, "addObject:", a1);
  objc_msgSend(a1, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v4);

  return v2;
}

- (uint64_t)hf_supportsMultiUser
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "supportsMultiUser");

  return v2;
}

- (uint64_t)hf_supportsMediaActions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "supportsMediaActions");

  return v2;
}

- (uint64_t)hf_homePodSupportsMultiUser
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hf_isHomePod"))
  {
    objc_msgSend(a1, "accessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "supportsMultiUser");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hf_homePodIsCapableOfShowingSplitAccountError
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  NSObject *v13;
  void *v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
    goto LABEL_7;
  objc_msgSend(a1, "hf_home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMultiUserEnabled");

  if (!v5)
    goto LABEL_7;
  objc_msgSend(a1, "hf_backingAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_isHomePod");

  if (!v7)
    goto LABEL_7;
  if (objc_msgSend(a1, "hf_homePodSupportsMultiUser")
    && (objc_msgSend(a1, "hf_home"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "hf_currentUserIsOwner"),
        v8,
        v9))
  {
    objc_msgSend(a1, "hf_home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "users");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count") == 0;

  }
  else
  {
LABEL_7:
    v12 = 0;
  }
  HFLogForCategory(5uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = +[HFUtilities isAMac](HFUtilities, "isAMac");
    objc_msgSend(a1, "hf_home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v25, "isMultiUserEnabled");
    objc_msgSend(a1, "hf_backingAccessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hf_isHomePod");
    v17 = objc_msgSend(a1, "hf_homePodSupportsMultiUser");
    objc_msgSend(a1, "hf_home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hf_currentUserIsOwner");
    objc_msgSend(a1, "hf_home");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "users");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414338;
    v27 = a1;
    v28 = 2112;
    v29 = v24;
    v30 = 1024;
    v31 = v12;
    v32 = 1024;
    v33 = v23;
    v34 = 1024;
    v35 = v22;
    v36 = 1024;
    v37 = v16;
    v38 = 1024;
    v39 = v17;
    v40 = 1024;
    v41 = v19;
    v42 = 1024;
    v43 = objc_msgSend(v21, "count") == 0;
    _os_log_debug_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEBUG, "%@:%@: %{BOOL}d (Mac = %{BOOL}d, MU enabled = %{BOOL}d, is HomePod = %{BOOL}d, MU HomePod = %{BOOL}d, is Owner = %{BOOL}d, Home has users = %{BOOL}d,)", buf, 0x40u);

  }
  return v12;
}

- (id)hf_deviceIdentifiers
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_setWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_mediaRouteIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_deviceIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)hasValidSettings
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "rootGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)homekitObjectIdentifiers
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)isItemGroup
{
  return 0;
}

- (BOOL)isContainedWithinItemGroup
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "hf_home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_mediaSystemForAccessory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (uint64_t)numberOfItemsContainedWithinGroup
{
  return 0;
}

- (id)hf_appleMusicCurrentLoggedInAccount
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "remoteLoginHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "loggedInAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_appleMusicCurrentLoggedInAccountDSID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_appleMusicCurrentLoggedInAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "aa_altDSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_homePodSupportsMultiUserLanguage
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke;
  v3[3] = &unk_1EA726388;
  v3[4] = a1;
  v3[5] = a2;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __106__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount__block_invoke;
  v3[3] = &unk_1EA726388;
  v3[4] = a1;
  v3[5] = a2;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __107__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent__block_invoke;
  v3[3] = &unk_1EA726388;
  v3[4] = a1;
  v3[5] = a2;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HFHomeKitSettingsValueManager)hf_settingsValueManager
{
  HFHomeKitSettingsValueManager *v4;
  HFHomeKitSettingsValueManager *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "settings");
  v4 = (HFHomeKitSettingsValueManager *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_getAssociatedObject(a1, a2);
    v4 = (HFHomeKitSettingsValueManager *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = [HFHomeKitSettingsValueManager alloc];
      objc_msgSend(a1, "settings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "homekitObjectIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[HFHomeKitSettingsValueManager initWithSettings:homeKitObjectIdentifiers:](v5, "initWithSettings:homeKitObjectIdentifiers:", v6, v7);

      objc_setAssociatedObject(a1, a2, v4, (void *)1);
    }
  }
  return v4;
}

- (HFMediaAccessoryCommonSettingsManager)hf_mediaAccessoryCommonSettingsManager
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HFMediaAccessoryCommonSettingsManager *v11;
  HFMediaAccessoryCommonSettingsManager *v12;
  void *v13;
  void *v15;
  char v16;

  objc_msgSend(a1, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hf_isSiriEndpoint") & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(a1, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "hf_isSiriEndpoint"))
  {

    goto LABEL_8;
  }
  objc_msgSend(a1, "accessories");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "siriEndpointProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v10, "supportsOnboarding");

  if ((v16 & 1) == 0)
  {
LABEL_6:
    v11 = 0;
    return v11;
  }
LABEL_8:
  objc_getAssociatedObject(a1, sel_hf_mediaAccessoryCommonSettingsManager);
  v11 = (HFMediaAccessoryCommonSettingsManager *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = [HFMediaAccessoryCommonSettingsManager alloc];
    objc_msgSend(a1, "hf_home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HFMediaAccessoryCommonSettingsManager initWithMediaProfileContainer:home:](v12, "initWithMediaProfileContainer:home:", a1, v13);

    objc_setAssociatedObject(a1, sel_hf_mediaAccessoryCommonSettingsManager, v11, (void *)1);
  }
  return v11;
}

- (HFSiriLanguageOptionsManager)hf_siriLanguageOptionsManager
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  HFSiriLanguageOptionsManager *v8;
  void *v9;
  void *v10;
  HFSiriLanguageOptionsManager *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a1, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hf_isSiriEndpoint"))
  {

  }
  else
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasOptedToHH2");

    if (!v7)
    {
      v8 = 0;
      return v8;
    }
  }
  objc_getAssociatedObject(a1, sel_hf_siriLanguageOptionsManager);
  v8 = (HFSiriLanguageOptionsManager *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "homeManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [HFSiriLanguageOptionsManager alloc];
    objc_msgSend(v10, "hf_accessorySettingsController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "accessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hf_home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HFSiriLanguageOptionsManager initWithSettingsController:accessoryIdentifier:home:](v11, "initWithSettingsController:accessoryIdentifier:home:", v12, v14, v15);

    objc_setAssociatedObject(a1, sel_hf_siriLanguageOptionsManager, v8, (void *)1);
  }
  return v8;
}

- (id)hf_analyticsClient
{
  void *v4;

  objc_getAssociatedObject(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64EC0]), "initWithErrorHandler:", &__block_literal_global_372_0);
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

- (id)hf_idsDeviceIdentifierWithError:()HFMediaAccessoryProfileAdditions
{
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v22;
  int v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasOptedToHH2");

  if (v7)
    v8 = CFSTR("com.apple.private.alloy.home");
  else
    v8 = CFSTR("com.apple.private.alloy.willow");
  HFLogForCategory(0x27uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = v8;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Performing IDS device lookup with service name %@", (uint8_t *)&v23, 0xCu);
  }

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", v8);
  objc_msgSend(a1, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "IDSDeviceForIDSService:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)IDSCopyIDForDevice();
  }
  else
  {
    HFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "accessory");
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v22;
      _os_log_error_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_ERROR, "Unable to obtain IDS Identifier for accessory: %@", (uint8_t *)&v23, 0xCu);

    }
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "na_safeSetObject:forKey:", v10, CFSTR("idsService"));
    objc_msgSend(v16, "na_safeSetObject:forKey:", 0, CFSTR("IDSDevice"));
    objc_msgSend(a1, "accessory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "na_safeSetObject:forKey:", v17, CFSTR("accessory"));

    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:operation:options:", 19, CFSTR("HFOperationFindIDSDeviceIdentifier"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a3)
      *a3 = objc_retainAutorelease(v18);
    +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logError:operationDescription:", v19, CFSTR("HFOperationFindIDSDeviceIdentifier"));

    v14 = 0;
  }

  return v14;
}

- (id)hf_fetchLogListWithTimeout:()HFMediaAccessoryProfileAdditions
{
  void *v4;
  id v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  id location;
  _QWORD v25[4];
  dispatch_queue_t v26;
  void *v27;
  id v28;
  id v29;

  v29 = 0;
  objc_msgSend(a1, "hf_idsDeviceIdentifierWithError:", &v29);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v29;
  if (v5)
  {
    v6 = (dispatch_queue_t)objc_opt_new();
    -[NSObject na_safeSetObject:forKey:](v6, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E0CB3388]);
    -[NSObject na_safeSetObject:forKey:](v6, "na_safeSetObject:forKey:", v4, CFSTR("idsDeviceIdentifier"));
    v7 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:operation:options:", 19, CFSTR("HFOperationHomePodDataAnalyticsRetrieveLogList"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureWithError:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.Home.dataAnalyticsLogListLoaderQueue", v10);

    v12 = (void *)MEMORY[0x1E0D519C0];
    v13 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke;
    v25[3] = &unk_1EA73A238;
    v6 = v11;
    v26 = v6;
    v27 = a1;
    v28 = v4;
    objc_msgSend(v12, "futureWithBlock:", v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    if (a2 > 0.0)
    {
      objc_initWeak(&location, v14);
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_4;
      v21[3] = &unk_1EA73A260;
      v22 = v6;
      objc_copyWeak(&v23, &location);
      objc_msgSend(v16, "afterDelay:performBlock:", v21, a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_6;
    v19[3] = &unk_1EA73A288;
    v20 = v15;
    v17 = v15;
    objc_msgSend(v14, "addCompletionBlock:", v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v26;
  }

  return v9;
}

- (id)hf_fetchLog:()HFMediaAccessoryProfileAdditions timeout:
{
  id v7;
  void *v8;
  id v9;
  dispatch_queue_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  id v30;
  id from;
  id location;
  _QWORD v33[4];
  dispatch_queue_t v34;
  void *v35;
  id v36;
  id v37;
  id v38[2];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFMediaProfileContainer.m"), 2370, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("log"));

  }
  v38[0] = 0;
  objc_msgSend(a1, "hf_idsDeviceIdentifierWithError:", v38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v38[0];
  if (v9)
  {
    v10 = (dispatch_queue_t)objc_opt_new();
    -[NSObject na_safeSetObject:forKey:](v10, "na_safeSetObject:forKey:", v9, *MEMORY[0x1E0CB3388]);
    -[NSObject na_safeSetObject:forKey:](v10, "na_safeSetObject:forKey:", v7, CFSTR("logFileName"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject na_safeSetObject:forKey:](v10, "na_safeSetObject:forKey:", v11, CFSTR("timeOut"));

    -[NSObject na_safeSetObject:forKey:](v10, "na_safeSetObject:forKey:", v8, CFSTR("idsDeviceIdentifier"));
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:operation:options:", 19, CFSTR("HFOperationHomePodDataAnalyticsRetrieveLogList"), v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.Home.dataAnalyticsLogLoaderQueue", v15);

    v17 = (void *)MEMORY[0x1E0D519C0];
    v18 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke;
    v33[3] = &unk_1EA737000;
    v10 = v16;
    v34 = v10;
    v35 = a1;
    v36 = v8;
    v37 = v7;
    objc_msgSend(v17, "futureWithBlock:", v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    if (a4 > 0.0)
    {
      objc_initWeak(&location, v19);
      objc_initWeak(&from, a1);
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v18;
      v27[1] = 3221225472;
      v27[2] = __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_4;
      v27[3] = &unk_1EA73A2B0;
      v28 = v10;
      objc_copyWeak(&v29, &location);
      objc_copyWeak(&v30, &from);
      objc_msgSend(v21, "afterDelay:performBlock:", v27, a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v30);
      objc_destroyWeak(&v29);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    v25[0] = v18;
    v25[1] = 3221225472;
    v25[2] = __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_398;
    v25[3] = &unk_1EA73A2D8;
    v26 = v20;
    v22 = v20;
    objc_msgSend(v19, "addCompletionBlock:", v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v34;
  }

  return v14;
}

- (uint64_t)hf_isFavorite
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 2);
}

- (uint64_t)hf_hasSetFavorite
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 2);
}

- (uint64_t)hf_effectiveIsFavorite
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 2);
}

- (uint64_t)hf_updateIsFavorite:()HFMediaAccessoryProfileAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 2);
}

- (uint64_t)hf_showInHomeDashboard
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 3);
}

- (uint64_t)hf_hasSetShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 3);
}

- (uint64_t)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 3);
}

- (uint64_t)hf_updateShowInHomeDashboard:()HFMediaAccessoryProfileAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 3);
}

- (id)hf_stateDumpBuilderWithContext:()HFMediaAccessoryProfileAdditions
{
  return _HFStateDumpBuilderForMediaProfileContainer(a1, a3);
}

- (id)hf_displayName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_serviceNameComponents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "composedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_dateAdded
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HFDateAddedForApplicationDataContainer(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_updateDateAdded:()HFMediaAccessoryProfileAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HFUpdateDateAddedForApplicationDataContainer(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)hf_supportsHomeTheater
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;

  objc_msgSend(a1, "hf_backingAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isHomePod");

  objc_msgSend(a1, "hf_backingAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = objc_msgSend(v4, "supportsAudioDestination");
  }
  else
  {
    v7 = objc_msgSend(v4, "hf_isAppleTV");

    if (!v7)
      return 0;
    objc_msgSend(a1, "hf_backingAccessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "audioDestinationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8 != 0;

  }
  return v6;
}

- (uint64_t)hf_supportsPreferredMediaUser
{
  void *v1;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_isHomePod");
  if ((v4 & 1) != 0
    || (objc_msgSend(a1, "hf_backingAccessory"),
        v1 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v1, "hf_isSiriEndpoint")))
  {
    objc_msgSend(a1, "hf_backingAccessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsPreferredMediaUser");

    if ((v4 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    v6 = 0;
  }

LABEL_7:
  return v6;
}

- (id)hf_preferredMediaUser
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "hf_supportsPreferredMediaUser"))
  {
    objc_msgSend(a1, "hf_backingAccessory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferredMediaUser");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (uint64_t)hf_preferredUserSelectionType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_backingAccessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "preferredUserSelectionType");

  return v2;
}

- (id)hf_identify
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "hf_backingAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isHomePod");

  if (v3)
  {
    objc_msgSend(a1, "hf_backingAccessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_identifyHomePod");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
