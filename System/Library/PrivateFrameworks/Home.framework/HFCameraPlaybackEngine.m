@implementation HFCameraPlaybackEngine

- (HFCameraPlaybackEngine)init
{
  return -[HFCameraPlaybackEngine initWithConfiguration:](self, "initWithConfiguration:", 0);
}

- (HFCameraPlaybackEngine)initWithConfiguration:(id)a3
{
  id v4;
  HFCameraPlaybackEngine *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *workQueue;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NADelegateDispatcher *observerDispatcher;
  uint64_t v14;
  NSMapTable *observerStates;
  void *v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  NSSet *batchedRecordingEvents;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HFCameraPlaybackEngine;
  v5 = -[HFCameraPlaybackEngine init](&v26, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.homeFramework.cameraPlaybackEngine.workQueue", v6);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc(MEMORY[0x1E0D519B0]);
    HFLogForCategory(0x17uLL);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithLog:logType:argumentFormatter:", v10, 1, 0);

    objc_msgSend(MEMORY[0x1E0D519A8], "dispatcherWithProtocol:logSettings:", &unk_1F0476760, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    observerDispatcher = v5->_observerDispatcher;
    v5->_observerDispatcher = (NADelegateDispatcher *)v12;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    observerStates = v5->_observerStates;
    v5->_observerStates = (NSMapTable *)v14;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_prefersAudioEnabled = objc_msgSend(v16, "BOOLForKey:", CFSTR("HFCameraPlaybackPrefersAudioEnabled"));

    -[HFCameraPlaybackEngine setStreamAudioEnabled:](v5, "setStreamAudioEnabled:", -[HFCameraPlaybackEngine prefersAudioEnabled](v5, "prefersAudioEnabled"));
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatForKey:", CFSTR("HFCameraPlaybackStreamAudioVolume"));
    v19 = v18;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("HFCameraPlaybackStreamAudioVolume"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v22) = 0.5;
    if (v21)
      *(float *)&v22 = v19;
    -[HFCameraPlaybackEngine setStreamAudioVolume:](v5, "setStreamAudioVolume:", v22);
    v23 = objc_opt_new();
    batchedRecordingEvents = v5->_batchedRecordingEvents;
    v5->_batchedRecordingEvents = (NSSet *)v23;

    if (v4)
      -[HFCameraPlaybackEngine updateConfiguration:](v5, "updateConfiguration:", v4);

  }
  return v5;
}

- (void)updateLiveStreamForCameraProfile:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HFCameraLiveStreamController *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x17uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == v4)
  {
    if (v7)
    {
      -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Bypassing live stream update for the current profile:%@", (uint8_t *)&v14, 0xCu);

    }
  }
  else
  {
    if (v7)
    {
      -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Updating from camera profile:%@ to profile:%@", (uint8_t *)&v14, 0x16u);

    }
    -[HFCameraPlaybackEngine setCameraProfile:](self, "setCameraProfile:", v4);
    -[HFCameraPlaybackEngine overrideLiveStreamController](self, "overrideLiveStreamController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v6 = v9;
    }
    else
    {
      v12 = [HFCameraLiveStreamController alloc];
      -[HFCameraPlaybackEngine home](self, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[HFCameraLiveStreamController initWithHome:cameraProfile:](v12, "initWithHome:cameraProfile:", v13, v4);

    }
    -[HFCameraPlaybackEngine _setupLiveStreamController:](self, "_setupLiveStreamController:", v6);
  }

}

- (void)setCameraProfile:(id)a3
{
  HMCameraProfile *v4;
  HMCameraProfile *cameraProfile;

  v4 = (HMCameraProfile *)a3;
  os_unfair_lock_lock_with_options();
  cameraProfile = self->_cameraProfile;
  self->_cameraProfile = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMCameraProfile)cameraProfile
{
  os_unfair_lock_s *p_lock;
  HMCameraProfile *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_cameraProfile;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setShouldBatchRecordingEvents:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_shouldBatchRecordingEvents = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)shouldBatchRecordingEvents
{
  HFCameraPlaybackEngine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_shouldBatchRecordingEvents;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setNotificationCenterClipUUID:(id)a3
{
  NSUUID *v4;
  NSUUID *notificationCenterClipUUID;

  v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  notificationCenterClipUUID = self->_notificationCenterClipUUID;
  self->_notificationCenterClipUUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)notificationCenterClipUUID
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_notificationCenterClipUUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setBatchedRecordingEvents:(id)a3
{
  NSSet *v4;
  NSObject *v5;
  NSSet *batchedRecordingEvents;

  v4 = (NSSet *)a3;
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngine workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

  }
  batchedRecordingEvents = self->_batchedRecordingEvents;
  self->_batchedRecordingEvents = v4;

}

- (NSSet)batchedRecordingEvents
{
  NSObject *v3;

  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngine workQueue](self, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

  }
  return self->_batchedRecordingEvents;
}

- (void)_setupLiveStreamController:(id)a3
{
  HFCameraLiveStreamControlling *v4;
  HFCameraLiveStreamControlling *liveStreamController;
  HFCameraLiveStreamControlling *v6;
  HMCameraSource *v7;
  HMCameraSource *liveCameraSource;
  HFCameraLiveStreamControlling *v9;

  v4 = (HFCameraLiveStreamControlling *)a3;
  liveStreamController = self->_liveStreamController;
  v6 = v4;
  if (liveStreamController != v4)
  {
    -[HFCameraLiveStreamControlling setDelegate:](liveStreamController, "setDelegate:", 0);
    v6 = self->_liveStreamController;
  }
  self->_liveStreamController = v4;
  v9 = v4;

  -[HFCameraLiveStreamControlling setDelegate:](self->_liveStreamController, "setDelegate:", self);
  -[HFCameraLiveStreamControlling liveCameraSource](v9, "liveCameraSource");
  v7 = (HMCameraSource *)objc_claimAutoreleasedReturnValue();
  liveCameraSource = self->_liveCameraSource;
  self->_liveCameraSource = v7;

}

- (void)_setupClipPlayerWithClipManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HFCameraClipPlaying *v8;
  void *clipPlayer;
  void *v10;
  void *v11;
  void *v12;
  HFCameraClipPlaying *v13;
  void *v14;
  HFCameraClipPlayer *v15;
  HFCameraClipPlaying *v16;
  HFCameraClipPlaying *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  HFCameraClipPlaying *v26;
  HFCameraClipPlayer *v27;
  HFCameraClipPlaying *v28;
  HFCameraClipPlaying *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[HFCameraPlaybackEngine eventCache](self, "eventCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clips");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFCameraPlaybackEngine overrideClipPlayer](self, "overrideClipPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
      clipPlayer = self->_clipPlayer;
      self->_clipPlayer = v8;
    }
    else
    {
      v15 = [HFCameraClipPlayer alloc];
      -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
      clipPlayer = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[HFCameraClipPlayer initWithCameraProfile:clips:](v15, "initWithCameraProfile:clips:", clipPlayer, v5);
      v17 = self->_clipPlayer;
      self->_clipPlayer = v16;

    }
    -[HFCameraClipPlaying setDelegate:](self->_clipPlayer, "setDelegate:", self);
    -[HFCameraPlaybackEngine clipScrubber](self, "clipScrubber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraClipPlaying setScrubber:](self->_clipPlayer, "setScrubber:", v18);

    -[HFCameraPlaybackEngine playbackPosition](self, "playbackPosition");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine _updateStateForRequestedPlaybackPosition:notifyObservers:](self, "_updateStateForRequestedPlaybackPosition:notifyObservers:", v19, 0);

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[HFCameraPlaybackEngine observerStates](self, "observerStates");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "keyEnumerator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v42 != v24)
            objc_enumerationMutation(v21);
          -[HFCameraPlaybackEngine _setupTimeObservationForObserver:](self, "_setupTimeObservationForObserver:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v23);
    }
  }
  else
  {
    if (!+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
    {
      -[HFCameraClipPlaying setDelegate:](self->_clipPlayer, "setDelegate:", 0);
      -[HFCameraClipPlaying setScrubber:](self->_clipPlayer, "setScrubber:", 0);
      v26 = self->_clipPlayer;
      self->_clipPlayer = 0;

      return;
    }
    -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFDemoModeAccessoryManager clipsForCameraProfile:](HFDemoModeAccessoryManager, "clipsForCameraProfile:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFCameraPlaybackEngine overrideClipPlayer](self, "overrideClipPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
      v14 = self->_clipPlayer;
      self->_clipPlayer = v13;
    }
    else
    {
      v27 = [HFCameraClipPlayer alloc];
      -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[HFCameraClipPlayer initWithCameraProfile:clips:](v27, "initWithCameraProfile:clips:", v14, v5);
      v29 = self->_clipPlayer;
      self->_clipPlayer = v28;

    }
    -[HFCameraClipPlaying setDelegate:](self->_clipPlayer, "setDelegate:", self);
    -[HFCameraPlaybackEngine clipScrubber](self, "clipScrubber");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraClipPlaying setScrubber:](self->_clipPlayer, "setScrubber:", v30);

    -[HFCameraPlaybackEngine playbackPosition](self, "playbackPosition");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine _updateStateForRequestedPlaybackPosition:notifyObservers:](self, "_updateStateForRequestedPlaybackPosition:notifyObservers:", v31, 0);

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[HFCameraPlaybackEngine observerStates](self, "observerStates", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "keyEnumerator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v38 != v35)
            objc_enumerationMutation(v21);
          -[HFCameraPlaybackEngine _setupTimeObservationForObserver:](self, "_setupTimeObservationForObserver:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
        }
        v34 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v34);
    }
  }

}

- (void)_setupTimeObservationForObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id from;
  id location;

  v4 = a3;
  -[HFCameraPlaybackEngine observerStates](self, "observerStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "periodicTimeUpdateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    objc_msgSend(v6, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "periodicTimeUpdateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __59__HFCameraPlaybackEngine__setupTimeObservationForObserver___block_invoke;
    v18 = &unk_1EA72A968;
    objc_copyWeak(&v19, &location);
    objc_copyWeak(&v20, &from);
    objc_msgSend(v13, "addPeriodicTimeObserverForInterval:usingBlock:", &v15, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimeObservationToken:", v14, v15, v16, v17, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

void __59__HFCameraPlaybackEngine__setupTimeObservationForObserver___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "playbackPosition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "playbackEngine:didUpdatePlaybackPosition:", WeakRetained, v3);

  }
}

- (void)fetchCameraEventsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v4 = a3;
  if (+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clipManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine setClipManager:](self, "setClipManager:", v6);

    -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFDemoModeAccessoryManager clipsForCameraProfile:](HFDemoModeAccessoryManager, "clipsForCameraProfile:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E0C9AA60];
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    -[HFCameraPlaybackEngine eventCache](self, "eventCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__HFCameraPlaybackEngine_fetchCameraEventsWithCompletion___block_invoke;
    v17[3] = &unk_1EA7265D0;
    v18 = v11;
    v19 = v4;
    v13 = v11;
    objc_msgSend(v12, "updateWithEvents:completion:", v13, v17);

  }
  else if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngine _fetchCameraEventsWithCompletion:](self, "_fetchCameraEventsWithCompletion:", v4);
  }
  else
  {
    -[HFCameraPlaybackEngine workQueue](self, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58__HFCameraPlaybackEngine_fetchCameraEventsWithCompletion___block_invoke_3;
    v15[3] = &unk_1EA727308;
    v15[4] = self;
    v16 = v4;
    dispatch_async(v14, v15);

  }
}

