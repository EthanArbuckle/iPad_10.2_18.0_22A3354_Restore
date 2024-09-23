@implementation MPCPlaybackEngine

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCPlaybackEngine: %p engineID=%@ playerID=%@>"), self, self->_engineID, self->_playerID);
}

- (NSString)engineID
{
  return self->_engineID;
}

- (BOOL)isSystemPodcastsApplication
{
  return objc_msgSend((id)objc_opt_class(), "isSystemPodcasts");
}

- (BOOL)isSystemMusicApplication
{
  return objc_msgSend((id)objc_opt_class(), "isSystemMusic");
}

- (MPCPlaybackEngineEventStream)eventStream
{
  return self->_eventStream;
}

- (id)swiftStorage
{
  return self->_swiftStorage;
}

void __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_141(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v5, OS_SIGNPOST_INTERVAL_END, v6, "StateRestore-Load", ", v7, 2u);
  }

  (*(void (**)(_QWORD, BOOL, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3 == 0, v3);
}

- (void)setSwiftStorage:(id)a3
{
  objc_storeStrong(&self->_swiftStorage, a3);
}

id __36__MPCPlaybackEngine_preheatPlayback__block_invoke()
{
  NSObject *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint8_t v7[16];

  v0 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_210BD8000, v0, OS_LOG_TYPE_DEFAULT, "Starting playback preheating...", v7, 2u);
  }

  v1 = +[MPCFairPlayPerformanceController sharedController](MPCFairPlayPerformanceController, "sharedController");
  v2 = (id)objc_msgSend(MEMORY[0x24BDDCCD0], "ubiquitousIdentifierWithStoreAdamID:", 1);
  objc_msgSend(MEMORY[0x24BDDC710], "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "musicSubscriptionStatus");

  v5 = (id)objc_msgSend(MEMORY[0x24BDDCC00], "sharedStoreArtworkDataSource");
  return (id)objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
}

- (MPCWhiskyController)vocalAttenuationController
{
  return self->_vocalAttenuationController;
}

- (BOOL)disableShuffle
{
  return self->_disableShuffle;
}

- (BOOL)disableRepeat
{
  return self->_disableRepeat;
}

void __45__MPCPlaybackEngine__initializePlaybackStack__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "routingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickedRoute");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 216);
  *(_QWORD *)(v4 + 216) = v3;

  objc_msgSend(*(id *)(a1 + 32), "eventObserver");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "pickedRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engine:didReceivePickedRouteChange:", v6, v7);

}

- (MPAVRoute)pickedRoute
{
  return self->_pickedRoute;
}

- (float)vocalLevel
{
  float *v2;
  float v3;

  -[MPCPlaybackEngine vocalAttenuationController](self, "vocalAttenuationController");
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[10];
  else
    v3 = 0.0;

  return v3;
}

- (MPAVRoutingController)routingController
{
  return self->_routingController;
}

- (BOOL)disableAutoPlay
{
  return self->_disableAutoPlay;
}

- (void)setVideoSupported:(BOOL)a3
{
  self->_videoSupported = a3;
}

- (void)setPictureInPictureSupported:(BOOL)a3
{
  self->_pictureInPictureSupported = a3;
}

- (BOOL)isVideoSupported
{
  return self->_videoSupported;
}

- (BOOL)isStateRestorationSupported
{
  return -[_MPCPlaybackEngineSessionManager isStateRestorationSupported](self->_sessionManager, "isStateRestorationSupported");
}

- (BOOL)isPictureInPictureSupported
{
  return self->_pictureInPictureSupported;
}

- (BOOL)isAudioAnalyzerEnabled
{
  return self->_audioAnalyzerEnabled;
}

- (MPCPlaybackIntent)fallbackPlaybackIntent
{
  return self->_fallbackPlaybackIntent;
}

- (void)becomeActive
{
  -[_MPCMediaRemotePublisher becomeActive](self->_mediaRemotePublisher, "becomeActive");
}

- (MPCQueueController)queueController
{
  return self->_queueController;
}

- (void)setFallbackPlaybackIntent:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackPlaybackIntent, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MPCPlaybackEngine)initWithPlayerID:(id)a3
{
  id v4;
  _MPCPlaybackEnginePlayerIDInitializationParameters *v5;
  MPCPlaybackEngine *v6;

  v4 = a3;
  v5 = -[_MPCPlaybackEnginePlayerIDInitializationParameters initWithPlayerID:]([_MPCPlaybackEnginePlayerIDInitializationParameters alloc], "initWithPlayerID:", v4);

  v6 = -[MPCPlaybackEngine initWithParameters:](self, "initWithParameters:", v5);
  return v6;
}

- (MPCPlaybackEngine)initWithParameters:(id)a3
{
  id v6;
  MPCPlaybackEngine *v7;
  void *v8;
  uint64_t v9;
  NSString *playerID;
  uint64_t v11;
  NSString *engineID;
  uint64_t v13;
  _MPCPlaybackEngineEventObserving *eventObserver;
  NSObject *v15;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  MPCPlaybackEngine *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPCPlaybackEngine;
  v7 = -[MPCPlaybackEngine init](&v19, sel_init);
  if (v7)
  {
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("MPCPlaybackEngine.m"), 116, CFSTR("MPCPlaybackEngine API must be called on the main thread. %@"), v18);

    }
    objc_storeStrong((id *)&v7->_initializationParameters, a3);
    objc_msgSend(v6, "playerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    playerID = v7->_playerID;
    v7->_playerID = (NSString *)v9;

    MSVNanoIDCreateTaggedPointer();
    v11 = objc_claimAutoreleasedReturnValue();
    engineID = v7->_engineID;
    v7->_engineID = (NSString *)v11;

    objc_storeStrong((id *)&v7->_audioSessionCategory, (id)*MEMORY[0x24BDB15A8]);
    v7->_queueHandoffSupported = 1;
    objc_msgSend(MEMORY[0x24BDDCB38], "proxyForObjects:protocol:", MEMORY[0x24BDBD1A8], &unk_254A90C48);
    v13 = objc_claimAutoreleasedReturnValue();
    eventObserver = v7->_eventObserver;
    v7->_eventObserver = (_MPCPlaybackEngineEventObserving *)v13;

    -[MPCPlaybackEngine _initializePlaybackStack](v7, "_initializePlaybackStack");
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "Created new playback engine: %{public}@", buf, 0xCu);
    }

  }
  return v7;
}

