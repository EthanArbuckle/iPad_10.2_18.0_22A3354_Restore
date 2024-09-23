@implementation AVPictureInPictureController

- (AVPictureInPicturePlatformAdapter)platformAdapter
{
  return self->_platformAdapter;
}

+ (BOOL)isPictureInPictureSupported
{
  return +[AVPictureInPicturePlatformAdapter isPictureInPictureSupported](AVPictureInPicturePlatformAdapter, "isPictureInPictureSupported");
}

- (BOOL)isPictureInPictureActive
{
  return self->_pictureInPictureActive;
}

- (void)contentSourceVideoRectInWindowChanged
{
  id v2;

  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateLayoutDependentBehaviors");

}

- (void)_commonInitWithSource:(id)a3
{
  AVPictureInPictureContentSource **p_source;
  id v5;
  AVObservationController *v6;
  AVObservationController *observationController;
  AVPictureInPicturePlatformAdapter *v8;
  AVPictureInPicturePlatformAdapter *platformAdapter;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;
  CGSize v35;

  v34 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    p_source = &self->_source;
    v5 = a3;
    objc_storeWeak((id *)p_source, v5);
    -[AVPictureInPictureController _logContentSourceType:](self, "_logContentSourceType:", v5);
    v6 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
    observationController = self->_observationController;
    self->_observationController = v6;

    v8 = -[AVPictureInPicturePlatformAdapter initWithSource:]([AVPictureInPicturePlatformAdapter alloc], "initWithSource:", v5);
    platformAdapter = self->_platformAdapter;
    self->_platformAdapter = v8;

    -[AVPictureInPicturePlatformAdapter setBackgroundPlaybackPolicy:](self->_platformAdapter, "setBackgroundPlaybackPolicy:", 1);
    -[AVPictureInPicturePlatformAdapter setCanStartAutomaticallyWhenEnteringBackground:](self->_platformAdapter, "setCanStartAutomaticallyWhenEnteringBackground:", 1);
    self->_canStartAutomaticallyWhenEnteringBackground = 1;
    self->_canPausePlaybackWhenClosingPictureInPicture = 1;
    -[AVPictureInPicturePlatformAdapter setManagesWiredSecondScreenPlayback:](self->_platformAdapter, "setManagesWiredSecondScreenPlayback:", objc_msgSend(v5, "avkit_wantsManagedSecondScreenPlayback"));
    self->_requiresLinearPlayback = -[AVPictureInPicturePlatformAdapter requiresLinearPlayback](self->_platformAdapter, "requiresLinearPlayback");
    self->_pictureInPictureActive = 0;
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_pictureInPicturePossible = objc_msgSend(v10, "status") > 0;

    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);

    -[AVPictureInPictureController playerController](self, "playerController");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avkit_makePlayerControllerIfNeeded:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVPictureInPictureController setPlayerController:](self, "setPlayerController:", v13);
    -[AVPictureInPictureController playerController](self, "playerController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[AVPictureInPictureController playerController](self, "playerController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPictureInPictureController:", self);

    }
    -[AVPictureInPictureController playerController](self, "playerController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      _AVLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[AVPictureInPictureController contentSource](self, "contentSource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "initialRenderSize");
        NSStringFromCGSize(v35);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 136315394;
        v31 = "-[AVPictureInPictureController _commonInitWithSource:]";
        v32 = 2112;
        v33 = v20;
        _os_log_impl(&dword_1AC4B1000, v18, OS_LOG_TYPE_DEFAULT, "%s Has initial render size: %@", (uint8_t *)&v30, 0x16u);

      }
      -[AVPictureInPictureController _sbdlPlayerController](self, "_sbdlPlayerController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPictureInPictureController contentSource](self, "contentSource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "initialRenderSize");
      objc_msgSend(v21, "setEnqueuedBufferDimensions:");

    }
    -[AVPictureInPictureController observationController](self, "observationController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v23, "startObserving:keyPath:includeInitialValue:observationHandler:", v24, CFSTR("anyPictureInPictureActive"), 1, &__block_literal_global_12195);

    -[AVPictureInPictureController observationController](self, "observationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)objc_msgSend(v26, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.contentDimensions"), 0, &__block_literal_global_40_12197);

    -[AVPictureInPictureController observationController](self, "observationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerControllerPIPActivitySessionIdentifierDidChangeNotification"), 0, 0, &__block_literal_global_42);

    -[AVPictureInPictureController observationController](self, "observationController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AC20], 0, 0, &__block_literal_global_43_12198);

  }
}

void __63__AVPictureInPictureController_startObservingPlayerController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 != *(void **)(a1 + 32))
    goto LABEL_4;
  v5 = objc_msgSend(v3, "isPictureInPictureActive");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "isPlaying"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("AVPictureInPictureControllerPlaybackStateIsPlayingKey");
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("AVPictureInPictureControllerPlaybackStateDidChangeNotification"), v3, v9);

LABEL_4:
  }

}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

void __54__AVPictureInPictureController__commonInitWithSource___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "isPictureInPictureActive"))
  {
    objc_msgSend(v2, "setOtherPictureInPictureActive:", 0);
  }
  else
  {
    objc_msgSend(v2, "platformAdapter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setOtherPictureInPictureActive:", objc_msgSend(v3, "isAnyPictureInPictureActive"));

  }
  objc_msgSend(v2, "platformAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setCanStopPictureInPicture:", objc_msgSend(v4, "isAnyPictureInPictureActive"));

  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v2, "isOtherPictureInPictureActive");
    v7 = "NO";
    v8 = 136315650;
    v9 = "-[AVPictureInPictureController _commonInitWithSource:]_block_invoke";
    v11 = "owner.isOtherPictureInPictureActive";
    v10 = 2080;
    if (v6)
      v7 = "YES";
    v12 = 2080;
    v13 = v7;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
  }

}

- (void)_setCanStopPictureInPicture:(BOOL)a3
{
  self->_canStopPictureInPicture = a3;
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    v9 = 136315650;
    v10 = "-[AVPictureInPictureController setAllowsPictureInPicturePlayback:]";
    v12 = "allowsPictureInPicturePlayback";
    v11 = 2080;
    if (v3)
      v6 = "YES";
    v13 = 2080;
    v14 = v6;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v9, 0x20u);
  }

  self->_allowsPictureInPicturePlayback = v3;
  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsPictureInPicturePlayback:", v3);

  -[AVPictureInPictureController playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsPictureInPicturePlayback:", v3);

}

- (BOOL)wantsImmediateAssetInspection
{
  return self->_wantsImmediateAssetInspection;
}

- (void)stopObservingPlayerController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[AVPictureInPictureController playerControllerIsPlayingObservationToken](self, "playerControllerIsPlayingObservationToken", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVPictureInPictureController observationController](self, "observationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureController playerControllerIsPlayingObservationToken](self, "playerControllerIsPlayingObservationToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopObserving:", v6);

    -[AVPictureInPictureController setPlayerControllerIsPlayingObservationToken:](self, "setPlayerControllerIsPlayingObservationToken:", 0);
  }
}

