@implementation MPPlaybackUserDefaults

- (NSNumber)isPrivateListeningEnabled
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSUserDefaults BOOLForKey:](self->_mediaPlaybackCoreUserDefaults, "BOOLForKey:", CFSTR("MPCPlaybackPrivateListeningEnabled")));
}

void __48__MPPlaybackUserDefaults__loadAccountProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  char IsAudioAccessory;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v3, "getPropertiesForUserIdentity:error:", v2, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;

  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v2;
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "MPPlaybackUserDefaults: _loadAccountProperties: getPropertiesForUserIdentity: identity=%{public}@ error=%{public}@", buf, 0x16u);

    }
  }
  if (v4)
  {
    objc_msgSend(v4, "privateListeningEnabled");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "isDevicePrivateListeningEnabled");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 == v9)
    {

    }
    else
    {
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) == 0)
      {
        IsAudioAccessory = MSVDeviceIsAudioAccessory();

        if ((IsAudioAccessory & 1) == 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v8, CFSTR("MPCPlaybackPrivateListeningEnabled"));
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsPrivateListeningEnabledDidChangeNotification"), *(_QWORD *)(a1 + 32));
          goto LABEL_14;
        }
LABEL_12:
        if (v8)
        {
LABEL_15:

          goto LABEL_16;
        }
        objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __48__MPPlaybackUserDefaults__loadAccountProperties__block_invoke_211;
        v13[3] = &unk_1E315AB30;
        v13[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v12, "updatePropertiesForUserIdentity:usingBlock:", v2, v13);
LABEL_14:

        goto LABEL_15;
      }
    }

    goto LABEL_12;
  }
LABEL_16:

}

- (NSNumber)isDevicePrivateListeningEnabled
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSUserDefaults BOOLForKey:](self->_mediaPlaybackCoreUserDefaults, "BOOLForKey:", CFSTR("MPCPlaybackPrivateListeningEnabled")));
}

+ (MPPlaybackUserDefaults)standardUserDefaults
{
  if (standardUserDefaults_onceToken != -1)
    dispatch_once(&standardUserDefaults_onceToken, &__block_literal_global_27196);
  return (MPPlaybackUserDefaults *)(id)standardUserDefaults___defaults;
}

- (int64_t)preferredMusicLowBandwidthResolution
{
  if (MSVDeviceIsAudioAccessory()
    && -[NSUserDefaults BOOLForKey:](self->_airplayUserDefaults, "BOOLForKey:", CFSTR("BufferedLosslessSwitch")))
  {
    return 48000;
  }
  else
  {
    return -[NSUserDefaults integerForKey:](self->_iPodUserDefaults, "integerForKey:", CFSTR("MusicLowBandwidthResolution"));
  }
}

- (BOOL)includeContentItemDebugFields
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("IncludeContentItemDebugFields"));
  return v3;
}

- (BOOL)showDebugUI
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("ShowDebugUI"));
  return v3;
}

- (float)minVocalLevel
{
  float v2;

  -[NSUserDefaults floatForKey:](self->_iPodUserDefaults, "floatForKey:", CFSTR("MusicMinVocalLevel"));
  return fminf(fmaxf(v2, 1.0), 99.0);
}

- (NSNumber)isFocusModePrivateListeningEnabled
{
  return (NSNumber *)-[NSUserDefaults objectForKey:](self->_mediaPlaybackCoreUserDefaults, "objectForKey:", CFSTR("MPCPlaybackFocusModePrivateListeningEnabled"));
}

- (int64_t)exportableArtworkCacheLimit
{
  return -[NSUserDefaults integerForKey:](self->_mediaPlaybackCoreUserDefaults, "integerForKey:", CFSTR("ExportableArtworkCacheLimit"));
}

- (float)defaultVocalLevel
{
  float result;

  -[NSUserDefaults floatForKey:](self->_iPodUserDefaults, "floatForKey:", CFSTR("MusicDefaultVocalLevel"));
  return result;
}

- (int64_t)artworkCacheLimit
{
  return -[NSUserDefaults integerForKey:](self->_mediaPlaybackCoreUserDefaults, "integerForKey:", CFSTR("ArtworkCacheLimit"));
}

- (BOOL)disableQHO
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("DisableQHO"));
  return v3;
}

- (int64_t)spatialAudioPreference
{
  if (MSVDeviceSupportsMultiChannelMusic())
    return -[NSUserDefaults integerForKey:](self->_iPodUserDefaults, "integerForKey:", CFSTR("SpatialAudioPreference"));
  else
    return 0;
}

void __46__MPPlaybackUserDefaults_standardUserDefaults__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MPPlaybackUserDefaults _init]([MPPlaybackUserDefaults alloc], "_init");
  v1 = (void *)standardUserDefaults___defaults;
  standardUserDefaults___defaults = (uint64_t)v0;

}

