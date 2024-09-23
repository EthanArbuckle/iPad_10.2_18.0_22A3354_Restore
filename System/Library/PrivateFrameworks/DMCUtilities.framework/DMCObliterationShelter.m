@implementation DMCObliterationShelter

- (BOOL)preserveWithError:(id *)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  const char *v16;
  BOOL v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[DMCObliterationShelter _stashDirectoryPath](self, "_stashDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DMCObliterationShelter _createDirectoryAtPathIfNeeded:error:](self, "_createDirectoryAtPathIfNeeded:error:", v5, a3);

  if (v6)
  {
    -[DMCObliterationShelter _generateConfigurationDictionary](self, "_generateConfigurationDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCObliterationShelter _configurationDictionaryPath_stash](self, "_configurationDictionaryPath_stash");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "DMCWriteToBinaryFile:", v8);

    if ((v9 & 1) != 0)
    {
      -[DMCObliterationShelter _configurationDictionaryPath_stash](self, "_configurationDictionaryPath_stash");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      DMCSetSkipBackupAttributeToItemAtPath(v10, 1);

      -[DMCObliterationShelter wifiProfileData](self, "wifiProfileData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[DMCObliterationShelter wifiProfileData](self, "wifiProfileData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMCObliterationShelter _wifiProfilePath_stash](self, "_wifiProfilePath_stash");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        objc_msgSend(v12, "writeToFile:options:error:", v13, 0, &v35);
        v14 = v35;

        if (v14)
        {
          v15 = *DMCLogObjects();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v37 = v14;
            v16 = "DMCObliterationShelter: Failed to store wifi profile data with error: %{public}@";
LABEL_17:
            _os_log_impl(&dword_1A4951000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
            goto LABEL_18;
          }
          goto LABEL_18;
        }
        -[DMCObliterationShelter _wifiProfilePath_stash](self, "_wifiProfilePath_stash");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        DMCSetSkipBackupAttributeToItemAtPath(v22, 1);

      }
      -[DMCObliterationShelter mdmProfileData](self, "mdmProfileData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[DMCObliterationShelter mdmProfileData](self, "mdmProfileData");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMCObliterationShelter _mdmProfilePath_stash](self, "_mdmProfilePath_stash");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        objc_msgSend(v24, "writeToFile:options:error:", v25, 0, &v34);
        v14 = v34;

        if (v14)
        {
          v15 = *DMCLogObjects();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v37 = v14;
            v16 = "DMCObliterationShelter: Failed to store mdm profile data with error: %{public}@";
            goto LABEL_17;
          }
LABEL_18:
          if (a3)
          {
            v14 = objc_retainAutorelease(v14);
            *a3 = v14;
          }
          v17 = 1;
          goto LABEL_21;
        }
        -[DMCObliterationShelter _mdmProfilePath_stash](self, "_mdmProfilePath_stash");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        DMCSetSkipBackupAttributeToItemAtPath(v27, 1);

      }
      -[DMCObliterationShelter cloudConfigurationDetails](self, "cloudConfigurationDetails");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        v17 = 1;
        goto LABEL_24;
      }
      -[DMCObliterationShelter cloudConfigurationDetails](self, "cloudConfigurationDetails");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCObliterationShelter _cloudConfigProfilePath_stash](self, "_cloudConfigProfilePath_stash");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "DMCWriteToBinaryFile:", v30);

      if ((v31 & 1) != 0)
      {
        -[DMCObliterationShelter _cloudConfigProfilePath_stash](self, "_cloudConfigProfilePath_stash");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 1;
        DMCSetSkipBackupAttributeToItemAtPath(v32, 1);

LABEL_24:
        return v17;
      }
      v33 = *DMCLogObjects();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v37 = 0;
        v19 = "DMCObliterationShelter: Failed to store cloud config profile with error: %{public}@";
        v20 = v33;
        v21 = 12;
        goto LABEL_10;
      }
    }
    else
    {
      v18 = *DMCLogObjects();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v19 = "DMCObliterationShelter: Failed to store configuration file";
        v20 = v18;
        v21 = 2;
LABEL_10:
        _os_log_impl(&dword_1A4951000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
      }
    }
    v14 = 0;
    v17 = 0;
LABEL_21:

    if (v14)
      v17 = 0;
    -[DMCObliterationShelter clear](self, "clear");
    v7 = v14;
    goto LABEL_24;
  }
  -[DMCObliterationShelter clear](self, "clear");
  return 0;
}

