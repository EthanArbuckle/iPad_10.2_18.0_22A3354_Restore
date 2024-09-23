@implementation MPCPlayerItemConfigurator

- (MPCPlayerItemConfigurator)initWithPlaybackEngine:(id)a3 stackController:(id)a4 translator:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPCPlayerItemConfigurator *v11;
  MPCPlayerItemConfigurator *v12;
  void *v13;
  uint64_t v14;
  MPPlaybackEQSetting *eqSetting;
  MPCAudioAssetTypeSelector *v16;
  MPCAudioAssetTypeSelector *audioAssetTypeSelector;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MPCPlayerItemConfigurator;
  v11 = -[MPCPlayerItemConfigurator init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_playbackEngine, v8);
    objc_msgSend(v8, "addEngineObserver:", v12);
    objc_storeWeak((id *)&v12->_stackController, v9);
    objc_storeWeak((id *)&v12->_translator, v10);
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "musicEQSetting");
    v14 = objc_claimAutoreleasedReturnValue();
    eqSetting = v12->_eqSetting;
    v12->_eqSetting = (MPPlaybackEQSetting *)v14;

    v16 = -[MPCAudioAssetTypeSelector initWithPlaybackEngine:]([MPCAudioAssetTypeSelector alloc], "initWithPlaybackEngine:", v8);
    audioAssetTypeSelector = v12->_audioAssetTypeSelector;
    v12->_audioAssetTypeSelector = v16;

    -[MPCPlayerItemConfigurator _setupNotifications](v12, "_setupNotifications");
    -[MPCPlayerItemConfigurator _setupRoutingController](v12, "_setupRoutingController");
    -[MPCPlayerItemConfigurator _setupPlayer](v12, "_setupPlayer");
  }

  return v12;
}

- (void)_setupRoutingController
{
  id v3;
  objc_class *v4;
  void *v5;
  MPAVRoutingController *v6;
  MPAVRoutingController *routingController;

  v3 = objc_alloc(MEMORY[0x24BDDC6D0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (MPAVRoutingController *)objc_msgSend(v3, "initWithName:", v5);
  routingController = self->_routingController;
  self->_routingController = v6;

  -[MPAVRoutingController setFetchAvailableRoutesSynchronously:](self->_routingController, "setFetchAvailableRoutesSynchronously:", 1);
  -[MPAVRoutingController setDelegate:](self->_routingController, "setDelegate:", self);
}

- (void)_setupNotifications
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__playbackUserDefaultsEQPresetDidChangeNotification_, *MEMORY[0x24BDDC538], v5);
  v4 = *MEMORY[0x24BDDC540];
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__preferredResolutionDidChange_, *MEMORY[0x24BDDC540], v5);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__highQualityMusicStreamingOnCellularDidChange_, v4, v5);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__soundCheckEnabledChangedNotification_, *MEMORY[0x24BDDC550], v5);

}

- (void)routingController:(id)a3 pickedRoutesDidChange:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  MPCPlayerItemConfigurator *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "engineID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v8;
    v11 = 2048;
    v12 = self;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - Route changed to %{public}@", (uint8_t *)&v9, 0x20u);

  }
  -[MPCPlayerItemConfigurator updateCurrentAudioRouteWithPickedRoutes:](self, "updateCurrentAudioRouteWithPickedRoutes:", v5);
  -[MPCPlayerItemConfigurator _updateQueueItemsAndPlayerForFormatChangeIfRequired](self, "_updateQueueItemsAndPlayerForFormatChangeIfRequired");

}