- (id)_init
{
  MPPlaybackUserDefaults *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *accountsQueue;
  uint64_t v6;
  NSUserDefaults *iPodUserDefaults;
  NSUserDefaults *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSUserDefaults *videoUserDefaults;
  uint64_t v13;
  NSUserDefaults *mediaPlaybackCoreUserDefaults;
  NSUserDefaults *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSUserDefaults *airplayUserDefaults;
  NSUserDefaults *v21;
  void *v22;
  uint64_t v23;
  NSMutableDictionary *autoplaySettingCache;
  int *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  int *v34;
  objc_super v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  void *v39;
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[26];
  _QWORD v43[27];

  v43[26] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)MPPlaybackUserDefaults;
  v2 = -[MPPlaybackUserDefaults init](&v35, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.MediaPlayer/MPPlaybackUserDefaults", v3);
    accountsQueue = v2->_accountsQueue;
    v2->_accountsQueue = (OS_dispatch_queue *)v4;

    v2->_lock._os_unfair_lock_opaque = 0;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileipod"));
    iPodUserDefaults = v2->_iPodUserDefaults;
    v2->_iPodUserDefaults = (NSUserDefaults *)v6;

    v8 = v2->_iPodUserDefaults;
    v42[0] = CFSTR("MusicRepeatSetting");
    v42[1] = CFSTR("MusicShuffleSetting");
    v43[0] = CFSTR("Off");
    v43[1] = CFSTR("Off");
    v42[2] = CFSTR("PodcastsPlaybackRate");
    v42[3] = CFSTR("MusicLowBandwidthResolution");
    v43[2] = &unk_1E31E6610;
    v43[3] = &unk_1E31E4B88;
    v42[4] = CFSTR("MusicHighBandwidthResolution");
    v42[5] = CFSTR("MusicDownloadResolution");
    v43[4] = &unk_1E31E4BA0;
    v43[5] = &unk_1E31E4BA0;
    v9 = MEMORY[0x1E0C9AAB0];
    v42[6] = CFSTR("MusicSoundCheckEnabledSetting");
    v42[7] = CFSTR("CrossFadeEnabled");
    v43[6] = MEMORY[0x1E0C9AAB0];
    v43[7] = MEMORY[0x1E0C9AAA0];
    v42[8] = CFSTR("CrossFadeDuration");
    v42[9] = CFSTR("SpatialAudioPreference");
    v43[8] = &unk_1E31E4BB8;
    v43[9] = &unk_1E31E4BD0;
    v42[10] = CFSTR("MusicMinVocalLevel");
    v42[11] = CFSTR("MusicDefaultVocalLevel");
    v43[10] = &unk_1E31E4BE8;
    v43[11] = &unk_1E31E4C00;
    v42[12] = CFSTR("AllowScreenRecording");
    v42[13] = CFSTR("QHOMaximumSize");
    v43[12] = MEMORY[0x1E0C9AAA0];
    v43[13] = &unk_1E31E4C18;
    v42[14] = CFSTR("EnableProcessTap");
    v42[15] = CFSTR("AudioAnalysisRefreshRate");
    v43[14] = MEMORY[0x1E0C9AAB0];
    v43[15] = &unk_1E31E4C30;
    v42[16] = CFSTR("ForcedMusicResolution");
    v42[17] = CFSTR("ForwardBufferDuration");
    v43[16] = &unk_1E31E4BA0;
    v43[17] = &unk_1E31E6620;
    v42[18] = CFSTR("PrerollEnabled");
    v42[19] = CFSTR("AssetURLExpirationDuration");
    v43[18] = MEMORY[0x1E0C9AAA0];
    v43[19] = &unk_1E31E4C48;
    v42[20] = CFSTR("PurgeSideLoadedVocalAttenuationModels");
    v42[21] = CFSTR("BypassVocalAttenuationDenoising");
    v43[20] = MEMORY[0x1E0C9AAB0];
    v43[21] = MEMORY[0x1E0C9AAB0];
    v42[22] = CFSTR("BypassVocalAttenuationSupportFlag");
    v42[23] = CFSTR("UseRemoteVocalAttenuationModel");
    v43[22] = MEMORY[0x1E0C9AAA0];
    v43[23] = MEMORY[0x1E0C9AAA0];
    v42[24] = CFSTR("AudioTapTimeOutRatioForFailureDetection");
    v42[25] = CFSTR("VocalAttenuationGracePeriodAfterPause");
    v43[24] = &unk_1E31E6610;
    v43[25] = &unk_1E31E4C60;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults registerDefaults:](v8, "registerDefaults:", v10);

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.videos-preferences"));
    videoUserDefaults = v2->_videoUserDefaults;
    v2->_videoUserDefaults = (NSUserDefaults *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mediaplaybackcore"));
    mediaPlaybackCoreUserDefaults = v2->_mediaPlaybackCoreUserDefaults;
    v2->_mediaPlaybackCoreUserDefaults = (NSUserDefaults *)v13;

    v15 = v2->_mediaPlaybackCoreUserDefaults;
    v40[0] = CFSTR("HomePodPFSQForcedLeaseRenewThreshold");
    v40[1] = CFSTR("ArtworkCacheLimit");
    v41[0] = &unk_1E31E4C78;
    v41[1] = &unk_1E31E4C90;
    v40[2] = CFSTR("ExportableArtworkCacheLimit");
    v41[2] = &unk_1E31E4C90;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults registerDefaults:](v15, "registerDefaults:", v16);

    if (MSVDeviceIsAudioAccessory())
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("MPUnloadingPlaybackAssetsOnIdleDuration");
      v39 = &unk_1E31E4C60;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "registerDefaults:", v18);

    }
    if (MSVDeviceIsAudioAccessory())
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.airplay"));
      airplayUserDefaults = v2->_airplayUserDefaults;
      v2->_airplayUserDefaults = (NSUserDefaults *)v19;

      v21 = v2->_airplayUserDefaults;
      v36 = CFSTR("BufferedSurroundSwitch");
      v37 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults registerDefaults:](v21, "registerDefaults:", v22);

    }
    -[MPPlaybackUserDefaults _migrateUserDefaults](v2, "_migrateUserDefaults");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v23 = objc_claimAutoreleasedReturnValue();
    autoplaySettingCache = v2->_autoplaySettingCache;
    v2->_autoplaySettingCache = (NSMutableDictionary *)v23;

    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __31__MPPlaybackUserDefaults__init__block_invoke;
    v33 = &unk_1E315AAA8;
    v25 = v2;
    v34 = v25;
    v26 = MEMORY[0x1E0C80D38];
    notify_register_dispatch("com.apple.mobileipod-prefsChanged", &v2->_notifyTokens.mobileiPodPrefsChanged, MEMORY[0x1E0C80D38], &v30);
    notify_register_dispatch("com.apple.videos-preferences-changed", v25 + 17, v26, &__block_literal_global_194);

    if (MSVDeviceIsAudioAccessory())
    {
      v27 = (void *)MEMORY[0x1E0C80D38];
      notify_register_dispatch("com.apple.airplay.prefsChanged", v25 + 18, MEMORY[0x1E0C80D38], &__block_literal_global_195_27183);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v30, v31, v32, v33);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v25, sel__accountStoreChangedNotification_, *MEMORY[0x1E0DDBEC0], 0);

    objc_msgSend(v25, "_loadAccountProperties");
  }
  return v2;
}

