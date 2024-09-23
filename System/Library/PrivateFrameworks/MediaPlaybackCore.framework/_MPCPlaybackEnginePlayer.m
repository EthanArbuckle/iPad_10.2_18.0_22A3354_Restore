@implementation _MPCPlaybackEnginePlayer

- (MPAVItem)currentItem
{
  void *v3;
  void *v4;
  void *v5;

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentQueueItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPAVItem *)v5;
}

- (id)_MPAVItemForMFQueuePlayerItem:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCPlaybackEnginePlayer.m"), 753, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item == nil || [(MPAVItem *)item isKindOfClass:[MPAVItem class]]"));

    }
  }
  v6 = v5;
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentItemTransition:", objc_msgSend(v7, "currentItemTransition"));

  return v6;
}

- (MFPlaybackStackController)playbackStackController
{
  return self->_playbackStackController;
}

- (_MPCPlaybackEnginePlayer)initWithPlaybackEngine:(id)a3
{
  id v4;
  _MPCPlaybackEnginePlayer *v5;
  _MPCPlaybackEnginePlayer *v6;
  _MPCAudioSessionController *v7;
  _MPCAudioSessionController *transientAudioSessionController;
  _MPCPlaybackEnginePlayer *v9;
  _QWORD v11[5];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MPCPlaybackEnginePlayer;
  v5 = -[_MPCPlaybackEnginePlayer init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    objc_msgSend(v4, "addEngineObserver:", v6);
    v7 = objc_alloc_init(_MPCAudioSessionController);
    transientAudioSessionController = v6->_transientAudioSessionController;
    v6->_transientAudioSessionController = v7;

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51___MPCPlaybackEnginePlayer_initWithPlaybackEngine___block_invoke;
    v11[3] = &unk_24CAB7248;
    v9 = v6;
    v11[4] = v9;
    v9->_stateHandle = __51___MPCPlaybackEnginePlayer_initWithPlaybackEngine___block_invoke((uint64_t)v11);
    v9->_jumpIdentifier = 0;
    -[_MPCPlaybackEnginePlayer prewarm](v9, "prewarm");

  }
  return v6;
}

- (void)reloadItemsKeepingCurrentItem:(BOOL)a3 allowReuse:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadItemsKeepingCurrentItem:allowReuse:", v5, v4);

}

- (AVPlayerViewController)playerViewController
{
  void *v2;
  void *v3;

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPlayerViewController *)v3;
}

- (BOOL)isReloadingPlaybackContext
{
  return self->_reloadingPlaybackContext;
}

- (double)currentTime
{
  void *v2;
  double v3;
  double v4;

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentTime");
  v4 = v3;

  return v4;
}

- (void)engine:(id)a3 didChangeQueueController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_MPCPlaybackEnginePlayer setupPlaybackStackIfNeeded](self, "setupPlaybackStackIfNeeded");
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isModeSolo");

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isModeShared");

  objc_msgSend(v7, "musicSharePlay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v12)
  {
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setupForShared");
LABEL_7:

    goto LABEL_8;
  }
  if (v11 && !v12)
  {
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setupForSolo");
    goto LABEL_7;
  }
LABEL_8:
  -[_MPCPlaybackEnginePlayer translator](self, "translator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "playbackCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "engineID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sessionID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "musicSharePlay");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v29 = v17;
    v30 = 2114;
    v31 = v18;
    v32 = 2114;
    v33 = v15;
    v34 = 2114;
    v35 = v19;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] engine:didChangeQueueController: | updating playback coordinator [new queue controller] playbackCoordinator=%{public}@ musicSharePlayBehavior=%{public}@", buf, 0x2Au);

  }
  if (v12)
  {
    objc_msgSend(v7, "musicSharePlay");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updatePlaybackCoordinator:", v15);

  }
  else
  {
    objc_msgSend(v15, "setDelegate:", 0);
  }
  self->_jumpIdentifier = 0;
  v21 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(v7, "sessionID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCEnginePlayerError"), 8, CFSTR("Cancelled to setup a new queue with sessionID %@"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer errorController](self, "errorController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "resetWithReason:", v23);

  -[_MPCPlaybackEnginePlayer translator](self, "translator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "invalidateCache");

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setupForNewQueueWithSessionID:", v27);

}

- (MPCMediaFoundationTranslator)translator
{
  return self->_translator;
}

- (void)setupPlaybackStackIfNeeded
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (!self->_playbackStackController)
  {
    v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v4 = os_signpost_id_generate(v3);

    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PlaybackStackInitialSetup", ", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
    -[_MPCPlaybackEnginePlayer _setupPlaybackStackWithPlaybackEngine:](self, "_setupPlaybackStackWithPlaybackEngine:", WeakRetained);

    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v9 = v8;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v9, OS_SIGNPOST_INTERVAL_END, v4, "PlaybackStackInitialSetup", " enableTelemetry=YES ", v10, 2u);
    }

  }
}

- (MPCPlaybackErrorController)errorController
{
  return self->_errorController;
}

- (void)_setupPlaybackStackWithPlaybackEngine:(id)a3
{
  _BOOL4 v5;
  MFPodcastsPlaybackDefaults *v6;
  MFPodcastsPlaybackDefaults *v7;
  _BOOL8 v8;
  MPCMediaFoundationTranslator *v9;
  MPCMediaFoundationTranslator *translator;
  MPCAssetLoader *v11;
  MFAssetLoading *assetLoader;
  MPCExternalPlaybackController *v13;
  MPCExternalPlaybackController *externalPlaybackController;
  MPCPlaybackErrorController *v15;
  MPCPlaybackErrorController *errorController;
  MPCItemBookmarker *v17;
  MPCItemBookmarker *bookmarker;
  MPCLeaseController *v19;
  MPCMediaFoundationTranslator *v20;
  void *v21;
  MPCLeaseController *v22;
  MPCLeaseController *leaseController;
  MFPlaybackStackControllerImplementation *v24;
  void *v25;
  void *v26;
  MFPlaybackStackControllerImplementation *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  MPCPlayerItemConfigurator *v36;
  void *v37;
  MPCPlayerItemConfigurator *v38;
  MPCPlayerItemConfigurator *configurator;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;

  v48 = a3;
  v5 = +[MPCPlaybackEngine isSystemPodcasts](MPCPlaybackEngine, "isSystemPodcasts");
  if (v5)
  {
    v6 = objc_alloc_init(MFPodcastsPlaybackDefaults);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v6 = (MFPodcastsPlaybackDefaults *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v8 = v5;
  v9 = -[MPCMediaFoundationTranslator initWithPlaybackEngine:]([MPCMediaFoundationTranslator alloc], "initWithPlaybackEngine:", v48);
  translator = self->_translator;
  self->_translator = v9;

  v11 = -[MPCAssetLoader initWithDelegate:]([MPCAssetLoader alloc], "initWithDelegate:", self);
  assetLoader = self->_assetLoader;
  self->_assetLoader = (MFAssetLoading *)v11;

  v13 = -[MPCExternalPlaybackController initWithPlaybackEngine:translator:]([MPCExternalPlaybackController alloc], "initWithPlaybackEngine:translator:", v48, self->_translator);
  externalPlaybackController = self->_externalPlaybackController;
  self->_externalPlaybackController = v13;

  v15 = -[MPCPlaybackErrorController initWithPlaybackEngine:translator:externalPlaybackRouter:]([MPCPlaybackErrorController alloc], "initWithPlaybackEngine:translator:externalPlaybackRouter:", v48, self->_translator, self->_externalPlaybackController);
  errorController = self->_errorController;
  self->_errorController = v15;

  v17 = -[MPCItemBookmarker initWithPlaybackEngine:translator:]([MPCItemBookmarker alloc], "initWithPlaybackEngine:translator:", v48, self->_translator);
  bookmarker = self->_bookmarker;
  self->_bookmarker = v17;

  v19 = [MPCLeaseController alloc];
  v20 = self->_translator;
  objc_msgSend(v48, "leaseManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MPCLeaseController initWithTranslator:leaseManager:](v19, "initWithTranslator:leaseManager:", v20, v21);
  leaseController = self->_leaseController;
  self->_leaseController = v22;

  v24 = [MFPlaybackStackControllerImplementation alloc];
  objc_msgSend(v48, "playerID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "engineID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[MFPlaybackStackControllerImplementation initWithPlayerID:engineID:queueController:assetLoader:errorController:externalPlaybackController:leaseController:defaults:behavior:queue:](v24, "initWithPlayerID:engineID:queueController:assetLoader:errorController:externalPlaybackController:leaseController:defaults:behavior:queue:", v25, v26, self->_translator, self->_assetLoader, self->_errorController, self->_externalPlaybackController, self->_leaseController, v7, v8, MEMORY[0x24BDAC9B8]);
  -[_MPCPlaybackEnginePlayer setPlaybackStackController:](self, "setPlaybackStackController:", v27);

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCPlaybackEnginePlayer.m"), 678, CFSTR("_setupPlaybackStackWithPlaybackEngine failed to create a new MFPlaybackStackController"));

  }
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setDelegate:", self);

  objc_msgSend(v48, "initializationParameters");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "audioSession");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "initializationParameters");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "audioSession");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setupForManagedSessionWithAudioSession:", v34);

  }
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCLeaseController setStackController:](self->_leaseController, "setStackController:", v35);

  v36 = [MPCPlayerItemConfigurator alloc];
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[MPCPlayerItemConfigurator initWithPlaybackEngine:stackController:translator:](v36, "initWithPlaybackEngine:stackController:translator:", v48, v37, self->_translator);
  configurator = self->_configurator;
  self->_configurator = v38;

  -[MFAssetLoading setConfigurator:](self->_assetLoader, "setConfigurator:", self->_configurator);
  objc_msgSend(v48, "queueController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "currentItem");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "contentItemID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_playerItemDidBecomeActiveWithContentItemID:", v43);

  -[_MPCPlaybackEnginePlayer setTransientAudioSessionController:](self, "setTransientAudioSessionController:", 0);
  -[_MPCPlaybackEnginePlayer updateAudioSession](self, "updateAudioSession");
  self->_jumpIdentifier = 0;
  -[_MPCPlaybackEnginePlayer currentRelativeVolume](self, "currentRelativeVolume");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCPlaybackEnginePlayer currentRelativeVolume](self, "currentRelativeVolume");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "floatValue");
    objc_msgSend(v45, "setRelativeVolume:");

  }
}

- (void)updateAudioSession
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  MFAudioSessionConfiguration *v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v11;

  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "audioSessionCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v11, "audioSessionOptions");
  v5 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB15B0]) ^ 1;
  -[_MPCPlaybackEnginePlayer transientAudioSessionController](self, "transientAudioSessionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_MPCPlaybackEnginePlayer transientAudioSessionController](self, "transientAudioSessionController");
    v7 = (MFAudioSessionConfiguration *)objc_claimAutoreleasedReturnValue();
    -[MFAudioSessionConfiguration updateAudioSession:options:routeSharingPolicy:](v7, "updateAudioSession:options:routeSharingPolicy:", v3, v4, v5);
  }
  else
  {
    v7 = -[MFAudioSessionConfiguration initWithCategory:routeSharingPolicy:options:]([MFAudioSessionConfiguration alloc], "initWithCategory:routeSharingPolicy:options:", v3, v5, v4);
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateAudioSessionWithConfiguration:", v7);

    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_MPCPlaybackEnginePlayer applicationMusicPlayerTransitionType](self, "applicationMusicPlayerTransitionType");
    -[_MPCPlaybackEnginePlayer applicationMusicPlayerCrossFadeDuration](self, "applicationMusicPlayerCrossFadeDuration");
    objc_msgSend(v9, "setApplicationMusicPlayerTransitionType:duration:", v10);

  }
}

- (_MPCAudioSessionController)transientAudioSessionController
{
  return self->_transientAudioSessionController;
}

- (void)setTransientAudioSessionController:(id)a3
{
  objc_storeStrong((id *)&self->_transientAudioSessionController, a3);
}

- (void)setPlaybackStackController:(id)a3
{
  objc_storeStrong((id *)&self->_playbackStackController, a3);
}

- (void)itemDidResignCurrent:(id)a3 source:(int64_t)a4 timeStamp:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  CMTime time;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "engineID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCPlaybackEnginePlayer.m"), 1013, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queueItem != nil"));

  }
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    +[MFDescription forItemChangeSource:](MFDescription, "forItemChangeSource:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v10, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544386;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v12;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v22 = v13;
    v23 = 2114;
    v24 = v15;
    v25 = 2114;
    v26 = v16;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - itemDidResignCurrent - %{public}@ [Source: %{public}@] - timeStamp:%{public}@", (uint8_t *)&time, 0x34u);

  }
  if (a4 == 1)
  {
    objc_msgSend(v13, "_didResignActivePlayerItem");
    objc_msgSend(v11, "queueController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "music");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "repeatType") == 1)
    {

      goto LABEL_15;
    }
    v19 = objc_msgSend(v13, "isInOverlappedTransition");

    if ((v19 & 1) == 0)
    {
      -[_MPCPlaybackEnginePlayer translator](self, "translator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setMPAVItem:forMFPlayerItem:", 0, v9);
      goto LABEL_15;
    }
  }
  else if (!a4)
  {
    objc_msgSend(v11, "queueController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "playerItemDidResignCurrent:", v13);
LABEL_15:

  }
}

- (void)currentItemWillChangeFromItem:(id)a3 toItem:(id)a4 source:(int64_t)a5 timeStamp:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  CMTime time;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "engineID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCPlaybackEnginePlayer.m"), 906, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previous == nil || [(MPAVItem *)previous isKindOfClass:[MPAVItem class]]"));

    if (!v12)
      goto LABEL_6;
  }
  else if (!v12)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCPlaybackEnginePlayer.m"), 907, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("current == nil || [(MPAVItem *)current isKindOfClass:[MPAVItem class]]"));

  }
LABEL_6:
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    +[MFDescription forItemChangeSource:](MFDescription, "forItemChangeSource:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v13, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544642;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v15;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v33 = v11;
    v34 = 2114;
    v35 = v12;
    v36 = 2114;
    v37 = v17;
    v38 = 2114;
    v39 = v18;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - currentItemWillChangeFromItem - %{public}@ -> %{public}@ [Source: %{public}@] - timeStamp:%{public}@", (uint8_t *)&time, 0x3Eu);

  }
  -[_MPCPlaybackEnginePlayer bookmarker](self, "bookmarker");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "time");
  objc_msgSend(v19, "currentItemWillChangeFromItem:toItem:time:", v11, v12);

  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v12);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (a5 == 1)
  {
    objc_msgSend(v21, "_willResignActivePlayerItem");
    objc_msgSend(v20, "_willBecomeActivePlayerItem");
  }
  else if (!a5)
  {
    -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "eventObserver");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "engine:willChangeToItem:fromItem:", v23, v20, v22);

  }
  -[_MPCPlaybackEnginePlayer playbackStartTrace](self, "playbackStartTrace");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "item");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (v26 == v20)
  {

  }
  else
  {
    v27 = v26;
    v28 = objc_msgSend(v26, "isEqual:", v20);

    if ((v28 & 1) == 0)
    {
      -[_MPCPlaybackEnginePlayer playbackStartTrace](self, "playbackStartTrace");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "cancel");

      -[_MPCPlaybackEnginePlayer setPlaybackStartTrace:](self, "setPlaybackStartTrace:", 0);
    }
  }

}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (MPCAVItemTrace)playbackStartTrace
{
  return self->_playbackStartTrace;
}

- (void)setPlaybackStartTrace:(id)a3
{
  objc_storeStrong((id *)&self->_playbackStartTrace, a3);
}

- (void)itemDidBecomeCurrent:(id)a3 source:(int64_t)a4 timeStamp:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  double v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[2];
  CMTime time;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "engineID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      +[MFDescription forItemChangeSource:](MFDescription, "forItemChangeSource:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v10, "hostTime");
      else
        memset(&time, 0, sizeof(time));
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138544386;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v12;
      LOWORD(time.flags) = 2114;
      *(_QWORD *)((char *)&time.flags + 2) = self;
      HIWORD(time.epoch) = 2114;
      v55 = v13;
      v56 = 2114;
      v57 = v15;
      v58 = 2114;
      v59 = v20;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - itemDidBecomeCurrent - %{public}@ [Source: %{public}@] - timeStamp:%{public}@", (uint8_t *)&time, 0x34u);

    }
    if (a4 == 1)
    {
      -[_MPCPlaybackEnginePlayer translator](self, "translator");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setMPAVItem:forMFPlayerItem:", v13, v9);

      objc_msgSend(v13, "_didBecomeActivePlayerItem");
      -[_MPCPlaybackEnginePlayer configurator](self, "configurator");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updatePlayerConfiguration");

      objc_msgSend(v11, "leaseManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "prepareForCurrentItemPlayback");

      -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "currentState");
      -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v25 == 1)
        objc_msgSend(v26, "targetRate");
      else
        objc_msgSend(v26, "rate");
      v29 = v28;

      LODWORD(v30) = v29;
      objc_msgSend(v13, "prepareForRate:completionHandler:", &__block_literal_global_148, v30);
    }
    -[_MPCPlaybackEnginePlayer bookmarker](self, "bookmarker");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "time");
    objc_msgSend(v31, "itemDidBecomeCurrent:time:", v9);

    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "currentState");

    if (v33 == 1)
      -[_MPCPlaybackEnginePlayer takeEVSDeferralAssertionForFirstAudioFrame](self, "takeEVSDeferralAssertionForFirstAudioFrame");
    if (!a4)
    {
      objc_msgSend(v11, "queueController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "playerItemDidBecomeCurrent:", v13);

      objc_msgSend(v11, "queueController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "currentItem");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36 == v13)
      {
        objc_msgSend(v11, "eventObserver");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "engine:didChangeToItem:", v11, v13);

        objc_msgSend(v11, "schedulePlaybackStatePreservation");
      }
      else
      {
        v52[0] = CFSTR("current queuecontroller item");
        v37 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v11, "queueController");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "currentItem");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", CFSTR("%@"), v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = CFSTR("current player item");
        v53[0] = v40;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v13);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v53[1] = v41;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = (void *)MEMORY[0x24BE65C38];
        v44 = *MEMORY[0x24BE65AB0];
        v51 = v42;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v44, CFSTR("Bug"), CFSTR("itemDidBecomeCurrent"), CFSTR("Mismatch between playback stack current item and queue controller current item"), 0, v45, 0);

        v46 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "queueController");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "currentItem");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(time.value) = 138543618;
          *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v13;
          LOWORD(time.flags) = 2114;
          *(_QWORD *)((char *)&time.flags + 2) = v48;
          _os_log_impl(&dword_210BD8000, v46, OS_LOG_TYPE_DEFAULT, "Mismatch between playback stack current item %{public}@ and queue controller current item %{public}@", (uint8_t *)&time, 0x16u);

        }
      }
    }

  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCPlaybackEnginePlayer.m"), 944, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source == MFItemChangeSourceQueue"));

    }
    objc_msgSend(v11, "queueController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "targetContentItemID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(v11, "queueController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "playerItemDidBecomeCurrent:", 0);

    }
    objc_msgSend(v11, "eventObserver");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "engine:didChangeToItem:", v11, 0);

    objc_msgSend(v11, "schedulePlaybackStatePreservation");
  }

}