- (void)updateCurrentAudioRouteWithPickedRoutes:(id)a3
{
  MPCPlayerItemConfigurator *v4;
  MPCPlayerAudioRoute *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  MPCPlayerAudioRoute *currentAudioRoute;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = [MPCPlayerAudioRoute alloc];
  objc_msgSend(v10, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerItemConfigurator audioAssetTypeSelector](v4, "audioAssetTypeSelector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPCPlayerAudioRoute initWithRoute:spatialIsAlwaysOn:](v5, "initWithRoute:spatialIsAlwaysOn:", v6, objc_msgSend(v7, "spatialIsAlwaysOn"));
  currentAudioRoute = v4->_currentAudioRoute;
  v4->_currentAudioRoute = (MPCPlayerAudioRoute *)v8;

  objc_sync_exit(v4);
}

- (id)queuedItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[MPCPlayerItemConfigurator stackController](self, "stackController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count") + 1);
  -[MPCPlayerItemConfigurator currentItem](self, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[MPCPlayerItemConfigurator _modeObjectForPlayerItem:](self, "_modeObjectForPlayerItem:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (void)_setupPlayer
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  int v11;
  void *v12;
  __int16 v13;
  MPCPlayerItemConfigurator *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[MPCPlayerItemConfigurator currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerItemConfigurator audioAssetTypeSelector](self, "audioAssetTypeSelector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "spatialIsOff");

  -[MPCPlayerItemConfigurator stackController](self, "stackController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSpatializationFormat:", v5 ^ 1u);

  -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "engineID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("Default device capability");
    v11 = 138544130;
    v13 = 2048;
    v12 = v9;
    if (v5)
      v10 = CFSTR("Forced stereo");
    v14 = self;
    v15 = 2114;
    v16 = v10;
    v17 = 2114;
    v18 = v3;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - AVPlayer setup: %{public}@ - currentItem: %{public}@", (uint8_t *)&v11, 0x2Au);

  }
}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (MPCModelGenericAVItem)currentItem
{
  void *v3;
  void *v4;
  void *v5;

  -[MPCPlayerItemConfigurator stackController](self, "stackController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerItemConfigurator _modeObjectForPlayerItem:](self, "_modeObjectForPlayerItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPCModelGenericAVItem *)v5;
}

- (MFPlaybackStackController)stackController
{
  return (MFPlaybackStackController *)objc_loadWeakRetained((id *)&self->_stackController);
}

- (id)_modeObjectForPlayerItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "isAssetLoaded"))
  {
    -[MPCPlayerItemConfigurator translator](self, "translator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "MPAVItemForMFPlayerItem:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MPCAudioAssetTypeSelector)audioAssetTypeSelector
{
  return self->_audioAssetTypeSelector;
}

- (void)_updateQueueItemsAndPlayerForFormatChangeIfRequired
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[MPCPlayerItemConfigurator currentAudioRoute](self, "currentAudioRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MPCPlayerItemConfigurator queuedItems](self, "queuedItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MPCPlayerItemConfigurator _updatePreferredAudioFormatIfRequiredForItem:route:](self, "_updatePreferredAudioFormatIfRequiredForItem:route:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[MPCPlayerItemConfigurator _setupPlayer](self, "_setupPlayer");
}

- (MPCPlayerAudioRoute)currentAudioRoute
{
  MPCPlayerItemConfigurator *v2;
  MPCPlayerAudioRoute *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  MPCPlayerAudioRoute *currentAudioRoute;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_currentAudioRoute)
  {
    v3 = [MPCPlayerAudioRoute alloc];
    -[MPAVRoutingController pickedRoutes](v2->_routingController, "pickedRoutes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayerItemConfigurator audioAssetTypeSelector](v2, "audioAssetTypeSelector");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MPCPlayerAudioRoute initWithRoute:spatialIsAlwaysOn:](v3, "initWithRoute:spatialIsAlwaysOn:", v5, objc_msgSend(v6, "spatialIsAlwaysOn"));
    currentAudioRoute = v2->_currentAudioRoute;
    v2->_currentAudioRoute = (MPCPlayerAudioRoute *)v7;

  }
  objc_sync_exit(v2);

  return v2->_currentAudioRoute;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MPCPlayerItemConfigurator;
  -[MPCPlayerItemConfigurator dealloc](&v4, sel_dealloc);
}

- (BOOL)configureQueueItem:(id)a3 playerItem:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id *v65;
  void *v66;
  int v67;
  void *v68;
  _QWORD v69[11];
  _QWORD v70[11];
  _QWORD v71[2];
  _QWORD v72[2];
  _BYTE buf[12];
  __int16 v74;
  MPCPlayerItemConfigurator *v75;
  __int16 v76;
  id v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "engineID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v12;
    v74 = 2048;
    v75 = self;
    v76 = 2114;
    v77 = v8;
    v78 = 2114;
    v79 = v9;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - Configuring queue item:%{public}@ player item:%{public}@", buf, 0x2Au);

  }
  objc_msgSend(v8, "queueSectionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queueItemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13)
    v17 = v14 == 0;
  else
    v17 = 1;
  v18 = !v17;
  v67 = v18;
  if (!v17)
  {
    objc_msgSend(v15, "eventStream");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = CFSTR("queue-section-id");
    v71[1] = CFSTR("queue-item-id");
    v72[0] = v13;
    v72[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "emitEventType:payload:", CFSTR("item-configuration-begin"), v20);

  }
  objc_msgSend(v8, "contentItemID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentItemID:", v21);

  objc_msgSend(v8, "description");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v22);

  objc_msgSend(v9, "setPrefersSeekOverSkip:", objc_msgSend(v8, "prefersSeekOverSkip"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v8;
    if ((objc_msgSend(v23, "isRadioStreamPlayback") & 1) != 0)
    {
      v24 = CFSTR("radio-stream");
    }
    else
    {
      if (!objc_msgSend(v23, "isRadioPlayback"))
      {
LABEL_17:

        goto LABEL_18;
      }
      v24 = CFSTR("radio");
    }
    objc_msgSend(v9, "setModelTypeName:", v24);
    objc_msgSend(v23, "stationStringID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setModelStringID:", v25);

    goto LABEL_17;
  }
LABEL_18:
  objc_msgSend(v8, "initialPlaybackStartTimeOverride");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v8, "playbackInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_expectedStopTimeWithPlaybackInfo:", v27);
    v29 = v28;
    if (v28 > 2.22044605e-16)
    {
      objc_msgSend(v26, "doubleValue");
      if (v30 + 0.01 >= v29)
        objc_msgSend(v8, "setInitialPlaybackStartTimeOverride:", 0);
    }

  }
  objc_msgSend(v8, "setupWithPlaybackInfo");
  -[MPCPlayerItemConfigurator eqSetting](self, "eqSetting");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (int)objc_msgSend(v31, "avPreset");

  objc_msgSend(v8, "setupEQPresetWithDefaultPreset:", v32);
  objc_msgSend(v8, "_applyLoudnessInfo");
  objc_msgSend(v8, "feeder");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applyVolumeNormalizationForItem:", v8);

  objc_msgSend(v9, "_setTimeJumpedNotificationIncludesExtendedDiagnosticPayload:", 1);
  if (objc_msgSend(v16, "isVocalAttenuationEnabled"))
  {
    -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v34, "engineID");
      v65 = a5;
      v36 = v26;
      v37 = v16;
      v38 = v14;
      v39 = v13;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v40;
      v74 = 2048;
      v75 = self;
      v76 = 2114;
      v77 = v8;
      _os_log_impl(&dword_210BD8000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AP] - Configuring item for Suntory: %{public}@", buf, 0x20u);

      v13 = v39;
      v14 = v38;
      v16 = v37;
      v26 = v36;
      a5 = v65;
    }

    objc_msgSend(v16, "vocalAttenuationController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConfiguredForVocalAttenuation:", objc_msgSend(v41, "configureQueueItem:", v8));
  }
  else
  {
    if (!objc_msgSend(v16, "isAudioAnalyzerEnabled"))
      goto LABEL_30;
    objc_msgSend(v16, "audioAnalyzer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "configurePlayerItem:", v9);
  }

LABEL_30:
  *(_QWORD *)buf = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_41;
  v42 = v8;
  if (!objc_msgSend(v42, "isHLSAsset"))
    goto LABEL_39;
  if (objc_msgSend(v42, "loadedAudioAssetType") < 3)
  {
    if ((objc_msgSend(v42, "hasVideo") & 1) != 0
      || (objc_msgSend(v42, "isRadioStreamPlayback") & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v42, "isHLSAsset"))
    {
      -[MPCPlayerItemConfigurator _setupQueueItemForHLSPlayback:playerItem:](self, "_setupQueueItemForHLSPlayback:playerItem:", v42, v9);
      goto LABEL_40;
    }
LABEL_39:
    -[MPCPlayerItemConfigurator _setupQueueItemForLossyAudioPlayback:playerItem:](self, "_setupQueueItemForLossyAudioPlayback:playerItem:", v42, v9);
    goto LABEL_40;
  }
  -[MPCPlayerItemConfigurator _setupQueueItemForEnhancedAudioHLSPlayback:playerItem:metadataWaitTime:error:](self, "_setupQueueItemForEnhancedAudioHLSPlayback:playerItem:metadataWaitTime:error:", v42, v9, buf, a5);
LABEL_40:

LABEL_41:
  if (v67)
  {
    v62 = v26;
    objc_msgSend(v16, "eventStream");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = CFSTR("queue-section-id");
    v70[0] = v13;
    v70[1] = v14;
    v69[1] = CFSTR("queue-item-id");
    v69[2] = CFSTR("item-configured-eq");
    v43 = (void *)MEMORY[0x24BDD16E0];
    -[MPCPlayerItemConfigurator eqSetting](self, "eqSetting");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "numberWithInteger:", objc_msgSend(v61, "preset"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v70[2] = v60;
    v69[3] = CFSTR("item-configured-sc-vol-normalization");
    v44 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v8, "soundCheckVolumeNormalization");
    objc_msgSend(v44, "numberWithFloat:");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v70[3] = v59;
    v69[4] = CFSTR("item-configured-loudness");
    objc_msgSend(v9, "loudnessInfo");
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)v45;
    if (!v45)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v45 = objc_claimAutoreleasedReturnValue();
    }
    v47 = v13;
    v70[4] = v45;
    v69[5] = CFSTR("hls-metadata-wait-time");
    v48 = v16;
    if (*(double *)buf > 0.0)
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)buf, v45);
    else
      objc_msgSend(MEMORY[0x24BDBCEF8], "null", *(double *)buf, v45);
    v64 = v14;
    v66 = v47;
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v70[5] = v58;
    v69[6] = CFSTR("audio-route");
    -[MPCPlayerItemConfigurator currentAudioRoute](self, "currentAudioRoute");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (!v49)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v70[6] = v50;
    v69[7] = CFSTR("supports-vocal-attenuation");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "supportsVocalAttenuation"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v70[7] = v51;
    v69[8] = CFSTR("vocal-attenuation-configured");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "isConfiguredForVocalAttenuation"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v70[8] = v52;
    v69[9] = CFSTR("vocal-attenuation-available");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v48, "isVocalAttenuationAvailable"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v70[9] = v53;
    v69[10] = CFSTR("vocal-attenuation-enabled");
    v63 = v48;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v48, "isVocalAttenuationEnabled"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v70[10] = v54;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 11);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "emitEventType:payload:", CFSTR("item-configuration-end"), v55);

    if (!v49)
    v14 = v64;
    v13 = v66;
    v26 = v62;
    if (!v46)

    v16 = v63;
  }

  return 1;
}