- (void)_migrateUserDefaults
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  if ((MSVDeviceOSIsInternalInstall() & 1) == 0)
    -[MPPlaybackUserDefaults resetAllInternalSettings](self, "resetAllInternalSettings");
  -[NSUserDefaults objectForKey:](self->_iPodUserDefaults, "objectForKey:", CFSTR("MusicAllowsCellularData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3)
  {
    v4 = objc_msgSend(v3, "BOOLValue");
    if (v4
      && !-[MPPlaybackUserDefaults preferredMusicLowBandwidthResolution](self, "preferredMusicLowBandwidthResolution"))
    {
      -[MPPlaybackUserDefaults setPreferredMusicLowBandwidthResolution:](self, "setPreferredMusicLowBandwidthResolution:", 64);
    }
    -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("MusicAllowsCellularData"));
    -[NSUserDefaults objectForKey:](self->_iPodUserDefaults, "objectForKey:", CFSTR("MusicAllowsHighQualityStreamingOnCellular"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((v4 & objc_msgSend(v5, "BOOLValue")) == 1
        && -[MPPlaybackUserDefaults preferredMusicLowBandwidthResolution](self, "preferredMusicLowBandwidthResolution") <= 255)
      {
        -[MPPlaybackUserDefaults setPreferredMusicLowBandwidthResolution:](self, "setPreferredMusicLowBandwidthResolution:", 256);
      }
      -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("MusicAllowsHighQualityStreamingOnCellular"));
    }

  }
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("MusicVocalLevel"));

}

- (void)_loadAccountProperties
{
  NSObject *accountsQueue;
  _QWORD block[5];

  accountsQueue = self->_accountsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MPPlaybackUserDefaults__loadAccountProperties__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(accountsQueue, block);
}

- (BOOL)shouldBypassVocalAttenuationSupportFlag
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("BypassVocalAttenuationSupportFlag"));
  return v3;
}

- (BOOL)shouldUseRemoteVocalAttenuationModel
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("UseRemoteVocalAttenuationModel"));
  return v3;
}

- (int64_t)maximumQueueHandOffSize
{
  if (MSVDeviceOSIsInternalInstall())
    return -[NSUserDefaults integerForKey:](self->_iPodUserDefaults, "integerForKey:", CFSTR("QHOMaximumSize"));
  else
    return 2000;
}

- (BOOL)shouldUseSideLoadedVocalAttenuationModel
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("UseSideLoadedVocalAttenuationModel"));
  return v3;
}

- (BOOL)shouldSkipNextStateRestoration
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("_MPCSkipNextStateRestoration"));
  return v3;
}

- (BOOL)forceLibrarySupplementalContexts
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("ForceLibrarySupplemental"));
  return v3;
}

- (BOOL)isProcessTapEnabled
{
  return !MSVDeviceOSIsInternalInstall()
      || -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("EnableProcessTap"));
}

- (float)audioTapTimeOutRatioForFailureDetection
{
  float result;

  if (!MSVDeviceOSIsInternalInstall())
    return 1.0;
  -[NSUserDefaults floatForKey:](self->_iPodUserDefaults, "floatForKey:", CFSTR("AudioTapTimeOutRatioForFailureDetection"));
  return result;
}

- (unint64_t)audioAnalysisRefreshRate
{
  if (MSVDeviceOSIsInternalInstall())
    return -[NSUserDefaults integerForKey:](self->_iPodUserDefaults, "integerForKey:", CFSTR("AudioAnalysisRefreshRate"));
  else
    return 30;
}

- (BOOL)disableAudioAnalysis
{
  int v3;

  if ((MSVDeviceIsAppleTV() & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = MSVDeviceOSIsInternalInstall();
    if (v3)
      LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("DisableAudioAnalysis"));
  }
  return v3;
}