- (MPCItemBookmarker)bookmarker
{
  return self->_bookmarker;
}

- (NSNumber)currentRelativeVolume
{
  return self->_currentRelativeVolume;
}

- (void)dealloc
{
  objc_super v3;

  MEMORY[0x212BD20AC](self->_stateHandle, a2);
  v3.receiver = self;
  v3.super_class = (Class)_MPCPlaybackEnginePlayer;
  -[_MPCPlaybackEnginePlayer dealloc](&v3, sel_dealloc);
}

- (void)finalizeSetQueue:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(void *, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void (**v28)(void *, _QWORD);
  void *v29;
  NSObject *v30;
  void (**v31)(void *, _QWORD);
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void (**v36)(_QWORD);
  id v37;
  int v38;
  NSObject *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
  double v43;
  void *v44;
  uint64_t v45;
  int v46;
  int v47;
  void *v48;
  double v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  _QWORD v58[4];
  void (**v59)(_QWORD);
  os_signpost_id_t v60;
  _QWORD v61[4];
  id v62;
  _MPCPlaybackEnginePlayer *v63;
  id v64;
  id v65;
  id v66;
  char v67;
  _QWORD v68[4];
  id v69;
  id v70;
  _QWORD aBlock[4];
  id v72;
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  _BYTE location[12];
  __int16 v79;
  _MPCPlaybackEnginePlayer *v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = _Block_copy(a4);
  v8 = objc_alloc(MEMORY[0x24BE65C40]);
  v9 = MEMORY[0x24BDAC760];
  v75[0] = MEMORY[0x24BDAC760];
  v75[1] = 3221225472;
  v75[2] = __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke;
  v75[3] = &unk_24CAB9830;
  v10 = v7;
  v77 = v10;
  v11 = v6;
  v76 = v11;
  aBlock[0] = v9;
  aBlock[1] = 3221225472;
  aBlock[2] = __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_2;
  aBlock[3] = &unk_24CAB9CA8;
  v12 = (id)objc_msgSend(v8, "initWithDeallocHandler:", v75);
  v72 = v12;
  v13 = v10;
  v74 = v13;
  v14 = v11;
  v73 = v14;
  v15 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(v14, "commandID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "engineID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "playbackQueue");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v54, "isRequestingImmediatePlayback");
  if (v57)
    -[_MPCPlaybackEnginePlayer takeEVSDeferralAssertionForFirstAudioFrame](self, "takeEVSDeferralAssertionForFirstAudioFrame");
  else
    -[_MPCPlaybackEnginePlayer invalidateEVSDeferralAssertionForFirstAudioFrame](self, "invalidateEVSDeferralAssertionForFirstAudioFrame");
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "currentQueueItem");
  v20 = objc_claimAutoreleasedReturnValue();

  v56 = (void *)v20;
  if (v20)
  {
    v55 = v18;
    v53 = v16;
    objc_msgSend(v14, "playbackQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "siriReferenceIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      v50 = v13;
      v51 = v12;
      objc_msgSend(v14, "playbackQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "featureName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("siri"));

      if ((v57 & 1) == 0)
      {
        v27 = v17;
        if (v26)
        {
          v15[2](v15, 0);
          objc_initWeak((id *)location, self);
          v68[0] = MEMORY[0x24BDAC760];
          v68[1] = 3221225472;
          v68[2] = __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_72;
          v68[3] = &unk_24CAB0DE8;
          objc_copyWeak(&v70, (id *)location);
          v69 = v55;
          v28 = (void (**)(void *, _QWORD))_Block_copy(v68);

          objc_destroyWeak(&v70);
          objc_destroyWeak((id *)location);
          v15 = v28;
        }
        v29 = v50;
        v12 = v51;
        goto LABEL_16;
      }
      v29 = v13;
      v12 = v51;
    }
    else
    {

      v29 = v13;
    }
    v27 = v17;
LABEL_16:
    objc_msgSend(v27, "queueController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "preferredFirstContentItemID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCPlaybackEnginePlayer errorController](self, "errorController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setPreferredFirstContentItemID:", v33);

    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_73;
    v61[3] = &unk_24CAB0E38;
    v62 = v55;
    v63 = self;
    v35 = v56;
    v64 = v35;
    v67 = v57;
    v65 = v53;
    v31 = v15;
    v66 = v31;
    v36 = (void (**)(_QWORD))_Block_copy(v61);
    v37 = v35;
    if (objc_msgSend(v37, "isAssetLoaded")
      && objc_msgSend(v37, "canUseLoadedAsset")
      && (v38 = objc_msgSend(v37, "canReusePlayerItem"), v57)
      && v38)
    {
      v52 = v12;
      v39 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      v40 = os_signpost_id_generate(v39);

      v41 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      v42 = v41;
      if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
      {
        *(_WORD *)location = 0;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "PrepareForRate", ", location, 2u);
      }

      v58[0] = MEMORY[0x24BDAC760];
      v58[1] = 3221225472;
      v58[2] = __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_78;
      v58[3] = &unk_24CAB4C10;
      v60 = v40;
      v59 = v36;
      LODWORD(v43) = 1.0;
      objc_msgSend(v37, "prepareForRate:completionHandler:", v58, v43);

      v12 = v52;
    }
    else
    {
      v36[2](v36);
    }
    objc_msgSend(v27, "queueController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "behaviorType");

    if (v57 && v45 == 4)
    {
      +[_MPCPodcastsPlaybackRateHelper preferredPlaybackRate](_MPCPodcastsPlaybackRateHelper, "preferredPlaybackRate");
      v47 = v46;
      objc_msgSend(v27, "player");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v49) = v47;
      objc_msgSend(v48, "setRate:identifier:completion:", CFSTR("userDefaultsRate"), &__block_literal_global, v49);

    }
    v16 = v53;
    v18 = v55;
    goto LABEL_29;
  }
  v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = v18;
    v79 = 2048;
    v80 = self;
    _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlaybackEngineImplementation: %p - finalizeSetQueue completed without a start item [empty queue]", location, 0x16u);
  }

  v15[2](v15, 0);
  v29 = v13;
  v27 = v17;
  v31 = v15;
LABEL_29:

}

- (void)finalizeStateRestoreWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v4 = a3;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63___MPCPlaybackEnginePlayer_finalizeStateRestoreWithCompletion___block_invoke;
  v10[3] = &unk_24CAB2D28;
  objc_copyWeak(&v13, &location);
  v8 = v4;
  v12 = v8;
  v9 = v6;
  v11 = v9;
  objc_msgSend(v7, "restoreQueue:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)becomeActiveWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  -[_MPCPlaybackEnginePlayer setupPlaybackStackIfNeeded](self, "setupPlaybackStackIfNeeded");
  objc_initWeak(&location, self);
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55___MPCPlaybackEnginePlayer_becomeActiveWithCompletion___block_invoke;
  v12[3] = &unk_24CAB0E80;
  v9 = v7;
  v13 = v9;
  objc_copyWeak(&v16, &location);
  v10 = v6;
  v14 = v10;
  v11 = v4;
  v15 = v11;
  objc_msgSend(v8, "activateAudioSessionWithCompletion:", v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)deactivateAudioSessionIfIdle:(int64_t)a3
{
  id v4;

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateAudioSessionIfIdle:", a3);

}

- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 withDuration:(double)a4
{
  id v7;

  -[_MPCPlaybackEnginePlayer setApplicationMusicPlayerTransitionType:](self, "setApplicationMusicPlayerTransitionType:");
  -[_MPCPlaybackEnginePlayer setApplicationMusicPlayerCrossFadeDuration:](self, "setApplicationMusicPlayerCrossFadeDuration:", a4);
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setApplicationMusicPlayerTransitionType:duration:", a3, a4);

}

- (void)updateAudioSessionSpeechDetection
{
  void *v3;
  id v4;

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInhibitSpeechDetection:", objc_msgSend(v3, "isVocalAttenuationEnabled"));

}

- (float)currentRate
{
  void *v2;
  float v3;
  float v4;

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v4 = v3;

  return v4;
}

- (int64_t)state
{
  void *v2;
  unint64_t v3;
  int64_t v4;

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentState");
  if (v3 > 7)
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = qword_210ED9148[v3];

  return v4;
}

- (int64_t)stateBeforeInterruption
{
  void *v2;
  unint64_t v3;
  int64_t v4;

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "interruptedState");
  if (v3 > 7)
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = qword_210ED9148[v3];

  return v4;
}

- (BOOL)hasPlayedSuccessfully
{
  void *v2;
  char v3;

  -[_MPCPlaybackEnginePlayer errorController](self, "errorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "itemsHavePlayed");

  return v3;
}

- (void)playWithRate:(float)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a4;
  v9 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "engineID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_MPCPlaybackEnginePlayer takeEVSDeferralAssertionForFirstAudioFrame](self, "takeEVSDeferralAssertionForFirstAudioFrame");
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __63___MPCPlaybackEnginePlayer_playWithRate_identifier_completion___block_invoke;
    v16[3] = &unk_24CAB69B0;
    v17 = v11;
    v18 = v8;
    v19 = v9;
    *(float *)&v14 = a3;
    objc_msgSend(v13, "playWithRate:identifier:completion:", v18, v16, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 60, CFSTR("Playback engine stack has not been setup yet. Set a playback queue first before calling %s."), "-[_MPCPlaybackEnginePlayer playWithRate:identifier:completion:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v15);

  }
}

- (void)pauseWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[_MPCPlaybackEnginePlayer invalidateEVSDeferralAssertionForFirstAudioFrame](self, "invalidateEVSDeferralAssertionForFirstAudioFrame");
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engineID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59___MPCPlaybackEnginePlayer_pauseWithIdentifier_completion___block_invoke;
    v13[3] = &unk_24CAB69B0;
    v14 = v9;
    v15 = v6;
    v16 = v7;
    objc_msgSend(v11, "pauseWithIdentifier:completion:", v15, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 60, CFSTR("Playback engine stack has not been setup yet. Set a playback queue first before calling %s."), "-[_MPCPlaybackEnginePlayer pauseWithIdentifier:completion:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);

  }
}

- (void)pauseWithFadeout:(double)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  -[_MPCPlaybackEnginePlayer invalidateEVSDeferralAssertionForFirstAudioFrame](self, "invalidateEVSDeferralAssertionForFirstAudioFrame");
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "engineID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __67___MPCPlaybackEnginePlayer_pauseWithFadeout_identifier_completion___block_invoke;
    v15[3] = &unk_24CAB69B0;
    v16 = v11;
    v17 = v8;
    v18 = v9;
    objc_msgSend(v13, "pauseWithFadeOut:identifier:completion:", v17, v15, a3);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 60, CFSTR("Playback engine stack has not been setup yet. Set a playback queue first before calling %s."), "-[_MPCPlaybackEnginePlayer pauseWithFadeout:identifier:completion:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v14);

  }
}

- (void)pauseForSleepTimerWithFadeout:(double)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  -[_MPCPlaybackEnginePlayer invalidateEVSDeferralAssertionForFirstAudioFrame](self, "invalidateEVSDeferralAssertionForFirstAudioFrame");
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "engineID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __80___MPCPlaybackEnginePlayer_pauseForSleepTimerWithFadeout_identifier_completion___block_invoke;
    v15[3] = &unk_24CAB69B0;
    v16 = v11;
    v17 = v8;
    v18 = v9;
    objc_msgSend(v13, "pauseForSleepTimerWithFadeOut:identifier:completion:", v17, v15, a3);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 60, CFSTR("Playback engine stack has not been setup yet. Set a playback queue first before calling %s."), "-[_MPCPlaybackEnginePlayer pauseForSleepTimerWithFadeout:identifier:completion:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v14);

  }
}

- (void)pauseForLeasePreventionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[_MPCPlaybackEnginePlayer invalidateEVSDeferralAssertionForFirstAudioFrame](self, "invalidateEVSDeferralAssertionForFirstAudioFrame");
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engineID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __77___MPCPlaybackEnginePlayer_pauseForLeasePreventionWithIdentifier_completion___block_invoke;
    v13[3] = &unk_24CAB69B0;
    v14 = v9;
    v15 = v6;
    v16 = v7;
    objc_msgSend(v11, "pauseForLeasePreventionWithIdentifier:completion:", v15, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 60, CFSTR("Playback engine stack has not been setup yet. Set a playback queue first before calling %s."), "-[_MPCPlaybackEnginePlayer pauseForLeasePreventionWithIdentifier:completion:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);

  }
}

- (void)togglePlaybackWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id WeakRetained;
  void *v14;
  float v15;
  float v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _MPCPlaybackEnginePlayer *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;

  v6 = a3;
  v7 = a4;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engineID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "currentState");

    switch(v12)
    {
      case 0:
      case 2:
      case 7:
        -[_MPCPlaybackEnginePlayer takeEVSDeferralAssertionForFirstAudioFrame](self, "takeEVSDeferralAssertionForFirstAudioFrame");
        WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
        objc_msgSend(WeakRetained, "queueController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 1.0;
        if (objc_msgSend(v14, "behaviorType") == 4)
        {
          +[_MPCPodcastsPlaybackRateHelper preferredPlaybackRate](_MPCPodcastsPlaybackRateHelper, "preferredPlaybackRate");
          v15 = v16;
        }

        -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __68___MPCPlaybackEnginePlayer_togglePlaybackWithIdentifier_completion___block_invoke_88;
        v25[3] = &unk_24CAB0EA8;
        v26 = v9;
        v27 = v6;
        v28 = self;
        v29 = v7;
        *(float *)&v18 = v15;
        objc_msgSend(v17, "playWithRate:identifier:completion:", v27, v25, v18);

        v19 = v26;
        break;
      case 1:
        -[_MPCPlaybackEnginePlayer invalidateEVSDeferralAssertionForFirstAudioFrame](self, "invalidateEVSDeferralAssertionForFirstAudioFrame");
        -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __68___MPCPlaybackEnginePlayer_togglePlaybackWithIdentifier_completion___block_invoke;
        v30[3] = &unk_24CAB69B0;
        v31 = v9;
        v32 = v6;
        v33 = v7;
        objc_msgSend(v21, "pauseWithIdentifier:completion:", v32, v30);

        v19 = v31;
        break;
      default:
        -[_MPCPlaybackEnginePlayer invalidateEVSDeferralAssertionForFirstAudioFrame](self, "invalidateEVSDeferralAssertionForFirstAudioFrame");
        v22 = (void *)MEMORY[0x24BDD1540];
        -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFDescription forPlayerState:](MFDescription, "forPlayerState:", objc_msgSend(v20, "currentState"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCError"), 0, 0, CFSTR("Attemping to toggle playback with incompatible state - CurrentState:%@"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v7 + 2))(v7, v24);

        goto LABEL_10;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 60, CFSTR("Playback engine stack has not been setup yet. Set a playback queue first before calling %s."), "-[_MPCPlaybackEnginePlayer togglePlaybackWithIdentifier:completion:]");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v20);
LABEL_10:

  }
}

- (void)endScanningWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engineID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __65___MPCPlaybackEnginePlayer_endScanningWithIdentifier_completion___block_invoke;
    v13[3] = &unk_24CAB69B0;
    v14 = v9;
    v15 = v6;
    v16 = v7;
    objc_msgSend(v11, "endScanningWithIdentifier:completion:", v15, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 60, CFSTR("Playback engine stack has not been setup yet. Set a playback queue first before calling %s."), "-[_MPCPlaybackEnginePlayer endScanningWithIdentifier:completion:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);

  }
}

- (void)setRate:(float)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  float v21;
  id location;

  v8 = a4;
  v9 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "engineID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_initWeak(&location, self);
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __58___MPCPlaybackEnginePlayer_setRate_identifier_completion___block_invoke;
    v16[3] = &unk_24CAB0ED0;
    objc_copyWeak(&v20, &location);
    v17 = v11;
    v18 = v8;
    v21 = a3;
    v19 = v9;
    *(float *)&v14 = a3;
    objc_msgSend(v13, "setRate:identifier:completion:", v18, v16, v14);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 60, CFSTR("Playback engine stack has not been setup yet. Set a playback queue first before calling %s."), "-[_MPCPlaybackEnginePlayer setRate:identifier:completion:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v15);

  }
}

- (void)jumpToTime:(double)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  double v19;

  v8 = a4;
  v9 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "engineID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __61___MPCPlaybackEnginePlayer_jumpToTime_identifier_completion___block_invoke;
    v15[3] = &unk_24CAB0EF8;
    v16 = v11;
    v17 = v8;
    v19 = a3;
    v18 = v9;
    objc_msgSend(v13, "jumpTo:identifier:completion:", v17, v15, a3);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 60, CFSTR("Playback engine stack has not been setup yet. Set a playback queue first before calling %s."), "-[_MPCPlaybackEnginePlayer jumpToTime:identifier:completion:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v14);

  }
}