void __58__HFCameraPlaybackEngine_fetchCameraEventsWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__HFCameraPlaybackEngine_fetchCameraEventsWithCompletion___block_invoke_2;
  v2[3] = &unk_1EA728120;
  v4 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __58__HFCameraPlaybackEngine_fetchCameraEventsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __58__HFCameraPlaybackEngine_fetchCameraEventsWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCameraEventsWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchCameraEventsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v5, 86400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v5, -950400.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v6);
  HFLogForCategory(0x17uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Loading clips with date interval:%@.", buf, 0xCu);
  }

  HFLogForCategory(0xFuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Requesting playback engine clips with date interval:%@.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordingEventManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__HFCameraPlaybackEngine__fetchCameraEventsWithCompletion___block_invoke;
  v15[3] = &unk_1EA73D4A8;
  objc_copyWeak(&v18, (id *)buf);
  v13 = v8;
  v16 = v13;
  v14 = v4;
  v17 = v14;
  objc_msgSend(v12, "fetchEventsWithDateInterval:quality:limit:shouldOrderAscending:completion:", v13, 0, 100000, 1, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

void __59__HFCameraPlaybackEngine__fetchCameraEventsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  HFLogForCategory(0x17uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "cameraProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recordingEventManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v23 = (uint64_t)v11;
      v24 = 2112;
      v25 = v12;
      v26 = 2112;
      v27 = v6;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "Event manager:%@ failed to fetch events for dateInterval:%@ with error:%@", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v5, "count");
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Found events(%lu) for dateInterval:%@", buf, 0x16u);
  }

  objc_msgSend(WeakRetained, "eventCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v16 = v5;
  else
    v16 = (id)MEMORY[0x1E0C9AA60];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__HFCameraPlaybackEngine__fetchCameraEventsWithCompletion___block_invoke_80;
  v19[3] = &unk_1EA73D480;
  v19[4] = WeakRetained;
  v17 = *(id *)(a1 + 40);
  v20 = v6;
  v21 = v17;
  v18 = v6;
  objc_msgSend(v15, "updateWithEvents:completion:", v16, v19);

}

void __59__HFCameraPlaybackEngine__fetchCameraEventsWithCompletion___block_invoke_80(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    objc_msgSend(a1[4], "observerDispatcher");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "proxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "playbackEngine:didUpdateEventsIncludingUpdatedIdentifiers:replacedIdentifiers:removedIdentifiers:", a1[4], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);

    objc_msgSend(a1[4], "cameraProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clipManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setClipManager:", v5);

    v6 = (void (**)(id, void *, id))a1[6];
    objc_msgSend(a1[4], "eventCache");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "events");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7, a1[5]);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__HFCameraPlaybackEngine__fetchCameraEventsWithCompletion___block_invoke_2;
    block[3] = &unk_1EA73D458;
    block[4] = a1[4];
    v11 = a1[6];
    v10 = a1[5];
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __59__HFCameraPlaybackEngine__fetchCameraEventsWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "observerDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackEngine:didUpdateEventsIncludingUpdatedIdentifiers:replacedIdentifiers:removedIdentifiers:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);

  objc_msgSend(*(id *)(a1 + 32), "cameraProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clipManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setClipManager:", v5);

  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "eventCache");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "events");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, *(_QWORD *)(a1 + 40));

}

- (void)fetchCameraClipForUUID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0x17uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Loading engine for clip UUID:%@.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clipManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__HFCameraPlaybackEngine_fetchCameraClipForUUID_withCompletion___block_invoke;
  v13[3] = &unk_1EA73D520;
  objc_copyWeak(&v16, (id *)buf);
  v11 = v6;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v10, "fetchClipWithUUID:completion:", v11, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __64__HFCameraPlaybackEngine_fetchCameraClipForUUID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  HFLogForCategory(0x17uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "cameraProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clipManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v23 = v11;
      v24 = 2112;
      v25 = v12;
      v26 = 2112;
      v27 = v6;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "Clip manager:%@ failed to fetch clip %@ with error:%@", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Found clip:%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "na_arrayWithSafeObject:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "eventCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__HFCameraPlaybackEngine_fetchCameraClipForUUID_withCompletion___block_invoke_83;
  v17[3] = &unk_1EA73D4F8;
  objc_copyWeak(&v21, (id *)(a1 + 48));
  v20 = *(id *)(a1 + 40);
  v15 = v5;
  v18 = v15;
  v16 = v6;
  v19 = v16;
  objc_msgSend(v14, "updateWithEvents:completion:", v13, v17);

  objc_destroyWeak(&v21);
}

void __64__HFCameraPlaybackEngine_fetchCameraClipForUUID_withCompletion___block_invoke_83(id *a1)
{
  _QWORD v2[4];
  id v3;
  id v4;
  id v5;
  id v6;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__HFCameraPlaybackEngine_fetchCameraClipForUUID_withCompletion___block_invoke_2;
  v2[3] = &unk_1EA73D4D0;
  objc_copyWeak(&v6, a1 + 7);
  v5 = a1[6];
  v3 = a1[4];
  v4 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v6);
}

void __64__HFCameraPlaybackEngine_fetchCameraClipForUUID_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "observerDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackEngine:didUpdateEventsIncludingUpdatedIdentifiers:replacedIdentifiers:removedIdentifiers:", WeakRetained, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);

  objc_msgSend(WeakRetained, "cameraProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clipManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setClipManager:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchCameraClipForNotificationUUID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0x16uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "(NC) Request clip for uuid:%@ using profile:%@.", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clipManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__HFCameraPlaybackEngine_fetchCameraClipForNotificationUUID_withCompletion___block_invoke;
  v14[3] = &unk_1EA73D520;
  objc_copyWeak(&v17, (id *)buf);
  v12 = v6;
  v15 = v12;
  v13 = v7;
  v16 = v13;
  objc_msgSend(v11, "fetchClipForSignificantEventWithUUID:completion:", v12, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __76__HFCameraPlaybackEngine_fetchCameraClipForNotificationUUID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  HFLogForCategory(0x17uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "cameraProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recordingEventManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v27 = v11;
      v28 = 2112;
      v29 = v12;
      v30 = 2112;
      v31 = v6;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "(NC) Event manager:%@ failed to fetch clip for uuid:%@ with error:%@", buf, 0x20u);

    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "cameraProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordingEventManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v27 = v14;
    v28 = 2112;
    v29 = v5;
    v30 = 2112;
    v31 = v15;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "(NC) Event manager:%@ found clip:%@ for UUID:%@", buf, 0x20u);

  }
  if (objc_msgSend(v5, "isComplete"))
  {
    objc_msgSend(WeakRetained, "cameraProfile");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject recordingEventManager](v9, "recordingEventManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObserver:", WeakRetained);

LABEL_8:
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "na_arrayWithSafeObject:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "eventCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __76__HFCameraPlaybackEngine_fetchCameraClipForNotificationUUID_withCompletion___block_invoke_85;
  v21[3] = &unk_1EA73D4F8;
  objc_copyWeak(&v25, (id *)(a1 + 48));
  v24 = *(id *)(a1 + 40);
  v19 = v5;
  v22 = v19;
  v20 = v6;
  v23 = v20;
  objc_msgSend(v18, "updateWithEvents:completion:", v17, v21);

  objc_destroyWeak(&v25);
}

void __76__HFCameraPlaybackEngine_fetchCameraClipForNotificationUUID_withCompletion___block_invoke_85(id *a1)
{
  _QWORD v2[4];
  id v3;
  id v4;
  id v5;
  id v6;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __76__HFCameraPlaybackEngine_fetchCameraClipForNotificationUUID_withCompletion___block_invoke_2;
  v2[3] = &unk_1EA73D4D0;
  objc_copyWeak(&v6, a1 + 7);
  v5 = a1[6];
  v3 = a1[4];
  v4 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v6);
}

