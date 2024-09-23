@implementation NMSMediaSettingsSynchronizer

+ (NMSMediaSettingsSynchronizer)sharedSynchronizer
{
  if (sharedSynchronizer_onceToken != -1)
    dispatch_once(&sharedSynchronizer_onceToken, &__block_literal_global_9);
  return (NMSMediaSettingsSynchronizer *)(id)sharedSynchronizer_instance;
}

void __50__NMSMediaSettingsSynchronizer_sharedSynchronizer__block_invoke()
{
  NMSMediaSettingsSynchronizer *v0;
  void *v1;

  v0 = objc_alloc_init(NMSMediaSettingsSynchronizer);
  v1 = (void *)sharedSynchronizer_instance;
  sharedSynchronizer_instance = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  -[NMSMediaSettingsSynchronizer endObservingUpdates](self, "endObservingUpdates");
  v3.receiver = self;
  v3.super_class = (Class)NMSMediaSettingsSynchronizer;
  -[NMSMediaSettingsSynchronizer dealloc](&v3, sel_dealloc);
}

- (void)beginObservingUpdates
{
  NSObject *v3;
  NSUserDefaults *v4;
  NSUserDefaults *mediaPlaybackCoreDefaults;
  NSUserDefaults *v6;
  NSUserDefaults *mobileIPodDefaults;
  NSUserDefaults *v8;
  NSUserDefaults *musicDefaults;
  NSUserDefaults *v10;
  NSUserDefaults *nanoMusicSyncDefaults;
  NSUserDefaults *v12;
  NSUserDefaults *podcastsDefaults;
  void *v14;
  uint8_t v15[16];

  if (!self->_isObserving)
  {
    NMLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Begin observing setting updates.", v15, 2u);
    }

    self->_isObserving = 1;
    v4 = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mediaplaybackcore"));
    mediaPlaybackCoreDefaults = self->_mediaPlaybackCoreDefaults;
    self->_mediaPlaybackCoreDefaults = v4;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_mediaPlaybackCoreDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("MPCPlaybackPrivateListeningEnabled"), 0, CFSTR("MPCPlaybackPrivateListeningEnabled"));
    v6 = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobileipod"));
    mobileIPodDefaults = self->_mobileIPodDefaults;
    self->_mobileIPodDefaults = v6;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_mobileIPodDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("MusicLowBandwidthResolution"), 0, CFSTR("MusicLowBandwidthResolution"));
    v8 = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.Music"));
    musicDefaults = self->_musicDefaults;
    self->_musicDefaults = v8;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_musicDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("AllowsCellularDataDownloads"), 0, CFSTR("AllowsCellularDataDownloads"));
    v10 = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.NanoMusicSync"));
    nanoMusicSyncDefaults = self->_nanoMusicSyncDefaults;
    self->_nanoMusicSyncDefaults = v10;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_nanoMusicSyncDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("GreenTeaMobileIpodCellularKeysAreMirrored"), 0, CFSTR("GreenTeaMobileIpodCellularKeysAreMirrored"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_nanoMusicSyncDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("GreenTeaMusicAllowsCellularData"), 0, CFSTR("GreenTeaMusicAllowsCellularData"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_nanoMusicSyncDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("GreenTeaMusicAllowsHighQualityStreamingOnCellular"), 0, CFSTR("GreenTeaMusicAllowsHighQualityStreamingOnCellular"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_nanoMusicSyncDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("GreenTeaMusicAllowsDownloadsOverCellular"), 0, CFSTR("GreenTeaMusicAllowsDownloadsOverCellular"));
    -[NMSMediaSettingsSynchronizer _migrateMusicDefaultsIfNecessary](self, "_migrateMusicDefaultsIfNecessary");
    -[NMSMediaSettingsSynchronizer _createDefaultGreenTeaSettingsIfNecessary](self, "_createDefaultGreenTeaSettingsIfNecessary");
    -[NMSMediaSettingsSynchronizer _podcastsUserDefaults](self, "_podcastsUserDefaults");
    v12 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue();
    podcastsDefaults = self->_podcastsDefaults;
    self->_podcastsDefaults = v12;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_podcastsDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("MTSyncSubscriptions"), 0, CFSTR("MTSyncSubscriptions"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_podcastsDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("MTPodcastUpdateIntervalDefault"), 0, CFSTR("MTPodcastUpdateIntervalDefault"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_podcastsDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("MTContinuousPlaybackEnabled"), 0, CFSTR("MTContinuousPlaybackEnabled"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_podcastsDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("MTSkipForwardIntervalDefault"), 0, CFSTR("MTSkipForwardIntervalDefault"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_podcastsDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("MTSkipBackwardsIntervalDefault"), 0, CFSTR("MTSkipBackwardsIntervalDefault"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_podcastsDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("MTRemoteSkipInsteadOfNextTrackDefault"), 0, CFSTR("MTRemoteSkipInsteadOfNextTrackDefault"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_podcastsDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("MTPrivacyResetIdentifier"), 0, CFSTR("MTPrivacyResetIdentifier"));
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__syncPodcastDefaultsIfNecessary, *MEMORY[0x24BE6B420], 0);

    -[NMSMediaSettingsSynchronizer _syncPodcastDefaultsIfNecessary](self, "_syncPodcastDefaultsIfNecessary");
  }
}

- (void)_createDefaultGreenTeaSettingsIfNecessary
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t CellularUsagePolicyMirroring;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[NSUserDefaults objectForKey:](self->_nanoMusicSyncDefaults, "objectForKey:", CFSTR("GreenTeaMobileIpodCellularKeysAreMirrored"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Already have default Green Tea cellular settings", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Will set default Green Tea cellular settings", buf, 2u);
    }

    v3 = dispatch_queue_create("com.apple.NanoMusicSync.MediaSettingsSynchronizer", 0);
    _CTServerConnectionAddIdentifierException();
    _CTServerConnectionCreateOnTargetQueue();
    v13 = *MEMORY[0x24BDC2A40];
    v14[0] = *MEMORY[0x24BDC2A50];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CellularUsagePolicyMirroring = _CTServerConnectionGetCellularUsagePolicyMirroring();
    if ((_DWORD)CellularUsagePolicyMirroring)
    {
      NMLogForCategory(5);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v10 = CellularUsagePolicyMirroring;
        v11 = 1024;
        v12 = HIDWORD(CellularUsagePolicyMirroring);
        _os_log_impl(&dword_216E27000, v7, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Error fetching mirroring policy %d %d", buf, 0xEu);
      }

      __73__NMSMediaSettingsSynchronizer__createDefaultGreenTeaSettingsIfNecessary__block_invoke(v8, 0);
    }

  }
}

void __73__NMSMediaSettingsSynchronizer__createDefaultGreenTeaSettingsIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  +[NMSGreenTeaStreamingDefaults sharedInstance](NMSGreenTeaStreamingDefaults, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGreenTeaMusicAllowCellularForStreaming:", 0);

  +[NMSGreenTeaStreamingDefaults sharedInstance](NMSGreenTeaStreamingDefaults, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGreenTeaMusicAllowCellularForHighQualityStreaming:", 0);

  +[NMSGreenTeaStreamingDefaults sharedInstance](NMSGreenTeaStreamingDefaults, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGreenTeaMusicIsMirroringStreamingSettings:", a2);

}

uint64_t __73__NMSMediaSettingsSynchronizer__createDefaultGreenTeaSettingsIfNecessary__block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v6;
  _BOOL4 v7;
  int v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)a3)
  {
    if (v7)
    {
      v9 = 67109376;
      v10 = a3;
      v11 = 1024;
      v12 = HIDWORD(a3);
      _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Error fetching mirroring policy %d %d", (uint8_t *)&v9, 0xEu);
    }
  }
  else if (v7)
  {
    v9 = 67109120;
    v10 = a2;
    _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Fetched mirroring policy %x", (uint8_t *)&v9, 8u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_reconcileGreenTeaSettingsIfNecessary
{
  void *v3;
  void *v4;
  char v5;
  int64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  int v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((isEitherDeviceGreenTeaCapable() & 1) == 0)
  {
    NMLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      v9 = "[NMSMediaSettingsSynchronizer] Neither device is Green Tea capable. Will not reconcile.";
LABEL_11:
      _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 2u);
    }
LABEL_12:

    return;
  }
  -[NSUserDefaults objectForKey:](self->_nanoMusicSyncDefaults, "objectForKey:", CFSTR("GreenTeaMobileIpodCellularKeysAreMirrored"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    NMLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      v9 = "[NMSMediaSettingsSynchronizer] Companion has not set Green Tea mirroring yet. We'll wait.";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  +[NMSGreenTeaStreamingDefaults sharedInstance](NMSGreenTeaStreamingDefaults, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "greenTeaMusicIsMirroringStreamingSettings");

  if ((v5 & 1) == 0)
  {
    v6 = -[NMSMediaSettingsSynchronizer _preferredGreenTeaMusicStreamingResolutionPreference](self, "_preferredGreenTeaMusicStreamingResolutionPreference");
    NMLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = v6;
      _os_log_impl(&dword_216E27000, v7, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Reconciling on init. Overriding LowBandwidthResolution with %ld", (uint8_t *)&v10, 0xCu);
    }

    CFPreferencesSetAppValue(CFSTR("MusicLowBandwidthResolution"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6), CFSTR("com.apple.mobileipod"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileipod"));
  }
}

- (void)_migrateMusicDefaultsIfNecessary
{
  NSInteger v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  NSInteger v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSUserDefaults integerForKey:](self->_nanoMusicSyncDefaults, "integerForKey:", CFSTR("NMLastSyncedMusicSettingsVersion"));
  if (v3 != 10)
  {
    v4 = v3;
    NMLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v26 = v4;
      v27 = 2048;
      v28 = 10;
      _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Music settings migration required. LastSyncedVersion:%lu, CurrentVersion:%lu", buf, 0x16u);
    }

    if (v4 > 3)
    {
      if (v4 > 9)
        return;
    }
    else
    {
      if (!isEitherDeviceGreenTeaCapable()
        || (+[NMSGreenTeaStreamingDefaults sharedInstance](NMSGreenTeaStreamingDefaults, "sharedInstance"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            v7 = objc_msgSend(v6, "greenTeaMusicIsMirroringStreamingSettings"),
            v6,
            v7))
      {
        objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE6B4E0], "activePairedDeviceSelectorBlock");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("88D7381B-F0D1-498F-88D5-9F016A27EB4F"));
        v13 = objc_msgSend(v11, "supportsCapability:", v12);

        if (v13)
        {
          v14 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("MusicLowBandwidthResolution"));
        }
        else
        {
          v16 = -[NSUserDefaults integerForKey:](self->_mobileIPodDefaults, "integerForKey:", CFSTR("MusicLowBandwidthResolution"));
          CFPreferencesSetAppValue(CFSTR("MusicAllowsCellularData"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v16 != 0), CFSTR("com.apple.mobileipod"));
          CFPreferencesSetAppValue(CFSTR("MusicAllowsHighQualityStreamingOnCellular"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v16 == 256), CFSTR("com.apple.mobileipod"));
          CFPreferencesAppSynchronize(CFSTR("com.apple.mobileipod"));
          v14 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("MusicAllowsCellularData"), CFSTR("MusicAllowsHighQualityStreamingOnCellular"), 0);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.mobileipod"), v15);

      }
      -[NSUserDefaults setInteger:forKey:](self->_nanoMusicSyncDefaults, "setInteger:forKey:", 4, CFSTR("NMLastSyncedMusicSettingsVersion"));
    }
    objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B4E0], "activePairedDeviceSelectorBlock");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("C79D46D1-84CF-4208-AEA0-39117F9770E7"));
    v22 = objc_msgSend(v20, "supportsCapability:", v21);

    if (v22)
    {
      CFPreferencesAppSynchronize(CFSTR("com.apple.Music"));
      v23 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("AllowsCellularDataDownloads"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.Music"), v24);

      -[NSUserDefaults setInteger:forKey:](self->_nanoMusicSyncDefaults, "setInteger:forKey:", 10, CFSTR("NMLastSyncedMusicSettingsVersion"));
    }
  }
}

