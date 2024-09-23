@implementation MRUserSettings

+ (id)currentSettings
{
  if (currentSettings___once != -1)
    dispatch_once(&currentSettings___once, &__block_literal_global_60);
  return (id)currentSettings___currentSettings;
}

- (BOOL)supportMultiplayerHost
{
  void *v2;
  char v3;

  +[MRSharedSettings currentSettings](MRSharedSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiplayerHost");

  return v3;
}

- (BOOL)verboseOriginClientLogging
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MRUserSettings_verboseOriginClientLogging__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (verboseOriginClientLogging___once != -1)
    dispatch_once(&verboseOriginClientLogging___once, block);
  return verboseOriginClientLogging___should;
}

- (unint64_t)checkXPCConnectionStatusDefaultInterval
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MRUserSettings_checkXPCConnectionStatusDefaultInterval__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (checkXPCConnectionStatusDefaultInterval___once != -1)
    dispatch_once(&checkXPCConnectionStatusDefaultInterval___once, block);
  return checkXPCConnectionStatusDefaultInterval___interval;
}

- (BOOL)canHostMultiplayerStream
{
  void *v2;
  char v3;

  +[MRSharedSettings currentSettings](MRSharedSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canHostMultiplayerStream");

  return v3;
}

- (BOOL)supportOutputContextSync
{
  BOOL v3;

  v3 = -[MRUserSettings supportGenericAudioGroup](self, "supportGenericAudioGroup");
  if (self || v3)
    return 1;
  else
    return objc_msgSend(0, "donateActiveRoutesToBiome");
}

- (BOOL)supportGenericAudioGroup
{
  return 0;
}

- (BOOL)useClusterDevices
{
  return _os_feature_enabled_impl();
}

- (BOOL)groupSessionNearbyBanner
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionNearbyBanner"), 1);
}

- (BOOL)calculateDiscoveryUpdates
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MRUserSettings_calculateDiscoveryUpdates__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (calculateDiscoveryUpdates_onceToken != -1)
    dispatch_once(&calculateDiscoveryUpdates_onceToken, block);
  return calculateDiscoveryUpdates_support;
}

- (BOOL)verboseConnectionMonitorLogging
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MRUserSettings_verboseConnectionMonitorLogging__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (verboseConnectionMonitorLogging___once != -1)
    dispatch_once(&verboseConnectionMonitorLogging___once, block);
  return verboseConnectionMonitorLogging___should;
}

- (double)checkXPCConnectionStatusDefaultResponseTimeout
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MRUserSettings_checkXPCConnectionStatusDefaultResponseTimeout__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (checkXPCConnectionStatusDefaultResponseTimeout___once != -1)
    dispatch_once(&checkXPCConnectionStatusDefaultResponseTimeout___once, block);
  return (double)(unint64_t)checkXPCConnectionStatusDefaultResponseTimeout___timeout;
}

uint64_t __43__MRUserSettings_calculateDiscoveryUpdates__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("CalculateDiscoveryUpdates"), 1);
  calculateDiscoveryUpdates_support = result;
  return result;
}

uint64_t __49__MRUserSettings_verboseConnectionMonitorLogging__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("verboseConnectionMonitorLogging"), 0);
  verboseConnectionMonitorLogging___should = result;
  return result;
}

uint64_t __55__MRUserSettings_verboseOutputContextDataSourceLogging__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("verboseOutputContextDataSourceLogging"), 0);
  verboseOutputContextDataSourceLogging___should = result;
  return result;
}

uint64_t __44__MRUserSettings_verboseOriginClientLogging__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("verboseOriginClientLogging"), 0);
  verboseOriginClientLogging___should = result;
  return result;
}

- (uint64_t)_BOOLValueForKey:(uint64_t)a3 usingDefaultValue:
{
  id v5;
  void *v6;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      a3 = objc_msgSend(*(id *)(a1 + 8), "BOOLForKey:", v5);
  }
  else
  {
    a3 = 0;
  }

  return a3;
}

- (BOOL)supportGroupSessionActiveEndpoint
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("SupportGroupSessionActiveEndpoint"), 0);
}

- (NSArray)expectedClientAuditTokens
{
  void *v2;
  void *v3;

  -[NSUserDefaults arrayForKey:](self->_userDefaults, "arrayForKey:", CFSTR("ExpectedClientAuditTokens"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (BOOL)takelockScreenAssertion
{
  void *v2;
  char v3;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forceEnableUIAssertions");

  return (v3 & 1) != 0 || MGGetSInt32Answer() - 1 < 3;
}

void __33__MRUserSettings_currentSettings__block_invoke()
{
  MRUserSettings *v0;
  void *v1;

  v0 = objc_alloc_init(MRUserSettings);
  v1 = (void *)currentSettings___currentSettings;
  currentSettings___currentSettings = (uint64_t)v0;

}

- (MRUserSettings)init
{
  MRUserSettings *v2;
  uint64_t v3;
  NSUserDefaults *userDefaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUserSettings;
  v2 = -[MRUserSettings init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mediaremote"));
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

  }
  return v2;
}

- (void)setExpectedClientAuditTokens:(id)a3
{
  NSUserDefaults *userDefaults;
  id v5;

  userDefaults = self->_userDefaults;
  v5 = a3;
  -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", 0, CFSTR("ExpectedClientPIDs"));
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v5, CFSTR("ExpectedClientAuditTokens"));

}

- (void)setConnectedClientAuditTokens:(id)a3
{
  NSUserDefaults *userDefaults;
  id v5;

  userDefaults = self->_userDefaults;
  v5 = a3;
  -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", 0, CFSTR("ConnectedClientPIDs"));
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v5, CFSTR("ConnectedClientAuditTokens"));

}

- (void)updateDefaultSupportedCommandsData:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[MRUserSettings defaultSupportedCommandsData](self, "defaultSupportedCommandsData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  if (v8)
    v9 = (id)objc_msgSend(v8, "mutableCopy");
  else
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v9;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v6);

  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v10, CFSTR("DefaultSupportedCommands"));
}

- (id)defaultSupportedCommandsData
{
  return -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("DefaultSupportedCommands"));
}

- (double)groupSessionAttributionValidityDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionAttributionValidityDuration"), 43200.0);
}

- (BOOL)verboseOutputContextDataSourceLogging
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MRUserSettings_verboseOutputContextDataSourceLogging__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (verboseOutputContextDataSourceLogging___once != -1)
    dispatch_once(&verboseOutputContextDataSourceLogging___once, block);
  return verboseOutputContextDataSourceLogging___should;
}