- (NSNumber)progressiveDownloadAssetRatio
{
  void *v3;
  void *v4;
  id v5;

  if (MSVDeviceOSIsInternalInstall())
  {
    -[NSUserDefaults objectForKey:](self->_iPodUserDefaults, "objectForKey:", CFSTR("ProgressiveDownloadAssetRatio"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSNumber())
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }
  return (NSNumber *)v5;
}

- (NSNumber)delayQueueLoadDuration
{
  void *v3;
  void *v4;
  id v5;

  if (MSVDeviceOSIsInternalInstall())
  {
    -[NSUserDefaults objectForKey:](self->_iPodUserDefaults, "objectForKey:", CFSTR("DelayQueueLoad"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSNumber())
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }
  return (NSNumber *)v5;
}

- (MPPlaybackEQSetting)musicEQSetting
{
  void *v2;
  void *v3;

  -[NSUserDefaults stringForKey:](self->_iPodUserDefaults, "stringForKey:", CFSTR("MusicEQPresetName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPlaybackEQSetting settingWithName:](MPPlaybackEQSetting, "settingWithName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPPlaybackEQSetting *)v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DDBEC0], 0);

  notify_cancel(self->_notifyTokens.mobileiPodPrefsChanged);
  notify_cancel(self->_notifyTokens.videoPrefsChanged);
  if (MSVDeviceIsAudioAccessory())
    notify_cancel(self->_notifyTokens.airplayPrefsChanged);
  v4.receiver = self;
  v4.super_class = (Class)MPPlaybackUserDefaults;
  -[MPPlaybackUserDefaults dealloc](&v4, sel_dealloc);
}

- (BOOL)autoPlayEnabledForUserIdentity:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  char v19;
  id v21;
  id v22;
  uint8_t buf[4];
  _BYTE v24[18];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[NSMutableDictionary objectForKey:](self->_autoplaySettingCache, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_18;
  v8 = v6;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v9, "DSIDForUserIdentity:outError:", v8, &v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v22;

    if (!v10)
    {
LABEL_10:
      v15 = os_log_create("com.apple.amp.mediaplayer", "Playback");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v24 = v8;
        *(_WORD *)&v24[8] = 2114;
        *(_QWORD *)&v24[10] = v11;
        _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_ERROR, "[PlaybackUserDefaults] _MPACAccountForUserIdentity failed to resolve account for identity %{public}@. err=%{public}@", buf, 0x16u);
      }

      v13 = 0;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0DDBFA0], "sharedAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v11;
    objc_msgSend(v12, "storeAccountForDSID:error:", v10, &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;

    v11 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DDBFA0], "sharedAccountStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v10, "activeStoreAccountWithError:", &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v22;
  }

  if (!v13)
    goto LABEL_10;
LABEL_13:

  objc_msgSend(v13, "ams_accountFlagValueForAccountFlag:", *MEMORY[0x1E0CFD780]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v16 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_INFO, "[PlaybackUserDefaults] Returning NO as [account ams_accountFlagValueForAccountFlag:AMSAccountFlagAutoPlay] could not resolve.", buf, 2u);
    }

    v7 = (void *)MEMORY[0x1E0C9AAA0];
  }
  -[NSMutableDictionary setObject:forKey:](self->_autoplaySettingCache, "setObject:forKey:", v7, v8);

LABEL_18:
  os_unfair_lock_unlock(&self->_lock);
  v17 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = objc_msgSend(v7, "BOOLValue");
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v24 = v18;
    *(_WORD *)&v24[4] = 2114;
    *(_QWORD *)&v24[6] = v6;
    _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_INFO, "[PlaybackUserDefaults] autoPlayEnabledForUserIdentity: %{BOOL}u userIdentity=%{public}@", buf, 0x12u);
  }

  v19 = objc_msgSend(v7, "BOOLValue");
  return v19;
}

- (void)setAutoPlayEnabled:(BOOL)a3 forUserIdentity:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  _BYTE v25[18];
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v25 = v4;
    *(_WORD *)&v25[4] = 2114;
    *(_QWORD *)&v25[6] = v9;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "[PlaybackUserDefaults] setAutoPlayEnabled:forUserIdentity: %{BOOL}u userIdentity=%{public}@", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary setObject:forKey:](self->_autoplaySettingCache, "setObject:forKey:", v11, v9);
  os_unfair_lock_unlock(&self->_lock);
  v12 = v9;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DDBFA0], "sharedAccountStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v14, "activeStoreAccountWithError:", &v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23;
LABEL_10:

    if (v17)
      goto LABEL_14;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v13, "DSIDForUserIdentity:outError:", v12, &v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v23;

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0DDBFA0], "sharedAccountStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v15;
    objc_msgSend(v16, "storeAccountForDSID:error:", v14, &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v22;

    v15 = v18;
    goto LABEL_10;
  }
LABEL_11:
  v19 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v25 = v12;
    *(_WORD *)&v25[8] = 2114;
    *(_QWORD *)&v25[10] = v15;
    _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_ERROR, "[PlaybackUserDefaults] _MPACAccountForUserIdentity failed to resolve account for identity %{public}@. err=%{public}@", buf, 0x16u);
  }

  v17 = 0;
LABEL_14:

  objc_msgSend(v17, "ams_setAccountFlagValue:forAccountFlag:", v11, *MEMORY[0x1E0CFD780]);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ic_sharedAccountStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "ams_saveAccount:", v17);

}

