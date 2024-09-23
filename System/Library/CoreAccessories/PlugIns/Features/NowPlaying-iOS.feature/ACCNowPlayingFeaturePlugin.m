@implementation ACCNowPlayingFeaturePlugin

- (NSString)pluginName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACCNowPlayingFeaturePlugin pluginName](self, "pluginName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = obfuscatedPointer((uint64_t)self);
  v6 = -[ACCNowPlayingFeaturePlugin isRunning](self, "isRunning");
  v7 = "NO";
  if (v6)
    v7 = "YES";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> isRunning: %s"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)initPlugin
{
  dispatch_queue_t v3;
  void *v4;

  init_logging();
  -[ACCNowPlayingFeaturePlugin setIsRunning:](self, "setIsRunning:", 0);
  v3 = dispatch_queue_create("ACCNowPlayingFeaturePlugin", 0);
  -[ACCNowPlayingFeaturePlugin setQueue:](self, "setQueue:", v3);

  dispatch_get_global_queue(0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCNowPlayingFeaturePlugin setCompletionQueue:](self, "setCompletionQueue:", v4);

  -[ACCNowPlayingFeaturePlugin setCachedMediaItemAttributes:](self, "setCachedMediaItemAttributes:", 0);
  -[ACCNowPlayingFeaturePlugin setCachedMediaItemArtworkHash:](self, "setCachedMediaItemArtworkHash:", 0);
  -[ACCNowPlayingFeaturePlugin setCachedPlaybackAttributes:](self, "setCachedPlaybackAttributes:", 0);
  -[ACCNowPlayingFeaturePlugin setPbqUpdateAccessoryList:](self, "setPbqUpdateAccessoryList:", 0);
  -[ACCNowPlayingFeaturePlugin setMemUse:](self, "setMemUse:", 0);
  -[ACCNowPlayingFeaturePlugin setMaxPlaybackQueueInfoCount:](self, "setMaxPlaybackQueueInfoCount:", 0);
  -[ACCNowPlayingFeaturePlugin setPlaybackQueueInfoTimeoutMs:](self, "setPlaybackQueueInfoTimeoutMs:", 0);
  -[ACCNowPlayingFeaturePlugin setPlaybackQueueInfoSendPartialOnTimeout:](self, "setPlaybackQueueInfoSendPartialOnTimeout:", 0);
  -[ACCNowPlayingFeaturePlugin setMeasureMemoryUsage:](self, "setMeasureMemoryUsage:", 0);
}

- (void)startPlugin
{
  BOOL v3;
  id v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  id v9;
  dispatch_queue_t v10;
  ACCSettingsState *v11;
  ACCSettingsState *nowPlayingInfoDebounceTimerValue;
  NSObject *v13;
  OS_dispatch_source *v14;
  OS_dispatch_source *nowPlayingInfoDebounceTimer;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  ACCSettingsState *v19;
  ACCSettingsState *v20;
  ACCSettingsState *v21;
  ACCSettingsState *v22;
  void *v23;
  int v24;
  ACCMemUsageStat *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _QWORD v37[5];
  _QWORD handler[5];
  uint8_t buf[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A237000, v5, OS_LOG_TYPE_DEFAULT, "Starting Now Playing feature plugin...", buf, 2u);
  }

  v6 = dispatch_queue_create("com.apple.accessoryd.MediaPlayerMPQ", 0);
  -[ACCNowPlayingFeaturePlugin setMpMusicPlayerControllerQueue:](self, "setMpMusicPlayerControllerQueue:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCA60]), "initWithClientIdentifier:queue:", CFSTR("com.apple.accessoryd.mediaplayer"), self->_mpMusicPlayerControllerQueue);
  -[ACCNowPlayingFeaturePlugin setMpMusicPlayerControllerHandler:](self, "setMpMusicPlayerControllerHandler:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00BE0]), "initWithDelegate:", self);
  -[ACCNowPlayingFeaturePlugin setNowPlayingClient:](self, "setNowPlayingClient:", v8);

  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[ACCNowPlayingFeaturePlugin setPbqUpdateAccessoryList:](self, "setPbqUpdateAccessoryList:", v9);

  v10 = dispatch_queue_create("com.apple.iap2d.nowPlayPBQueueListQ", 0);
  -[ACCNowPlayingFeaturePlugin setNowPlayingInfoPBQueueListQ:](self, "setNowPlayingInfoPBQueueListQ:", v10);

  self->_nowPlayingInfoDebounceTimerRunningMask = 0;
  v11 = -[ACCSettingsState initWithKey:applicationID:notification:defaultValue:invalidValue:]([ACCSettingsState alloc], "initWithKey:applicationID:notification:defaultValue:invalidValue:", CFSTR("NowPlayingInfoDebounce"), CFSTR("com.apple.iapd"), CFSTR("com.apple.iapd.LoggingPreferencesChangedNotification"), 500, 0);
  nowPlayingInfoDebounceTimerValue = self->_nowPlayingInfoDebounceTimerValue;
  self->_nowPlayingInfoDebounceTimerValue = v11;

  -[ACCNowPlayingFeaturePlugin queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v13);
  nowPlayingInfoDebounceTimer = self->_nowPlayingInfoDebounceTimer;
  self->_nowPlayingInfoDebounceTimer = v14;

  -[ACCNowPlayingFeaturePlugin nowPlayingInfoDebounceTimer](self, "nowPlayingInfoDebounceTimer");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __41__ACCNowPlayingFeaturePlugin_startPlugin__block_invoke;
  handler[3] = &unk_24DC89A88;
  handler[4] = self;
  dispatch_source_set_event_handler(v16, handler);

  -[ACCNowPlayingFeaturePlugin _nowPlayingInfoDebounceTimerStop:](self, "_nowPlayingInfoDebounceTimerStop:", 127);
  -[ACCNowPlayingFeaturePlugin nowPlayingInfoDebounceTimer](self, "nowPlayingInfoDebounceTimer");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v18);

  v19 = -[ACCSettingsState initWithKey:applicationID:notification:defaultValue:invalidValue:]([ACCSettingsState alloc], "initWithKey:applicationID:notification:defaultValue:invalidValue:", CFSTR("MaxPlaybackQueueInfoCount"), CFSTR("com.apple.iapd"), CFSTR("com.apple.iapd.LoggingPreferencesChangedNotification"), 2000, 0);
  -[ACCNowPlayingFeaturePlugin setMaxPlaybackQueueInfoCount:](self, "setMaxPlaybackQueueInfoCount:", v19);

  v20 = -[ACCSettingsState initWithKey:applicationID:notification:defaultValue:invalidValue:]([ACCSettingsState alloc], "initWithKey:applicationID:notification:defaultValue:invalidValue:", CFSTR("PlaybackQueueInfoTimeoutMs"), CFSTR("com.apple.iapd"), CFSTR("com.apple.iapd.LoggingPreferencesChangedNotification"), 5000, 0);
  -[ACCNowPlayingFeaturePlugin setPlaybackQueueInfoTimeoutMs:](self, "setPlaybackQueueInfoTimeoutMs:", v20);

  v21 = -[ACCSettingsState initWithKey:applicationID:notification:defaultValue:invalidValue:]([ACCSettingsState alloc], "initWithKey:applicationID:notification:defaultValue:invalidValue:", CFSTR("PlaybackQueueInfoSendPartialOnTimeout"), CFSTR("com.apple.iapd"), CFSTR("com.apple.iapd.LoggingPreferencesChangedNotification"), 3, 0);
  -[ACCNowPlayingFeaturePlugin setPlaybackQueueInfoSendPartialOnTimeout:](self, "setPlaybackQueueInfoSendPartialOnTimeout:", v21);

  v22 = -[ACCSettingsState initWithKey:applicationID:notification:defaultValue:invalidValue:]([ACCSettingsState alloc], "initWithKey:applicationID:notification:defaultValue:invalidValue:", CFSTR("MeasureMemoryUsage"), CFSTR("com.apple.iapd"), CFSTR("com.apple.iapd.LoggingPreferencesChangedNotification"), 0, -1);
  -[ACCNowPlayingFeaturePlugin setMeasureMemoryUsage:](self, "setMeasureMemoryUsage:", v22);

  -[ACCNowPlayingFeaturePlugin setMemUse:](self, "setMemUse:", 0);
  -[ACCNowPlayingFeaturePlugin measureMemoryUsage](self, "measureMemoryUsage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "BOOLValue");

  if (v24)
  {
    v25 = -[ACCMemUsageStat initWithName:]([ACCMemUsageStat alloc], "initWithName:", CFSTR("ACCNowPlayingUpdate"));
    -[ACCNowPlayingFeaturePlugin setMemUse:](self, "setMemUse:", v25);

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v26 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v26 = MEMORY[0x24BDACB70];
    v27 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A237000, v26, OS_LOG_TYPE_INFO, "Adding notification observers...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObserver:selector:name:object:", self, sel_nowPlayingInfoDidChange_, *MEMORY[0x24BE657C0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObserver:selector:name:object:", self, sel_nowPlayingStateDidChange_, *MEMORY[0x24BE65760], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObserver:selector:name:object:", self, sel_nowPlayingStateDidChange_, *MEMORY[0x24BE65768], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObserver:selector:name:object:", self, sel_nowPlayingAppDidChange_, *MEMORY[0x24BE65758], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObserver:selector:name:object:", self, sel_nowPlayingInfoDidChange_, *MEMORY[0x24BE65A38], 0);

  MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObserver:selector:name:object:", self, sel_nowPlayingPlaybackQueueDidChange_, *MEMORY[0x24BDDC438], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObserver:selector:name:object:", self, sel_nowPlayingArtworkDidChange_, *MEMORY[0x24BE65A78], 0);

  -[ACCNowPlayingFeaturePlugin queue](self, "queue");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteRegisterForNowPlayingNotifications();

  -[ACCNowPlayingFeaturePlugin mpMusicPlayerControllerQueue](self, "mpMusicPlayerControllerQueue");
  v36 = objc_claimAutoreleasedReturnValue();
  v37[0] = v17;
  v37[1] = 3221225472;
  v37[2] = __41__ACCNowPlayingFeaturePlugin_startPlugin__block_invoke_130;
  v37[3] = &unk_24DC89A88;
  v37[4] = self;
  dispatch_sync(v36, v37);

  -[ACCNowPlayingFeaturePlugin setIsRunning:](self, "setIsRunning:", 1);
}

void __41__ACCNowPlayingFeaturePlugin_startPlugin__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  int v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 12);
  *(_DWORD *)(v2 + 12) = 0;
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v17 = 67109120;
    v18 = v3;
    _os_log_impl(&dword_21A237000, v6, OS_LOG_TYPE_INFO, "NowPlayingInfoUpdate debounce timer fired: mask = 0x%02x", (uint8_t *)&v17, 8u);
  }

  if ((v3 & 0x11) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v17 = 67109120;
      v18 = 17;
      _os_log_impl(&dword_21A237000, v7, OS_LOG_TYPE_INFO, "NowPlayingInfoUpdate debounce timer fired, handle mask 0x%02x, call _nowPlayingInfoDidChange", (uint8_t *)&v17, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_nowPlayingInfoDidChange");
  }
  if ((v3 & 0xA) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v17 = 67109120;
      v18 = 10;
      _os_log_impl(&dword_21A237000, v9, OS_LOG_TYPE_INFO, "NowPlayingInfoUpdate debounce timer fired, handle mask 0x%02x, call _nowPlayingStateDidChange", (uint8_t *)&v17, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_nowPlayingStateDidChange");
  }
  if ((v3 & 4) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v17 = 67109120;
      v18 = 4;
      _os_log_impl(&dword_21A237000, v11, OS_LOG_TYPE_INFO, "NowPlayingInfoUpdate debounce timer fired, handle mask 0x%02x, call _nowPlayingAppDidChange", (uint8_t *)&v17, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_nowPlayingAppDidChange");
    if ((v3 & 0x20) == 0)
    {
LABEL_33:
      if ((v3 & 0x40) == 0)
        return;
      goto LABEL_53;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_33;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v13 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v17 = 67109120;
    v18 = 32;
    _os_log_impl(&dword_21A237000, v13, OS_LOG_TYPE_INFO, "NowPlayingInfoUpdate debounce timer fired, handle mask 0x%02x, call _nowPlayingPlaybackQueueDidChange", (uint8_t *)&v17, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_nowPlayingPlaybackQueueDidChange");
  if ((v3 & 0x40) != 0)
  {
LABEL_53:
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = 67109120;
      v18 = 64;
      _os_log_impl(&dword_21A237000, v15, OS_LOG_TYPE_INFO, "NowPlayingInfoUpdate debounce timer fired, handle mask 0x%02x, call _nowPlayingArtworkDidChange", (uint8_t *)&v17, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_nowPlayingArtworkDidChange");
  }
}

void __41__ACCNowPlayingFeaturePlugin_startPlugin__block_invoke_130(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "mpMusicPlayerControllerHandler");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "beginGeneratingPlaybackNotifications");

}

- (void)stopPlugin
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A237000, v5, OS_LOG_TYPE_DEFAULT, "Stopping Now Playing feature plugin...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A237000, v6, OS_LOG_TYPE_INFO, "Removing all notification observers...", buf, 2u);
  }

  -[ACCNowPlayingFeaturePlugin mpMusicPlayerControllerQueue](self, "mpMusicPlayerControllerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__ACCNowPlayingFeaturePlugin_stopPlugin__block_invoke;
  block[3] = &unk_24DC89A88;
  block[4] = self;
  dispatch_sync(v8, block);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *MEMORY[0x24BDDC410];
    v12 = *MEMORY[0x24BDDC408];
    *(_DWORD *)buf = 134218240;
    v17 = v11;
    v18 = 2048;
    v19 = v12;
    _os_log_impl(&dword_21A237000, v9, OS_LOG_TYPE_DEFAULT, "Revert to Default MediaRemote NPQ Max Item Count: Reverse %ld, Forward %ld", buf, 0x16u);
  }

  MRMediaRemoteUnregisterForNowPlayingNotifications();
  MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:", self);

  -[ACCNowPlayingFeaturePlugin nowPlayingClient](self, "nowPlayingClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", 0);

  -[ACCNowPlayingFeaturePlugin setNowPlayingClient:](self, "setNowPlayingClient:", 0);
  -[ACCNowPlayingFeaturePlugin setPbqUpdateAccessoryList:](self, "setPbqUpdateAccessoryList:", 0);
  -[ACCNowPlayingFeaturePlugin setMpMusicPlayerControllerHandler:](self, "setMpMusicPlayerControllerHandler:", 0);
  -[ACCNowPlayingFeaturePlugin setMemUse:](self, "setMemUse:", 0);
  -[ACCNowPlayingFeaturePlugin setMaxPlaybackQueueInfoCount:](self, "setMaxPlaybackQueueInfoCount:", 0);
  -[ACCNowPlayingFeaturePlugin setPlaybackQueueInfoTimeoutMs:](self, "setPlaybackQueueInfoTimeoutMs:", 0);
  -[ACCNowPlayingFeaturePlugin setMeasureMemoryUsage:](self, "setMeasureMemoryUsage:", 0);
  -[ACCNowPlayingFeaturePlugin setIsRunning:](self, "setIsRunning:", 0);
}

void __40__ACCNowPlayingFeaturePlugin_stopPlugin__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "mpMusicPlayerControllerHandler");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endGeneratingPlaybackNotifications");

}