- (void)setRelativeVolume:(float)a3
{
  void *v5;
  double v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer setCurrentRelativeVolume:](self, "setCurrentRelativeVolume:", v5);

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v7, "setRelativeVolume:", v6);

}

- (float)relativeVolume
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  float v8;

  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relativeVolume");
    v6 = v5;
  }
  else
  {
    -[_MPCPlaybackEnginePlayer currentRelativeVolume](self, "currentRelativeVolume");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[_MPCPlaybackEnginePlayer currentRelativeVolume](self, "currentRelativeVolume");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v6 = v8;

    }
    else
    {
      v6 = 1.0;
    }
  }

  return v6;
}

- (NSDictionary)_stateDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[7];
  _QWORD v30[9];

  v30[7] = *MEMORY[0x24BDAC8D0];
  v29[0] = CFSTR("playbackState");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v28, "currentState"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v27;
  v29[1] = CFSTR("currentItem");
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "currentItem");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("@");
  v30[1] = v6;
  v29[2] = CFSTR("currentRate");
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rate");
  objc_msgSend(v7, "numberWithFloat:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v24;
  v29[3] = CFSTR("currentTime");
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentTime");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v10;
  v29[4] = CFSTR("targetRate");
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "targetRate");
  objc_msgSend(v11, "numberWithFloat:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v13;
  v29[5] = CFSTR("MediaFoundationStack");
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stateDictionary");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = CFSTR("@");
  v30[5] = v17;
  v29[6] = CFSTR("engineID");
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "engineID");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = CFSTR("N/A");
  if (v19)
    v21 = (const __CFString *)v19;
  v30[6] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v22;
}

- (void)_logTimeJumpForItem:(id)a3 fromTime:(double)a4 toTime:(double)a5 userInitiated:(BOOL)a6 timeStamp:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  double v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int64_t jumpIdentifier;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  CMTime v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[6];
  _QWORD v47[6];
  _BYTE time[32];
  uint64_t v49;
  double v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v8 = a6;
  v57 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  if (v8)
    goto LABEL_5;
  v14 = a4 - a5;
  if (a4 - a5 < 0.0)
    v14 = -(a4 - a5);
  if (v14 > 0.25)
  {
LABEL_5:
    -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "engineID");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v15;
      jumpIdentifier = self->_jumpIdentifier;
      if (v13)
        objc_msgSend(v13, "hostTime");
      else
        memset(time, 0, 24);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds((CMTime *)time));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)time = 138545154;
      *(_QWORD *)&time[4] = v16;
      *(_WORD *)&time[12] = 2114;
      *(_QWORD *)&time[14] = self;
      *(_WORD *)&time[22] = 2048;
      *(_QWORD *)&time[24] = jumpIdentifier;
      LOWORD(v49) = 1024;
      *(_DWORD *)((char *)&v49 + 2) = v8;
      HIWORD(v49) = 2048;
      v50 = a4;
      v51 = 2048;
      v52 = a5;
      v53 = 2048;
      v54 = a5 - a4;
      v55 = 2114;
      v56 = v20;
      _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - _logTimeJumpForItem - jumpIdentifier: %ld - userInitiated:%{BOOL}u - %.2fs -> %.2fs [D:%.2fs]- timeStamp:%{public}@", time, 0x4Eu);

      v15 = v18;
    }

    v39 = v13;
    v21 = v13;
    v22 = v21;
    v38 = (void *)v16;
    if (v21)
    {
      objc_msgSend(v21, "hostTime");
      if ((v44 & 0x100000000) != 0)
      {
        objc_msgSend(v22, "hostTime");
        MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v42, (uint64_t)time);
        goto LABEL_15;
      }
    }
    else
    {
      v43 = 0;
      v44 = 0;
      v45 = 0;
    }
    MPCPlaybackEngineEventGetMonotonicTime(time);
LABEL_15:
    v40 = *(_OWORD *)time;
    v41 = *(_OWORD *)&time[16];
    objc_msgSend(v22, "userSecondsSinceReferenceDate");
    v24 = v23;

    -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "queueSectionID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "queueItemID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "length"))
    {
      if (objc_msgSend(v27, "length"))
      {
        objc_msgSend(v15, "eventStream");
        v37 = v12;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = CFSTR("queue-section-id");
        v46[1] = CFSTR("queue-item-id");
        v47[0] = v26;
        v47[1] = v27;
        v46[2] = CFSTR("item-start-position");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v47[2] = v36;
        v46[3] = CFSTR("item-end-position");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v47[3] = v29;
        v46[4] = CFSTR("item-jump-user-initiated");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v47[4] = v30;
        v46[5] = CFSTR("item-jump-identifier");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_jumpIdentifier);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v47[5] = v31;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 6);
        v32 = v15;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_OWORD *)time = v40;
        *(_OWORD *)&time[16] = v41;
        v49 = v24;
        objc_msgSend(v28, "emitEventType:payload:atTime:", CFSTR("item-position-jump"), v33, time);

        v15 = v32;
        v12 = v37;
        ++self->_jumpIdentifier;
LABEL_24:
        v13 = v39;

        goto LABEL_25;
      }
      v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)time = 138543618;
        *(_QWORD *)&time[4] = v12;
        *(_WORD *)&time[12] = 2114;
        *(_QWORD *)&time[14] = v27;
        v35 = "Unexpected _logTimeJumpForItem: without itemID: %{public}@ %{public}@";
        goto LABEL_22;
      }
    }
    else
    {
      v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)time = 138543618;
        *(_QWORD *)&time[4] = v12;
        *(_WORD *)&time[12] = 2114;
        *(_QWORD *)&time[14] = v26;
        v35 = "Unexpected _logTimeJumpForItem: without sectionID: %{public}@ %{public}@";
LABEL_22:
        _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_FAULT, v35, time, 0x16u);
      }
    }

    goto LABEL_24;
  }
LABEL_25:

}

- (void)_playbackDidStopForItem:(id)a3 source:(id)a4 reason:(id)a5 time:(double)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  double v24;
  const char *v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "queueSectionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "queueItemID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "length"))
  {
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 138543618;
    v30 = v10;
    v31 = 2114;
    v32 = v14;
    v25 = "Unexpected _playbackDidStopForItem: without sectionID: %{public}@ %{public}@";
LABEL_10:
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_FAULT, v25, buf, 0x16u);
    goto LABEL_11;
  }
  if (!objc_msgSend(v15, "length"))
  {
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 138543618;
    v30 = v10;
    v31 = 2114;
    v32 = v15;
    v25 = "Unexpected _playbackDidStopForItem: without itemID: %{public}@ %{public}@";
    goto LABEL_10;
  }
  -[_MPCPlaybackEnginePlayer bookmarker](self, "bookmarker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "playbackDidStopForItem:time:", v10, a6);

  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v17 = objc_claimAutoreleasedReturnValue();
  -[NSObject eventStream](v17, "eventStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("queue-section-id");
  v27[1] = CFSTR("queue-item-id");
  v28[0] = v14;
  v28[1] = v15;
  v27[2] = CFSTR("item-end-position");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v19;
  v28[3] = v12;
  v27[3] = CFSTR("item-rate-change-reason");
  v27[4] = CFSTR("item-rate-change-source");
  v26 = v11;
  v28[4] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "emitEventType:payload:", CFSTR("item-pause"), v20);

  -[NSObject eventObserver](v17, "eventObserver");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rate");
  LODWORD(v24) = v23;
  objc_msgSend(v21, "engine:didChangeItemElapsedTime:rate:", v17, a6, v24);

  if (objc_msgSend(v12, "isEqualToString:", CFSTR("end of queue reached")))
    objc_msgSend(v13, "setInitialPlaybackStartTimeOverride:", 0);
  v11 = v26;
LABEL_11:

}

- (BOOL)_isAVKitSkipAction:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if ((unint64_t)(objc_msgSend(v3, "type") - 7) > 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "sourceID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AVMusicAppBehavior"));

  }
  return v5;
}

- (void)_performSkipForUserAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_MPCPlaybackEnginePlayer _isAVKitSkipAction:](self, "_isAVKitSkipAction:", v4))
  {
    objc_msgSend(v5, "mediaRemotePublisher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commandCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "type") == 7)
      objc_msgSend(v8, "nextTrackCommand");
    else
      objc_msgSend(v8, "previousTrackCommand");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDDCB68];
    v20 = CFSTR("MPCRemoteCommandEventOptionSkipImmediatelyKey");
    v21[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eventWithCommand:mediaRemoteType:options:", v9, 4, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543874;
      v15 = v6;
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Triggering MR command %{public}@ from userAction: %{public}@", (uint8_t *)&v14, 0x20u);
    }

    objc_msgSend(v9, "invokeCommandWithEvent:completion:", v12, &__block_literal_global_138);
  }

}

- (BOOL)_itemConfigurationIsIncompatibleWithVocalAttenuationState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (objc_msgSend(v3, "supportsVocalAttenuation"))
    v4 = objc_msgSend(v3, "isConfiguredForVocalAttenuation") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)engine:(id)a3 willRemoveQueueController:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "teardownForQueueWithSessionID:", v6);
}

- (void)engine:(id)a3 didChangeQueueWithReason:(id)a4
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  id v13;

  -[_MPCPlaybackEnginePlayer bookmarker](self, "bookmarker", a3, a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentTime");
  v7 = v6;
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "effectiveRate");
  LODWORD(v12) = v11;
  objc_msgSend(v13, "updateDurationSnapshotWithTime:forItem:rate:", v9, v7, v12);

}

- (void)overlappedPlaybackWillBeginFrom:(id)a3 to:(id)a4 transitionTime:(id)a5 transitionType:(int64_t)a6 timeStamp:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int64x2_t v42;
  void *v43;
  void *v44;
  void *v45;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  CMTime v66;
  void *v67;
  void *v68;
  void *v69;
  void *v71;
  void *v72;
  CMTimeValue value;
  int64x2_t v74;
  void *v75;
  double v76;
  CMTime v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD v81[9];
  _QWORD v82[9];
  _QWORD v83[10];
  _QWORD v84[10];
  CMTime time;
  void *v86;
  _BYTE v87[10];
  __int16 v88;
  id v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "engineID");
  v16 = objc_claimAutoreleasedReturnValue();
  v72 = v11;
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v12;
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "startItemSourceTime");
    v21 = v20;
    objc_msgSend(v13, "endItemSourceTime");
    v23 = v22;
    if (v14)
      objc_msgSend(v14, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544898;
    *(CMTimeValue *)((char *)&time.value + 4) = v16;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v86 = v72;
    *(_WORD *)v87 = 2048;
    *(_QWORD *)&v87[2] = v21;
    v88 = 2114;
    v89 = v12;
    v90 = 2048;
    v91 = v23;
    v92 = 2114;
    v93 = v24;
    _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - overlappedPlaybackWillBegin - %{public}@ [%3.2fs] -> %{public}@ [%3.2fs] - timeStamp:%{public}@", (uint8_t *)&time, 0x48u);

  }
  v25 = v14;
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "hostTime");
    if ((v79 & 0x100000000) != 0)
    {
      objc_msgSend(v26, "hostTime");
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v77, (uint64_t)&time);
      goto LABEL_11;
    }
  }
  else
  {
    v78 = 0;
    v79 = 0;
    v80 = 0;
  }
  MPCPlaybackEngineEventGetMonotonicTime(&time);
LABEL_11:
  v66 = time;
  v65 = v86;
  objc_msgSend(v26, "userSecondsSinceReferenceDate");
  v28 = v27;
  v63 = (void *)v16;

  v67 = v26;
  v68 = v18;
  v69 = v17;
  v64 = v15;
  if (a6 == 1)
  {
    -[_MPCPlaybackEnginePlayer bookmarker](self, "bookmarker");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "itemTransitionWillBeginFrom:to:type:timeStamp:", v72, v12, 1, v67);

    objc_msgSend(v15, "eventStream");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = CFSTR("outgoing-item-section-id");
    objc_msgSend(v17, "queueSectionID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v61;
    v83[1] = CFSTR("outgoing-item-id");
    objc_msgSend(v17, "queueItemID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v59;
    v83[2] = CFSTR("transition-outgoing-item-source-time");
    v30 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v13, "startItemSourceTime");
    objc_msgSend(v30, "numberWithDouble:");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v84[2] = v57;
    v83[3] = CFSTR("transition-outgoing-item-target-time");
    v31 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v13, "startItemTargetTime");
    objc_msgSend(v31, "numberWithDouble:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v84[3] = v32;
    v83[4] = CFSTR("incoming-item-section-id");
    objc_msgSend(v18, "queueSectionID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v84[4] = v33;
    v83[5] = CFSTR("incoming-item-id");
    objc_msgSend(v18, "queueItemID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v84[5] = v34;
    v83[6] = CFSTR("transition-incoming-item-source-time");
    v35 = v13;
    v36 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v35, "endItemSourceTime");
    objc_msgSend(v36, "numberWithDouble:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v84[6] = v37;
    v83[7] = CFSTR("transition-incoming-item-target-time");
    v38 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v35, "endItemTargetTime");
    objc_msgSend(v38, "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v84[7] = v39;
    v83[8] = CFSTR("transition-type");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v83[9] = CFSTR("transition-average-rate");
    v84[8] = v40;
    v84[9] = &unk_24CB16830;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 10);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    value = v66.value;
    v42.i64[0] = -1;
    v42.i64[1] = -1;
    v74 = vaddq_s64(*(int64x2_t *)&v66.timescale, v42);
    v75 = v65;
    v76 = v28 + -0.000000001;
    objc_msgSend(v56, "emitEventType:payload:atTime:", CFSTR("transition-will-start"), v41, &value);

    v15 = v64;
    v13 = v35;
    v18 = v68;

    v17 = v69;
  }
  objc_msgSend(v15, "eventStream");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = CFSTR("outgoing-item-section-id");
  objc_msgSend(v17, "queueSectionID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v62;
  v81[1] = CFSTR("outgoing-item-id");
  objc_msgSend(v17, "queueItemID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v60;
  v81[2] = CFSTR("transition-outgoing-item-source-time");
  v43 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v13, "startItemSourceTime");
  objc_msgSend(v43, "numberWithDouble:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v44;
  v81[3] = CFSTR("transition-outgoing-item-target-time");
  v45 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v13, "startItemTargetTime");
  objc_msgSend(v45, "numberWithDouble:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v46;
  v81[4] = CFSTR("incoming-item-section-id");
  objc_msgSend(v18, "queueSectionID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v82[4] = v47;
  v81[5] = CFSTR("incoming-item-id");
  objc_msgSend(v18, "queueItemID");
  v48 = v13;
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v82[5] = v49;
  v81[6] = CFSTR("transition-incoming-item-source-time");
  v50 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v48, "endItemSourceTime");
  objc_msgSend(v50, "numberWithDouble:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v82[6] = v51;
  v81[7] = CFSTR("transition-incoming-item-target-time");
  v52 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v48, "endItemTargetTime");
  objc_msgSend(v52, "numberWithDouble:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v82[7] = v53;
  v81[8] = CFSTR("transition-type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v82[8] = v54;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 9);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  time = v66;
  v86 = v65;
  *(double *)v87 = v28;
  objc_msgSend(v58, "emitEventType:payload:atTime:", CFSTR("overlapped-playback-will-start"), v55, &time);

}

- (void)overlappedPlaybackDidEndFrom:(id)a3 to:(id)a4 transitionTime:(id)a5 transitionType:(int64_t)a6 timeStamp:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  CMTimeValue value;
  id v69;
  int64x2_t v70;
  void *v71;
  void *v72;
  void *v73;
  CMTimeValue v74;
  int64x2_t v75;
  id v76;
  double v77;
  CMTime v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[9];
  _QWORD v83[9];
  _QWORD v84[9];
  _QWORD v85[9];
  CMTime time;
  id v87;
  _BYTE v88[10];
  __int16 v89;
  void *v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "engineID");
  v16 = objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v12;
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "startItemSourceTime");
    v21 = v20;
    objc_msgSend(v13, "endItemSourceTime");
    v23 = v22;
    if (v14)
      objc_msgSend(v14, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544898;
    *(CMTimeValue *)((char *)&time.value + 4) = v16;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v87 = v11;
    *(_WORD *)v88 = 2048;
    *(_QWORD *)&v88[2] = v21;
    v89 = 2114;
    v90 = v73;
    v91 = 2048;
    v92 = v23;
    v93 = 2114;
    v94 = v24;
    _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - overlappedPlaybackDidEnd - %{public}@ [%3.2fs] -> %{public}@ [%3.2fs] - timeStamp:%{public}@", (uint8_t *)&time, 0x48u);

  }
  -[_MPCPlaybackEnginePlayer translator](self, "translator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setMPAVItem:forMFPlayerItem:", 0, v11);

  v26 = v14;
  v27 = v26;
  v72 = v11;
  v63 = (void *)v16;
  if (v26)
  {
    objc_msgSend(v26, "hostTime");
    if ((v80 & 0x100000000) != 0)
    {
      objc_msgSend(v27, "hostTime");
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v78, (uint64_t)&time);
      goto LABEL_11;
    }
  }
  else
  {
    v79 = 0;
    v80 = 0;
    v81 = 0;
  }
  MPCPlaybackEngineEventGetMonotonicTime(&time);
LABEL_11:
  v70 = *(int64x2_t *)&time.timescale;
  value = time.value;
  v69 = v87;
  objc_msgSend(v27, "userSecondsSinceReferenceDate");
  v29 = v28;

  objc_msgSend(v15, "eventStream");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = CFSTR("outgoing-item-section-id");
  objc_msgSend(v17, "queueSectionID");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v59;
  v84[1] = CFSTR("outgoing-item-id");
  objc_msgSend(v17, "queueItemID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v58;
  v84[2] = CFSTR("transition-outgoing-item-source-time");
  v71 = v27;
  v30 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v13, "startItemSourceTime");
  objc_msgSend(v30, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v31;
  v84[3] = CFSTR("transition-outgoing-item-target-time");
  v32 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v13, "startItemTargetTime");
  objc_msgSend(v32, "numberWithDouble:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v85[3] = v33;
  v84[4] = CFSTR("incoming-item-section-id");
  objc_msgSend(v18, "queueSectionID");
  v67 = v15;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v85[4] = v34;
  v84[5] = CFSTR("incoming-item-id");
  objc_msgSend(v18, "queueItemID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v85[5] = v35;
  v84[6] = CFSTR("transition-incoming-item-source-time");
  v65 = v17;
  v36 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v13, "endItemSourceTime");
  objc_msgSend(v36, "numberWithDouble:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v85[6] = v37;
  v84[7] = CFSTR("transition-incoming-item-target-time");
  v38 = v13;
  v39 = (void *)MEMORY[0x24BDD16E0];
  v66 = v38;
  objc_msgSend(v38, "endItemTargetTime");
  objc_msgSend(v39, "numberWithDouble:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v85[7] = v40;
  v84[8] = CFSTR("transition-type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
  v64 = v18;
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v85[8] = v41;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, v84, 9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  *(int64x2_t *)&time.timescale = v70;
  time.value = value;
  v87 = v69;
  *(double *)v88 = v29;
  objc_msgSend(v57, "emitEventType:payload:atTime:", CFSTR("overlapped-playback-did-end"), v42, &time);

  if (a6 == 1)
  {
    -[_MPCPlaybackEnginePlayer bookmarker](self, "bookmarker");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "itemTransitionWillBeginFrom:to:type:timeStamp:", v72, v73, 1, v71);

    objc_msgSend(v67, "eventStream");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = CFSTR("outgoing-item-section-id");
    objc_msgSend(v65, "queueSectionID");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v62;
    v82[1] = CFSTR("outgoing-item-id");
    objc_msgSend(v65, "queueItemID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = v44;
    v82[2] = CFSTR("transition-outgoing-item-source-time");
    v45 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v66, "startItemSourceTime");
    objc_msgSend(v45, "numberWithDouble:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v83[2] = v46;
    v82[3] = CFSTR("transition-outgoing-item-target-time");
    v47 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v66, "startItemTargetTime");
    objc_msgSend(v47, "numberWithDouble:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v83[3] = v48;
    v82[4] = CFSTR("incoming-item-section-id");
    objc_msgSend(v64, "queueSectionID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v83[4] = v49;
    v82[5] = CFSTR("incoming-item-id");
    objc_msgSend(v64, "queueItemID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v83[5] = v50;
    v82[6] = CFSTR("transition-incoming-item-source-time");
    v51 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v66, "endItemSourceTime");
    objc_msgSend(v51, "numberWithDouble:");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v83[6] = v52;
    v82[7] = CFSTR("transition-incoming-item-target-time");
    v53 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v66, "endItemTargetTime");
    objc_msgSend(v53, "numberWithDouble:");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v83[7] = v54;
    v82[8] = CFSTR("transition-type");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v83[8] = v55;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v83, v82, 9);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = value;
    v75 = vaddq_s64(v70, vdupq_n_s64(1uLL));
    v76 = v69;
    v77 = v29 + 0.000000001;
    objc_msgSend(v60, "emitEventType:payload:atTime:", CFSTR("transition-did-end"), v56, &v74);

  }
}

- (void)playbackDidReachQueueEndWithTimeStamp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  CMTime time;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      objc_msgSend(v4, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138543874;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v6;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v10 = v8;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackDidReachQueueEnd - timeStamp:%{public}@", (uint8_t *)&time, 0x20u);

  }
}

- (void)playbackTimeDidChangeTo:(double)a3 forItem:(id)a4 reason:(int64_t)a5 timeStamp:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  NSObject *v22;
  float v24;
  double v25;
  float v26;
  double v27;
  void *v28;
  const char *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  int v37;
  double v38;
  double v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  CMTime v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[3];
  _QWORD v69[3];
  _BYTE time[32];
  _BYTE v71[10];
  __int16 v72;
  double v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "engineID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _adjustPlayerTimeForAudioTapProcessing:](self, "_adjustPlayerTimeForAudioTapProcessing:", a3);
  v16 = v15;
  if (objc_msgSend(v14, "isAlwaysLive"))
  {
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (v11)
        objc_msgSend(v11, "hostTime");
      else
        memset(time, 0, 24);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds((CMTime *)time));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)time = 138544386;
      *(_QWORD *)&time[4] = v13;
      *(_WORD *)&time[12] = 2114;
      *(_QWORD *)&time[14] = self;
      *(_WORD *)&time[22] = 2048;
      *(double *)&time[24] = v16;
      *(_WORD *)v71 = 2114;
      *(_QWORD *)&v71[2] = v14;
      v72 = 2114;
      v73 = *(double *)&v28;
      v29 = "[%{public}@]-%{public}@ - playbackTimeDidChangeTo - Live item [ignoring time change] - time:%.2fs - item=%{p"
            "ublic}@ - timeStamp:%{public}@";
LABEL_19:
      _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, v29, time, 0x34u);