- (void)_highQualityMusicStreamingOnCellularDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__MPCPlayerItemConfigurator__highQualityMusicStreamingOnCellularDidChange___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_playbackUserDefaultsEQPresetDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__MPCPlayerItemConfigurator__playbackUserDefaultsEQPresetDidChangeNotification___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_soundCheckEnabledChangedNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  MPCPlayerItemConfigurator *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "engineID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v10 = v6;
    v11 = 2048;
    v12 = self;
    v13 = 1024;
    v14 = objc_msgSend(v7, "soundCheckEnabled");
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p: _soundCheckEnabledChangedNotification soundCheckEnabled=%{BOOL}u", buf, 0x1Cu);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__MPCPlayerItemConfigurator__soundCheckEnabledChangedNotification___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_preferredResolutionDidChange:(id)a3
{
  void *v4;
  id v5;

  -[MPCPlayerItemConfigurator stackController](self, "stackController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isAssetLoaded"))
    -[MPCPlayerItemConfigurator setupDefaultsDebouncer](self, "setupDefaultsDebouncer");

}

- (void)setupDefaultsDebouncer
{
  void *v3;
  dispatch_source_t v4;
  dispatch_time_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD handler[5];
  id v10;
  id location;

  -[MPCPlayerItemConfigurator tearDownDefaultsDebouncer](self, "tearDownDefaultsDebouncer");
  -[MPCPlayerItemConfigurator userDefaultsDebouncer](self, "userDefaultsDebouncer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    -[MPCPlayerItemConfigurator setUserDefaultsDebouncer:](self, "setUserDefaultsDebouncer:", v4);

    v5 = dispatch_time(0, 300000000);
    -[MPCPlayerItemConfigurator userDefaultsDebouncer](self, "userDefaultsDebouncer");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v6, v5, 0xFFFFFFFFFFFFFFFFLL, 0);

    objc_initWeak(&location, self);
    -[MPCPlayerItemConfigurator userDefaultsDebouncer](self, "userDefaultsDebouncer");
    v7 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __51__MPCPlayerItemConfigurator_setupDefaultsDebouncer__block_invoke;
    handler[3] = &unk_24CAB59B8;
    objc_copyWeak(&v10, &location);
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);

    -[MPCPlayerItemConfigurator userDefaultsDebouncer](self, "userDefaultsDebouncer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)tearDownDefaultsDebouncer
{
  void *v3;
  NSObject *v4;

  -[MPCPlayerItemConfigurator userDefaultsDebouncer](self, "userDefaultsDebouncer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MPCPlayerItemConfigurator userDefaultsDebouncer](self, "userDefaultsDebouncer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[MPCPlayerItemConfigurator setUserDefaultsDebouncer:](self, "setUserDefaultsDebouncer:", 0);
  }
}

- (void)processAudioQualityChanges
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  MPCPlayerItemConfigurator *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MPCPlayerItemConfigurator currentItem](self, "currentItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isVocalAttenuationEnabled") & 1) == 0)
    {
      if (v4)
      {
        v5 = -[MPCPlayerItemConfigurator _shouldReloadEntireQueue](self, "_shouldReloadEntireQueue");
        -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        if (v5)
        {
          if (v8)
          {
            objc_msgSend(v6, "engineID");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCPlayerItemConfigurator queuedItems](self, "queuedItems");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v15 = v9;
            v16 = 2048;
            v17 = self;
            v18 = 2114;
            v19 = v10;
            _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - Preferred asset type changed [reloading all queued items] - items:%{public}@", buf, 0x20u);

          }
          v13[0] = MEMORY[0x24BDAC760];
          v13[1] = 3221225472;
          v13[2] = __55__MPCPlayerItemConfigurator_processAudioQualityChanges__block_invoke;
          v13[3] = &unk_24CAB6D88;
          v13[4] = self;
          objc_msgSend(v3, "reloadQueueForReason:completion:", 0, v13);
        }
        else
        {
          if (v8)
          {
            objc_msgSend(v6, "engineID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCPlayerItemConfigurator queuedItems](self, "queuedItems");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v15 = v11;
            v16 = 2048;
            v17 = self;
            v18 = 2114;
            v19 = v12;
            _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - Preferred asset type changed [reconfiguring all queued items & player] - items:%{public}@", buf, 0x20u);

          }
          -[MPCPlayerItemConfigurator _updateQueueItemsAndPlayerForFormatChangeIfRequired](self, "_updateQueueItemsAndPlayerForFormatChangeIfRequired");
        }
      }
      else
      {
        -[MPCPlayerItemConfigurator _setupPlayer](self, "_setupPlayer");
      }
    }

  }
}