- (void)_nowPlayingInfoDidChange
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21A237000, v0, v1, "cachedPlaybackAttributes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_nowPlayingStateDidChange
{
  BOOL v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A237000, v5, OS_LOG_TYPE_INFO, "_nowPlayingStateDidChange: Gather and process info", v6, 2u);
  }

  -[ACCNowPlayingFeaturePlugin _nowPlayingInfoDidChange](self, "_nowPlayingInfoDidChange");
}

- (void)_nowPlayingAppDidChange
{
  BOOL v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A237000, v5, OS_LOG_TYPE_INFO, "_nowPlayingAppDidChange: Gather and process info", v6, 2u);
  }

  -[ACCNowPlayingFeaturePlugin _nowPlayingInfoDidChange](self, "_nowPlayingInfoDidChange");
}

- (void)_nowPlayingPlaybackQueueDidChange
{
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21A237000, v5, OS_LOG_TYPE_INFO, "_nowPlayingPlaybackQueueDidChange: Tell client playbackQueueListDidChange", v7, 2u);
  }

  -[ACCNowPlayingFeaturePlugin nowPlayingClient](self, "nowPlayingClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playbackQueueListDidChange");

}

- (void)_nowPlayingArtworkDidChange
{
  void *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "nowPlayingClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 67109120;
  v4[1] = objc_msgSend(v3, "shouldSendArtwork");
  _os_log_debug_impl(&dword_21A237000, a2, OS_LOG_TYPE_DEBUG, "#Artwork shouldSendArtwork: %d", (uint8_t *)v4, 8u);

  OUTLINED_FUNCTION_2();
}

- (void)nowPlayingInfoDidChange:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int64_t v8;
  int v9;
  id v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = -[ACCSettingsState intValue](self->_nowPlayingInfoDebounceTimerValue, "intValue");
    v9 = 138412546;
    v10 = v4;
    v11 = 2048;
    v12 = v8;
    _os_log_impl(&dword_21A237000, v7, OS_LOG_TYPE_INFO, "nowPlayingInfoDidChange: Notification received: %@, debounce=%ld", (uint8_t *)&v9, 0x16u);
  }

  if (-[ACCSettingsState intValue](self->_nowPlayingInfoDebounceTimerValue, "intValue") < 1)
    -[ACCNowPlayingFeaturePlugin _nowPlayingInfoDidChange](self, "_nowPlayingInfoDidChange");
  else
    -[ACCNowPlayingFeaturePlugin _nowPlayingInfoDebounceTimerKick:](self, "_nowPlayingInfoDebounceTimerKick:", 1);

}

- (void)nowPlayingStateDidChange:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int64_t v8;
  int v9;
  id v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = -[ACCSettingsState intValue](self->_nowPlayingInfoDebounceTimerValue, "intValue");
    v9 = 138412546;
    v10 = v4;
    v11 = 2048;
    v12 = v8;
    _os_log_impl(&dword_21A237000, v7, OS_LOG_TYPE_INFO, "nowPlayingStateDidChange: Notification received: %@, debounce=%ld", (uint8_t *)&v9, 0x16u);
  }

  if (-[ACCSettingsState intValue](self->_nowPlayingInfoDebounceTimerValue, "intValue") < 1)
    -[ACCNowPlayingFeaturePlugin _nowPlayingStateDidChange](self, "_nowPlayingStateDidChange");
  else
    -[ACCNowPlayingFeaturePlugin _nowPlayingInfoDebounceTimerKick:](self, "_nowPlayingInfoDebounceTimerKick:", 2);

}

- (void)nowPlayingAppDidChange:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int64_t v8;
  int v9;
  id v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = -[ACCSettingsState intValue](self->_nowPlayingInfoDebounceTimerValue, "intValue");
    v9 = 138412546;
    v10 = v4;
    v11 = 2048;
    v12 = v8;
    _os_log_impl(&dword_21A237000, v7, OS_LOG_TYPE_INFO, "nowPlayingAppDidChange: Notification received: %@, debounce=%ld", (uint8_t *)&v9, 0x16u);
  }

  if (-[ACCSettingsState intValue](self->_nowPlayingInfoDebounceTimerValue, "intValue") < 1)
    -[ACCNowPlayingFeaturePlugin _nowPlayingAppDidChange](self, "_nowPlayingAppDidChange");
  else
    -[ACCNowPlayingFeaturePlugin _nowPlayingInfoDebounceTimerKick:](self, "_nowPlayingInfoDebounceTimerKick:", 4);

}

- (void)nowPlayingPlaybackQueueDidChange:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int64_t v8;
  int v9;
  id v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = -[ACCSettingsState intValue](self->_nowPlayingInfoDebounceTimerValue, "intValue");
    v9 = 138412546;
    v10 = v4;
    v11 = 2048;
    v12 = v8;
    _os_log_impl(&dword_21A237000, v7, OS_LOG_TYPE_INFO, "nowPlayingPlaybackQueueDidChange: Notification received: %@, debounce=%ld", (uint8_t *)&v9, 0x16u);
  }

  if (-[ACCSettingsState intValue](self->_nowPlayingInfoDebounceTimerValue, "intValue") < 1)
    -[ACCNowPlayingFeaturePlugin _nowPlayingPlaybackQueueDidChange](self, "_nowPlayingPlaybackQueueDidChange");
  else
    -[ACCNowPlayingFeaturePlugin _nowPlayingInfoDebounceTimerKick:](self, "_nowPlayingInfoDebounceTimerKick:", 32);

}

- (void)nowPlayingArtworkDidChange:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int64_t v8;
  int v9;
  id v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = -[ACCSettingsState intValue](self->_nowPlayingInfoDebounceTimerValue, "intValue");
    v9 = 138412546;
    v10 = v4;
    v11 = 2048;
    v12 = v8;
    _os_log_impl(&dword_21A237000, v7, OS_LOG_TYPE_INFO, "nowPlayingArtworkDidChange: Notification received: %@, debounce=%ld", (uint8_t *)&v9, 0x16u);
  }

  if (-[ACCSettingsState intValue](self->_nowPlayingInfoDebounceTimerValue, "intValue") < 1)
    -[ACCNowPlayingFeaturePlugin _nowPlayingArtworkDidChange](self, "_nowPlayingArtworkDidChange");
  else
    -[ACCNowPlayingFeaturePlugin _nowPlayingInfoDebounceTimerKick:](self, "_nowPlayingInfoDebounceTimerKick:", 64);

}

- (unsigned)currentPlaybackStateMR
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  int v11;
  unsigned int v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v3 = dispatch_semaphore_create(0);
  -[ACCNowPlayingFeaturePlugin completionQueue](self, "completionQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();

  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v19 = 5000;
      _os_log_impl(&dword_21A237000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] currentPlaybackStateMR: timed out (%d ms) waiting for MR PlaybackState", buf, 8u);
    }

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *((_DWORD *)v15 + 6);
    *(_DWORD *)buf = 67109120;
    v19 = v11;
    _os_log_impl(&dword_21A237000, v9, OS_LOG_TYPE_DEFAULT, "currentPlaybackStateMR: %d", buf, 8u);
  }

  v12 = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  return v12;
}

intptr_t __52__ACCNowPlayingFeaturePlugin_currentPlaybackStateMR__block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)currentPlaybackAppBundleID
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  __CFString *v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = &stru_24DC89FD0;
  v3 = dispatch_semaphore_create(0);
  MRMediaRemoteGetLocalOrigin();
  -[ACCNowPlayingFeaturePlugin completionQueue](self, "completionQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  MRMediaRemoteGetNowPlayingClientForOrigin();

  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = 5000;
      _os_log_impl(&dword_21A237000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] currentPlaybackAppBundleID: timed out (%d ms) waiting for MR nowPlaying clientRef", buf, 8u);
    }

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v15[5];
    *(_DWORD *)buf = 138412290;
    v21 = v11;
    _os_log_impl(&dword_21A237000, v9, OS_LOG_TYPE_DEFAULT, "currentPlaybackAppBundleID: %@", buf, 0xCu);
  }

  v12 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v12;
}

intptr_t __56__ACCNowPlayingFeaturePlugin_currentPlaybackAppBundleID__block_invoke(uint64_t a1)
{
  const __CFString *BundleIdentifier;
  CFStringRef Copy;
  uint64_t v4;
  void *v5;

  BundleIdentifier = (const __CFString *)MRNowPlayingClientGetBundleIdentifier();
  if (BundleIdentifier)
  {
    Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], BundleIdentifier);
    if (Copy)
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = Copy;

    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)currentPlaybackAppName
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  __CFString *v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = &stru_24DC89FD0;
  v3 = dispatch_semaphore_create(0);
  MRMediaRemoteGetLocalOrigin();
  -[ACCNowPlayingFeaturePlugin completionQueue](self, "completionQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  MRMediaRemoteGetNowPlayingClientForOrigin();

  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = 5000;
      _os_log_impl(&dword_21A237000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] currentPlaybackAppName: timed out (%d ms) waiting for MR nowPlaying clientRef", buf, 8u);
    }

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v15[5];
    *(_DWORD *)buf = 138412290;
    v21 = v11;
    _os_log_impl(&dword_21A237000, v9, OS_LOG_TYPE_DEFAULT, "currentPlaybackAppName: %@", buf, 0xCu);
  }

  v12 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v12;
}

intptr_t __52__ACCNowPlayingFeaturePlugin_currentPlaybackAppName__block_invoke(uint64_t a1)
{
  const __CFString *DisplayName;
  CFStringRef Copy;
  uint64_t v4;
  void *v5;

  DisplayName = (const __CFString *)MRNowPlayingClientGetDisplayName();
  if (DisplayName)
  {
    Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], DisplayName);
    if (Copy)
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = Copy;

    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)currentMediaItemAttributes
{
  dispatch_semaphore_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v3 = dispatch_semaphore_create(0);
  MRMediaRemoteGetLocalOrigin();
  -[ACCNowPlayingFeaturePlugin completionQueue](self, "completionQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v6 = v3;
  v23 = v6;
  MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork();

  v7 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v31 = 5000;
      _os_log_impl(&dword_21A237000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] currentMediaItemAttributes: timed out (%d ms) waiting for MR nowPlayingInfo", buf, 8u);
    }

  }
  -[ACCNowPlayingFeaturePlugin completionQueue](self, "completionQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  MRMediaRemoteGetSupportedCommands();

  v12 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v31 = 5000;
      _os_log_impl(&dword_21A237000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] currentMediaItemAttributes: timed out (%d ms) waiting for MR supportedCommands", buf, 8u);
    }

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v15 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACCNowPlayingFeaturePlugin currentMediaItemAttributes].cold.3();

  -[ACCNowPlayingFeaturePlugin cachedMediaItemAttributes](self, "cachedMediaItemAttributes", v5, 3221225472, __56__ACCNowPlayingFeaturePlugin_currentMediaItemAttributes__block_invoke_138, &unk_24DC89B28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (v18)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v19 = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[ACCNowPlayingFeaturePlugin currentMediaItemAttributes].cold.1();

    -[ACCNowPlayingFeaturePlugin setCachedMediaItemAttributes:](self, "setCachedMediaItemAttributes:", v25[5]);
  }
  v21 = (void *)objc_msgSend((id)v25[5], "copy");

  _Block_object_dispose(&v24, 8);
  return v21;
}