void __76__HFCameraPlaybackEngine_fetchCameraClipForNotificationUUID_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "observerDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackEngine:didUpdateEventsIncludingUpdatedIdentifiers:replacedIdentifiers:removedIdentifiers:", WeakRetained, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);

  objc_msgSend(WeakRetained, "cameraProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clipManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setClipManager:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)setClipManager:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_clipManager);
  v6 = objc_msgSend(WeakRetained, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    HFLogForCategory(0x17uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_loadWeakRetained((id *)&self->_clipManager);
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Transitioning from clip manager:%@ to clip manager:%@.", (uint8_t *)&v12, 0x16u);

    }
    objc_storeWeak((id *)&self->_clipManager, v4);
    -[HFCameraPlaybackEngine _setupClipPlayerWithClipManager:](self, "_setupClipPlayerWithClipManager:", v4);
    -[HFCameraPlaybackEngine observerDispatcher](self, "observerDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "proxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine player](self, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playbackEngine:didUpdateClipPlayer:", self, v11);

  }
}

- (void)updateConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  HFCameraLiveStreamController *v24;
  HFCameraLiveStreamController *v25;
  void *v26;
  void *v27;
  HFCameraVideoDownloader *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HFCameraPlaybackEngineEventCache *v33;
  NSObject *v34;
  NSObject *v35;
  dispatch_source_t v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HFCameraClipScrubbing *v45;
  HFCameraClipScrubbing *clipScrubber;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  _QWORD handler[4];
  id v54;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraPlaybackEngine.m"), 418, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  objc_msgSend(v5, "assertConfigurationIsValid");
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngine workQueue](self, "workQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      HFLogForCategory(0x17uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v57 = "-[HFCameraPlaybackEngine updateConfiguration:]";
        _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "%s workQueue is nil! Skipping update", buf, 0xCu);
      }
      goto LABEL_25;
    }
  }
  -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordingEventManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:", self);

    -[HFCameraPlaybackEngine batchedRecordingEventsTimer](self, "batchedRecordingEventsTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[HFCameraPlaybackEngine batchedRecordingEventsTimer](self, "batchedRecordingEventsTimer");
      v12 = objc_claimAutoreleasedReturnValue();
      dispatch_source_cancel(v12);

    }
    -[HFCameraPlaybackEngine setShouldBatchRecordingEvents:](self, "setShouldBatchRecordingEvents:", 0);
    if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraPlaybackEngine setBatchedRecordingEvents:](self, "setBatchedRecordingEvents:", v13);

    }
    else
    {
      -[HFCameraPlaybackEngine workQueue](self, "workQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __46__HFCameraPlaybackEngine_updateConfiguration___block_invoke;
      block[3] = &unk_1EA727DD8;
      block[4] = self;
      dispatch_async(v14, block);

    }
  }
  objc_msgSend(v5, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraPlaybackEngine setHome:](self, "setHome:", v15);

  objc_msgSend(v5, "cameraProfile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraPlaybackEngine setCameraProfile:](self, "setCameraProfile:", v16);

  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
LABEL_17:
    objc_msgSend(v5, "notificationClipUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine setNotificationCenterClipUUID:](self, "setNotificationCenterClipUUID:", v21);

    if (!+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
    {
      -[HFCameraPlaybackEngine overrideLiveStreamController](self, "overrideLiveStreamController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        v24 = v22;
      }
      else
      {
        v25 = [HFCameraLiveStreamController alloc];
        -[HFCameraPlaybackEngine home](self, "home");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[HFCameraLiveStreamController initWithHome:cameraProfile:](v25, "initWithHome:cameraProfile:", v26, v27);

      }
      -[HFCameraPlaybackEngine _setupLiveStreamController:](self, "_setupLiveStreamController:", v24);

    }
    v28 = [HFCameraVideoDownloader alloc];
    objc_msgSend(v5, "cameraProfile");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HFCameraVideoDownloader initWithCameraProfile:](v28, "initWithCameraProfile:", v29);

    +[HFCameraTimelapseVideoProvider sharedProvider](HFCameraTimelapseVideoProvider, "sharedProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTimelapseVideoDownloader:", v18);

    objc_msgSend(v5, "cameraProfile");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCameraImageManager sharedManager](HFCameraImageManager, "sharedManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCameraProfile:", v31);

    v33 = objc_alloc_init(HFCameraPlaybackEngineEventCache);
    -[HFCameraPlaybackEngine setEventCache:](self, "setEventCache:", v33);

    HFLogForCategory(0x17uLL);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v34, OS_LOG_TYPE_DEFAULT, "Batch recording events begin", buf, 2u);
    }

    -[HFCameraPlaybackEngine setShouldBatchRecordingEvents:](self, "setShouldBatchRecordingEvents:", 1);
    -[HFCameraPlaybackEngine workQueue](self, "workQueue");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v35);
    -[HFCameraPlaybackEngine setBatchedRecordingEventsTimer:](self, "setBatchedRecordingEventsTimer:", v36);

    -[HFCameraPlaybackEngine batchedRecordingEventsTimer](self, "batchedRecordingEventsTimer");
    v37 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v37, 0, 0x3B9ACA00uLL, 0);

    objc_initWeak((id *)buf, self);
    -[HFCameraPlaybackEngine batchedRecordingEventsTimer](self, "batchedRecordingEventsTimer");
    v38 = objc_claimAutoreleasedReturnValue();
    handler[0] = v8;
    handler[1] = 3221225472;
    handler[2] = __46__HFCameraPlaybackEngine_updateConfiguration___block_invoke_97;
    handler[3] = &unk_1EA728AE8;
    objc_copyWeak(&v54, (id *)buf);
    dispatch_source_set_event_handler(v38, handler);

    -[HFCameraPlaybackEngine batchedRecordingEventsTimer](self, "batchedRecordingEventsTimer");
    v39 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v39);

    -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "recordingEventManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine workQueue](self, "workQueue");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:queue:", self, v42);

    -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "recordingEventManager");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v8;
    v51[1] = 3221225472;
    v51[2] = __46__HFCameraPlaybackEngine_updateConfiguration___block_invoke_99;
    v51[3] = &unk_1EA727818;
    objc_copyWeak(&v52, (id *)buf);
    objc_msgSend(v44, "performCloudPullWithCompletion:", v51);

    objc_msgSend(v5, "clipScrubber");
    v45 = (HFCameraClipScrubbing *)objc_claimAutoreleasedReturnValue();
    clipScrubber = self->_clipScrubber;
    self->_clipScrubber = v45;

    objc_msgSend(v5, "playbackPosition");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCameraPlaybackPosition livePosition](HFCameraPlaybackPosition, "livePosition");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    self->_engineMode = objc_msgSend(v47, "isEqual:", v48) ^ 1;

    objc_msgSend(v5, "playbackPosition");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine _updateStateForRequestedPlaybackPosition:notifyObservers:](self, "_updateStateForRequestedPlaybackPosition:notifyObservers:", v49, 0);

    objc_destroyWeak(&v52);
    objc_destroyWeak(&v54);
    objc_destroyWeak((id *)buf);
LABEL_25:

    goto LABEL_26;
  }
  -[HFCameraPlaybackEngine home](self, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

    goto LABEL_17;
  }
  -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (!v20)
    goto LABEL_17;
LABEL_26:

}

void __46__HFCameraPlaybackEngine_updateConfiguration___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBatchedRecordingEvents:", v2);

}

void __46__HFCameraPlaybackEngine_updateConfiguration___block_invoke_97(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(0x17uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(WeakRetained, "batchedRecordingEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v5;
    v16 = 1024;
    v17 = objc_msgSend(WeakRetained, "shouldBatchRecordingEvents");
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Batch recording event throttling timer invoked; batched events: %@; batch in progress: %{BOOL}d",
      (uint8_t *)&v14,
      0x12u);

  }
  objc_msgSend(WeakRetained, "batchedRecordingEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(WeakRetained, "cameraProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordingEventManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "batchedRecordingEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_recordingEventManager:didUpdateRecordingEvents:", v9, v10);

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setBatchedRecordingEvents:", v11);
LABEL_5:

    goto LABEL_11;
  }
  if ((objc_msgSend(WeakRetained, "shouldBatchRecordingEvents") & 1) == 0)
  {
    HFLogForCategory(0x17uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Batch recording event throttling timer invalidated", (uint8_t *)&v14, 2u);
    }

    objc_msgSend(WeakRetained, "batchedRecordingEventsTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(WeakRetained, "batchedRecordingEventsTimer");
      v11 = objc_claimAutoreleasedReturnValue();
      dispatch_source_cancel(v11);
      goto LABEL_5;
    }
  }
LABEL_11:

}

void __46__HFCameraPlaybackEngine_updateConfiguration___block_invoke_99(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShouldBatchRecordingEvents:", 0);

  HFLogForCategory(0x17uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Batch recording events end, error: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (AVPlayer)player
{
  void *v2;
  void *v3;

  -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPlayer *)v3;
}

- (HFCameraPlaybackPosition)playbackPosition
{
  unint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = -[HFCameraPlaybackEngine playbackContentType](self, "playbackContentType");
  if (v4 == 1)
  {
    -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentPosition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8 || -[HFCameraPlaybackEngine isScrubbing](self, "isScrubbing"))
    {
      HFLogForCategory(0x17uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = -[HFCameraPlaybackEngine isScrubbing](self, "isScrubbing");
        -[HFCameraPlaybackEngine lastRequestedClipPlaybackDate](self, "lastRequestedClipPlaybackDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v17 = v8;
        v18 = 1024;
        v19 = v10;
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Missing playbackDate. ClipPlayer playbackDate:%@ isScrubbing:%{BOOL}d lastRequestedClipPlaybackDate:%@", buf, 0x1Cu);

      }
      -[HFCameraPlaybackEngine lastRequestedClipPlaybackDate](self, "lastRequestedClipPlaybackDate");
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
    +[HFCameraPlaybackPosition clipPositionWithDate:](HFCameraPlaybackPosition, "clipPositionWithDate:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return (HFCameraPlaybackPosition *)v13;
  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFCameraPlaybackEngine playbackContentType](self, "playbackContentType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraPlaybackEngine.m"), 542, CFSTR("Unknown playback content type %@"), v15);

    return (HFCameraPlaybackPosition *)0;
  }
  else
  {
    +[HFCameraPlaybackPosition livePosition](HFCameraPlaybackPosition, "livePosition");
    return (HFCameraPlaybackPosition *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)updatePlaybackPositionToDate:(id)a3 usingClip:(id)a4
{
  id v5;

  if (a4)
    +[HFCameraPlaybackPosition clipPositionWithDate:inClip:](HFCameraPlaybackPosition, "clipPositionWithDate:inClip:", a3);
  else
    +[HFCameraPlaybackPosition clipPositionWithDate:](HFCameraPlaybackPosition, "clipPositionWithDate:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HFCameraPlaybackEngine setPlaybackPosition:](self, "setPlaybackPosition:", v5);

}

- (void)startPlaybackAtDate:(id)a3 withClip:(id)a4
{
  id v5;

  self->_wantsToPlay = 1;
  if (a4)
  {
    -[HFCameraPlaybackEngine updatePlaybackPositionToDate:usingClip:](self, "updatePlaybackPositionToDate:usingClip:", a3);
  }
  else
  {
    +[HFCameraPlaybackPosition livePosition](HFCameraPlaybackPosition, "livePosition", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine setPlaybackPosition:](self, "setPlaybackPosition:", v5);

  }
}

- (void)setPlaybackPosition:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x17uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Setting playback position: %@", (uint8_t *)&v13, 0xCu);
  }

  if (v4)
  {
    -[HFCameraPlaybackEngine playbackPosition](self, "playbackPosition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v4) & 1) != 0)
    {
      +[HFCameraPlaybackPosition livePosition](HFCameraPlaybackPosition, "livePosition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "isEqual:", v7);

      if (!v8)
        goto LABEL_16;
    }
    else
    {

    }
    +[HFCameraPlaybackPosition livePosition](HFCameraPlaybackPosition, "livePosition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "isEqual:", v10);

    if (v11)
    {
      HFLogForCategory(0x17uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
      }

      self->_playbackContentType = 1;
      self->_wantsToPlay = 1;
    }
    -[HFCameraPlaybackEngine _updateStateForRequestedPlaybackPosition:notifyObservers:](self, "_updateStateForRequestedPlaybackPosition:notifyObservers:", v4, 1);
  }
  else
  {
    HFLogForCategory(0x17uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "Ignore missing playbackPosition update.", (uint8_t *)&v13, 2u);
    }

  }
LABEL_16:

}

- (void)play
{
  -[HFCameraPlaybackEngine setWantsToPlay:](self, "setWantsToPlay:", 1);
}

- (void)pause
{
  -[HFCameraPlaybackEngine setWantsToPlay:](self, "setWantsToPlay:", 0);
}

- (void)addObserver:(id)a3 withOptions:(id)a4
{
  id v7;
  HFCameraPlaybackEngineObservationState *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraPlaybackEngine.m"), 601, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options != nil"));

  }
  v8 = objc_alloc_init(HFCameraPlaybackEngineObservationState);
  -[HFCameraPlaybackEngineObservationState setOptions:](v8, "setOptions:", v7);
  -[HFCameraPlaybackEngine observerStates](self, "observerStates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v12);

  -[HFCameraPlaybackEngine observerDispatcher](self, "observerDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:", v12);

  -[HFCameraPlaybackEngine _setupTimeObservationForObserver:](self, "_setupTimeObservationForObserver:", v12);
}

- (void)removeObserver:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HFCameraPlaybackEngine observerStates](self, "observerStates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeObservationToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeTimeObserver:", v6);

  }
  -[HFCameraPlaybackEngine observerStates](self, "observerStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v10);

  -[HFCameraPlaybackEngine observerDispatcher](self, "observerDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", v10);

}