- (void)_initializePlaybackStack
{
  _MPCPlaybackEngineEventStreamInitializationParameters *v3;
  MPCPlaybackEngineEventStream *v4;
  MPCPlaybackEngineEventStream *eventStream;
  MPCPlaybackEngineEnvironmentConsumer *v6;
  MPCAMSEngagementEventConsumer *v7;
  MPCPlayActivityFeedEventConsumer *v8;
  MPCAssistantAnalyticsEventConsumer *v9;
  MPCRTCEventConsumer *v10;
  MPCPlaybackEngineLoggingConsumer *v11;
  MPCPlayPerfConsumer *v12;
  MPCVocalAttenuationPowerLogConsumer *v13;
  MPCAutoBugCaptureEventConsumer *v14;
  _MPCMediaRemotePublisher *v15;
  _MPCMediaRemotePublisher *mediaRemotePublisher;
  _MPCMusicPlayerControllerServer *v17;
  _MPCMusicPlayerControllerServer *musicPlayerControllerServer;
  _MPCLeaseManager *v19;
  _MPCLeaseManager *leaseManager;
  _MPCPlaybackEnginePlayer *v21;
  _MPCPlaybackEnginePlayer *player;
  _MPCVideoViewControllerMediaFoundationImplementation *v23;
  MPCVideoOutput *videoOutput;
  _MPCReportingController *v25;
  _MPCReportingController *reportingController;
  _MPCPlaybackEngineSessionManager *v27;
  _MPCPlaybackEngineSessionManager *sessionManager;
  void *v29;
  MPCWhiskyController *v30;
  MPCWhiskyController *vocalAttenuationController;
  _MPCSleepTimerController *v32;
  _MPCSleepTimerController *sleepTimerController;
  _MPCTranscriptAlignmentController *v34;
  _MPCTranscriptAlignmentController *transcriptAlignmentController;
  MPCPlaybackEngineEventStream *v36;
  void *v37;
  id v38;
  objc_class *v39;
  void *v40;
  MPAVRoutingController *v41;
  MPAVRoutingController *routingController;
  MPAVRoutingController *v43;
  _QWORD v44[5];

  v3 = -[_MPCPlaybackEngineEventStreamInitializationParameters initWithPlaybackEngineParameters:engineID:]([_MPCPlaybackEngineEventStreamInitializationParameters alloc], "initWithPlaybackEngineParameters:engineID:", self->_initializationParameters, self->_engineID);
  v4 = -[MPCPlaybackEngineEventStream initWithParameters:]([MPCPlaybackEngineEventStream alloc], "initWithParameters:", v3);
  eventStream = self->_eventStream;
  self->_eventStream = v4;

  if ((objc_msgSend((id)objc_opt_class(), "isSystemMusic") & 1) == 0
    && (objc_msgSend((id)objc_opt_class(), "isSystemPodcasts") & 1) == 0)
  {
    -[MPCPlaybackEngineEventStream setTransactionDebounceTime:](self->_eventStream, "setTransactionDebounceTime:", 0.0);
  }
  v6 = -[MPCPlaybackEngineEnvironmentConsumer initWithPlaybackEngine:]([MPCPlaybackEngineEnvironmentConsumer alloc], "initWithPlaybackEngine:", self);
  -[MPCPlaybackEngineEventStream addConsumer:](self->_eventStream, "addConsumer:", v6);
  if ((objc_msgSend((id)objc_opt_class(), "isSystemPodcasts") & 1) == 0)
  {
    v7 = objc_alloc_init(MPCAMSEngagementEventConsumer);
    -[MPCPlaybackEngineEventStream addConsumer:](self->_eventStream, "addConsumer:", v7);
    v8 = objc_alloc_init(MPCPlayActivityFeedEventConsumer);
    -[MPCPlaybackEngineEventStream addConsumer:](self->_eventStream, "addConsumer:", v8);
    v9 = -[MPCAssistantAnalyticsEventConsumer initWithPlaybackEngine:]([MPCAssistantAnalyticsEventConsumer alloc], "initWithPlaybackEngine:", self);
    -[MPCPlaybackEngineEventStream addConsumer:](self->_eventStream, "addConsumer:", v9);

  }
  v10 = objc_alloc_init(MPCRTCEventConsumer);
  -[MPCPlaybackEngineEventStream addConsumer:](self->_eventStream, "addConsumer:", v10);
  v11 = objc_alloc_init(MPCPlaybackEngineLoggingConsumer);
  -[MPCPlaybackEngineEventStream addConsumer:](self->_eventStream, "addConsumer:", v11);
  v12 = -[MPCPlayPerfConsumer initWithPlaybackEngine:]([MPCPlayPerfConsumer alloc], "initWithPlaybackEngine:", self);
  -[MPCPlaybackEngineEventStream addConsumer:](self->_eventStream, "addConsumer:", v12);
  if (_os_feature_enabled_impl()
    && MSVDeviceSupportsVocalAttenuation()
    && ICCurrentApplicationIsSystemApp())
  {
    v13 = objc_alloc_init(MPCVocalAttenuationPowerLogConsumer);
    -[MPCPlaybackEngineEventStream addConsumer:](self->_eventStream, "addConsumer:", v13);

  }
  if (MSVDeviceOSIsInternalInstall())
  {
    v14 = objc_alloc_init(MPCAutoBugCaptureEventConsumer);
    -[MPCPlaybackEngineEventStream addConsumer:](self->_eventStream, "addConsumer:", v14);

  }
  v15 = -[_MPCMediaRemotePublisher initWithPlaybackEngine:]([_MPCMediaRemotePublisher alloc], "initWithPlaybackEngine:", self);
  mediaRemotePublisher = self->_mediaRemotePublisher;
  self->_mediaRemotePublisher = v15;

  if ((MSVDeviceIsAudioAccessory() & 1) == 0)
  {
    v17 = -[_MPCMusicPlayerControllerServer initWithPlaybackEngine:]([_MPCMusicPlayerControllerServer alloc], "initWithPlaybackEngine:", self);
    musicPlayerControllerServer = self->_musicPlayerControllerServer;
    self->_musicPlayerControllerServer = v17;

  }
  v19 = -[_MPCLeaseManager initWithPlaybackEngine:]([_MPCLeaseManager alloc], "initWithPlaybackEngine:", self);
  leaseManager = self->_leaseManager;
  self->_leaseManager = v19;

  v21 = -[_MPCPlaybackEnginePlayer initWithPlaybackEngine:]([_MPCPlaybackEnginePlayer alloc], "initWithPlaybackEngine:", self);
  player = self->_player;
  self->_player = v21;

  if ((MSVDeviceIsAudioAccessory() & 1) == 0
    && !+[MPCPlaybackEngine isRemotePlayerService](MPCPlaybackEngine, "isRemotePlayerService"))
  {
    v23 = -[_MPCVideoViewControllerMediaFoundationImplementation initWithPlaybackEngine:]([_MPCVideoViewControllerMediaFoundationImplementation alloc], "initWithPlaybackEngine:", self);
    videoOutput = self->_videoOutput;
    self->_videoOutput = (MPCVideoOutput *)v23;

  }
  v25 = -[_MPCReportingController initWithPlaybackEngine:]([_MPCReportingController alloc], "initWithPlaybackEngine:", self);
  reportingController = self->_reportingController;
  self->_reportingController = v25;

  v27 = -[_MPCPlaybackEngineSessionManager initWithPlaybackEngine:]([_MPCPlaybackEngineSessionManager alloc], "initWithPlaybackEngine:", self);
  sessionManager = self->_sessionManager;
  self->_sessionManager = v27;

  +[MPCContentAgeRequirementManager sharedManager](MPCContentAgeRequirementManager, "sharedManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setDelegate:", self);

  -[MPCPlaybackEngine initializeSwiftStack](self, "initializeSwiftStack");
  if (_os_feature_enabled_impl()
    && MSVDeviceSupportsVocalAttenuation()
    && ICCurrentApplicationIsSystemApp())
  {
    v30 = -[MPCWhiskyController initWithPlaybackEngine:]([MPCWhiskyController alloc], "initWithPlaybackEngine:", self);
    vocalAttenuationController = self->_vocalAttenuationController;
    self->_vocalAttenuationController = v30;

  }
  if (objc_msgSend((id)objc_opt_class(), "isSystemPodcasts"))
  {
    v32 = -[_MPCSleepTimerController initWithPlaybackEngine:]([_MPCSleepTimerController alloc], "initWithPlaybackEngine:", self);
    sleepTimerController = self->_sleepTimerController;
    self->_sleepTimerController = v32;

  }
  if (objc_msgSend((id)objc_opt_class(), "isSystemPodcasts"))
  {
    v34 = -[_MPCTranscriptAlignmentController initWithPlaybackEngine:]([_MPCTranscriptAlignmentController alloc], "initWithPlaybackEngine:", self);
    transcriptAlignmentController = self->_transcriptAlignmentController;
    self->_transcriptAlignmentController = v34;

    v36 = self->_eventStream;
    -[_MPCTranscriptAlignmentController eventConsumer](self->_transcriptAlignmentController, "eventConsumer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlaybackEngineEventStream addConsumer:](v36, "addConsumer:", v37);

  }
  v38 = objc_alloc(MEMORY[0x24BDDC6D0]);
  v39 = (objc_class *)objc_opt_class();
  NSStringFromClass(v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (MPAVRoutingController *)objc_msgSend(v38, "initWithName:", v40);
  routingController = self->_routingController;
  self->_routingController = v41;

  -[MPAVRoutingController setDelegate:](self->_routingController, "setDelegate:", self);
  v43 = self->_routingController;
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __45__MPCPlaybackEngine__initializePlaybackStack__block_invoke;
  v44[3] = &unk_24CAB8530;
  v44[4] = self;
  -[MPAVRoutingController fetchAvailableRoutesWithCompletionQueue:completionHandler:](v43, "fetchAvailableRoutesWithCompletionQueue:completionHandler:", MEMORY[0x24BDAC9B8], v44);

}

- (void)addEngineObserver:(id)a3
{
  _MPCPlaybackEngineEventObserving *eventObserver;
  id v4;
  id v5;

  eventObserver = self->_eventObserver;
  v4 = a3;
  -[_MPCPlaybackEngineEventObserving objects](eventObserver, "objects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (MPCPlaybackEngineInitializationParameters)initializationParameters
{
  return self->_initializationParameters;
}

- (BOOL)isQueueHandoffSupported
{
  return self->_queueHandoffSupported;
}

- (BOOL)isStarted
{
  return self->_started;
}

void __64__MPCPlaybackEngine__detectCrashLoopForSessionIdentifier_block___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  self->_started = 1;
  -[_MPCMusicPlayerControllerServer startServer](self->_musicPlayerControllerServer, "startServer");
  -[_MPCMediaRemotePublisher publishIfNeeded](self->_mediaRemotePublisher, "publishIfNeeded");
  objc_msgSend((id)objc_opt_class(), "preheatPlayback");
  -[MPCPlaybackEngineInitializationParameters nowPlayingInfoCenter](self->_initializationParameters, "nowPlayingInfoCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerPath");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v9, "origin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parentApplicationBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemoteSetParentApplication();

  }
}

- (void)queueController:(id)a3 didChangeTargetContentItemID:(id)a4
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  -[MPCPlaybackEngine schedulePlaybackStatePreservation](self, "schedulePlaybackStatePreservation");
  v6 = objc_msgSend(v5, "targetContentItemSource") == 3;
  v7 = objc_msgSend(v5, "targetContentItemSource");

  -[MPCPlaybackEngine player](self, "player");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadItemsKeepingCurrentItem:allowReuse:", v6, v7 != 6);

}

- (void)queueController:(id)a3 didDetectMismatchForActiveContentItemID:(id)a4 targetContentItemID:(id)a5
{
  id v5;

  -[MPCPlaybackEngine player](self, "player", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadItemsKeepingCurrentItem:allowReuse:", 0, 1);

}

- (_MPCMediaRemotePublisher)mediaRemotePublisher
{
  return self->_mediaRemotePublisher;
}

- (_MPCPlaybackEnginePlayer)player
{
  return self->_player;
}

- (BOOL)isVocalAttenuationEnabled
{
  return self->_vocalAttenuationEnabled;
}

- (void)routingController:(id)a3 pickedRouteDidChange:(id)a4
{
  id v6;
  id v7;

  objc_storeStrong((id *)&self->_pickedRoute, a4);
  v6 = a4;
  -[MPCPlaybackEngine eventObserver](self, "eventObserver");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "engine:didReceivePickedRouteChange:", self, v6);

}

- (void)setQueueController:(id)a3
{
  MPCQueueController *v6;
  MPCQueueController *queueController;
  MPCQueueController **p_queueController;
  void *v9;
  MPCPlaybackEngine *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  MPCQueueController *v15;
  void *v16;
  void *v17;
  void *v18;
  MPCPlaybackEngine *v19;
  MPCPlaybackEngine *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = (MPCQueueController *)a3;
  p_queueController = &self->_queueController;
  queueController = self->_queueController;
  if (queueController != v6)
  {
    if (queueController)
    {
      -[MPCPlaybackEngine eventObserver](self, "eventObserver");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "engine:willRemoveQueueController:", self, v6);

      -[MPCQueueController playbackEngine](self->_queueController, "playbackEngine");
      v10 = (MPCPlaybackEngine *)objc_claimAutoreleasedReturnValue();

      if (v10 == self)
      {
        v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          -[MPCPlaybackEngine engineID](self, "engineID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCQueueController sessionID](v6, "sessionID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCQueueController sessionID](self->_queueController, "sessionID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v35 = v12;
          v36 = 2114;
          v37 = v13;
          v38 = 2114;
          v39 = v14;
          _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[ENG:%{public}@] setQueueController=%{public}@ | disconnecting [previous controller still connected] queueController=%{public}@", buf, 0x20u);

        }
        -[MPCQueueController willDisconnectFromPlaybackEngine:](self->_queueController, "willDisconnectFromPlaybackEngine:", self);
      }
      -[MPCQueueController didDisconnectFromPlaybackEngine:](self->_queueController, "didDisconnectFromPlaybackEngine:", self);
      v15 = self->_queueController;
    }
    else
    {
      v15 = 0;
    }
    -[MPCQueueController musicSharePlay](v15, "musicSharePlay");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMusicSharePlayBehaviorDelegate:", 0);

    -[MPCQueueController music](*p_queueController, "music");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMusicBehaviorDelegate:", 0);

    -[MPCQueueController setDelegate:](*p_queueController, "setDelegate:", 0);
    -[MPCQueueController musicSharePlay](v6, "musicSharePlay");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      -[MPCPlaybackEngine setVocalAttenuationEnabled:](self, "setVocalAttenuationEnabled:", 0);
    objc_storeStrong((id *)&self->_queueController, a3);
    -[MPCQueueController playbackEngine](self->_queueController, "playbackEngine");
    v19 = (MPCPlaybackEngine *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19 != self)
    {
      if (v19)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngine.m"), 510, CFSTR("Attempt to share QueueController with two players: %@ != %@"), v20, self);

      }
      v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        -[MPCPlaybackEngine engineID](self, "engineID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCQueueController sessionID](v6, "sessionID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v22;
        v36 = 2114;
        v37 = v23;
        _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "[ENG:%{public}@] setQueueController:%{public}@ | connecting [new controller not connected]", buf, 0x16u);

      }
      -[MPCQueueController willConnectToPlaybackEngine:](self->_queueController, "willConnectToPlaybackEngine:", self);
    }
    -[MPCQueueController setDelegate:](self->_queueController, "setDelegate:", self);
    -[MPCQueueController music](self->_queueController, "music");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMusicBehaviorDelegate:", self);

    -[MPCQueueController musicSharePlay](self->_queueController, "musicSharePlay");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMusicSharePlayBehaviorDelegate:", self);

    -[MPCPlaybackEngine delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v26, "requestedPropertySetForEngine:", self);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCQueueController musicSharePlay](self->_queueController, "musicSharePlay");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setRequestedPropertySetForEvents:", v27);

    }
    -[MPCQueueController didConnectToPlaybackEngine:](self->_queueController, "didConnectToPlaybackEngine:", self);
    v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      -[MPCPlaybackEngine engineID](self, "engineID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCQueueController sessionID](self->_queueController, "sessionID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v30;
      v36 = 2114;
      v37 = v31;
      _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_DEFAULT, "[ENG:%{public}@] setQueueController:%{public}@ | didChangeQueueController", buf, 0x16u);

    }
    -[MPCPlaybackEngine eventObserver](self, "eventObserver");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "engine:didChangeQueueController:", self, v6);

  }
}