- (BOOL)retrieveWithError:(id *)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCObliterationShelter _configurationDictionaryPath_retrieve](self, "_configurationDictionaryPath_retrieve");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (v6)
  {
    -[DMCObliterationShelter setHasConfigFile:](self, "setHasConfigFile:", 1);
    v7 = (void *)MEMORY[0x1E0C99D80];
    -[DMCObliterationShelter _configurationDictionaryPath_retrieve](self, "_configurationDictionaryPath_retrieve");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "DMCDictionaryFromFile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Languages"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCObliterationShelter setLanguageStrings:](self, "setLanguageStrings:", v10);

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Locale"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCObliterationShelter setLocaleString:](self, "setLocaleString:", v11);

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IsSupervised"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCObliterationShelter setIsSupervised:](self, "setIsSupervised:", objc_msgSend(v12, "BOOLValue"));

  }
  -[DMCObliterationShelter _wifiProfilePath_retrieve](self, "_wifiProfilePath_retrieve");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "fileExistsAtPath:", v13);

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0C99D50];
    -[DMCObliterationShelter _wifiProfilePath_retrieve](self, "_wifiProfilePath_retrieve");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataWithContentsOfFile:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCObliterationShelter setWifiProfileData:](self, "setWifiProfileData:", v17);

  }
  -[DMCObliterationShelter _mdmProfilePath_retrieve](self, "_mdmProfilePath_retrieve");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v4, "fileExistsAtPath:", v18);

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0C99D50];
    -[DMCObliterationShelter _mdmProfilePath_retrieve](self, "_mdmProfilePath_retrieve");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dataWithContentsOfFile:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCObliterationShelter setMdmProfileData:](self, "setMdmProfileData:", v22);

  }
  -[DMCObliterationShelter _cloudConfigProfilePath_retrieve](self, "_cloudConfigProfilePath_retrieve");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v4, "fileExistsAtPath:", v23);

  if (v24)
  {
    v25 = (void *)MEMORY[0x1E0C99D80];
    -[DMCObliterationShelter _cloudConfigProfilePath_retrieve](self, "_cloudConfigProfilePath_retrieve");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "DMCDictionaryFromFile:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCObliterationShelter setCloudConfigurationDetails:](self, "setCloudConfigurationDetails:", v27);

  }
  return 1;
}

- (BOOL)clear
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  __int128 v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[DMCObliterationShelter setLanguageStrings:](self, "setLanguageStrings:", 0);
  -[DMCObliterationShelter setLocaleString:](self, "setLocaleString:", 0);
  -[DMCObliterationShelter setWifiProfileData:](self, "setWifiProfileData:", 0);
  -[DMCObliterationShelter setMdmProfileData:](self, "setMdmProfileData:", 0);
  -[DMCObliterationShelter setCloudConfigurationDetails:](self, "setCloudConfigurationDetails:", 0);
  -[DMCObliterationShelter setIsSupervised:](self, "setIsSupervised:", 0);
  -[DMCObliterationShelter setHasConfigFile:](self, "setHasConfigFile:", 0);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[DMCObliterationShelter _allPathsToClear](self, "_allPathsToClear");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    v9 = 1;
    *(_QWORD *)&v6 = 138543618;
    v16 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v3, "fileExistsAtPath:", v11, v16))
        {
          v17 = 0;
          objc_msgSend(v3, "removeItemAtPath:error:", v11, &v17);
          v12 = v17;
          if (v12)
          {
            v13 = v12;
            v14 = *DMCLogObjects();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v16;
              v23 = v11;
              v24 = 2114;
              v25 = v13;
              _os_log_impl(&dword_1A4951000, v14, OS_LOG_TYPE_ERROR, "DMCObliterationShelter: Failed to remove file from path: %{public}@, error: %{public}@", buf, 0x16u);
            }

            v9 = 0;
          }
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 1;
  }

  return v9 & 1;
}

- (void)migrateAllFiles
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCObliterationShelter _stashDirectoryPath](self, "_stashDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  v6 = *DMCLogObjects();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4951000, v6, OS_LOG_TYPE_DEFAULT, "DMCObliterationShelter: Migrating sheltered files.", buf, 2u);
    }
    -[DMCObliterationShelter _stashDirectoryPath](self, "_stashDirectoryPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCObliterationShelter _retrievalDirectoryPath](self, "_retrievalDirectoryPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v3, "moveItemAtPath:toPath:error:", v8, v9, &v12);
    v10 = v12;

    if (v10)
    {
      v11 = *DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v10;
        _os_log_impl(&dword_1A4951000, v11, OS_LOG_TYPE_ERROR, "DMCObliterationShelter: Failed to migrate stashed directory. Error: %{public}@", buf, 0xCu);
      }
      -[DMCObliterationShelter clear](self, "clear");
    }

  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4951000, v6, OS_LOG_TYPE_DEFAULT, "DMCObliterationShelter: Nothing to migrate.", buf, 2u);
  }

}

- (id)_generateConfigurationDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[DMCObliterationShelter languageStrings](self, "languageStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Languages"));

  -[DMCObliterationShelter localeString](self, "localeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Locale"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMCObliterationShelter isSupervised](self, "isSupervised"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("IsSupervised"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (BOOL)_createDirectoryAtPathIfNeeded:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "fileExistsAtPath:", v5) & 1) != 0)
  {
    v7 = 0;
    v8 = 1;
  }
  else
  {
    v11 = 0;
    v8 = 1;
    objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v11);
    v7 = v11;
    if (v7)
    {
      v9 = *DMCLogObjects();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v7;
        _os_log_impl(&dword_1A4951000, v9, OS_LOG_TYPE_ERROR, "DMCObliterationShelter: Failed to create stash directory with error: %{public}@", buf, 0xCu);
      }
      if (a4)
      {
        v7 = objc_retainAutorelease(v7);
        v8 = 0;
        *a4 = v7;
      }
      else
      {
        v8 = 0;
      }
    }
  }

  return v8;
}