- (BOOL)_setupQueueItemForEnhancedAudioHLSPlayback:(id)a3 playerItem:(id)a4 metadataWaitTime:(double *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  uint64_t v15;
  id v16;
  BOOL v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  MPCPlayerAudioFormatSelection *v22;
  void *v23;
  void *v24;
  void *v25;
  MPCPlayerAudioFormatSelection *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  unsigned int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  const __CFString *v58;
  void *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  MPCPlayerItemConfigurator *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v11, "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v11, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    -[MPCPlayerItemConfigurator _audioFormatsDictionaryWithHLSMetadataFromAsset:metadataWaitTime:error:](self, "_audioFormatsDictionaryWithHLSMetadataFromAsset:metadataWaitTime:error:", v14, a5, &v57);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v57;
    v17 = v16 == 0;
    if (v16)
    {
      v55 = v14;
      -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v18, "engineID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v61 = v20;
        v62 = 2048;
        v63 = self;
        v64 = 2114;
        v65 = v10;
        v66 = 2114;
        v67 = v16;
        _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_ERROR, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - Error retrieving audio formats - item:%{public}@ - error:%{public}@", buf, 0x2Au);

      }
      v21 = (void *)v15;

      v22 = [MPCPlayerAudioFormatSelection alloc];
      v58 = CFSTR("Error");
      objc_msgSend(v16, "debugDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (!v23)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v59 = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[MPCPlayerAudioFormatSelection initWithExplanation:justification:](v22, "initWithExplanation:justification:", CFSTR(" Error retrieving audio formats"), v25);

      if (!v23)
      -[MPCPlayerItemConfigurator _emitAudioFormatSelection:item:](self, "_emitAudioFormatSelection:item:", v26, v10);
      v27 = v21;
      if (a6)
        *a6 = objc_retainAutorelease(v16);
      v14 = v55;
      v17 = 0;
    }
    else
    {
      v53 = (void *)v15;
      if (v15)
      {
        v56 = v14;
        objc_msgSend(v10, "updateAudioFormatsDictionary:", v15);
        v28 = objc_msgSend(v10, "isDownloadedAsset");
        -[MPCPlayerItemConfigurator audioAssetTypeSelector](self, "audioAssetTypeSelector");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v28;
        if (v28)
        {
          v30 = objc_msgSend(v10, "loadedAudioAssetType");
          objc_msgSend(v10, "availableSortedFormats");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayerItemConfigurator currentAudioRoute](self, "currentAudioRoute");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "audioFormatMatchingAudioAssetType:formats:route:", v30, v31, v32);
        }
        else
        {
          objc_msgSend(v10, "availableSortedFormats");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCPlayerItemConfigurator currentAudioRoute](self, "currentAudioRoute");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "preferredAudioFormatForAudioFormats:route:", v31, v32);
        }
        v26 = (MPCPlayerAudioFormatSelection *)objc_claimAutoreleasedReturnValue();

        -[MPCPlayerAudioFormatSelection format](v26, "format");
        v39 = objc_claimAutoreleasedReturnValue();
        -[MPCPlayerItemConfigurator _emitAudioFormatSelection:item:](self, "_emitAudioFormatSelection:item:", v26, v10);
        -[MPCPlayerItemConfigurator currentAudioRoute](self, "currentAudioRoute");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAudioRoute:", v40);

        v54 = (void *)v39;
        objc_msgSend(v10, "updatePreferredFormat:", v39);
        -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v41, "engineID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "preferredFormat");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v61 = v43;
          v62 = 2048;
          v63 = self;
          v64 = 2114;
          v65 = v10;
          v66 = 2114;
          v67 = v44;
          _os_log_impl(&dword_210BD8000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - Audio formats available in HLS session data [Setting up player item] - item:%{public}@ - Preferred format:%{public}@", buf, 0x2Au);

        }
        objc_msgSend(v10, "preferredFormat");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayerItemConfigurator audioAssetTypeSelector](self, "audioAssetTypeSelector");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "mpc_setupWithPlayerAudioFormat:forceSpatial:downloadedAsset:", v45, objc_msgSend(v46, "spatialIsAlwaysOn"), v52);

        -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v47, "engineID");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "mpc_setupDescription");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v61 = v49;
          v62 = 2048;
          v63 = self;
          v64 = 2114;
          v65 = v50;
          v66 = 2114;
          v67 = v10;
          _os_log_impl(&dword_210BD8000, v48, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - AVPlayerItem setup:%{public}@ - item:%{public}@", buf, 0x2Au);

        }
        v14 = v56;
      }
      else
      {
        -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v33, "engineID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v61 = v35;
          v62 = 2048;
          v63 = self;
          v64 = 2114;
          v65 = v10;
          _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - No audio formats in HLS session data [Setting up player item using preferred audio asset type] - item:%{public}@", buf, 0x20u);

        }
        v26 = -[MPCPlayerAudioFormatSelection initWithExplanation:justification:]([MPCPlayerAudioFormatSelection alloc], "initWithExplanation:justification:", CFSTR("No audio formats in HLS session data [Attempting setup with preferred type]"), 0);
        -[MPCPlayerItemConfigurator _emitAudioFormatSelection:item:](self, "_emitAudioFormatSelection:item:", v26, v10);
        -[MPCPlayerItemConfigurator audioAssetTypeSelector](self, "audioAssetTypeSelector");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "spatialPreference");
        -[MPCPlayerItemConfigurator audioAssetTypeSelector](self, "audioAssetTypeSelector");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "mpc_setupWithSpatialPreference:maxResolution:", v37, objc_msgSend(v38, "maxResolution"));

      }
      v27 = v53;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_setupQueueItemForHLSPlayback:(id)a3 playerItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  MPCPlayerItemConfigurator *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MPCPlayerItemConfigurator audioAssetTypeSelector](self, "audioAssetTypeSelector");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "spatialPreference");
    -[MPCPlayerItemConfigurator audioAssetTypeSelector](self, "audioAssetTypeSelector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mpc_setupWithSpatialPreference:maxResolution:", v11, objc_msgSend(v12, "maxResolution"));

    -[MPCPlayerItemConfigurator currentAudioRoute](self, "currentAudioRoute");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAudioRoute:", v13);

    -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "engineID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mpc_setupDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544130;
      v19 = v16;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = v17;
      v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - AVPlayerItem setup:%{public}@ - item:%{public}@", (uint8_t *)&v18, 0x2Au);

    }
  }

}