- (NSString)playerID
{
  return self->_playerID;
}

- (_MPCPlaybackEngineEventObserving)eventObserver
{
  return self->_eventObserver;
}

- (void)schedulePlaybackStatePreservation
{
  NSObject *v3;
  void *v4;
  dispatch_time_t v5;
  _QWORD block[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!-[MPCPlaybackEngine hasScheduledPlaybackStatePreservation](self, "hasScheduledPlaybackStatePreservation"))
  {
    -[MPCPlaybackEngine setScheduledPlaybackStatePreservation:](self, "setScheduledPlaybackStatePreservation:", 1);
    v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[MPCPlaybackEngine engineID](self, "engineID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v8 = v4;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] schedulePlaybackStatePreservation | scheduling in 1.5s", buf, 0xCu);

    }
    v5 = dispatch_time(0, 1500000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__MPCPlaybackEngine_schedulePlaybackStatePreservation__block_invoke;
    block[3] = &unk_24CABA2D0;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x24BDAC9B8], block);
  }
}

- (BOOL)hasScheduledPlaybackStatePreservation
{
  return self->_scheduledPlaybackStatePreservation;
}

- (void)setVocalAttenuationEnabled:(BOOL)a3
{
  id v3;

  if (self->_vocalAttenuationEnabled != a3)
  {
    self->_vocalAttenuationEnabled = a3;
    -[MPCPlaybackEngine player](self, "player");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateAudioSessionSpeechDetection");

  }
}

