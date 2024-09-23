@implementation ICAudioController

+ (void)pauseIfPlaying
{
  void *v3;
  int v4;
  id v5;

  if (sDidCreateSharedController == 1)
  {
    objc_msgSend(a1, "sharedAudioController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPlaying");

    if (v4)
    {
      objc_msgSend(a1, "sharedAudioController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pause");

    }
  }
}

+ (ICAudioController)sharedAudioController
{
  if (sharedAudioController_once != -1)
    dispatch_once(&sharedAudioController_once, &__block_literal_global_56);
  return (ICAudioController *)(id)sharedAudioController_sharedAudioController;
}

void __42__ICAudioController_sharedAudioController__block_invoke()
{
  ICAudioController *v0;
  void *v1;

  v0 = objc_alloc_init(ICAudioController);
  v1 = (void *)sharedAudioController_sharedAudioController;
  sharedAudioController_sharedAudioController = (uint64_t)v0;

  sDidCreateSharedController = 1;
}

- (ICAudioController)init
{
  ICAudioController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICAudioController;
  v2 = -[ICAudioController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_playerItemDidPlayToEndTime_, *MEMORY[0x1E0C8AC48], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_deviceWillLock_, *MEMORY[0x1E0DC4818], 0);

  }
  return v2;
}

- (void)registerForRemoteControlEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAudioController registerForRemoteControlEvents]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (!-[ICAudioController registeredForRemoteControlEvents](self, "registeredForRemoteControlEvents"))
  {
    objc_msgSend(MEMORY[0x1E0CC24D0], "sharedCommandCenter");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pauseCommand");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addTarget:action:", self, sel_remotePause_);

    objc_msgSend(v15, "playCommand");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addTarget:action:", self, sel_remotePlay_);

    objc_msgSend(v15, "stopCommand");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTarget:action:", self, sel_remoteStop_);

    objc_msgSend(v15, "togglePlayPauseCommand");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:", self, sel_remoteTogglePlayPause_);

    objc_msgSend(v15, "skipBackwardCommand");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 1);
    objc_msgSend(v7, "setPreferredIntervals:", &unk_1E5C71AA8);
    objc_msgSend(v7, "addTarget:action:", self, sel_remoteSkipBackward_);
    objc_msgSend(v15, "skipForwardCommand");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setEnabled:", 1);
    objc_msgSend(v8, "setPreferredIntervals:", &unk_1E5C71AC0);
    objc_msgSend(v8, "addTarget:action:", self, sel_remoteSkipForward_);
    objc_msgSend(v15, "seekForwardCommand");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 0);

    objc_msgSend(v15, "seekBackwardCommand");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 0);

    objc_msgSend(v15, "nextTrackCommand");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 0);

    objc_msgSend(v15, "previousTrackCommand");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnabled:", 0);

    objc_msgSend(v15, "changePlaybackPositionCommand");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabled:", 1);
    objc_msgSend(v13, "addTarget:action:", self, sel_remoteChangePlaybackPosition_);
    objc_msgSend(v15, "changePlaybackRateCommand");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEnabled:", 1);
    objc_msgSend(v14, "setSupportedPlaybackRates:", &unk_1E5C71AD8);
    objc_msgSend(v14, "addTarget:action:", self, sel_remoteChangeRate_);
    -[ICAudioController setRegisteredForRemoteControlEvents:](self, "setRegisteredForRemoteControlEvents:", 1);

  }
}

- (void)unregisterForRemoteControlEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAudioController unregisterForRemoteControlEvents]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (-[ICAudioController registeredForRemoteControlEvents](self, "registeredForRemoteControlEvents"))
  {
    objc_msgSend(MEMORY[0x1E0CC24D0], "sharedCommandCenter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pauseCommand");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeTarget:", self);

    objc_msgSend(v11, "playCommand");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeTarget:", self);

    objc_msgSend(v11, "stopCommand");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeTarget:", self);

    objc_msgSend(v11, "togglePlayPauseCommand");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeTarget:", self);

    objc_msgSend(v11, "skipBackwardCommand");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeTarget:", self);

    objc_msgSend(v11, "skipForwardCommand");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeTarget:", self);

    objc_msgSend(v11, "changePlaybackPositionCommand");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeTarget:", self);

    objc_msgSend(v11, "changePlaybackRateCommand");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeTarget:", self);

    -[ICAudioController setRegisteredForRemoteControlEvents:](self, "setRegisteredForRemoteControlEvents:", 0);
  }
}