- (NSArray)observers
{
  void *v2;
  void *v3;

  -[HFCameraPlaybackEngine observerDispatcher](self, "observerDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)modifyPlaybackFromSender:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[HFCameraPlaybackEngine observerDispatcher](self, "observerDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__HFCameraPlaybackEngine_modifyPlaybackFromSender_usingBlock___block_invoke;
  v10[3] = &unk_1EA73D548;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v7, v10);

}

uint64_t __62__HFCameraPlaybackEngine_modifyPlaybackFromSender_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (HMCameraClip)currentClip
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HFCameraPlaybackEngine playbackPosition](self, "playbackPosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "contentType"))
  {
    objc_msgSend(v3, "clipPlaybackDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine eventCache](self, "eventCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "events");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCameraPlaybackEngine findClipPositionForDate:inEvents:options:](HFCameraPlaybackEngine, "findClipPositionForDate:inEvents:options:", v4, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "clip");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HFCameraPlaybackEngine notificationCenterClipUUID](self, "notificationCenterClipUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        HFLogForCategory(0x17uLL);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          -[HFCameraPlaybackEngine eventCache](self, "eventCache");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "clips");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138412290;
          v24 = v21;
          _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "(NC) Returning the first event:%@", (uint8_t *)&v23, 0xCu);

        }
        -[HFCameraPlaybackEngine eventCache](self, "eventCache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "clips");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[HFCameraPlaybackEngine eventCache](self, "eventCache");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "clips");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "hf_endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        HFLogForCategory(0x17uLL);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v3, "clipPlaybackDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138412802;
          v24 = v22;
          v25 = 2112;
          v26 = v16;
          v27 = 2112;
          v28 = v15;
          _os_log_error_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_ERROR, "Clip playback date (%@) is >= the last clip's playback date (%@) using clip:%@", (uint8_t *)&v23, 0x20u);

        }
        v8 = 0;
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return (HMCameraClip *)v8;
}

- (void)beginScrubbing
{
  -[HFCameraPlaybackEngine setScrubbingInProgressCount:](self, "setScrubbingInProgressCount:", -[HFCameraPlaybackEngine scrubbingInProgressCount](self, "scrubbingInProgressCount") + 1);
  -[HFCameraPlaybackEngine setScrubbing:](self, "setScrubbing:", 1);
}

- (void)endScrubbing
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[HFCameraPlaybackEngine scrubbingInProgressCount](self, "scrubbingInProgressCount"))
  {
    -[HFCameraPlaybackEngine setScrubbingInProgressCount:](self, "setScrubbingInProgressCount:", -[HFCameraPlaybackEngine scrubbingInProgressCount](self, "scrubbingInProgressCount") - 1);
    if (!-[HFCameraPlaybackEngine scrubbingInProgressCount](self, "scrubbingInProgressCount"))
      -[HFCameraPlaybackEngine setScrubbing:](self, "setScrubbing:", 0);
  }
  else
  {
    HFLogForCategory(0x17uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "Attempting to end scrubbing when scrubbing is not in progress!", v4, 2u);
    }

  }
}

- (void)setStreamAudioVolume:(float)a3
{
  -[HFCameraPlaybackEngine _setPlayerVolume:notifyObservers:](self, "_setPlayerVolume:notifyObservers:", 1);
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  -[HFCameraPlaybackEngine _setMicrophoneEnabled:notifyObservers:](self, "_setMicrophoneEnabled:notifyObservers:", a3, 1);
}

- (void)setStreamAudioEnabled:(BOOL)a3
{
  -[HFCameraPlaybackEngine _setStreamAudioEnabled:notifyObservers:](self, "_setStreamAudioEnabled:notifyObservers:", a3, 1);
}

- (void)setPrefersAudioEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  HFCameraPlaybackEngine *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_prefersAudioEnabled != a3)
  {
    v3 = a3;
    HFLogForCategory(0x17uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@ preferred audio state changed: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBool:forKey:", v3, CFSTR("HFCameraPlaybackPrefersAudioEnabled"));
    self->_prefersAudioEnabled = v3;
    -[HFCameraPlaybackEngine setStreamAudioEnabled:](self, "setStreamAudioEnabled:", v3);

  }
}

- (BOOL)shouldDisplayVolumeControls
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (-[HFCameraPlaybackEngine isUserScrubbing](self, "isUserScrubbing"))
    return 0;
  if (!-[HFCameraPlaybackEngine engineMode](self, "engineMode"))
  {
    -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "currentAccessMode");

    -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isCameraManuallyDisabled") & 1) != 0 || !v6)
    {

    }
    else
    {

      if (v6 != 3)
        return 1;
    }
    return 0;
  }
  return 1;
}

- (unint64_t)timelineState
{
  return self->_timelineState;
}

- (void)setTimelineState:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  _BOOL4 scrubbing;
  _BOOL4 userScrubbing;
  _QWORD v9[6];
  uint8_t buf[4];
  HFCameraPlaybackEngine *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_timelineState != a3)
  {
    self->_timelineState = a3;
    HFLogForCategory(0x17uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[HFCameraPlaybackEngine timelineStateDescription](self, "timelineStateDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      scrubbing = self->_scrubbing;
      userScrubbing = self->_userScrubbing;
      *(_DWORD *)buf = 138413058;
      v11 = self;
      v12 = 2112;
      v13 = v6;
      v14 = 1024;
      v15 = scrubbing;
      v16 = 1024;
      v17 = userScrubbing;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Engine:%@ updated timelineState:%@ Scrubbing:%{BOOL}d UserScrubbing:%{BOOL}d", buf, 0x22u);

    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__HFCameraPlaybackEngine_setTimelineState___block_invoke;
    v9[3] = &unk_1EA72B268;
    v9[4] = self;
    v9[5] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v9);
  }
}

void __43__HFCameraPlaybackEngine_setTimelineState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "observerDispatcher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackEngine:didUpdateTimelineState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setShouldBypassVideoFetchRequest:(BOOL)a3
{
  if (self->_shouldBypassVideoFetchRequest != a3)
    self->_shouldBypassVideoFetchRequest = a3;
}

- (void)setShouldBypassHighQualityScrubbing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_shouldBypassHighQualityScrubbing != a3)
  {
    v3 = a3;
    self->_shouldBypassHighQualityScrubbing = a3;
    -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShouldBypassScrubbing:", v3);

  }
}

- (BOOL)hasRecordingEvents
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HFCameraPlaybackEngine eventCache](self, "eventCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clips");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (NSArray)cameraEvents
{
  void *v2;
  void *v3;

  -[HFCameraPlaybackEngine eventCache](self, "eventCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)cameraClips
{
  void *v2;
  void *v3;

  -[HFCameraPlaybackEngine eventCache](self, "eventCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clips");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (HMCameraClip)clipWithLongestDuration
{
  void *v2;
  void *v3;

  -[HFCameraPlaybackEngine eventCache](self, "eventCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clipWithLongestDuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCameraClip *)v3;
}

- (id)daysWithClips
{
  void *v2;
  void *v3;

  -[HFCameraPlaybackEngine eventCache](self, "eventCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "daysWithClips");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isCameraPortraitMode
{
  void *v2;
  double v3;
  double v4;

  -[HFCameraPlaybackEngine liveCameraSource](self, "liveCameraSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aspectRatio");
  v4 = v3;

  return v4 > 0.0 && v4 < 1.0;
}

- (void)startPlaybackForCurrentClip
{
  void *v3;
  void *v4;
  id v5;
  HFCameraAnalyticsCameraClipPlaybackSessionEvent *v6;
  void *v7;
  HFCameraAnalyticsCameraClipPlaybackSessionEvent *v8;
  id v9;

  -[HFCameraPlaybackEngine playbackSessionEvent](self, "playbackSessionEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFCameraPlaybackEngine playbackSessionEvent](self, "playbackSessionEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "sendEventForState:", 2);

  }
  v6 = [HFCameraAnalyticsCameraClipPlaybackSessionEvent alloc];
  -[HFCameraPlaybackEngine currentClip](self, "currentClip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFCameraAnalyticsEvent initWithCameraClip:](v6, "initWithCameraClip:", v7);
  -[HFCameraPlaybackEngine setPlaybackSessionEvent:](self, "setPlaybackSessionEvent:", v8);

  -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "play");

}

- (void)setScrubbing:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v15[5];
  BOOL v16;
  uint8_t buf[4];
  HFCameraPlaybackEngine *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_scrubbing != a3)
  {
    v3 = a3;
    HFLogForCategory(0x17uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = self;
      v19 = 1024;
      v20 = v3;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@ Scrubbing state changed. UserScrubbing:%{BOOL}d", buf, 0x12u);
    }

    -[HFCameraPlaybackEngine playbackPosition](self, "playbackPosition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
    {
      objc_msgSend(v6, "clipPlaybackDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraPlaybackEngine setLastRequestedClipPlaybackDate:](self, "setLastRequestedClipPlaybackDate:", v8);

      self->_scrubbing = v3;
    }
    else
    {
      self->_scrubbing = 0;
      -[HFCameraPlaybackEngine lastRequestedClipPlaybackDate](self, "lastRequestedClipPlaybackDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraPlaybackEngine currentClip](self, "currentClip");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateOfOccurrence");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", v11);
      v13 = v12;

      -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endScrubbingWithOffset:", v13);

      -[HFCameraPlaybackEngine _updateStateForRequestedPlaybackPosition:notifyObservers:](self, "_updateStateForRequestedPlaybackPosition:notifyObservers:", v7, 1);
    }
    -[HFCameraPlaybackEngine _updatePlaybackStateNotifyingObservers:](self, "_updatePlaybackStateNotifyingObservers:", 1);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39__HFCameraPlaybackEngine_setScrubbing___block_invoke;
    v15[3] = &unk_1EA73D570;
    v15[4] = self;
    v16 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v15);

  }
}

void __39__HFCameraPlaybackEngine_setScrubbing___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "observerDispatcher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackEngine:didUpdateScrubbingStatus:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)setWantsToPlay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  int v7;
  HFCameraPlaybackEngine *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (self->_wantsToPlay != a3
    || (-[HFCameraPlaybackEngine playbackError](self, "playbackError"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    self->_wantsToPlay = v3;
    HFLogForCategory(0x17uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = self;
      v9 = 1024;
      v10 = v3;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "%@ toggled wantsToPlay:%{BOOL}d", (uint8_t *)&v7, 0x12u);
    }

    if (self->_wantsToPlay)
      -[HFCameraPlaybackEngine setPlaybackRetryAttempts:](self, "setPlaybackRetryAttempts:", 0);
    -[HFCameraPlaybackEngine _updatePlaybackStateNotifyingObservers:](self, "_updatePlaybackStateNotifyingObservers:", 1);
  }
}

- (unint64_t)_derivedTimeControlStatus
{
  unint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HFCameraPlaybackEngine__derivedTimeControlStatus__block_invoke;
  v7[3] = &unk_1EA73D598;
  v7[4] = self;
  v3 = __51__HFCameraPlaybackEngine__derivedTimeControlStatus__block_invoke((uint64_t)v7);
  if (!v3)
  {
    if (-[HFCameraPlaybackEngine wantsToPlay](self, "wantsToPlay"))
    {
      -[HFCameraPlaybackEngine _derivedPlaybackError](self, "_derivedPlaybackError");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v4 == 0;

    }
    else
    {
      v3 = 0;
    }
  }
  HFLogForCategory(0x17uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v9 = v3;
    _os_log_debug_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEBUG, "Playback engine current timeControlStatus:%lu", buf, 0xCu);
  }

  return v3;
}

uint64_t __51__HFCameraPlaybackEngine__derivedTimeControlStatus__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "playbackContentType");
  if (result == 1)
    goto LABEL_5;
  if (result)
    return result;
  objc_msgSend(*(id *)(a1 + 32), "liveStreamController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "streamState");

  if ((unint64_t)(v4 - 1) < 4)
    return qword_1DD669C58[v4 - 1];
LABEL_5:
  objc_msgSend(*(id *)(a1 + 32), "clipPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "timeControlStatus");

  v7 = 1;
  if (v6 != 1)
    v7 = 2;
  if (v6)
    return v7;
  else
    return 0;
}

- (id)_derivedPlaybackError
{
  void *v2;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = -[HFCameraPlaybackEngine playbackContentType](self, "playbackContentType");
  if (v4 == 1)
  {
    -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v4)
  {
    -[HFCameraPlaybackEngine liveStreamController](self, "liveStreamController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "streamError");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v2 = (void *)v6;

  }
  return v2;
}

- (void)_updatePlaybackStateNotifyingObservers:(BOOL)a3
{
  -[HFCameraPlaybackEngine _updatePlaybackStateNotifyingObservers:rebuildClipPlayerIfNeeded:](self, "_updatePlaybackStateNotifyingObservers:rebuildClipPlayerIfNeeded:", a3, 1);
}

- (void)_updatePlaybackStateNotifyingObservers:(BOOL)a3 rebuildClipPlayerIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v4 = a4;
  v5 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasFatalError");

    if (v10)
    {
      if (v4)
      {
        HFLogForCategory(0x17uLL);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "error");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v44 = v13;
          _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Rebuilding clip player after fatal error:%@", buf, 0xCu);

        }
        -[HFCameraPlaybackEngine clipManager](self, "clipManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFCameraPlaybackEngine _setupClipPlayerWithClipManager:](self, "_setupClipPlayerWithClipManager:", v14);

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __91__HFCameraPlaybackEngine__updatePlaybackStateNotifyingObservers_rebuildClipPlayerIfNeeded___block_invoke;
        block[3] = &unk_1EA727DD8;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
    }
  }
  if (-[HFCameraPlaybackEngine wantsToPlay](self, "wantsToPlay")
    && -[HFCameraPlaybackEngine playbackContentType](self, "playbackContentType") == 1
    && !-[HFCameraPlaybackEngine isScrubbing](self, "isScrubbing"))
  {
    -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "timeControlStatus");

    if (!v36)
    {
      if (-[HFCameraPlaybackEngine isPictureInPictureModeActive](self, "isPictureInPictureModeActive"))
      {
        HFLogForCategory(0x17uLL);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DD34E000, v37, OS_LOG_TYPE_DEFAULT, "PIP - manually setting wantsToPlay = NO after pause selected during PIP.", buf, 2u);
        }

        self->_wantsToPlay = 0;
      }
      else
      {
        -[HFCameraPlaybackEngine startPlaybackForCurrentClip](self, "startPlaybackForCurrentClip");
      }
    }
  }
  else if (-[HFCameraPlaybackEngine isPictureInPictureModeActive](self, "isPictureInPictureModeActive"))
  {
    v15 = +[HFUtilities isDeviceUnlocked](HFUtilities, "isDeviceUnlocked");
    HFLogForCategory(0x17uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v15;
      _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "Checking for locked screen; isDeviceUnlocked: %{BOOL}d",
        buf,
        8u);
    }

    if (v15)
    {
      self->_wantsToPlay = 1;
      goto LABEL_18;
    }
    if (self->_wantsToPlay)
    {
LABEL_18:
      HFLogForCategory(0x17uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "manually setting wantsToPlay = YES after play selected during PIP.", buf, 2u);
      }
      goto LABEL_20;
    }
  }
  else
  {
    -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "timeControlStatus");

    if (v18)
    {
      -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject pause](v19, "pause");