- (void)setScheduledPlaybackStatePreservation:(BOOL)a3
{
  self->_scheduledPlaybackStatePreservation = a3;
}

- (_MPCLeaseManager)leaseManager
{
  return self->_leaseManager;
}

- (MPCPlaybackEngineDelegate)delegate
{
  return (MPCPlaybackEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)audioSessionOptions
{
  return self->_audioSessionOptions;
}

- (NSString)audioSessionCategory
{
  return self->_audioSessionCategory;
}

- (NSString)hostingSharedSessionID
{
  void *v2;
  void *v3;

  -[MPCPlaybackEngine mediaRemotePublisher](self, "mediaRemotePublisher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostingSharedSessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setStateRestorationSupported:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[_MPCPlaybackEngineSessionManager setStateRestorationSupported:](self->_sessionManager, "setStateRestorationSupported:");
  if (v3)
    -[MPCPlaybackEngine schedulePlaybackStatePreservation](self, "schedulePlaybackStatePreservation");
}

+ (void)preheatPlayback
{
  NSObject *v2;

  dispatch_get_global_queue(25, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_23423);

}

- (void)setAudioAnalyzerEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  MPCAudioSpectrumAnalyzer *v7;
  MPCAudioSpectrumAnalyzer *v8;
  MPCAudioSpectrumAnalyzer *audioAnalyzer;

  if (self->_audioAnalyzerEnabled != a3)
  {
    v3 = a3;
    self->_audioAnalyzerEnabled = a3;
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "disableAudioAnalysis");

    if (!v3 || (v6 & 1) != 0)
    {
      audioAnalyzer = self->_audioAnalyzer;
      self->_audioAnalyzer = 0;

    }
    else
    {
      v7 = -[MPCAudioSpectrumAnalyzer initWithPlaybackEngine:]([MPCAudioSpectrumAnalyzer alloc], "initWithPlaybackEngine:", self);
      v8 = self->_audioAnalyzer;
      self->_audioAnalyzer = v7;

    }
  }
}