- (int64_t)musicRepeatType
{
  void *v2;
  int64_t v3;

  -[NSUserDefaults stringForKey:](self->_iPodUserDefaults, "stringForKey:", CFSTR("MusicRepeatSetting"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MPRepeatTypeFromNSString(v2);

  return v3;
}

- (float)playbackRate
{
  float result;

  -[NSUserDefaults floatForKey:](self->_iPodUserDefaults, "floatForKey:", CFSTR("PodcastsPlaybackRate"));
  return result;
}

- (void)setPlaybackRate:(float)a3
{
  double v5;

  -[MPPlaybackUserDefaults playbackRate](self, "playbackRate");
  if (*(float *)&v5 != a3)
  {
    *(float *)&v5 = a3;
    -[NSUserDefaults setFloat:forKey:](self->_iPodUserDefaults, "setFloat:forKey:", CFSTR("PodcastsPlaybackRate"), v5);
  }
}

- (void)setMusicRepeatType:(int64_t)a3
{
  void *v4;
  id v5;

  if (a3 != 3)
  {
    MPNSStringFromRepeatType(a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setObject:forKey:](self->_iPodUserDefaults, "setObject:forKey:", v5, CFSTR("MusicRepeatSetting"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsMusicRepeatTypeDidChangeNotification"), self);

    notify_post("com.apple.mobileipod-prefsChanged");
  }
}

- (int64_t)musicShuffleType
{
  void *v2;
  int64_t v3;

  -[NSUserDefaults stringForKey:](self->_iPodUserDefaults, "stringForKey:", CFSTR("MusicShuffleSetting"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MPShuffleTypeFromNSString(v2);

  return v3;
}

- (void)setMusicShuffleType:(int64_t)a3
{
  void *v4;
  id v5;

  if (a3 != 1000)
  {
    MPNSStringFromShuffleType(a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setObject:forKey:](self->_iPodUserDefaults, "setObject:forKey:", v5, CFSTR("MusicShuffleSetting"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsMusicShuffleTypeDidChangeNotification"), self);

    notify_post("com.apple.mobileipod-prefsChanged");
  }
}

- (BOOL)soundCheckEnabled
{
  return -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("MusicSoundCheckEnabledSetting"));
}

- (void)setSoundCheckEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  _DWORD v8[2];
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (-[MPPlaybackUserDefaults soundCheckEnabled](self, "soundCheckEnabled") != a3)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109376;
      v8[1] = -[MPPlaybackUserDefaults soundCheckEnabled](self, "soundCheckEnabled");
      v9 = 1024;
      v10 = v3;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[PlaybackUserDefaults] setSoundCheckEnable: %{BOOL}u -> %{BOOL}u", (uint8_t *)v8, 0xEu);
    }

    -[NSUserDefaults setBool:forKey:](self->_iPodUserDefaults, "setBool:forKey:", v3, CFSTR("MusicSoundCheckEnabledSetting"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsSoundCheckEnabledDidChangeNotification"), self);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileipod-prefsChanged"), 0, 0, 1u);
  }
}

- (BOOL)isCrossFadeEnabled
{
  return -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("CrossFadeEnabled"));
}

- (void)setCrossFadeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if (-[MPPlaybackUserDefaults isCrossFadeEnabled](self, "isCrossFadeEnabled") != a3)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109376;
      v6[1] = -[MPPlaybackUserDefaults isCrossFadeEnabled](self, "isCrossFadeEnabled");
      v7 = 1024;
      v8 = v3;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[PlaybackUserDefaults] setCrossFadeEnabled: %{BOOL}u -> %{BOOL}u", (uint8_t *)v6, 0xEu);
    }

    -[NSUserDefaults setBool:forKey:](self->_iPodUserDefaults, "setBool:forKey:", v3, CFSTR("CrossFadeEnabled"));
  }
}

- (double)crossFadeDuration
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_iPodUserDefaults, "doubleForKey:", CFSTR("CrossFadeDuration"));
  return result;
}

- (void)setCrossFadeDuration:(double)a3
{
  double v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[MPPlaybackUserDefaults crossFadeDuration](self, "crossFadeDuration");
  if (v5 != a3)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[MPPlaybackUserDefaults crossFadeDuration](self, "crossFadeDuration");
      v8 = 134218240;
      v9 = v7;
      v10 = 2048;
      v11 = a3;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "[PlaybackUserDefaults] setCrossFadeDuration: %2.1fs -> %2.1fs", (uint8_t *)&v8, 0x16u);
    }

    -[NSUserDefaults setDouble:forKey:](self->_iPodUserDefaults, "setDouble:forKey:", CFSTR("CrossFadeDuration"), a3);
  }
}

- (void)setPrivateListeningEnabled:(id)a3
{
  id v4;
  void *v5;
  NSObject *accountsQueue;
  id v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[NSUserDefaults setObject:forKey:](self->_mediaPlaybackCoreUserDefaults, "setObject:forKey:", v4, CFSTR("MPCPlaybackPrivateListeningEnabled"));
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsPrivateListeningEnabledDidChangeNotification"), 0);

  accountsQueue = self->_accountsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MPPlaybackUserDefaults_setPrivateListeningEnabled___block_invoke;
  block[3] = &unk_1E3163508;
  v9 = v4;
  v7 = v4;
  dispatch_async(accountsQueue, block);

}

- (void)setFocusModePrivateListeningEnabled:(id)a3
{
  id v3;

  -[NSUserDefaults setObject:forKey:](self->_mediaPlaybackCoreUserDefaults, "setObject:forKey:", a3, CFSTR("MPCPlaybackFocusModePrivateListeningEnabled"));
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsPrivateListeningEnabledDidChangeNotification"), 0);

}