LABEL_20:

    }
  }
  if (-[HFCameraPlaybackEngine isScrubbing](self, "isScrubbing")
    && -[HFCameraPlaybackEngine playbackContentType](self, "playbackContentType") == 1)
  {
    -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setScrubbing:", 1);

  }
  if (-[HFCameraPlaybackEngine wantsToPlay](self, "wantsToPlay")
    && !-[HFCameraPlaybackEngine playbackContentType](self, "playbackContentType"))
  {
    -[HFCameraPlaybackEngine liveStreamController](self, "liveStreamController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isStreamingEnabled");

    if ((v34 & 1) != 0)
      goto LABEL_29;
    -[HFCameraPlaybackEngine liveStreamController](self, "liveStreamController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "startStreaming");
    goto LABEL_28;
  }
  -[HFCameraPlaybackEngine liveStreamController](self, "liveStreamController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isStreamingEnabled");

  if (v22)
  {
    -[HFCameraPlaybackEngine liveStreamController](self, "liveStreamController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stopStreaming");
LABEL_28:

  }
LABEL_29:
  v24 = -[HFCameraPlaybackEngine timeControlStatus](self, "timeControlStatus");
  -[HFCameraPlaybackEngine setTimeControlStatus:](self, "setTimeControlStatus:", -[HFCameraPlaybackEngine _derivedTimeControlStatus](self, "_derivedTimeControlStatus"));
  -[HFCameraPlaybackEngine playbackError](self, "playbackError");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraPlaybackEngine _derivedPlaybackError](self, "_derivedPlaybackError");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraPlaybackEngine setPlaybackError:](self, "setPlaybackError:", v26);

  v27 = -[HFCameraPlaybackEngine isStreamAudioEnabled](self, "isStreamAudioEnabled")
     && -[HFCameraPlaybackEngine wantsToPlay](self, "wantsToPlay")
     && -[HFCameraPlaybackEngine playbackContentType](self, "playbackContentType") == 0;
  -[HFCameraPlaybackEngine liveStreamController](self, "liveStreamController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setStreamAudioEnabled:", v27);

  if (!-[HFCameraPlaybackEngine wantsToPlay](self, "wantsToPlay")
    || -[HFCameraPlaybackEngine playbackContentType](self, "playbackContentType"))
  {
    -[HFCameraPlaybackEngine _setMicrophoneEnabled:notifyObservers:](self, "_setMicrophoneEnabled:notifyObservers:", 0, v5);
  }
  if (v5)
  {
    if (-[HFCameraPlaybackEngine timeControlStatus](self, "timeControlStatus") != v24)
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __91__HFCameraPlaybackEngine__updatePlaybackStateNotifyingObservers_rebuildClipPlayerIfNeeded___block_invoke_111;
      v41[3] = &unk_1EA727DD8;
      v41[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v41);
    }
    -[HFCameraPlaybackEngine playbackError](self, "playbackError");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v30 = v25;
    v31 = v30;
    if (v29 == v30)
    {

    }
    else
    {
      if (v29)
      {
        v32 = objc_msgSend(v29, "isEqual:", v30);

        if ((v32 & 1) != 0)
          goto LABEL_55;
      }
      else
      {

      }
      HFLogForCategory(0x17uLL);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        -[HFCameraPlaybackEngine playbackError](self, "playbackError");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v44 = v39;
        _os_log_error_impl(&dword_1DD34E000, v38, OS_LOG_TYPE_ERROR, "Notifying clients of playback error:%@.", buf, 0xCu);

      }
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __91__HFCameraPlaybackEngine__updatePlaybackStateNotifyingObservers_rebuildClipPlayerIfNeeded___block_invoke_112;
      v40[3] = &unk_1EA727DD8;
      v40[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v40);
    }
  }
LABEL_55:

}

void __91__HFCameraPlaybackEngine__updatePlaybackStateNotifyingObservers_rebuildClipPlayerIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "observerDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackEngine:didUpdateClipPlayer:", v3, v4);

}

void __91__HFCameraPlaybackEngine__updatePlaybackStateNotifyingObservers_rebuildClipPlayerIfNeeded___block_invoke_111(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "observerDispatcher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackEngine:didUpdateTimeControlStatus:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "timeControlStatus"));

}

void __91__HFCameraPlaybackEngine__updatePlaybackStateNotifyingObservers_rebuildClipPlayerIfNeeded___block_invoke_112(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "observerDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "playbackError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackEngine:didUpdatePlaybackError:", v3, v4);

}

- (void)_updateStateForRequestedPlaybackPosition:(id)a3 notifyObservers:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  SEL v13;
  HFCameraPlaybackEngine *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  NSObject *v56;
  void *v57;
  const char *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD block[5];
  id v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v4 = a4;
  v75 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("No playback position provided!");
    v13 = a2;
    v14 = self;
    v15 = 1040;
LABEL_33:
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("HFCameraPlaybackEngine.m"), v15, v12);

    goto LABEL_51;
  }
  if (objc_msgSend(v7, "contentType") != 1)
    goto LABEL_8;
  -[HFCameraPlaybackEngine clipManager](self, "clipManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    -[HFCameraPlaybackEngine eventCache](self, "eventCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "events");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("Attempting to use a clip playback position when there is no clip collection!");
      v13 = a2;
      v14 = self;
      v15 = 1044;
      goto LABEL_33;
    }
  }
  objc_msgSend(v8, "clipPlaybackDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Attempting to set a nil playback date for clip playback!");
    v13 = a2;
    v14 = self;
    v15 = 1047;
    goto LABEL_33;
  }
