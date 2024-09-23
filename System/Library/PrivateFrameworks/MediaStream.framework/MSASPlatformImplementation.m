@implementation MSASPlatformImplementation

- (MSASPlatformImplementation)init
{
  MSASPlatformImplementation *v2;
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSASPlatformImplementation;
  v2 = -[MSASPlatformImplementation init](&v6, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

  }
  return v2;
}

- (id)albumSharingDaemon
{
  return (id)_daemon;
}

- (id)pathAlbumSharingDir
{
  if (pathAlbumSharingDir_once != -1)
    dispatch_once(&pathAlbumSharingDir_once, &__block_literal_global_681);
  return (id)pathAlbumSharingDir_path;
}

- (Class)pluginClass
{
  if (pluginClass_onceToken_673 != -1)
    dispatch_once(&pluginClass_onceToken_673, &__block_literal_global_9);
  return (Class)(id)pluginClass_class;
}

- (BOOL)shouldLogAtLevel:(int)a3
{
  return a3 != 7 || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
}

- (void)logLevel:(int)a3 personID:(id)a4 albumGUID:(id)a5 format:(id)a6
{
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = a6;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unexpected call to legacy logging method, please switch to os_log(): %@", (uint8_t *)&v7, 0xCu);
  }
}

- (id)baseSharingURLForPersonID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  objc_msgSend(v4, "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("MSASForcedBaseURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MSASPlatformImplementation accountStore](self, "accountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aa_appleAccountWithPersonID:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "propertiesForDataclass:", *MEMORY[0x1E0C8F410]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "URLByAppendingPathComponent:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("sharedstreams"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)deviceHasEnoughDiskSpaceRemainingToOperate
{
  char v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  if (deviceHasEnoughDiskSpaceRemainingToOperate_onceToken != -1)
    dispatch_once(&deviceHasEnoughDiskSpaceRemainingToOperate_onceToken, &__block_literal_global_23);
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MSASPlatformImplementation_deviceHasEnoughDiskSpaceRemainingToOperate__block_invoke_2;
  block[3] = &unk_1E994DB30;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)deviceHasEnoughDiskSpaceRemainingToOperate_queue, block);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)MMCSDownloadSocketOptionsForPersonID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MSASPlatform();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "albumSharingDaemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "powerBudgetForPersonID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "hasForegroundFocus") & 1) == 0)
    objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x1E0C93190], *MEMORY[0x1E0C93178]);
  if ((objc_msgSend(v8, "hasForegroundFocus") & 1) == 0 && (objc_msgSend(v8, "hasActiveTimers") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, *MEMORY[0x1E0C93250]);

  }
  if (objc_msgSend(v5, "count"))
    v10 = v5;
  else
    v10 = 0;

  return v10;
}

- (id)MMCSUploadSocketOptionsForPersonID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MSASPlatform();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "albumSharingDaemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "powerBudgetForPersonID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "hasForegroundFocus") & 1) == 0)
    objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x1E0C93190], *MEMORY[0x1E0C93178]);
  if (objc_msgSend(v5, "count"))
    v9 = v5;
  else
    v9 = 0;

  return v9;
}

- (BOOL)MSASIsAllowedToTransferMetadata
{
  void *v2;
  int v3;
  _BOOL4 v4;
  BOOL result;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  _BOOL4 v9;
  __int16 v10;
  __int16 v11;

  if (!-[MSASPlatformImplementation deviceHasEnoughDiskSpaceRemainingToOperate](self, "deviceHasEnoughDiskSpaceRemainingToOperate"))
  {
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v9)
      return result;
    v10 = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Not enough disk space to continue transferring metadata.";
    v8 = (uint8_t *)&v10;
    goto LABEL_7;
  }
  +[MSPauseManager sharedManager](MSPauseManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaused");

  if (v3)
  {
    v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v4)
      return result;
    v11 = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "mstreamd is paused. Not transferring metadata at this time.";
    v8 = (uint8_t *)&v11;
LABEL_7:
    _os_log_impl(&dword_1D51BF000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    return 0;
  }
  return 1;
}

- (BOOL)MSASIsAllowedToUploadAssets
{
  void *v2;
  int v3;
  _BOOL4 v4;
  BOOL result;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  _BOOL4 v9;
  __int16 v10;
  __int16 v11;

  if (!-[MSASPlatformImplementation deviceHasEnoughDiskSpaceRemainingToOperate](self, "deviceHasEnoughDiskSpaceRemainingToOperate"))
  {
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v9)
      return result;
    v10 = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Not enough disk space to continue uploading assets.";
    v8 = (uint8_t *)&v10;
    goto LABEL_7;
  }
  +[MSPauseManager sharedManager](MSPauseManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaused");

  if (v3)
  {
    v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v4)
      return result;
    v11 = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "mstreamd is paused. Not uploading assets at this time.";
    v8 = (uint8_t *)&v11;
LABEL_7:
    _os_log_impl(&dword_1D51BF000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    return 0;
  }
  return 1;
}

- (BOOL)MSASPersonIDIsAllowedToDownloadAssets:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  const char *v11;
  uint32_t v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MSASPlatformImplementation deviceHasEnoughDiskSpaceRemainingToOperate](self, "deviceHasEnoughDiskSpaceRemainingToOperate"))
  {
    -[MSASPlatformImplementation albumSharingDaemon](self, "albumSharingDaemon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPersonIDAllowedToDownloadAssets:", v4);

    if (v6)
    {
      +[MSPauseManager sharedManager](MSPauseManager, "sharedManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isPaused");

      if (!v8)
      {
        v9 = 1;
        goto LABEL_13;
      }
      v9 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        v10 = MEMORY[0x1E0C81028];
        v11 = "mstreamd is paused. Not downloading assets at this time.";
LABEL_8:
        v12 = 2;
LABEL_11:
        _os_log_impl(&dword_1D51BF000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v12);
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v4;
        v10 = MEMORY[0x1E0C81028];
        v11 = "%@ is not allowed to download assets at this time.";
        v12 = 12;
        goto LABEL_11;
      }
    }
  }
  else
  {
    v9 = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v10 = MEMORY[0x1E0C81028];
      v11 = "Not enough disk space to continue downloading assets.";
      goto LABEL_8;
    }
  }