void __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_137(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setRestoringPlaybackState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "eventObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "engineDidEndStateRestoration:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "publishIfNeeded");
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = a2;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "StateRestore", "didRestore=%{BOOL}u", buf, 8u);
  }

  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "msv_description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v12;
      v25 = 1024;
      v26 = a2;
      v27 = 2114;
      v28 = v13;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "[PSP:%{public}@] restoreStateWithCompletion | finished playback state restoration [] didRestore=%{BOOL}u error=%{public}@", buf, 0x1Cu);

    }
    if ((a2 & 1) == 0)
    {
      v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "engineID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v15;
        _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] restoreStateWithCompletion: | clearing state restoration identifier [state restoration failed]", buf, 0xCu);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setStateRestorationSessionIdentifier:", 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v16;
      v25 = 1024;
      v26 = a2;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] restoreStateWithCompletion | finished playback state restoration [] didRestore=%{BOOL}u", buf, 0x12u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v17 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (a2 && v17)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_138;
    v21[3] = &unk_24CAB9720;
    v22 = *(id *)(a1 + 48);
    objc_msgSend(v17, "performAfterEdits:", v21);

  }
  else
  {
    v18 = *(_QWORD *)(a1 + 48);
    v19 = *(void (**)(uint64_t))(v18 + 16);
    v20 = v17;
    v19(v18);
  }

}

- (void)restoreStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  os_signpost_id_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  MPCPlaybackEngine *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCPlaybackEngineSessionManager stateRestorationSessionIdentifier](self->_sessionManager, "stateRestorationSessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v7 = v6;
  if (v5)
  {
    v8 = os_signpost_id_generate(v6);

    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "StateRestore", ", buf, 2u);
    }

    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[MPCPlaybackEngine engineID](self, "engineID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v12;
      v20 = 2114;
      v21 = self;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] restoreStateWithCompletion: | requested playback state restoration [] engine=%{public}@", buf, 0x16u);

    }
    -[MPCPlaybackEngine setRestoringPlaybackState:](self, "setRestoringPlaybackState:", 1);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke;
    v14[3] = &unk_24CAB8478;
    v17 = v8;
    v14[4] = self;
    v16 = v4;
    v15 = v5;
    -[MPCPlaybackEngine _detectCrashLoopForSessionIdentifier:block:](self, "_detectCrashLoopForSessionIdentifier:block:", v15, v14);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[MPCPlaybackEngine engineID](self, "engineID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2114;
      v21 = self;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] restoreStateWithCompletion: | skipping playback state restoration [no stateRestorationSessionID in session manager] engine=%{public}@", buf, 0x16u);

    }
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)_detectCrashLoopForSessionIdentifier:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  NSString *playerID;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void (*v25)(_QWORD *, BOOL, _QWORD *);
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  playerID = self->_playerID;
  v9 = a4;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("stateRestoration-%@"), playerID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryForKey:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = (void *)MEMORY[0x24BDBD1B8];
  if (v12)
    v14 = (void *)v12;
  v15 = v14;

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("attempts"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("identifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v15) = objc_msgSend(v18, "isEqualToString:", v6);
  if ((_DWORD)v15)
    v19 = v17;
  else
    v19 = 0;
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    -[MPCPlaybackEngine engineID](self, "engineID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v21;
    v33 = 2114;
    v34 = v6;
    v35 = 2048;
    v36 = v19 + 1;
    _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] _detectCrashLoopForSessionIdentifier: | sessionIdentifier=%{public}@ attempt=%ld", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = CFSTR("attempts");
  v30[0] = v6;
  v29[0] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v19 + 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKey:", v24, v10);

  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __64__MPCPlaybackEngine__detectCrashLoopForSessionIdentifier_block___block_invoke;
  v27[3] = &unk_24CABA2D0;
  v28 = v10;
  v25 = (void (*)(_QWORD *, BOOL, _QWORD *))v9[2];
  v26 = v10;
  v25(v9, v19 < 2, v27);

}

void __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  void (**v5)(_QWORD);
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  void (**v23)(_QWORD);
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v7 = v6;
  if (a2)
  {
    v8 = *(_QWORD *)(a1 + 56);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "StateRestore-WaitingForAccounts", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "eventObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "engineWillBeginStateRestoration:", *(_QWORD *)(a1 + 32));

    +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[2] = __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_135;
    v20[3] = &unk_24CAB8450;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 48);
    v24 = *(_QWORD *)(a1 + 56);
    v20[4] = v11;
    v20[1] = 3221225472;
    v22 = v12;
    v23 = v5;
    v21 = *(id *)(a1 + 40);
    objc_msgSend(v10, "performAfterLoadingAccounts:", v20);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v26 = v13;
      v27 = 2114;
      v28 = v14;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "[PSP:%{public}@] restoreStateWithCompletion: | skipping restore [too many failed attempts] sessionIdentifier=%{public}@", buf, 0x16u);

    }
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v16 = v15;
    v17 = *(_QWORD *)(a1 + 56);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v16, OS_SIGNPOST_INTERVAL_END, v17, "StateRestore", "didRestore=NO", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setStateRestorationSessionIdentifier:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setRestoringPlaybackState:", 0);
    v18 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 59, CFSTR("Unable to restore state. Too many failed attempts."));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v19);

    v5[2](v5);
  }

}

uint64_t __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_138(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)initializeSwiftStack
{
  MPCPlaybackEngine *v2;

  v2 = self;
  MPCPlaybackEngine.initializeSwiftStack()();

}

- (void)loadSessionWithIdentifier:(NSString *)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSString *v8;
  MPCPlaybackEngine *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_210C336D8((uint64_t)&unk_254A7EF58, (uint64_t)v7);
}

- (void)reloadQueueForReason:(int64_t)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  MPCPlaybackEngine *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = self;
  sub_210C336D8((uint64_t)&unk_254A7EF48, (uint64_t)v7);
}

- (void)beginScanningWithDirection:(int64_t)a3 identifier:(NSString *)a4 completion:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSString *v10;
  MPCPlaybackEngine *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a4;
  v11 = self;
  sub_210C336D8((uint64_t)&unk_254A7EF38, (uint64_t)v9);
}

- (BOOL)skipWithDirectionShouldJumpToItemStart:(int64_t)a3
{
  MPCPlaybackEngine *v4;

  v4 = self;
  LOBYTE(a3) = MPCPlaybackEngine.skipShouldJumpToItemStart(direction:)(a3);

  return a3 & 1;
}

- (void)dealloc
{
  objc_super v3;

  -[MPCPlaybackEngineEventStream scheduleInvalidation](self->_eventStream, "scheduleInvalidation");
  v3.receiver = self;
  v3.super_class = (Class)MPCPlaybackEngine;
  -[MPCPlaybackEngine dealloc](&v3, sel_dealloc);
}