- (void)_setupQueueItemForLossyAudioPlayback:(id)a3 playerItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  MPCPlayerItemConfigurator *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v30[0] = CFSTR("LQ");
  +[MPCPlayerAudioFormat lossyLowQualityStereoFormat](MPCPlayerAudioFormat, "lossyLowQualityStereoFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = CFSTR("HQ");
  v31[0] = v8;
  +[MPCPlayerAudioFormat lossyHighQualityStereoFormat](MPCPlayerAudioFormat, "lossyHighQualityStereoFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updateAudioFormatsDictionary:", v10);
  -[MPCPlayerItemConfigurator audioAssetTypeSelector](self, "audioAssetTypeSelector");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availableSortedFormats");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerItemConfigurator currentAudioRoute](self, "currentAudioRoute");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredAudioFormatForAudioFormats:route:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "format");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerItemConfigurator _emitAudioFormatSelection:item:](self, "_emitAudioFormatSelection:item:", v14, v6);
  -[MPCPlayerItemConfigurator currentAudioRoute](self, "currentAudioRoute");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAudioRoute:", v16);

  objc_msgSend(v6, "updatePreferredFormat:", v15);
  objc_msgSend(v6, "updateActiveFormat:justification:", v15, 100);
  if (objc_msgSend(v6, "mediaType") == 1024)
  {
    v17 = 7;
  }
  else
  {
    if (objc_msgSend(v6, "mediaType") != 2)
      goto LABEL_6;
    v17 = 4;
  }
  objc_msgSend(v7, "setAllowedAudioSpatializationFormats:", v17);
LABEL_6:
  -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v18, "engineID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredFormat");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138544130;
    v23 = v20;
    v24 = 2048;
    v25 = self;
    v26 = 2114;
    v27 = v6;
    v28 = 2114;
    v29 = v21;
    _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - No enhanced audio format [Using pre-defined lossy formats] - item:%{public}@ - Preferred/active format:%{public}@", (uint8_t *)&v22, 0x2Au);

  }
}