- (void)startObservingPlayerController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    -[AVPictureInPictureController observationController](self, "observationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__AVPictureInPictureController_startObservingPlayerController___block_invoke;
    v7[3] = &unk_1E5BB28E0;
    v8 = v4;
    objc_msgSend(v5, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.playing"), 1, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureController setPlayerControllerIsPlayingObservationToken:](self, "setPlayerControllerIsPlayingObservationToken:", v6);

  }
}

- (void)setRetainsSourceDuringPictureInPicturePlayback:(BOOL)a3
{
  self->_retainsSourceDuringPictureInPicturePlayback = a3;
}

- (void)setRequiresLinearPlayback:(BOOL)requiresLinearPlayback
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_requiresLinearPlayback != requiresLinearPlayback)
  {
    v3 = requiresLinearPlayback;
    self->_requiresLinearPlayback = requiresLinearPlayback;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v8 = 136315650;
      v9 = "-[AVPictureInPictureController setRequiresLinearPlayback:]";
      v11 = "requiresLinearPlayback";
      v10 = 2080;
      if (v3)
        v6 = "YES";
      v12 = 2080;
      v13 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRequiresLinearPlayback:", v3);

  }
}

- (void)setPlayerControllerIsPlayingObservationToken:(id)a3
{
  objc_storeStrong(&self->_playerControllerIsPlayingObservationToken, a3);
}

- (void)setPlayerController:(id)a3
{
  AVPlayerController *v5;
  AVPlayerController *playerController;
  AVPlayerController *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  AVPlayerController *v12;

  v5 = (AVPlayerController *)a3;
  playerController = self->_playerController;
  v12 = v5;
  if (playerController != v5)
  {
    v7 = playerController;
    v8 = -[AVPlayerController isPictureInPictureInterrupted](v7, "isPictureInPictureInterrupted");
    -[AVPictureInPictureController stopObservingPlayerController:](self, "stopObservingPlayerController:", v7);
    objc_storeStrong((id *)&self->_playerController, a3);
    -[AVPictureInPictureController startObservingPlayerController:](self, "startObservingPlayerController:", v12);
    if (-[AVPictureInPictureController wantsImmediateAssetInspection](self, "wantsImmediateAssetInspection"))
      -[AVPlayerController setInspectionSuspended:](v12, "setInspectionSuspended:", 0);
    -[AVPlayerController setAllowsPictureInPicturePlayback:](v12, "setAllowsPictureInPicturePlayback:", -[AVPictureInPictureController allowsPictureInPicturePlayback](self, "allowsPictureInPicturePlayback"));
    -[AVPlayerController setPictureInPictureActive:](v12, "setPictureInPictureActive:", -[AVPictureInPictureController isPictureInPictureActive](self, "isPictureInPictureActive"));
    -[AVPlayerController setPictureInPictureInterrupted:](v12, "setPictureInPictureInterrupted:", v8);
    -[AVPlayerController setCanTogglePictureInPicture:](v12, "setCanTogglePictureInPicture:", -[AVPictureInPictureController isPictureInPicturePossible](self, "isPictureInPicturePossible"));
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlayerController:", v12);

    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pictureInPictureViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPlayerController:", v12);

    -[AVPictureInPictureController _updateBackgroundPlaybackPolicyFromPlayerController](self, "_updateBackgroundPlaybackPolicyFromPlayerController");
  }

}

- (void)setOtherPictureInPictureActive:(BOOL)a3
{
  _BOOL8 v4;

  self->_otherPictureInPictureActive = a3;
  v4 = a3 || -[AVPictureInPictureController isPictureInPictureActive](self, "isPictureInPictureActive");
  -[AVPictureInPictureController _setCanStopPictureInPicture:](self, "_setCanStopPictureInPicture:", v4);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)setCanStartAutomaticallyWhenEnteringBackground:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_canStartAutomaticallyWhenEnteringBackground != a3)
  {
    v3 = a3;
    self->_canStartAutomaticallyWhenEnteringBackground = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v8 = 136315650;
      v9 = "-[AVPictureInPictureController setCanStartAutomaticallyWhenEnteringBackground:]";
      v11 = "canStartAutomaticallyWhenEnteringBackground";
      v10 = 2080;
      if (v3)
        v6 = "YES";
      v12 = 2080;
      v13 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCanStartAutomaticallyWhenEnteringBackground:", v3);

  }
}

- (void)setCanPausePlaybackWhenClosingPictureInPicture:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_canPausePlaybackWhenClosingPictureInPicture != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v8 = 136315650;
      v9 = "-[AVPictureInPictureController setCanPausePlaybackWhenClosingPictureInPicture:]";
      v11 = "canPausePlaybackWhenClosingPictureInPicture";
      v10 = 2080;
      if (v3)
        v6 = "YES";
      v12 = 2080;
      v13 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    self->_canPausePlaybackWhenClosingPictureInPicture = v3;
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCanPausePlaybackWhenClosingPictureInPicture:", v3);

  }
}

- (void)setBackgroundPlaybackPolicy:(int64_t)a3
{
  int64_t v3;
  id v4;

  if ((unint64_t)a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundPlaybackPolicy:", v3);

}

- (void)setAllowsPictureInPictureFromInlineWhenEnteringBackground:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_allowsPictureInPictureFromInlineWhenEnteringBackground != a3)
  {
    v3 = a3;
    self->_allowsPictureInPictureFromInlineWhenEnteringBackground = a3;
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlwaysStartsAutomaticallyWhenEnteringBackground:", v3);

  }
}

- (void)setActivitySessionIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActivitySessionIdentifier:", v4);

}

- (id)playerControllerIsPlayingObservationToken
{
  return self->_playerControllerIsPlayingObservationToken;
}

- (BOOL)isPictureInPicturePossible
{
  return self->_pictureInPicturePossible;
}

- (BOOL)isOtherPictureInPictureActive
{
  return self->_otherPictureInPictureActive;
}

- (AVPictureInPictureController)initWithSource:(id)a3
{
  id v4;
  AVPictureInPictureController *v5;
  AVPictureInPictureController *v6;
  objc_super v8;

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "isPictureInPictureSupported") & 1) != 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)AVPictureInPictureController;
    v5 = -[AVPictureInPictureController init](&v8, sel_init);
    v6 = v5;
    if (v5)
      -[AVPictureInPictureController _commonInitWithSource:](v5, "_commonInitWithSource:", v4);
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (BOOL)allowsPictureInPicturePlayback
{
  return self->_allowsPictureInPicturePlayback;
}