void __56__ACCNowPlayingFeaturePlugin_currentMediaItemAttributes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *log;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  v8 = (_QWORD *)MEMORY[0x24BE65850];
  v9 = (_QWORD *)MEMORY[0x24BE657B0];
  v10 = (uint64_t *)MEMORY[0x24BE657D0];
  v11 = (_QWORD *)MEMORY[0x24BE65800];
  v12 = (_QWORD *)MEMORY[0x24BE65798];
  if (v7)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE65888]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE65770]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE65780]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE657E8]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE65878]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE65870]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE657C8]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE65860]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE65858]);
    log = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE657F8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE65798]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138415874;
    v36 = v34;
    v37 = 2112;
    v38 = v33;
    v39 = 2112;
    v40 = v32;
    v41 = 2112;
    v42 = v31;
    v43 = 2112;
    v44 = v30;
    v45 = 2112;
    v46 = v29;
    v47 = 2112;
    v48 = v27;
    v49 = 2112;
    v50 = v25;
    v51 = 2112;
    v52 = v13;
    v53 = 2112;
    v54 = v26;
    v55 = 2112;
    v56 = v14;
    v57 = 2112;
    v58 = v15;
    v59 = 2112;
    v60 = v16;
    v61 = 2112;
    v62 = v17;
    v63 = 2112;
    v64 = v18;
    _os_log_impl(&dword_21A237000, log, OS_LOG_TYPE_DEFAULT, "currentMediaItemAttributes nowPlayingInfo: \nnowPlayingInfo Item Info \n    PID: %@ \n    Title: %@ \n    Album: %@ \n    Artist: %@ \n    Genre: %@ \n    Composer: %@ \n    Duration: %@ \n    Album Index/Count: %@ / %@ \n    Disc Index/Count: %@ / %@ \n    Chapter Count: %@ \n    Liked / Banned: %@ / %@ \n    artworkID; %@ \n",
      buf,
      0x98u);

    v10 = (uint64_t *)MEMORY[0x24BE657D0];
    v11 = (_QWORD *)MEMORY[0x24BE65800];

    v6 = log;
    v9 = (_QWORD *)MEMORY[0x24BE657B0];

    v12 = (_QWORD *)MEMORY[0x24BE65798];
    v8 = (_QWORD *)MEMORY[0x24BE65850];

  }
  v19 = &unk_24DC8C720;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00C60], *MEMORY[0x24BE65888], v3, &unk_24DC8C720);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00C70], *v8, v3, &stru_24DC89FD0);
  v20 = *v10;
  objc_msgSend(v3, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v3, "objectForKey:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unint64_t)(v23 * 1000.0));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", v19, *MEMORY[0x24BE00C68]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00C00], *MEMORY[0x24BE65770], v3, &stru_24DC89FD0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00C10], *MEMORY[0x24BE65878], v3, &unk_24DC8C720);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00C08], *MEMORY[0x24BE65870], v3, &unk_24DC8C720);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00BF8], *MEMORY[0x24BE657C8], v3, &unk_24DC8C720);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00BF0], *MEMORY[0x24BE65860], v3, &unk_24DC8C720);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00C18], *MEMORY[0x24BE65780], v3, &stru_24DC89FD0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00C38], *MEMORY[0x24BE657E8], v3, &stru_24DC89FD0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00C30], *v9, v3, &stru_24DC89FD0);
  v24 = MEMORY[0x24BDBD1C0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00C58], *v11, v3, MEMORY[0x24BDBD1C0]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00C48], *MEMORY[0x24BE657F8], v3, v24);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00C28], *MEMORY[0x24BE65858], v3, v24);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00C20], *v12, v3, &stru_24DC89FD0);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __56__ACCNowPlayingFeaturePlugin_currentMediaItemAttributes__block_invoke_138(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  BOOL v4;
  int v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t i;
  int v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  _BYTE v37[10];
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = v2;
  if (gLogObjects)
    v4 = gNumLogObjects <= 0;
  else
    v4 = 1;
  v5 = !v4;
  if (v2)
  {
    if (v5)
    {
      v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v37 = v3;
      _os_log_impl(&dword_21A237000, v6, OS_LOG_TYPE_INFO, "currentMediaItemAttributes supportedCommands: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __56__ACCNowPlayingFeaturePlugin_currentMediaItemAttributes__block_invoke_138_cold_1();
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v32;
    v15 = MEMORY[0x24BDACB70];
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v9);
        v17 = MEMORY[0x22073DEBC](*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
        if (v17 == 22)
        {
          v21 = gLogObjects;
          v22 = gNumLogObjects;
          if (gLogObjects)
            v23 = gNumLogObjects < 1;
          else
            v23 = 1;
          if (v23)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v37 = v21;
              *(_WORD *)&v37[8] = 1024;
              v38 = v22;
              _os_log_error_impl(&dword_21A237000, v15, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v24 = v15;
            v20 = v15;
          }
          else
          {
            v20 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v37 = 22;
            *(_WORD *)&v37[4] = 1024;
            *(_DWORD *)&v37[6] = v13 & 1;
            _os_log_impl(&dword_21A237000, v20, OS_LOG_TYPE_DEFAULT, "currentMediaItemAttributes supportedCommands: %d, isBanSupported=%d", buf, 0xEu);
          }
          v13 = 1;
        }
        else
        {
          if (v17 != 21)
            continue;
          v18 = gLogObjects;
          v19 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v20 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v37 = v18;
              *(_WORD *)&v37[8] = 1024;
              v38 = v19;
              _os_log_error_impl(&dword_21A237000, v15, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v25 = v15;
            v20 = v15;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v37 = 21;
            *(_WORD *)&v37[4] = 1024;
            *(_DWORD *)&v37[6] = v12 & 1;
            _os_log_impl(&dword_21A237000, v20, OS_LOG_TYPE_DEFAULT, "currentMediaItemAttributes supportedCommands: %d, isLikeSupported=%d", buf, 0xEu);
          }
          v12 = 1;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (!v11)
        goto LABEL_54;
    }
  }
  v12 = 0;
  v13 = 0;
LABEL_54:

  v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12 & 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v27, *MEMORY[0x24BE00C50]);

  v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13 & 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKey:", v29, *MEMORY[0x24BE00C40]);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)currentMediaItemArtworkOriginal
{
  dispatch_semaphore_t v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v3 = dispatch_semaphore_create(0);
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ACCNowPlayingFeaturePlugin currentMediaItemArtworkOriginal].cold.3();

  MRMediaRemoteGetLocalOrigin();
  -[ACCNowPlayingFeaturePlugin completionQueue](self, "completionQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  MRMediaRemoteGetNowPlayingArtwork();

  v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACCNowPlayingFeaturePlugin currentMediaItemArtworkOriginal].cold.1(v10);

  }
  v12 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v12;
}

intptr_t __61__ACCNowPlayingFeaturePlugin_currentMediaItemArtworkOriginal__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  uint8_t v10[16];

  if (a2)
  {
    v3 = MEMORY[0x22073DF4C](a2);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  else
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 1;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21A237000, v8, OS_LOG_TYPE_INFO, "#Artwork No artwork image received from MediaRemote!", v10, 2u);
    }

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)currentMediaItemArtwork
{
  void *v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  CGImageSource *v6;
  NSObject *v7;
  id v8;
  __CFData *v9;
  CGImageDestination *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFDictionary *v15;
  _BOOL4 v16;
  BOOL v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  _BOOL4 v22;
  CGImageSource *v23;
  NSObject *v24;
  id v25;
  __CFData *v26;
  id v27;
  NSObject *v28;
  id v29;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  -[ACCNowPlayingFeaturePlugin currentMediaItemArtworkOriginal](self, "currentMediaItemArtworkOriginal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACCNowPlayingFeaturePlugin currentMediaItemArtwork].cold.10(v2, v5);

  if (!v2)
    goto LABEL_57;
  v6 = CGImageSourceCreateWithData((CFDataRef)v2, 0);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v7 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCNowPlayingFeaturePlugin currentMediaItemArtwork].cold.8(v6, v7);

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v9 = (__CFData *)objc_claimAutoreleasedReturnValue();
  v10 = CGImageDestinationCreateWithData(v9, (CFStringRef)*MEMORY[0x24BDC17C0], 1uLL, 0);
  v11 = *MEMORY[0x24BDD9220];
  v32[0] = &unk_24DC8C750;
  v12 = *MEMORY[0x24BDD9470];
  v31[0] = v11;
  v31[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v13;
  v31[2] = *MEMORY[0x24BDD95D0];
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGImageDestinationAddImageFromSource(v10, v6, 0, v15);

  v16 = CGImageDestinationFinalize(v10);
  if (gLogObjects)
    v17 = gNumLogObjects <= 0;
  else
    v17 = 1;
  v18 = !v17;
  if (v16)
  {
    if (v18)
    {
      v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v19 = MEMORY[0x24BDACB70];
      v21 = MEMORY[0x24BDACB70];
    }
    v22 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

    if (v22)
    {
      v23 = CGImageSourceCreateWithData(v9, 0);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v24 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
        v24 = MEMORY[0x24BDACB70];
        v27 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[ACCNowPlayingFeaturePlugin currentMediaItemArtwork].cold.3(v23, v24);

      if (v23)
        CFRelease(v23);
    }
    v26 = v9;
    if (v10)
LABEL_53:
      CFRelease(v10);
  }
  else
  {
    if (v18)
    {
      v20 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v20 = MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ACCNowPlayingFeaturePlugin currentMediaItemArtwork].cold.6();

    v26 = 0;
    if (v10)
      goto LABEL_53;
  }

  if (v6)
    CFRelease(v6);
  if (!v26)
  {
LABEL_57:
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", 0, 0);
    v26 = (__CFData *)objc_claimAutoreleasedReturnValue();
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v28 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v28 = MEMORY[0x24BDACB70];
    v29 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[ACCNowPlayingFeaturePlugin currentMediaItemArtwork].cold.1(v26, v28);

  return v26;
}

- (id)currentPlaybackAttributes
{
  dispatch_semaphore_t v3;
  void *v4;
  dispatch_time_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v3 = dispatch_semaphore_create(0);
  MRMediaRemoteGetLocalOrigin();
  -[ACCNowPlayingFeaturePlugin completionQueue](self, "completionQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork();

  v5 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v19, v5);
  -[ACCNowPlayingFeaturePlugin completionQueue](self, "completionQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  MRMediaRemoteGetSupportedCommands();

  v8 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v27 = 5000;
      _os_log_impl(&dword_21A237000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] currentPlaybackAttributes: timed out (%d ms) waiting for MR supportedCommands", buf, 8u);
    }

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ACCNowPlayingFeaturePlugin currentPlaybackAttributes].cold.3();

  -[ACCNowPlayingFeaturePlugin cachedPlaybackAttributes](self, "cachedPlaybackAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v14)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[ACCNowPlayingFeaturePlugin currentPlaybackAttributes].cold.1();

    -[ACCNowPlayingFeaturePlugin setCachedPlaybackAttributes:](self, "setCachedPlaybackAttributes:", v21[5]);
  }
  v17 = (void *)objc_msgSend((id)v21[5], "copy");

  _Block_object_dispose(&v20, 8);
  return v17;
}

void __55__ACCNowPlayingFeaturePlugin_currentPlaybackAttributes__block_invoke(uint64_t a1, void *a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  _BOOL4 v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *log;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __55__ACCNowPlayingFeaturePlugin_currentPlaybackAttributes__block_invoke_cold_2();

  v7 = a2;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v8 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  v11 = (_QWORD *)MEMORY[0x24BE65848];
  v12 = (_QWORD *)MEMORY[0x24BE657D8];
  v13 = (_QWORD *)MEMORY[0x24BE657D0];
  v14 = (uint64_t *)MEMORY[0x24BE65818];
  if (v10)
  {
    v15 = *MEMORY[0x24BE65848];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE65848]);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v15);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "timeIntervalSince1970");
    v17 = v16;
    objc_msgSend(v7, "objectForKeyedSubscript:", *v12);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *v13);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *v14);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE657B8]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE65820]);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE65868]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE657A8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE65858]);
    log = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE657F0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE65828]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE65830]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE65808]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138415618;
    v57 = v55;
    v58 = 2048;
    v59 = v17;
    v60 = 2112;
    v61 = v54;
    v62 = 2112;
    v63 = v53;
    v64 = 2112;
    v65 = v52;
    v66 = 2112;
    v67 = v50;
    v68 = 2112;
    v69 = v48;
    v70 = 2112;
    v71 = v47;
    v72 = 2112;
    v73 = v18;
    v74 = 2112;
    v75 = v19;
    v76 = 2112;
    v77 = v20;
    v78 = 2112;
    v79 = v21;
    v80 = 2112;
    v81 = v22;
    v82 = 2112;
    v83 = v23;
    _os_log_impl(&dword_21A237000, log, OS_LOG_TYPE_DEFAULT, "currentPlaybackAttributes nowPlayingInfo: \nnowPlayingInfoInfo Playback Info \n    Timestamp: %@ (%f) \n    ElapsedTime: %@ / %@ \n    PlaybackRate: %@ (%@) \n    Index / Count: %@ / %@ \n    Chapter: %@ / %@ \n    IsAd: %@ \n    RadioStation: %@ (%@)\n    IsMusicApp: %@\n", buf, 0x8Eu);

    v12 = (_QWORD *)MEMORY[0x24BE657D8];
    v11 = (_QWORD *)MEMORY[0x24BE65848];

    v14 = (uint64_t *)MEMORY[0x24BE65818];
    v8 = log;

    v13 = (_QWORD *)MEMORY[0x24BE657D0];
  }

  v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v7, "objectForKeyedSubscript:", *v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *v14;
  objc_msgSend(v7, "objectForKeyedSubscript:", *v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unint64_t)(calculateCurrentElapsedTime(v25, v26, v28, v29) * 1000.0));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v30, *MEMORY[0x24BE00C88]);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00CB0], *MEMORY[0x24BE65820], v7, &unk_24DC8C720);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00CA8], *MEMORY[0x24BE65868], v7, &unk_24DC8C720);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00CA0], *MEMORY[0x24BE657A8], v7, &unk_24DC8C720);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00CD8], *MEMORY[0x24BE657F0], v7, MEMORY[0x24BDBD1C0]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00CE0], *MEMORY[0x24BE65828], v7, &stru_24DC89FD0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00CE8], *MEMORY[0x24BE65830], v7, &stru_24DC89FD0);
  v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKey:", v32, *MEMORY[0x24BE00CF0]);

  objc_msgSend(v7, "objectForKey:", v27);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE657B8]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *MEMORY[0x24BE65808];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE65808]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
    v38 = objc_msgSend(v36, "BOOLValue");
  else
    v38 = 0;
  v39 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  calculatePlaybackSpeed(v33, v34, v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setObject:forKey:", v40, *MEMORY[0x24BE00C98]);

  v41 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  convertPlaybackStatus(objc_msgSend(*(id *)(a1 + 32), "currentPlaybackStateMR"), v33, v34);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKey:", v42, *MEMORY[0x24BE00CD0]);

  v43 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentPlaybackAppName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKey:objectIfNil:", v44, *MEMORY[0x24BE00C80], &stru_24DC89FD0);

  v45 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentPlaybackAppBundleID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setObject:forKey:objectIfNil:", v46, *MEMORY[0x24BE00C78], &stru_24DC89FD0);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copyToKey:fromKey:inDictionary:objectIfNil:", *MEMORY[0x24BE00C90], v35, v7, MEMORY[0x24BDBD1C0]);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __55__ACCNowPlayingFeaturePlugin_currentPlaybackAttributes__block_invoke_145(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t i;
  int v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  uint64_t v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  _BYTE v57[14];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v49 = *MEMORY[0x24BE00CB8];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", &unk_24DC8C738);
  v48 = *MEMORY[0x24BE00CC8];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", &unk_24DC8C738);
  v50 = a1;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = *MEMORY[0x24BE00CC0];
  objc_msgSend(v4, "setObject:forKey:", v5);

  v6 = a2;
  v7 = v6;
  if (gLogObjects)
    v8 = gNumLogObjects <= 0;
  else
    v8 = 1;
  v9 = !v8;
  if (v6)
  {
    if (v9)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v57 = v7;
      _os_log_impl(&dword_21A237000, v10, OS_LOG_TYPE_INFO, "currentPlaybackAttributes supportedCommands: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __56__ACCNowPlayingFeaturePlugin_currentMediaItemAttributes__block_invoke_138_cold_1();
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v52;
    v18 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v15 = 134218240;
    v46 = v15;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v52 != v17)
          objc_enumerationMutation(v13);
        v20 = MEMORY[0x22073DEBC](*(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
        if (MRMediaRemoteCommandInfoGetEnabled())
        {
          v21 = gLogObjects;
          v22 = gNumLogObjects;
          if (gLogObjects)
            v23 = gNumLogObjects < 1;
          else
            v23 = 1;
          if (v23)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v46;
              *(_QWORD *)v57 = v21;
              *(_WORD *)&v57[8] = 1024;
              *(_DWORD *)&v57[10] = v22;
              _os_log_error_impl(&dword_21A237000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v24 = v18;
            v25 = v18;
          }
          else
          {
            v25 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v57 = v20;
            _os_log_impl(&dword_21A237000, v25, OS_LOG_TYPE_INFO, "currentPlaybackAttributes supportedCommands: supportedCommand=%d", buf, 8u);
          }

          switch(v20)
          {
            case 26:
              v29 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
              v33 = gLogObjects;
              v34 = gNumLogObjects;
              if (gLogObjects && gNumLogObjects >= 1)
              {
                v35 = *(id *)gLogObjects;
              }
              else
              {
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v46;
                  *(_QWORD *)v57 = v33;
                  *(_WORD *)&v57[8] = 1024;
                  *(_DWORD *)&v57[10] = v34;
                  _os_log_error_impl(&dword_21A237000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v42 = v18;
                v35 = v18;
              }
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v57 = 26;
                *(_WORD *)&v57[4] = 2112;
                *(_QWORD *)&v57[6] = v29;
                _os_log_impl(&dword_21A237000, v35, OS_LOG_TYPE_DEFAULT, "currentPlaybackAttributes supportedCommands: %d, ShuffleMode=%@", buf, 0x12u);
              }

              v43 = *(void **)(*(_QWORD *)(*(_QWORD *)(v50 + 40) + 8) + 40);
              convertShuffleMode(v29);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v43;
              v40 = v38;
              v41 = v48;
              break;
            case 25:
              v29 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
              v30 = gLogObjects;
              v31 = gNumLogObjects;
              if (gLogObjects && gNumLogObjects >= 1)
              {
                v32 = *(id *)gLogObjects;
              }
              else
              {
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v46;
                  *(_QWORD *)v57 = v30;
                  *(_WORD *)&v57[8] = 1024;
                  *(_DWORD *)&v57[10] = v31;
                  _os_log_error_impl(&dword_21A237000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v36 = v18;
                v32 = v18;
              }
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v57 = 25;
                *(_WORD *)&v57[4] = 2112;
                *(_QWORD *)&v57[6] = v29;
                _os_log_impl(&dword_21A237000, v32, OS_LOG_TYPE_DEFAULT, "currentPlaybackAttributes supportedCommands: %d, RepeastMode=%@", buf, 0x12u);
              }

              v37 = *(void **)(*(_QWORD *)(*(_QWORD *)(v50 + 40) + 8) + 40);
              convertRepeatMode(v29);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v37;
              v40 = v38;
              v41 = v49;
              break;
            case 24:
              v26 = gLogObjects;
              v27 = gNumLogObjects;
              if (gLogObjects && gNumLogObjects >= 1)
              {
                v28 = *(id *)gLogObjects;
              }
              else
              {
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v46;
                  *(_QWORD *)v57 = v26;
                  *(_WORD *)&v57[8] = 1024;
                  *(_DWORD *)&v57[10] = v27;
                  _os_log_error_impl(&dword_21A237000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v44 = v18;
                v28 = v18;
              }
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v57 = 24;
                _os_log_impl(&dword_21A237000, v28, OS_LOG_TYPE_DEFAULT, "currentPlaybackAttributes supportedCommands: %d, SetTimeElpasedAvailable", buf, 8u);
              }

              v45 = *(void **)(*(_QWORD *)(*(_QWORD *)(v50 + 40) + 8) + 40);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "setObject:forKey:", v29, v47);
              goto LABEL_69;
            default:
              continue;
          }
          objc_msgSend(v39, "setObject:forKey:", v40, v41, v46);

LABEL_69:
          continue;
        }
      }
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v16);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v50 + 32));
}