- (void)setCurrentAttachment:(id)a3
{
  ICAttachment *v5;
  ICAttachment *currentAttachment;
  _QWORD *v7;
  void *v8;
  void *v9;
  ICAttachment *v10;

  v5 = (ICAttachment *)a3;
  currentAttachment = self->_currentAttachment;
  v10 = v5;
  if (currentAttachment != v5)
  {
    v7 = (_QWORD *)MEMORY[0x1E0D636D8];
    if (currentAttachment)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", self, *v7, self->_currentAttachment);

    }
    objc_storeStrong((id *)&self->_currentAttachment, a3);
    if (self->_currentAttachment)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_attachmentWillBeDeletedNotification_, *v7, self->_currentAttachment);

    }
  }

}

- (BOOL)isPlaying
{
  void *v2;
  float v3;
  BOOL v4;

  -[ICAudioController currentPlayer](self, "currentPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v4 = v3 > 0.0;

  return v4;
}

- (void)play
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "Unable to set category for audio session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)pause
{
  void *v3;
  void *v4;

  -[ICAudioController currentPlayer](self, "currentPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isLocked"))
    {
      -[ICAudioController stop](self, "stop");
    }
    else
    {
      -[ICAudioController currentPlayer](self, "currentPlayer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pause");

      -[ICAudioController notifyPaused](self, "notifyPaused");
      -[ICAudioController updateNowPlayingInfo](self, "updateNowPlayingInfo");
    }
  }
}

- (void)togglePlayPause
{
  if (-[ICAudioController isPlaying](self, "isPlaying"))
    -[ICAudioController pause](self, "pause");
  else
    -[ICAudioController play](self, "play");
}

- (void)stop
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "Unable to deactivate background audio session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)prepareToPlayAttachment:(id)a3
{
  -[ICAudioController prepareToPlayAttachment:completion:](self, "prepareToPlayAttachment:completion:", a3, 0);
}

- (void)prepareToPlayAttachment:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ICAudioController *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "attachmentType") == 4)
  {
    -[ICAudioController currentAttachment](self, "currentAttachment");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v6)
    {
      -[ICAudioController currentPlayer](self, "currentPlayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pause");

      -[ICAudioController notifyStopped](self, "notifyStopped");
    }
    -[ICAudioController setCurrentAttachment:](self, "setCurrentAttachment:", 0);
    objc_msgSend(v6, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke;
    v13[3] = &unk_1E5C21CA0;
    v14 = v10;
    v15 = self;
    v16 = v6;
    v17 = v7;
    v12 = v10;
    objc_msgSend(v11, "assetWithCompletion:", v13);

  }
}

void __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_63;
    v7[3] = &unk_1E5C21C78;
    v5 = *(void **)(a1 + 32);
    v7[4] = *(_QWORD *)(a1 + 40);
    v8 = v3;
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v5, "performBlock:", v7);

  }
  else
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_cold_1();

  }
}

void __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_63(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
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
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _QWORD v40[6];
  id v41;
  _QWORD v42[4];
  id v43;
  CMTime v44;
  id location;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v1 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "setCurrentAsset:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)v1, "setCurrentAttachment:", *(_QWORD *)(v1 + 16));
  v2 = (void *)MEMORY[0x1E0C8B300];
  objc_msgSend(*(id *)v1, "currentAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerItemWithAsset:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)v1, "currentPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "currentPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "currentAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    if (v9 && v11)
    {
      objc_msgSend(v9, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "isEqual:", v14);

    }
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "currentPlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "asset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "currentAsset");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && v20)
    {
      ICKeyPathFromSelectors();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "valueForKeyPath:", v21, sel_segments, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "valueForKeyPath:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if ((v24 & 1) != 0)
        goto LABEL_13;
    }
    else if ((v12 & 1) != 0)
    {
LABEL_13:

      goto LABEL_16;
    }
    objc_msgSend(*(id *)(a1 + 32), "currentPlayer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "replaceCurrentItemWithPlayerItem:", v4);

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C8B2E8], "playerWithPlayerItem:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurrentPlayer:", v25);

  objc_msgSend(*(id *)(a1 + 32), "currentPlayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "status") == 1)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "currentPlayer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "status");

    if (v29)
      goto LABEL_16;
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "currentPlayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeWithSeconds(&v44, 0.0333333333, 90000);
  v31 = MEMORY[0x1E0C80D38];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_2;
  v42[3] = &unk_1E5C21C50;
  objc_copyWeak(&v43, &location);
  objc_msgSend(v30, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v44, MEMORY[0x1E0C80D38], v42);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlaybackTimeObserver:", v32);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