- (void)setPreferredMusicLowBandwidthResolution:(int64_t)a3
{
  NSUserDefaults *iPodUserDefaults;
  char *v6;
  int64_t quot;
  ldiv_t v8;
  uint64_t v9;
  const UInt8 *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[MPPlaybackUserDefaults preferredMusicLowBandwidthResolution](self, "preferredMusicLowBandwidthResolution") != a3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    v6 = (char *)&v13 + 1;
    quot = a3;
    do
    {
      v8 = ldiv(quot, 10);
      quot = v8.quot;
      if (v8.rem >= 0)
        LOBYTE(v9) = v8.rem;
      else
        v9 = -v8.rem;
      *(v6 - 2) = v9 + 48;
      v10 = (const UInt8 *)(v6 - 2);
      --v6;
    }
    while (v8.quot);
    if (a3 < 0)
    {
      *(v6 - 2) = 45;
      v10 = (const UInt8 *)(v6 - 2);
    }
    v11 = (__CFString *)CFStringCreateWithBytes(0, v10, (char *)&v13 - (char *)v10, 0x8000100u, 0);
    -[NSUserDefaults setObject:forKey:](iPodUserDefaults, "setObject:forKey:", v11, CFSTR("MusicLowBandwidthResolution"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification"), self);

    notify_post("com.apple.mobileipod-prefsChanged");
  }
}

- (int64_t)preferredMusicHighBandwidthResolution
{
  if (MSVDeviceIsAudioAccessory()
    && -[NSUserDefaults BOOLForKey:](self->_airplayUserDefaults, "BOOLForKey:", CFSTR("BufferedLosslessSwitch")))
  {
    return 48000;
  }
  else
  {
    return -[NSUserDefaults integerForKey:](self->_iPodUserDefaults, "integerForKey:", CFSTR("MusicHighBandwidthResolution"));
  }
}

- (void)setPreferredMusicHighBandwidthResolution:(int64_t)a3
{
  NSUserDefaults *iPodUserDefaults;
  char *v6;
  int64_t quot;
  ldiv_t v8;
  uint64_t v9;
  const UInt8 *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[MPPlaybackUserDefaults preferredMusicHighBandwidthResolution](self, "preferredMusicHighBandwidthResolution") != a3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    v6 = (char *)&v13 + 1;
    quot = a3;
    do
    {
      v8 = ldiv(quot, 10);
      quot = v8.quot;
      if (v8.rem >= 0)
        LOBYTE(v9) = v8.rem;
      else
        v9 = -v8.rem;
      *(v6 - 2) = v9 + 48;
      v10 = (const UInt8 *)(v6 - 2);
      --v6;
    }
    while (v8.quot);
    if (a3 < 0)
    {
      *(v6 - 2) = 45;
      v10 = (const UInt8 *)(v6 - 2);
    }
    v11 = (__CFString *)CFStringCreateWithBytes(0, v10, (char *)&v13 - (char *)v10, 0x8000100u, 0);
    -[NSUserDefaults setObject:forKey:](iPodUserDefaults, "setObject:forKey:", v11, CFSTR("MusicHighBandwidthResolution"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification"), self);

    notify_post("com.apple.mobileipod-prefsChanged");
  }
}

- (int64_t)preferredMusicDownloadResolution
{
  return -[NSUserDefaults integerForKey:](self->_iPodUserDefaults, "integerForKey:", CFSTR("MusicDownloadResolution"));
}

- (void)setPreferredMusicDownloadResolution:(int64_t)a3
{
  NSUserDefaults *iPodUserDefaults;
  char *v6;
  int64_t quot;
  ldiv_t v8;
  uint64_t v9;
  const UInt8 *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[MPPlaybackUserDefaults preferredMusicDownloadResolution](self, "preferredMusicDownloadResolution") != a3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    v6 = (char *)&v13 + 1;
    quot = a3;
    do
    {
      v8 = ldiv(quot, 10);
      quot = v8.quot;
      if (v8.rem >= 0)
        LOBYTE(v9) = v8.rem;
      else
        v9 = -v8.rem;
      *(v6 - 2) = v9 + 48;
      v10 = (const UInt8 *)(v6 - 2);
      --v6;
    }
    while (v8.quot);
    if (a3 < 0)
    {
      *(v6 - 2) = 45;
      v10 = (const UInt8 *)(v6 - 2);
    }
    v11 = (__CFString *)CFStringCreateWithBytes(0, v10, (char *)&v13 - (char *)v10, 0x8000100u, 0);
    -[NSUserDefaults setObject:forKey:](iPodUserDefaults, "setObject:forKey:", v11, CFSTR("MusicDownloadResolution"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification"), self);

    notify_post("com.apple.mobileipod-prefsChanged");
  }
}

- (void)setSpatialAudioPreference:(int64_t)a3
{
  NSUserDefaults *iPodUserDefaults;
  char *v6;
  int64_t quot;
  ldiv_t v8;
  uint64_t v9;
  const UInt8 *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[MPPlaybackUserDefaults spatialAudioPreference](self, "spatialAudioPreference") != a3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    v6 = (char *)&v13 + 1;
    quot = a3;
    do
    {
      v8 = ldiv(quot, 10);
      quot = v8.quot;
      if (v8.rem >= 0)
        LOBYTE(v9) = v8.rem;
      else
        v9 = -v8.rem;
      *(v6 - 2) = v9 + 48;
      v10 = (const UInt8 *)(v6 - 2);
      --v6;
    }
    while (v8.quot);
    if (a3 < 0)
    {
      *(v6 - 2) = 45;
      v10 = (const UInt8 *)(v6 - 2);
    }
    v11 = (__CFString *)CFStringCreateWithBytes(0, v10, (char *)&v13 - (char *)v10, 0x8000100u, 0);
    -[NSUserDefaults setObject:forKey:](iPodUserDefaults, "setObject:forKey:", v11, CFSTR("SpatialAudioPreference"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification"), self);

    notify_post("com.apple.mobileipod-prefsChanged");
  }
}

- (BOOL)prefersSpatialAudio
{
  return -[MPPlaybackUserDefaults spatialAudioPreference](self, "spatialAudioPreference") != 0;
}

- (void)setPrefersSpatialAudio:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  -[MPPlaybackUserDefaults setSpatialAudioPreference:](self, "setSpatialAudioPreference:", v3);
}

- (BOOL)prefersSpatialDownloads
{
  return -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("PrefersSpatialDownloads"));
}

- (void)setPrefersSpatialDownloads:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[MPPlaybackUserDefaults prefersSpatialDownloads](self, "prefersSpatialDownloads") != a3)
  {
    -[NSUserDefaults setBool:forKey:](self->_iPodUserDefaults, "setBool:forKey:", v3, CFSTR("PrefersSpatialDownloads"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification"), self);

    notify_post("com.apple.mobileipod-prefsChanged");
  }
}

- (BOOL)showLosslessAudio
{
  return -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("ShowLosslessAudio"));
}

- (void)setShowLosslessAudio:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_iPodUserDefaults, "setBool:forKey:", a3, CFSTR("ShowLosslessAudio"));
}