- (BOOL)setPlaybackElapsedTime:(id)a3
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_21A237000, v6, OS_LOG_TYPE_DEFAULT, "Received set playback elapsed time: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v3, "unsignedLongValue");
  MRMediaRemoteSetElapsedTime();

  return 1;
}

- (BOOL)setPlaybackQueueIndex:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_21A237000, v7, OS_LOG_TYPE_DEFAULT, "Received set playback queue index: %@", buf, 0xCu);
  }

  -[ACCNowPlayingFeaturePlugin mpMusicPlayerControllerQueue](self, "mpMusicPlayerControllerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__ACCNowPlayingFeaturePlugin_setPlaybackQueueIndex___block_invoke;
  v11[3] = &unk_24DC89BA0;
  v11[4] = self;
  v12 = v4;
  v9 = v4;
  dispatch_sync(v8, v11);

  return 0;
}

void __52__ACCNowPlayingFeaturePlugin_setPlaybackQueueIndex___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "mpMusicPlayerControllerHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(v2, "nowPlayingItemAtIndex:", objc_msgSend(*(id *)(a1 + 40), "unsignedLongValue"));
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v2, "setNowPlayingItem:", v3);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
        v6 = MEMORY[0x24BDACB70];
        v7 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __52__ACCNowPlayingFeaturePlugin_setPlaybackQueueIndex___block_invoke_cold_3();

    }
  }
  else
  {
    if (gLogObjects)
      v4 = gNumLogObjects < 1;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v3 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v3 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __52__ACCNowPlayingFeaturePlugin_setPlaybackQueueIndex___block_invoke_cold_1();
  }

}

- (void)requestPlaybackQueueListInfo:(id)a3 requestID:(id)a4 startIndex:(unsigned int)a5 upToCount:(unsigned int)a6 infoMask:(unsigned int)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  BOOL v20;
  int64_t v21;
  double v22;
  double v23;
  NSObject *v24;
  id v25;
  NSObject *nowPlayingInfoPBQueueListQ;
  NSObject *v27;
  id v28;
  _QWORD block[5];
  id v30;
  id v31;
  unint64_t v32;
  int64_t v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  unsigned int v44;
  __int16 v45;
  unsigned int v46;
  __int16 v47;
  int64_t v48;
  __int16 v49;
  unint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  -[ACCNowPlayingFeaturePlugin cachedPlaybackAttributes](self, "cachedPlaybackAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BE00CA8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  v17 = -[ACCSettingsState intValue](self->_maxPlaybackQueueInfoCount, "intValue");
  if (v17 >= 1
    && ((v18 = v17, v17 >= (unint64_t)a6) ? (v19 = a6 == 0) : (v19 = 1),
        v19 ? (v20 = v16 > (unint64_t)v17) : (v20 = 0),
        v20))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v27 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v27 = MEMORY[0x24BDACB70];
      v28 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v38 = v12;
      v39 = 2048;
      v40 = v18;
      v41 = 1024;
      v42 = a6;
      v43 = 1024;
      v44 = v16;
      _os_log_impl(&dword_21A237000, v27, OS_LOG_TYPE_DEFAULT, "requestPlaybackQueueListInfo: accessoryUID %@, ignore request, maxPlaybackQueueInfoCount=%ld upToCount=%u count=%u !!!!!!!!", buf, 0x22u);
    }

  }
  else
  {
    v21 = -[ACCSettingsState intValue](self->_playbackQueueInfoTimeoutMs, "intValue");
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v23 = v22 * 1000.0;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v24 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v24 = MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413826;
      v38 = v12;
      v39 = 2112;
      v40 = (uint64_t)v13;
      v41 = 1024;
      v42 = a5;
      v43 = 1024;
      v44 = a6;
      v45 = 1024;
      v46 = a7;
      v47 = 2048;
      v48 = v21;
      v49 = 2048;
      v50 = (unint64_t)v23;
      _os_log_impl(&dword_21A237000, v24, OS_LOG_TYPE_DEFAULT, "Received requestPlaybackQueueListInfo: %@ requestID: %@ startIndex: %u upToCount: %u infoMask: 0x%x, playbackQueueInfoTimeoutMs=%ld startTimeMs=%lld", buf, 0x3Cu);
    }

    nowPlayingInfoPBQueueListQ = self->_nowPlayingInfoPBQueueListQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke;
    block[3] = &unk_24DC89C90;
    block[4] = self;
    v30 = v12;
    v34 = a7;
    v35 = a5;
    v36 = a6;
    v31 = v13;
    v32 = (unint64_t)v23;
    v33 = v21;
    dispatch_async(nowPlayingInfoPBQueueListQ, block);

  }
}

void __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke(uint64_t a1)
{
  _ACCNowPlayingPBQUpdateRequestAccessory *v2;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _ACCNowPlayingPBQUpdateRequest *v14;
  _ACCNowPlayingPBQUpdateRequest *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  _ACCNowPlayingPBQUpdateRequest *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[5];
  _ACCNowPlayingPBQUpdateRequestAccessory *v26;
  _ACCNowPlayingPBQUpdateRequest *v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  _ACCNowPlayingPBQUpdateRequest *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (_ACCNowPlayingPBQUpdateRequestAccessory *)objc_claimAutoreleasedReturnValue();
  if (v2)
    goto LABEL_13;
  if (!gLogObjects || gNumLogObjects < 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v30 = v6;
    _os_log_impl(&dword_21A237000, v5, OS_LOG_TYPE_INFO, "requestPlaybackQueueListInfo: create new accessory object for accessoryUID %@", buf, 0xCu);
  }

  v2 = -[_ACCNowPlayingPBQUpdateRequestAccessory initWithAccessoryUID:]([_ACCNowPlayingPBQUpdateRequestAccessory alloc], "initWithAccessoryUID:", *(_QWORD *)(a1 + 40));
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  -[_ACCNowPlayingPBQUpdateRequestAccessory accessoryUID](v2, "accessoryUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v2, v8);

  if (v2)
  {
LABEL_13:
    v9 = *(_DWORD *)(a1 + 72);
    -[_ACCNowPlayingPBQUpdateRequestAccessory currentRequestID](v2, "currentRequestID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else if (*(_QWORD *)(a1 + 48))
    {
      v15 = -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]([_ACCNowPlayingPBQUpdateRequest alloc], "initWithID:startIndex:upToCount:infoMask:allowNonLibrary:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 76), *(unsigned int *)(a1 + 80), *(unsigned int *)(a1 + 72), v9 >= 0);
      -[_ACCNowPlayingPBQUpdateRequest setStartTimeMs:](v15, "setStartTimeMs:", *(_QWORD *)(a1 + 56));
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
        v16 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v19 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v30 = v19;
        v31 = 2112;
        v32 = v15;
        _os_log_impl(&dword_21A237000, v16, OS_LOG_TYPE_INFO, "requestPlaybackQueueListInfo: %@ created request %@", buf, 0x16u);
      }

      -[_ACCNowPlayingPBQUpdateRequestAccessory setCurrentRequestID:](v2, "setCurrentRequestID:", *(_QWORD *)(a1 + 48));
      -[_ACCNowPlayingPBQUpdateRequestAccessory setCurrentRequest:](v2, "setCurrentRequest:", v15);
      goto LABEL_37;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v14 = *(_ACCNowPlayingPBQUpdateRequest **)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v30 = v13;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_21A237000, v11, OS_LOG_TYPE_INFO, "requestPlaybackQueueListInfo: requestID %@ already exists for accessory %@, ignore request (should cancel request first)", buf, 0x16u);
    }

    v15 = 0;
LABEL_37:
    -[_ACCNowPlayingPBQUpdateRequestAccessory queue](v2, "queue");
    v20 = objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_151;
    v25[3] = &unk_24DC89C68;
    v21 = *(_QWORD *)(a1 + 64);
    v25[4] = *(_QWORD *)(a1 + 32);
    v26 = v2;
    v27 = v15;
    v28 = v21;
    v22 = v15;
    v17 = v2;
    dispatch_async(v20, v25);

    goto LABEL_38;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v17 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v17 = MEMORY[0x24BDACB70];
    v23 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v30 = v24;
    _os_log_impl(&dword_21A237000, v17, OS_LOG_TYPE_DEFAULT, "requestPlaybackQueueListInfo: failed to find accessory for accessoryUID %@", buf, 0xCu);
  }
LABEL_38:

}