uint64_t __73__MRUserSettings_groupSessionNearbyContactDiscoveryDidChangeNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("MRUserSettingsGroupSessionNearbyContactDiscoveryEnabled"), 0, MRUserSettingsGroupSessionNearbyDiscoveryContext);
}

void __64__MRUserSettings_checkXPCConnectionStatusDefaultResponseTimeout__block_invoke(uint64_t a1)
{
  checkXPCConnectionStatusDefaultResponseTimeout___timeout = (unint64_t)-[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("checkXPCConnectionStatusDefaultResponseTimeout"), 30.0);
}

- (double)_doubleValueForKey:(double)a3 usingDefaultValue:
{
  id v5;
  void *v6;
  double v7;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 8), "doubleForKey:", v5);
      a3 = v7;
    }
  }
  else
  {
    a3 = 0.0;
  }

  return a3;
}

- (NSString)groupSessionNearbyContactDiscoveryDidChangeNotification
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MRUserSettings_groupSessionNearbyContactDiscoveryDidChangeNotification__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (groupSessionNearbyContactDiscoveryDidChangeNotification_onceToken != -1)
    dispatch_once(&groupSessionNearbyContactDiscoveryDidChangeNotification_onceToken, block);
  return (NSString *)CFSTR("MRGroupSessionNearbyContactDiscoveryDidChangeNotification");
}

- (BOOL)supportGroupSessionAttribution
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionAttribution"), 1);
}

- (BOOL)homepodDemoMode
{
  return self->_homepodDemoMode;
}

- (BOOL)forceDeviceInfoDiscovery
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MRUserSettings_forceDeviceInfoDiscovery__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (forceDeviceInfoDiscovery___once != -1)
    dispatch_once(&forceDeviceInfoDiscovery___once, block);
  return forceDeviceInfoDiscovery___value;
}

- (BOOL)usePeerToPeerExternalDeviceConnections
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("MRExternalDeviceIncludePeerToPeer"), 0);
}

- (BOOL)useNoDelayOptionForExternalDeviceSockets
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("MRExternalDeviceUseNoDelayOptionForExternalDeviceSockets"), 1);
}

- (BOOL)useDebugAVRouteWithoutVolumeControl
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("UseDebugAVRouteWithoutVolumeControl"), 0);
}

- (BOOL)shouldInitializeTelevisionBonjourService
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("ShouldInitializeTVBonjourService"), 0);
}

- (BOOL)shouldInitializeGenericBonjourService
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("ShouldInitializeGenericBonjourService"), 0);
}

- (BOOL)shouldInitializeRapportService
{
  return _os_feature_enabled_impl();
}

- (BOOL)shouldLogPairingSetupCode
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("LogPairingSetupCode"), 0);
}

- (BOOL)shouldLogArtwork
{
  _QWORD block[5];

  if (MRProcessIsMediaRemoteDaemon())
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__MRUserSettings_shouldLogArtwork__block_invoke;
    block[3] = &unk_1E30C5CA8;
    block[4] = self;
    if (shouldLogArtwork_onceToken != -1)
      dispatch_once(&shouldLogArtwork_onceToken, block);
  }
  return shouldLogArtwork_shouldLogArtwork;
}

uint64_t __34__MRUserSettings_shouldLogArtwork__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("LogArtwork"), 0);
  shouldLogArtwork_shouldLogArtwork = result;
  return result;
}

- (BOOL)verboseProtocolMessageLogging
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("verboseProtocolMessageLogging"), 0);
}

- (BOOL)verboseHostedDiscoverySessionLogging
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("verboseHostedDiscoverySessionLogging"), 0);
}

- (BOOL)verboseHostedExternalDeviceClientLogging
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("verboseHostedExternalDeviceClientLogging"), 0);
}

- (BOOL)verboseMRDMediaRemoteClientLogging
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("verboseMRDMediaRemoteClientLogging"), 0);
}

- (BOOL)verboseNowPlayingControllerLogging
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MRUserSettings_verboseNowPlayingControllerLogging__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (verboseNowPlayingControllerLogging___once != -1)
    dispatch_once(&verboseNowPlayingControllerLogging___once, block);
  return verboseNowPlayingControllerLogging___should;
}

uint64_t __52__MRUserSettings_verboseNowPlayingControllerLogging__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("verboseNowPlayingControllerLogging"), 1);
  verboseNowPlayingControllerLogging___should = result;
  return result;
}

- (BOOL)verboseOriginForwarderLogging
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MRUserSettings_verboseOriginForwarderLogging__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (verboseOriginForwarderLogging___once != -1)
    dispatch_once(&verboseOriginForwarderLogging___once, block);
  return verboseOriginForwarderLogging___should;
}

uint64_t __47__MRUserSettings_verboseOriginForwarderLogging__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("verboseOriginForwarderLogging"), 1);
  verboseOriginForwarderLogging___should = result;
  return result;
}

- (BOOL)verboseNowPlayingStateObserver
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MRUserSettings_verboseNowPlayingStateObserver__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (verboseNowPlayingStateObserver___once != -1)
    dispatch_once(&verboseNowPlayingStateObserver___once, block);
  return verboseNowPlayingStateObserver___should;
}

uint64_t __48__MRUserSettings_verboseNowPlayingStateObserver__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("verboseNowPlayingStateObserver"), 0);
  verboseNowPlayingStateObserver___should = result;
  return result;
}

- (BOOL)verboseRemoteControlDiscoveryLogging
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MRUserSettings_verboseRemoteControlDiscoveryLogging__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (verboseRemoteControlDiscoveryLogging___once != -1)
    dispatch_once(&verboseRemoteControlDiscoveryLogging___once, block);
  return verboseRemoteControlDiscoveryLogging___should;
}

uint64_t __54__MRUserSettings_verboseRemoteControlDiscoveryLogging__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("verboseRemoteControlDiscoveryLogging"), 0);
  verboseRemoteControlDiscoveryLogging___should = result;
  return result;
}

- (BOOL)verboseDiscoveryLogging
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MRUserSettings_verboseDiscoveryLogging__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (verboseDiscoveryLogging___once != -1)
    dispatch_once(&verboseDiscoveryLogging___once, block);
  return verboseDiscoveryLogging___should;
}

uint64_t __41__MRUserSettings_verboseDiscoveryLogging__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("verboseDiscoveryLogging"), 0);
  verboseDiscoveryLogging___should = result;
  return result;
}