- (int64_t)preferredVideoLowBandwidthResolution
{
  __CFString *v2;
  __CFString *v3;
  int v4;
  int64_t v5;

  -[NSUserDefaults stringForKey:](self->_videoUserDefaults, "stringForKey:", CFSTR("PlaybackQualityCellular"));
  v2 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == CFSTR("BestQuality")
    || (v4 = -[__CFString isEqual:](v2, "isEqual:", CFSTR("BestQuality")), v3, v4))
  {
    v5 = 1000000;
  }
  else
  {
    v5 = 1000;
  }

  return v5;
}

- (int64_t)preferredVideoHighBandwidthResolution
{
  int64_t v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  int v7;

  v2 = 1000000;
  -[NSUserDefaults stringForKey:](self->_videoUserDefaults, "stringForKey:", CFSTR("PlaybackQuality"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    if (v5 != CFSTR("BestQuality"))
    {
      v6 = v5;
      v7 = -[__CFString isEqual:](v5, "isEqual:", CFSTR("BestQuality"));

      if (!v7)
        v2 = 1000;
    }
  }

  return v2;
}

- (BOOL)allowsHighQualityMusicStreamingOnCellular
{
  return -[NSUserDefaults integerForKey:](self->_iPodUserDefaults, "integerForKey:", CFSTR("MusicLowBandwidthResolution")) > 64;
}

- (BOOL)allowScreenRecording
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("AllowScreenRecording"));
  return v3;
}

- (BOOL)disableAssetCaching
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("DisableAssetCaching"));
  return v3;
}

- (BOOL)disableHLSAssetCaching
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("DisableHLSAssetCaching"));
  return v3;
}

- (BOOL)disableAudioProcessing
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("DisableAudioProcessing"));
  return v3;
}

- (BOOL)disableMiniSINF
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("DisableMiniSINF"));
  return v3;
}

- (BOOL)disablePeriodicStateRestore
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("DisablePeriodicRestore"));
  return v3;
}

- (BOOL)disableStateRestoration
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("DisableStateRestoration"));
  return v3;
}

- (BOOL)forceMusicResolution
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("ForceMusicResolution"));
  return v3;
}

- (int64_t)forcedMusicResolution
{
  if (MSVDeviceOSIsInternalInstall())
    return -[NSUserDefaults integerForKey:](self->_iPodUserDefaults, "integerForKey:", CFSTR("ForcedMusicResolution"));
  else
    return 0;
}

- (BOOL)forceMusicStreaming
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("ForceMusicStreaming"));
  return v3;
}

- (BOOL)speakerRouteEnabled
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("SpeakerRouteEnabled"));
  return v3;
}

- (double)assetURLExpirationDuration
{
  double result;

  if (!MSVDeviceOSIsInternalInstall())
    return 604800.0;
  -[NSUserDefaults doubleForKey:](self->_iPodUserDefaults, "doubleForKey:", CFSTR("AssetURLExpirationDuration"));
  return result;
}

- (double)activationDelay
{
  double result;

  if (!MSVDeviceOSIsInternalInstall())
    return 0.0;
  -[NSUserDefaults doubleForKey:](self->_iPodUserDefaults, "doubleForKey:", CFSTR("ActivationDelay"));
  return result;
}

- (double)forwardBufferDuration
{
  double result;

  if (!MSVDeviceOSIsInternalInstall())
    return 120.0;
  -[NSUserDefaults doubleForKey:](self->_iPodUserDefaults, "doubleForKey:", CFSTR("ForwardBufferDuration"));
  return result;
}

- (BOOL)prerollEnabled
{
  int v3;

  if ((MSVDeviceIsHomePod() & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = MSVDeviceOSIsInternalInstall();
    if (v3)
      LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("PrerollEnabled"));
  }
  return v3;
}

- (BOOL)archiveSessionArtwork
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("ArchiveSessionArtwork"));
  return v3;
}

- (BOOL)shouldPurgeSideLoadedVocalAttenuationModels
{
  return !MSVDeviceOSIsInternalInstall()
      || -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("PurgeSideLoadedVocalAttenuationModels"));
}

- (BOOL)shouldRecordVocalAttenuationStatistics
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("RecordVocalAttenuationStatistics"));
  return v3;
}

- (NSString)vocalAttenuationStatisticsName
{
  void *v3;

  if (MSVDeviceOSIsInternalInstall())
  {
    -[NSUserDefaults stringForKey:](self->_iPodUserDefaults, "stringForKey:", CFSTR("VocalAttenuationStatisticsName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)shouldBypassVocalAttenuationDenoising
{
  return !MSVDeviceOSIsInternalInstall()
      || -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("BypassVocalAttenuationDenoising"));
}

- (double)vocalAttenuationGracePeriodAfterPause
{
  double result;

  if (!MSVDeviceOSIsInternalInstall())
    return 480.0;
  -[NSUserDefaults doubleForKey:](self->_iPodUserDefaults, "doubleForKey:", CFSTR("VocalAttenuationGracePeriodAfterPause"));
  return result;
}

- (BOOL)vocalAttenuationLogInputAndOuputRMSValues
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("VocalAttenuationLogInputAndOuputRMSValues"));
  return v3;
}

- (NSNumber)forcedIntentDestination
{
  void *v3;
  void *v4;
  id v5;

  if (MSVDeviceOSIsInternalInstall())
  {
    -[NSUserDefaults objectForKey:](self->_iPodUserDefaults, "objectForKey:", CFSTR("ForceIntentDestination"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSNumber())
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }
  return (NSNumber *)v5;
}

- (NSNumber)delayAssetLoadDuration
{
  void *v3;
  void *v4;
  id v5;

  if (MSVDeviceOSIsInternalInstall())
  {
    -[NSUserDefaults objectForKey:](self->_iPodUserDefaults, "objectForKey:", CFSTR("DelayAssetLoad"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSNumber())
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }
  return (NSNumber *)v5;
}

- (BOOL)forceDisableUpNext
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("ForceDisableUpNext"));
  return v3;
}

- (BOOL)ignoreDisableUpNext
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("IgnoreDisableUpNext"));
  return v3;
}

