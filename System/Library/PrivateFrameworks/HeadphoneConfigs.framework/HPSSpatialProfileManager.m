@implementation HPSSpatialProfileManager

+ (BOOL)isSettingsEnrollmentSupported
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v2 = (void *)MGCopyAnswer();
    v3 = objc_msgSend(v2, "BOOLValue");
    MGGetStringAnswer();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("iPhone"));
    v6 = MGGetBoolAnswer();
    v7 = v3 & v5;
    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "No";
      if (v7)
        v10 = "Yes";
      else
        v10 = "No";
      if (v3)
        v11 = "Yes";
      else
        v11 = "No";
      v14 = 136315906;
      v15 = v10;
      if (v5)
        v12 = "Yes";
      else
        v12 = "No";
      v16 = 2080;
      v17 = v11;
      v18 = 2080;
      v19 = v12;
      if (v6)
        v9 = "Yes";
      v20 = 2080;
      v21 = v9;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Feature Enabled, Local Support: %s, HW Support: %s, is iPhone: %s iPhone with ANE: %s", (uint8_t *)&v14, 0x2Au);
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

+ (BOOL)isProxCardEnrollmentSupportedForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  NSObject *v16;
  int v17;
  int v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  dispatch_time_t v24;
  intptr_t v25;
  NSObject *v26;
  const __CFString *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  id v34;
  int v35;
  _BOOL4 v36;
  _QWORD v37[4];
  NSObject *v38;
  _BYTE *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE buf[24];
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  uint8_t v50[4];
  const __CFString *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    sharedBluetoothSettingsLogComponent();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[HPSSpatialProfileManager isProxCardEnrollmentSupportedForDevice:].cold.1();
    LOBYTE(v17) = 0;
LABEL_49:

    goto LABEL_50;
  }
  if (_os_feature_enabled_impl())
  {
    v34 = a1;
    v35 = objc_msgSend(a1, "isSettingsEnrollmentSupported");
    v36 = +[HPSSpatialProfileManager isProxCardShowed](HPSSpatialProfileManager, "isProxCardShowed");
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pairedDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v41;
LABEL_5:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
        objc_msgSend(v10, "address");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uppercaseString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uppercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          if (v7)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v18 = objc_msgSend(v10, "getSpatialAudioPlatformSupport");
      v15 = v18 == 1;
      sharedBluetoothSettingsLogComponent();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = "NO";
        if (v18 == 1)
          v20 = "YES";
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v4;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v20;
        _os_log_impl(&dword_1DB30C000, v19, OS_LOG_TYPE_DEFAULT, "Spatial Profile: %@, Remote Support: %s", buf, 0x16u);
      }

      if ((v35 & (v18 == 1)) == 1)
      {
        v17 = (objc_msgSend(v34, "isProfileExisting") | v36) ^ 1;
        v15 = 1;
        goto LABEL_23;
      }
    }
    else
    {
LABEL_11:

      v15 = 0;
    }
    v17 = 0;