- (BOOL)verboseImageLoadingLogging
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MRUserSettings_verboseImageLoadingLogging__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (verboseImageLoadingLogging___once != -1)
    dispatch_once(&verboseImageLoadingLogging___once, block);
  return verboseImageLoadingLogging___should;
}

uint64_t __44__MRUserSettings_verboseImageLoadingLogging__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("verboseImageLoadingLogging"), 0);
  verboseImageLoadingLogging___should = result;
  return result;
}

- (BOOL)verboseMediaControlLogging
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MRUserSettings_verboseMediaControlLogging__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (verboseMediaControlLogging___once != -1)
    dispatch_once(&verboseMediaControlLogging___once, block);
  return verboseMediaControlLogging___should;
}

uint64_t __44__MRUserSettings_verboseMediaControlLogging__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("verboseMediaControlLogging"), 0);
  verboseMediaControlLogging___should = result;
  return result;
}

- (BOOL)verboseOutputContextLogging
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MRUserSettings_verboseOutputContextLogging__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (verboseOutputContextLogging___once != -1)
    dispatch_once(&verboseOutputContextLogging___once, block);
  return verboseOutputContextLogging___should;
}

void __45__MRUserSettings_verboseOutputContextLogging__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  verboseOutputContextLogging___should = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](v1, CFSTR("verboseOutputContextLogging"), objc_msgSend(v2, "supportOutputContextSync"));

}

- (BOOL)hasExternalDeviceSocketQOSLevelSet
{
  void *v2;
  BOOL v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("MRExternalDeviceSocketsQOSLevel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)externalDeviceSocketQOSLevel
{
  return -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", CFSTR("MRExternalDeviceSocketsQOSLevel"));
}

- (double)externalDeviceTimeoutDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("kMRSettingsExternalDeviceTimeoutSecondsDurationDefaultsKey"), 7.0);
}

- (double)externalDeviceNowPlayingInfoCoalesceDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("kMRSettingsExternalDeviceNowPlayingInfoCoalesceDurationDefaultsKey"), 0.3);
}

- (double)externalDeviceNowPlayingInfoArtworkCoalesceDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("kMRSettingsExternalDeviceNowPlayingInfoArtworkCoalesceDurationDefaultsKey"), 0.5);
}

- (double)externalDeviceDisconnectWaitDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("kMRSettingsExternalDeviceDisconnectWaitDurationDefaultsKey"), 7.0);
}

- (double)externalDeviceDisconnectSleepDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("kMRSettingsExternalDeviceDisconnectSleepDurationDefaultsKey"), 2.0);
}

- (double)externalDeviceSleepAssertionOnClientConnectDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("kMRSettingsExternalDeviceSleepAssertionOnClientConnectDurationDefaultsKey"), 10.0);
}

- (double)bluetoothDeviceResumeDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("kMRSettingsBluetoothDeviceResumeDurationDefaultsKey"), 10.0);
}

- (double)broadcastCommandWaitDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("kMRSettingsBroadcastCommandWaitDurationDefaultsKey"), 10.0);
}

- (double)airPlayOutputContextInitTimeoutDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("AirPlayContextInitTimeoutDuration_v2"), 30.0);
}

- (double)wakingPlayerPathAssertionDuration
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MRUserSettings_wakingPlayerPathAssertionDuration__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (wakingPlayerPathAssertionDuration___once != -1)
    dispatch_once(&wakingPlayerPathAssertionDuration___once, block);
  return *(double *)&wakingPlayerPathAssertionDuration___duration;
}

void __51__MRUserSettings_wakingPlayerPathAssertionDuration__block_invoke(uint64_t a1)
{
  wakingPlayerPathAssertionDuration___duration = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("wakingPlayerPathAssertionDuration"), 3.0);
}

- (double)nowPlayingUIWakingPlayerEventAssertionDuration
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MRUserSettings_nowPlayingUIWakingPlayerEventAssertionDuration__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (nowPlayingUIWakingPlayerEventAssertionDuration___once != -1)
    dispatch_once(&nowPlayingUIWakingPlayerEventAssertionDuration___once, block);
  return *(double *)&nowPlayingUIWakingPlayerEventAssertionDuration___duration;
}

void __64__MRUserSettings_nowPlayingUIWakingPlayerEventAssertionDuration__block_invoke(uint64_t a1)
{
  nowPlayingUIWakingPlayerEventAssertionDuration___duration = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("nowPlayingUIWakingPlayerEventAssertionDuration"), 5.0);
}

uint64_t __57__MRUserSettings_checkXPCConnectionStatusDefaultInterval__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _integerValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("checkXPCConnectionStatusDefaultInterval"), 100);
  checkXPCConnectionStatusDefaultInterval___interval = result;
  return result;
}

- (uint64_t)_integerValueForKey:(uint64_t)a3 usingDefaultValue:
{
  id v5;
  void *v6;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      a3 = objc_msgSend(*(id *)(a1 + 8), "integerForKey:", v5);
  }
  else
  {
    a3 = 0;
  }

  return a3;
}

- (double)nowPlayingObserverCoalesceInterval
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MRUserSettings_nowPlayingObserverCoalesceInterval__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (nowPlayingObserverCoalesceInterval___once != -1)
    dispatch_once(&nowPlayingObserverCoalesceInterval___once, block);
  return *(double *)&nowPlayingObserverCoalesceInterval___interval;
}

void __52__MRUserSettings_nowPlayingObserverCoalesceInterval__block_invoke(uint64_t a1)
{
  nowPlayingObserverCoalesceInterval___interval = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("nowPlayingObserverCoalesceInterval"), 0.7);
}

- (double)nowPlayingAppStackFailedPlayInterval
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MRUserSettings_nowPlayingAppStackFailedPlayInterval__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (nowPlayingAppStackFailedPlayInterval___once != -1)
    dispatch_once(&nowPlayingAppStackFailedPlayInterval___once, block);
  return *(double *)&nowPlayingAppStackFailedPlayInterval___interval;
}

void __54__MRUserSettings_nowPlayingAppStackFailedPlayInterval__block_invoke(uint64_t a1)
{
  if (_os_feature_enabled_impl())
    nowPlayingAppStackFailedPlayInterval___interval = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("nowPlayingAppStackFailedPlayInterval"), 5.0);
}

- (BOOL)nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__MRUserSettings_nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands___once != -1)
    dispatch_once(&nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands___once, block);
  return nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands_value;
}

uint64_t __80__MRUserSettings_nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands"), 0);
  nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands_value = result;
  return result;
}