- (void)setQueueHandoffSupported:(BOOL)a3
{
  if (self->_queueHandoffSupported != a3)
  {
    self->_queueHandoffSupported = a3;
    if (-[_MPCMediaRemotePublisher hasInitializedSupportedCommands](self->_mediaRemotePublisher, "hasInitializedSupportedCommands"))
    {
      -[_MPCMediaRemotePublisher publishIfNeeded](self->_mediaRemotePublisher, "publishIfNeeded");
    }
  }
}

- (void)setAudioSessionCategory:(id)a3
{
  id v5;
  NSString *v6;
  NSString *audioSessionCategory;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngine.m"), 246, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("audioSessionCategory"));

    v5 = 0;
  }
  if (!-[NSString isEqualToString:](self->_audioSessionCategory, "isEqualToString:", v5))
  {
    v6 = (NSString *)objc_msgSend(v9, "copy");
    audioSessionCategory = self->_audioSessionCategory;
    self->_audioSessionCategory = v6;

    -[_MPCPlaybackEnginePlayer updateAudioSession](self->_player, "updateAudioSession");
  }

}

- (void)setAudioSessionOptions:(unint64_t)a3
{
  if (self->_audioSessionOptions != a3)
  {
    self->_audioSessionOptions = a3;
    -[_MPCPlaybackEnginePlayer updateAudioSession](self->_player, "updateAudioSession");
  }
}

- (void)setDisableAutoPlay:(BOOL)a3
{
  id v3;

  if (self->_disableAutoPlay != a3)
  {
    self->_disableAutoPlay = a3;
    -[MPCPlaybackEngine mediaRemotePublisher](self, "mediaRemotePublisher");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "publishIfNeeded");

  }
}

- (void)setDisableRepeat:(BOOL)a3
{
  id v3;

  if (self->_disableRepeat != a3)
  {
    self->_disableRepeat = a3;
    -[MPCPlaybackEngine mediaRemotePublisher](self, "mediaRemotePublisher");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "publishIfNeeded");

  }
}

- (void)setDisableShuffle:(BOOL)a3
{
  id v3;

  if (self->_disableShuffle != a3)
  {
    self->_disableShuffle = a3;
    -[MPCPlaybackEngine mediaRemotePublisher](self, "mediaRemotePublisher");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "publishIfNeeded");

  }
}

- (void)invalidate
{
  -[MPCPlaybackEngineEventStream invalidate](self->_eventStream, "invalidate");
}

- (void)removeEngineObserver:(id)a3
{
  _MPCPlaybackEngineEventObserving *eventObserver;
  id v4;
  id v5;

  eventObserver = self->_eventObserver;
  v4 = a3;
  -[_MPCPlaybackEngineEventObserving objects](eventObserver, "objects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)reportUserBackgroundedApplication
{
  -[_MPCMediaRemotePublisher reportUserBackgroundedApplication](self->_mediaRemotePublisher, "reportUserBackgroundedApplication");
}

- (NSXPCListenerEndpoint)serverEndpoint
{
  return -[_MPCMusicPlayerControllerServer endpoint](self->_musicPlayerControllerServer, "endpoint");
}

- (void)setVocalLevel:(float)a3
{
  float *v5;
  float v6;
  float *v7;
  double v8;
  float v9;
  float v10;
  int v11;
  int v12;
  void *v13;
  double v14;
  NSObject *v15;
  float *v16;
  _BYTE buf[24];
  double v18;
  float *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[MPCPlaybackEngine vocalAttenuationController](self, "vocalAttenuationController");
  v5 = (float *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5[10];
  else
    v6 = 0.0;

  if (v6 != a3)
  {
    -[MPCPlaybackEngine vocalAttenuationController](self, "vocalAttenuationController");
    v7 = (float *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = fminf(fmaxf(a3, v7[14]), v7[15]);
      v10 = v7[10];
      if (v9 != v10)
      {
        v7[10] = v9;
        *(float *)&v8 = v7[10];
        v16 = v7;
        objc_msgSend(v7, "_processorLevelForVocalLevel:", v8);
        v12 = v11;
        objc_msgSend(v16, "processor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v14) = v12;
        objc_msgSend(v13, "setLevel:", v14);

        v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v16;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v10;
          *(_WORD *)&buf[22] = 2048;
          v18 = v9;
          _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Vocal level changed: %3.2fui -> %3.2fui", buf, 0x20u);
        }

        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __37__MPCWhiskyController_setVocalLevel___block_invoke;
        v18 = COERCE_DOUBLE(&unk_24CABA2D0);
        v19 = v16;
        msv_dispatch_on_main_queue();
        v7 = v16;
      }
    }

  }
}

- (double)currentAudioProcessingDelay
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double *v10;

  -[_MPCPlaybackEnginePlayer currentItem](self->_player, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (objc_msgSend(v3, "supportsVocalAttenuation")
    && objc_msgSend(v3, "isConfiguredForVocalAttenuation")
    && -[MPCPlaybackEngine isVocalAttenuationEnabled](self, "isVocalAttenuationEnabled"))
  {
    -[MPCPlaybackEngine vocalAttenuationController](self, "vocalAttenuationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "processor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEnabled");

      if (v8)
      {
        objc_msgSend(v6, "modelProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "model");
        v10 = (double *)objc_claimAutoreleasedReturnValue();
        if (v10)
          v4 = v10[10];

      }
    }

  }
  return v4;
}

- (BOOL)isVocalAttenuationAvailable
{
  MPCWhiskyController *vocalAttenuationController;

  if (-[_MPCMediaRemotePublisher vocalAttenuationUnavailabilityReasons](self->_mediaRemotePublisher, "vocalAttenuationUnavailabilityReasons"))
  {
    return 0;
  }
  vocalAttenuationController = self->_vocalAttenuationController;
  if (vocalAttenuationController && vocalAttenuationController->_state == 2)
    return 1;
  else
    return -[MPCWhiskyController isVocalAttenuationAvailable](vocalAttenuationController);
}

- (double)mapUserTimeToPlaybackTime:(double)a3
{
  double v4;

  -[MPCPlaybackEngine currentAudioProcessingDelay](self, "currentAudioProcessingDelay");
  return v4 + a3;
}

- (double)mapPlaybackTimeToUserTime:(double)a3
{
  double v4;

  -[MPCPlaybackEngine currentAudioProcessingDelay](self, "currentAudioProcessingDelay");
  return a3 - v4;
}

- (void)queueControllerDidChangeContents:(id)a3
{
  void *v4;
  id v5;

  -[MPCPlaybackEngine schedulePlaybackStatePreservation](self, "schedulePlaybackStatePreservation", a3);
  -[MPCPlaybackEngine eventObserver](self, "eventObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "engine:didChangeQueueWithReason:", self, CFSTR("Queue Controller Contents Changed"));

  -[MPCPlaybackEngine player](self, "player");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadItemsKeepingCurrentItem:allowReuse:", 1, 1);

}

- (void)queueControllerDidReachUnexpectedEndOfQueue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD17C8];
  MSVNanoIDCreateTaggedPointer();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("UnexpectedEndOfQueue_%@"), v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngine player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pauseWithIdentifier:completion:", v8, &__block_literal_global_172);

  -[MPCPlaybackEngine player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didReachEndOfQueueWithReason:", CFSTR("UnexpectedEndOfQueue"));

}

- (void)behavior:(id)a3 didChangeRepeatType:(int64_t)a4
{
  id v6;

  -[MPCPlaybackEngine eventObserver](self, "eventObserver", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "engine:didChangeRepeatType:", self, a4);

}

- (void)behavior:(id)a3 didChangeShuffleType:(int64_t)a4
{
  id v6;

  -[MPCPlaybackEngine eventObserver](self, "eventObserver", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "engine:didChangeShuffleType:", self, a4);

}

- (void)behavior:(id)a3 didChangeActionAtQueueEnd:(int64_t)a4
{
  id v6;

  -[MPCPlaybackEngine eventObserver](self, "eventObserver", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "engine:didChangeActionAtQueueEnd:", self, a4);

}

- (void)behavior:(id)a3 didEndSharePlaySessionWithReason:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  _MPCMediaRemotePublisher *mediaRemotePublisher;
  id v13;
  __CFString *v14;
  _QWORD v15[5];
  __CFString *v16;
  id v17;
  uint8_t buf[4];
  MPCPlaybackEngine *v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD17C8];
  MSVNanoIDCreateTaggedPointer();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("LeaveSharedSession:%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    if (a4 == 2)
    {
      v9 = 0;
      v10 = CFSTR("CannotHostAndParticipateInDistinctSharedSessions");
    }
    else if (a4 == 1)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2201, CFSTR("LiveLink unexpectedly disconnected"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("UnexpectedDisconnect");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/%d"), a4);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
    v10 = CFSTR("OutOfItems");
  }
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v19 = self;
    v20 = 2114;
    v21 = v10;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "PlaybackEngine %p: sharePlaySessionDidEnd: calling publisher.leaveSharedSession [%{public}@] commandID=%{public}@", buf, 0x20u);
  }

  mediaRemotePublisher = self->_mediaRemotePublisher;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__MPCPlaybackEngine_behavior_didEndSharePlaySessionWithReason___block_invoke;
  v15[3] = &unk_24CAB8508;
  v15[4] = self;
  v16 = v10;
  v17 = v9;
  v13 = v9;
  v14 = v10;
  -[_MPCMediaRemotePublisher leaveSharedSessionWithCommandID:remoteControlInterface:completion:](mediaRemotePublisher, "leaveSharedSessionWithCommandID:remoteControlInterface:completion:", v8, CFSTR("MPCPlaybackEngine <MusicSharePlayDelegate>"), v15);

}

- (void)behavior:(id)a3 didChangeExplicitContentState:(int64_t)a4
{
  void *v5;
  id v6;

  -[MPCPlaybackEngine player](self, "player", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExplicitContentState:", a4);

}

- (void)behavior:(id)a3 didReceiveSharedListeningEvent:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[MPCPlaybackEngine delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "engine:didReceiveSharedListeningEvent:", self, v6);

}

- (BOOL)_shouldIgnorePlaybackSessionError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("MPCPlaybackSessionManagerError"));

  v6 = v5 && (unint64_t)(objc_msgSend(v3, "code") - 1) < 3;
  return v6;
}