LABEL_23:
    if (!v36 && _os_feature_enabled_impl())
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28718]), "initWithCameraSession:", 0);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v45) = 0;
      v22 = dispatch_group_create();
      dispatch_group_enter(v22);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __67__HPSSpatialProfileManager_isProxCardEnrollmentSupportedForDevice___block_invoke;
      v37[3] = &unk_1EA29B3D0;
      v39 = buf;
      v23 = v22;
      v38 = v23;
      objc_msgSend(v21, "downloadHRTFAsset:withCompletion:", 1, v37);
      v24 = dispatch_time(0, 500000000);
      v25 = dispatch_group_wait(v23, v24);
      sharedBluetoothSettingsLogComponent();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = CFSTR("timed out");
        if (!v25)
          v27 = CFSTR("succeeded");
        *(_DWORD *)v50 = 138412290;
        v51 = v27;
        _os_log_impl(&dword_1DB30C000, v26, OS_LOG_TYPE_DEFAULT, "Spatial Profile: downloadAsset %@", v50, 0xCu);
      }

      if (v17)
        v17 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

      _Block_object_dispose(buf, 8);
    }
    sharedBluetoothSettingsLogComponent();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (v17)
        v28 = "Yes";
      else
        v28 = "No";
      if (v35)
        v29 = "Yes";
      else
        v29 = "No";
      if (v15)
        v30 = "Yes";
      else
        v30 = "No";
      if (objc_msgSend(v34, "isProfileExisting"))
        v31 = "Yes";
      else
        v31 = "No";
      *(_DWORD *)buf = 136316162;
      if (v36)
        v32 = "Yes";
      else
        v32 = "No";
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2080;
      v45 = v30;
      v46 = 2080;
      v47 = v31;
      v48 = 2080;
      v49 = v32;
      _os_log_impl(&dword_1DB30C000, v16, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Overall Support: %s => Feature Enabled, Local Support: %s, Remote Support: %s, Profile Existing: %s, Prox Card Presented: %s", buf, 0x34u);
    }
    goto LABEL_49;
  }
  LOBYTE(v17) = 0;
LABEL_50:

  return v17;
}

void __67__HPSSpatialProfileManager_isProxCardEnrollmentSupportedForDevice___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  sharedBluetoothSettingsLogComponent();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = a2;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "Spatial Profile: downloadHRTFAsset isDownloaded %d, path %@, error %@", (uint8_t *)v10, 0x1Cu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

+ (void)setProxCardShowed:(BOOL)a3 forDevice:(id)a4
{
  _BOOL4 v4;
  id v5;
  CFPropertyListRef *v6;
  NSObject *v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    v6 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
    if (!v4)
      v6 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
    CFPreferencesSetAppValue(CFSTR("isSpatialProfileShowed"), *v6, CFSTR("com.apple.BTServer"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.BTServer"));
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = "NO";
      if (v4)
        v8 = "YES";
      v9 = 136315394;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Set Prox Card Showd to %s for Device: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[HPSSpatialProfileManager setProxCardShowed:forDevice:].cold.1();
  }

}

+ (void)setProxCardShowed:(BOOL)a3
{
  _BOOL4 v3;
  CFPropertyListRef *v4;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  v4 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  if (a3)
    v4 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  CFPreferencesSetAppValue(CFSTR("isSpatialProfileShowed"), *v4, CFSTR("com.apple.BTServer"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.BTServer"));
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    v7 = 136315138;
    v8 = v6;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: update prox card status via Enrollment : %s ", (uint8_t *)&v7, 0xCu);
  }

}

+ (BOOL)isProxCardShowed
{
  int AppBooleanValue;
  NSObject *v3;
  const char *v4;
  const char *v5;
  BOOL v6;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(CFSTR("com.apple.BTServer"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("isSpatialProfileShowed"), CFSTR("com.apple.BTServer"), &keyExistsAndHasValidFormat);
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "YES";
    if (AppBooleanValue)
      v5 = "YES";
    else
      v5 = "NO";
    if (!keyExistsAndHasValidFormat)
      v4 = "NO";
    *(_DWORD *)buf = 136315394;
    v10 = v5;
    v11 = 2080;
    v12 = v4;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Check if prox card is shown, showed %s %s ", buf, 0x16u);
  }

  if (keyExistsAndHasValidFormat)
    v6 = AppBooleanValue == 0;
  else
    v6 = 1;
  return !v6;
}

+ (id)profileEnrollmentViewController
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_time_t v5;
  intptr_t v6;
  NSObject *v7;
  const __CFString *v8;
  HPSSpatialProfileSingeStepEnrollmentController *v9;
  HPSSpatialProfileNavigationController *v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28718]), "initWithCameraSession:", 0);
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__HPSSpatialProfileManager_profileEnrollmentViewController__block_invoke;
  v12[3] = &unk_1EA29B3F8;
  v14 = &v22;
  v15 = &v16;
  v4 = v3;
  v13 = v4;
  objc_msgSend(v2, "downloadHRTFAsset:withCompletion:", 1, v12);
  v5 = dispatch_time(0, 500000000);
  v6 = dispatch_group_wait(v4, v5);
  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("timed out");
    if (!v6)
      v8 = CFSTR("succeeded");
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: downloadAsset %@", buf, 0xCu);
  }

  if (*((_BYTE *)v23 + 24))
  {
    if (_os_feature_enabled_impl())
    {
      v9 = objc_alloc_init(HPSSpatialProfileSingeStepEnrollmentController);
      -[HPSSpatialProfileSingeStepEnrollmentController setDownloadAssetPath:](v9, "setDownloadAssetPath:", v17[5]);
    }
    else
    {
      v9 = objc_alloc_init(HPSSpatialProfileEnrollmentController);
    }
    v10 = -[HPSSpatialProfileNavigationController initWithRootViewController:]([HPSSpatialProfileNavigationController alloc], "initWithRootViewController:", v9);
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v9 = (HPSSpatialProfileSingeStepEnrollmentController *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super.super.super, OS_LOG_TYPE_ERROR))
      +[HPSSpatialProfileManager profileEnrollmentViewController].cold.1();
    v10 = 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __59__HPSSpatialProfileManager_profileEnrollmentViewController__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8;
  id v9;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  sharedBluetoothSettingsLogComponent();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109634;
    v11[1] = a2;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1DB30C000, v10, OS_LOG_TYPE_DEFAULT, "Spatial Profile: downloadHRTFAsset isDownloaded %d, path %@, error %@", (uint8_t *)v11, 0x1Cu);
  }

  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