- (int64_t)_preferredGreenTeaMusicStreamingResolutionPreference
{
  void *v2;
  int v3;
  int64_t v4;
  void *v5;
  int v6;

  +[NMSGreenTeaStreamingDefaults sharedInstance](NMSGreenTeaStreamingDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "greenTeaMusicAllowCellularForStreaming");

  if (v3)
    v4 = 64;
  else
    v4 = 0;
  +[NMSGreenTeaStreamingDefaults sharedInstance](NMSGreenTeaStreamingDefaults, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "greenTeaMusicAllowCellularForHighQualityStreaming");

  if (v6)
    return 256;
  else
    return v4;
}

- (id)_podcastsUserDefaults
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(getLSBundleProxyClass(), "bundleProxyForIdentifier:", CFSTR("com.apple.podcasts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataContainerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "_initWithSuiteName:container:", CFSTR("com.apple.podcasts"), v3);
  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Observing podcasts user defaults %@ at %@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (id)_podcastsAppGroupPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(getLSBundleProxyClass(), "bundleProxyForIdentifier:", CFSTR("com.apple.podcasts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupContainerURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_syncPodcastDefaultsIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B4E0], "activePairedDeviceSelectorBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAllDevicesWithArchivedDevicesMatching:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("54FC3688-3F2A-435A-A95D-2F1866839415"));
  v8 = objc_msgSend(v6, "supportsCapability:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = -[NSUserDefaults integerForKey:](self->_nanoMusicSyncDefaults, "integerForKey:", CFSTR("NMLastSyncedPodcastsSettingsVersion"));
    if (v9 != 3)
    {
      if (v9 <= 2)
      {
        NMLogForCategory(5);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_216E27000, v10, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Never synced podcasts defaults before.", v11, 2u);
        }

        -[NMSMediaSettingsSynchronizer observeValueForKeyPath:ofObject:change:context:](self, "observeValueForKeyPath:ofObject:change:context:", 0, 0, 0, CFSTR("MTSyncSubscriptions"));
        -[NMSMediaSettingsSynchronizer observeValueForKeyPath:ofObject:change:context:](self, "observeValueForKeyPath:ofObject:change:context:", 0, 0, 0, CFSTR("MTPodcastUpdateIntervalDefault"));
        -[NMSMediaSettingsSynchronizer observeValueForKeyPath:ofObject:change:context:](self, "observeValueForKeyPath:ofObject:change:context:", 0, 0, 0, CFSTR("MTContinuousPlaybackEnabled"));
        -[NMSMediaSettingsSynchronizer observeValueForKeyPath:ofObject:change:context:](self, "observeValueForKeyPath:ofObject:change:context:", 0, 0, 0, CFSTR("MTSkipForwardIntervalDefault"));
        -[NMSMediaSettingsSynchronizer observeValueForKeyPath:ofObject:change:context:](self, "observeValueForKeyPath:ofObject:change:context:", 0, 0, 0, CFSTR("MTSkipBackwardsIntervalDefault"));
        -[NMSMediaSettingsSynchronizer observeValueForKeyPath:ofObject:change:context:](self, "observeValueForKeyPath:ofObject:change:context:", 0, 0, 0, CFSTR("MTRemoteSkipInsteadOfNextTrackDefault"));
        -[NMSMediaSettingsSynchronizer observeValueForKeyPath:ofObject:change:context:](self, "observeValueForKeyPath:ofObject:change:context:", 0, 0, 0, CFSTR("MTPrivacyResetIdentifier"));
      }
      -[NSUserDefaults setInteger:forKey:](self->_nanoMusicSyncDefaults, "setInteger:forKey:", 3, CFSTR("NMLastSyncedPodcastsSettingsVersion"));
    }
  }
}

- (void)endObservingUpdates
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_isObserving)
  {
    NMLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] End observing setting updates.", v4, 2u);
    }

    self->_isObserving = 0;
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_mediaPlaybackCoreDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("MPCPlaybackPrivateListeningEnabled"), CFSTR("MPCPlaybackPrivateListeningEnabled"));
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_mobileIPodDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("MusicLowBandwidthResolution"), CFSTR("MusicLowBandwidthResolution"));
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_musicDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("AllowsCellularDataDownloads"), CFSTR("AllowsCellularDataDownloads"));
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_nanoMusicSyncDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("GreenTeaMobileIpodCellularKeysAreMirrored"), CFSTR("GreenTeaMobileIpodCellularKeysAreMirrored"));
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_nanoMusicSyncDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("GreenTeaMusicAllowsCellularData"), CFSTR("GreenTeaMusicAllowsCellularData"));
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_nanoMusicSyncDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("GreenTeaMusicAllowsHighQualityStreamingOnCellular"), CFSTR("GreenTeaMusicAllowsHighQualityStreamingOnCellular"));
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_nanoMusicSyncDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("GreenTeaMusicAllowsDownloadsOverCellular"), CFSTR("GreenTeaMusicAllowsDownloadsOverCellular"));
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_podcastsDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("MTSyncSubscriptions"), CFSTR("MTSyncSubscriptions"));
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_podcastsDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("MTPodcastUpdateIntervalDefault"), CFSTR("MTPodcastUpdateIntervalDefault"));
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_podcastsDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("MTContinuousPlaybackEnabled"), CFSTR("MTContinuousPlaybackEnabled"));
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_podcastsDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("MTSkipForwardIntervalDefault"), CFSTR("MTSkipForwardIntervalDefault"));
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_podcastsDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("MTSkipBackwardsIntervalDefault"), CFSTR("MTSkipBackwardsIntervalDefault"));
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_podcastsDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("MTRemoteSkipInsteadOfNextTrackDefault"), CFSTR("MTRemoteSkipInsteadOfNextTrackDefault"));
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_podcastsDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("MTPrivacyResetIdentifier"), CFSTR("MTPrivacyResetIdentifier"));
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *v9;
  void *v10;
  int v11;
  __CFString *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSUserDefaults *mobileIPodDefaults;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  __CFString *v33;
  id *p_isa;
  id v35;
  NSObject *v36;
  NSObject *v37;
  int v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  NMSMediaSettingsSynchronizer *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  _BOOL4 v49;
  id v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  int v69;
  int v70;
  NMSMediaSettingsSynchronizer *v71;
  id v72;
  id v73;
  __CFString *v74;
  uint8_t buf[4];
  _BYTE v76[10];
  _BYTE v77[10];
  _BYTE v78[10];
  _BYTE v79[10];
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v72 = a3;
  v73 = a4;
  if (isEitherDeviceGreenTeaCapable())
  {
    NMLogForCategory(5);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] We found a Green Tea device", buf, 2u);
    }

    +[NMSGreenTeaStreamingDefaults sharedInstance](NMSGreenTeaStreamingDefaults, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "greenTeaMusicIsMirroringStreamingSettings");

  }
  else
  {
    v11 = 1;
  }
  v71 = self;
  v70 = v11;
  if (a6 == CFSTR("MPCPlaybackPrivateListeningEnabled"))
  {
    v74 = CFSTR("MPCPlaybackPrivateListeningEnabled");
    -[NSUserDefaults objectForKey:](self->_mediaPlaybackCoreDefaults, "objectForKey:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("com.apple.mediaplaybackcore");
    goto LABEL_14;
  }
  if (a6 != CFSTR("MusicLowBandwidthResolution"))
  {
    if (a6 == CFSTR("AllowsCellularDataDownloads"))
    {
      if (v11)
      {
        v74 = CFSTR("AllowsCellularDataDownloads");
        -[NSUserDefaults objectForKey:](self->_musicDefaults, "objectForKey:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("com.apple.Music");
        goto LABEL_14;
      }
    }
    else if (CFSTR("GreenTeaMusicAllowsCellularData") == a6
           || CFSTR("GreenTeaMusicAllowsHighQualityStreamingOnCellular") == a6
           || CFSTR("GreenTeaMusicAllowsDownloadsOverCellular") == a6)
    {
      v12 = CFSTR("com.apple.NanoMusicSync");
      v74 = a6;
      -[NSUserDefaults objectForKey:](self->_nanoMusicSyncDefaults, "objectForKey:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v14 = 1;
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  if (!v11)
  {
LABEL_20:
    v14 = 0;
    v13 = 0;
    v74 = 0;
    v12 = 0;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B4E0], "activePairedDeviceSelectorBlock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("88D7381B-F0D1-498F-88D5-9F016A27EB4F"));
  v20 = objc_msgSend(v18, "supportsCapability:", v19);

  mobileIPodDefaults = self->_mobileIPodDefaults;
  if (v20)
  {
    v74 = CFSTR("MusicLowBandwidthResolution");
    -[NSUserDefaults objectForKey:](mobileIPodDefaults, "objectForKey:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("com.apple.mobileipod");
    v14 = 1;
  }
  else
  {
    v22 = -[NSUserDefaults integerForKey:](mobileIPodDefaults, "integerForKey:", CFSTR("MusicLowBandwidthResolution"));
    v12 = CFSTR("com.apple.mobileipod");
    CFPreferencesSetAppValue(CFSTR("MusicAllowsCellularData"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v22 != 0), CFSTR("com.apple.mobileipod"));
    CFPreferencesSetAppValue(CFSTR("MusicAllowsHighQualityStreamingOnCellular"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v22 == 256), CFSTR("com.apple.mobileipod"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileipod"));
    v23 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("MusicAllowsCellularData"), CFSTR("MusicAllowsHighQualityStreamingOnCellular"), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.mobileipod"), v24);

    v14 = 0;
    v13 = 0;
    v74 = 0;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B4E0], "activePairedDeviceSelectorBlock");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "getAllDevicesWithArchivedDevicesMatching:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("54FC3688-3F2A-435A-A95D-2F1866839415"));
  v30 = objc_msgSend(v28, "supportsCapability:", v29);

  if ((v30 & 1) != 0)
  {
LABEL_23:
    if ((v14 & 1) != 0)
    {
      v31 = v13;
      v32 = v72;
      v33 = v74;
LABEL_44:
      NMLogForCategory(5);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v76 = v12;
        *(_WORD *)&v76[8] = 2112;
        *(_QWORD *)v77 = v33;
        *(_WORD *)&v77[8] = 2112;
        *(_QWORD *)v78 = v31;
        _os_log_impl(&dword_216E27000, v41, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Synchronizing defaults for domain: %@, key: %@, value: %@", buf, 0x20u);
      }

      v35 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v33);
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "synchronizeUserDefaultsDomain:keys:", v12, v37);
      goto LABEL_47;
    }
    v35 = 0;
    v31 = v13;
    goto LABEL_35;
  }
  v33 = CFSTR("MTSyncSubscriptions");
  if (a6 == CFSTR("MTSyncSubscriptions"))
  {
    p_isa = (id *)&v71->super.isa;
LABEL_39:

    objc_msgSend(p_isa, "_podcastsAppGroupPath");
    v35 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(p_isa[6], "objectForKey:", v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_40;
  }
  v33 = CFSTR("MTPodcastUpdateIntervalDefault");
  p_isa = (id *)&v71->super.isa;
  if (a6 == CFSTR("MTPodcastUpdateIntervalDefault"))
    goto LABEL_39;
  v33 = CFSTR("MTContinuousPlaybackEnabled");
  if (a6 == CFSTR("MTContinuousPlaybackEnabled"))
    goto LABEL_39;
  v33 = CFSTR("MTSkipForwardIntervalDefault");
  if (a6 == CFSTR("MTSkipForwardIntervalDefault"))
    goto LABEL_39;
  v33 = CFSTR("MTSkipBackwardsIntervalDefault");
  if (a6 == CFSTR("MTSkipBackwardsIntervalDefault"))
    goto LABEL_39;
  v33 = CFSTR("MTRemoteSkipInsteadOfNextTrackDefault");
  if (a6 == CFSTR("MTRemoteSkipInsteadOfNextTrackDefault"))
    goto LABEL_39;
  if (a6 != CFSTR("MTPrivacyResetIdentifier"))
    goto LABEL_23;

  -[NMSMediaSettingsSynchronizer _podcastsAppGroupPath](v71, "_podcastsAppGroupPath");
  v35 = (id)objc_claimAutoreleasedReturnValue();

  v33 = CFSTR("MTPrivacyResetIdentifier");
  -[NSUserDefaults objectForKey:](v71->_podcastsDefaults, "objectForKey:", CFSTR("MTPrivacyResetIdentifier"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v31, "BOOLValue") & 1) == 0)
  {
    v74 = CFSTR("MTPrivacyResetIdentifier");
    v12 = CFSTR("243LU875E5.groups.com.apple.podcasts");
LABEL_35:
    NMLogForCategory(5);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (CFSTR("GreenTeaMobileIpodCellularKeysAreMirrored") == a6)
    {
      v42 = v71;
      v32 = v72;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216E27000, v37, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] GreenTeaMobileIpodCellularKeysAreMirrored did change", buf, 2u);
      }

      if (v70)
      {
        v68 = -[NSUserDefaults integerForKey:](v71->_mobileIPodDefaults, "integerForKey:", CFSTR("MusicLowBandwidthResolution"));
        objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE6B4E0], "activePairedDeviceSelectorBlock");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "firstObject");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("88D7381B-F0D1-498F-88D5-9F016A27EB4F"));
        v69 = objc_msgSend(v46, "supportsCapability:", v47);

        NMLogForCategory(5);
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
        if (v69)
        {
          if (v49)
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)v76 = v68;
            _os_log_impl(&dword_216E27000, v48, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer]\tSynchronizing preferredMusicLowBandwidthResolution %ld", buf, 0xCu);
          }

          v50 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("MusicLowBandwidthResolution"));
          v51 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v49)
          {
            -[NSUserDefaults objectForKey:](v71->_mobileIPodDefaults, "objectForKey:", CFSTR("MusicAllowsCellularData"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSUserDefaults objectForKey:](v71->_mobileIPodDefaults, "objectForKey:", CFSTR("MusicAllowsHighQualityStreamingOnCellular"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v76 = v56;
            *(_WORD *)&v76[8] = 2112;
            *(_QWORD *)v77 = v57;
            _os_log_impl(&dword_216E27000, v48, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer]\tSynchronizing CellularStreamingAllowed %@ and MusicAllowsHighQualityStreamingOnCellular %@", buf, 0x16u);

          }
          v50 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("MusicAllowsCellularData"), CFSTR("MusicAllowsHighQualityStreamingOnCellular"), 0);
          v51 = objc_claimAutoreleasedReturnValue();
        }
        v58 = (void *)v51;
        objc_msgSend(v50, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.mobileipod"), v51);
        v42 = v71;

        NMLogForCategory(5);
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          -[NSUserDefaults objectForKey:](v71->_musicDefaults, "objectForKey:", CFSTR("AllowsCellularDataDownloads"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v76 = v60;
          _os_log_impl(&dword_216E27000, v59, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer]\tSynchronizing AllowsDownloadsOverCellular %@", buf, 0xCu);

        }
        v61 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("AllowsCellularDataDownloads"), 0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = CFSTR("com.apple.Music");
        v64 = v61;
      }
      else
      {
        NMLogForCategory(5);
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          -[NSUserDefaults objectForKey:](v71->_nanoMusicSyncDefaults, "objectForKey:", CFSTR("GreenTeaMusicAllowsCellularData"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSUserDefaults objectForKey:](v71->_nanoMusicSyncDefaults, "objectForKey:");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSUserDefaults objectForKey:](v71->_nanoMusicSyncDefaults, "objectForKey:");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v76 = v53;
          *(_WORD *)&v76[8] = 2112;
          *(_QWORD *)v77 = v54;
          *(_WORD *)&v77[8] = 2112;
          *(_QWORD *)v78 = v55;
          _os_log_impl(&dword_216E27000, v52, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer]\tSynchronizing GreenTeaCellularStreamingAllowed %@, GreenTeaMusicAllowsHighQualityStreamingOnCellular %@, and GreenTeaMusicAllowsDownloadsOverCellular: %@", buf, 0x20u);

          v42 = v71;
        }

        v61 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("GreenTeaMusicAllowsCellularData"), CFSTR("GreenTeaMusicAllowsHighQualityStreamingOnCellular"), CFSTR("GreenTeaMusicAllowsDownloadsOverCellular"), 0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v61;
        v63 = CFSTR("com.apple.NanoMusicSync");
      }
      objc_msgSend(v64, "synchronizeUserDefaultsDomain:keys:", v63, v62);

      NMLogForCategory(5);
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        -[NSUserDefaults objectForKey:](v42->_nanoMusicSyncDefaults, "objectForKey:", a6);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v76 = v66;
        *(_WORD *)&v76[8] = 1024;
        *(_DWORD *)v77 = v70;
        _os_log_impl(&dword_216E27000, v65, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer]\tSynchronizing GreenTeaMobileIpodCellularKeysAreMirrored %@ BOOL value %x", buf, 0x12u);

      }
      v37 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a6);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject synchronizeUserDefaultsDomain:keys:](v37, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.NanoMusicSync"), v67);

      v33 = v74;
    }
    else
    {
      v32 = v72;
      v33 = v74;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v38 = isEitherDeviceGreenTeaCapable();
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v76 = v38;
        *(_WORD *)&v76[4] = 1024;
        *(_DWORD *)&v76[6] = v70;
        *(_WORD *)v77 = 2112;
        *(_QWORD *)&v77[2] = v72;
        *(_WORD *)v78 = 2112;
        *(_QWORD *)&v78[2] = v73;
        *(_WORD *)v79 = 2112;
        *(_QWORD *)&v79[2] = a6;
        _os_log_error_impl(&dword_216E27000, v37, OS_LOG_TYPE_ERROR, "[NMSMediaSettingsSynchronizer] Did not sync value change. isGreenTea %x, isMirroringCellularPolicy: %x, keypath: %@, object: %@, context: %@", buf, 0x2Cu);
      }
    }
    goto LABEL_47;
  }
