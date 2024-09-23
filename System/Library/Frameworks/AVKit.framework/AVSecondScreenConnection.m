@implementation AVSecondScreenConnection

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isReadyToConnect
{
  return self->_readyToConnect;
}

- (void)setPlaying:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_playing != a3)
  {
    v3 = a3;
    self->_playing = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenConnection _postNotification:oldValue:newValue:](self, "_postNotification:oldValue:newValue:", CFSTR("AVSecondScreenConnectionPlayingDidChangeNotification"), v6, v5);

  }
}

- (void)_postNotification:(id)a3 oldValue:(id)a4 newValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AVLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ -> %@", (uint8_t *)&v13, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", v8, self);

}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setRequiresTVOutScreen:(BOOL)a3
{
  self->_requiresTVOutScreen = a3;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (void)setObservationController:(id)a3
{
  objc_storeStrong((id *)&self->_observationController, a3);
}

- (void)setDebugInfoPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfoPlayer, a3);
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (void)_updatePreferredDisplayCriteriaFromPreparedAssetIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a3;
  -[AVSecondScreenConnection player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v13;
  if (v4)
  {
    if (objc_msgSend(v13, "statusOfValueForKey:error:", CFSTR("preferredDisplayCriteria"), 0) != 2
      || (objc_msgSend(v13, "preferredDisplayCriteria"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v7 = objc_alloc(MEMORY[0x1E0C8B1B0]);
      LODWORD(v8) = 0;
      v6 = (void *)objc_msgSend(v7, "initWithRefreshRate:videoDynamicRange:", 0, v8);
    }
    -[AVSecondScreenConnection player](self, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "isEqual:", v11);

    if (v12)
      -[AVSecondScreenConnection setPreferredDisplayCriteria:](self, "setPreferredDisplayCriteria:", v6);

    v5 = v13;
  }

}

- (void)_updatePreferredDisplayCriteria
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[AVSecondScreenConnection player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v9[0] = CFSTR("availableVideoDynamicRanges");
    v9[1] = CFSTR("preferredDisplayCriteria");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__AVSecondScreenConnection__updatePreferredDisplayCriteria__block_invoke;
    v7[3] = &unk_1E5BB3D20;
    v7[4] = self;
    v8 = v5;
    objc_msgSend(v8, "loadValuesAsynchronouslyForKeys:completionHandler:", v6, v7);

  }
  else
  {
    -[AVSecondScreenConnection setPreferredDisplayCriteria:](self, "setPreferredDisplayCriteria:", 0);
  }

}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPreferredDisplayCriteria:(id)a3
{
  char v4;
  AVDisplayCriteria *v5;
  AVDisplayCriteria *preferredDisplayCriteria;
  AVDisplayCriteria *v7;
  AVDisplayCriteria *v8;
  AVDisplayCriteria *v9;
  AVDisplayCriteria *v10;

  v10 = (AVDisplayCriteria *)a3;
  v4 = -[AVDisplayCriteria isEqual:](self->_preferredDisplayCriteria, "isEqual:", v10);
  v5 = v10;
  if ((v4 & 1) == 0)
  {
    preferredDisplayCriteria = self->_preferredDisplayCriteria;
    if (preferredDisplayCriteria != v10)
    {
      v7 = v10;
      v8 = self->_preferredDisplayCriteria;
      self->_preferredDisplayCriteria = v7;
      v9 = preferredDisplayCriteria;

      -[AVSecondScreenConnection _postNotification:oldValue:newValue:](self, "_postNotification:oldValue:newValue:", CFSTR("AVSecondScreenConnectionPreferredDisplayCriteriaDidChangeNotification"), v9, v7);
      -[AVSecondScreenConnection _updateReadyToConnect](self, "_updateReadyToConnect");
      v5 = v10;
    }
  }

}

uint64_t __59__AVSecondScreenConnection__updatePreferredDisplayCriteria__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePreferredDisplayCriteriaFromPreparedAssetIfNeeded:", *(_QWORD *)(a1 + 40));
}

void __59__AVSecondScreenConnection__updatePreferredDisplayCriteria__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updatePreferredDisplayCriteriaFromPreparedAssetIfNeeded:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __59__AVSecondScreenConnection__updatePreferredDisplayCriteria__block_invoke_2;
    v3[3] = &unk_1E5BB3D20;
    v2 = *(void **)(a1 + 40);
    v3[4] = *(_QWORD *)(a1 + 32);
    v4 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], v3);

  }
}