LABEL_8:
  v19 = -[HFCameraPlaybackEngine playbackContentType](self, "playbackContentType");
  v20 = objc_msgSend(v8, "contentType");
  -[HFCameraPlaybackEngine setPlaybackContentType:](self, "setPlaybackContentType:", objc_msgSend(v8, "contentType"));
  if (objc_msgSend(v8, "contentType") != 1)
  {
LABEL_46:
    if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
    {
      -[HFCameraPlaybackEngine observerDispatcher](self, "observerDispatcher");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "proxy");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "playbackEngine:didUpdatePlaybackPosition:", self, v8);

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83__HFCameraPlaybackEngine__updateStateForRequestedPlaybackPosition_notifyObservers___block_invoke;
      block[3] = &unk_1EA727188;
      block[4] = self;
      v70 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    if (v19 != v20)
      -[HFCameraPlaybackEngine _updatePlaybackStateNotifyingObservers:](self, "_updatePlaybackStateNotifyingObservers:", v4);
    goto LABEL_51;
  }
  objc_msgSend(v8, "clipPlaybackDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraPlaybackEngine setLastRequestedClipPlaybackDate:](self, "setLastRequestedClipPlaybackDate:", v21);

  -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hasFatalError");

  if (v23)
  {
    HFLogForCategory(0x17uLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_DEFAULT, "Clip player had fatal error. Updating and notifying observers.", buf, 2u);
    }

    -[HFCameraPlaybackEngine _updatePlaybackStateNotifyingObservers:](self, "_updatePlaybackStateNotifyingObservers:", v4);
  }
  if (objc_msgSend(v8, "clipIncludesPlaybackDate"))
  {
    objc_msgSend(v8, "clip");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clipPlaybackDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clip");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dateOfOccurrence");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSinceDate:", v28);
    +[HFCameraClipPosition positionWithClip:offset:](HFCameraClipPosition, "positionWithClip:offset:", v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x17uLL);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v29;
      _os_log_impl(&dword_1DD34E000, v30, OS_LOG_TYPE_DEFAULT, "PlaybackPosition included clip. Updating to clipPosition:%@", buf, 0xCu);
    }
  }
  else
  {
    v31 = -[HFCameraPlaybackEngine isScrubbing](self, "isScrubbing") ^ 1;
    v32 = (void *)objc_opt_class();
    objc_msgSend(v8, "clipPlaybackDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine eventCache](self, "eventCache");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "events");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "findClipPositionForDate:inEvents:options:", v33, v35, v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x17uLL);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      -[HFCameraPlaybackEngine eventCache](self, "eventCache");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "events");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");
      *(_DWORD *)buf = 138412546;
      v72 = v29;
      v73 = 2048;
      v74 = v38;
      _os_log_impl(&dword_1DD34E000, v30, OS_LOG_TYPE_DEFAULT, "PlaybackPosition did not include clip. Updating to clipPosition:%@ in events:%lu", buf, 0x16u);

    }
  }

  if (v29)
  {
    if (-[HFCameraPlaybackEngine shouldBypassVideoFetchRequest](self, "shouldBypassVideoFetchRequest"))
      goto LABEL_45;
    HFLogForCategory(0x17uLL);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v29;
      _os_log_impl(&dword_1DD34E000, v39, OS_LOG_TYPE_DEFAULT, "Updating clip player to clipPosition:%@", buf, 0xCu);
    }

    -[HFCameraPlaybackEngine eventCache](self, "eventCache");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "clips");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setClips:", v41);

    -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setCurrentPosition:", v29);

    objc_msgSend(v8, "clip");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
      goto LABEL_45;
    objc_msgSend(v29, "clip");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClip:", v45);

    HFLogForCategory(0x17uLL);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v29;
      _os_log_impl(&dword_1DD34E000, v46, OS_LOG_TYPE_DEFAULT, "Added missing clip to playbackPosition:%@", buf, 0xCu);
    }
    goto LABEL_44;
  }
  if (-[HFCameraPlaybackEngine isScrubbing](self, "isScrubbing"))
  {
    v29 = 0;
LABEL_45:

    goto LABEL_46;
  }
  -[HFCameraPlaybackEngine notificationCenterClipUUID](self, "notificationCenterClipUUID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47)
  {
    HFLogForCategory(0x17uLL);
    v56 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    objc_msgSend(v8, "clipPlaybackDate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v72 = v57;
    v58 = "Could not find a match for selected playback date %@!";
LABEL_53:
    _os_log_error_impl(&dword_1DD34E000, v56, OS_LOG_TYPE_ERROR, v58, buf, 0xCu);

    goto LABEL_37;
  }
  -[HFCameraPlaybackEngine eventCache](self, "eventCache");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "clips");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "firstObject");
  v46 = objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[NSObject significantEvents](v46, "significantEvents");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v50, "count"))
    {
      -[NSObject hf_sortedSignificantEvents](v46, "hf_sortedSignificantEvents");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "firstObject");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "dateOfOccurrence");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject dateOfOccurrence](v46, "dateOfOccurrence");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "timeIntervalSinceDate:", v53);
      v55 = v54;

    }
    else
    {
      v55 = 0.0;
    }

    -[HFCameraPlaybackEngine eventCache](self, "eventCache");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "clips");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setClips:", v61);

    +[HFCameraClipPosition positionWithEvent:offset:](HFCameraClipPosition, "positionWithEvent:offset:", v46, v55);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x17uLL);
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "clipPlaybackDate");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v72 = v64;
      v73 = 2112;
      v74 = (uint64_t)v46;
      _os_log_impl(&dword_1DD34E000, v63, OS_LOG_TYPE_DEFAULT, "(NC) Starting playback at position:%@ for event:%@", buf, 0x16u);

    }
    -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setCurrentPosition:", v29);

LABEL_44:
    goto LABEL_45;
  }
  HFLogForCategory(0x17uLL);
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "clipPlaybackDate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v72 = v57;
    v58 = "(NC) Could not find a match for selected playback date %@!";
    goto LABEL_53;
  }
LABEL_37:

  HFLogForCategory(0x17uLL);
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DD34E000, v59, OS_LOG_TYPE_ERROR, "Failed to find valid clip position. Ignoring playback position update.", buf, 2u);
  }

LABEL_51:
}

void __83__HFCameraPlaybackEngine__updateStateForRequestedPlaybackPosition_notifyObservers___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "observerDispatcher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackEngine:didUpdatePlaybackPosition:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setLiveCameraSource:(id)a3
{
  HMCameraSource *v5;
  _QWORD v6[5];
  HMCameraSource *v7;

  v5 = (HMCameraSource *)a3;
  if (self->_liveCameraSource != v5)
  {
    objc_storeStrong((id *)&self->_liveCameraSource, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__HFCameraPlaybackEngine_setLiveCameraSource___block_invoke;
    v6[3] = &unk_1EA727188;
    v6[4] = self;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __46__HFCameraPlaybackEngine_setLiveCameraSource___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "observerDispatcher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackEngine:didUpdateLiveCameraSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_setMicrophoneEnabled:(BOOL)a3 notifyObservers:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[16];

  v4 = a4;
  v5 = a3;
  if (a3 && -[HFCameraPlaybackEngine playbackContentType](self, "playbackContentType"))
  {
    HFLogForCategory(0x17uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Attempting to enable the microphone when live playback is not active. This doesn't make any sense and will be ignored.", buf, 2u);
    }

  }
  else if (self->_microphoneEnabled != v5)
  {
    self->_microphoneEnabled = v5;
    -[HFCameraPlaybackEngine liveStreamController](self, "liveStreamController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMicrophoneEnabled:", v5);

    if (v4)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __64__HFCameraPlaybackEngine__setMicrophoneEnabled_notifyObservers___block_invoke;
      v9[3] = &unk_1EA73D570;
      v9[4] = self;
      v10 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v9);
    }
  }
}

void __64__HFCameraPlaybackEngine__setMicrophoneEnabled_notifyObservers___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "observerDispatcher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackEngine:didUpdateMicrophoneEnabled:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)_setPlayerVolume:(float)a3 notifyObservers:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  void *v9;
  double v10;
  _QWORD v11[5];
  float v12;

  v4 = a4;
  if (self->_streamAudioVolume != a3 || +[HFUtilities isAMac](HFUtilities, "isAMac"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v8 = a3;
    objc_msgSend(v7, "setFloat:forKey:", CFSTR("HFCameraPlaybackStreamAudioVolume"), v8);

    self->_streamAudioVolume = a3;
    -[HFCameraPlaybackEngine liveStreamController](self, "liveStreamController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v10 = a3;
    objc_msgSend(v9, "setStreamAudioVolume:", v10);

    if (v4)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __59__HFCameraPlaybackEngine__setPlayerVolume_notifyObservers___block_invoke;
      v11[3] = &unk_1EA728AC0;
      v11[4] = self;
      v12 = a3;
      dispatch_async(MEMORY[0x1E0C80D38], v11);
    }
  }
}

void __59__HFCameraPlaybackEngine__setPlayerVolume_notifyObservers___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "observerDispatcher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackEngine:didUpdateStreamAudioVolume:", *(_QWORD *)(a1 + 32), *(float *)(a1 + 40) != 0.0);

}

- (void)_setStreamAudioEnabled:(BOOL)a3 notifyObservers:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v7[5];
  BOOL v8;

  if (self->_streamAudioEnabled != a3)
  {
    v4 = a4;
    self->_streamAudioEnabled = a3;
    -[HFCameraPlaybackEngine _updatePlaybackStateNotifyingObservers:rebuildClipPlayerIfNeeded:](self, "_updatePlaybackStateNotifyingObservers:rebuildClipPlayerIfNeeded:", 1, 0);
    if (v4)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __65__HFCameraPlaybackEngine__setStreamAudioEnabled_notifyObservers___block_invoke;
      v7[3] = &unk_1EA73D570;
      v7[4] = self;
      v8 = a3;
      dispatch_async(MEMORY[0x1E0C80D38], v7);
    }
  }
}

void __65__HFCameraPlaybackEngine__setStreamAudioEnabled_notifyObservers___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "observerDispatcher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackEngine:didUpdateStreamAudioEnabled:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (unint64_t)engineMode
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HFCameraPlaybackEngine playbackPosition](self, "playbackPosition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clipPlaybackDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isLiveStreaming
{
  if (+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled")
    && !-[HFCameraPlaybackEngine engineMode](self, "engineMode"))
  {
    return 1;
  }
  if (-[HFCameraPlaybackEngine engineMode](self, "engineMode"))
    return 0;
  return -[HFCameraPlaybackEngine timeControlStatus](self, "timeControlStatus") != 0;
}

- (BOOL)isLiveStreamPlaying
{
  if (+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled")
    && !-[HFCameraPlaybackEngine engineMode](self, "engineMode"))
  {
    return 1;
  }
  if (-[HFCameraPlaybackEngine engineMode](self, "engineMode"))
    return 0;
  return -[HFCameraPlaybackEngine timeControlStatus](self, "timeControlStatus") == 2;
}

- (void)recordingEventManager:(id)a3 didUpdateRecordingEvents:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngine workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

  }
  if (-[HFCameraPlaybackEngine shouldBatchRecordingEvents](self, "shouldBatchRecordingEvents"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (+[HFCameraPlaybackEngineEventCache isValidEvent:](HFCameraPlaybackEngineEventCache, "isValidEvent:", v15, (_QWORD)v18))
          {
            objc_msgSend(v9, "addObject:", v15);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    -[HFCameraPlaybackEngine batchedRecordingEvents](self, "batchedRecordingEvents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setByAddingObjectsFromSet:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine setBatchedRecordingEvents:](self, "setBatchedRecordingEvents:", v17);

  }
  else
  {
    -[HFCameraPlaybackEngine _recordingEventManager:didUpdateRecordingEvents:](self, "_recordingEventManager:didUpdateRecordingEvents:", v6, v7);
  }

}

- (void)_recordingEventManager:(id)a3 didUpdateRecordingEvents:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  uint8_t buf[4];
  HFCameraPlaybackEngine *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v6 = a4;
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngine workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

  }
  HFLogForCategory(0x17uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = (HFCameraPlaybackEngine *)"-[HFCameraPlaybackEngine _recordingEventManager:didUpdateRecordingEvents:]";
    v32 = 2048;
    v33 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%s, received (%lu) events", buf, 0x16u);
  }

  -[HFCameraPlaybackEngine notificationCenterClipUUID](self, "notificationCenterClipUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __74__HFCameraPlaybackEngine__recordingEventManager_didUpdateRecordingEvents___block_invoke;
    v28[3] = &unk_1EA73D5C0;
    v12 = v9;
    v29 = v12;
    objc_msgSend(v6, "na_firstObjectPassingTest:", v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v15 = v13;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v6 = v16;

      if (objc_msgSend(v6, "isComplete"))
      {
        HFLogForCategory(0x16uLL);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "(NC) No need to listen for a completed clip. Removing observation.", buf, 2u);
        }

        -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "recordingEventManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeObserver:", self);

      }
      HFLogForCategory(0x17uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v31 = self;
        v32 = 2112;
        v33 = (uint64_t)v25;
        v34 = 2112;
        v35 = v14;
        v36 = 2112;
        v37 = v12;
        _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "(NC) Playback engine:%@ eventManager:%@ updatedClips:%@ for UUID:%@", buf, 0x2Au);
      }

    }
    else
    {
      HFLogForCategory(0x17uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v31 = self;
        v32 = 2112;
        v33 = (uint64_t)v25;
        v34 = 2112;
        v35 = v6;
        v36 = 2112;
        v37 = v12;
        _os_log_error_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_ERROR, "(NC) Playback engine:%@ eventManager:%@ ignoring clip updates:%@ because its showing UUID:%@", buf, 0x2Au);
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v21 = v29;
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    HFLogForCategory(0x17uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v31 = self;
      v32 = 2112;
      v33 = (uint64_t)v25;
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "Playback engine:%@ eventManager:%@ updatedClips:%@", buf, 0x20u);
    }
    v14 = v6;
  }

  objc_initWeak((id *)buf, self);
  -[HFCameraPlaybackEngine eventCache](self, "eventCache");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __74__HFCameraPlaybackEngine__recordingEventManager_didUpdateRecordingEvents___block_invoke_123;
  v26[3] = &unk_1EA73D5E8;
  objc_copyWeak(&v27, (id *)buf);
  objc_msgSend(v23, "updateWithEvents:completion:", v24, v26);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);

}