- (double)externalDeviceArtificalConnectionDelay
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MRUserSettings_externalDeviceArtificalConnectionDelay__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (externalDeviceArtificalConnectionDelay___once != -1)
    dispatch_once(&externalDeviceArtificalConnectionDelay___once, block);
  return *(double *)&externalDeviceArtificalConnectionDelay___interval;
}

void __56__MRUserSettings_externalDeviceArtificalConnectionDelay__block_invoke(uint64_t a1)
{
  externalDeviceArtificalConnectionDelay___interval = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("externalDeviceArtificalConnectionDelay"), 0.0);
}

- (BOOL)useExternalDeviceSystemPairing
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("kMRSettingsExternalDeviceSystemPairingDefaultsKey"), 1);
}

- (int64_t)maxTransactionMemorySize
{
  return -[MRUserSettings _integerValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("kMRSettingsMaxTransactionSizeDefaultsKey"), 2000000);
}

- (double)transactionWaitDurationOnOutOfMemory
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("kMRSettingsWaitDurationOnOutOfMemoryDefaultsKey"), 0.01);
}

- (double)transactionWaitDurationOnXpcSend
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("kMRSettingsWaitDurationOnXpcSendDefaultsKey"), 0.0);
}

- (double)transactionWaitDurationOnNetworkSend
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("kMRSettingsWaitDurationOnNetworkSendDefaultsKey"), 0.001);
}

- (BOOL)useSystemAudioContextForAirPlayTransport
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("UseSystemAudioContextForAirPlayTransport"), 0);
}

- (BOOL)useGenericTransportForHostedEndpoints
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("UseGenericTransportForHostedEndpoints"), 0);
}

- (NSArray)connectedClientAuditTokens
{
  void *v2;
  void *v3;

  -[NSUserDefaults arrayForKey:](self->_userDefaults, "arrayForKey:", CFSTR("ConnectedClientAuditTokens"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (double)queuedCommandsTimeoutInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("queuedCommandsTimeoutInterval"), 30.0);
}

- (double)nowPlayingApplicationTimeout
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MRUserSettings_nowPlayingApplicationTimeout__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (nowPlayingApplicationTimeout_onceToken != -1)
    dispatch_once(&nowPlayingApplicationTimeout_onceToken, block);
  return *(double *)&nowPlayingApplicationTimeout_timeout;
}

void __46__MRUserSettings_nowPlayingApplicationTimeout__block_invoke(uint64_t a1)
{
  nowPlayingApplicationTimeout_timeout = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("NowPlayingApplicationTimeout"), 480.0);
}

- (BOOL)supportSystemEndpoints
{
  unsigned int v2;

  v2 = MGGetSInt32Answer();
  return (v2 < 8) & (0xCEu >> v2);
}

- (BOOL)supportElectedPlayer
{
  return -[MRUserSettings takelockScreenAssertion](self, "takelockScreenAssertion")
      || -[MRUserSettings supportSystemEndpoints](self, "supportSystemEndpoints");
}

- (BOOL)connectToEndpointWhenBeginsPlayback
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("ConnectToEndpointWhenBeginsPlayback"), 1);
}

- (BOOL)notifyDevicesInHomeThatPlaybackStarted
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MRUserSettings_notifyDevicesInHomeThatPlaybackStarted__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (notifyDevicesInHomeThatPlaybackStarted_onceToken != -1)
    dispatch_once(&notifyDevicesInHomeThatPlaybackStarted_onceToken, block);
  return notifyDevicesInHomeThatPlaybackStarted___value;
}

uint64_t __56__MRUserSettings_notifyDevicesInHomeThatPlaybackStarted__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("NotifyDevicesInHomeThatPlaybackStarted"), 0);
  notifyDevicesInHomeThatPlaybackStarted___value = result;
  return result;
}

- (BOOL)connectToAllEndpointsWhenAnyEndpointBeginsPlayback
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("ConnectToAllEndpointsWhenAnyEndpointBeginsPlayback"), 0);
}

- (BOOL)connectToUserSelectedEndpoint
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("ConnectToUserSelectedEndpoint"), 1);
}

- (double)discoverEndpointTimeoutInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("DiscoverEndpointTimeoutInterval"), 7.0);
}

- (double)deviceRecentlyUsedInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("DeviceRecentlyUsedInterval"), 14400.0);
}

- (double)mediaRecentlyPlayedInterval
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MRUserSettings_mediaRecentlyPlayedInterval__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (mediaRecentlyPlayedInterval_onceToken != -1)
    dispatch_once(&mediaRecentlyPlayedInterval_onceToken, block);
  return *(double *)&mediaRecentlyPlayedInterval___value;
}

void __45__MRUserSettings_mediaRecentlyPlayedInterval__block_invoke(uint64_t a1)
{
  mediaRecentlyPlayedInterval___value = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("MediaRecentlyPlayedInterval"), 480.0);
}

- (double)endpointRecentlyUserSelectedInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("EndpointRecentlyUserSelectedInterval"), 480.0);
}

- (double)remoteDeviceIdleDisconnectionInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("RemoteDeviceIdleDisconnectionInterval"), 480.0);
}

- (BOOL)remoteDeviceIdleDisconnection
{
  return _os_feature_enabled_impl();
}

- (double)launchApplicationTimeoutInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("LaunchApplicationTimeoutInterval"), 7.0);
}