- (void)_updateBackgroundPlaybackPolicyFromPlayerController
{
  void *v3;
  id v4;

  -[AVPictureInPictureController playerController](self, "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureController setBackgroundPlaybackPolicy:](self, "setBackgroundPlaybackPolicy:", objc_msgSend(v3, "audiovisualBackgroundPlaybackPolicy"));

}

- (AVPictureInPictureController)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  AVPictureInPictureController *v9;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  _AVMethodProem(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ is not a valid initializer. You must call -[%@ initWithPlayerLayer:]."), v5, v7);

  objc_msgSend(MEMORY[0x1E0C8B330], "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVPictureInPictureController initWithPlayerLayer:](self, "initWithPlayerLayer:", v8);

  return v9;
}

- (AVPictureInPictureController)initWithPlayerLayer:(AVPlayerLayer *)playerLayer
{
  AVPlayerLayer *v4;
  AVPictureInPictureControllerContentSource *v5;
  AVPictureInPictureController *v6;
  AVPlayerLayer *v7;

  v4 = playerLayer;
  v5 = -[AVPictureInPictureControllerContentSource initWithPlayerLayer:]([AVPictureInPictureControllerContentSource alloc], "initWithPlayerLayer:", v4);
  if (!objc_msgSend((id)objc_opt_class(), "isPictureInPictureSupported"))
  {
    v6 = 0;
    goto LABEL_5;
  }
  v6 = -[AVPictureInPictureController initWithContentSource:](self, "initWithContentSource:", v5);
  if (v6)
  {
    v7 = v4;
    self = (AVPictureInPictureController *)v6->_playerLayer;
    v6->_playerLayer = v7;
LABEL_5:

  }
  return v6;
}

- (AVPictureInPictureController)initWithContentSource:(AVPictureInPictureControllerContentSource *)contentSource
{
  AVPictureInPictureControllerContentSource *v5;
  AVPictureInPictureController *v6;
  AVPictureInPictureController *v7;
  void *v8;
  char v9;
  void *v10;
  AVPictureInPictureController *v11;
  objc_super v13;

  v5 = contentSource;
  if ((objc_msgSend((id)objc_opt_class(), "isPictureInPictureSupported") & 1) != 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)AVPictureInPictureController;
    v6 = -[AVPictureInPictureController init](&v13, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_wantsImmediateAssetInspection = 1;
      objc_storeStrong((id *)&v6->_contentSource, contentSource);
      v7->_allowsPictureInPicturePlayback = 1;
      -[AVPictureInPictureControllerContentSource source](v5, "source");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[AVPictureInPictureControllerContentSource source](v5, "source");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVPictureInPictureController _commonInitWithSource:](v7, "_commonInitWithSource:", v10);

        -[AVPictureInPictureController _startObservationsForContentSource:](v7, "_startObservationsForContentSource:", v5);
        -[AVPictureInPictureController setAllowsPictureInPicturePlayback:](v7, "setAllowsPictureInPicturePlayback:", 1);
        -[AVPictureInPictureController _configureContentSourceForVideoCallsIfNeeded:](v7, "_configureContentSourceForVideoCallsIfNeeded:", v5);
        -[AVPictureInPictureController _configureContentSourceForGenericViewIfNeeded:](v7, "_configureContentSourceForGenericViewIfNeeded:", v5);
      }
      else
      {
        v7->_pictureInPicturePossible = 0;
      }
    }
  }
  else
  {

    v7 = 0;
  }
  v11 = v7;

  return v11;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[AVPictureInPictureController source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pictureInPictureViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVPictureInPictureController invalidate](self, "invalidate");
  objc_msgSend(v3, "avkit_stopRoutingVideoToPictureInPictureViewController:", v5);

  v6.receiver = self;
  v6.super_class = (Class)AVPictureInPictureController;
  -[AVPictureInPictureController dealloc](&v6, sel_dealloc);
}

- (void)startPictureInPicture
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 == 1)
  {
    if (v6)
    {
      -[AVPictureInPictureController playerController](self, "playerController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[AVPictureInPictureController startPictureInPicture]";
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s starting for playerController %{public}@", (uint8_t *)&v9, 0x16u);

    }
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject startPictureInPicture](v5, "startPictureInPicture");
  }
  else if (v6)
  {
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[AVPictureInPictureController startPictureInPicture]";
    v11 = 1024;
    LODWORD(v12) = objc_msgSend(v8, "status");
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s failed; status = %d", (uint8_t *)&v9, 0x12u);

  }
}

- (void)stopPictureInPicture
{
  void *v3;
  int v4;
  BOOL v5;
  id v6;

  if (-[AVPictureInPictureController isPictureInPictureActive](self, "isPictureInPictureActive")
    && (-[AVPictureInPictureController platformAdapter](self, "platformAdapter"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "canAnimatePictureInPictureTransition"),
        v3,
        v4))
  {
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureController _stopPictureInPictureAndRestoreUserInterface:](self, "_stopPictureInPictureAndRestoreUserInterface:", objc_msgSend(v6, "canAnimatePictureInPictureTransition"));
  }
  else
  {
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isAnyPictureInPictureActive"))
    {
      v5 = -[AVPictureInPictureController isPictureInPictureActive](self, "isPictureInPictureActive");

      if (v5)
        return;
      -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stopPictureInPictureAndRestoreUserInterface:", 0);
    }
  }

}

- (void)stopPictureInPictureEvenWhenInBackground
{
  id v3;

  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureController _stopPictureInPictureAndRestoreUserInterface:](self, "_stopPictureInPictureAndRestoreUserInterface:", objc_msgSend(v3, "canAnimatePictureInPictureTransition"));

}

- (void)invalidate
{
  void *v3;
  void *v4;
  AVPlayerLayer *playerLayer;
  AVObservationController *observationController;
  AVPictureInPicturePlatformAdapter *platformAdapter;

  if (-[AVPictureInPictureController isPictureInPictureActive](self, "isPictureInPictureActive"))
  {
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopPictureInPictureAndRestoreUserInterface:", 0);

  }
  -[AVPictureInPictureController observationController](self, "observationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAllObservation");

  -[AVPictureInPictureController setPlayerController:](self, "setPlayerController:", 0);
  playerLayer = self->_playerLayer;
  self->_playerLayer = 0;

  objc_storeWeak((id *)&self->_source, 0);
  observationController = self->_observationController;
  self->_observationController = 0;

  platformAdapter = self->_platformAdapter;
  self->_platformAdapter = 0;

}

- (void)_logContentSourceType:(id)a3
{
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  switch(objc_msgSend(a3, "avkit_contentSourceType"))
  {
    case 0:
      _AVLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315138;
        v6 = "-[AVPictureInPictureController _logContentSourceType:]";
        v4 = "%s AVPictureInPictureContentSourceTypePlayerLayer";
        goto LABEL_12;
      }
      break;
    case 1:
      _AVLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315138;
        v6 = "-[AVPictureInPictureController _logContentSourceType:]";
        v4 = "%s AVPictureInPictureContentSourceTypeSampleBufferDisplayLayer";
        goto LABEL_12;
      }
      break;
    case 2:
      _AVLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315138;
        v6 = "-[AVPictureInPictureController _logContentSourceType:]";
        v4 = "%s AVPictureInPictureContentSourceTypeVideoCall";
        goto LABEL_12;
      }
      break;
    case 3:
      _AVLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315138;
        v6 = "-[AVPictureInPictureController _logContentSourceType:]";
        v4 = "%s AVPictureInPictureContentSourceTypeGenericView";
        goto LABEL_12;
      }
      break;
    default:
      _AVLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315138;
        v6 = "-[AVPictureInPictureController _logContentSourceType:]";
        v4 = "%s AVPictureInPictureContentSourceTypeUnknown";