LABEL_35:

      goto LABEL_36;
    }
    goto LABEL_36;
  }
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "currentState") == 4)
  {

    goto LABEL_9;
  }
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v13;
  v20 = objc_msgSend(v19, "currentState");

  v21 = v20 == 3;
  v13 = v61;
  if (!v21)
  {
    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "rate");
      v25 = v24;
      -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "effectiveRate");
      v27 = v26;
      -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFDescription forPlayerState:](MFDescription, "forPlayerState:", objc_msgSend(v55, "currentState"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFDescription forPlaybackTimeChangeReason:](MFDescription, "forPlaybackTimeChangeReason:", a5);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v11, "hostTime");
      else
        memset(time, 0, 24);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds((CMTime *)time));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)time = 138545410;
      *(_QWORD *)&time[4] = v61;
      *(_WORD *)&time[12] = 2114;
      *(_QWORD *)&time[14] = self;
      *(_WORD *)&time[22] = 2048;
      *(double *)&time[24] = v16;
      *(_WORD *)v71 = 2048;
      *(double *)&v71[2] = v25;
      v72 = 2048;
      v73 = v27;
      v74 = 2114;
      v75 = v56;
      v76 = 2114;
      v77 = v14;
      v78 = 2114;
      v79 = v54;
      v80 = 2114;
      v81 = v30;
      _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackTimeDidChangeTo - Regular item [processing time change] - time:%.2fs - rate: %.2f - effectiveRate: %2f - state: %{public}@ - item=%{public}@ - reason:%{public}@ - timeStamp:%{public}@", time, 0x5Cu);

    }
    objc_msgSend(v14, "contentItem");
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject elapsedTimeTimestamp](v17, "elapsedTimeTimestamp");
    v32 = v31;
    -[NSObject calculatedElapsedTime](v17, "calculatedElapsedTime");
    v34 = v33;
    -[_MPCPlaybackEnginePlayer bookmarker](self, "bookmarker");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "effectiveRate");
    LODWORD(v38) = v37;
    objc_msgSend(v35, "updateDurationSnapshotWithTime:forItem:rate:", v10, v16, v38);

    -[NSObject elapsedTimeTimestamp](v17, "elapsedTimeTimestamp");
    if (a5 == 2 || a5 == 1 && v32 != v39)
    {
      -[_MPCPlaybackEnginePlayer _logTimeJumpForItem:fromTime:toTime:userInitiated:timeStamp:](self, "_logTimeJumpForItem:fromTime:toTime:userInitiated:timeStamp:", v14, a5 == 2, v11, v34, v16);
LABEL_34:
      v13 = v61;
      objc_msgSend(v12, "eventObserver");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "rate");
      LODWORD(v53) = v52;
      objc_msgSend(v28, "engine:didChangeItemElapsedTime:rate:", v12, v16, v53);

      goto LABEL_35;
    }
    -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v10);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v11;
    v42 = v41;
    if (v41)
    {
      objc_msgSend(v41, "hostTime");
      if ((v66 & 0x100000000) != 0)
      {
        objc_msgSend(v42, "hostTime");
        MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v64, (uint64_t)time);
LABEL_31:
        v62 = *(_OWORD *)time;
        v63 = *(_OWORD *)&time[16];
        objc_msgSend(v42, "userSecondsSinceReferenceDate");
        v44 = v43;

        objc_msgSend(v12, "eventStream");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v68[0] = CFSTR("queue-section-id");
        objc_msgSend(v40, "queueSectionID");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = v58;
        v68[1] = CFSTR("queue-item-id");
        objc_msgSend(v40, "queueItemID");
        v60 = v40;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v69[1] = v46;
        v68[2] = CFSTR("item-end-position");
        v47 = (void *)MEMORY[0x24BDD16E0];
        -[NSObject duration](v17, "duration");
        if (v48 > a3)
          v48 = a3;
        objc_msgSend(v47, "numberWithDouble:", fmax(v48, 0.0));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v69[2] = v49;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 3);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_OWORD *)time = v62;
        *(_OWORD *)&time[16] = v63;
        *(_QWORD *)v71 = v44;
        objc_msgSend(v45, "emitEventType:payload:atTime:", CFSTR("item-position-tick"), v50, time);

        goto LABEL_34;
      }
    }
    else
    {
      v65 = 0;
      v66 = 0;
      v67 = 0;
    }
    MPCPlaybackEngineEventGetMonotonicTime(time);
    goto LABEL_31;
  }
LABEL_9:
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v11)
      objc_msgSend(v11, "hostTime");
    else
      memset(time, 0, 24);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds((CMTime *)time));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)time = 138544386;
    *(_QWORD *)&time[4] = v13;
    *(_WORD *)&time[12] = 2114;
    *(_QWORD *)&time[14] = self;
    *(_WORD *)&time[22] = 2048;
    *(double *)&time[24] = v16;
    *(_WORD *)v71 = 2114;
    *(_QWORD *)&v71[2] = v14;
    v72 = 2114;
    v73 = *(double *)&v28;
    v29 = "[%{public}@]-%{public}@ - playbackTimeDidChangeTo - FF or RW [ignoring time change to avoid time snaps] - time"
          ":%.2fs - item=%{public}@ - timeStamp:%{public}@";
    goto LABEL_19;
  }
LABEL_36:

}

- (void)userSeekCompletedForItem:(id)a3 fromTime:(double)a4 toTime:(double)a5 timeStamp:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  void *v23;
  void *v24;
  int v25;
  double v26;
  CMTime time;
  void *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "engineID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _adjustPlayerTimeForAudioTapProcessing:](self, "_adjustPlayerTimeForAudioTapProcessing:", a5);
  v16 = v15;
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v11)
      objc_msgSend(v11, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544642;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v13;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v28 = v14;
    v29 = 2048;
    v30 = a4;
    v31 = 2048;
    v32 = v16;
    v33 = 2114;
    v34 = v18;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - userSeekCompletedForItem - item=%{public}@ - [%.2fs -> %.2fs]- timeStamp:%{public}@", (uint8_t *)&time, 0x3Eu);

  }
  -[_MPCPlaybackEnginePlayer bookmarker](self, "bookmarker");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "effectiveRate");
  LODWORD(v22) = v21;
  objc_msgSend(v19, "updateDurationSnapshotWithTime:forItem:rate:", v10, v16, v22);

  -[_MPCPlaybackEnginePlayer _logTimeJumpForItem:fromTime:toTime:userInitiated:timeStamp:](self, "_logTimeJumpForItem:fromTime:toTime:userInitiated:timeStamp:", v14, 1, v11, a4, v16);
  objc_msgSend(v12, "eventObserver");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rate");
  LODWORD(v26) = v25;
  objc_msgSend(v23, "engine:didChangeItemElapsedTime:rate:", v12, v16, v26);

}

- (void)itemDidFailToLoad:(id)a3 silently:(BOOL)a4 error:(id)a5 timeStamp:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  CMTime time;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v7 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = a3;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "engineID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v11)
      objc_msgSend(v11, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544642;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v14;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v20 = v15;
    v21 = 1024;
    v22 = v7;
    v23 = 2114;
    v24 = v10;
    v25 = 2114;
    v26 = v17;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - itemDidFailToLoad - item=%{public}@ - silently=%{BOOL}u - error=%{public}@ - timeStamp:%{public}@", (uint8_t *)&time, 0x3Au);

  }
  if (v7)
  {
    objc_msgSend(v13, "queueController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "playerItemDidBecomeCurrent:", v15);

  }
  else
  {
    -[_MPCPlaybackEnginePlayer invalidateEVSDeferralAssertionForFirstAudioFrame](self, "invalidateEVSDeferralAssertionForFirstAudioFrame");
  }

}

- (void)itemDidFailToPlayToEnd:(id)a3 error:(id)a4 timeStamp:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  id v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  CMTime v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  _QWORD v40[4];
  _BYTE time[32];
  _BYTE v42[10];
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "engineID");
  v12 = objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v10)
      objc_msgSend(v10, "hostTime");
    else
      memset(time, 0, 24);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds((CMTime *)time));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)time = 138544386;
    *(_QWORD *)&time[4] = v12;
    *(_WORD *)&time[12] = 2114;
    *(_QWORD *)&time[14] = self;
    *(_WORD *)&time[22] = 2114;
    *(_QWORD *)&time[24] = v13;
    *(_WORD *)v42 = 2114;
    *(_QWORD *)&v42[2] = v9;
    v43 = 2114;
    v44 = v15;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - itemDidFailToPlayToEnd - item=%{public}@ - error=%{public}@ - timeStamp:%{public}@", time, 0x34u);

  }
  v16 = v10;
  v17 = v16;
  v32 = (void *)v12;
  if (v16)
  {
    objc_msgSend(v16, "hostTime");
    if ((v37 & 0x100000000) != 0)
    {
      objc_msgSend(v17, "hostTime");
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v35, (uint64_t)time);
      goto LABEL_11;
    }
  }
  else
  {
    v36 = 0;
    v37 = 0;
    v38 = 0;
  }
  MPCPlaybackEngineEventGetMonotonicTime(time);
LABEL_11:
  v33 = *(_OWORD *)time;
  v34 = *(_OWORD *)&time[16];
  objc_msgSend(v17, "userSecondsSinceReferenceDate");
  v19 = v18;

  objc_msgSend(v13, "queueSectionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "queueItemID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "length"))
  {
    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      goto LABEL_23;
    *(_DWORD *)time = 138543618;
    *(_QWORD *)&time[4] = v8;
    *(_WORD *)&time[12] = 2114;
    *(_QWORD *)&time[14] = v20;
    v29 = "Unexpected itemDidFailToPlayToEnd: without sectionID: %{public}@ %{public}@";
LABEL_22:
    _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_FAULT, v29, time, 0x16u);
    goto LABEL_23;
  }
  if (!objc_msgSend(v21, "length"))
  {
    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      goto LABEL_23;
    *(_DWORD *)time = 138543618;
    *(_QWORD *)&time[4] = v8;
    *(_WORD *)&time[12] = 2114;
    *(_QWORD *)&time[14] = v21;
    v29 = "Unexpected itemDidFailToPlayToEnd: without itemID: %{public}@ %{public}@";
    goto LABEL_22;
  }
  v30 = v8;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v22 = objc_claimAutoreleasedReturnValue();
  -[NSObject eventStream](v22, "eventStream");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = CFSTR("queue-section-id");
  v39[1] = CFSTR("queue-item-id");
  v40[0] = v20;
  v40[1] = v21;
  v39[2] = CFSTR("asset-load-error");
  v23 = v9;
  v24 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[2] = v23;
  v39[3] = CFSTR("time-control-status");
  v25 = (void *)MEMORY[0x24BDD16E0];
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "timeControlStatus"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)time = v33;
  *(_OWORD *)&time[16] = v34;
  *(_QWORD *)v42 = v19;
  objc_msgSend(v31, "emitEventType:payload:atTime:", CFSTR("item-failed"), v28, time);

  v9 = v24;
  if (!v24)

  v8 = v30;
LABEL_23:

}

- (void)itemDidPlayToEnd:(id)a3 timeStamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CMTime time;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "engineID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
      objc_msgSend(v6, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544130;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v10;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - itemDidPlayToEnd - item=%{public}@ - timeStamp:%{public}@", (uint8_t *)&time, 0x2Au);

  }
  -[_MPCPlaybackEnginePlayer bookmarker](self, "bookmarker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "time");
  objc_msgSend(v13, "itemDidPlayToEnd:time:", v7);

  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventObserver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "engine:didEndPlaybackOfItem:", v14, v8);

}

- (void)itemIsReadyToPlay:(id)a3 timeStamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const char *v22;
  __int128 v23;
  __int128 v24;
  CMTime v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _BYTE time[32];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engineID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      objc_msgSend(v7, "hostTime");
    else
      memset(time, 0, 24);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds((CMTime *)time));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)time = 138544130;
    *(_QWORD *)&time[4] = v9;
    *(_WORD *)&time[12] = 2114;
    *(_QWORD *)&time[14] = self;
    *(_WORD *)&time[22] = 2114;
    *(_QWORD *)&time[24] = v10;
    LOWORD(v32[0]) = 2114;
    *(_QWORD *)((char *)v32 + 2) = v12;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - itemIsReadyToPlay - item=%{public}@ - timeStamp:%{public}@", time, 0x2Au);

  }
  v13 = v7;
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "hostTime");
    if ((v27 & 0x100000000) != 0)
    {
      objc_msgSend(v14, "hostTime");
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v25, (uint64_t)time);
      goto LABEL_11;
    }
  }
  else
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
  }
  MPCPlaybackEngineEventGetMonotonicTime(time);