- (AVSecondScreenConnection)initWithPlayer:(id)a3 playerLayer:(id)a4
{
  id v7;
  id v8;
  AVSecondScreenConnection *v9;
  AVSecondScreenConnection *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = -[AVSecondScreenConnection init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_player, a3);
    objc_storeWeak((id *)&v10->_playerLayer, v8);
    v10->_requiresTVOutScreen = 1;
    v10->_readyToConnect = -[AVSecondScreenConnection _determineIsReadyToConnect](v10, "_determineIsReadyToConnect");
    -[AVSecondScreenConnection player](v10, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_playing = objc_msgSend(v11, "timeControlStatus") == 2;

  }
  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AVSecondScreenConnection dealloc]";
    v7 = 1024;
    v8 = 77;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVSecondScreenConnection;
  -[AVSecondScreenConnection dealloc](&v4, sel_dealloc);
}

- (UIViewController)contentViewController
{
  -[AVSecondScreenConnection _loadSecondScreenViewControllerIfNeeded](self, "_loadSecondScreenViewControllerIfNeeded");
  return (UIViewController *)-[AVSecondScreenConnection secondScreenViewController](self, "secondScreenViewController");
}

- (AVSecondScreenDebugAssistant)debugAssistant
{
  AVSecondScreenDebugAssistant *v3;
  AVSecondScreenDebugAssistant *debugAssistant;
  void *v5;
  AVSecondScreenDebugAssistant *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  AVSecondScreenDebugAssistant *v10;
  void *v11;

  if (!self->_debugAssistant)
  {
    if (AVSecondScreenDebugHUDEnabled_onceToken != -1)
      dispatch_once(&AVSecondScreenDebugHUDEnabled_onceToken, &__block_literal_global_104);
    if (AVSecondScreenDebugHUDEnabled__Enabled)
    {
      v3 = objc_alloc_init(AVSecondScreenDebugAssistant);
      debugAssistant = self->_debugAssistant;
      self->_debugAssistant = v3;

      -[AVSecondScreenConnection player](self, "player");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = self->_debugAssistant;
        -[AVSecondScreenConnection player](self, "player");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[AVSecondScreenConnection debugInfoPlayer](self, "debugInfoPlayer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
LABEL_10:
          v10 = self->_debugAssistant;
          -[AVSecondScreenConnection secondScreenViewController](self, "secondScreenViewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVSecondScreenDebugAssistant setSecondScreenViewController:](v10, "setSecondScreenViewController:", v11);

          return self->_debugAssistant;
        }
        v6 = self->_debugAssistant;
        -[AVSecondScreenConnection debugInfoPlayer](self, "debugInfoPlayer");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v9 = (void *)v7;
      -[AVSecondScreenDebugAssistant setPlayer:](v6, "setPlayer:", v7);

      goto LABEL_10;
    }
  }
  return self->_debugAssistant;
}

- (void)setPlayerLayer:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playerLayer);

  if (WeakRetained != v4)
  {
    v6 = objc_loadWeakRetained((id *)&self->_playerLayer);
    objc_storeWeak((id *)&self->_playerLayer, v4);
    -[AVSecondScreenConnection secondScreenViewController](self, "secondScreenViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSourcePlayerLayer:", v4);

    _AVLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = "-[AVSecondScreenConnection setPlayerLayer:]";
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s %@ -> %@", (uint8_t *)&v9, 0x20u);
    }

  }
}

- (void)setReadyToConnect:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_readyToConnect != a3)
  {
    v3 = a3;
    self->_readyToConnect = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenConnection _postNotification:oldValue:newValue:](self, "_postNotification:oldValue:newValue:", CFSTR("AVSecondScreenConnectionReadyDidChangeNotification"), v6, v5);

  }
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
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
  void *v15;
  void *v16;
  id v17;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenConnection _postNotification:oldValue:newValue:](self, "_postNotification:oldValue:newValue:", CFSTR("AVSecondScreenConnectionActiveDidChangeNotification"), v5, v6);

    -[AVSecondScreenConnection _updateReadyToConnect](self, "_updateReadyToConnect");
    if (-[AVSecondScreenConnection isActive](self, "isActive"))
    {
      -[AVSecondScreenConnection _loadSecondScreenViewControllerIfNeeded](self, "_loadSecondScreenViewControllerIfNeeded");
      -[AVSecondScreenConnection secondScreenViewController](self, "secondScreenViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVSecondScreenConnection contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContentView:", v8);

      -[AVSecondScreenConnection secondScreenViewController](self, "secondScreenViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVSecondScreenConnection playerLayer](self, "playerLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSourcePlayerLayer:", v10);

      -[AVSecondScreenConnection debugAssistant](self, "debugAssistant");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVSecondScreenConnection secondScreenViewController](self, "secondScreenViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSecondScreenViewController:", v12);

      -[AVSecondScreenConnection secondScreenViewController](self, "secondScreenViewController");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPlayingOnSecondScreen:", 1);

    }
    else
    {
      -[AVSecondScreenConnection debugAssistant](self, "debugAssistant");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSecondScreenViewController:", 0);

      -[AVSecondScreenConnection secondScreenViewController](self, "secondScreenViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPlayingOnSecondScreen:", 0);

      -[AVSecondScreenConnection secondScreenViewController](self, "secondScreenViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSourcePlayerLayer:", 0);

      -[AVSecondScreenConnection secondScreenViewController](self, "secondScreenViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setContentView:", 0);

      -[AVSecondScreenConnection setSecondScreenViewController:](self, "setSecondScreenViewController:", 0);
    }
  }
}