LABEL_12:
        _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
      }
      break;
  }

}

- (AVPlayerLayer)playerLayer
{
  AVPlayerLayer *playerLayer;

  playerLayer = self->_playerLayer;
  if (playerLayer)
    return playerLayer;
  objc_msgSend(MEMORY[0x1E0C8B330], "layer");
  return (AVPlayerLayer *)(id)objc_claimAutoreleasedReturnValue();
}

- (AVPictureInPictureViewController)pictureInPictureViewController
{
  void *v2;
  void *v3;

  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pictureInPictureViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPictureInPictureViewController *)v3;
}

- (void)setPictureInPictureActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 v6;

  v3 = a3;
  self->_pictureInPictureActive = a3;
  -[AVPictureInPictureController playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPictureInPictureActive:", v3);

  v6 = v3 || -[AVPictureInPictureController isOtherPictureInPictureActive](self, "isOtherPictureInPictureActive");
  -[AVPictureInPictureController _setCanStopPictureInPicture:](self, "_setCanStopPictureInPicture:", v6);
}

- (void)setControlsStyle:(int64_t)a3
{
  id v4;

  self->_controlsStyle = a3;
  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setControlsStyle:", a3);

}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_microphoneEnabled != a3)
  {
    v3 = a3;
    self->_microphoneEnabled = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v8 = 136315650;
      v9 = "-[AVPictureInPictureController setMicrophoneEnabled:]";
      v11 = "microphoneEnabled";
      v10 = 2080;
      if (v3)
        v6 = "YES";
      v12 = 2080;
      v13 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMicrophoneEnabled:", v3);

  }
}

- (void)setPictureInPicturePossible:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    v8 = 136315650;
    v9 = "-[AVPictureInPictureController setPictureInPicturePossible:]";
    v11 = "pictureInPicturePossible";
    v10 = 2080;
    if (v3)
      v6 = "YES";
    v12 = 2080;
    v13 = v6;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
  }

  self->_pictureInPicturePossible = v3;
  -[AVPictureInPictureController playerController](self, "playerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCanTogglePictureInPicture:", v3);

  if (!v3)
  {
    if (-[AVPictureInPictureController isPictureInPictureActive](self, "isPictureInPictureActive"))
      -[AVPictureInPictureController stopPictureInPicture](self, "stopPictureInPicture");
  }
}

- (id)sampleBufferDisplayLayer
{
  void *v3;
  void *v4;

  -[AVPictureInPictureController source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AVPictureInPictureController source](self, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)reloadPrerollAttributes
{
  void *v3;
  void *v4;
  id v5;

  -[AVPictureInPictureController prerollDelegate](self, "prerollDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pictureInPictureControllerPrerollAttributes:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrerollAttributes:", v3);

}

- (id)activitySessionIdentifier
{
  void *v2;
  void *v3;

  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activitySessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)backgroundPlaybackPolicy
{
  void *v2;
  int64_t v3;

  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backgroundPlaybackPolicy");

  return v3;
}

- (void)pictureInPicturePlatformAdapter:(id)a3 failedToStartError:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AVPictureInPictureController _delegateIfRespondsToSelector:](self, "_delegateIfRespondsToSelector:", sel_pictureInPictureController_failedToStartPictureInPictureWithError_);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pictureInPictureController:failedToStartPictureInPictureWithError:", self, v5);

}