- (NSArray)jsonClientUIDs
{
  void *v2;
  void *v3;

  -[NSUserDefaults arrayForKey:](self->_userDefaults, "arrayForKey:", CFSTR("JSONClientUIDs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)routePickerAirPlayAllowList
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MRUserSettings_routePickerAirPlayAllowList__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (routePickerAirPlayAllowList_onceToken != -1)
    dispatch_once(&routePickerAirPlayAllowList_onceToken, block);
  return self->_routePickerAirPlayAllowList;
}

uint64_t __45__MRUserSettings_routePickerAirPlayAllowList__block_invoke(uint64_t a1)
{
  -[MRUserSettings _loadRoutePickerAirPlayAllowList](*(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("routepicker-airplay-allowlist"), 0, MRUserSettingsRoutePickerAirPlayAllowListContext);
}

- (void)_loadRoutePickerAirPlayAllowList
{
  void *v2;
  char isKindOfClass;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "valueForKey:", CFSTR("routepicker-airplay-allowlist"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v2;
    if ((isKindOfClass & 1) == 0)
    {
      if (v2)
      {
        v7[0] = v2;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v5;

LABEL_7:
        return;
      }
      v4 = 0;
    }
    objc_storeStrong((id *)(a1 + 16), v4);
    goto LABEL_7;
  }
}

- (NSArray)routePickerAirPlayDenyList
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MRUserSettings_routePickerAirPlayDenyList__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (routePickerAirPlayDenyList_onceToken != -1)
    dispatch_once(&routePickerAirPlayDenyList_onceToken, block);
  return self->_routePickerAirPlayDenyList;
}

uint64_t __44__MRUserSettings_routePickerAirPlayDenyList__block_invoke(uint64_t a1)
{
  -[MRUserSettings _loadRoutePickerAirPlayDenyList](*(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("routepicker-airplay-denylist"), 0, MRUserSettingsRoutePickerAirPlayDenyListContext);
}

- (void)_loadRoutePickerAirPlayDenyList
{
  void *v2;
  char isKindOfClass;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "valueForKey:", CFSTR("routepicker-airplay-denylist"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v2;
    if ((isKindOfClass & 1) == 0)
    {
      if (v2)
      {
        v7[0] = v2;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v5;

LABEL_7:
        return;
      }
      v4 = 0;
    }
    objc_storeStrong((id *)(a1 + 24), v4);
    goto LABEL_7;
  }
}

- (void)_loadNearbyDeviceIdentifiers
{
  void *v2;
  char isKindOfClass;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "valueForKey:", CFSTR("NearbyDeviceIdentifiers"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v2;
    if ((isKindOfClass & 1) == 0)
    {
      if (v2)
      {
        v7[0] = v2;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v5;

LABEL_7:
        return;
      }
      v4 = 0;
    }
    objc_storeStrong((id *)(a1 + 32), v4);
    goto LABEL_7;
  }
}

- (BOOL)supportProximityMigration
{
  if (-[MRUserSettings supportProximityMigrationV2](self, "supportProximityMigrationV2")
    || MGGetSInt32Answer() - 1 > 2)
  {
    return 0;
  }
  else
  {
    return _os_feature_enabled_impl();
  }
}

- (NSArray)destinationResolverReconRetryIntervals
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MRUserSettings_destinationResolverReconRetryIntervals__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (destinationResolverReconRetryIntervals_onceToken != -1)
    dispatch_once(&destinationResolverReconRetryIntervals_onceToken, block);
  return (NSArray *)(id)destinationResolverReconRetryIntervals_intervals;
}

void __56__MRUserSettings_destinationResolverReconRetryIntervals__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "arrayForKey:", CFSTR("destinationResolverReconRetryIntervals"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)destinationResolverReconRetryIntervals_intervals;
  destinationResolverReconRetryIntervals_intervals = v1;

  if (!objc_msgSend((id)destinationResolverReconRetryIntervals_intervals, "count"))
  {
    v3 = (void *)destinationResolverReconRetryIntervals_intervals;
    destinationResolverReconRetryIntervals_intervals = (uint64_t)&unk_1E3143BF0;

  }
}

- (int)nowPlayingControllerVersion
{
  return -[MRUserSettings _integerValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("nowPlayingController"), 2);
}

- (BOOL)supportMigration
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportNewMigrationBehaviorForProximity
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportNewMigrationArchitecture
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportProximityMigrationV2
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportExpanseMigration
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportOutOfProcessMigration
{
  return _os_feature_enabled_impl();
}

- (BOOL)forceFadeForEveryHandoff
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportLastPlayingDevice
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("SupportLastPlayingDevice"), 0);
}

- (BOOL)supportRapportRemoteControlTransport
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportRapportRemoteControlConnection
{
  return _os_feature_enabled_impl();
}

- (BOOL)sendLastPlayingDeviceToHome
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("SendLastPlayingDeviceToHome"), 0);
}

- (double)lastPlayingDeviceThresholdInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("LastPlayingDeviceThresholdInterval"), 172800.0);
}

- (double)sendPlaybackSessionUpdateToCompanionCoalesceInterval
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MRUserSettings_sendPlaybackSessionUpdateToCompanionCoalesceInterval__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (sendPlaybackSessionUpdateToCompanionCoalesceInterval_onceToken != -1)
    dispatch_once(&sendPlaybackSessionUpdateToCompanionCoalesceInterval_onceToken, block);
  return *(double *)&sendPlaybackSessionUpdateToCompanionCoalesceInterval___value;
}

void __70__MRUserSettings_sendPlaybackSessionUpdateToCompanionCoalesceInterval__block_invoke(uint64_t a1)
{
  sendPlaybackSessionUpdateToCompanionCoalesceInterval___value = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("SendPlaybackSessionUpdateToCompanionCoalesceInterval"), 1.0);
}

- (BOOL)forceEnableCECVolume
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MRUserSettings_forceEnableCECVolume__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (forceEnableCECVolume_onceToken != -1)
    dispatch_once(&forceEnableCECVolume_onceToken, block);
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("ForceEnableCECVolume"), 0);
}

uint64_t __38__MRUserSettings_forceEnableCECVolume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("ForceEnableCECVolume"), 0, MRUserSettingsForceEnableCECContext);
}

- (BOOL)connectToAllEndpointsWhenInProximityToAnyDevice
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("ConnectToAllEndpointsWhenInProximityToAnyDevice"), 0);
}

- (BOOL)computeDevicePlaybackSessionID
{
  return 0;
}

- (id)defaultSupportedCommandsDataForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MRUserSettings defaultSupportedCommandsData](self, "defaultSupportedCommandsData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)activeSystemEndpointStartupDelayToAllowAllPreviousClientsTimeToInitializeInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("ActiveSystemEndpointStartupDelayInterval"), 3.0);
}

- (unsigned)localPlaybackState
{
  return -[MRUserSettings _integerValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("LocalPlaybackState"), 0);
}

- (void)setLocalPlaybackState:(unsigned int)a3
{
  -[NSUserDefaults setInteger:forKey:](self->_userDefaults, "setInteger:forKey:", a3, CFSTR("LocalPlaybackState"));
}

- (id)localLastPlayingDate
{
  return -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("LastPlayingDate"));
}

- (void)setLocalLastPlayingDate:(id)a3
{
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", a3, CFSTR("LastPlayingDate"));
}

- (NSString)lastBootUUID
{
  return (NSString *)-[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("LastBootUUID"));
}

- (void)setLastBootUUID:(id)a3
{
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", a3, CFSTR("LastBootUUID"));
}

- (BOOL)supportNanoLinkAgent
{
  return _os_feature_enabled_impl();
}