LABEL_11:
  v23 = *(_OWORD *)time;
  v24 = *(_OWORD *)&time[16];
  objc_msgSend(v14, "userSecondsSinceReferenceDate");
  v16 = v15;

  objc_msgSend(v10, "queueSectionID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queueItemID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "length"))
  {
    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      goto LABEL_19;
    *(_DWORD *)time = 138543618;
    *(_QWORD *)&time[4] = v6;
    *(_WORD *)&time[12] = 2114;
    *(_QWORD *)&time[14] = v17;
    v22 = "Unexpected itemIsReadyToPlay: without sectionID: %{public}@ %{public}@";
LABEL_18:
    _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_FAULT, v22, time, 0x16u);
    goto LABEL_19;
  }
  if (!objc_msgSend(v18, "length"))
  {
    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      goto LABEL_19;
    *(_DWORD *)time = 138543618;
    *(_QWORD *)&time[4] = v6;
    *(_WORD *)&time[12] = 2114;
    *(_QWORD *)&time[14] = v18;
    v22 = "Unexpected itemIsReadyToPlay: without itemID: %{public}@ %{public}@";
    goto LABEL_18;
  }
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v19 = objc_claimAutoreleasedReturnValue();
  -[NSObject eventStream](v19, "eventStream");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = CFSTR("queue-section-id");
  v29[1] = CFSTR("queue-item-id");
  v30[0] = v17;
  v30[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)time = v23;
  *(_OWORD *)&time[16] = v24;
  v32[0] = v16;
  objc_msgSend(v20, "emitEventType:payload:atTime:", CFSTR("item-ready-to-play"), v21, time);

  objc_msgSend(v10, "reevaluateHasProtectedContent");
  objc_msgSend(v10, "reevaluateType");
  -[_MPCPlaybackEnginePlayer _updateActiveFormatForQueueItem:](self, "_updateActiveFormatForQueueItem:", v10);
LABEL_19:

}

- (void)_updateActiveFormatForQueueItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void (**v12)(void *, void *);
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _MPCPlaybackEnginePlayer *v17;
  id v18;
  void (**v19)(void *, void *);
  _QWORD aBlock[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  _MPCPlaybackEnginePlayer *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v4;
    objc_msgSend(v7, "avPlayerItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentStableVariantID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __60___MPCPlaybackEnginePlayer__updateActiveFormatForQueueItem___block_invoke;
      aBlock[3] = &unk_24CAB0F60;
      aBlock[4] = self;
      v21 = v7;
      v10 = v6;
      v22 = v10;
      v11 = v21;
      v23 = v11;
      v12 = (void (**)(void *, void *))_Block_copy(aBlock);
      objc_msgSend(v11, "audioFormatForStableVariantID:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v12[2](v12, v13);
      }
      else
      {
        v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v25 = v10;
          v26 = 2114;
          v27 = self;
          v28 = 2114;
          v29 = v9;
          _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - No session-data audio format found for stableVariantID=%{public}@", buf, 0x20u);
        }

        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __60___MPCPlaybackEnginePlayer__updateActiveFormatForQueueItem___block_invoke_166;
        v15[3] = &unk_24CAB0F88;
        v19 = v12;
        v16 = v10;
        v17 = self;
        v18 = v9;
        objc_msgSend(v8, "loadCurrentTrackAudioFormatWithCompletion:", v15);

      }
    }

  }
}

- (double)_adjustPlayerTimeForAudioTapProcessing:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  int v11;
  void *v12;
  __int16 v13;
  _MPCPlaybackEnginePlayer *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapPlaybackTimeToUserTime:", a3);
  v8 = v7;
  if (v7 != a3)
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138544130;
      v12 = v6;
      v13 = 2114;
      v14 = self;
      v15 = 2048;
      v16 = a3;
      v17 = 2048;
      v18 = v8;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Adjusting time with current processing delay - time: %3.4f -> corrected time: %3.4f", (uint8_t *)&v11, 0x2Au);
    }

  }
  return v8;
}

- (void)playbackDidStartForItem:(id)a3 rate:(float)a4 fromStalling:(BOOL)a5 timeStamp:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  int v32;
  BOOL v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  const char *v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  int v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  _QWORD v68[9];
  _QWORD v69[9];
  _QWORD v70[11];
  _QWORD v71[11];
  CMTime time;
  void *v73;
  __int16 v74;
  double v75;
  __int16 v76;
  _BOOL4 v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v7 = a5;
  v80 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a6;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "engineID");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (v12)
      objc_msgSend(v12, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544642;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v67;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v73 = v14;
    v74 = 2048;
    v75 = a4;
    v76 = 1024;
    v77 = v7;
    v78 = 2114;
    v79 = v16;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackDidStartForItem:rate: - item=%{public}@ - rate:%1.2f - from stalling:%{BOOL}u - timeStamp:%{public}@", (uint8_t *)&time, 0x3Au);

  }
  if (v14)
  {
    if (v7)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCPlaybackEnginePlayer.m"), 1474, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queueItem != nil"));

    if (v7)
      goto LABEL_11;
  }
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "playerID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138543874;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v67;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = v18;
    HIWORD(time.epoch) = 2114;
    v73 = v14;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-PSP: Setting hasPlayedSuccessfully: [playbackDidStartForItem] playerID=%{public}@ item=%{public}@", (uint8_t *)&time, 0x20u);

  }
  +[MPCAVItemTrace traceWithName:item:event:](MPCAVItemTrace, "traceWithName:item:event:", CFSTR("MPTRACE_PLAYBACK_DID_START"), v14, 731643976);
  -[_MPCPlaybackEnginePlayer playbackStartTrace](self, "playbackStartTrace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "endInterval");

  -[_MPCPlaybackEnginePlayer errorController](self, "errorController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setItemsHavePlayed:", 1);

  objc_msgSend(v13, "schedulePlaybackStatePreservation");
LABEL_11:
  objc_msgSend(v12, "time");
  v22 = v21;
  v23 = v14;
  v24 = v23;
  if (v22 < 0.0)
    v22 = 0.0;
  objc_msgSend(v23, "initialPlaybackStartTime");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  v27 = v26;

  if (objc_msgSend(v24, "lastChangeDirection") && vabdd_f64(v22, v27) < 0.5)
    v22 = v27;

  -[_MPCPlaybackEnginePlayer bookmarker](self, "bookmarker");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v29 = a4;
  objc_msgSend(v28, "playbackDidStartForItem:time:rate:", v11, v22, v29);

  objc_msgSend(v24, "queueSectionID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "queueItemID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "length"))
  {
    if (objc_msgSend(v31, "length"))
    {
      v66 = v12;
      if (v7)
      {
        v32 = -[_MPCPlaybackEnginePlayer lastReportedVocalAttenuationEnabledState](self, "lastReportedVocalAttenuationEnabledState");
        v33 = v32 == objc_msgSend(v13, "isVocalAttenuationEnabled");
        v12 = v66;
        if (v33)
        {
LABEL_32:
          -[_MPCPlaybackEnginePlayer setLastReportedVocalAttenuationEnabledState:](self, "setLastReportedVocalAttenuationEnabledState:", objc_msgSend(v13, "isVocalAttenuationEnabled"));
          objc_msgSend(v13, "eventObserver");
          v42 = objc_claimAutoreleasedReturnValue();
          *(float *)&v54 = a4;
          -[NSObject engine:didChangeItemElapsedTime:rate:](v42, "engine:didChangeItemElapsedTime:rate:", v13, v22, v54);
          goto LABEL_33;
        }
        objc_msgSend(v13, "eventStream");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v68[0] = CFSTR("queue-section-id");
        v68[1] = CFSTR("queue-item-id");
        v69[0] = v30;
        v69[1] = v31;
        v68[2] = CFSTR("item-start-position");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v69[2] = v63;
        v68[3] = CFSTR("time-control-status");
        v34 = (void *)MEMORY[0x24BDD16E0];
        -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "numberWithInteger:", objc_msgSend(v62, "timeControlStatus"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v69[3] = v61;
        v68[4] = CFSTR("supports-vocal-attenuation");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v24, "supportsVocalAttenuation"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v69[4] = v60;
        v68[5] = CFSTR("vocal-attenuation-available");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "isVocalAttenuationAvailable"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v69[5] = v59;
        v68[6] = CFSTR("vocal-attenuation-enabled");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "isVocalAttenuationEnabled"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v69[6] = v58;
        v68[7] = CFSTR("vocal-attenuation-configured");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v24, "isConfiguredForVocalAttenuation"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v69[7] = v57;
        v68[8] = CFSTR("vocal-attenuation-processing-delay");
        v35 = (void *)MEMORY[0x24BDD16E0];
        v36 = objc_msgSend(v24, "supportsVocalAttenuation");
        v37 = 0.0;
        if (v36)
        {
          objc_msgSend(v13, "currentAudioProcessingDelay", 0.0);
          v37 = v38 * 1000.0;
        }
        objc_msgSend(v35, "numberWithDouble:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v69[8] = v39;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 9);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v64;
        objc_msgSend(v64, "emitEventType:payload:", CFSTR("item-vocal-attenuation-changed"), v40);
        v12 = v66;
      }
      else
      {
        v56 = v11;
        objc_msgSend(v13, "eventStream");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = CFSTR("event-time-offset");
        v44 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v12, "time");
        objc_msgSend(v44, "numberWithDouble:", v22 - v45);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v71[0] = v63;
        v71[1] = v30;
        v70[1] = CFSTR("queue-section-id");
        v70[2] = CFSTR("queue-item-id");
        v71[2] = v31;
        v70[3] = CFSTR("item-start-position");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v71[3] = v62;
        v70[4] = CFSTR("time-control-status");
        v46 = (void *)MEMORY[0x24BDD16E0];
        -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "numberWithInteger:", objc_msgSend(v61, "timeControlStatus"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v71[4] = v60;
        v70[5] = CFSTR("item-rate");
        *(float *)&v47 = a4;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v47);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v71[5] = v59;
        v70[6] = CFSTR("supports-vocal-attenuation");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v24, "supportsVocalAttenuation"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v71[6] = v58;
        v70[7] = CFSTR("vocal-attenuation-available");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "isVocalAttenuationAvailable"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v71[7] = v57;
        v70[8] = CFSTR("vocal-attenuation-enabled");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "isVocalAttenuationEnabled"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v71[8] = v39;
        v70[9] = CFSTR("vocal-attenuation-configured");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v24, "isConfiguredForVocalAttenuation"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v71[9] = v40;
        v70[10] = CFSTR("vocal-attenuation-processing-delay");
        v48 = (void *)MEMORY[0x24BDD16E0];
        v49 = objc_msgSend(v24, "supportsVocalAttenuation");
        v50 = 0.0;
        if (v49)
        {
          objc_msgSend(v13, "currentAudioProcessingDelay", 0.0);
          v50 = v51 * 1000.0;
        }
        objc_msgSend(v48, "numberWithDouble:", v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v71[10] = v52;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 11);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v65;
        objc_msgSend(v65, "emitEventType:payload:", CFSTR("item-resume"), v53);

        v12 = v66;
        v11 = v56;
      }

      goto LABEL_32;
    }
    v42 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
    {
      LODWORD(time.value) = 138543618;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v11;
      LOWORD(time.flags) = 2114;
      *(_QWORD *)((char *)&time.flags + 2) = v31;
      v43 = "Unexpected playbackDidStartForItem: without itemID: %{public}@ %{public}@";
      goto LABEL_27;
    }
  }
  else
  {
    v42 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
    {
      LODWORD(time.value) = 138543618;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v11;
      LOWORD(time.flags) = 2114;
      *(_QWORD *)((char *)&time.flags + 2) = v30;
      v43 = "Unexpected playbackDidStartForItem: without sectionID: %{public}@ %{public}@";
LABEL_27:
      _os_log_impl(&dword_210BD8000, v42, OS_LOG_TYPE_FAULT, v43, (uint8_t *)&time, 0x16u);
    }
  }
LABEL_33:

}

- (void)playbackDidStopForItem:(id)a3 source:(id)a4 reason:(id)a5 timeStamp:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  CMTime time;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "engineID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "time");
    v18 = v17;
    if (v13)
      objc_msgSend(v13, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544898;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v15;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    v24 = 2114;
    v25 = v12;
    v26 = 2048;
    v27 = v18;
    v28 = 2114;
    v29 = v19;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackDidStopForItem- item=%{public}@ - source:%{public}@ - reason:%{public}@   - time:%.3fs - timeStamp:%{public}@", (uint8_t *)&time, 0x48u);

  }
  objc_msgSend(v13, "time");
  -[_MPCPlaybackEnginePlayer _playbackDidStopForItem:source:reason:time:](self, "_playbackDidStopForItem:source:reason:time:", v10, v11, v12);
  -[_MPCPlaybackEnginePlayer invalidateEVSDeferralAssertionForFirstAudioFrame](self, "invalidateEVSDeferralAssertionForFirstAudioFrame");

}

- (void)playbackRateDidChangeToRate:(float)a3 forItem:(id)a4 timeStamp:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  CMTime time;
  void *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "engineID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
      objc_msgSend(v8, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544386;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v12;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v19 = v10;
    v20 = 2048;
    v21 = a3;
    v22 = 2114;
    v23 = v14;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackRateDidChangeToRate - item=%{public}@ - rate:%1.2f - timeStamp:%{public}@", (uint8_t *)&time, 0x34u);

  }
  -[_MPCPlaybackEnginePlayer bookmarker](self, "bookmarker");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "time");
  v17 = v16;
  *(float *)&v16 = a3;
  objc_msgSend(v15, "playbackRateDidChangeToRate:forItem:time:", v9, v16, v17);

}

- (void)playbackRateDidChangeNotifiedForItem:(id)a3 newRate:(float)a4 reason:(id)a5 participantIdentifier:(id)a6 timeStamp:(id)a7
{
  id v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  double v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  const __CFString *v37;
  __CFString *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const char *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  __int128 v51;
  __int128 v52;
  CMTime v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[7];
  _QWORD v58[7];
  _BYTE time[32];
  _BYTE v60[10];
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = (const __CFString *)a5;
  v14 = v12;
  v15 = v13;
  v16 = (const __CFString *)a6;
  v17 = a7;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "engineID");
  v19 = objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (v17)
      objc_msgSend(v17, "hostTime");
    else
      memset(time, 0, 24);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds((CMTime *)time));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)time = 138544898;
    *(_QWORD *)&time[4] = v19;
    *(_WORD *)&time[12] = 2114;
    *(_QWORD *)&time[14] = self;
    *(_WORD *)&time[22] = 2114;
    *(_QWORD *)&time[24] = v20;
    *(_WORD *)v60 = 2048;
    *(double *)&v60[2] = a4;
    v61 = 2114;
    v62 = v15;
    v63 = 2114;
    v64 = v16;
    v65 = 2114;
    v66 = v22;
    _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackRateDidChangeNotifiedForItem - item=%{public}@ - rate:%1.2f - reason:%{public}@ - participant:%{public}@ - timeStamp:%{public}@", time, 0x48u);

  }
  v23 = v17;
  v24 = v23;
  v50 = v16;
  if (v23)
  {
    objc_msgSend(v23, "hostTime");
    if ((v55 & 0x100000000) != 0)
    {
      v25 = v15;
      objc_msgSend(v24, "hostTime");
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v53, (uint64_t)time);
      goto LABEL_11;
    }
  }
  else
  {
    v54 = 0;
    v55 = 0;
    v56 = 0;
  }
  v25 = v15;
  MPCPlaybackEngineEventGetMonotonicTime(time);
LABEL_11:
  v51 = *(_OWORD *)time;
  v52 = *(_OWORD *)&time[16];
  objc_msgSend(v24, "userSecondsSinceReferenceDate");
  v27 = v26;

  objc_msgSend(v20, "queueSectionID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v20;
  objc_msgSend(v20, "queueItemID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)v19;
  if (!objc_msgSend(v28, "length"))
  {
    v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)time = 138543618;
      *(_QWORD *)&time[4] = v14;
      *(_WORD *)&time[12] = 2114;
      *(_QWORD *)&time[14] = v28;
      v44 = "Unexpected playbackRateDidChangeNotifiedForItem: without sectionID: %{public}@ %{public}@";
LABEL_24:
      _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_FAULT, v44, time, 0x16u);
    }
LABEL_25:
    v36 = (__CFString *)v25;
    v38 = (__CFString *)v50;
    goto LABEL_26;
  }
  if (!objc_msgSend(v29, "length"))
  {
    v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)time = 138543618;
      *(_QWORD *)&time[4] = v14;
      *(_WORD *)&time[12] = 2114;
      *(_QWORD *)&time[14] = v29;
      v44 = "Unexpected playbackRateDidChangeNotifiedForItem: without itemID: %{public}@ %{public}@";
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v30 = objc_claimAutoreleasedReturnValue();
  -[NSObject eventStream](v30, "eventStream");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = CFSTR("queue-section-id");
  v57[1] = CFSTR("queue-item-id");
  v58[0] = v28;
  v58[1] = v29;
  v57[2] = CFSTR("item-rate-change-position");
  v47 = v14;
  v32 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v24, "time");
  objc_msgSend(v32, "numberWithDouble:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v45;
  v57[3] = CFSTR("item-rate");
  *(float *)&v33 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
  v34 = objc_claimAutoreleasedReturnValue();
  v46 = v29;
  v35 = (void *)v34;
  v36 = (__CFString *)v25;
  if (v25)
    v37 = v25;
  else
    v37 = &stru_24CABB5D0;
  v58[3] = v34;
  v58[4] = v37;
  v57[4] = CFSTR("item-rate-change-reason");
  v57[5] = CFSTR("item-rate-change-participant-id");
  v38 = (__CFString *)v50;
  if (v50)
    v39 = v50;
  else
    v39 = &stru_24CABB5D0;
  v58[5] = v39;
  v57[6] = CFSTR("time-control-status");
  v40 = (void *)MEMORY[0x24BDD16E0];
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "numberWithInteger:", objc_msgSend(v41, "timeControlStatus"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v58[6] = v42;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 7);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)time = v51;
  *(_OWORD *)&time[16] = v52;
  *(_QWORD *)v60 = v27;
  objc_msgSend(v31, "emitEventType:payload:atTime:", CFSTR("item-rate-changed"), v43, time);

  v14 = v47;
  v29 = v46;