void __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_151(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];
  _QWORD v18[5];
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_2;
  v18[3] = &unk_24DC89C18;
  v18[4] = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x22073E204](v18);
  v17[0] = v2;
  v17[1] = 3221225472;
  v17[2] = __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_155;
  v17[3] = &unk_24DC89C40;
  v4 = *(_QWORD *)(a1 + 56);
  v17[4] = *(_QWORD *)(a1 + 32);
  v17[5] = v4;
  v5 = (void *)MEMORY[0x22073E204](v17);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_21A237000, v6, OS_LOG_TYPE_INFO, "requestPlaybackQueueListInfo: call _generatePlaybackQueueItemsWithPropertyList, accessory=%@ request=%@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_generatePlaybackQueueItemsWithPropertyList:request:completionHandler:continueQuery:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3, v5);
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v11 = v10;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = objc_msgSend(*(id *)(a1 + 48), "startTimeMs");
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134218498;
    v20 = (unint64_t)(v11 * 1000.0) - v14;
    v21 = 2112;
    v22 = v15;
    v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_21A237000, v12, OS_LOG_TYPE_INFO, "requestPlaybackQueueListInfo: finished in %lld ms, accessory=%@ request=%@", buf, 0x20u);
  }

}

void __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  BOOL v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD v28[5];
  id v29;
  _BYTE *v30;
  _QWORD block[5];
  id v32;
  _BYTE *v33;
  uint8_t v34[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v41 = v9;
    _os_log_impl(&dword_21A237000, v12, OS_LOG_TYPE_INFO, "requestPlaybackQueueListInfo: completionCB: %@, reqID=%@ info=%@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = 0;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(NSObject **)(v13 + 128);
  v15 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_152;
  block[3] = &unk_24DC89BC8;
  v33 = buf;
  block[4] = v13;
  v16 = v7;
  v32 = v16;
  dispatch_sync(v14, block);
  v17 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v17)
  {
    objc_msgSend(v17, "currentRequestID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v8, "isEqualToString:", v18);

    if (v19)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v20 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
        v20 = MEMORY[0x24BDACB70];
        v23 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v34 = 138412802;
        v35 = v16;
        v36 = 2112;
        v37 = v8;
        v38 = 2112;
        v39 = v9;
        _os_log_impl(&dword_21A237000, v20, OS_LOG_TYPE_DEFAULT, "requestPlaybackQueueListInfo: completionCB: %@, reqID=%@, call playbackQueueListInfoResponse info=%@", v34, 0x20u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "playbackQueueListInfoResponse:requestID:info:", v16, v8, v9);
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v24 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v24 = MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_2_cold_2();

    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(NSObject **)(v26 + 128);
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_153;
    v28[3] = &unk_24DC89BF0;
    v28[4] = v26;
    v29 = v16;
    v30 = buf;
    dispatch_sync(v27, v28);

  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v21 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v21 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 138412290;
      v35 = v16;
      _os_log_impl(&dword_21A237000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] requestPlaybackQueueListInfo: completionCB: %@, no accessory obejct to handle completion!", v34, 0xCu);
    }

  }
  _Block_object_dispose(buf, 8);

}

void __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_152(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_153(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1[4] + 80), "removeObjectForKey:", a1[5]);
  v2 = *(_QWORD *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

uint64_t __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_155(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if ((a4 & 0x7F) != 0
    || *(_QWORD *)(a1 + 40) == -1
    || (objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate"),
        v10 = (unint64_t)(v9 * 1000.0),
        *(_QWORD *)(a1 + 40) + objc_msgSend(v8, "startTimeMs") > v10))
  {
    v11 = 0;
    if (v7 && v8)
    {
      objc_msgSend(v8, "requestID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentRequestID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "isEqualToString:", v13);

    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "accessoryUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "requestID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v8, "startTimeMs");
      v19 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "playbackQueueInfoSendPartialOnTimeout");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138413570;
      v26 = v16;
      v27 = 2112;
      v28 = v17;
      v29 = 2048;
      v30 = v18;
      v31 = 2048;
      v32 = v10;
      v33 = 2048;
      v34 = v19;
      v35 = 2048;
      v36 = objc_msgSend(v20, "intValue");
      _os_log_impl(&dword_21A237000, v14, OS_LOG_TYPE_DEFAULT, "requestPlaybackQueueListInfo: continueCB: %@, request %@ timed out!, start=%lld cur=%lld timeout=%ld !!!!!!!! (SendPartialOnTimeout=%ld)", (uint8_t *)&v25, 0x3Eu);

    }
    objc_msgSend(*(id *)(a1 + 32), "playbackQueueInfoSendPartialOnTimeout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "intValue") == 1)
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "playbackQueueInfoSendPartialOnTimeout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "intValue");

      if (v23 != 3)
      {
        v11 = 0;
        goto LABEL_20;
      }
    }
    v11 = 0xFFFFFFFFLL;
  }
LABEL_20:

  return v11;
}

- (void)cancelRequestPlaybackQueueListInfo:(id)a3 requestID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *nowPlayingInfoPBQueueListQ;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_21A237000, v10, OS_LOG_TYPE_DEFAULT, "Received cancelRequestPlaybackQueueListInfo: %@ requestID: %@", buf, 0x16u);
  }

  nowPlayingInfoPBQueueListQ = self->_nowPlayingInfoPBQueueListQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__ACCNowPlayingFeaturePlugin_cancelRequestPlaybackQueueListInfo_requestID___block_invoke;
  block[3] = &unk_24DC89CB8;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(nowPlayingInfoPBQueueListQ, block);

}