- (void)pictureInPicturePlatformAdapter:(id)a3 handlePlaybackCommand:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void **v15;
  const __CFString **v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  char v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  switch(a4)
  {
    case 1:
      -[AVPictureInPictureController playerController](self, "playerController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isPlaying");

      if ((v8 & 1) == 0)
      {
        -[AVPictureInPictureController playerController](self, "playerController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "togglePlaybackEvenWhenInBackground:", self);

        v10 = (void *)MEMORY[0x1E0CB37E8];
        -[AVPictureInPictureController playerController](self, "playerController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "isPlaying"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = CFSTR("AVPictureInPictureControllerPlaybackStateIsPlayingKey");
        v40[0] = v12;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = (void **)v40;
        v16 = &v39;
        goto LABEL_6;
      }
      goto LABEL_23;
    case 2:
      -[AVPictureInPictureController playerController](self, "playerController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isPlaying");

      if (v18)
      {
        -[AVPictureInPictureController playerController](self, "playerController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "togglePlaybackEvenWhenInBackground:", self);

        v20 = (void *)MEMORY[0x1E0CB37E8];
        -[AVPictureInPictureController playerController](self, "playerController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "numberWithBool:", objc_msgSend(v21, "isPlaying"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = CFSTR("AVPictureInPictureControllerPlaybackStateIsPlayingKey");
        v38 = v12;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = &v38;
        v16 = &v37;
LABEL_6:
        objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("AVPictureInPictureControllerUserPlaybackStateDidChangeNotification"), self, v22);

        break;
      }
      goto LABEL_23;
    case 3:
      -[AVPictureInPictureController playerController](self, "playerController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPictureInPictureController setWasPlayingWhenPictureInPictureInterruptionBegan:](self, "setWasPlayingWhenPictureInPictureInterruptionBegan:", objc_msgSend(v23, "isPlaying"));

      -[AVPictureInPictureController playerController](self, "playerController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = 1;
      goto LABEL_9;
    case 4:
      -[AVPictureInPictureController playerController](self, "playerController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = 0;
LABEL_9:
      objc_msgSend(v24, "setPictureInPictureInterrupted:", v26);
      goto LABEL_15;
    case 5:
      -[AVPictureInPictureController playerController](self, "playerController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setPictureInPictureInterrupted:", 0);

      if (-[AVPictureInPictureController wasPlayingWhenPictureInPictureInterruptionBegan](self, "wasPlayingWhenPictureInPictureInterruptionBegan"))
      {
        -[AVPictureInPictureController playerController](self, "playerController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setPlaying:", 1);

        -[AVPictureInPictureController setWasPlayingWhenPictureInPictureInterruptionBegan:](self, "setWasPlayingWhenPictureInPictureInterruptionBegan:", 0);
      }
      goto LABEL_23;
    case 6:
      -[AVPictureInPictureController playerController](self, "playerController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v29;
      v30 = 1;
      goto LABEL_14;
    case 7:
      -[AVPictureInPictureController playerController](self, "playerController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v29;
      v30 = 0;
LABEL_14:
      objc_msgSend(v29, "setMuted:", v30);
LABEL_15:

      goto LABEL_23;
    case 8:
      -[AVPictureInPictureController playerController](self, "playerController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "togglePlaybackEvenWhenInBackground:", self);
      break;
    case 9:
      -[AVPictureInPictureController prerollDelegate](self, "prerollDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pictureInPictureControllerSkipPreroll:", self);
      break;
    case 10:
      -[AVPictureInPictureController delegate](self, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->__extendedDelegate, v31);

      -[AVPictureInPictureController _extendedDelegate](self, "_extendedDelegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_opt_respondsToSelector();

      if ((v33 & 1) == 0)
        goto LABEL_23;
      -[AVPictureInPictureController _extendedDelegate](self, "_extendedDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pictureInPictureControllerDidSkipBackwardInPictureInPicture:", self);
      break;
    case 11:
      -[AVPictureInPictureController delegate](self, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->__extendedDelegate, v34);

      -[AVPictureInPictureController _extendedDelegate](self, "_extendedDelegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_opt_respondsToSelector();

      if ((v36 & 1) == 0)
        goto LABEL_23;
      -[AVPictureInPictureController _extendedDelegate](self, "_extendedDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pictureInPictureControllerDidSkipForwardInPictureInPicture:", self);
      break;
    default:
      goto LABEL_23;
  }

LABEL_23:
}

- (void)pictureInPicturePlatformAdapterBeginReducingResourcesForEligibleOffScreenState
{
  void *v3;
  void *v4;
  id v5;

  self->_wantsResourceReduction = 1;
  -[AVPictureInPictureController source](self, "source");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureController pictureInPictureViewController](self, "pictureInPictureViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureController playerController](self, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avkit_beginReducingResourcesForPictureInPictureViewController:playerController:", v3, v4);

}

- (void)pictureInPicturePlatformAdapterEndReducingResourcesForEligibleOffScreenState
{
  void *v3;
  void *v4;
  id v5;

  self->_wantsResourceReduction = 0;
  -[AVPictureInPictureController source](self, "source");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureController pictureInPictureViewController](self, "pictureInPictureViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureController playerController](self, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avkit_endReducingResourcesForPictureInPictureViewController:playerController:", v3, v4);

}

- (void)pictureInPicturePlatformAdapter:(id)a3 prepareToStopForRestoringUserInterface:(id)a4
{
  void (**v5)(id, uint64_t);
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, uint64_t))a4;
  _AVLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[AVPictureInPictureController pictureInPicturePlatformAdapter:prepareToStopForRestoringUserInterface:]";
    v12 = 1024;
    v13 = 681;
    _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v10, 0x12u);
  }

  -[AVPictureInPictureController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[AVPictureInPictureController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pictureInPictureController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:", self, v5);

  }
  else
  {
    v5[2](v5, 1);
  }

}

- (void)pictureInPicturePlatformAdapter:(id)a3 statusDidChange:(int64_t)a4 fromStatus:(int64_t)a5
{
  void *v8;
  NSObject *v9;
  unint64_t v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  char v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[AVPictureInPictureController sourceIfRetainedDuringPictureInPicturePlayback](self, "sourceIfRetainedDuringPictureInPicturePlayback", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _AVLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v43 = "-[AVPictureInPictureController pictureInPicturePlatformAdapter:statusDidChange:fromStatus:]";
    v44 = 2048;
    v45 = (const char *)a5;
    v46 = 2048;
    v47 = a4;
    _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s old: %ld --> new: %ld", buf, 0x20u);
  }

  v10 = a4 - 3;
  v11 = a4 == 4;
  if (a4 != 4 && v10 <= 3)
  {
    v11 = -[AVPictureInPictureController pictureInPictureWasStartedWhenEnteringBackground](self, "pictureInPictureWasStartedWhenEnteringBackground");
    if ((((a4 > 0) ^ -[AVPictureInPictureController isPictureInPicturePossible](self, "isPictureInPicturePossible")) & 1) == 0)
    {
LABEL_9:
      if ((a4 == 5) == -[AVPictureInPictureController isPictureInPictureSuspended](self, "isPictureInPictureSuspended"))
        goto LABEL_11;
      goto LABEL_10;
    }
LABEL_8:
    -[AVPictureInPictureController setPictureInPicturePossible:](self, "setPictureInPicturePossible:", a4 > 0);
    -[AVPictureInPictureController playerController](self, "playerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCanTogglePictureInPicture:", a4 > 0);

    goto LABEL_9;
  }
  if ((((a4 > 0) ^ -[AVPictureInPictureController isPictureInPicturePossible](self, "isPictureInPicturePossible")) & 1) != 0)
    goto LABEL_8;
  if ((((a4 == 5) ^ -[AVPictureInPictureController isPictureInPictureSuspended](self, "isPictureInPictureSuspended")) & 1) != 0)
LABEL_10:
    -[AVPictureInPictureController setPictureInPictureSuspended:](self, "setPictureInPictureSuspended:", a4 == 5);
LABEL_11:
  if (v10 <= 3)
    -[AVPictureInPictureController setOtherPictureInPictureActive:](self, "setOtherPictureInPictureActive:", 0);
  if (v10 < 4 != -[AVPictureInPictureController isPictureInPictureActive](self, "isPictureInPictureActive"))
  {
    -[AVPictureInPictureController setPictureInPictureActive:](self, "setPictureInPictureActive:", v10 < 4);
    -[AVPictureInPictureController playerController](self, "playerController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPictureInPictureActive:", v10 < 4);

  }
  if (v10 >= 4)
  {
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureController setOtherPictureInPictureActive:](self, "setOtherPictureInPictureActive:", objc_msgSend(v14, "isAnyPictureInPictureActive"));

  }
  if (v11 != -[AVPictureInPictureController pictureInPictureWasStartedWhenEnteringBackground](self, "pictureInPictureWasStartedWhenEnteringBackground"))-[AVPictureInPictureController setPictureInPictureWasStartedWhenEnteringBackground:](self, "setPictureInPictureWasStartedWhenEnteringBackground:", v11);
  v15 = -[AVPictureInPictureController retainsSourceDuringPictureInPicturePlayback](self, "retainsSourceDuringPictureInPicturePlayback");
  switch(a4)
  {
    case 0:
    case 1:
      v15 = 0;
      goto LABEL_28;
    case 2:
      -[AVPictureInPictureController _delegateIfRespondsToSelector:](self, "_delegateIfRespondsToSelector:", sel_pictureInPictureControllerWillStartPictureInPicture_);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pictureInPictureControllerWillStartPictureInPicture:", self);

      v40 = CFSTR("AVPictureInPictureControllerPlaybackStateIsPlayingKey");
      v21 = (void *)MEMORY[0x1E0CB37E8];
      -[AVPictureInPictureController playerController](self, "playerController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "numberWithBool:", objc_msgSend(v22, "isPlaying"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = 0;
      v19 = CFSTR("AVPictureInPictureControllerWillStartNotification");
      goto LABEL_29;
    case 3:
    case 4:
      if (a5 == 2)
      {
        -[AVPictureInPictureController _delegateIfRespondsToSelector:](self, "_delegateIfRespondsToSelector:", sel_pictureInPictureControllerDidStartPictureInPicture_);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pictureInPictureControllerDidStartPictureInPicture:", self);

      }
      v17 = 0;
      v18 = 0;
      v19 = CFSTR("AVPictureInPictureControllerDidStartNotification");
      goto LABEL_29;
    case 5:
      -[AVPictureInPictureController sourceIfRetainedDuringPictureInPicturePlayback](self, "sourceIfRetainedDuringPictureInPicturePlayback");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v24 != 0;

      goto LABEL_28;
    case 6:
      -[AVPictureInPictureController _delegateIfRespondsToSelector:](self, "_delegateIfRespondsToSelector:", sel_pictureInPictureControllerWillStopPictureInPicture_);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "pictureInPictureControllerWillStopPictureInPicture:", self);

      -[AVPictureInPictureController sourceIfRetainedDuringPictureInPicturePlayback](self, "sourceIfRetainedDuringPictureInPicturePlayback");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v37 != 0;

      v17 = 0;
      v18 = 0;
      v19 = CFSTR("AVPictureInPictureControllerWillStopNotification");
      goto LABEL_29;
    case 7:
      -[AVPictureInPictureController _delegateIfRespondsToSelector:](self, "_delegateIfRespondsToSelector:", sel_pictureInPictureControllerDidStopPictureInPicture_);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "pictureInPictureControllerDidStopPictureInPicture:", self);

      -[AVPictureInPictureController sourceIfRetainedDuringPictureInPicturePlayback](self, "sourceIfRetainedDuringPictureInPicturePlayback");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v39 != 0;

      v17 = 0;
      v18 = 0;
      v19 = CFSTR("AVPictureInPictureControllerDidStopNotification");
      goto LABEL_29;
    default:
LABEL_28:
      v19 = 0;
      v18 = 0;
      v17 = 1;
LABEL_29:
      _AVLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if (v15)
          v26 = "YES";
        else
          v26 = "NO";
        *(_DWORD *)buf = 136315650;
        v43 = "-[AVPictureInPictureController pictureInPicturePlatformAdapter:statusDidChange:fromStatus:]";
        v44 = 2080;
        v45 = "shouldRetainSource";
        v46 = 2080;
        v47 = (int64_t)v26;
        _os_log_impl(&dword_1AC4B1000, v25, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
      }

      if (v15)
      {
        -[AVPictureInPictureController source](self, "source");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVPictureInPictureController setSourceIfRetainedDuringPictureInPicturePlayback:](self, "setSourceIfRetainedDuringPictureInPicturePlayback:", v27);

      }
      else
      {
        -[AVPictureInPictureController setSourceIfRetainedDuringPictureInPicturePlayback:](self, "setSourceIfRetainedDuringPictureInPicturePlayback:", 0);
      }
      _AVLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        -[AVPictureInPictureController sourceIfRetainedDuringPictureInPicturePlayback](self, "sourceIfRetainedDuringPictureInPicturePlayback");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          v30 = "NO";
        else
          v30 = "YES";
        *(_DWORD *)buf = 136315650;
        v43 = "-[AVPictureInPictureController pictureInPicturePlatformAdapter:statusDidChange:fromStatus:]";
        v44 = 2080;
        v45 = "self.sourceIfRetainedDuringPictureInPicturePlayback == nil";
        v46 = 2080;
        v47 = (int64_t)v30;
        _os_log_impl(&dword_1AC4B1000, v28, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);

      }
      if ((v17 & 1) == 0)
      {
        -[AVPictureInPictureController source](self, "source");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          -[AVPictureInPictureController source](self, "source");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v32, CFSTR("AVPictureInPictureControllerContentSourceKey"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v18)
            objc_msgSend(v33, "addEntriesFromDictionary:", v18);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "postNotificationName:object:userInfo:", v19, self, v34);

        }
      }

      return;
  }
}