LABEL_26:
}

- (void)firstFrameWillRenderForItem:(id)a3 timeStamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  OpaqueCMTimebase *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double Seconds;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  _OWORD v44[2];
  double v45;
  CMTime time;
  const __CFString *v47;
  void *v48;
  _QWORD v49[5];
  _QWORD v50[5];
  uint8_t buf[32];
  double v52[6];

  v52[3] = *(double *)MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engineID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "time");
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    *(_QWORD *)&buf[24] = v10;
    LOWORD(v52[0]) = 2050;
    *(_QWORD *)((char *)v52 + 2) = v12;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - firstFrameWillRenderForItem - item=%{public}@ - startTime:%{public}.2f", buf, 0x2Au);
  }

  objc_msgSend(v10, "queueSectionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queueItemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "length"))
  {
    v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      v39 = "Unexpected firstFrameWillRenderForItem: without sectionID: %{public}@ %{public}@";
LABEL_18:
      _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_FAULT, v39, buf, 0x16u);
    }
LABEL_19:

    goto LABEL_20;
  }
  if (!objc_msgSend(v14, "length"))
  {
    v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v14;
      v39 = "Unexpected firstFrameWillRenderForItem: without itemID: %{public}@ %{public}@";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v15 = (OpaqueCMTimebase *)objc_msgSend(v10, "timebase");
  objc_msgSend(v7, "time");
  v17 = v16;
  v18 = v10;
  v43 = v8;
  v19 = v18;
  if (v17 >= 0.0)
    v20 = v17;
  else
    v20 = 0.0;
  objc_msgSend(v18, "initialPlaybackStartTime");
  v40 = v9;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  v24 = objc_msgSend(v19, "lastChangeDirection");
  if (vabdd_f64(v20, v23) < 0.5)
    v25 = v23;
  else
    v25 = v20;
  if (v24)
    v20 = v25;

  CMTimebaseGetTime(&time, v15);
  Seconds = CMTimeGetSeconds(&time);
  v52[0] = 0.0;
  memset(buf, 0, sizeof(buf));
  MPCPlaybackEngineEventGetMonotonicTime(buf);
  v27 = v20 - Seconds;
  objc_msgSend(v43, "eventStream");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = CFSTR("queue-section-id");
  v49[1] = CFSTR("queue-item-id");
  v50[0] = v13;
  v50[1] = v14;
  v49[2] = CFSTR("item-start-position");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v29;
  v49[3] = CFSTR("event-time-offset");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v30;
  v49[4] = CFSTR("time-control-status");
  v41 = v7;
  v31 = (void *)MEMORY[0x24BDD16E0];
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "numberWithInteger:", objc_msgSend(v32, "timeControlStatus"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 5);
  v42 = v6;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = *(_OWORD *)buf;
  v44[1] = *(_OWORD *)&buf[16];
  v45 = v52[0];
  objc_msgSend(v28, "emitEventType:payload:atTime:", CFSTR("item-first-audio-frame"), v34, v44);

  v9 = v40;
  v8 = v43;
  -[_MPCPlaybackEnginePlayer invalidateEVSDeferralAssertionForFirstAudioFrame](self, "invalidateEVSDeferralAssertionForFirstAudioFrame");
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v27 + v52[0]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = CFSTR("MPCPlaybackEngineFirstAudioFrameDateKey");
  v48 = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "postNotificationName:object:userInfo:", CFSTR("MPCPlaybackEngineFirstAudioFrameNotification"), v43, v37);

  v6 = v42;
  v7 = v41;

LABEL_20:
}

- (void)timeControlStatusDidChange:(int64_t)a3 waitingReason:(id)a4 timeStamp:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  CMTime time;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "engineID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    +[MFDescription forTimeControlStatus:](MFDescription, "forTimeControlStatus:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v9, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544386;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v11;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v22 = v13;
    v23 = 2114;
    v24 = v8;
    v25 = 2114;
    v26 = v14;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - timeControlStatusDidChange - status:%{public}@ - reason:%{public}@ - timeStamp:%{public}@", (uint8_t *)&time, 0x34u);

  }
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventStream");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("time-control-status");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("time-control-status-reason");
  v20[0] = v17;
  v20[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "emitEventType:payload:", CFSTR("time-control-status-changed"), v18);

}

- (void)playbackWaitingToPlayForItem:(id)a3 reason:(id)a4 timeStamp:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  CMTime time;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "engineID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v10)
      objc_msgSend(v10, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544386;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v12;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v18 = v13;
    v19 = 2114;
    v20 = v9;
    v21 = 2114;
    v22 = v15;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackWaitingToPlayFor - item=%{public}@ - reason:%{public}@ - timeStamp:%{public}@", (uint8_t *)&time, 0x34u);

  }
  -[_MPCPlaybackEnginePlayer bookmarker](self, "bookmarker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "time");
  objc_msgSend(v16, "playbackDidStopForItem:time:", v8);

}

- (void)routeDidChange:(BOOL)a3 metadata:(id)a4 timeStamp:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];
  _QWORD v33[3];
  CMTime time;
  _BOOL4 v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v6 = a3;
  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "engineID");
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "routeDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "isAirplay");
    if (v9)
      objc_msgSend(v9, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544642;
    *(CMTimeValue *)((char *)&time.value + 4) = v11;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 1024;
    v35 = v6;
    v36 = 2114;
    v37 = v13;
    v38 = 1024;
    v39 = v14;
    v40 = 2114;
    v41 = v15;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - routeDidChange - shouldPause=%{BOOL}u - route:%{public}@ - isAirplay=%{BOOL}u - timeStamp:%{public}@", (uint8_t *)&time, 0x36u);

  }
  v28 = (void *)v11;
  v29 = v9;

  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "eventStream");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = CFSTR("route-metadata");
  v30[0] = CFSTR("route-description");
  objc_msgSend(v8, "routeDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[1] = CFSTR("route-is-airplay");
  v31[0] = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "isAirplay"));
  v26 = v8;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v20;
  v32[1] = CFSTR("route-should-pause");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v21;
  v32[2] = CFSTR("time-control-status");
  v22 = (void *)MEMORY[0x24BDD16E0];
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v23, "timeControlStatus"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "emitEventType:payload:", CFSTR("audio-route-changed"), v25);

  if (!v17)
}

- (void)stateDidChangeFromState:(int64_t)a3 toState:(int64_t)a4 timeStamp:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  int v23;
  double v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  id v29;
  CMTime time;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  int64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v29 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engineID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 3;
  switch(a4)
  {
    case 0:
      v9 = 0;
      v10 = 3;
      goto LABEL_10;
    case 1:
      v9 = 2;
      goto LABEL_6;
    case 2:
      v9 = 1;
LABEL_6:
      v27 = a4;
      break;
    case 3:
      v9 = 4;
      goto LABEL_9;
    case 4:
      v9 = 5;
      goto LABEL_9;
    case 5:
LABEL_9:
      v10 = 1000;
LABEL_10:
      v27 = v10;
      break;
    case 6:
      v27 = 1;
      v9 = 2;
      break;
    case 7:
      v27 = 4;
      v9 = 6;
      break;
    default:
      v27 = 0;
      v9 = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }
  v11 = 3;
  switch(a3)
  {
    case 0:
      v11 = 0;
      v12 = 3;
      break;
    case 1:
      v11 = 2;
      goto LABEL_18;
    case 2:
      v11 = 1;
LABEL_18:
      v12 = a3;
      break;
    case 3:
      v11 = 4;
      goto LABEL_21;
    case 4:
      v11 = 5;
      goto LABEL_21;
    case 5:
LABEL_21:
      v12 = 1000;
      break;
    case 6:
      v12 = 1;
      v11 = 2;
      break;
    case 7:
      v12 = 4;
      v11 = 6;
      break;
    default:
      v12 = 0;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    +[MFDescription forPlayerState:](MFDescription, "forPlayerState:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFDescription forPlayerState:](MFDescription, "forPlayerState:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      objc_msgSend(v29, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138545410;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v28;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v31 = v14;
    v32 = 2048;
    v33 = v11;
    v34 = 2048;
    v35 = v12;
    v36 = 2114;
    v37 = v15;
    v38 = 2048;
    v39 = v9;
    v40 = 2048;
    v41 = v27;
    v42 = 2114;
    v43 = v16;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - stateDidChange - [%{public}@/MP:%ld/NP:%ld -> %{public}@/MP:%ld/NP:%ld] - timeStamp:%{public}@", (uint8_t *)&time, 0x5Cu);

  }
  -[_MPCPlaybackEnginePlayer bookmarker](self, "bookmarker");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentQueueItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer currentTime](self, "currentTime");
  v21 = v20;
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rate");
  LODWORD(v24) = v23;
  objc_msgSend(v17, "playbackStateDidChangeFromState:toState:forItem:time:rate:", a3, a4, v19, v21, v24);

  if (a3 != a4)
  {
    -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "eventObserver");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "engine:didChangeToState:", v25, v27);

  }
}

- (void)interruptionDidBeginWithInterruptor:(id)a3 timeStamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  CMTime time;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engineID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      objc_msgSend(v7, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544130;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v9;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v18 = v6;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - interruptionDidBeginWithInterruptor - interruptor=%{public}@ - timeStamp:%{public}@", (uint8_t *)&time, 0x2Au);

  }
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "eventStream");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("interrupt-name");
  v16 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "emitEventType:payload:", CFSTR("interrupt-begin"), v14);

}

- (void)interruptionDidFinishForInterruptor:(id)a3 shouldResume:(BOOL)a4 timeStamp:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  CMTime time;
  id v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "engineID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v9)
      objc_msgSend(v9, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544386;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v11;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v21 = v8;
    v22 = 1024;
    v23 = v6;
    v24 = 2114;
    v25 = v13;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - interruptionDidFinishForInterruptor:shouldResume: - interruptor=%{public}@ - shouldResume=%{BOOL}u - timeStamp:%{public}@", (uint8_t *)&time, 0x30u);

  }
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("interrupt-name");
  v18[1] = CFSTR("interrupt-should-resume");
  v19[0] = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "emitEventType:payload:", CFSTR("interrupt-end"), v17);

}

- (void)playbackBufferStateDidChangeToState:(int64_t)a3 forItem:(id)a4 timeStamp:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  CMTime v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  _QWORD v43[4];
  _QWORD v44[3];
  _QWORD v45[3];
  _BYTE buf[32];
  _QWORD v47[6];

  v47[3] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "engineID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "hostTime");
    if ((v40 & 0x100000000) != 0)
    {
      objc_msgSend(v13, "hostTime");
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v38, (uint64_t)buf);
      goto LABEL_6;
    }
  }
  else
  {
    v39 = 0;
    v40 = 0;
    v41 = 0;
  }
  MPCPlaybackEngineEventGetMonotonicTime(buf);
LABEL_6:
  v36 = *(_OWORD *)buf;
  v37 = *(_OWORD *)&buf[16];
  objc_msgSend(v13, "userSecondsSinceReferenceDate");
  v15 = v14;

  objc_msgSend(v13, "time");
  v17 = v16;
  objc_msgSend(v11, "queueSectionID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queueItemID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "length"))
  {
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v18;
    v22 = "Unexpected playbackBufferStateDidChangeToState:forItem: without sectionID: %{public}@ %{public}@";
LABEL_17:
    _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_FAULT, v22, buf, 0x16u);
    goto LABEL_28;
  }
  if (!objc_msgSend(v19, "length"))
  {
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v19;
    v22 = "Unexpected playbackBufferStateDidChangeToState:forItem: without itemID: %{public}@ %{public}@";
    goto LABEL_17;
  }
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v20 = objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    v34 = v8;
    +[MPCAVItemTrace traceWithName:item:event:](MPCAVItemTrace, "traceWithName:item:event:", CFSTR("MPTRACE_PLAYBACK_STREAM_RANDRY"), v11, 731643952);
    v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      if (v13)
        objc_msgSend(v13, "hostTime");
      else
        memset(buf, 0, 24);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds((CMTime *)buf));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v11;
      LOWORD(v47[0]) = 2114;
      *(_QWORD *)((char *)v47 + 2) = v31;
      _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackBufferStateDidChangeToState: - state=Empty - item=%{public}@ - timeStamp:%{public}@", buf, 0x2Au);

    }
    -[NSObject eventStream](v20, "eventStream");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = CFSTR("queue-section-id");
    v42[1] = CFSTR("queue-item-id");
    v43[0] = v18;
    v43[1] = v19;
    v42[2] = CFSTR("item-end-position");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v28;
    v42[3] = CFSTR("time-control-status");
    v32 = (void *)MEMORY[0x24BDD16E0];
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "numberWithInteger:", objc_msgSend(v29, "timeControlStatus"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)buf = v36;
    *(_OWORD *)&buf[16] = v37;
    v47[0] = v15;
    objc_msgSend(v26, "emitEventType:payload:atTime:", CFSTR("item-buffer-stall"), v33, buf);

    v8 = v34;
    goto LABEL_27;
  }
  if (!a3)
  {
    +[MPCAVItemTrace traceWithName:item:event:](MPCAVItemTrace, "traceWithName:item:event:", CFSTR("MPTRACE_PLAYBACK_STREAM_BUFFERFULL"), v11, 731643948);
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (v13)
        objc_msgSend(v13, "hostTime");
      else
        memset(buf, 0, 24);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds((CMTime *)buf));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v11;
      LOWORD(v47[0]) = 2114;
      *(_QWORD *)((char *)v47 + 2) = v24;
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackBufferStateDidChangeToState: - state=Full - item=%{public}@ - timeStamp:%{public}@", buf, 0x2Au);

    }
    -[NSObject eventObserver](v20, "eventObserver");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "engine:didAchieveLikelyToKeepUpWithItem:", v20, v11);

    -[NSObject eventStream](v20, "eventStream");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = CFSTR("queue-section-id");
    v44[1] = CFSTR("queue-item-id");
    v45[0] = v18;
    v45[1] = v19;
    v44[2] = CFSTR("time-control-status");
    v27 = (void *)MEMORY[0x24BDD16E0];
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v28, "timeControlStatus"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)buf = v36;
    *(_OWORD *)&buf[16] = v37;
    v47[0] = v15;
    objc_msgSend(v26, "emitEventType:payload:atTime:", CFSTR("item-buffer-finish"), v30, buf);
LABEL_27:

  }
LABEL_28:

}

- (void)playbackIsLikelyToKeepUp:(BOOL)a3 forItem:(id)a4 timeStamp:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  CMTime v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[4];
  _QWORD v47[4];
  _BYTE buf[32];
  _QWORD v49[6];

  v6 = a3;
  v49[3] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "engineID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v8;
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "hostTime");
    if ((v42 & 0x100000000) != 0)
    {
      objc_msgSend(v14, "hostTime");
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v40, (uint64_t)buf);
      goto LABEL_6;
    }
  }
  else
  {
    v41 = 0;
    v42 = 0;
    v43 = 0;
  }
  MPCPlaybackEngineEventGetMonotonicTime(buf);
LABEL_6:
  v38 = *(_OWORD *)buf;
  v39 = *(_OWORD *)&buf[16];
  objc_msgSend(v14, "userSecondsSinceReferenceDate");
  v16 = v15;

  objc_msgSend(v14, "time");
  v18 = v17;
  objc_msgSend(v12, "queueSectionID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queueItemID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "length"))
  {
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      goto LABEL_27;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v19;
    v23 = "Unexpected playbackIsLikelyToKeepUp:forItem: without sectionID: %{public}@ %{public}@";
LABEL_16:
    _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_FAULT, v23, buf, 0x16u);
    goto LABEL_27;
  }
  if (!objc_msgSend(v20, "length"))
  {
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      goto LABEL_27;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v20;
    v23 = "Unexpected playbackIsLikelyToKeepUp:forItem: without itemID: %{public}@ %{public}@";
    goto LABEL_16;
  }
  v36 = v11;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[MPCAVItemTrace traceWithName:item:event:](MPCAVItemTrace, "traceWithName:item:event:", CFSTR("MPTRACE_PLAYBACK_STREAM_LIKELYTOKEEPUP"), v12, 731643956);
    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      if (v14)
        objc_msgSend(v14, "hostTime");
      else
        memset(buf, 0, 24);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds((CMTime *)buf));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v12;
      LOWORD(v49[0]) = 2114;
      *(_QWORD *)((char *)v49 + 2) = v25;
      _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackIsLikelyToKeepUp: - Likely - item=%{public}@ - timeStamp:%{public}@", buf, 0x2Au);

    }
    -[NSObject eventObserver](v21, "eventObserver");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "engine:didAchieveLikelyToKeepUpWithItem:", v21, v12);

    -[NSObject eventStream](v21, "eventStream");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = CFSTR("queue-section-id");
    v46[1] = CFSTR("queue-item-id");
    v47[0] = v19;
    v47[1] = v20;
    v46[2] = CFSTR("item-start-position");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v28;
    v46[3] = CFSTR("time-control-status");
    v29 = (void *)MEMORY[0x24BDD16E0];
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v30, "timeControlStatus"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v31;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)buf = v38;
    *(_OWORD *)&buf[16] = v39;
    v49[0] = v16;
    v33 = CFSTR("item-buffer-ready");
  }
  else
  {
    +[MPCAVItemTrace traceWithName:item:event:](MPCAVItemTrace, "traceWithName:item:event:", CFSTR("MPTRACE_PLAYBACK_STREAM_UNLIKELYTOKEEPUP"), v12, 731643960);
    v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      if (v14)
        objc_msgSend(v14, "hostTime");
      else
        memset(buf, 0, 24);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds((CMTime *)buf));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v12;
      LOWORD(v49[0]) = 2114;
      *(_QWORD *)((char *)v49 + 2) = v34;
      _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackIsLikelyToKeepUp: - Unlikely - item=%{public}@ - timeStamp:%{public}@", buf, 0x2Au);

    }
    -[NSObject eventStream](v21, "eventStream");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = CFSTR("queue-section-id");
    v44[1] = CFSTR("queue-item-id");
    v45[0] = v19;
    v45[1] = v20;
    v44[2] = CFSTR("item-end-position");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v28;
    v44[3] = CFSTR("time-control-status");
    v35 = (void *)MEMORY[0x24BDD16E0];
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "numberWithInteger:", objc_msgSend(v30, "timeControlStatus"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v31;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)buf = v38;
    *(_OWORD *)&buf[16] = v39;
    v49[0] = v16;
    v33 = CFSTR("item-buffer-stall");
  }
  objc_msgSend(v27, "emitEventType:payload:atTime:", v33, v32, buf);

  v11 = v36;