- (void)_emitAudioFormatSelection:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "queueSectionID");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queueItemID");
  v9 = objc_claimAutoreleasedReturnValue();

  -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "eventStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("queue-section-id");
  v23[1] = CFSTR("queue-item-id");
  v19 = (void *)v9;
  v20 = (void *)v8;
  v24[0] = v8;
  v24[1] = v9;
  v23[2] = CFSTR("item-audio-format-selection-metadata");
  v21[0] = CFSTR("audio-format-selection-format");
  objc_msgSend(v6, "format");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[0] = v13;
  v21[1] = CFSTR("audio-format-selection-explanation");
  objc_msgSend(v6, "explanation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v14;
  v21[2] = CFSTR("audio-format-selection-justification");
  objc_msgSend(v6, "justification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitEventType:payload:", CFSTR("audio-format-selection"), v18);

  if (!v15)
  if (!v12)

}

- (id)_audioFormatsDictionaryWithHLSMetadataFromAsset:(id)a3 metadataWaitTime:(double *)a4 error:(id *)a5
{
  void *v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;

  v8 = (void *)MEMORY[0x24BDBCE60];
  v9 = a3;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v11 = v10;
  -[MPCPlayerItemConfigurator _HLSMetadataForAsset:error:](self, "_HLSMetadataForAsset:error:", v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    *a4 = v13 - v11;
  }
  -[MPCPlayerItemConfigurator _audioFormatsDictionaryWithHLSMetadata:](self, "_audioFormatsDictionaryWithHLSMetadata:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_HLSMetadataForAsset:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  MPCPlayerItemConfigurator *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  objc_msgSend(a3, "mpc_synchronousHLSSessionDataWithTimeout:error:", 5, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (v7
    || (objc_msgSend(v6, "value"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = _NSIsNSString(),
        v8,
        (v9 & 1) == 0))
  {
    -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "engineID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v13;
      v18 = 2048;
      v19 = self;
      v20 = 2114;
      v21 = v7;
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_ERROR, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - Error retrieving HLS metadata - Error:%{public}@", buf, 0x20u);

    }
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (id)_audioFormatsDictionaryWithHLSMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  MPCPlayerItemConfigurator *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v4 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(a3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v4, "msv_dictionaryWithContentsOfBase64EncodedJSONString:error:", v5, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;

  if (v7)
  {
    -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[NSObject engineID](v8, "engineID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v10;
      v22 = 2048;
      v23 = self;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - Error decoding HLS metadata [Clearing audioFormatsDictionary] - Error:%{public}@", buf, 0x20u);

    }
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __68__MPCPlayerItemConfigurator__audioFormatsDictionaryWithHLSMetadata___block_invoke;
    v17 = &unk_24CAB5A08;
    v18 = v13;
    v8 = v13;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v14);
    v11 = -[NSObject copy](v8, "copy", v14, v15, v16, v17);
    v9 = v18;
  }

  return v11;
}

- (BOOL)_shouldReloadEntireQueue
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[MPCPlayerItemConfigurator queuedItems](self, "queuedItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v8, "isAssetLoaded"))
        {
          if ((objc_msgSend(v8, "isHLSAsset") & 1) == 0)
          {
            -[MPCPlayerItemConfigurator audioAssetTypeSelector](self, "audioAssetTypeSelector");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "preferredAudioAssetTypeForItem:", v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "type");

            if (v11 >= 3)
            {
              if (objc_msgSend(v8, "playerItemType")
                || (objc_msgSend(v8, "asset"),
                    v12 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v12, "URL"),
                    v13 = (void *)objc_claimAutoreleasedReturnValue(),
                    v14 = objc_msgSend(v13, "isFileURL"),
                    v13,
                    v12,
                    !v14))
              {
                v15 = 1;
                goto LABEL_15;
              }
            }
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v5)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (void)_updatePreferredAudioFormatIfRequiredForItem:(id)a3 route:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  MPCPlayerItemConfigurator *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  _BYTE v37[14];
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "preferredFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "preferredFormat");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "isDownloadedAsset");
      -[MPCPlayerItemConfigurator audioAssetTypeSelector](self, "audioAssetTypeSelector");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10)
      {
        v13 = objc_msgSend(v6, "loadedAudioAssetType");
        objc_msgSend(v6, "availableSortedFormats");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "audioFormatMatchingAudioAssetType:formats:route:", v13, v14, v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v11, "preferredPlayerAudioFormatForItem:route:", v6, v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v6, "setAudioRoute:", v7);
      -[MPCPlayerItemConfigurator _emitAudioFormatSelection:item:](self, "_emitAudioFormatSelection:item:", v15, v6);
      objc_msgSend(v15, "format");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "updatePreferredFormat:", v16)
        && objc_msgSend(v6, "isAssetLoaded"))
      {
        -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v20, "engineID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v31 = v22;
          v32 = 2048;
          v33 = self;
          v34 = 2114;
          v35 = v6;
          v36 = 1024;
          *(_DWORD *)v37 = objc_msgSend(v6, "isDownloadedAsset");
          *(_WORD *)&v37[4] = 2112;
          *(_QWORD *)&v37[6] = v9;
          v38 = 2112;
          v39 = v16;
          _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - Preferred audio format changed [configuring player item] - item:%{public}@ - downloaded:%{BOOL}u - audio format: %@ -> %@", buf, 0x3Au);

        }
        -[MPCPlayerItemConfigurator audioAssetTypeSelector](self, "audioAssetTypeSelector");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "configureAVPlayerItemWithAudioFormat:forceSpatial:", v16, objc_msgSend(v23, "spatialIsAlwaysOn"));

        -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v24, "engineID");
          v29 = v24;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "playerItem");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "mpc_setupDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v31 = v26;
          v32 = 2048;
          v33 = self;
          v34 = 2114;
          v35 = v28;
          v36 = 2114;
          *(_QWORD *)v37 = v6;
          _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - AVPlayerItem setup: %{public}@ - item:%{public}@", buf, 0x2Au);

          v24 = v29;
        }

      }
      goto LABEL_18;
    }
    -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "engineID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v16;
      v32 = 2048;
      v33 = self;
      v34 = 2114;
      v35 = v6;
      v17 = "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - No configuration possible [no preferred format on item] -"
            " item: %{public}@";
      v18 = v9;
      v19 = 32;
      goto LABEL_9;
    }
  }
  else
  {
    -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "engineID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v16;
      v32 = 2048;
      v33 = self;
      v17 = "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - No configuration possible [no player item]";
      v18 = v9;
      v19 = 22;
LABEL_9:
      _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_18:

    }
  }

}