- (id)generateExclusionPaths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_opt_new();
  -[DMCObliterationShelter _configurationDictionaryPath_stash](self, "_configurationDictionaryPath_stash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  if (+[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCObliterationShelter _containerMetadataPlistPath_stash](self, "_containerMetadataPlistPath_stash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

    if (v7)
    {
      -[DMCObliterationShelter _containerMetadataPlistPath_stash](self, "_containerMetadataPlistPath_stash");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v8);

    }
  }
  -[DMCObliterationShelter wifiProfileData](self, "wifiProfileData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DMCObliterationShelter _wifiProfilePath_stash](self, "_wifiProfilePath_stash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  -[DMCObliterationShelter mdmProfileData](self, "mdmProfileData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[DMCObliterationShelter _mdmProfilePath_stash](self, "_mdmProfilePath_stash");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  -[DMCObliterationShelter cloudConfigurationDetails](self, "cloudConfigurationDetails");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[DMCObliterationShelter _cloudConfigProfilePath_stash](self, "_cloudConfigProfilePath_stash");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  v15 = (void *)objc_msgSend(v3, "copy");

  return v15;
}

- (id)_allPathsToClear
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__4;
  v9 = __Block_byref_object_dispose__4;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__DMCObliterationShelter__allPathsToClear__block_invoke;
  v4[3] = &unk_1E4D37480;
  v4[4] = self;
  v4[5] = &v5;
  if (_allPathsToClear_onceToken != -1)
    dispatch_once(&_allPathsToClear_onceToken, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__DMCObliterationShelter__allPathsToClear__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_stashDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "_retrievalDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_stashDirectoryPath
{
  if (+[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad"))
    MDMSystemReturnToServiceStorageDirectory();
  else
    MDMUserReturnToServiceStorageDirectory();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_configurationDictionaryPath_stash
{
  void *v2;
  void *v3;

  -[DMCObliterationShelter _stashDirectoryPath](self, "_stashDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("config_stash.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_wifiProfilePath_stash
{
  void *v2;
  void *v3;

  -[DMCObliterationShelter _stashDirectoryPath](self, "_stashDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("wifi_profile_stash.mobileconfig"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_mdmProfilePath_stash
{
  void *v2;
  void *v3;

  -[DMCObliterationShelter _stashDirectoryPath](self, "_stashDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("mdm_profile_stash.mobileconfig"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_cloudConfigProfilePath_stash
{
  void *v2;
  void *v3;

  -[DMCObliterationShelter _stashDirectoryPath](self, "_stashDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("cloud_config_profile_stash.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_configurationDictionaryPath_retrieve
{
  void *v2;
  void *v3;

  -[DMCObliterationShelter _retrievalDirectoryPath](self, "_retrievalDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("config_stash.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_wifiProfilePath_retrieve
{
  void *v2;
  void *v3;

  -[DMCObliterationShelter _retrievalDirectoryPath](self, "_retrievalDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("wifi_profile_stash.mobileconfig"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_mdmProfilePath_retrieve
{
  void *v2;
  void *v3;

  -[DMCObliterationShelter _retrievalDirectoryPath](self, "_retrievalDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("mdm_profile_stash.mobileconfig"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_cloudConfigProfilePath_retrieve
{
  void *v2;
  void *v3;

  -[DMCObliterationShelter _retrievalDirectoryPath](self, "_retrievalDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("cloud_config_profile_stash.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasConfigFile
{
  return self->_hasConfigFile;
}

- (void)setHasConfigFile:(BOOL)a3
{
  self->_hasConfigFile = a3;
}

- (NSArray)languageStrings
{
  return self->_languageStrings;
}

- (void)setLanguageStrings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localeString
{
  return self->_localeString;
}

- (void)setLocaleString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)wifiProfileData
{
  return self->_wifiProfileData;
}

- (void)setWifiProfileData:(id)a3
{
  objc_storeStrong((id *)&self->_wifiProfileData, a3);
}

- (NSData)mdmProfileData
{
  return self->_mdmProfileData;
}

- (void)setMdmProfileData:(id)a3
{
  objc_storeStrong((id *)&self->_mdmProfileData, a3);
}

- (NSDictionary)cloudConfigurationDetails
{
  return self->_cloudConfigurationDetails;
}

- (void)setCloudConfigurationDetails:(id)a3
{
  objc_storeStrong((id *)&self->_cloudConfigurationDetails, a3);
}

- (BOOL)isSupervised
{
  return self->_isSupervised;
}

- (void)setIsSupervised:(BOOL)a3
{
  self->_isSupervised = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudConfigurationDetails, 0);
  objc_storeStrong((id *)&self->_mdmProfileData, 0);
  objc_storeStrong((id *)&self->_wifiProfileData, 0);
  objc_storeStrong((id *)&self->_localeString, 0);
  objc_storeStrong((id *)&self->_languageStrings, 0);
}

@end