LABEL_27:

}

- (void)tracksDidChangeForItem:(id)a3 timeStamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  CMTime time;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engineID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
      objc_msgSend(v6, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544130;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v9;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v14 = v10;
    v15 = 2114;
    v16 = v12;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - tracksDidChange: - item=%{public}@ - timeStamp:%{public}@", (uint8_t *)&time, 0x2Au);

  }
  -[_MPCPlaybackEnginePlayer _updateActiveFormatForQueueItem:](self, "_updateActiveFormatForQueueItem:", v10);

}

- (void)screenRecordingDidChange:(BOOL)a3 timeStamp:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _BYTE time[28];
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "engineID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
      objc_msgSend(v6, "hostTime");
    else
      memset(time, 0, 24);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds((CMTime *)time));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)time = 138543874;
    *(_QWORD *)&time[4] = v8;
    *(_WORD *)&time[12] = 1024;
    *(_DWORD *)&time[14] = v4;
    *(_WORD *)&time[18] = 2114;
    *(_QWORD *)&time[20] = v10;
    _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-🚔 Enforcing policy due to screen recording. setMuted/setHidden: %{BOOL}u - timeStamp:%{public}@", time, 0x1Cu);

  }
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "eventStream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v4)
    v14 = CFSTR("policy-begin");
  else
    v14 = CFSTR("policy-end");
  objc_msgSend(v12, "emitEventType:payload:", v14, MEMORY[0x24BDBD1B8]);

}

- (void)didReachEndOfQueueWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  _MPCPlaybackEnginePlayer *v17;
  __int16 v18;
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "engine:didReachEndOfQueueWithReason:", v5, v4);

  objc_msgSend(v5, "eventStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("session-id");
  objc_msgSend(v5, "queueController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emitEventType:payload:", CFSTR("session-reset"), v12);

  if (!v10)
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543874;
    v15 = v6;
    v16 = 2114;
    v17 = self;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - end of queue reached [%{public}@]", (uint8_t *)&v14, 0x20u);
  }

}

- (void)userActionDidBegin:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int64x2_t v25;
  _OWORD v26[2];
  double v27;
  CMTime v28;
  __int128 v29;
  __int128 v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];
  _QWORD v36[7];

  v36[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "source"))
  {
    if (-[_MPCPlaybackEnginePlayer _isAVKitSkipAction:](self, "_isAVKitSkipAction:", v4))
    {
      -[_MPCPlaybackEnginePlayer _performSkipForUserAction:](self, "_performSkipForUserAction:", v4);
      goto LABEL_15;
    }
    v5 = objc_msgSend(v4, "type");
    if (v5 > 8)
      v6 = 0xFFFFFFFFLL;
    else
      v6 = dword_210ED9188[v5];
    v27 = 0.0;
    memset(v26, 0, sizeof(v26));
    MPCPlaybackEngineEventGetMonotonicTime(v26);
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isModeShared");

    if (!v8)
    {
LABEL_14:
      -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "eventStream");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = CFSTR("remote-control-id");
      objc_msgSend(v4, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v17;
      v35[1] = CFSTR("remote-control-type");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v18;
      v35[2] = CFSTR("remote-control-source");
      objc_msgSend(v4, "sourceID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = v19;
      v35[3] = CFSTR("remote-control-options");
      objc_msgSend(v4, "options");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36[3] = v20;
      v35[4] = CFSTR("time-control-status");
      v21 = (void *)MEMORY[0x24BDD16E0];
      -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "timeControlStatus"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v36[4] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v26[0];
      v30 = v26[1];
      v31 = v27;
      objc_msgSend(v16, "emitEventType:payload:atTime:", CFSTR("remote-control-begin"), v24, &v29);

      goto LABEL_15;
    }
    objc_msgSend(v4, "timeStamp");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "hostTime");
      if ((v33 & 0x100000000) != 0)
      {
        objc_msgSend(v10, "hostTime");
        MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v28, (uint64_t)&v29);
LABEL_13:
        v11 = v29;
        v12 = *((_QWORD *)&v30 + 1);
        objc_msgSend(v10, "userSecondsSinceReferenceDate", *((_QWORD *)&v29 + 1), (_QWORD)v30);
        v14 = v13;

        *(_QWORD *)&v26[0] = v11;
        *(int64x2_t *)((char *)v26 + 8) = vaddq_s64(v25, vdupq_n_s64(0xFFFFFFFFFFFFFFFBLL));
        *((_QWORD *)&v26[1] + 1) = v12;
        v27 = v14 + -0.000000005;
        goto LABEL_14;
      }
    }
    else
    {
      v32 = 0;
      v33 = 0;
      v34 = 0;
    }
    MPCPlaybackEngineEventGetMonotonicTime(&v29);
    goto LABEL_13;
  }
LABEL_15:

}

- (void)userActionDidEnd:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
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
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "source") && !-[_MPCPlaybackEnginePlayer _isAVKitSkipAction:](self, "_isAVKitSkipAction:", v6))
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:error:", 200, v7);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eventStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = CFSTR("remote-control-id");
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    v19[1] = CFSTR("remote-control-status");
    v18 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v13;
    v19[2] = CFSTR("time-control-status");
    v14 = (void *)MEMORY[0x24BDD16E0];
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "timeControlStatus"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "emitEventType:payload:", CFSTR("remote-control-end"), v17);

  }
}

- (void)mediaServicesInterruptionDidBeginWithItemAtDeath:(id)a3 timeAtDeath:(double)a4 timeStamp:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  CMTime time;
  NSObject *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "engineID");
  v11 = objc_claimAutoreleasedReturnValue();
  v26 = v9;
  if (v8)
  {
    -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (v9)
        objc_msgSend(v9, "hostTime");
      else
        memset(&time, 0, sizeof(time));
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time), v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138544386;
      *(CMTimeValue *)((char *)&time.value + 4) = v11;
      LOWORD(time.flags) = 2114;
      *(_QWORD *)((char *)&time.flags + 2) = self;
      HIWORD(time.epoch) = 2114;
      v30 = v12;
      v31 = 2048;
      v32 = a4;
      v33 = 2114;
      v34 = v14;
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Media Services were interrupted - item:%{public}@ - time:%.3fs - timeStamp:%{public}@", (uint8_t *)&time, 0x34u);

    }
  }
  else
  {
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    if (v9)
      objc_msgSend(v9, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time), v9);
    v13 = objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138543874;
    *(CMTimeValue *)((char *)&time.value + 4) = v11;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v30 = v13;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Media Services were interrupted - no item at death - timeStamp:%{public}@", (uint8_t *)&time, 0x20u);
  }

LABEL_13:
  v15 = (void *)v11;

  -[_MPCPlaybackEnginePlayer translator](self, "translator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "invalidateCache");

  objc_msgSend(v10, "eventStream");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("session-id");
  objc_msgSend(v10, "queueController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sessionID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[1] = CFSTR("time-control-status");
  v28[0] = v20;
  v21 = (void *)MEMORY[0x24BDD16E0];
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "timeControlStatus"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "emitEventType:payload:", CFSTR("media-server-died"), v24);

  if (!v19)
  objc_msgSend(v10, "eventObserver");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "engineDidLoseMediaServices:", v10);

}

- (void)mediaServicesInterruptionDidEndWithTimeStamp:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
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
  _QWORD v20[2];
  _QWORD v21[2];
  CMTime time;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      objc_msgSend(v4, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138543874;
    *(CMTimeValue *)((char *)&time.value + 4) = v6;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v23 = v8;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Media Services were restored - timeStamp:%{public}@", (uint8_t *)&time, 0x20u);

  }
  v19 = v4;
  v9 = (void *)v6;

  objc_msgSend(v5, "eventStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("session-id");
  objc_msgSend(v5, "queueController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[1] = CFSTR("time-control-status");
  v21[0] = v13;
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "timeControlStatus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emitEventType:payload:", CFSTR("media-server-reset"), v17);

  if (!v12)
  objc_msgSend(v5, "eventObserver");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "engineDidResetMediaServices:", v5);

  -[_MPCPlaybackEnginePlayer updateAudioSession](self, "updateAudioSession");
  -[_MPCPlaybackEnginePlayer updateAudioSessionSpeechDetection](self, "updateAudioSessionSpeechDetection");

}

- (void)mediaServicesPurgeDidOccurWithTimeStamp:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
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
  _QWORD v20[2];
  _QWORD v21[2];
  CMTime time;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      objc_msgSend(v4, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138543874;
    *(CMTimeValue *)((char *)&time.value + 4) = v6;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v23 = v8;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Media Services Resource Reclamation occurred - timeStamp:%{public}@", (uint8_t *)&time, 0x20u);

  }
  v19 = v4;
  v9 = (void *)v6;

  objc_msgSend(v5, "eventStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("session-id");
  objc_msgSend(v5, "queueController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[1] = CFSTR("time-control-status");
  v21[0] = v13;
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "timeControlStatus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emitEventType:payload:", CFSTR("media-server-purge"), v17);

  if (!v12)
  objc_msgSend(v5, "eventObserver");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "engineDidReceiveMediaServicesPurge:", v5);

  -[_MPCPlaybackEnginePlayer updateAudioSession](self, "updateAudioSession");
}

- (void)playbackIsBlockedOnNonPlayableItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  _MPCPlaybackEnginePlayer *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543874;
    v11 = v6;
    v12 = 2114;
    v13 = self;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Playback stuck on non-playable item: %{public}@", (uint8_t *)&v10, 0x20u);
  }

  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queueController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playerItemDidBecomeCurrent:", v8);

}

- (void)firstVideoFrameWasRenderedForItem:(id)a3 timeStamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  CMTime v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  _QWORD v38[4];
  _BYTE time[32];
  _QWORD v40[6];

  v40[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engineID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "hostTime");
    if ((v35 & 0x100000000) != 0)
    {
      objc_msgSend(v12, "hostTime");
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v33, (uint64_t)time);
      goto LABEL_6;
    }
  }
  else
  {
    v34 = 0;
    v35 = 0;
    v36 = 0;
  }
  MPCPlaybackEngineEventGetMonotonicTime(time);
LABEL_6:
  v31 = *(_OWORD *)time;
  v32 = *(_OWORD *)&time[16];
  objc_msgSend(v12, "userSecondsSinceReferenceDate");
  v14 = v13;

  objc_msgSend(v12, "time");
  v16 = v15;
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v12)
      objc_msgSend(v12, "hostTime");
    else
      memset(time, 0, 24);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds((CMTime *)time));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)time = 138544130;
    *(_QWORD *)&time[4] = v9;
    *(_WORD *)&time[12] = 2114;
    *(_QWORD *)&time[14] = self;
    *(_WORD *)&time[22] = 2114;
    *(_QWORD *)&time[24] = v10;
    LOWORD(v40[0]) = 2114;
    *(_QWORD *)((char *)v40 + 2) = v18;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - firstVideoFrameWasRenderedForItem: - item=%{public}@ - timeStamp:%{public}@", time, 0x2Au);

  }
  objc_msgSend(v10, "queueSectionID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queueItemID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "length"))
  {
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      goto LABEL_19;
    *(_DWORD *)time = 138543618;
    *(_QWORD *)&time[4] = v6;
    *(_WORD *)&time[12] = 2114;
    *(_QWORD *)&time[14] = v19;
    v28 = "Unexpected firstVideoFrameWasRenderedForItem: without sectionID: %{public}@ %{public}@";
LABEL_18:
    _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_FAULT, v28, time, 0x16u);
    goto LABEL_19;
  }
  if (!objc_msgSend(v20, "length"))
  {
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      goto LABEL_19;
    *(_DWORD *)time = 138543618;
    *(_QWORD *)&time[4] = v6;
    *(_WORD *)&time[12] = 2114;
    *(_QWORD *)&time[14] = v20;
    v28 = "Unexpected firstVideoFrameWasRenderedForItem: without itemID: %{public}@ %{public}@";
    goto LABEL_18;
  }
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v21 = objc_claimAutoreleasedReturnValue();
  -[NSObject eventStream](v21, "eventStream");
  v30 = v6;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = CFSTR("queue-section-id");
  v37[1] = CFSTR("queue-item-id");
  v38[0] = v19;
  v38[1] = v20;
  v37[2] = CFSTR("item-start-position");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v23;
  v37[3] = CFSTR("time-control-status");
  v29 = v9;
  v24 = (void *)MEMORY[0x24BDD16E0];
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "numberWithInteger:", objc_msgSend(v25, "timeControlStatus"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)time = v31;
  *(_OWORD *)&time[16] = v32;
  v40[0] = v14;
  objc_msgSend(v22, "emitEventType:payload:atTime:", CFSTR("item-first-video-frame"), v27, time);

  v9 = v29;
  v6 = v30;
LABEL_19:

}

- (void)relativeVolumeDidChangeTo:(float)a3 timeStamp:(id)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  double v12;
  void *v13;
  CMTime time;
  double v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  *(float *)&v7 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer setCurrentRelativeVolume:](self, "setCurrentRelativeVolume:", v8);

  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "engineID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a3;
    if (v6)
      objc_msgSend(v6, "hostTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.9fs"), CMTimeGetSeconds(&time));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138544130;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v10;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2050;
    v15 = v12;
    v16 = 2114;
    v17 = v13;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - relativeVolumeDidChangeTo: - volume=%{public}f - timeStamp:%{public}@", (uint8_t *)&time, 0x2Au);

  }
}

- (void)didReportSignpostWithType:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3 == 1)
  {
    -[_MPCPlaybackEnginePlayer playbackStartTrace](self, "playbackStartTrace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endInterval");

    -[_MPCPlaybackEnginePlayer setPlaybackStartTrace:](self, "setPlaybackStartTrace:", 0);
  }
  else if (!a3)
  {
    -[_MPCPlaybackEnginePlayer currentItem](self, "currentItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[MPCAVItemTrace traceIntervalWithName:item:beginEvent:endEvent:](MPCAVItemTrace, "traceIntervalWithName:item:beginEvent:endEvent:", CFSTR("MPTRACE_PLAYBACK_PLAYBACKSTART"), v6, 731643908, 731643912);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCPlaybackEnginePlayer setPlaybackStartTrace:](self, "setPlaybackStartTrace:", v4);

  }
}

- (void)errorResolutionDidStartForItem:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  _MPCPlaybackEnginePlayer *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engineID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138544130;
    v12 = v9;
    v13 = 2114;
    v14 = self;
    v15 = 2114;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - errorResolutionDidStartForItem: - item=%{public}@ - error:%{public}@", (uint8_t *)&v11, 0x2Au);
  }

}

- (void)errorResolutionDidEndForItem:(id)a3 error:(id)a4 resolution:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  _MPCPlaybackEnginePlayer *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "engineID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    +[MFDescription forErrorResolution:](MFDescription, "forErrorResolution:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544386;
    v15 = v11;
    v16 = 2114;
    v17 = self;
    v18 = 2114;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    v22 = 2114;
    v23 = v13;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - errorResolutionDidEndForItem: - item=%{public}@ - error:%{public}@ - resolution:%{public}@", (uint8_t *)&v14, 0x34u);

  }
}