+ (id)profileManagementSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D804E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_TITLE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, a1, 0, sel_spatialProfileStatus, objc_opt_class(), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)spatialProfileStatus
{
  void *v2;
  __CFString *v3;

  if (objc_msgSend(a1, "isProfileExisting"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ON"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = &stru_1EA29D890;
  }
  return v3;
}

+ (BOOL)isProfileExisting
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  int v7;
  BOOL v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v2 = objc_alloc_init(MEMORY[0x1E0D03420]);
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __45__HPSSpatialProfileManager_isProfileExisting__block_invoke;
  v13 = &unk_1EA29B420;
  v15 = &v16;
  v4 = v3;
  v14 = v4;
  objc_msgSend(v2, "fetchSoundProfileRecordWithCompletion:", &v10);

  v5 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v4, v5);
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *((unsigned __int8 *)v17 + 24);
    *(_DWORD *)buf = 67109120;
    v21 = v7;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: isProfileExisting %i", buf, 8u);
  }

  objc_msgSend(v2, "invalidate", v10, v11, v12, v13);
  v8 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __45__HPSSpatialProfileManager_isProfileExisting__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __45__HPSSpatialProfileManager_isProfileExisting__block_invoke_cold_2((uint64_t)v6, v7);
LABEL_4:

    goto LABEL_5;
  }
  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  v7 = v8;
  if (!v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __45__HPSSpatialProfileManager_isProfileExisting__block_invoke_cold_1();
    goto LABEL_4;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "soundProfileData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134217984;
    v13 = objc_msgSend(v9, "length");
    _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: isProfileExisting Profile Data Size: %lu", (uint8_t *)&v12, 0xCu);

  }
  objc_msgSend(v5, "soundProfileData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_5:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

+ (void)isProxCardEnrollmentSupportedForDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Cannot Get Prox Card Support, Invalid BT Address", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)setProxCardShowed:forDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Cannot Set Prox Card Showed, Invalid BT Address", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)profileEnrollmentViewController
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Spatial Profile: downloadAsset failed returning nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __45__HPSSpatialProfileManager_isProfileExisting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Spatial Profile: isProfileExisting Profile Record is empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __45__HPSSpatialProfileManager_isProfileExisting__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DB30C000, a2, OS_LOG_TYPE_ERROR, "Spatial Profile: isProfileExisting Error: %@", (uint8_t *)&v2, 0xCu);
}

@end