- (void)engineDidChangeVocalAttenuationLevel:(id)a3
{
  if (objc_msgSend(a3, "isVocalAttenuationEnabled"))
    -[MPCPlayerItemConfigurator _resetBufferedAudio](self, "_resetBufferedAudio");
}

- (void)engineDidChangeVocalAttenuationState:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  objc_msgSend(a3, "vocalAttenuationController");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v4 && (unint64_t)(v4[9] - 5) <= 2)
  {
    v5 = v4;
    -[MPCPlayerItemConfigurator _resetBufferedAudio](self, "_resetBufferedAudio");
    v4 = v5;
  }

}

- (void)_resetBufferedAudio
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  MPCPlayerItemConfigurator *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[MPCPlayerItemConfigurator currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAssetLoaded"))
  {
    objc_msgSend(v3, "playerItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayerItemConfigurator playbackEngine](self, "playbackEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "engineID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v7;
      v10 = 2048;
      v11 = self;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AP] - resetAudioBufferedAhead for: %{public}@", (uint8_t *)&v8, 0x20u);

    }
    objc_msgSend(v4, "resetAudioBufferedAhead");

  }
}

- (MPAVRoutingController)routingController
{
  return self->_routingController;
}

- (MPPlaybackEQSetting)eqSetting
{
  return self->_eqSetting;
}