- (void)pictureInPicturePlatformAdapter:(id)a3 stopPictureInPictureAndRestoreUserInterface:(BOOL)a4
{
  -[AVPictureInPictureController _stopPictureInPictureAndRestoreUserInterface:](self, "_stopPictureInPictureAndRestoreUserInterface:", a4);
}

- (void)pictureInPicturePlatformAdapterPrepareToStopForDismissal:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  if (-[AVPictureInPictureController _shouldPauseWhenExitingPictureInPicture](self, "_shouldPauseWhenExitingPictureInPicture", a3))
  {
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v6 & 1) != 0)
      objc_msgSend(v7, "pauseForAllCoordinatedPlaybackParticipants:", 0);
    else
      objc_msgSend(v7, "setPlaying:", 0);

  }
}

- (void)setContentSource:(AVPictureInPictureControllerContentSource *)contentSource
{
  AVPictureInPictureControllerContentSource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  AVObservationController *v21;
  AVObservationController *observationController;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  AVPictureInPictureControllerContentSource *v28;

  v5 = contentSource;
  if (self->_contentSource != v5)
  {
    v28 = v5;
    -[AVPictureInPictureController observationController](self, "observationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopAllObservation");

    -[AVPictureInPictureControllerContentSource sampleBufferDisplayLayer](self->_contentSource, "sampleBufferDisplayLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avkit_removePictureInPicturePlayerController");

    -[AVPictureInPictureController _invalidateContentSourceForVideoCallsIfNeeded:](self, "_invalidateContentSourceForVideoCallsIfNeeded:", self->_contentSource);
    -[AVPictureInPictureController _configureContentSourceForVideoCallsIfNeeded:](self, "_configureContentSourceForVideoCallsIfNeeded:", self->_contentSource);
    -[AVPictureInPictureController _configureContentSourceForGenericViewIfNeeded:](self, "_configureContentSourceForGenericViewIfNeeded:", self->_contentSource);
    if (-[AVPictureInPictureController wantsResourceReduction](self, "wantsResourceReduction"))
    {
      -[AVPictureInPictureController source](self, "source");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPictureInPictureController pictureInPictureViewController](self, "pictureInPictureViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPictureInPictureController playerController](self, "playerController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "avkit_endReducingResourcesForPictureInPictureViewController:playerController:", v9, v10);

    }
    objc_storeStrong((id *)&self->_contentSource, contentSource);
    -[AVPictureInPictureControllerContentSource source](v28, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_source, v11);

    WeakRetained = objc_loadWeakRetained((id *)&self->_source);
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSource:", WeakRetained);

    -[AVPictureInPictureController source](self, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureController playerController](self, "playerController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "avkit_makePlayerControllerIfNeeded:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AVPictureInPictureController contentSource](self, "contentSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "initialRenderSize");
      objc_msgSend(v16, "setEnqueuedBufferDimensions:");

    }
    -[AVPictureInPictureController setPlayerController:](self, "setPlayerController:", v16);
    if (-[AVPictureInPictureController wantsResourceReduction](self, "wantsResourceReduction"))
    {
      -[AVPictureInPictureController source](self, "source");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPictureInPictureController pictureInPictureViewController](self, "pictureInPictureViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPictureInPictureController playerController](self, "playerController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "avkit_beginReducingResourcesForPictureInPictureViewController:playerController:", v19, v20);

    }
    v21 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
    observationController = self->_observationController;
    self->_observationController = v21;

    -[AVPictureInPictureController _sbdlPlayerController](self, "_sbdlPlayerController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPictureInPictureController:", self);

    -[AVPictureInPictureController _startObservationsForContentSource:](self, "_startObservationsForContentSource:", v28);
    -[AVPictureInPictureController observationController](self, "observationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v24, "startObserving:keyPath:includeInitialValue:observationHandler:", v25, CFSTR("anyPictureInPictureActive"), 1, &__block_literal_global_79);

    -[AVPictureInPictureController observationController](self, "observationController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerControllerPIPActivitySessionIdentifierDidChangeNotification"), 0, 0, &__block_literal_global_81_12140);

    -[AVPictureInPictureController contentSourceVideoRectInWindowChanged](self, "contentSourceVideoRectInWindowChanged");
    -[AVPictureInPictureController setAllowsPictureInPicturePlayback:](self, "setAllowsPictureInPicturePlayback:", 1);

    v5 = v28;
  }

}