- (void)clearShouldSkipNextStateRestoration
{
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("_MPCSkipNextStateRestoration"));
}

- (double)HomePodPFSQForcedLeaseRenewThreshold
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_mediaPlaybackCoreUserDefaults, "doubleForKey:", CFSTR("HomePodPFSQForcedLeaseRenewThreshold"));
  return result;
}

- (double)unloadingPlaybackAssetsOnIdleDuration
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("MPUnloadingPlaybackAssetsOnIdleDuration"));
  v4 = v3;

  return v4;
}

- (BOOL)sonicHijack
{
  int v3;

  v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_iPodUserDefaults, "BOOLForKey:", CFSTR("SonicHijack"));
  return v3;
}

- (NSDictionary)rewrittenAssetInfo
{
  void *v3;
  id v4;

  if (MSVDeviceOSIsInternalInstall())
  {
    -[NSUserDefaults objectForKey:](self->_mediaPlaybackCoreUserDefaults, "objectForKey:", CFSTR("MPCRewrittenAssetInfo"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (void)resetAllInternalSettings
{
  id v3;

  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("AudioAnalysisRefreshRate"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("DisableAssetCaching"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("DisableHLSAssetCaching"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("DisableAudioAnalysis"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("DisableAudioProcessing"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("DisableMiniSINF"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("DisablePeriodicRestore"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("DisableQHO"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("DisableStateRestoration"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("EnableProcessTap"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("ForceMusicResolution"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("ForcedMusicResolution"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("ForceLibrarySupplemental"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("IncludeContentItemDebugFields"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("ProgressiveDownloadAssetRatio"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("QHOMaximumSize"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("ShowDebugUI"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("SpeakerRouteEnabled"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("AssetURLExpirationDuration"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("ActivationDelay"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("ForwardBufferDuration"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("PrerollEnabled"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("ArchiveSessionArtwork"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("PurgeSideLoadedVocalAttenuationModels"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("RecordVocalAttenuationStatistics"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("VocalAttenuationStatisticsName"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("BypassVocalAttenuationDenoising"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("BypassVocalAttenuationSupportFlag"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("UseRemoteVocalAttenuationModel"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("UseSideLoadedVocalAttenuationModel"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("AudioTapTimeOutRatioForFailureDetection"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("VocalAttenuationGracePeriodAfterPause"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("VocalAttenuationLogInputAndOuputRMSValues"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("ForceIntentDestination"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("DelayQueueLoad"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("DelayAssetLoad"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("ForceDisableUpNext"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("IgnoreDisableUpNext"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("_MPCSkipNextStateRestoration"));
  -[NSUserDefaults removeObjectForKey:](self->_iPodUserDefaults, "removeObjectForKey:", CFSTR("SonicHijack"));
  -[NSUserDefaults removeObjectForKey:](self->_mediaPlaybackCoreUserDefaults, "removeObjectForKey:", CFSTR("MPCRewrittenAssetInfo"));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("MPUnloadingPlaybackAssetsOnIdleDuration"));

}

- (void)_accountStoreChangedNotification:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeAllObjects](self->_autoplaySettingCache, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  -[MPPlaybackUserDefaults _loadAccountProperties](self, "_loadAccountProperties");
}

- (int64_t)preferredVideoDownloadResolution
{
  return self->_preferredVideoDownloadResolution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsQueue, 0);
  objc_storeStrong((id *)&self->_autoplaySettingCache, 0);
  objc_storeStrong((id *)&self->_airplayUserDefaults, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackCoreUserDefaults, 0);
  objc_storeStrong((id *)&self->_videoUserDefaults, 0);
  objc_storeStrong((id *)&self->_iPodUserDefaults, 0);
}

void __48__MPPlaybackUserDefaults__loadAccountProperties__block_invoke_211(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "isDevicePrivateListeningEnabled");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrivateListeningEnabled:", v4);

}

void __53__MPPlaybackUserDefaults_setPrivateListeningEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__MPPlaybackUserDefaults_setPrivateListeningEnabled___block_invoke_2;
  v4[3] = &unk_1E315AB30;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "updatePropertiesForUserIdentity:usingBlock:", v3, v4);

}

uint64_t __53__MPPlaybackUserDefaults_setPrivateListeningEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPrivateListeningEnabled:", *(_QWORD *)(a1 + 32));
}

void __31__MPPlaybackUserDefaults__init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsMusicRepeatTypeDidChangeNotification"), v3);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsMusicShuffleTypeDidChangeNotification"), v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsSoundCheckEnabledDidChangeNotification"), *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification"), v8);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsMusicEQPresetDidChangeNotification"), v9);

}

void __31__MPPlaybackUserDefaults__init__block_invoke_3()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification"), v0);

}

void __31__MPPlaybackUserDefaults__init__block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification"), v0);

}

@end