- (void)setEqSetting:(id)a3
{
  objc_storeStrong((id *)&self->_eqSetting, a3);
}

- (MPCMediaFoundationTranslator)translator
{
  return (MPCMediaFoundationTranslator *)objc_loadWeakRetained((id *)&self->_translator);
}

- (OS_dispatch_source)userDefaultsDebouncer
{
  return self->_userDefaultsDebouncer;
}

- (void)setUserDefaultsDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaultsDebouncer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsDebouncer, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_destroyWeak((id *)&self->_stackController);
  objc_destroyWeak((id *)&self->_translator);
  objc_storeStrong((id *)&self->_eqSetting, 0);
  objc_storeStrong((id *)&self->_audioAssetTypeSelector, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_currentAudioRoute, 0);
}

void __68__MPCPlayerItemConfigurator__audioFormatsDictionaryWithHLSMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  MPCPlayerAudioFormat *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[MPCPlayerAudioFormat initWithJSONDictionaryRepresentation:stableVariantID:]([MPCPlayerAudioFormat alloc], "initWithJSONDictionaryRepresentation:stableVariantID:", v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

void __55__MPCPlayerItemConfigurator_processAudioQualityChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "engineID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543874;
      v9 = v6;
      v10 = 2048;
      v11 = v7;
      v12 = 2114;
      v13 = v3;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - Failed to reload items [Preferred asset type changed] - error:%{public}@", (uint8_t *)&v8, 0x20u);

    }
  }

}

void __51__MPCPlayerItemConfigurator_setupDefaultsDebouncer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "engineID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543618;
      v8 = v5;
      v9 = 2048;
      v10 = v6;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - Processing user default audio quality change", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(WeakRetained, "processAudioQualityChanges");
    objc_msgSend(WeakRetained, "tearDownDefaultsDebouncer");
  }

}

void __67__MPCPlayerItemConfigurator__soundCheckEnabledChangedNotification___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "queuedItems", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v6, "feeder");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "applyVolumeNormalizationForItem:", v6);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

void __80__MPCPlayerItemConfigurator__playbackUserDefaultsEQPresetDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "musicEQSetting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setEqSetting:", v3);

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "engineID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "eqSetting");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v6;
    v20 = 2048;
    v21 = v7;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - Setting EQ to %{public}@", (uint8_t *)&v18, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "stackController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isAssetLoaded"))
  {
    objc_msgSend(*(id *)(a1 + 32), "translator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "MPAVItemForMFPlayerItem:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "engineID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 32);
      v18 = 138543874;
      v19 = v15;
      v20 = 2048;
      v21 = v16;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - Setting up EQ for %{public}@", (uint8_t *)&v18, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "eqSetting");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setupEQPresetWithDefaultPreset:", (int)objc_msgSend(v17, "avPreset"));

  }
}

void __75__MPCPlayerItemConfigurator__highQualityMusicStreamingOnCellularDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "queuedItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v6++), "disableItemReuse");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "engineID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    v18 = 2048;
    v19 = v10;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p: _highQualityMusicStreamingOnCellularDidChange: reloading items [pref changed] keepCurrentItem=YES", buf, 0x16u);

  }
  objc_msgSend(v7, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadItemsKeepingCurrentItem:allowReuse:", 1, 0);

}

@end
