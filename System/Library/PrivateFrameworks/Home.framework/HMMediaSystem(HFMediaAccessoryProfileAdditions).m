@implementation HMMediaSystem(HFMediaAccessoryProfileAdditions)

- (id)accessories
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "components", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "mediaProfile");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "accessory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "na_safeAddObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)mediaProfiles
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_169);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_home
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    HFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = a1;
      v13 = 2112;
      v14 = v10;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "%@:%@ nil home. Please file a radar against “Home App | New Bugs” with any info you have on what you were doing.", (uint8_t *)&v11, 0x16u);

    }
    if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", -1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleError:operationType:options:retryBlock:cancelBlock:", v6, CFSTR("HFOperationRemoveHomePodAlarm"), 0, 0, 0);

    }
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)hf_parentRoom
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "components");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)symptomsHandler
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "symptomsHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)symptoms
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "symptomsHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "symptoms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    HFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "symptomsHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "symptoms");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = a1;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Media system: %@, has symptoms: %@", (uint8_t *)&v11, 0x16u);

    }
  }
  objc_msgSend(a1, "symptomsHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "symptoms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)hf_isCurrentAccessory
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_276_0);

  return v2;
}

- (uint64_t)hf_isReachable
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_277);

  return v2;
}

- (uint64_t)hf_supportsStereoPairing
{
  return 0;
}

- (uint64_t)hf_supportsMusicAlarm
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  __CFString *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(a1, "accessories", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "supportsMusicAlarm"))
          {
            v3 = 0;
            goto LABEL_12;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v6)
          continue;
        break;
      }
    }
    v3 = 1;
LABEL_12:

    HFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if ((_DWORD)v3)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      objc_msgSend(a1, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Accessory Supports Music Alarm (%@) mediaprofilecontainer %@", buf, 0x16u);

    }
  }
  else
  {
    HFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "description");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "No Accessories Found that Supports Music Alarm mediaprofilecontainer %@", buf, 0xCu);

      v3 = 0;
    }
  }

  return v3;
}

- (uint64_t)hf_canShowInControlCenter
{
  return 1;
}

- (uint64_t)hf_showsAudioSettings
{
  return 1;
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
  v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_282_0);

  return v2;
}

- (uint64_t)hf_isAccessorySettingsReachable
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_283_1);

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
      v8 = "-[HMMediaSystem(HFMediaAccessoryProfileAdditions) hf_settingsAdapterManager]";
      v9 = 2112;
      v10 = a1;
      _os_log_debug_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEBUG, "%s Creating new HFHomeKitSettingsAdapterManager for HMMediaSystem %@", (uint8_t *)&v7, 0x16u);
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
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CBA1A8];
  objc_msgSend(a1, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_userFriendlyLocalizedCapitalizedDescription:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_categoryLowercaseLocalizedDescription
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CBA1A8];
  objc_msgSend(a1, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_userFriendlyLocalizedLowercaseDescription:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_dependentHomeKitObjectsForDownstreamItems
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "addObject:", a1);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v2, "addObject:", v8);
        objc_msgSend(v8, "mediaProfile");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hf_dependentHomeKitObjectsForDownstreamItems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "unionSet:", v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  objc_msgSend(a1, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v11);

  return v2;
}

- (uint64_t)hf_backingAccessory
{
  return 0;
}

- (uint64_t)hf_supportsMultiUser
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "supportsMultiUser"))
        {
          v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 1;
LABEL_11:

  return v6;
}

- (uint64_t)hf_supportsMediaActions
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "supportsMediaActions"))
        {
          v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 1;
LABEL_11:

  return v6;
}

- (uint64_t)hf_homePodSupportsMultiUser
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (!objc_msgSend(v6, "hf_isHomePod") || !objc_msgSend(v6, "supportsMultiUser"))
        {
          v7 = 0;
          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v7 = 1;
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v7 = 1;
  }
LABEL_13:

  return v7;
}

- (uint64_t)hf_homePodIsCapableOfShowingSplitAccountError
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v5), "mediaProfile");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "hf_homePodIsCapableOfShowingSplitAccountError");

        if (!v7)
        {
          v8 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (id)hf_deviceIdentifiers
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "deviceIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "na_safeAddObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
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

  objc_msgSend(a1, "mediaProfiles");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_288);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)isItemGroup
{
  return 1;
}

- (uint64_t)isContainedWithinItemGroup
{
  return 0;
}

- (uint64_t)numberOfItemsContainedWithinGroup
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");

  return v2;
}