LABEL_13:

  return v9;
}

- (id)_accountForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MSASPlatformImplementation accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_appleAccountWithPersonID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)personIDUsesProductionPushEnvironment:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[MSASPlatformImplementation _accountForPersonID:](self, "_accountForPersonID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertiesForDataclass:", *MEMORY[0x1E0C8F410]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("apsEnv"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("production"));

  return v6;
}

- (id)pushTokenForPersonID:(id)a3
{
  void *v3;
  void *v4;

  MSPlatform();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)personIDEnabledForAlbumSharing:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[MSASPlatformImplementation _accountForPersonID:](self, "_accountForPersonID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isEnabledForDataclass:", *MEMORY[0x1E0C8F410]);
  else
    v5 = 0;

  return v5;
}

- (id)personIDsEnabledForAlbumSharing
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASPlatformImplementation accountStore](self, "accountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = *MEMORY[0x1E0C8F410];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEnabledForDataclass:", v9))
        {
          objc_msgSend(v11, "aa_personID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "aa_personID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v3;
}

- (int)MMCSConcurrentConnectionsCount
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AlbumSharingMMCSConnections"), CFSTR("com.apple.mediastream.mstreamd"));
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "intValue");
    NSLog(CFSTR("Using user-defined MMCS connection count of %d."), v4);
  }
  else
  {
    LODWORD(v4) = 6;
  }

  return v4;
}

- (BOOL)shouldEnableNewFeatures
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.mediastream.mstreamd"));
  return CFPreferencesGetAppBooleanValue(CFSTR("shouldEnableNewFeatures"), CFSTR("com.apple.mediastream.mstreamd"), 0) != 0;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

void __72__MSASPlatformImplementation_deviceHasEnoughDiskSpaceRemainingToOperate__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t v21[16];
  __int16 v22;
  uint8_t buf[16];
  uint8_t v24[2];
  uint8_t v25[16];

  if (!deviceHasEnoughDiskSpaceRemainingToOperate_lastCheckDate)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Checking remaining disk space for the first time.", v25, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _throttledIndicatorFilePath();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    if (!v11)
    {
      v12 = _availableDiskBlocks() >> 9 < 0x4B;
      goto LABEL_17;
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_WORD *)v24 = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Detected that the process was shut down while throttled by disk space. Remaining throttled.";
    v8 = v24;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", deviceHasEnoughDiskSpaceRemainingToOperate_lastCheckDate);
  v4 = v3;

  if (v4 < 7.0)
    goto LABEL_19;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Checking remaining disk space again.", buf, 2u);
  }
  v5 = _availableDiskBlocks();
  if ((deviceHasEnoughDiskSpaceRemainingToOperate_state & 1) == 0 && v5 >> 9 <= 0x4A)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
LABEL_15:
      v12 = 1;
      goto LABEL_17;
    }
    v22 = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Disk space has become too low for continued operation.";
    v8 = (uint8_t *)&v22;
LABEL_14:
    _os_log_impl(&dword_1D51BF000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    goto LABEL_15;
  }
  if (v5 >> 11 > 0x18)
    v17 = deviceHasEnoughDiskSpaceRemainingToOperate_state;
  else
    v17 = 0;
  if (v17 != 1)
    goto LABEL_18;
  v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  v12 = 0;
  if (v18)
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Enough disk space has become available to continue operation.", v21, 2u);
    v12 = 0;
  }
LABEL_17:
  deviceHasEnoughDiskSpaceRemainingToOperate_state = v12;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)deviceHasEnoughDiskSpaceRemainingToOperate_lastCheckDate;
  deviceHasEnoughDiskSpaceRemainingToOperate_lastCheckDate = v13;

LABEL_19:
  if ((deviceHasEnoughDiskSpaceRemainingToOperate_state & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Disk space is too low for continued operation.", v19, 2u);
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _throttledIndicatorFilePath();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeToFile:options:error:", v16, 0, 0);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Disk space is OK to continue operations.", v20, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _throttledIndicatorFilePath();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtPath:error:", v16, 0);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (deviceHasEnoughDiskSpaceRemainingToOperate_state & 1) == 0;
}

void __72__MSASPlatformImplementation_deviceHasEnoughDiskSpaceRemainingToOperate__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("MSASPlatformImplementation disk space queue", 0);
  v1 = (void *)deviceHasEnoughDiskSpaceRemainingToOperate_queue;
  deviceHasEnoughDiskSpaceRemainingToOperate_queue = (uint64_t)v0;

}

void __41__MSASPlatformImplementation_pluginClass__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(CFSTR("/System/Library/MediaStreamPlugins"), "stringByAppendingPathComponent:", CFSTR("PhotoSharingPlugin.mediastream"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = (uint64_t)v0;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Loading Shared Streams plugin from %@", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "principalClass");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)pluginClass_class;
  pluginClass_class = v2;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = pluginClass_class;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Loaded class: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __49__MSASPlatformImplementation_pathAlbumSharingDir__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "MSMSUserDirectory");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Library"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("MediaStream"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("albumshare"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)pathAlbumSharingDir_path;
  pathAlbumSharingDir_path = v2;

}

@end