void __75__ACCNowPlayingFeaturePlugin_cancelRequestPlaybackQueueListInfo_requestID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 80), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (gLogObjects)
    v4 = gNumLogObjects <= 0;
  else
    v4 = 1;
  v5 = !v4;
  if (!v2)
  {
    if (v5)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_45;
    v16 = a1[5];
    v24 = 138412290;
    v25 = v16;
    v17 = "cancelRequestPlaybackQueueListInfo: failed to find accessory for accessoryUID %@";
    v18 = v7;
    v19 = 12;
    goto LABEL_44;
  }
  if (v5)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __75__ACCNowPlayingFeaturePlugin_cancelRequestPlaybackQueueListInfo_requestID___block_invoke_cold_5();

  v9 = (void *)a1[6];
  objc_msgSend(v3, "currentRequestID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (gLogObjects)
    v12 = gNumLogObjects <= 0;
  else
    v12 = 1;
  v13 = !v12;
  if (!v11)
  {
    if (v13)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v21 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_45;
    v23 = a1[5];
    v22 = a1[6];
    v24 = 138412546;
    v25 = v22;
    v26 = 2112;
    v27 = v23;
    v17 = "cancelRequestPlaybackQueueListInfo: failed to find requestID %@ for accessory %@";
    v18 = v7;
    v19 = 22;
LABEL_44:
    _os_log_impl(&dword_21A237000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v24, v19);
LABEL_45:

    goto LABEL_46;
  }
  if (v13)
  {
    v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v20 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __75__ACCNowPlayingFeaturePlugin_cancelRequestPlaybackQueueListInfo_requestID___block_invoke_cold_2();

  objc_msgSend(v3, "setCurrentRequestID:", 0);
  objc_msgSend(v3, "setCurrentRequest:", 0);
LABEL_46:

}

- (void)_generatePlaybackQueueItemsWithPropertyList:(id)a3 request:(id)a4 completionHandler:(id)a5 continueQuery:(id)a6
{
  uint64_t v6;
  id v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  BOOL v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  id v54;
  ACCMemUsageStat *memUse;
  NSObject *v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unint64_t v69;
  void *v70;
  void *v71;
  NSObject *v72;
  id v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  int v77;
  uint64_t v78;
  const char *v79;
  char v80;
  NSObject *v81;
  id v82;
  NSObject *v83;
  uint64_t v84;
  int v85;
  NSObject *v86;
  NSObject *v87;
  void *v88;
  NSObject *v89;
  uint64_t v90;
  int v91;
  NSObject *v92;
  uint64_t v93;
  int v94;
  NSObject *v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  NSObject *v101;
  NSObject *v102;
  NSObject *v103;
  BOOL v104;
  double v105;
  void *v106;
  _BOOL4 v107;
  unsigned __int8 v108;
  _BOOL4 v109;
  uint64_t v110;
  void *v111;
  void *v112;
  unint64_t v113;
  uint64_t v114;
  void *v115;
  unint64_t v116;
  NSObject *v117;
  id v118;
  int v119;
  _BOOL8 v120;
  void *v121;
  NSObject *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  _BOOL4 v126;
  NSObject *v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t v130;
  void *v131;
  void *v132;
  int v133;
  NSObject *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  NSObject *v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  unint64_t v147;
  uint64_t v148;
  unint64_t v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  unint64_t v166;
  unsigned int v167;
  uint64_t v168;
  int v169;
  unsigned int v170;
  NSObject *v171;
  void (**v172)(id, NSObject *, void *, id);
  uint64_t (**v173)(id, id, id, _QWORD);
  id v174;
  id v175;
  _QWORD block[4];
  id v177;
  uint64_t *v178;
  uint64_t v179;
  unsigned int v180;
  uint64_t v181;
  uint64_t *v182;
  uint64_t v183;
  uint64_t (*v184)(uint64_t, uint64_t);
  void (*v185)(uint64_t);
  id v186;
  uint8_t buf[4];
  _BYTE v188[10];
  _BYTE v189[60];
  __int16 v190;
  double v191;
  __int16 v192;
  uint64_t v193;
  __int16 v194;
  double v195;
  __int16 v196;
  uint64_t v197;
  __int16 v198;
  double v199;
  __int16 v200;
  uint64_t v201;
  __int16 v202;
  double v203;
  uint64_t v204;

  v204 = *MEMORY[0x24BDAC8D0];
  v175 = a3;
  v11 = a4;
  v172 = (void (**)(id, NSObject *, void *, id))a5;
  v173 = (uint64_t (**)(id, id, id, _QWORD))a6;
  if (gLogObjects)
    v12 = gNumLogObjects < 1;
  else
    v12 = 1;
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  else
  {
    v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v175, "accessoryUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v11, "startIndex");
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)v188 = v15;
    *(_WORD *)&v188[8] = 2112;
    *(_QWORD *)v189 = v16;
    *(_WORD *)&v189[8] = 1024;
    *(_DWORD *)&v189[10] = v6;
    *(_WORD *)&v189[14] = 1024;
    *(_DWORD *)&v189[16] = objc_msgSend(v11, "upToCount");
    *(_WORD *)&v189[20] = 1024;
    *(_DWORD *)&v189[22] = objc_msgSend(v11, "infoMask");
    _os_log_impl(&dword_21A237000, v14, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: %@ requestID: %@ startIndex: %u upToCount: %u infoMask:%xh", buf, 0x28u);

  }
  v17 = v173[2](v173, v175, v11, 0);
  if (v17 > 0)
  {
    -[ACCNowPlayingFeaturePlugin measureMemoryUsage](self, "measureMemoryUsage");
    v18 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject BOOLValue](v18, "BOOLValue"))
    {
      v19 = self->_memUse == 0;

      if (v19)
      {
        v171 = 0;
LABEL_33:
        v174 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v11, "requestID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v168 = *MEMORY[0x24BE00D18];
        objc_msgSend(v174, "setObject:forKey:", v32);

        if (!-[ACCNowPlayingFeaturePlugin _nowPlayingAppIsIPodApp](self, "_nowPlayingAppIsIPodApp")
          || -[ACCNowPlayingFeaturePlugin _nowPlayingAppIsIPodRadio](self, "_nowPlayingAppIsIPodRadio")
          || -[ACCNowPlayingFeaturePlugin _nowPlayingIsStreaming](self, "_nowPlayingIsStreaming"))
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v33 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
            v33 = MEMORY[0x24BDACB70];
            v34 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v175, "accessoryUID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "requestID");
            v6 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v188 = v35;
            *(_WORD *)&v188[8] = 2112;
            *(_QWORD *)v189 = v6;
            _os_log_impl(&dword_21A237000, v33, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: acc %@, req %@, 3rd party app / streaming, pbqList not available", buf, 0x16u);

          }
          objc_msgSend(v174, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE00CF8]);
          objc_msgSend(v175, "accessoryUID");
          v36 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "requestID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v172[2](v172, v36, v37, v174);

          v169 = 0;
          v170 = 0;
          goto LABEL_45;
        }
        -[ACCNowPlayingFeaturePlugin cachedPlaybackAttributes](self, "cachedPlaybackAttributes");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKey:", *MEMORY[0x24BE00CA8]);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v170 = objc_msgSend(v50, "unsignedIntegerValue");

        -[ACCNowPlayingFeaturePlugin cachedPlaybackAttributes](self, "cachedPlaybackAttributes");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectForKey:", *MEMORY[0x24BE00CB0]);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v169 = objc_msgSend(v52, "unsignedIntegerValue");

        if (gLogObjects && gNumLogObjects >= 1)
        {
          v53 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
          v53 = MEMORY[0x24BDACB70];
          v54 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v175, "accessoryUID");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "requestID");
          v6 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)v188 = v121;
          *(_WORD *)&v188[8] = 2112;
          *(_QWORD *)v189 = v6;
          *(_WORD *)&v189[8] = 1024;
          *(_DWORD *)&v189[10] = v170;
          *(_WORD *)&v189[14] = 1024;
          *(_DWORD *)&v189[16] = v169;
          _os_log_debug_impl(&dword_21A237000, v53, OS_LOG_TYPE_DEBUG, "_generatePlaybackQueueItemsWithPropertyList: acc %@, req %@, count=%d curIndex=%d", buf, 0x22u);

        }
        if (!v170)
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v58 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
            v58 = MEMORY[0x24BDACB70];
            v61 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v175, "accessoryUID");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "requestID");
            v6 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v188 = v62;
            *(_WORD *)&v188[8] = 2112;
            *(_QWORD *)v189 = v6;
            _os_log_impl(&dword_21A237000, v58, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: acc %@, req %@, No QueueCount", buf, 0x16u);

          }
          objc_msgSend(v174, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE00CF8]);
          objc_msgSend(v175, "accessoryUID");
          v36 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "requestID");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v172[2](v172, v36, v63, v174);

          v170 = 0;
          goto LABEL_45;
        }
        if ((int)v173[2](v173, v175, v11, 0) < 1)
        {
          logObjectForModule();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v175, "accessoryUID");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "requestID");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v188 = v59;
            *(_WORD *)&v188[8] = 2112;
            *(_QWORD *)v189 = v60;
            _os_log_impl(&dword_21A237000, v36, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: %@ requestID: %@, got continueCB false before retrieve list, skip processing.", buf, 0x16u);

          }
          goto LABEL_45;
        }
        v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        if (objc_msgSend(v11, "upToCount"))
          v167 = objc_msgSend(v11, "startIndex");
        else
          v167 = 0;
        v64 = objc_msgSend(v11, "upToCount");
        v65 = v170;
        v66 = v170;
        if (v64)
        {
          v67 = objc_msgSend(v11, "upToCount");
          v65 = v170;
          v66 = v170;
          if (v67 < v170)
          {
            v66 = objc_msgSend(v11, "upToCount");
            v65 = v170;
          }
        }
        v68 = v65 - v167;
        if (v68 >= v66)
          v69 = v66;
        else
          v69 = v68;
        v166 = v69;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = *MEMORY[0x24BE00D00];
        objc_msgSend(v174, "setObject:forKey:", v70);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v174, "setObject:forKey:", v71, *MEMORY[0x24BE00D20]);

        if (gLogObjects && gNumLogObjects >= 1)
        {
          v72 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
          v72 = MEMORY[0x24BDACB70];
          v73 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          -[NSObject startTime](v171, "startTime");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "timeIntervalSince1970");
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v188 = v170;
          *(_WORD *)&v188[8] = 2048;
          *(_QWORD *)v189 = v75;
          _os_log_impl(&dword_21A237000, v72, OS_LOG_TYPE_INFO, "_generatePlaybackQueueItemsWithPropertyList: Start retrieving queued track info: count=%lu startTimeInterval=%f", buf, 0x16u);

        }
        if ((int)v173[2](v173, v175, v11, 0) >= 1
          && +[ACCNowPlayingFeaturePlugin isMusicAppVisible](ACCNowPlayingFeaturePlugin, "isMusicAppVisible"))
        {
          logObjectForModule();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)v188 = v167;
            *(_WORD *)&v188[4] = 1024;
            *(_DWORD *)&v188[6] = v66;
            *(_WORD *)v189 = 1024;
            *(_DWORD *)&v189[2] = v166;
            *(_WORD *)&v189[6] = 1024;
            *(_DWORD *)&v189[8] = v166 + v167;
            _os_log_debug_impl(&dword_21A237000, v76, OS_LOG_TYPE_DEBUG, "_generatePlaybackQueueItemsWithPropertyList: startIndex=%d contentSize=%d contentCount=%d endIndex=%d", buf, 0x1Au);
          }

          v181 = 0;
          v182 = &v181;
          v183 = 0x3032000000;
          v184 = __Block_byref_object_copy_;
          v185 = __Block_byref_object_dispose_;
          v186 = 0;
          -[ACCNowPlayingFeaturePlugin mpMusicPlayerControllerHandler](self, "mpMusicPlayerControllerHandler");
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          if ((_DWORD)v166)
          {
            v77 = 0;
            v78 = 0;
            v6 = 0;
            v79 = "exist";
            if (!v165)
              v79 = "null";
            v163 = v79;
            v80 = 1;
            while (1)
            {
              if ((int)v173[2](v173, v175, v11, v78) <= 0)
                goto LABEL_190;
              -[ACCNowPlayingFeaturePlugin mpMusicPlayerControllerQueue](self, "mpMusicPlayerControllerQueue");
              v81 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __114__ACCNowPlayingFeaturePlugin__generatePlaybackQueueItemsWithPropertyList_request_completionHandler_continueQuery___block_invoke;
              block[3] = &unk_24DC89CE0;
              v178 = &v181;
              v82 = v165;
              v180 = v167;
              v177 = v82;
              v179 = v78;
              dispatch_sync(v81, block);

              v83 = MEMORY[0x24BDACB70];
              v84 = gLogObjects;
              v85 = gNumLogObjects;
              if (!gLogObjects)
                goto LABEL_216;
              if (gNumLogObjects >= 1)
              {
                v86 = *(id *)gLogObjects;
              }
              else
              {
LABEL_216:
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  *(_QWORD *)v188 = v84;
                  *(_WORD *)&v188[8] = 1024;
                  *(_DWORD *)v189 = v85;
                  _os_log_error_impl(&dword_21A237000, v83, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v87 = v83;
                v86 = v83;
              }
              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218496;
                *(_QWORD *)v188 = v78;
                *(_WORD *)&v188[8] = 2048;
                *(_QWORD *)v189 = v167 + v78;
                *(_WORD *)&v189[8] = 1024;
                *(_DWORD *)&v189[10] = v170;
                _os_log_debug_impl(&dword_21A237000, v86, OS_LOG_TYPE_DEBUG, "_generatePlaybackQueueItemsWithPropertyList: %lu [%lu / %d]", buf, 0x1Cu);
              }

              v88 = (void *)v182[5];
              if (!v88)
                break;
              if (objc_msgSend(v88, "persistentID") && (objc_msgSend((id)v182[5], "existsInLibrary") & 1) != 0)
              {
                v89 = MEMORY[0x24BDACB70];
              }
              else
              {
                if (!objc_msgSend(v11, "allowNonLibrary"))
                  v80 = 0;
                v90 = gLogObjects;
                v91 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v92 = *(id *)gLogObjects;
                  v89 = MEMORY[0x24BDACB70];
                }
                else
                {
                  v89 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(_QWORD *)v188 = v90;
                    *(_WORD *)&v188[8] = 1024;
                    *(_DWORD *)v189 = v91;
                    _os_log_error_impl(&dword_21A237000, v89, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v95 = v89;
                  v92 = v89;
                }
                if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
                {
                  v96 = (void *)v182[5];
                  objc_msgSend(v96, "title");
                  v97 = (id)objc_claimAutoreleasedReturnValue();
                  v98 = objc_msgSend((id)v182[5], "persistentID");
                  *(_DWORD *)buf = 134219010;
                  *(_QWORD *)v188 = v78;
                  *(_WORD *)&v188[8] = 2048;
                  *(_QWORD *)v189 = v170;
                  *(_WORD *)&v189[8] = 2112;
                  *(_QWORD *)&v189[10] = v96;
                  *(_WORD *)&v189[18] = 2112;
                  *(_QWORD *)&v189[20] = v97;
                  *(_WORD *)&v189[28] = 2048;
                  *(_QWORD *)&v189[30] = v98;
                  _os_log_impl(&dword_21A237000, v92, OS_LOG_TYPE_INFO, "_generatePlaybackQueueItemsWithPropertyList: i=%lu/%lu Found non-library item %@ (%@ : %llu)", buf, 0x34u);

                }
                v6 = 1;
              }
              if ((v80 & 1) != 0 && v174)
              {
                v99 = gLogObjects;
                v100 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v89 = *(id *)gLogObjects;
                }
                else
                {
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(_QWORD *)v188 = v99;
                    *(_WORD *)&v188[8] = 1024;
                    *(_DWORD *)v189 = v100;
                    _os_log_error_impl(&dword_21A237000, v89, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v102 = v89;
                }
                if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
                {
                  v110 = objc_msgSend((id)v182[5], "persistentID");
                  objc_msgSend((id)v182[5], "title");
                  v161 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v182[5], "artist");
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v182[5], "albumTitle");
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134219522;
                  *(_QWORD *)v188 = v78;
                  *(_WORD *)&v188[8] = 2048;
                  *(_QWORD *)v189 = v167 + v78;
                  *(_WORD *)&v189[8] = 1024;
                  *(_DWORD *)&v189[10] = v170;
                  *(_WORD *)&v189[14] = 2048;
                  *(_QWORD *)&v189[16] = v110;
                  *(_WORD *)&v189[24] = 2112;
                  *(_QWORD *)&v189[26] = v161;
                  *(_WORD *)&v189[34] = 2112;
                  *(_QWORD *)&v189[36] = v111;
                  *(_WORD *)&v189[44] = 2112;
                  *(_QWORD *)&v189[46] = v112;
                  _os_log_debug_impl(&dword_21A237000, v89, OS_LOG_TYPE_DEBUG, "_generatePlaybackQueueItemsWithPropertyList: %lu [%lu / %d]   mediaItem:(pid=%llu title='%@' artist='%@' album='%@')", buf, 0x44u);

                }
                +[ACCNowPlayingFeaturePlugin getItemDictionaryForContentItem:infoMask:](ACCNowPlayingFeaturePlugin, "getItemDictionaryForContentItem:infoMask:", v182[5], objc_msgSend(v11, "infoMask"));
                v83 = objc_claimAutoreleasedReturnValue();
                -[NSObject addObject:](v36, "addObject:", v83);
LABEL_162:

              }
              -[ACCNowPlayingFeaturePlugin measureMemoryUsage](self, "measureMemoryUsage");
              v103 = objc_claimAutoreleasedReturnValue();
              if (-[NSObject BOOLValue](v103, "BOOLValue"))
              {
                v104 = self->_memUse == 0;

                if (v104 || (v78 & 0x7F) != 0 && v170 - 1 != v78)
                  goto LABEL_172;
                -[ACCMemUsageStat update](self->_memUse, "update");
                if (!v171)
                  goto LABEL_172;
                -[NSObject timeIntervalSinceLastUpdate](v171, "timeIntervalSinceLastUpdate");
                if (v105 < 1.0)
                  goto LABEL_172;
                logObjectForModule();
                v103 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
                {
                  -[NSObject residentMem](v171, "residentMem");
                  v162 = (void *)objc_claimAutoreleasedReturnValue();
                  v150 = objc_msgSend(v162, "last");
                  -[NSObject residentMem](v171, "residentMem");
                  v160 = (void *)objc_claimAutoreleasedReturnValue();
                  v149 = objc_msgSend(v160, "last");
                  -[NSObject residentMem](v171, "residentMem");
                  v159 = (void *)objc_claimAutoreleasedReturnValue();
                  v148 = objc_msgSend(v159, "max");
                  -[NSObject residentMem](v171, "residentMem");
                  v158 = (void *)objc_claimAutoreleasedReturnValue();
                  v147 = objc_msgSend(v158, "max");
                  -[NSObject virtualMem](v171, "virtualMem");
                  v157 = (void *)objc_claimAutoreleasedReturnValue();
                  v146 = objc_msgSend(v157, "last");
                  -[NSObject virtualMem](v171, "virtualMem");
                  v156 = (void *)objc_claimAutoreleasedReturnValue();
                  v145 = objc_msgSend(v156, "last");
                  -[NSObject virtualMem](v171, "virtualMem");
                  v155 = (void *)objc_claimAutoreleasedReturnValue();
                  v144 = objc_msgSend(v155, "max");
                  -[NSObject virtualMem](v171, "virtualMem");
                  v154 = (void *)objc_claimAutoreleasedReturnValue();
                  v143 = objc_msgSend(v154, "max");
                  -[NSObject physFootprintMem](v171, "physFootprintMem");
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  v142 = objc_msgSend(v153, "last");
                  -[NSObject physFootprintMem](v171, "physFootprintMem");
                  v152 = (void *)objc_claimAutoreleasedReturnValue();
                  v113 = objc_msgSend(v152, "last");
                  -[NSObject physFootprintMem](v171, "physFootprintMem");
                  v151 = (void *)objc_claimAutoreleasedReturnValue();
                  v114 = objc_msgSend(v151, "max");
                  -[NSObject physFootprintMem](v171, "physFootprintMem");
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  v116 = objc_msgSend(v115, "max");
                  *(_DWORD *)buf = 134221568;
                  *(_QWORD *)v188 = v78;
                  *(_WORD *)&v188[8] = 1024;
                  *(_DWORD *)v189 = v166;
                  *(_WORD *)&v189[4] = 1024;
                  *(_DWORD *)&v189[6] = v170;
                  *(_WORD *)&v189[10] = 2048;
                  *(_QWORD *)&v189[12] = v150;
                  *(_WORD *)&v189[20] = 2048;
                  *(double *)&v189[22] = (double)v149 / 1000000.0;
                  *(_WORD *)&v189[30] = 2048;
                  *(_QWORD *)&v189[32] = v148;
                  *(_WORD *)&v189[40] = 2048;
                  *(double *)&v189[42] = (double)v147 / 1000000.0;
                  *(_WORD *)&v189[50] = 2048;
                  *(_QWORD *)&v189[52] = v146;
                  v190 = 2048;
                  v191 = (double)v145 / 1000000.0;
                  v192 = 2048;
                  v193 = v144;
                  v194 = 2048;
                  v195 = (double)v143 / 1000000.0;
                  v196 = 2048;
                  v197 = v142;
                  v198 = 2048;
                  v199 = (double)v113 / 1000000.0;
                  v200 = 2048;
                  v201 = v114;
                  v202 = 2048;
                  v203 = (double)v116 / 1000000.0;
                  _os_log_debug_impl(&dword_21A237000, v103, OS_LOG_TYPE_DEBUG, "_generatePlaybackQueueItemsWithPropertyList: %lu / %d / %d, memUse[resident=%llu(%.3fM)/%llu(%.3fM) virtual=%llu(%.3fM)/%llu(%.3fM) physFootprint=%llu(%.3fM)/=%llu(%.3fM)]", buf, 0x90u);

                }
              }