- (id)hf_appleMusicCurrentLoggedInAccountDSID
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_289);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "anyObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)hf_appleMusicCurrentLoggedInAccount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "hf_appleMusicCurrentLoggedInAccountDSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "accessories");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_appleMusicCurrentLoggedInAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)hf_homePodSupportsMultiUserLanguage
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke;
  v3[3] = &unk_1EA726388;
  v3[4] = a1;
  v3[5] = a2;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  void *v16;

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
    objc_msgSend(a1, "accessories");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hf_home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HFSiriLanguageOptionsManager initWithSettingsController:accessoryIdentifier:home:](v11, "initWithSettingsController:accessoryIdentifier:home:", v12, v15, v16);

    objc_setAssociatedObject(a1, sel_hf_siriLanguageOptionsManager, v8, (void *)1);
  }
  return v8;
}

- (id)hf_fetchLogListWithTimeout:()HFMediaAccessoryProfileAdditions
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0D519C0];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("HMMediaSystem is a composite of several objects, and does not support fetching logs");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_errorWithCode:operation:options:", 19, CFSTR("HFOperationHomePodDataAnalyticsRetrieveLogList"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "futureWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_fetchLog:()HFMediaAccessoryProfileAdditions timeout:
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0D519C0];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("HMMediaSystem is a composite of several objects, and does not support fetching logs");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_errorWithCode:operation:options:", 19, CFSTR("HFOperationHomePodDataAnalyticsRetrieveLog"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "futureWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)hf_idsDeviceIdentifierWithError:()HFMediaAccessoryProfileAdditions
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:operation:options:", 20, CFSTR("HFOperationFindIDSDeviceIdentifier"), 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
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

- (uint64_t)hf_supportsHomeStatus
{
  return objc_msgSend(a1, "hf_shouldHideForContextType:", 1) ^ 1;
}

- (uint64_t)hf_isVisibleInHomeStatus
{
  if ((objc_msgSend(a1, "hf_isForcedVisibleInHomeStatus") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 1);
}

- (uint64_t)hf_hasSetVisibleInHomeStatus
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 1);
}

- (uint64_t)hf_isForcedVisibleInHomeStatus
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_300);

  return v2;
}

- (uint64_t)hf_updateIsVisibleInHomeStatus:()HFMediaAccessoryProfileAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 1);
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

- (__CFString)hf_tileSize
{
  void *v2;
  void *v3;
  id v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_tileSize__block_invoke;
  v9[3] = &unk_1EA72A2D8;
  v10 = v2;
  v4 = v2;
  objc_msgSend(v3, "na_each:", v9);

  objc_msgSend(v4, "na_mostCommonObject");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = CFSTR("HFTileResizableSizeSmall");
  v7 = v5;

  return v7;
}

- (id)hf_setTileSize:()HFMediaAccessoryProfileAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v4 = a3;
  objc_msgSend(a1, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_setTileSize___block_invoke;
  v11[3] = &unk_1EA73A0C8;
  v11[4] = v4;
  objc_msgSend(v6, "na_map:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flatMap:", &__block_literal_global_306);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)hf_itemClass
{
  return objc_opt_class();
}

- (id)hf_containedServices
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global_309);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_containedCharacteristics
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_containedServices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global_312);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_accessoryType
{
  return +[HFAccessoryType mediaSystemType](HFAccessoryType, "mediaSystemType");
}

- (uint64_t)hf_isInRoom:()HFMediaAccessoryProfileAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "hf_associatedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_isInRoom___block_invoke;
  v9[3] = &unk_1EA727840;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (id)hf_safeRoom
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_314);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "anyObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)hf_canSpanMultipleRooms
{
  return 0;
}

- (uint64_t)hf_isIdentifiable
{
  return 1;
}

- (uint64_t)hf_isMatterOnlyAccessory
{
  return 0;
}

- (id)hf_moveToRoom:()HFMediaAccessoryProfileAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a1, "hf_associatedAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_moveToRoom___block_invoke;
  v12[3] = &unk_1EA728740;
  v13 = v4;
  v8 = v4;
  objc_msgSend(v7, "na_map:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "combineAllFutures:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)hf_stateDumpBuilderWithContext:()HFMediaAccessoryProfileAdditions
{
  void *v4;
  void *v5;

  _HFStateDumpBuilderForMediaProfileContainer(a1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("components"));

  return v4;
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

- (id)hf_updateDateAdded:()HFMediaAccessoryProfileAdditions
{
  return HFUpdateDateAddedForApplicationDataContainer(a1, a3);
}

- (uint64_t)hf_supportsPreferredMediaUser
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v6, "hf_isHomePod") & 1) == 0 && !objc_msgSend(v6, "hf_isSiriEndpoint")
          || !objc_msgSend(v6, "supportsPreferredMediaUser"))
        {
          v7 = 0;
          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_13:

  return v7;
}

- (id)hf_preferredMediaUser
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "hf_supportsPreferredMediaUser"))
  {
    objc_msgSend(a1, "accessories");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "anyObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredMediaUser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (uint64_t)hf_preferredUserSelectionType
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredUserSelectionType");

  return v3;
}

- (id)hf_identify
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_317_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