- (void)invalidatePlaybackState
{
  id v2;

  -[AVPictureInPictureController _sbdlPlayerController](self, "_sbdlPlayerController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidatePlaybackState");

}

- (void)sampleBufferDisplayLayerRenderSizeDidChangeToSize:(CGSize)a3
{
  double height;
  double width;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;
  CGSize v15;

  height = a3.height;
  width = a3.width;
  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v15.width = width;
      v15.height = height;
      NSStringFromCGSize(v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v11 = "-[AVPictureInPictureController sampleBufferDisplayLayerRenderSizeDidChangeToSize:]";
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s SampleBufferDisplayLayer Render Size changed: %@", buf, 0x16u);

    }
    -[AVPictureInPictureController _sbdlPlayerController](self, "_sbdlPlayerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnqueuedBufferDimensions:", width, height);

    -[AVPictureInPictureController contentSourceVideoRectInWindowChanged](self, "contentSourceVideoRectInWindowChanged");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__AVPictureInPictureController_sampleBufferDisplayLayerRenderSizeDidChangeToSize___block_invoke;
    block[3] = &unk_1E5BB32F0;
    block[4] = self;
    *(double *)&block[5] = width;
    *(double *)&block[6] = height;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)sampleBufferDisplayLayerDidAppear
{
  _QWORD block[5];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    -[AVPictureInPictureController contentSourceVideoRectInWindowChanged](self, "contentSourceVideoRectInWindowChanged");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__AVPictureInPictureController_sampleBufferDisplayLayerDidAppear__block_invoke;
    block[3] = &unk_1E5BB4CA0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)sampleBufferDisplayLayerDidDisappear
{
  _QWORD block[5];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    -[AVPictureInPictureController contentSourceVideoRectInWindowChanged](self, "contentSourceVideoRectInWindowChanged");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__AVPictureInPictureController_sampleBufferDisplayLayerDidDisappear__block_invoke;
    block[3] = &unk_1E5BB4CA0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (id)_sbdlPlayerController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AVPictureInPictureController contentSource](self, "contentSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sampleBufferDisplayLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureController playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avkit_makePlayerControllerIfNeeded:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_invalidateContentSourceForVideoCallsIfNeeded:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "activeVideoCallContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "activeVideoCallContentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopObservingSourceView");

  }
}

- (void)_configureContentSourceForVideoCallsIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "activeVideoCallContentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "activeVideoCallContentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPictureInPictureController:", self);

    objc_msgSend(v8, "activeVideoCallContentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentSource:", v8);

    objc_msgSend(v8, "activeVideoCallContentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startObservingSourceView");

    -[AVPictureInPictureController setControlsStyle:](self, "setControlsStyle:", 2);
  }

}

- (void)_configureContentSourceForGenericViewIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "activeContentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v7, "activeContentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentSource:", v7);

    -[AVPictureInPictureController setControlsStyle:](self, "setControlsStyle:", 0);
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updateStatus");

  }
}

- (id)_delegateIfRespondsToSelector:(SEL)a3
{
  void *v4;
  void *v5;

  -[AVPictureInPictureController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AVPictureInPictureController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldPauseWhenExitingPictureInPicture
{
  void *v3;
  void *v4;
  BOOL v5;

  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "isExternalPlaybackActive") & 1) == 0
    && -[AVPictureInPictureController canPausePlaybackWhenClosingPictureInPicture](self, "canPausePlaybackWhenClosingPictureInPicture");

  return v5;
}

- (void)_stopPictureInPictureAndRestoreUserInterface:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a3;
  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "status") == 3)
  {

  }
  else
  {
    -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "status");

    if (v7 != 4)
      return;
  }
  -[AVPictureInPictureController platformAdapter](self, "platformAdapter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopPictureInPictureAndRestoreUserInterface:", v3);

}

- (void)_startObservationsForContentSource:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AVPictureInPictureController _startObservingPlayerLayerContentSource:](self, "_startObservingPlayerLayerContentSource:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v5, "hasInitialRenderSize") & 1) == 0)
      -[AVPictureInPictureController _startObservingSampleBufferDisplayLayerContentSource:](self, "_startObservingSampleBufferDisplayLayerContentSource:", v4);
  }

}

- (void)_startObservingPlayerLayerContentSource:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVPictureInPictureController observationController](self, "observationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "startObserving:keyPath:includeInitialValue:observationHandler:", v4, CFSTR("player"), 0, &__block_literal_global_86);

  -[AVPictureInPictureController observationController](self, "observationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("videoRect");
  v10[1] = CFSTR("readyForDisplay");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "startObserving:keyPaths:includeInitialValue:observationHandler:", v4, v8, 1, &__block_literal_global_92_12130);

}

- (void)_startObservingSampleBufferDisplayLayerContentSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AVPictureInPictureController observationController](self, "observationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8ACD0], v4, 0, &__block_literal_global_93_12126);

  -[AVPictureInPictureController observationController](self, "observationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8ACD8], v4, 0, &__block_literal_global_94_12127);

  -[AVPictureInPictureController _updateEnqueuedBufferDimensions](self, "_updateEnqueuedBufferDimensions");
}

- (void)_updateEnqueuedBufferDimensions
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  -[AVPictureInPictureController contentSource](self, "contentSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sampleBufferDisplayLayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v10;
  if (v10)
  {
    objc_msgSend(v10, "videoRect");
    v6 = v5;
    v8 = v7;
    -[AVPictureInPictureController _sbdlPlayerController](self, "_sbdlPlayerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnqueuedBufferDimensions:", v6, v8);

    -[AVPictureInPictureController contentSourceVideoRectInWindowChanged](self, "contentSourceVideoRectInWindowChanged");
    v4 = v10;
  }

}

- (int64_t)controlsStyle
{
  return self->_controlsStyle;
}

- (BOOL)isMicrophoneEnabled
{
  return self->_microphoneEnabled;
}

- (BOOL)canPausePlaybackWhenClosingPictureInPicture
{
  return self->_canPausePlaybackWhenClosingPictureInPicture;
}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (AVPictureInPictureControllerContentSource)contentSource
{
  return self->_contentSource;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isPictureInPictureSuspended
{
  return self->_pictureInPictureSuspended;
}

- (void)setPictureInPictureSuspended:(BOOL)a3
{
  self->_pictureInPictureSuspended = a3;
}

- (BOOL)canStopPictureInPicture
{
  return self->_canStopPictureInPicture;
}

- (AVPictureInPictureContentSource)sourceIfRetainedDuringPictureInPicturePlayback
{
  return self->_sourceIfRetainedDuringPictureInPicturePlayback;
}

- (void)setSourceIfRetainedDuringPictureInPicturePlayback:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIfRetainedDuringPictureInPicturePlayback, a3);
}