LABEL_172:
              v106 = (void *)v182[5];
              v182[5] = 0;

              v77 = v6 & 1;
              v107 = (v6 & 1) == 0 || v174 != 0;
              v108 = v80;
              v109 = (v80 & 1) == 0;
              if ((v80 & 1) != 0 && v107 && ++v78 < v166)
                continue;
              goto LABEL_191;
            }
            v93 = gLogObjects;
            v94 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v83 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)v188 = v93;
                *(_WORD *)&v188[8] = 1024;
                *(_DWORD *)v189 = v94;
                _os_log_error_impl(&dword_21A237000, v83, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v101 = v83;
            }
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134219266;
              *(_QWORD *)v188 = v78;
              *(_WORD *)&v188[8] = 2048;
              *(_QWORD *)v189 = v167 + v78;
              *(_WORD *)&v189[8] = 1024;
              *(_DWORD *)&v189[10] = v170;
              *(_WORD *)&v189[14] = 2048;
              *(_QWORD *)&v189[16] = v170;
              *(_WORD *)&v189[24] = 2048;
              *(_QWORD *)&v189[26] = v78;
              *(_WORD *)&v189[34] = 2080;
              *(_QWORD *)&v189[36] = v163;
              _os_log_impl(&dword_21A237000, v83, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: %lu [%lu / %d] Unexpected end of playback queue list, expected count=%lu but only got to index=%lu, systemMusicPlayer = %s", buf, 0x3Au);
            }
            v80 = 0;
            v6 = 1;
            goto LABEL_162;
          }
          v77 = 0;
LABEL_190:
          v109 = 0;
          v108 = 1;
LABEL_191:
          logObjectForModule();
          v122 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
          {
            v123 = -[NSObject count](v36, "count");
            *(_DWORD *)buf = 134218752;
            *(_QWORD *)v188 = v170;
            *(_WORD *)&v188[8] = 1024;
            *(_DWORD *)v189 = v77;
            *(_WORD *)&v189[4] = 1024;
            *(_DWORD *)&v189[6] = v108;
            *(_WORD *)&v189[10] = 2048;
            *(_QWORD *)&v189[12] = v123;
            _os_log_impl(&dword_21A237000, v122, OS_LOG_TYPE_INFO, "_generatePlaybackQueueItemsWithPropertyList: after iteration, count=%lu foundNonLibrary=%d pbqListAvailable=%d metaList.count=%lu", buf, 0x22u);
          }

          if (v109)
          {
            objc_msgSend(v174, "removeAllObjects");
            objc_msgSend(v11, "requestID");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "setObject:forKey:", v124, v168);

            objc_msgSend(v174, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE00CF8]);
          }

          _Block_object_dispose(&v181, 8);
          v119 = v173[2](v173, v175, v11, 0);
          if (v119)
          {
            v120 = v77 != 0;
            if (!v108)
            {
              v133 = 0;
LABEL_207:
              logObjectForModule();
              v134 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
              {
                v135 = -[NSObject count](v36, "count");
                objc_msgSend(v174, "objectForKey:", v164);
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                v6 = objc_msgSend(v136, "unsignedLongValue");
                -[NSObject timeIntervalSinceStart](v171, "timeIntervalSinceStart");
                *(_DWORD *)buf = 134219008;
                *(_QWORD *)v188 = v135;
                *(_WORD *)&v188[8] = 2048;
                *(_QWORD *)v189 = v6;
                *(_WORD *)&v189[8] = 1024;
                *(_DWORD *)&v189[10] = v120;
                *(_WORD *)&v189[14] = 1024;
                *(_DWORD *)&v189[16] = v133;
                *(_WORD *)&v189[20] = 2048;
                *(_QWORD *)&v189[22] = v137;
                _os_log_impl(&dword_21A237000, v134, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: End retrieving queued track items (count=%lu(req'd=%lu), foundNonLibrary=%d pbqListAvailable=%d): timeSinceStart=%f", buf, 0x2Cu);

              }
              objc_msgSend(v175, "accessoryUID");
              v138 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "requestID");
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              v172[2](v172, v138, v139, v174);

LABEL_212:
LABEL_45:

              -[ACCNowPlayingFeaturePlugin measureMemoryUsage](self, "measureMemoryUsage");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v38, "BOOLValue"))
              {
                v39 = self->_memUse == 0;

                if (!v39)
                {
                  -[ACCMemUsageStat update](self->_memUse, "update");
                  v40 = gNumLogObjects;
                  if (gLogObjects && gNumLogObjects >= 1)
                  {
                    v41 = *(id *)gLogObjects;
                  }
                  else
                  {
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
                    v41 = MEMORY[0x24BDACB70];
                    v42 = MEMORY[0x24BDACB70];
                  }
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v175, "accessoryUID");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "requestID");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = objc_msgSend(v11, "startIndex");
                    v46 = objc_msgSend(v11, "upToCount");
                    v47 = objc_msgSend(v11, "infoMask");
                    if (v171)
                    {
                      objc_msgSend(MEMORY[0x24BDBCE60], "date");
                      v40 = objc_claimAutoreleasedReturnValue();
                      -[NSObject startTime](v171, "startTime");
                      v6 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend((id)v40, "timeIntervalSinceDate:", v6);
                    }
                    else
                    {
                      v48 = 0;
                    }
                    memUse = self->_memUse;
                    *(_DWORD *)buf = 138414338;
                    *(_QWORD *)v188 = v43;
                    *(_WORD *)&v188[8] = 2112;
                    *(_QWORD *)v189 = v44;
                    *(_WORD *)&v189[8] = 1024;
                    *(_DWORD *)&v189[10] = v45;
                    *(_WORD *)&v189[14] = 1024;
                    *(_DWORD *)&v189[16] = v46;
                    *(_WORD *)&v189[20] = 1024;
                    *(_DWORD *)&v189[22] = v47;
                    *(_WORD *)&v189[26] = 2048;
                    *(_QWORD *)&v189[28] = v48;
                    *(_WORD *)&v189[36] = 1024;
                    *(_DWORD *)&v189[38] = v169;
                    *(_WORD *)&v189[42] = 1024;
                    *(_DWORD *)&v189[44] = v170;
                    *(_WORD *)&v189[48] = 2112;
                    *(_QWORD *)&v189[50] = memUse;
                    _os_log_impl(&dword_21A237000, v41, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: %@ requestID: %@ startIndex: %u upToCount: %u infoMask: 0x%x, \n  Finished in %f sec, curIndex=%d / %d, memUse:\n%@", buf, 0x48u);
                    if (v171)
                    {

                    }
                  }

                  if (gLogObjects && gNumLogObjects >= 1)
                  {
                    v56 = *(id *)gLogObjects;
                  }
                  else
                  {
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
                    v56 = MEMORY[0x24BDACB70];
                    v57 = MEMORY[0x24BDACB70];
                  }
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v188 = v171;
                    _os_log_impl(&dword_21A237000, v56, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: markStat: \nmark: \n%@", buf, 0xCu);
                  }

                  -[ACCMemUsageStat removeMark:](self->_memUse, "removeMark:", CFSTR("npPbqUpdateMark"));
                  v171 = 0;
                }
              }
              else
              {

              }
              v20 = v171;
              goto LABEL_83;
            }
LABEL_197:
            -[ACCNowPlayingFeaturePlugin playbackQueueInfoSendPartialOnTimeout](self, "playbackQueueInfoSendPartialOnTimeout");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v125, "intValue") == 3)
            {
              v126 = -[NSObject count](v36, "count") < v166;

              if (!v126)
              {
LABEL_204:
                objc_msgSend(v174, "setObject:forKey:", v36, *MEMORY[0x24BE00D08]);
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v120);
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v174, "setObject:forKey:", v131, *MEMORY[0x24BE00D10]);

                objc_msgSend(v174, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE00CF8]);
                if (v119 < 0)
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", -[NSObject count](v36, "count"));
                  v132 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v174, "setObject:forKey:", v132, v164);

                }
                v133 = 1;
                goto LABEL_207;
              }
              logObjectForModule();
              v127 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
              {
                v128 = -[NSObject count](v36, "count");
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)v188 = v166 - v128;
                _os_log_impl(&dword_21A237000, v127, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: list not full, fill %lu items with 0 pid!", buf, 0xCu);
              }

              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", &unk_24DC8C738, *MEMORY[0x24BE00D50], 0);
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              v129 = -[NSObject count](v36, "count");
              v130 = v166 - v129;
              if (v166 > v129)
              {
                do
                {
                  -[NSObject addObject:](v36, "addObject:", v125);
                  --v130;
                }
                while (v130);
              }
            }

            goto LABEL_204;
          }
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v117 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
            v117 = MEMORY[0x24BDACB70];
            v118 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21A237000, v117, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: no systemMusicPlayer!", buf, 2u);
          }

          v119 = v173[2](v173, v175, v11, 0);
          if (v119)
          {
            v120 = 0;
            goto LABEL_197;
          }
        }
        logObjectForModule();
        v138 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v175, "accessoryUID");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "requestID");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v188 = v140;
          *(_WORD *)&v188[8] = 2112;
          *(_QWORD *)v189 = v141;
          _os_log_impl(&dword_21A237000, v138, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: %@ requestID: %@, got continueCB false attempting to retrieve list, skip processing.", buf, 0x16u);

        }
        goto LABEL_212;
      }
      -[ACCMemUsageStat mark:](self->_memUse, "mark:", CFSTR("npPbqUpdateMark"));
      -[ACCMemUsageStat getMark:](self->_memUse, "getMark:", CFSTR("npPbqUpdateMark"));
      v171 = objc_claimAutoreleasedReturnValue();
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v18 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
        v18 = MEMORY[0x24BDACB70];
        v24 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v175, "accessoryUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "requestID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject residentMem](v171, "residentMem");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "start");
        -[NSObject virtualMem](v171, "virtualMem");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "start");
        -[NSObject physFootprintMem](v171, "physFootprintMem");
        v6 = objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend((id)v6, "start");
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)v188 = v25;
        *(_WORD *)&v188[8] = 2112;
        *(_QWORD *)v189 = v26;
        *(_WORD *)&v189[8] = 2048;
        *(_QWORD *)&v189[10] = v28;
        *(_WORD *)&v189[18] = 2048;
        *(_QWORD *)&v189[20] = v30;
        *(_WORD *)&v189[28] = 2048;
        *(_QWORD *)&v189[30] = v31;
        _os_log_impl(&dword_21A237000, v18, OS_LOG_TYPE_INFO, "_generatePlaybackQueueItemsWithPropertyList: %@ requestID: %@, memUse:[residentStart=%llu virtualStart=%llu ]hysFootprintStart=%llu]", buf, 0x34u);

      }
    }
    else
    {
      v171 = 0;
    }

    goto LABEL_33;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v20 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v20 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v175, "accessoryUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v188 = v22;
    *(_WORD *)&v188[8] = 2112;
    *(_QWORD *)v189 = v23;
    *(_WORD *)&v189[8] = 1024;
    *(_DWORD *)&v189[10] = v17;
    _os_log_impl(&dword_21A237000, v20, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: %@ requestID: %@, got continueCB=%d, @ enter, skip processing.", buf, 0x1Cu);

  }
LABEL_83:

}

void __114__ACCNowPlayingFeaturePlugin__generatePlaybackQueueItemsWithPropertyList_request_completionHandler_continueQuery___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "nowPlayingItemAtIndex:", *(_QWORD *)(a1 + 48) + *(unsigned int *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_nowPlayingAppIsIPodApp
{
  void *v2;
  void *v3;

  -[ACCNowPlayingFeaturePlugin cachedPlaybackAttributes](self, "cachedPlaybackAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BE00C90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (BOOL)_nowPlayingAppIsIPodRadio
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ACCNowPlayingFeaturePlugin cachedPlaybackAttributes](self, "cachedPlaybackAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BE00CE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "length") != 0;
  else
    v4 = 0;

  return v4;
}

- (BOOL)_nowPlayingIsStreaming
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v10;
  NSObject *v11;
  id v12;

  -[ACCNowPlayingFeaturePlugin cachedPlaybackAttributes](self, "cachedPlaybackAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE00CB0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACCNowPlayingFeaturePlugin cachedPlaybackAttributes](self, "cachedPlaybackAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE00CA8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedLongValue");
  v8 = -[ACCNowPlayingFeaturePlugin _nowPlayingAppIsIPodRadio](self, "_nowPlayingAppIsIPodRadio");
  v9 = v7 > 0x7FFFFFFE || v8;
  if (v7)
    v10 = v9;
  else
    v10 = 1;
  if (v10 && objc_msgSend(v4, "unsignedLongValue"))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ACCNowPlayingFeaturePlugin _nowPlayingIsStreaming].cold.1();

  }
  return v10;
}