LABEL_16:
  NSStringFromSelector(sel_tracks);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentAsset");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "statusOfValueForKey:error:", v33, 0) == 2;

  if (v35)
  {
    v36 = *(_QWORD *)(a1 + 56);
    if (v36)
      (*(void (**)(void))(v36 + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "currentAsset");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_3;
    v40[3] = &unk_1E5C20C00;
    v40[4] = *(_QWORD *)(a1 + 32);
    v40[5] = v33;
    v41 = *(id *)(a1 + 56);
    objc_msgSend(v37, "loadValuesAsynchronouslyForKeys:completionHandler:", v38, v40);

  }
}

void __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_2(uint64_t a1, CMTime *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  double Seconds;
  double v8;
  id v9;
  CMTime v10;
  CMTime time;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "duration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  v10 = *a2;
  v8 = CMTimeGetSeconds(&v10);
  v9 = objc_loadWeakRetained(v3);
  objc_msgSend(v9, "updateTime:duration:", v8, Seconds);

}

void __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "currentAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusOfValueForKey:error:", *(_QWORD *)(a1 + 40), 0);

  if (v3 == 2)
    performBlockOnMainThread();
}

- (void)play:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ICAudioController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__ICAudioController_play___block_invoke;
  v6[3] = &unk_1E5C1D9A8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[ICAudioController prepareToPlayAttachment:completion:](self, "prepareToPlayAttachment:completion:", v5, v6);

}

uint64_t __26__ICAudioController_play___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D638A0];
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *MEMORY[0x1E0D63898];
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, 0, v5);

  return objc_msgSend(*(id *)(a1 + 40), "play");
}

- (void)seekToTime:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  CMTime v15;

  v6 = a4;
  -[ICAudioController currentPlayer](self, "currentPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICAudioController currentPlayer](self, "currentPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeWithSeconds(&v15, a3, 600);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__ICAudioController_seekToTime_completion___block_invoke;
    v13[3] = &unk_1E5C21CC8;
    v13[4] = self;
    v14 = v6;
    v11 = *MEMORY[0x1E0CA2E68];
    v12 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v9 = v11;
    v10 = v12;
    objc_msgSend(v8, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v15, &v11, &v9, v13);

  }
  else
  {
    -[ICAudioController setPendingSeekTime:](self, "setPendingSeekTime:", a3);
    if (v6)
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

uint64_t __43__ICAudioController_seekToTime_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((_DWORD)a2)
    objc_msgSend(*(id *)(a1 + 32), "updateNowPlayingInfo");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)skipAheadByInterval:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double Seconds;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  CMTime v17;
  CMTime time;

  v6 = a4;
  +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "duration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentPlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "currentTime");
  else
    memset(&v17, 0, sizeof(v17));
  v15 = CMTimeGetSeconds(&v17) + a3;

  if (Seconds >= v15)
    v16 = v15;
  else
    v16 = Seconds;
  -[ICAudioController seekToTime:completion:](self, "seekToTime:completion:", v6, v16, v17.value, *(_QWORD *)&v17.timescale, v17.epoch, time.value, *(_QWORD *)&time.timescale, time.epoch);

}

- (void)skipBackByInterval:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  CMTime time;

  v6 = a4;
  -[ICAudioController currentPlayer](self, "currentPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  v9 = CMTimeGetSeconds(&time) - a3;

  -[ICAudioController seekToTime:completion:](self, "seekToTime:completion:", v6, fmax(v9, 0.0));
}

- (int64_t)remotePlay:(id)a3
{
  -[ICAudioController play](self, "play", a3);
  return 0;
}

- (int64_t)remotePause:(id)a3
{
  -[ICAudioController pause](self, "pause", a3);
  return 0;
}

- (int64_t)remoteStop:(id)a3
{
  -[ICAudioController stop](self, "stop", a3);
  return 0;
}

- (int64_t)remoteTogglePlayPause:(id)a3
{
  -[ICAudioController togglePlayPause](self, "togglePlayPause", a3);
  return 0;
}

- (int64_t)remoteSkipBackward:(id)a3
{
  objc_msgSend(a3, "interval");
  -[ICAudioController skipBackByInterval:completion:](self, "skipBackByInterval:completion:", 0);
  return 0;
}

- (int64_t)remoteSkipForward:(id)a3
{
  objc_msgSend(a3, "interval");
  -[ICAudioController skipAheadByInterval:completion:](self, "skipAheadByInterval:completion:", 0);
  return 0;
}

- (int64_t)remoteChangePlaybackPosition:(id)a3
{
  objc_msgSend(a3, "positionTime");
  -[ICAudioController seekToTime:completion:](self, "seekToTime:completion:", 0);
  return 0;
}