- (BOOL)discoverCompanionDevices
{
  return 0;
}

- (BOOL)useAPSyncAPI
{
  return 0;
}

- (BOOL)isMultiplayerAware
{
  void *v2;
  char v3;

  +[MRSharedSettings currentSettings](MRSharedSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiplayerAware");

  return v3;
}

- (BOOL)removeLocalDevice
{
  void *v2;
  char v3;

  +[MRSharedSettings currentSettings](MRSharedSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportNowPlayingSessionDataSource") ^ 1;

  return v3;
}

- (BOOL)showUncommitedDevices
{
  return !-[MRUserSettings removeLocalDevice](self, "removeLocalDevice");
}

- (BOOL)needsMXApplications
{
  if (-[MRUserSettings supportNowPlayingPIP](self, "supportNowPlayingPIP"))
    return 1;
  if (self)
    return MSVDeviceIsAudioAccessory() ^ 1;
  return 0;
}

- (BOOL)supportCoordinatedVolume
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportIDSDiscovery
{
  return _os_feature_enabled_impl();
}

- (BOOL)removeLocalDeviceOnMultiplayerReceiverSession
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportPTOTRefactorPart1
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportPTOTRefactorPart2
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportLargeHomeAudioOptimization
{
  return _os_feature_enabled_impl();
}

- (BOOL)prewarmPodcasts
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("prewarmPodcasts"), 1);
}

- (BOOL)supportRouteRecommendations
{
  return self != 0;
}

- (BOOL)enableRouteRecommendations
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("EnableRoutePrediction"), CFSTR("com.apple.coremedia"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (BOOL)addDebugBadgeToRecommendedRoutes
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("CorianderTopOfListBadge"), 0);
}

- (BOOL)showBluePill
{
  int v3;

  v3 = -[MRUserSettings supportRouteRecommendations](self, "supportRouteRecommendations");
  if (v3)
    LOBYTE(v3) = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("ShowBluePill"), 1);
  return v3;
}

- (BOOL)enableQueueHandOffForRouteRecommendations
{
  int v3;

  v3 = -[MRUserSettings supportRouteRecommendations](self, "supportRouteRecommendations");
  if (v3)
    LOBYTE(v3) = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("CorianderQHO"), 0);
  return v3;
}

- (BOOL)suppressScreenMirroringErrors
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("SuppressScreenMirroringErrors"), 0);
}

- (BOOL)supportLiveActivityBanner
{
  return _os_feature_enabled_impl();
}

- (BOOL)forceEnableUIAssertions
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("ForceEnableUIAssertions"), 0);
}

- (double)oneTapSuggestionInactiveTimeout
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("OneTapSuggestionTimeout"), 5.0);
}

- (double)autoRouteInactiveTimeout
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("AutoRouteMementoTimeout"), 5.0);
}

- (BOOL)preferRoutesMatchingMediaType
{
  return _os_feature_enabled_impl();
}

- (BOOL)showRouteRecommendationsOutsideApps
{
  return _os_feature_enabled_impl();
}

- (BOOL)undoUnusedAutoRoutes
{
  return _os_feature_enabled_impl();
}

- (double)undoUnusedAutoRouteTimerDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("UndoAutoRouteTimerDuration"), 15.0);
}

- (BOOL)useDynamicEligibilityForRouteRecommendations
{
  return _os_feature_enabled_impl();
}

- (BOOL)enableDeltaRouteRecommendations
{
  return _os_feature_enabled_impl();
}

- (BOOL)sourceRecommendationsPlattersFromIR
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportManyRecommendationsPlatters
{
  return _os_feature_enabled_impl();
}

- (NSString)nearbyDeviceIdentifiersDidChangeNotification
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MRUserSettings_nearbyDeviceIdentifiersDidChangeNotification__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (nearbyDeviceIdentifiersDidChangeNotification_onceToken != -1)
    dispatch_once(&nearbyDeviceIdentifiersDidChangeNotification_onceToken, block);
  return (NSString *)CFSTR("MRUserSettingsNearbyDeviceIdentifiersDidChangeNotification");
}

uint64_t __62__MRUserSettings_nearbyDeviceIdentifiersDidChangeNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("NearbyDeviceIdentifiers"), 0, MRUserSettingsNearbyDeviceIdentifiersContext);
}

- (NSArray)nearbyDeviceIdentifiers
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MRUserSettings_nearbyDeviceIdentifiers__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (nearbyDeviceIdentifiers_onceToken != -1)
    dispatch_once(&nearbyDeviceIdentifiers_onceToken, block);
  return self->_nearbyDeviceIdentifiers;
}

void __41__MRUserSettings_nearbyDeviceIdentifiers__block_invoke(uint64_t a1)
{
  -[MRUserSettings _loadNearbyDeviceIdentifiers](*(_QWORD *)(a1 + 32));
}

- (BOOL)supportOutputContextPrewarming
{
  void *v2;
  char v3;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "supportMultiplayerHost"))
    v3 = _os_feature_enabled_impl();
  else
    v3 = 0;

  return v3;
}

- (BOOL)supportAirplayStereoPairPersistentConnections
{
  void *v2;
  char v3;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "supportMultiplayerHost"))
    v3 = _os_feature_enabled_impl();
  else
    v3 = 0;

  return v3;
}

- (unint64_t)maxStreamCapacity
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MRUserSettings_maxStreamCapacity__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (maxStreamCapacity_onceToken != -1)
    dispatch_once(&maxStreamCapacity_onceToken, block);
  return maxStreamCapacity_max;
}

void __35__MRUserSettings_maxStreamCapacity__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v4 = (id)MGCopyAnswer();
  v2 = *(_QWORD *)(a1 + 32);
  if (objc_msgSend(v4, "containsString:", CFSTR("AudioAccessory1")))
    v3 = 2;
  else
    v3 = 3;
  maxStreamCapacity_max = -[MRUserSettings _integerValueForKey:usingDefaultValue:](v2, CFSTR("MaxStreamCapacity"), v3);

}

- (BOOL)reserveSlotForLocal
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("ReserveSlotForLocal"), 0);
}

uint64_t __42__MRUserSettings_forceDeviceInfoDiscovery__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("ForceDeviceInfoDiscovery"), 0);
  forceDeviceInfoDiscovery___value = result;
  return result;
}

- (float)proximitySortingNearbyRadius
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MRUserSettings_proximitySortingNearbyRadius__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (proximitySortingNearbyRadius___token != -1)
    dispatch_once(&proximitySortingNearbyRadius___token, block);
  return *(float *)&proximitySortingNearbyRadius___proximitySortingNearbyRadius;
}