- (void)requestAuthorizationForExplicitItem:(id)a3 reason:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  MPCPlaybackEngine *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 == 1)
      v11 = CFSTR("Age Gating");
    else
      v11 = CFSTR("None");
    *(_DWORD *)buf = 134218498;
    if (a4 == 2)
      v11 = CFSTR("Age Verification");
    v19 = self;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "PlaybackEngine %p: requestAuthorizationForExplicitItem:reason:completion: - Received request to authorize explicit item - item=%{public}@ - reason=%{public}@", buf, 0x20u);
  }

  -[MPCPlaybackEngine delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __75__MPCPlaybackEngine_requestAuthorizationForExplicitItem_reason_completion___block_invoke;
    v15[3] = &unk_24CAB8558;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    objc_msgSend(v12, "engine:requiresAuthorizationToPlayItem:reason:authorizationHandler:", self, v16, a4, v15);

  }
  else
  {
    if (a4 == 1)
      v13 = CFSTR("Age Gating");
    else
      v13 = CFSTR("None");
    if (a4 == 2)
      v13 = CFSTR("Age Verification");
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 42, CFSTR("Explicit content not allowed [unable to handle request] - item=%@ - reason=%@"), v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v14);

  }
}

- (BOOL)isRestoringPlaybackState
{
  return self->_restoringPlaybackState;
}

- (void)setRestoringPlaybackState:(BOOL)a3
{
  self->_restoringPlaybackState = a3;
}

- (BOOL)needsUISnapshot
{
  return self->_needsUISnapshot;
}

- (void)setNeedsUISnapshot:(BOOL)a3
{
  self->_needsUISnapshot = a3;
}

- (_MPCMusicPlayerControllerServer)musicPlayerControllerServer
{
  return self->_musicPlayerControllerServer;
}