- (void)connectWithScreen:(id)a3 active:(BOOL)a4
{
  _BOOL8 v5;

  if (a3)
  {
    v5 = a4;
    -[AVSecondScreenConnection setConnectedSecondScreen:](self, "setConnectedSecondScreen:");
    -[AVSecondScreenConnection setActive:](self, "setActive:", v5);
  }
  else
  {
    -[AVSecondScreenConnection setActive:](self, "setActive:", 0, a4);
    -[AVSecondScreenConnection setConnectedSecondScreen:](self, "setConnectedSecondScreen:", 0);
  }
}

- (CGSize)videoDisplaySize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (-[AVSecondScreenConnection isActive](self, "isActive"))
  {
    -[AVSecondScreenConnection secondScreenViewController](self, "secondScreenViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "videoDisplaySize");
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v5 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)videoDisplayScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (!-[AVSecondScreenConnection isActive](self, "isActive"))
    return 0.0;
  -[AVSecondScreenConnection secondScreenViewController](self, "secondScreenViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;

  return v6;
}

- (void)_loadSecondScreenViewControllerIfNeeded
{
  void *v3;
  AVSecondScreenViewController *v4;
  void *v5;
  id v6;

  -[AVSecondScreenConnection secondScreenViewController](self, "secondScreenViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(AVSecondScreenViewController);
    -[AVSecondScreenConnection setSecondScreenViewController:](self, "setSecondScreenViewController:", v4);

    -[AVSecondScreenConnection secondScreenViewController](self, "secondScreenViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenConnection connectedSecondScreen](self, "connectedSecondScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneBounds");
    objc_msgSend(v6, "setInitialScreenBoundsHint:");

  }
}

- (void)_startObservingPlayer
{
  void *v3;
  AVObservationController *v4;
  AVObservationController *observationController;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  -[AVSecondScreenConnection player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
    observationController = self->_observationController;
    self->_observationController = v4;

    v16[0] = CFSTR("allowsExternalPlayback");
    v16[1] = CFSTR("externalPlaybackActive");
    v16[2] = CFSTR("airPlayVideoActive");
    v16[3] = CFSTR("currentItem.status");
    v16[4] = CFSTR("currentItem.hasVideo");
    v16[5] = CFSTR("usesExternalPlaybackWhileExternalScreenIsActive");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenConnection observationController](self, "observationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenConnection player](self, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "startObserving:keyPaths:observationHandler:", v8, v6, &__block_literal_global_18230);

    -[AVSecondScreenConnection observationController](self, "observationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenConnection player](self, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v10, "startObserving:keyPath:observationHandler:", v11, CFSTR("timeControlStatus"), &__block_literal_global_32_18232);

    -[AVSecondScreenConnection observationController](self, "observationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenConnection player](self, "player");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v13, "startObserving:keyPath:observationHandler:", v14, CFSTR("currentItem.asset"), &__block_literal_global_35);

    -[AVSecondScreenConnection _updatePreferredDisplayCriteria](self, "_updatePreferredDisplayCriteria");
  }
}

- (void)_updateReadyToConnect
{
  -[AVSecondScreenConnection setReadyToConnect:](self, "setReadyToConnect:", -[AVSecondScreenConnection _determineIsReadyToConnect](self, "_determineIsReadyToConnect"));
}

- (BOOL)_determineIsReadyToConnect
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[AVSecondScreenConnection player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[AVSecondScreenConnection contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = 1;
      goto LABEL_10;
    }
  }
  -[AVSecondScreenConnection player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4
    && -[AVSecondScreenConnection _allowsNonAirPlayExternalPlayback](self, "_allowsNonAirPlayExternalPlayback")
    && -[AVSecondScreenConnection _currentItemIsReadyToPlayVideoOrLoadingWhileActive](self, "_currentItemIsReadyToPlayVideoOrLoadingWhileActive");

  if (!v3)
  {
    v6 = 0;
LABEL_10:

  }
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "NO";
    v10 = 136315650;
    v11 = "-[AVSecondScreenConnection _determineIsReadyToConnect]";
    v13 = "readyToConnect";
    v12 = 2080;
    if (v5)
      v8 = "YES";
    v14 = 2080;
    v15 = v8;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v10, 0x20u);
  }

  return v5;
}

- (BOOL)_allowsNonAirPlayExternalPlayback
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[AVSecondScreenConnection player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  -[AVSecondScreenConnection player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "allowsExternalPlayback")
      && objc_msgSend(v6, "usesExternalPlaybackWhileExternalScreenIsActive"))
    {
      if (objc_msgSend(v6, "isExternalPlaybackActive"))
        v4 = objc_msgSend(v6, "externalPlaybackType") != 1;
      else
        v4 = 1;
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (BOOL)_currentItemIsReadyToPlayVideoOrLoadingWhileActive
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AVSecondScreenConnection player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_6;
  v5 = objc_msgSend(v4, "status");
  if (v5 == 2)
    goto LABEL_6;
  if (v5 == 1)
  {
    if (!-[AVSecondScreenConnection isActive](self, "isActive"))
    {
      if ((objc_msgSend(v4, "hasVideo") & 1) == 0)
      {
LABEL_6:
        v6 = 0;
        goto LABEL_10;
      }
      goto LABEL_9;
    }
LABEL_8:
    v6 = 1;
    goto LABEL_10;
  }
  if (-[AVSecondScreenConnection isActive](self, "isActive"))
    goto LABEL_8;
LABEL_9:
  -[AVSecondScreenConnection preferredDisplayCriteria](self, "preferredDisplayCriteria");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7 != 0;

LABEL_10:
  _AVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = "NO";
    v11 = 136315650;
    v12 = "-[AVSecondScreenConnection _currentItemIsReadyToPlayVideoOrLoadingWhileActive]";
    v14 = "isReadyToPlayOrLoadingWhileActive";
    v13 = 2080;
    if (v6)
      v9 = "YES";
    v15 = 2080;
    v16 = v9;
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v11, 0x20u);
  }

  return v6;
}