- (int64_t)remoteChangeRate:(id)a3
{
  int v4;
  int v5;
  void *v6;
  double v7;

  objc_msgSend(a3, "playbackRate");
  v5 = v4;
  -[ICAudioController currentPlayer](self, "currentPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = v5;
  objc_msgSend(v6, "setRate:", v7);

  return 0;
}

- (void)attachmentWillBeDeletedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAudioController currentAttachment](self, "currentAttachment");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6 == v4)
  {
    if (-[ICAudioController isPlaying](self, "isPlaying"))
      -[ICAudioController stop](self, "stop");
    -[ICAudioController setCurrentAttachment:](self, "setCurrentAttachment:", 0);
    v5 = v6;
  }

}

- (void)playerItemDidPlayToEndTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (v10)
  {
    -[ICAudioController currentPlayer](self, "currentPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isEqual:", v8);

    v6 = v10;
    if (v9)
    {
      -[ICAudioController notifyStopped](self, "notifyStopped");
      v6 = v10;
    }
  }

}

- (void)deviceWillLock:(id)a3
{
  if (!-[ICAudioController isPlaying](self, "isPlaying", a3))
    -[ICAudioController stop](self, "stop");
}

- (void)notifyPlaying
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAudioController currentAttachment](self, "currentAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICAudioPlaybackPlayNotification"), v3);

}

- (void)notifyPaused
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAudioController currentAttachment](self, "currentAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICAudioPlaybackPauseNotification"), v3);

}

- (void)notifyStopped
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAudioController currentAttachment](self, "currentAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICAudioPlaybackStopNotification"), v3);

}

- (void)updateTime:(double)a3 duration:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioController currentAttachment](self, "currentAttachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("ICAudioPlaybackNotificationTimeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("ICAudioPlaybackNotificationDurationKey");
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("ICAudioPlaybackTimeChangedNotification"), v8, v11);

}

- (void)updateNowPlayingInfo
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  double Seconds;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  CMTime v29;
  CMTime time;
  _QWORD v31[4];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isLocked")
    && !-[ICAudioController isPlaying](self, "isPlaying"))
  {
    objc_msgSend(MEMORY[0x1E0CC24A8], "defaultCenter");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setNowPlayingInfo:", 0);

  }
  else
  {
    -[ICAudioController currentAttachment](self, "currentAttachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      -[ICAudioController currentAttachment](self, "currentAttachment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "defaultTitle");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = &stru_1E5C2F8C0;
      if (v8)
        v10 = (__CFString *)v8;
      v6 = v10;

    }
    -[ICAudioController currentAsset](self, "currentAsset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "duration");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);

    -[ICAudioController currentPlayer](self, "currentPlayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      objc_msgSend(v14, "currentTime");
    else
      memset(&v29, 0, sizeof(v29));
    v16 = CMTimeGetSeconds(&v29);

    -[ICAudioController currentPlayer](self, "currentPlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rate");
    v19 = v18;

    v20 = *MEMORY[0x1E0CC1FD8];
    v32[0] = v6;
    v21 = *MEMORY[0x1E0CC2250];
    v31[0] = v20;
    v31[1] = v21;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v22;
    v31[2] = *MEMORY[0x1E0CC1EE0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Seconds);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v23;
    v31[3] = *MEMORY[0x1E0CC2260];
    LODWORD(v24) = v19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC24A8], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setNowPlayingInfo:", v26);

  }
}

- (AVPlayer)currentPlayer
{
  return self->_currentPlayer;
}

- (void)setCurrentPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_currentPlayer, a3);
}

- (ICAttachment)currentAttachment
{
  return self->_currentAttachment;
}

- (AVAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
  objc_storeStrong((id *)&self->_currentAsset, a3);
}

- (NSObject)playbackTimeObserver
{
  return self->_playbackTimeObserver;
}

- (void)setPlaybackTimeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_playbackTimeObserver, a3);
}

- (double)pendingSeekTime
{
  return self->_pendingSeekTime;
}

- (void)setPendingSeekTime:(double)a3
{
  self->_pendingSeekTime = a3;
}

- (BOOL)registeredForRemoteControlEvents
{
  return self->_registeredForRemoteControlEvents;
}

- (void)setRegisteredForRemoteControlEvents:(BOOL)a3
{
  self->_registeredForRemoteControlEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackTimeObserver, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_currentAttachment, 0);
  objc_storeStrong((id *)&self->_currentPlayer, 0);
}

void __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "ICAudioController attempted to play nil asset, bailing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