uint64_t __74__HFCameraPlaybackEngine__recordingEventManager_didUpdateRecordingEvents___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __74__HFCameraPlaybackEngine__recordingEventManager_didUpdateRecordingEvents___block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HFCameraPlaybackEngine__recordingEventManager_didUpdateRecordingEvents___block_invoke_2;
  block[3] = &unk_1EA7270A0;
  block[4] = WeakRetained;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __74__HFCameraPlaybackEngine__recordingEventManager_didUpdateRecordingEvents___block_invoke_2(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1[4], "observerDispatcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  objc_msgSend(a1[5], "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackEngine:didUpdateEventsIncludingUpdatedIdentifiers:replacedIdentifiers:removedIdentifiers:", v3, v4, v5, MEMORY[0x1E0C9AA60]);

}

- (void)recordingEventManager:(id)a3 didRemoveRecordingEventsWithUUIDs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  HFCameraPlaybackEngine *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngine workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

  }
  HFLogForCategory(0x17uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Playback engine:%@ received eventManager:%@ updatedClips:%@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  -[HFCameraPlaybackEngine eventCache](self, "eventCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__HFCameraPlaybackEngine_recordingEventManager_didRemoveRecordingEventsWithUUIDs___block_invoke;
  v11[3] = &unk_1EA73D610;
  objc_copyWeak(&v12, (id *)buf);
  objc_msgSend(v10, "removeEventUUIDs:completion:", v7, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

void __82__HFCameraPlaybackEngine_recordingEventManager_didRemoveRecordingEventsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__HFCameraPlaybackEngine_recordingEventManager_didRemoveRecordingEventsWithUUIDs___block_invoke_2;
  v6[3] = &unk_1EA727188;
  v6[4] = WeakRetained;
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __82__HFCameraPlaybackEngine_recordingEventManager_didRemoveRecordingEventsWithUUIDs___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "observerDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackEngine:didUpdateEventsIncludingUpdatedIdentifiers:replacedIdentifiers:removedIdentifiers:", v3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v4);

}

- (void)clipPlayer:(id)a3 didUpdateTimeControlStatus:(int64_t)a4
{
  int64_t v6;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  HFCameraPlaybackEngine *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  HFCameraPlaybackEngine *v20;
  int v21;
  HFCameraPlaybackEngine *v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[HFCameraPlaybackEngine playbackContentType](self, "playbackContentType", a3))
  {
    v6 = -[HFCameraPlaybackEngine lastPlayerTimeControlStatus](self, "lastPlayerTimeControlStatus");
    if (!a4 && v6 == 1 && self->_wantsToPlay)
    {
      if (-[HFCameraPlaybackEngine playbackRetryAttempts](self, "playbackRetryAttempts") > 2)
      {
        -[HFCameraPlaybackEngine playbackSessionEvent](self, "playbackSessionEvent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (id)objc_msgSend(v16, "sendEventForState:", 1);

        -[HFCameraPlaybackEngine setPlaybackSessionEvent:](self, "setPlaybackSessionEvent:", 0);
        HFLogForCategory(0x17uLL);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "error");
          v20 = (HFCameraPlaybackEngine *)objc_claimAutoreleasedReturnValue();
          v21 = 138412290;
          v22 = v20;
          _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "Failure occurred while waiting to play. Bailing on the playback attempt. Player error:%@", (uint8_t *)&v21, 0xCu);

        }
        -[HFCameraPlaybackEngine setLastPlayerTimeControlStatus:](self, "setLastPlayerTimeControlStatus:", 0);
        v11 = self;
        v12 = 0;
      }
      else
      {
        HFLogForCategory(0x17uLL);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = 3 - -[HFCameraPlaybackEngine playbackRetryAttempts](self, "playbackRetryAttempts");
          -[HFCameraPlaybackEngine clipPlayer](self, "clipPlayer");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "error");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 134218242;
          v22 = (HFCameraPlaybackEngine *)v8;
          v23 = 2112;
          v24 = (int64_t)v10;
          _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Failure occurred while waiting to play. Retrying playback up to %lu more times. Player error:%@", (uint8_t *)&v21, 0x16u);

        }
        -[HFCameraPlaybackEngine setPlaybackRetryAttempts:](self, "setPlaybackRetryAttempts:", -[HFCameraPlaybackEngine playbackRetryAttempts](self, "playbackRetryAttempts") + 1);
        v11 = self;
        v12 = 1;
      }
      -[HFCameraPlaybackEngine setWantsToPlay:](v11, "setWantsToPlay:", v12);
    }
    else
    {
      -[HFCameraPlaybackEngine setLastPlayerTimeControlStatus:](self, "setLastPlayerTimeControlStatus:", a4);
      if (-[HFCameraPlaybackEngine lastPlayerTimeControlStatus](self, "lastPlayerTimeControlStatus") == 2)
      {
        -[HFCameraPlaybackEngine playbackSessionEvent](self, "playbackSessionEvent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (id)objc_msgSend(v13, "sendEventForState:", 0);

        -[HFCameraPlaybackEngine setPlaybackSessionEvent:](self, "setPlaybackSessionEvent:", 0);
        -[HFCameraPlaybackEngine setPlaybackRetryAttempts:](self, "setPlaybackRetryAttempts:", 0);
      }
      HFLogForCategory(0x17uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412546;
        v22 = self;
        v23 = 2048;
        v24 = a4;
        _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Playback engine: %@ received clipPlayer timeControlStatus update: %ld", (uint8_t *)&v21, 0x16u);
      }

      -[HFCameraPlaybackEngine _updatePlaybackStateNotifyingObservers:rebuildClipPlayerIfNeeded:](self, "_updatePlaybackStateNotifyingObservers:rebuildClipPlayerIfNeeded:", 1, 0);
    }
  }
}

- (void)clipPlayer:(id)a3 didUpdateError:(id)a4 isFatal:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  int v9;
  HFCameraPlaybackEngine *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v5 = a5;
  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory(0x17uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412802;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    v13 = 1024;
    v14 = v5;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Playback engine: %@ received clipPlayer error update: %@ (fatal: %d)", (uint8_t *)&v9, 0x1Cu);
  }

  -[HFCameraPlaybackEngine _updatePlaybackStateNotifyingObservers:rebuildClipPlayerIfNeeded:](self, "_updatePlaybackStateNotifyingObservers:rebuildClipPlayerIfNeeded:", 1, 0);
}

- (void)clipPlayer:(id)a3 didUpdateMuted:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  int v8;
  HFCameraPlaybackEngine *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x17uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Playback engine: %@ received clipPlayer isMuted update: %@", (uint8_t *)&v8, 0x16u);

  }
  -[HFCameraPlaybackEngine setPrefersAudioEnabled:](self, "setPrefersAudioEnabled:", v4 ^ 1);
}

- (void)clipPlayerDidPlayToEndTime:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  HFCameraPlaybackEngine *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x17uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = self;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Playback engine: %@ received clipPlayerDidPlayToEndTime", (uint8_t *)&v16, 0xCu);
  }

  -[HFCameraPlaybackEngine notificationCenterClipUUID](self, "notificationCenterClipUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HFCameraPlaybackEngine cameraClips](self, "cameraClips");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "dateOfOccurrence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x17uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412802;
        v17 = self;
        v18 = 2112;
        v19 = v8;
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "(NC) Playback engine: %@ restarting clip playback at start date:%@ clipUUID:%@.", (uint8_t *)&v16, 0x20u);

      }
      +[HFCameraPlaybackPosition clipPositionWithDate:inClip:](HFCameraPlaybackPosition, "clipPositionWithDate:inClip:", v8, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraPlaybackEngine setPlaybackPosition:](self, "setPlaybackPosition:", v12);

      -[HFCameraPlaybackEngine setWantsToPlay:](self, "setWantsToPlay:", 1);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[HFCameraPlaybackEngine notificationCenterClipUUID](self, "notificationCenterClipUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = self;
        v18 = 2112;
        v19 = v15;
        _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "(NC) Playback engine: %@ failed to find start date for notificationCenterClipUUID:%@. This should never happen.", (uint8_t *)&v16, 0x16u);

      }
      +[HFCameraPlaybackPosition livePosition](HFCameraPlaybackPosition, "livePosition");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraPlaybackEngine setPlaybackPosition:](self, "setPlaybackPosition:", v14);

      -[HFCameraPlaybackEngine _updatePlaybackStateNotifyingObservers:rebuildClipPlayerIfNeeded:](self, "_updatePlaybackStateNotifyingObservers:rebuildClipPlayerIfNeeded:", 1, 0);
    }

  }
  else
  {
    +[HFCameraPlaybackPosition livePosition](HFCameraPlaybackPosition, "livePosition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackEngine setPlaybackPosition:](self, "setPlaybackPosition:", v13);

    -[HFCameraPlaybackEngine _updatePlaybackStateNotifyingObservers:rebuildClipPlayerIfNeeded:](self, "_updatePlaybackStateNotifyingObservers:rebuildClipPlayerIfNeeded:", 1, 0);
  }
}