float __46__MRUserSettings_proximitySortingNearbyRadius__block_invoke(uint64_t a1)
{
  float result;

  result = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("ProximitySortingNearbyRadius"), 4.0);
  proximitySortingNearbyRadius___proximitySortingNearbyRadius = LODWORD(result);
  return result;
}

- (BOOL)shouldConnectToLocalEndpoint
{
  uint64_t IsAudioAccessory;

  IsAudioAccessory = MSVDeviceIsAudioAccessory();
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("ShouldConnectToLocalEndpoint"), IsAudioAccessory);
}

- (NSArray)routeRecommendationEligibleApps
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[NSUserDefaults arrayForKey:](self->_userDefaults, "arrayForKey:", CFSTR("BannerApps"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (BOOL)useProactivePFSQSender
{
  return -[MRUserSettings sendProactivePFSQOnUserSelectedASEChange](self, "sendProactivePFSQOnUserSelectedASEChange")
      || -[MRUserSettings sendProactivePFSQOnProactiveASEChange](self, "sendProactivePFSQOnProactiveASEChange")
      || -[MRUserSettings sendProactivePFSQAfterBoot](self, "sendProactivePFSQAfterBoot");
}

- (BOOL)sendProactivePFSQOnUserSelectedASEChange
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("SendPPFSQOnASEChange"), 1);
}

- (BOOL)sendProactivePFSQOnProactiveASEChange
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("SendPPFSQOnProactiveASEChange"), 0);
}

- (BOOL)sendProactivePFSQAfterBoot
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("SendPPFSQAfterBoot"), 1);
}

- (BOOL)sendProactivePFSQOnSiriActivation
{
  uint64_t IsAudioAccessory;

  IsAudioAccessory = MSVDeviceIsAudioAccessory();
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("sendProactivePFSQOnSiriActivation"), IsAudioAccessory);
}

- (BOOL)supportLockscreenPlatterDisplayForPersonalDevice
{
  return _os_feature_enabled_impl();
}

- (double)personalDeviceLockScreenTimeout
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("PersonalDevicesForLockScreenDisplay"), 480.0);
}

- (NSDictionary)personalDeviceState
{
  return (NSDictionary *)-[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("PersonalDeviceState"));
}

- (void)setPersonalDeviceState:(id)a3
{
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", a3, CFSTR("PersonalDeviceState"));
}

- (unint64_t)maximumNumberOfMediaSuggestions
{
  return -[MRUserSettings _integerValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("MaximumNumberOfMediaSuggestions"), 12);
}

- (BOOL)supportProactiveSuggestion
{
  return _os_feature_enabled_impl();
}

- (BOOL)visuallyIdentifyProactiveSuggestion
{
  return _os_feature_enabled_impl();
}

- (BOOL)internalUI
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MRUserSettings_internalUI__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (internalUI_onceToken != -1)
    dispatch_once(&internalUI_onceToken, block);
  return internalUI___internal;
}

uint64_t __28__MRUserSettings_internalUI__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("InternalUI"), 0);
  internalUI___internal = result;
  return result;
}

- (BOOL)allowAllClientUIConnections
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("AllowAllClientUIConnections"), 0);
}

- (BOOL)placeholderGroupSessionIdentity
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("PlaceholderGroupSessionIdentity"), 0);
}

- (BOOL)groupSessionHUD
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionHUD"), 0);
}

- (BOOL)alwaysShowGroupSessionHUD
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("AlwaysShowGroupSessionHUD"), 0);
}

- (BOOL)groupSessionNearbyLockscreen
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionNearbyLockscreen"), 1);
}

- (BOOL)startGroupSessionsForAllRoutes
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("StartGroupSessionsForAllRoutes"), 0);
}

- (BOOL)startGroupSessionsForAllRouteSubtypes
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("StartGroupSessionsForAllRouteSubtypes"), 0);
}

- (BOOL)startGroupSessionWithBasicIdentity
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("StartGroupSessionWithBasicIdentity"), 0);
}

- (BOOL)supportGroupSessionLowPowerMode
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("SupportGroupSessionLowPowerMode"), 1);
}

- (double)groupSessionEndAfterPauseInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionEndAfterPauseInterval"), 3600.0);
}

- (double)groupSessionLeaderDiscoveryInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionLeaderDiscoveryInterval"), 15.0);
}

- (double)groupSessionNearbyGroupJoinTimeout
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionNearbyGroupJoinTimeout"), 30.0);
}

- (double)groupSessionNearbyGroupCreateTimeout
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionNearbyGroupCreateTimeout"), 60.0);
}

- (double)groupSessionNearbyInvitationCreateTimeout
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionNearbyInvitationCreateTimeout"), 60.0);
}

- (double)groupSessionEndpointDiscoveryInterval
{
  double v3;
  double v4;
  double v5;

  -[MRUserSettings groupSessionLeaderDiscoveryInterval](self, "groupSessionLeaderDiscoveryInterval");
  v4 = v3;
  -[MRUserSettings discoverEndpointTimeoutInterval](self, "discoverEndpointTimeoutInterval");
  return v4 + v5;
}

- (BOOL)groupSessionNearbyContactDiscoveryEnabled
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("MRUserSettingsGroupSessionNearbyContactDiscoveryEnabled"), 1);
}

- (BOOL)groupSessionContactAutoApprovalEnabled
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("MRUserSettingsGroupSessionContactAutoApprovalEnabled"), 0);
}

- (BOOL)supportGroupSessionParticipantNotifications
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("SupportGroupSessionParticipantNotifications"), 0);
}

- (void)setGroupSessionNearbyContactDiscoveryEnabled:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", a3, CFSTR("MRUserSettingsGroupSessionNearbyContactDiscoveryEnabled"));
}

- (void)setGroupSessionContactAutoApprovalEnabled:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", a3, CFSTR("MRUserSettingsGroupSessionContactAutoApprovalEnabled"));
}

- (BOOL)supportGroupSessionOfframp
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionOfframp"), 1);
}

- (double)groupSessionStartRequestAssertionDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionStartRequestAssertionDuration"), 480.0);
}

- (NSString)recentGroupSessionParticipantsPepper
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MRUserSettings_recentGroupSessionParticipantsPepper__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (recentGroupSessionParticipantsPepper_onceToken != -1)
    dispatch_once(&recentGroupSessionParticipantsPepper_onceToken, block);
  return (NSString *)(id)recentGroupSessionParticipantsPepper_pepper;
}