- (void)stackControllerDidCreateTransitionFrom:(id)a3 to:(id)a4 type:(int64_t)a5 parameters:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a4;
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "eventStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = CFSTR("outgoing-item-section-id");
  objc_msgSend(v12, "queueSectionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v22[1] = CFSTR("outgoing-item-id");
  objc_msgSend(v12, "queueItemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  v22[2] = CFSTR("incoming-item-section-id");
  objc_msgSend(v13, "queueSectionID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v17;
  v22[3] = CFSTR("incoming-item-id");
  objc_msgSend(v13, "queueItemID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v18;
  v22[4] = CFSTR("transition-type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = CFSTR("transition-parameters");
  v23[4] = v19;
  v23[5] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "emitEventType:payload:", CFSTR("item-transition-created"), v20);
}

- (void)stackControllerDidCancelTransitionFrom:(id)a3 to:(id)a4 type:(int64_t)a5 reason:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a4;
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "eventStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = CFSTR("outgoing-item-section-id");
  objc_msgSend(v12, "queueSectionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v22[1] = CFSTR("outgoing-item-id");
  objc_msgSend(v12, "queueItemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  v22[2] = CFSTR("incoming-item-section-id");
  objc_msgSend(v13, "queueSectionID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v17;
  v22[3] = CFSTR("incoming-item-id");
  objc_msgSend(v13, "queueItemID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v18;
  v22[4] = CFSTR("transition-type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = CFSTR("transition-cancellation-reason");
  v23[4] = v19;
  v23[5] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "emitEventType:payload:", CFSTR("item-transition-cancelled"), v20);
}

- (void)willPerformPlayerOperationWithPlayerIdentifier:(id)a3 operation:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "eventStream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("player-identifier");
  v14[1] = CFSTR("player-operation");
  v15[0] = v10;
  v15[1] = v9;
  v14[2] = CFSTR("player-operation-reason");
  v15[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "emitEventType:payload:", CFSTR("player-operation-begin"), v13);
}

- (void)didPerformPlayerOperationWithPlayerIdentifier:(id)a3 items:(id)a4 operation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "eventStream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("player-identifier");
  v15[1] = CFSTR("player-operation");
  v16[0] = v8;
  v16[1] = v10;
  v15[2] = CFSTR("player-items");
  v13 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "emitEventType:payload:", CFSTR("player-operation-end"), v14);

  if (!v9)
}

- (void)itemIsReadyForMetrics:(id)a3 accessLog:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _MPCPlaybackEnginePlayer *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[3];
  _QWORD v55[3];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  _MPCPlaybackEnginePlayer *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v44 = self;
  v65 = *MEMORY[0x24BDAC8D0];
  v48 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v45 = v5;
  objc_msgSend(v5, "events");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v51 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v12, "performanceMetrics", v44);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "performanceMetrics");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addEntriesFromDictionary:", v14);

        }
        objc_msgSend(v12, "observedBitrate");
        if (v15 > 0.0)
        {
          v16 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v12, "observedBitrate");
          objc_msgSend(v16, "numberWithDouble:");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("observedBitrate"));

        }
        objc_msgSend(v12, "indicatedBitrate");
        if (v18 > 0.0)
        {
          v19 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v12, "indicatedBitrate");
          objc_msgSend(v19, "numberWithDouble:");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("indicatedBitrate"));

        }
        objc_msgSend(v12, "startupTime");
        if (v21 > 0.0)
        {
          v22 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v12, "startupTime");
          objc_msgSend(v22, "numberWithDouble:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("startupTime"));

        }
        objc_msgSend(v12, "segmentsDownloadedDuration");
        if (v24 > 0.0)
        {
          v25 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v12, "segmentsDownloadedDuration");
          objc_msgSend(v25, "numberWithDouble:");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("segmentsDownloadedDuration"));

        }
        if (objc_msgSend(v12, "numberOfBytesTransferred") >= 1)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v12, "numberOfBytesTransferred"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("numberOfBytesTransferred"));

        }
        objc_msgSend(v12, "playbackSessionID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v12, "playbackSessionID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("playbackSessionID"));

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    }
    while (v9);
  }

  objc_msgSend(v48, "avPlayerItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "mpc_playerItemIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("identifier"));

  -[_MPCPlaybackEnginePlayer playbackEngine](v44, "playbackEngine");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "engineID");
  v33 = objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](v44, "_MPAVItemForMFQueuePlayerItem:", v48);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "queueSectionID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "queueItemID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 0, &v49);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = v49;
  if (v36)
  {
    v37 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v57 = v33;
      v58 = 2048;
      v59 = v44;
      v60 = 2114;
      v61 = v36;
      v62 = 2114;
      v63 = v6;
      _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlaybackEngineImplementation: %p - performanceMetricsPostedForItem received bad metrics - error: %{public}@ - metrics: %{public}@", buf, 0x2Au);
    }
    v38 = (void *)v35;

    v39 = 0;
  }
  else
  {
    v38 = (void *)v35;
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v35, 4);
  }
  v40 = (void *)v33;
  objc_msgSend(v32, "eventStream", v44);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = CFSTR("queue-section-id");
  v54[1] = CFSTR("queue-item-id");
  v55[0] = v47;
  v55[1] = v46;
  v54[2] = CFSTR("av-player-item-performance-metrics");
  v42 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55[2] = v42;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "emitEventType:payload:", CFSTR("item-ready-for-metrics"), v43);

  if (!v39)
}

- (void)renderingModeDidChange:(int64_t)a3 timeStamp:(id)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  _MPCPlaybackEnginePlayer *v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "engineID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v16 = v7;
    v17 = 2114;
    v18 = self;
    v19 = 2048;
    v20 = a3;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - renderingModeDidChange:%ld", buf, 0x20u);
  }

  -[_MPCPlaybackEnginePlayer currentItem](self, "currentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isAssetLoaded"))
    -[_MPCPlaybackEnginePlayer _updateActiveFormatForQueueItem:](self, "_updateActiveFormatForQueueItem:", v9);
  objc_msgSend(v6, "eventStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3, CFSTR("audio-rendering-mode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emitEventType:payload:", CFSTR("audio-rendering-mode-changed"), v12);

}

- (void)assetLoadingDidCompleteForItem:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _MPCPlaybackEnginePlayer *v11;
  _MPCPlaybackEnginePlayer *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  _MPCPlaybackEnginePlayer *v64;
  _QWORD v65[6];
  _QWORD v66[6];
  _QWORD v67[9];
  _QWORD v68[9];
  _QWORD v69[5];
  _QWORD v70[5];
  uint8_t buf[4];
  id v72;
  __int16 v73;
  _MPCPlaybackEnginePlayer *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engineID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queueSectionID");
  v11 = (_MPCPlaybackEnginePlayer *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queueItemID");
  v12 = (_MPCPlaybackEnginePlayer *)objc_claimAutoreleasedReturnValue();
  if (!-[_MPCPlaybackEnginePlayer length](v11, "length"))
  {
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      goto LABEL_46;
    *(_DWORD *)buf = 138543618;
    v72 = v6;
    v73 = 2114;
    v74 = v11;
    v25 = "Unexpected assetLoadingDidCompleteForItem: without sectionID: %{public}@ %{public}@";
LABEL_19:
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_FAULT, v25, buf, 0x16u);
    goto LABEL_46;
  }
  if (!-[_MPCPlaybackEnginePlayer length](v12, "length"))
  {
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      goto LABEL_46;
    *(_DWORD *)buf = 138543618;
    v72 = v6;
    v73 = 2114;
    v74 = v12;
    v25 = "Unexpected assetLoadingDidCompleteForItem: without itemID: %{public}@ %{public}@";
    goto LABEL_19;
  }
  v63 = v9;
  v64 = v12;
  -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentQueueItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v14
    && objc_msgSend(v8, "isVocalAttenuationEnabled")
    && -[_MPCPlaybackEnginePlayer _itemConfigurationIsIncompatibleWithVocalAttenuationState:](self, "_itemConfigurationIsIncompatibleWithVocalAttenuationState:", v10))
  {
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v72 = v63;
      v73 = 2114;
      v74 = self;
      v75 = 2114;
      v76 = v10;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - [AP] - Asset loading did finish - Unable to stream asset in vocal attenuation mode [turning off VA] - QueueItem: %{public}@", buf, 0x20u);
    }

    objc_msgSend(v8, "vocalAttenuationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCWhiskyController setEnabled:](v16, 0);

  }
  if (v7)
  {
    v61 = v6;
    v17 = v7;
    objc_msgSend(v8, "eventStream");
    v18 = objc_claimAutoreleasedReturnValue();
    v69[0] = CFSTR("queue-section-id");
    v69[1] = CFSTR("queue-item-id");
    v70[0] = v11;
    v70[1] = v64;
    v69[2] = CFSTR("rtc-service-id");
    objc_msgSend(v10, "rtcReportingServiceIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v70[2] = v20;
    v70[3] = v17;
    v69[3] = CFSTR("asset-load-error");
    v69[4] = CFSTR("time-control-status");
    v21 = (void *)MEMORY[0x24BDD16E0];
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "timeControlStatus"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v70[4] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject emitEventType:payload:](v18, "emitEventType:payload:", CFSTR("asset-load-end"), v24);

    if (!v19)
    v7 = v17;
    v6 = v61;
    v9 = v63;
    v12 = v64;
  }
  else
  {
    -[_MPCPlaybackEnginePlayer translator](self, "translator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMPAVItem:forMFPlayerItem:", v10, v6);

    objc_msgSend(v10, "modelGenericObject");
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSObject anyObject](v18, "anyObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "identifiers");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "modelPlayEvent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "genericObjectRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "anyObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "identifiers");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSObject type](v18, "type") == 1)
    {
      -[NSObject song](v18, "song");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isArtistUploadedContent");

    }
    else
    {
      v32 = 0;
    }
    objc_msgSend(v8, "eventStream");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = CFSTR("queue-section-id");
    v67[1] = CFSTR("queue-item-id");
    v68[0] = v11;
    v68[1] = v64;
    v67[2] = CFSTR("rtc-service-id");
    objc_msgSend(v10, "rtcReportingServiceIdentifier");
    v33 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)v33;
    if (!v33)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v33 = objc_claimAutoreleasedReturnValue();
    }
    v50 = (void *)v33;
    v68[2] = v33;
    v67[3] = CFSTR("item-ids");
    v34 = (uint64_t)v60;
    if (!v60)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v34 = objc_claimAutoreleasedReturnValue();
    }
    v49 = (void *)v34;
    v68[3] = v34;
    v67[4] = CFSTR("item-kind");
    objc_msgSend(v60, "modelKind");
    v35 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v35;
    if (!v35)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v35 = objc_claimAutoreleasedReturnValue();
    }
    v48 = (void *)v35;
    v68[4] = v35;
    v67[5] = CFSTR("item-metadata");
    v65[0] = CFSTR("item-has-video");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "isVideoContent"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v56;
    v65[1] = CFSTR("item-duration");
    objc_msgSend(v10, "durationFromExternalMetadata");
    v36 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v10, "durationFromExternalMetadata");
    objc_msgSend(v36, "numberWithDouble:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v55;
    v65[2] = CFSTR("item-initial-position");
    objc_msgSend(v10, "initialPlaybackStartTime");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = &unk_24CB16848;
    v54 = (void *)v37;
    if (v37)
      v38 = (void *)v37;
    v66[2] = v38;
    v65[3] = CFSTR("item-artist-uploaded");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v32);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v66[3] = v53;
    v65[4] = CFSTR("item-is-start-item");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "isStartItem"));
    v65[5] = CFSTR("item-is-placeholder");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v66[4] = v52;
    v66[5] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 6);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v68[5] = v51;
    v67[6] = CFSTR("container-ids");
    v39 = (uint64_t)v62;
    if (!v62)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v39 = objc_claimAutoreleasedReturnValue();
    }
    v68[6] = v39;
    v67[7] = CFSTR("container-kind");
    objc_msgSend(v62, "modelKind", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (!v40)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v68[7] = v41;
    v67[8] = CFSTR("time-control-status");
    v42 = (void *)MEMORY[0x24BDD16E0];
    -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v43, "timeControlStatus"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v68[8] = v44;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 9);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "emitEventType:payload:", CFSTR("asset-load-end"), v45);

    if (!v40)
    v12 = v64;
    if (!v62)

    v7 = 0;
    v46 = v58;
    v9 = v63;
    if (!v58)
    {

      v46 = 0;
    }

    if (!v60)
    if (!v57)

  }
LABEL_46:

}

- (void)assetLoadingDidStartForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[3];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCPlaybackEnginePlayer _MPAVItemForMFQueuePlayerItem:](self, "_MPAVItemForMFQueuePlayerItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queueSectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queueItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    if (objc_msgSend(v7, "length"))
    {
      -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject queueController](v8, "queueController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "targetContentItemID");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentItemID");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
      {

      }
      else
      {
        v12 = v11;
        v13 = objc_msgSend(v10, "isEqual:", v11);

        if ((v13 & 1) == 0)
          goto LABEL_13;
      }
      -[_MPCPlaybackEnginePlayer takeEVSDeferralAssertionForFirstAudioFrame](self, "takeEVSDeferralAssertionForFirstAudioFrame");
LABEL_13:
      -[NSObject eventStream](v8, "eventStream");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BDD16E0];
      -[_MPCPlaybackEnginePlayer playbackStackController](self, "playbackStackController", CFSTR("queue-section-id"), CFSTR("queue-item-id"), CFSTR("time-control-status"), v6, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v17, "timeControlStatus"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "emitEventType:payload:", CFSTR("asset-load-begin"), v19);

      goto LABEL_14;
    }
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v4;
      v24 = 2114;
      v25 = v7;
      v14 = "Unexpected assetLoadingDidStartForItem: without itemID: %{public}@ %{public}@";
      goto LABEL_10;
    }
  }
  else
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v4;
      v24 = 2114;
      v25 = v6;
      v14 = "Unexpected assetLoadingDidStartForItem: without sectionID: %{public}@ %{public}@";
LABEL_10:
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_FAULT, v14, buf, 0x16u);
    }
  }
LABEL_14:

}

- (void)takeEVSDeferralAssertionForFirstAudioFrame
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_MPCPlaybackEnginePlayer evsDeferralAssertionForFirstAudioFrame](self, "evsDeferralAssertionForFirstAudioFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[_MPCPlaybackEnginePlayer playbackEngine](self, "playbackEngine");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventStream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventDeliveryDeferralAssertionOfType:forReason:withTimeout:", 1, CFSTR("Waiting First Audio Frame"), 5.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCPlaybackEnginePlayer setEvsDeferralAssertionForFirstAudioFrame:](self, "setEvsDeferralAssertionForFirstAudioFrame:", v5);

  }
}

- (void)invalidateEVSDeferralAssertionForFirstAudioFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_MPCPlaybackEnginePlayer evsDeferralAssertionForFirstAudioFrame](self, "evsDeferralAssertionForFirstAudioFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[_MPCPlaybackEnginePlayer setEvsDeferralAssertionForFirstAudioFrame:](self, "setEvsDeferralAssertionForFirstAudioFrame:", 0);
  if (_os_feature_enabled_impl())
  {
    -[_MPCPlaybackEnginePlayer criticalSectionToken](self, "criticalSectionToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x24BE654F0];
      -[_MPCPlaybackEnginePlayer criticalSectionToken](self, "criticalSectionToken");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exitCriticalSection:", v6);

      -[_MPCPlaybackEnginePlayer setCriticalSectionToken:](self, "setCriticalSectionToken:", 0);
    }
  }
}

- (void)donateMetricsToPlayerItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "AVPlayerItemPerformanceMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v3;
  v6 = v3;
  v7 = v5;
  msv_dispatch_on_main_queue();

}

- (BOOL)autoPlayWhenLikelyToKeepUp
{
  return self->_autoPlayWhenLikelyToKeepUp;
}

- (void)setAutoPlayWhenLikelyToKeepUp:(BOOL)a3
{
  self->_autoPlayWhenLikelyToKeepUp = a3;
}

- (int64_t)jumpIdentifier
{
  return self->_jumpIdentifier;
}

- (void)setJumpIdentifier:(int64_t)a3
{
  self->_jumpIdentifier = a3;
}

- (MRCriticalSectionToken)criticalSectionToken
{
  return self->_criticalSectionToken;
}

- (void)setCriticalSectionToken:(id)a3
{
  objc_storeStrong((id *)&self->_criticalSectionToken, a3);
}

- (void)setBookmarker:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarker, a3);
}

- (void)setTranslator:(id)a3
{
  objc_storeStrong((id *)&self->_translator, a3);
}

- (void)setErrorController:(id)a3
{
  objc_storeStrong((id *)&self->_errorController, a3);
}

- (MPCExternalPlaybackController)externalPlaybackController
{
  return self->_externalPlaybackController;
}

- (void)setExternalPlaybackController:(id)a3
{
  objc_storeStrong((id *)&self->_externalPlaybackController, a3);
}

- (MFAssetLoading)assetLoader
{
  return self->_assetLoader;
}

- (void)setAssetLoader:(id)a3
{
  objc_storeStrong((id *)&self->_assetLoader, a3);
}

- (MPCLeaseController)leaseController
{
  return self->_leaseController;
}

- (void)setLeaseController:(id)a3
{
  objc_storeStrong((id *)&self->_leaseController, a3);
}

- (MPCPlayerItemConfigurator)configurator
{
  return self->_configurator;
}

- (void)setConfigurator:(id)a3
{
  objc_storeStrong((id *)&self->_configurator, a3);
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (MPCPlaybackEngineEventStreamDeferralAssertion)evsDeferralAssertionForFirstAudioFrame
{
  return self->_evsDeferralAssertionForFirstAudioFrame;
}

- (void)setEvsDeferralAssertionForFirstAudioFrame:(id)a3
{
  objc_storeStrong((id *)&self->_evsDeferralAssertionForFirstAudioFrame, a3);
}

- (void)setCurrentRelativeVolume:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)lastReportedVocalAttenuationEnabledState
{
  return self->_lastReportedVocalAttenuationEnabledState;
}

- (void)setLastReportedVocalAttenuationEnabledState:(BOOL)a3
{
  self->_lastReportedVocalAttenuationEnabledState = a3;
}

- (int64_t)applicationMusicPlayerTransitionType
{
  return self->_applicationMusicPlayerTransitionType;
}

- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3
{
  self->_applicationMusicPlayerTransitionType = a3;
}

- (double)applicationMusicPlayerCrossFadeDuration
{
  return self->_applicationMusicPlayerCrossFadeDuration;
}

- (void)setApplicationMusicPlayerCrossFadeDuration:(double)a3
{
  self->_applicationMusicPlayerCrossFadeDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRelativeVolume, 0);
  objc_storeStrong((id *)&self->_evsDeferralAssertionForFirstAudioFrame, 0);
  objc_storeStrong((id *)&self->_transientAudioSessionController, 0);
  objc_storeStrong((id *)&self->_playbackStartTrace, 0);
  objc_storeStrong((id *)&self->_configurator, 0);
  objc_storeStrong((id *)&self->_leaseController, 0);
  objc_storeStrong((id *)&self->_assetLoader, 0);
  objc_storeStrong((id *)&self->_externalPlaybackController, 0);
  objc_storeStrong((id *)&self->_errorController, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_bookmarker, 0);
  objc_storeStrong((id *)&self->_playbackStackController, 0);
  objc_storeStrong((id *)&self->_criticalSectionToken, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
}

+ (id)describePlayer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDDCAC8], "infoCenterForPlayerID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackQueueDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "playbackEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("# Player: %@\n\n"), v3);
      objc_msgSend(v7, "_stateDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Unexpected implementation class found: %@"), v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No player found for %@"), v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