LABEL_40:
  v32 = v72;
  v12 = CFSTR("243LU875E5.groups.com.apple.podcasts");
  if (!v35)
    goto LABEL_44;
  NMLogForCategory(5);
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)v76 = CFSTR("243LU875E5.groups.com.apple.podcasts");
    *(_WORD *)&v76[8] = 2112;
    *(_QWORD *)v77 = CFSTR("com.apple.podcasts");
    *(_WORD *)&v77[8] = 2112;
    *(_QWORD *)v78 = CFSTR("243LU875E5.groups.com.apple.podcasts");
    *(_WORD *)&v78[8] = 2112;
    *(_QWORD *)v79 = v33;
    *(_WORD *)&v79[8] = 2112;
    v80 = v31;
    _os_log_impl(&dword_216E27000, v39, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Synchronizing defaults for domain: %@, container: %@, appGroup: %@, key: %@, value: %@", buf, 0x34u);
  }

  v37 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v33);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject synchronizeUserDefaultsDomain:keys:container:appGroupContainer:](v37, "synchronizeUserDefaultsDomain:keys:container:appGroupContainer:", CFSTR("243LU875E5.groups.com.apple.podcasts"), v40, CFSTR("com.apple.podcasts"), CFSTR("243LU875E5.groups.com.apple.podcasts"));

LABEL_47:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podcastsDefaults, 0);
  objc_storeStrong((id *)&self->_nanoMusicSyncDefaults, 0);
  objc_storeStrong((id *)&self->_musicDefaults, 0);
  objc_storeStrong((id *)&self->_mobileIPodDefaults, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackCoreDefaults, 0);
}

@end