- (void)setWantsImmediateAssetInspection:(BOOL)a3
{
  self->_wantsImmediateAssetInspection = a3;
}

- (BOOL)wasPlayingWhenPictureInPictureInterruptionBegan
{
  return self->_wasPlayingWhenPictureInPictureInterruptionBegan;
}

- (void)setWasPlayingWhenPictureInPictureInterruptionBegan:(BOOL)a3
{
  self->_wasPlayingWhenPictureInPictureInterruptionBegan = a3;
}

- (AVPictureInPictureControllerExtendedDelegate)_extendedDelegate
{
  return (AVPictureInPictureControllerExtendedDelegate *)objc_loadWeakRetained((id *)&self->__extendedDelegate);
}

- (void)set_extendedDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__extendedDelegate, a3);
}

- (AVPictureInPictureContentSource)source
{
  return (AVPictureInPictureContentSource *)objc_loadWeakRetained((id *)&self->_source);
}

- (BOOL)wantsResourceReduction
{
  return self->_wantsResourceReduction;
}

- (BOOL)retainsSourceDuringPictureInPicturePlayback
{
  return self->_retainsSourceDuringPictureInPicturePlayback;
}

- (BOOL)allowsPictureInPictureFromInlineWhenEnteringBackground
{
  return self->_allowsPictureInPictureFromInlineWhenEnteringBackground;
}

- (BOOL)pictureInPictureWasStartedWhenEnteringBackground
{
  return self->_pictureInPictureWasStartedWhenEnteringBackground;
}

- (void)setPictureInPictureWasStartedWhenEnteringBackground:(BOOL)a3
{
  self->_pictureInPictureWasStartedWhenEnteringBackground = a3;
}

- (BOOL)canStartAutomaticallyWhenEnteringBackground
{
  return self->_canStartAutomaticallyWhenEnteringBackground;
}

- (AVPictureInPicturePrerollDelegate)prerollDelegate
{
  return (AVPictureInPicturePrerollDelegate *)objc_loadWeakRetained((id *)&self->_prerollDelegate);
}

- (void)setPrerollDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_prerollDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_prerollDelegate);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_destroyWeak((id *)&self->_source);
  objc_destroyWeak((id *)&self->__extendedDelegate);
  objc_storeStrong(&self->_playerControllerIsPlayingObservationToken, 0);
  objc_storeStrong((id *)&self->_sourceIfRetainedDuringPictureInPicturePlayback, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_platformAdapter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentSource, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
}

uint64_t __85__AVPictureInPictureController__startObservingSampleBufferDisplayLayerContentSource___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentSourceVideoRectInWindowChanged");
}

uint64_t __85__AVPictureInPictureController__startObservingSampleBufferDisplayLayerContentSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateEnqueuedBufferDimensions");
}

uint64_t __72__AVPictureInPictureController__startObservingPlayerLayerContentSource___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentSourceVideoRectInWindowChanged");
}

void __72__AVPictureInPictureController__startObservingPlayerLayerContentSource___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "source");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avkit_makePlayerControllerIfNeeded:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPlayerController:", v4);

}

uint64_t __68__AVPictureInPictureController_sampleBufferDisplayLayerDidDisappear__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contentSourceVideoRectInWindowChanged");
}

uint64_t __65__AVPictureInPictureController_sampleBufferDisplayLayerDidAppear__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contentSourceVideoRectInWindowChanged");
}

uint64_t __82__AVPictureInPictureController_sampleBufferDisplayLayerRenderSizeDidChangeToSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sampleBufferDisplayLayerRenderSizeDidChangeToSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __49__AVPictureInPictureController_setContentSource___block_invoke_80(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pipActivitySessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActivitySessionIdentifier:", v3);

}

void __49__AVPictureInPictureController_setContentSource___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "isPictureInPictureActive"))
  {
    objc_msgSend(v2, "setOtherPictureInPictureActive:", 0);
  }
  else
  {
    objc_msgSend(v2, "platformAdapter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setOtherPictureInPictureActive:", objc_msgSend(v3, "isAnyPictureInPictureActive"));

  }
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(v2, "isOtherPictureInPictureActive");
    v6 = "NO";
    v7 = 136315650;
    v8 = "-[AVPictureInPictureController setContentSource:]_block_invoke";
    v10 = "owner.isOtherPictureInPictureActive";
    v9 = 2080;
    if (v5)
      v6 = "YES";
    v11 = 2080;
    v12 = v6;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
  }

}

void __54__AVPictureInPictureController__commonInitWithSource___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a4;
  objc_msgSend(v9, "playerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
    objc_msgSend(v9, "_updateBackgroundPlaybackPolicyFromPlayerController");

}

void __54__AVPictureInPictureController__commonInitWithSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pipActivitySessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActivitySessionIdentifier:", v3);

}

void __54__AVPictureInPictureController__commonInitWithSource___block_invoke_39(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "platformAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");

  if (!v3)
  {
    objc_msgSend(v5, "platformAdapter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateStatus");

  }
}

+ (id)_imageNamed:(id)a3 compatibileWithTraitCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  +[AVPictureInPicturePlatformAdapter imageSymbolConfiguration](AVPictureInPicturePlatformAdapter, "imageSymbolConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationByApplyingConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3870];
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v5, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AVBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v11, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (UIImage)pictureInPictureButtonStartImageCompatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  UITraitCollection *v4;
  void *v5;
  void *v6;

  v4 = traitCollection;
  +[AVPictureInPicturePlatformAdapter startPictureInPictureButtonImageName](AVPictureInPicturePlatformAdapter, "startPictureInPictureButtonImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_imageNamed:compatibileWithTraitCollection:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

+ (UIImage)pictureInPictureButtonStopImageCompatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  UITraitCollection *v4;
  void *v5;
  void *v6;

  v4 = traitCollection;
  +[AVPictureInPicturePlatformAdapter stopPictureInPictureButtonImageName](AVPictureInPicturePlatformAdapter, "stopPictureInPictureButtonImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_imageNamed:compatibileWithTraitCollection:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

+ (UIImage)pictureInPictureButtonStartImage
{
  return (UIImage *)objc_msgSend(a1, "pictureInPictureButtonStartImageCompatibleWithTraitCollection:", 0);
}

+ (UIImage)pictureInPictureButtonStopImage
{
  return (UIImage *)objc_msgSend(a1, "pictureInPictureButtonStopImageCompatibleWithTraitCollection:", 0);
}

@end