- (void)_nowPlayingInfoDebounceTimerKick:(int)a3
{
  BOOL v5;
  id v6;
  NSObject *v7;
  unsigned int nowPlayingInfoDebounceTimerRunningMask;
  unsigned int v9;
  uint64_t v10;
  NSObject *nowPlayingInfoDebounceTimer;
  dispatch_time_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  unsigned int v16;
  int v17;
  int v18;
  __int16 v19;
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    nowPlayingInfoDebounceTimerRunningMask = self->_nowPlayingInfoDebounceTimerRunningMask;
    v17 = 67109376;
    v18 = a3;
    v19 = 1024;
    v20 = nowPlayingInfoDebounceTimerRunningMask;
    _os_log_impl(&dword_21A237000, v7, OS_LOG_TYPE_DEFAULT, "_nowPlayingInfoDebounceTimerKick: event = 0x%02x, _nowPlayingInfoDebounceTimerRunningMask = 0x%02x", (uint8_t *)&v17, 0xEu);
  }

  v9 = self->_nowPlayingInfoDebounceTimerRunningMask;
  if (!a3 || v9)
  {
    self->_nowPlayingInfoDebounceTimerRunningMask = v9 | a3;
  }
  else
  {
    self->_nowPlayingInfoDebounceTimerRunningMask = a3;
    v10 = -[ACCSettingsState intValue](self->_nowPlayingInfoDebounceTimerValue, "intValue");
    nowPlayingInfoDebounceTimer = self->_nowPlayingInfoDebounceTimer;
    v12 = dispatch_time(0, 1000000 * v10);
    if (v10 <= 1000)
      v13 = 1000000 * (v10 / 10);
    else
      v13 = 100000000;
    dispatch_source_set_timer(nowPlayingInfoDebounceTimer, v12, 0xFFFFFFFFFFFFFFFFLL, v13);
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = self->_nowPlayingInfoDebounceTimerRunningMask;
    v17 = 67109376;
    v18 = v9;
    v19 = 1024;
    v20 = v16;
    _os_log_impl(&dword_21A237000, v14, OS_LOG_TYPE_INFO, "_nowPlayingInfoDebounceTimerKick: _nowPlayingInfoDebounceTimerRunningMask 0x%02x -> 0x%02x", (uint8_t *)&v17, 0xEu);
  }

}

- (void)_nowPlayingInfoDebounceTimerStop:(int)a3
{
  BOOL v5;
  id v6;
  NSObject *v7;
  unsigned int nowPlayingInfoDebounceTimerRunningMask;
  unsigned int v9;
  NSObject *v10;
  id v11;
  unsigned int v12;
  int v13;
  int v14;
  __int16 v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    nowPlayingInfoDebounceTimerRunningMask = self->_nowPlayingInfoDebounceTimerRunningMask;
    v13 = 67109376;
    v14 = a3;
    v15 = 1024;
    v16 = nowPlayingInfoDebounceTimerRunningMask;
    _os_log_impl(&dword_21A237000, v7, OS_LOG_TYPE_DEFAULT, "_nowPlayingInfoDebounceTimerStop: event = 0x%02x, _nowPlayingInfoDebounceTimerRunningMask = 0x%02x", (uint8_t *)&v13, 0xEu);
  }

  v9 = self->_nowPlayingInfoDebounceTimerRunningMask;
  self->_nowPlayingInfoDebounceTimerRunningMask = v9 & ~a3;
  if ((v9 & ~a3) == 0)
    dispatch_source_set_timer((dispatch_source_t)self->_nowPlayingInfoDebounceTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v10 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = self->_nowPlayingInfoDebounceTimerRunningMask;
    v13 = 67109376;
    v14 = v9;
    v15 = 1024;
    v16 = v12;
    _os_log_impl(&dword_21A237000, v10, OS_LOG_TYPE_INFO, "_nowPlayingInfoDebounceTimerStop: _nowPlayingInfoDebounceTimerRunningMask 0x%02x -> 0x%02x", (uint8_t *)&v13, 0xEu);
  }

}

+ (BOOL)isMusicAppVisible
{
  if (GetMediaLibraryHelper___mediaLibraryHelperInitOnce != -1)
    dispatch_once(&GetMediaLibraryHelper___mediaLibraryHelperInitOnce, &__block_literal_global);
  return objc_msgSend((id)GetMediaLibraryHelper___mediaLibraryHelper, "showMusic");
}

+ (id)getItemDictionaryForContentItem:(id)a3 infoMask:(unsigned int)a4
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a3;
  v6 = 0;
  if (v5 && a4)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = 0;
    v20 = *MEMORY[0x24BDDBB38];
    v19 = *MEMORY[0x24BE00D40];
    v27 = *MEMORY[0x24BDDBB78];
    v26 = *MEMORY[0x24BE00D48];
    v8 = *MEMORY[0x24BDDBAE0];
    v25 = *MEMORY[0x24BE00D28];
    v9 = *MEMORY[0x24BDDBB10];
    v24 = *MEMORY[0x24BE00D38];
    v10 = *MEMORY[0x24BDDBAF8];
    v23 = *MEMORY[0x24BE00D30];
    v11 = *MEMORY[0x24BDDBCD8];
    v22 = *MEMORY[0x24BE00D58];
    v21 = *MEMORY[0x24BE00D50];
    do
    {
      if (((a4 >> v7) & 1) != 0)
      {
        if (v7 > 11)
        {
          switch(v7)
          {
            case 12:
              objc_msgSend(v5, "valueForProperty:", v9);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v12)
                goto LABEL_23;
              v13 = v6;
              v14 = v12;
              v15 = v24;
              goto LABEL_22;
            case 14:
              objc_msgSend(v5, "valueForProperty:", v8);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v12)
                goto LABEL_23;
              v13 = v6;
              v14 = v12;
              v15 = v25;
              goto LABEL_22;
            case 16:
              objc_msgSend(v5, "valueForProperty:", v27);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v12)
                goto LABEL_23;
              v13 = v6;
              v14 = v12;
              v15 = v26;
              goto LABEL_22;
            case 18:
              objc_msgSend(v5, "valueForProperty:", v20);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                objc_msgSend(v6, "setObject:forKey:", v18, v19);

              goto LABEL_25;
            default:
              goto LABEL_24;
          }
        }
        if (v7)
        {
          if (v7 == 1)
          {
            objc_msgSend(v5, "valueForProperty:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v13 = v6;
              v14 = v12;
              v15 = v22;
LABEL_22:
              objc_msgSend(v13, "setObject:forKey:", v14, v15);
            }
LABEL_23:

            goto LABEL_24;
          }
          if (v7 == 6)
          {
            objc_msgSend(v5, "valueForProperty:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v13 = v6;
              v14 = v12;
              v15 = v23;
              goto LABEL_22;
            }
            goto LABEL_23;
          }
        }
        else
        {
          v16 = objc_msgSend(v5, "persistentID");
          if (v16)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v16);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v6;
            v14 = v12;
            v15 = v21;
            goto LABEL_22;
          }
        }
      }
LABEL_24:
      ++v7;
    }
    while (v7 != 19);
  }
LABEL_25:

  return v6;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (AccessoryNowPlayingClient)nowPlayingClient
{
  return self->_nowPlayingClient;
}

- (void)setNowPlayingClient:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingClient, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (OS_dispatch_source)nowPlayingInfoDebounceTimer
{
  return self->_nowPlayingInfoDebounceTimer;
}

- (void)setNowPlayingInfoDebounceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingInfoDebounceTimer, a3);
}

- (unsigned)nowPlayingInfoDebounceTimerRunningMask
{
  return self->_nowPlayingInfoDebounceTimerRunningMask;
}

- (void)setNowPlayingInfoDebounceTimerRunningMask:(unsigned int)a3
{
  self->_nowPlayingInfoDebounceTimerRunningMask = a3;
}

- (ACCSettingsState)nowPlayingInfoDebounceTimerValue
{
  return self->_nowPlayingInfoDebounceTimerValue;
}

- (NSMutableDictionary)cachedMediaItemAttributes
{
  return self->_cachedMediaItemAttributes;
}

- (void)setCachedMediaItemAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMediaItemAttributes, a3);
}

- (NSData)cachedMediaItemArtworkHash
{
  return self->_cachedMediaItemArtworkHash;
}

- (void)setCachedMediaItemArtworkHash:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMediaItemArtworkHash, a3);
}

- (NSMutableDictionary)cachedPlaybackAttributes
{
  return self->_cachedPlaybackAttributes;
}

- (void)setCachedPlaybackAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPlaybackAttributes, a3);
}

- (NSMutableDictionary)pbqUpdateAccessoryList
{
  return self->_pbqUpdateAccessoryList;
}

- (void)setPbqUpdateAccessoryList:(id)a3
{
  objc_storeStrong((id *)&self->_pbqUpdateAccessoryList, a3);
}

- (ACCSettingsState)maxPlaybackQueueInfoCount
{
  return self->_maxPlaybackQueueInfoCount;
}

- (void)setMaxPlaybackQueueInfoCount:(id)a3
{
  objc_storeStrong((id *)&self->_maxPlaybackQueueInfoCount, a3);
}

- (ACCSettingsState)playbackQueueInfoTimeoutMs
{
  return self->_playbackQueueInfoTimeoutMs;
}

- (void)setPlaybackQueueInfoTimeoutMs:(id)a3
{
  objc_storeStrong((id *)&self->_playbackQueueInfoTimeoutMs, a3);
}

- (ACCSettingsState)playbackQueueInfoSendPartialOnTimeout
{
  return self->_playbackQueueInfoSendPartialOnTimeout;
}

- (void)setPlaybackQueueInfoSendPartialOnTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_playbackQueueInfoSendPartialOnTimeout, a3);
}

- (ACCSettingsState)measureMemoryUsage
{
  return self->_measureMemoryUsage;
}

- (void)setMeasureMemoryUsage:(id)a3
{
  objc_storeStrong((id *)&self->_measureMemoryUsage, a3);
}

- (ACCMemUsageStat)memUse
{
  return self->_memUse;
}

- (void)setMemUse:(id)a3
{
  objc_storeStrong((id *)&self->_memUse, a3);
}

- (OS_dispatch_queue)nowPlayingInfoPBQueueListQ
{
  return self->_nowPlayingInfoPBQueueListQ;
}

- (void)setNowPlayingInfoPBQueueListQ:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingInfoPBQueueListQ, a3);
}

- (MPMusicPlayerController)mpMusicPlayerControllerHandler
{
  return self->_mpMusicPlayerControllerHandler;
}

- (void)setMpMusicPlayerControllerHandler:(id)a3
{
  objc_storeStrong((id *)&self->_mpMusicPlayerControllerHandler, a3);
}

- (OS_dispatch_queue)mpMusicPlayerControllerQueue
{
  return self->_mpMusicPlayerControllerQueue;
}

- (void)setMpMusicPlayerControllerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mpMusicPlayerControllerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mpMusicPlayerControllerQueue, 0);
  objc_storeStrong((id *)&self->_mpMusicPlayerControllerHandler, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoPBQueueListQ, 0);
  objc_storeStrong((id *)&self->_memUse, 0);
  objc_storeStrong((id *)&self->_measureMemoryUsage, 0);
  objc_storeStrong((id *)&self->_playbackQueueInfoSendPartialOnTimeout, 0);
  objc_storeStrong((id *)&self->_playbackQueueInfoTimeoutMs, 0);
  objc_storeStrong((id *)&self->_maxPlaybackQueueInfoCount, 0);
  objc_storeStrong((id *)&self->_pbqUpdateAccessoryList, 0);
  objc_storeStrong((id *)&self->_cachedPlaybackAttributes, 0);
  objc_storeStrong((id *)&self->_cachedMediaItemArtworkHash, 0);
  objc_storeStrong((id *)&self->_cachedMediaItemAttributes, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoDebounceTimerValue, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoDebounceTimer, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nowPlayingClient, 0);
}

- (void)currentMediaItemAttributes
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_21A237000, v0, v1, "currentMediaItemAttributes mediaItemAttributes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__ACCNowPlayingFeaturePlugin_currentMediaItemAttributes__block_invoke_138_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_21A237000, v0, v1, "MRMediaRemoteGetSupportedCommands() returned commands array = NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)currentMediaItemArtworkOriginal
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_21A237000, v0, v1, "#Artwork Requesting artwork for current now playing item...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)currentMediaItemArtwork
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_21A237000, a2, v3, "#Artwork artworkData.length: %lu bytes", v4);
  OUTLINED_FUNCTION_10();
}

- (void)currentPlaybackAttributes
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_21A237000, v0, v1, "currentPlaybackAttributes playbackAttributes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__ACCNowPlayingFeaturePlugin_currentPlaybackAttributes__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21A237000, v0, v1, "currentPlaybackAttributes nowPlayingInfo: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __52__ACCNowPlayingFeaturePlugin_setPlaybackQueueIndex___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_21A237000, v0, v1, "Couldn't get systemMusicPlayer instance!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __52__ACCNowPlayingFeaturePlugin_setPlaybackQueueIndex___block_invoke_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12();
  _os_log_error_impl(&dword_21A237000, v0, OS_LOG_TYPE_ERROR, "Couldn't find mediaItem at index %@!", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21A237000, v0, v1, "requestPlaybackQueueListInfo: completionCB: %@ remove accessory from list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __75__ACCNowPlayingFeaturePlugin_cancelRequestPlaybackQueueListInfo_requestID___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21A237000, v0, v1, "cancelRequestPlaybackQueueListInfo: reset currentRequest for accessory=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __75__ACCNowPlayingFeaturePlugin_cancelRequestPlaybackQueueListInfo_requestID___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21A237000, v0, v1, "cancelRequestPlaybackQueueListInfo: accessory=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_nowPlayingIsStreaming
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21A237000, v0, v1, "_nowPlayingIsStreaming: Got bogus QueueIndex(%@) for streaming playback!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