void __54__MRUserSettings_recentGroupSessionParticipantsPepper__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stringForKey:", CFSTR("RecentGroupSessionParticipantsPepper"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)recentGroupSessionParticipantsPepper_pepper;
  recentGroupSessionParticipantsPepper_pepper = v2;

  if (!recentGroupSessionParticipantsPepper_pepper)
  {
    MSVNanoIDCreateTaggedPointer();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)recentGroupSessionParticipantsPepper_pepper;
    recentGroupSessionParticipantsPepper_pepper = v4;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", recentGroupSessionParticipantsPepper_pepper, CFSTR("RecentGroupSessionParticipantsPepper"));
  }
}

- (BOOL)groupSessionSynchronizePendingParticipants
{
  return 0;
}

- (BOOL)supportGroupSessionAutoApproval
{
  return _os_feature_enabled_impl();
}

- (BOOL)groupSessionAutoApproveHomeParticipants
{
  return 0;
}

- (BOOL)groupSessionGenerateSharedSecret
{
  return 0;
}

- (BOOL)groupSessionListenForProxyJoinRequests
{
  void *v2;
  char v3;

  +[MRSharedSettings currentSettings](MRSharedSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportGroupSessionHome");

  return v3;
}

- (BOOL)groupSessionBoopAdvertisementEnabled
{
  void *v3;
  int v4;
  _QWORD block[5];

  +[MRSharedSettings currentSettings](MRSharedSettings, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportGroupSessionHomePodBoop");

  if (!v4 || !MSVDeviceIsAudioAccessory())
    return 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MRUserSettings_groupSessionBoopAdvertisementEnabled__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (groupSessionBoopAdvertisementEnabled_onceToken != -1)
    dispatch_once(&groupSessionBoopAdvertisementEnabled_onceToken, block);
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionBoopEnabled"), 1);
}

uint64_t __54__MRUserSettings_groupSessionBoopAdvertisementEnabled__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("GroupSessionBoopEnabled"), 0, MRUserSettingsGroupSessionBoopContext);
}

- (BOOL)groupSessionRotateAfterLastGuest
{
  int IsAudioAccessory;

  IsAudioAccessory = MSVDeviceIsAudioAccessory();
  if (IsAudioAccessory)
    LOBYTE(IsAudioAccessory) = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionRotateAfterLastGuest"), 0);
  return IsAudioAccessory;
}

- (BOOL)groupSessionASEAssertionEnabled
{
  int IsAudioAccessory;

  IsAudioAccessory = MSVDeviceIsAudioAccessory();
  if (IsAudioAccessory)
    LOBYTE(IsAudioAccessory) = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("GroupSessionASEAssertionEnabled"), 0);
  return IsAudioAccessory;
}

+ (NSString)groupSessionBoopAdvertisementEnabledDidChangeNotification
{
  return (NSString *)CFSTR("MRUserSettingsGroupSessionBoopEnabledDidChangeNotification");
}

- (BOOL)prefersExpandedLockScreenPlatter
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("MRUserSettingsPrefersExpandedLockScreenPlatter"), 1);
}

- (void)setPrefersExpandedLockScreenPlatter:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", a3, CFSTR("MRUserSettingsPrefersExpandedLockScreenPlatter"));
}

- (double)quickControlsInactiveTimeout
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MRUserSettings_quickControlsInactiveTimeout__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  if (quickControlsInactiveTimeout___once != -1)
    dispatch_once(&quickControlsInactiveTimeout___once, block);
  return *(double *)&quickControlsInactiveTimeout___timeout;
}

void __46__MRUserSettings_quickControlsInactiveTimeout__block_invoke(uint64_t a1)
{
  quickControlsInactiveTimeout___timeout = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(_QWORD *)(a1 + 32), CFSTR("QuickControlsInactiveTimeout"), 5.0);
}

- (double)lockScreenAPLTarget
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("LockScreenAPLTarget"), 0.03);
}

- (double)lockScreenAPLRatio
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("LockScreenAPLRatio"), 10.0);
}

- (BOOL)donateActiveRoutesToBiome
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("DonateActiveMediaRoutes"), 1);
}

- (int64_t)waveformNonVariableFramerate
{
  return -[MRUserSettings _integerValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("WaveformNonVariableFramerate"), 30);
}

- (double)flipBookUpdateInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, CFSTR("FlipBookUpdateInterval"), 20.0);
}

- (BOOL)supportCriticalSectionManagement
{
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)MRUserSettingsForceEnableCECContext == a6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("MRUserSettingsForceEnableCECVolumeDidChange");
LABEL_10:
    objc_msgSend(v13, "postNotificationName:object:", v15, self);

    goto LABEL_11;
  }
  if ((void *)MRUserSettingsGroupSessionNearbyDiscoveryContext == a6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("MRGroupSessionNearbyContactDiscoveryDidChangeNotification");
    goto LABEL_10;
  }
  if ((void *)MRUserSettingsRoutePickerAirPlayAllowListContext == a6)
  {
    -[MRUserSettings _loadRoutePickerAirPlayAllowList]((uint64_t)self);
    goto LABEL_11;
  }
  if ((void *)MRUserSettingsRoutePickerAirPlayDenyListContext == a6)
  {
    -[MRUserSettings _loadRoutePickerAirPlayDenyList]((uint64_t)self);
    goto LABEL_11;
  }
  if ((void *)MRUserSettingsNearbyDeviceIdentifiersContext == a6)
  {
    -[MRUserSettings _loadNearbyDeviceIdentifiers]((uint64_t)self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("MRUserSettingsNearbyDeviceIdentifiersDidChangeNotification");
    goto LABEL_10;
  }
  if ((void *)MRUserSettingsGroupSessionBoopContext == a6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("MRUserSettingsGroupSessionBoopEnabledDidChangeNotification");
    goto LABEL_10;
  }
  v16.receiver = self;
  v16.super_class = (Class)MRUserSettings;
  -[MRUserSettings observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_11:

}

- (BOOL)isExternalDevicePairingAllowed
{
  return self->_externalDevicePairingAllowed;
}

- (void)setExternalDevicePairingAllowed:(BOOL)a3
{
  self->_externalDevicePairingAllowed = a3;
}

- (void)setHomepodDemoMode:(BOOL)a3
{
  self->_homepodDemoMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDeviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_routePickerAirPlayDenyList, 0);
  objc_storeStrong((id *)&self->_routePickerAirPlayAllowList, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