- (void)streamControllerStateDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  HFCameraPlaybackEngine *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x1CuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Playback engine: %@ received liveStreamController state update: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(v4, "liveCameraSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraPlaybackEngine setLiveCameraSource:](self, "setLiveCameraSource:", v7);

  -[HFCameraPlaybackEngine _updatePlaybackStateNotifyingObservers:](self, "_updatePlaybackStateNotifyingObservers:", 1);
}

- (id)timelineStateDescription
{
  unint64_t v2;

  v2 = self->_timelineState - 1;
  if (v2 > 5)
    return CFSTR("TimelineStateUnknown");
  else
    return off_1EA73D680[v2];
}

- (id)timeControlStatusDescription
{
  unint64_t timeControlStatus;
  const __CFString *v3;

  timeControlStatus = self->_timeControlStatus;
  v3 = CFSTR("TimeControlStatusPaused");
  if (timeControlStatus == 1)
    v3 = CFSTR("TimeControlStatusWaitingToPlay");
  if (timeControlStatus == 2)
    return CFSTR("TimeControlStatusPlaying");
  else
    return (id)v3;
}

- (id)engineModeDescription
{
  if (self->_engineMode)
    return CFSTR("EngineModeClipPlayer");
  else
    return CFSTR("EngineModeLiveStream");
}

- (id)shortDebugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HFCameraPlaybackEngine engineModeDescription](self, "engineModeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraPlaybackEngine timeControlStatusDescription](self, "timeControlStatusDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraPlaybackEngine timelineStateDescription](self, "timelineStateDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ - %@ - %@"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isFirstEventOfTheDay:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HFCameraPlaybackEngine eventCache](self, "eventCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFirstEventOfTheDay:", v4);

  return v6;
}

- (id)firstOfTheDayClipForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFCameraPlaybackEngine eventCache](self, "eventCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstOfTheDayClipForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)findClipPositionForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[HFCameraPlaybackEngine eventCache](self, "eventCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clips");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findClipPositionForDate:inEvents:options:", v4, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)findClipPositionForDate:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)objc_opt_class();
  -[HFCameraPlaybackEngine eventCache](self, "eventCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "events");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findClipPositionForDate:inEvents:options:", v6, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)findClipPositionForDate:(id)a3 inEvents:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  void *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(a1, "hf_indexOfClipForDate:inEvents:enumerationOptions:searchOptions:", v8, v9, 0, a5);
  v11 = 0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __67__HFCameraPlaybackEngine_findClipPositionForDate_inEvents_options___block_invoke;
    v18 = &unk_1EA73D638;
    v19 = v12;
    v20 = v8;
    v13 = v8;
    __67__HFCameraPlaybackEngine_findClipPositionForDate_inEvents_options___block_invoke((uint64_t)&v15);
    +[HFCameraClipPosition positionWithEvent:offset:](HFCameraClipPosition, "positionWithEvent:offset:", v12, v15, v16, v17, v18, v19, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __67__HFCameraPlaybackEngine_findClipPositionForDate_inEvents_options___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "hf_dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_searchResultForDate:", *(_QWORD *)(a1 + 40));

  if (v3 == 1)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "dateOfOccurrence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);

  }
  else if (v3 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "duration");
  }
}

+ (unint64_t)hf_indexOfClipForDate:(id)a3 inEvents:(id)a4 enumerationOptions:(unint64_t)a5 searchOptions:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;

  v9 = a3;
  v10 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__HFCameraPlaybackEngine_hf_indexOfClipForDate_inEvents_enumerationOptions_searchOptions___block_invoke;
  v15[3] = &unk_1EA73D660;
  v17 = v10;
  v18 = a6;
  v16 = v9;
  v11 = v10;
  v12 = v9;
  v13 = objc_msgSend(v11, "indexOfObjectWithOptions:passingTest:", a5, v15);

  return v13;
}

BOOL __90__HFCameraPlaybackEngine_hf_indexOfClipForDate_inEvents_enumerationOptions_searchOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  objc_msgSend(a2, "hf_dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_searchResultForDate:", *(_QWORD *)(a1 + 32));

  if (v8 == 1)
    return 1;
  v10 = *(_QWORD *)(a1 + 48);
  if ((v10 & 1) != 0)
    return v8 == 0;
  if ((v10 & 2) == 0)
    return 0;
  if (v8)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 == a3)
      return 1;
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_dateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hf_searchResultForDate:", *(_QWORD *)(a1 + 32));

    return !v13;
  }
  result = 0;
  *a4 = 1;
  return result;
}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  HFCameraClipPlaying *clipPlayer;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  HFCameraPlaybackEngine *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x17uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@ : %@", buf, 0x16u);

  }
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    clipPlayer = self->_clipPlayer;
    self->_clipPlayer = 0;

    +[HFCameraTimelapseVideoProvider sharedProvider](HFCameraTimelapseVideoProvider, "sharedProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "waitUntilAllDownloadsAreFinished");
  }
  else
  {
    -[HFCameraPlaybackEngine cameraProfile](self, "cameraProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordingEventManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", self);

  }
  +[HFCameraTimelapseVideoProvider sharedProvider](HFCameraTimelapseVideoProvider, "sharedProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimelapseVideoDownloader:", 0);

  v10.receiver = self;
  v10.super_class = (Class)HFCameraPlaybackEngine;
  -[HFCameraPlaybackEngine dealloc](&v10, sel_dealloc);
}

- (BOOL)prefersAudioEnabled
{
  return self->_prefersAudioEnabled;
}

- (HFCameraLiveStreamControlling)overrideLiveStreamController
{
  return self->_overrideLiveStreamController;
}

- (void)setOverrideLiveStreamController:(id)a3
{
  objc_storeStrong((id *)&self->_overrideLiveStreamController, a3);
}

- (HMCameraSource)liveCameraSource
{
  return self->_liveCameraSource;
}

- (BOOL)isMicrophoneEnabled
{
  return self->_microphoneEnabled;
}

- (BOOL)isStreamAudioEnabled
{
  return self->_streamAudioEnabled;
}

- (float)streamAudioVolume
{
  return self->_streamAudioVolume;
}

- (void)setEngineMode:(unint64_t)a3
{
  self->_engineMode = a3;
}

- (BOOL)isUserScrubbing
{
  return self->_userScrubbing;
}

- (void)setUserScrubbing:(BOOL)a3
{
  self->_userScrubbing = a3;
}

- (BOOL)isPictureInPictureModeActive
{
  return self->_pictureInPictureModeActive;
}

- (void)setPictureInPictureModeActive:(BOOL)a3
{
  self->_pictureInPictureModeActive = a3;
}

- (BOOL)shouldBypassVideoFetchRequest
{
  return self->_shouldBypassVideoFetchRequest;
}

- (BOOL)shouldBypassHighQualityScrubbing
{
  return self->_shouldBypassHighQualityScrubbing;
}

- (unint64_t)scrubbingSpeed
{
  return self->_scrubbingSpeed;
}

- (void)setScrubbingSpeed:(unint64_t)a3
{
  self->_scrubbingSpeed = a3;
}

- (unint64_t)timeControlStatus
{
  return self->_timeControlStatus;
}

- (void)setTimeControlStatus:(unint64_t)a3
{
  self->_timeControlStatus = a3;
}

- (NSError)playbackError
{
  return self->_playbackError;
}

- (void)setPlaybackError:(id)a3
{
  objc_storeStrong((id *)&self->_playbackError, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HFCameraLiveStreamControlling)liveStreamController
{
  return self->_liveStreamController;
}

- (HFCameraClipScrubbing)clipScrubber
{
  return self->_clipScrubber;
}

- (NSMapTable)observerStates
{
  return self->_observerStates;
}

- (NADelegateDispatcher)observerDispatcher
{
  return self->_observerDispatcher;
}

- (unint64_t)playbackContentType
{
  return self->_playbackContentType;
}

- (void)setPlaybackContentType:(unint64_t)a3
{
  self->_playbackContentType = a3;
}

- (NSDate)lastRequestedClipPlaybackDate
{
  return self->_lastRequestedClipPlaybackDate;
}

- (void)setLastRequestedClipPlaybackDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)wantsToPlay
{
  return self->_wantsToPlay;
}

- (unint64_t)scrubbingInProgressCount
{
  return self->_scrubbingInProgressCount;
}

- (void)setScrubbingInProgressCount:(unint64_t)a3
{
  self->_scrubbingInProgressCount = a3;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (int64_t)lastPlayerTimeControlStatus
{
  return self->_lastPlayerTimeControlStatus;
}

- (void)setLastPlayerTimeControlStatus:(int64_t)a3
{
  self->_lastPlayerTimeControlStatus = a3;
}

- (HFCameraAnalyticsCameraClipPlaybackSessionEvent)playbackSessionEvent
{
  return self->_playbackSessionEvent;
}

- (void)setPlaybackSessionEvent:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionEvent, a3);
}

- (unint64_t)playbackRetryAttempts
{
  return self->_playbackRetryAttempts;
}

- (void)setPlaybackRetryAttempts:(unint64_t)a3
{
  self->_playbackRetryAttempts = a3;
}

- (HFCameraPlaybackEngineEventCache)eventCache
{
  return self->_eventCache;
}

- (void)setEventCache:(id)a3
{
  objc_storeStrong((id *)&self->_eventCache, a3);
}

- (HMCameraClipManager)clipManager
{
  return (HMCameraClipManager *)objc_loadWeakRetained((id *)&self->_clipManager);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_source)batchedRecordingEventsTimer
{
  return self->_batchedRecordingEventsTimer;
}

- (void)setBatchedRecordingEventsTimer:(id)a3
{
  objc_storeStrong((id *)&self->_batchedRecordingEventsTimer, a3);
}

- (HFCameraClipPlaying)clipPlayer
{
  return self->_clipPlayer;
}

- (HFCameraClipPlaying)overrideClipPlayer
{
  return self->_overrideClipPlayer;
}

- (void)setOverrideClipPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_overrideClipPlayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideClipPlayer, 0);
  objc_storeStrong((id *)&self->_clipPlayer, 0);
  objc_storeStrong((id *)&self->_batchedRecordingEventsTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_clipManager);
  objc_storeStrong((id *)&self->_eventCache, 0);
  objc_storeStrong((id *)&self->_playbackSessionEvent, 0);
  objc_storeStrong((id *)&self->_lastRequestedClipPlaybackDate, 0);
  objc_storeStrong((id *)&self->_observerDispatcher, 0);
  objc_storeStrong((id *)&self->_observerStates, 0);
  objc_storeStrong((id *)&self->_clipScrubber, 0);
  objc_storeStrong((id *)&self->_liveStreamController, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_playbackError, 0);
  objc_storeStrong((id *)&self->_liveCameraSource, 0);
  objc_storeStrong((id *)&self->_overrideLiveStreamController, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_notificationCenterClipUUID, 0);
  objc_storeStrong((id *)&self->_batchedRecordingEvents, 0);
}

@end