- (_MPCPlaybackEngineSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (_MPCReportingController)reportingController
{
  return self->_reportingController;
}

- (_MPCSleepTimerController)sleepTimerController
{
  return self->_sleepTimerController;
}

- (_MPCTranscriptAlignmentController)transcriptAlignmentController
{
  return self->_transcriptAlignmentController;
}

- (MPCVideoOutput)videoOutput
{
  return self->_videoOutput;
}

- (NSString)targetContentItemID
{
  return self->_targetContentItemID;
}

- (MPCPlaybackEngineActiveItem)activeItem
{
  return self->_activeItem;
}

- (MPCAudioSpectrumAnalyzer)audioAnalyzer
{
  return self->_audioAnalyzer;
}

- (float)relativeVolume
{
  return self->_relativeVolume;
}

- (void)setRelativeVolume:(float)a3
{
  self->_relativeVolume = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocalAttenuationController, 0);
  objc_storeStrong((id *)&self->_pickedRoute, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_audioAnalyzer, 0);
  objc_storeStrong((id *)&self->_audioSessionCategory, 0);
  objc_storeStrong((id *)&self->_initializationParameters, 0);
  objc_storeStrong(&self->_swiftStorage, 0);
  objc_storeStrong((id *)&self->_activeItem, 0);
  objc_storeStrong((id *)&self->_targetContentItemID, 0);
  objc_storeStrong((id *)&self->_videoOutput, 0);
  objc_storeStrong((id *)&self->_transcriptAlignmentController, 0);
  objc_storeStrong((id *)&self->_sleepTimerController, 0);
  objc_storeStrong((id *)&self->_leaseManager, 0);
  objc_storeStrong((id *)&self->_reportingController, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_queueController, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_musicPlayerControllerServer, 0);
  objc_storeStrong((id *)&self->_mediaRemotePublisher, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_eventObserver, 0);
  objc_storeStrong((id *)&self->_fallbackPlaybackIntent, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_engineID, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
}

void __75__MPCPlaybackEngine_requestAuthorizationForExplicitItem_reason_completion___block_invoke(_QWORD *a1, int a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      v8 = a1[5];
      v14 = 134218498;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_ERROR, "PlaybackEngine %p: requestAuthorizationForExplicitItem:reason:completion: - Explicit content not allowed [request failed] - item=%{public}@ - error=%{public}@", (uint8_t *)&v14, 0x20u);
    }

    v9 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = a1[4];
      v12 = a1[5];
      v13 = CFSTR("not allowed");
      if (a2)
        v13 = CFSTR("allowed");
      v14 = 134218498;
      v15 = v11;
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "PlaybackEngine %p: requestAuthorizationForExplicitItem:reason:completion: - Explicit content %{public}@ [request succeeded] - item=%{public}@", (uint8_t *)&v14, 0x20u);
    }

    v9 = *(void (**)(void))(a1[6] + 16);
  }
  v9();

}

void __63__MPCPlaybackEngine_behavior_didEndSharePlaySessionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 134218498;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "PlaybackEngine %p: sharePlaySessionDidEnd: publisher.leaveSharedSession [%{public}@] complete status=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "engine:didEndSharedListeningSessionWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

void __54__MPCPlaybackEngine_schedulePlaybackStatePreservation__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  const char *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "hasScheduledPlaybackStatePreservation"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setScheduledPlaybackStatePreservation:", 0);
    if ((objc_msgSend(*(id *)(a1 + 32), "isStateRestorationSupported") & 1) != 0)
    {
      v2 = objc_msgSend(*(id *)(a1 + 32), "isRestoringPlaybackState");
      v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      if (!v2)
      {
        if (v4)
        {
          objc_msgSend(*(id *)(a1 + 32), "engineID");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v10 = v7;
          _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] schedulePlaybackStatePreservation | saving playback state [debounced]", buf, 0xCu);

        }
        objc_msgSend(*(id *)(a1 + 32), "sessionManager");
        v3 = objc_claimAutoreleasedReturnValue();
        v8[0] = MEMORY[0x24BDAC760];
        v8[1] = 3221225472;
        v8[2] = __54__MPCPlaybackEngine_schedulePlaybackStatePreservation__block_invoke_162;
        v8[3] = &unk_24CAB84C0;
        v8[4] = *(_QWORD *)(a1 + 32);
        -[NSObject saveSessionWithCompletion:](v3, "saveSessionWithCompletion:", v8);
        goto LABEL_12;
      }
      if (v4)
      {
        objc_msgSend(*(id *)(a1 + 32), "engineID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v10 = v5;
        v6 = "[PSP:%{public}@] schedulePlaybackStatePreservation | skipping playback state preservation [engine is curren"
             "tly restoring state]";
LABEL_8:
        _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);

      }
    }
    else
    {
      v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "engineID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v10 = v5;
        v6 = "[PSP:%{public}@] schedulePlaybackStatePreservation | skipping playback state preservation [not supported by client]";
        goto LABEL_8;
      }
    }
LABEL_12:

  }
}

void __54__MPCPlaybackEngine_schedulePlaybackStatePreservation__block_invoke_162(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "_shouldIgnorePlaybackSessionError:", v6);
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "engineID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v10;
        v17 = 2114;
        v18 = v6;
        v11 = "[PSP:%{public}@] schedulePlaybackStatePreservation | unable to preserve playback state [encountered ignora"
              "ble error] error=%{public}@";
        v12 = v9;
        v13 = 22;
LABEL_7:
        _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, v13);

      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v14 = *(void **)(a1 + 32);
      v15 = 138543618;
      v16 = v14;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_FAULT, "[PSP:%{public}@] schedulePlaybackStatePreservation | failed to archiving playback state [] error=%{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v10;
      v11 = "[PSP:%{public}@] schedulePlaybackStatePreservation | saved playback state";
      v12 = v9;
      v13 = 12;
      goto LABEL_7;
    }
  }

}

void __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_135(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[16];

  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "StateRestore-WaitingForAccounts", ", buf, 2u);
  }

  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 64);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "StateRestore-MRCheck", ", buf, 2u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 72);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_136;
  v10[3] = &unk_24CAB8428;
  v14 = *(_QWORD *)(a1 + 64);
  v10[4] = v8;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v9, "getShouldRestoreStateWithCompletion:", v10);

}

void __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_136(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD aBlock[5];
  id v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 64);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v26) = a2;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v5, OS_SIGNPOST_INTERVAL_END, v6, "StateRestore-MRCheck", "shouldRestore=%{BOOL}u", buf, 8u);
  }

  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_137;
  aBlock[3] = &unk_24CAB83D8;
  v8 = *(_QWORD *)(a1 + 64);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v24 = v8;
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v9 = _Block_copy(aBlock);
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v11 = v10;
  if ((a2 & 1) != 0)
  {
    v12 = *(_QWORD *)(a1 + 64);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "StateRestore-Load", ", buf, 2u);
    }

    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v14;
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] restoreStateWithCompletion: | beginning playback state restoration", buf, 0xCu);

    }
    v15 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_141;
    v18[3] = &unk_24CAB8400;
    v20 = *(_QWORD *)(a1 + 64);
    v19 = v9;
    objc_msgSend(v15, "loadSessionWithIdentifier:completion:", v16, v18);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v26 = v17;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] restoreStateWithCompletion: | skipping playback state restoration [MediaRemote commands pending]", buf, 0xCu);
    }

    (*((void (**)(void *, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

+ (BOOL)isSystemPodcasts
{
  void *v2;
  void *v3;
  char IsSystemPodcastApplication;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsSystemPodcastApplication = MRMediaRemoteApplicationIsSystemPodcastApplication();

  return IsSystemPodcastApplication;
}

+ (BOOL)isSystemMusic
{
  void *v2;
  void *v3;
  char IsSystemMediaApplication;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsSystemMediaApplication = MRMediaRemoteApplicationIsSystemMediaApplication();

  return IsSystemMediaApplication;
}

+ (BOOL)isRemotePlayerService
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MediaPlayer.RemotePlayerService"));

  return v4;
}

@end