- (AVPlayerLayer)playerLayer
{
  return (AVPlayerLayer *)objc_loadWeakRetained((id *)&self->_playerLayer);
}

- (AVSecondScreen)connectedSecondScreen
{
  return (AVSecondScreen *)objc_loadWeakRetained((id *)&self->_connectedSecondScreen);
}

- (void)setConnectedSecondScreen:(id)a3
{
  objc_storeWeak((id *)&self->_connectedSecondScreen, a3);
}

- (BOOL)requiresTVOutScreen
{
  return self->_requiresTVOutScreen;
}

- (AVDisplayCriteria)preferredDisplayCriteria
{
  return self->_preferredDisplayCriteria;
}

- (AVPlayer)debugInfoPlayer
{
  return self->_debugInfoPlayer;
}

- (CGSize)maximumVideoResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumVideoResolution.width;
  height = self->_maximumVideoResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaximumVideoResolution:(CGSize)a3
{
  self->_maximumVideoResolution = a3;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (AVSecondScreenViewController)secondScreenViewController
{
  return self->_secondScreenViewController;
}

- (void)setSecondScreenViewController:(id)a3
{
  objc_storeStrong((id *)&self->_secondScreenViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondScreenViewController, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_debugInfoPlayer, 0);
  objc_storeStrong((id *)&self->_preferredDisplayCriteria, 0);
  objc_destroyWeak((id *)&self->_connectedSecondScreen);
  objc_destroyWeak((id *)&self->_playerLayer);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_debugAssistant, 0);
}

uint64_t __49__AVSecondScreenConnection__startObservingPlayer__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updatePreferredDisplayCriteria");
}

void __49__AVSecondScreenConnection__startObservingPlayer__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "player");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPlaying:", objc_msgSend(v3, "timeControlStatus") == 2);

}

uint64_t __49__AVSecondScreenConnection__startObservingPlayer__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateReadyToConnect");
}

@end
