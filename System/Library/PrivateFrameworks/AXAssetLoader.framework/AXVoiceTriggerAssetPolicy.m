@implementation AXVoiceTriggerAssetPolicy

- (id)assetType
{
  return CFSTR("com.apple.MobileAsset.AXSoundActions");
}

- (id)launchActivityIdentifier
{
  return CFSTR("com.apple.ax.AXSoundActions.LaunchActivity");
}

- (BOOL)shouldCopyLocally
{
  return 1;
}

- (id)maxSupportedFormatVersion
{
  return &unk_1E95D7BC0;
}

- (id)minSupportedFormatVersion
{
  return &unk_1E95D7BC0;
}

- (BOOL)daemonShouldDownloadInBackgroundIfNeeded
{
  return +[AXVoiceTriggerAssetPolicy _soundSwitchesEnabled](AXVoiceTriggerAssetPolicy, "_soundSwitchesEnabled");
}

- (id)assetsToPurgeFromInstalledAssets:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[16];

  v4 = a3;
  if (+[AXVoiceTriggerAssetPolicy _soundSwitchesEnabled](AXVoiceTriggerAssetPolicy, "_soundSwitchesEnabled")|| +[AXVoiceTriggerAssetPolicy _assetsUsedInLastSixMonths](AXVoiceTriggerAssetPolicy, "_assetsUsedInLastSixMonths"))
  {
    v9.receiver = self;
    v9.super_class = (Class)AXVoiceTriggerAssetPolicy;
    -[AXAssetPolicy assetsToPurgeFromInstalledAssets:](&v9, sel_assetsToPurgeFromInstalledAssets_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AXLogSoundActions();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3F8E000, v6, OS_LOG_TYPE_DEFAULT, "Sound Actions Assets have been unused for 6 months. Purging.", buf, 2u);
    }

    v5 = v4;
  }
  v7 = v5;

  return v7;
}

+ (BOOL)_assetsUsedInLastSixMonths
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(getAXSettingsClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "soundActionsLastModelAccess");
  v4 = v3;

  return CFAbsoluteTimeGetCurrent() - v4 < 15724800.0;
}

+ (BOOL)_soundSwitchesEnabled
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  _QWORD *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(getAXSettingsClass(), "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assistiveTouchSwitches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "source");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        v17 = &v16;
        v18 = 0x2020000000;
        v8 = (_QWORD *)getSCATSwitchSourceSoundSymbolLoc_ptr;
        v19 = getSCATSwitchSourceSoundSymbolLoc_ptr;
        if (!getSCATSwitchSourceSoundSymbolLoc_ptr)
        {
          v9 = (void *)AccessibilityUtilitiesLibrary();
          v8 = dlsym(v9, "SCATSwitchSourceSound");
          v17[3] = (uint64_t)v8;
          getSCATSwitchSourceSoundSymbolLoc_ptr = (uint64_t)v8;
        }
        _Block_object_dispose(&v16, 8);
        if (!v8)
        {
          -[AXAudiogramIngestionAssetPolicy init].cold.1();
          __break(1u);
        }
        v10 = objc_msgSend(v7, "isEqualToString:", *v8);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_14;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_14:

  return v4;
}

@end
