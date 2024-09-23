@implementation AVNowPlayingInfoController

- (AVNowPlayingInfoController)init
{
  NSObject *v3;
  AVNowPlayingInfoController *v4;
  AVNowPlayingInfoController *v5;
  AVObservationController *v6;
  AVObservationController *keyValueObservationController;
  void *v8;
  void *v9;
  uint64_t v10;
  id playerControllerCurrentTimeJumpedObserver;
  id v13;
  _QWORD v14[4];
  id v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  AVNowPlayingInfoController *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[AVNowPlayingInfoController init]";
    v19 = 1024;
    v20 = 83;
    v21 = 2048;
    v22 = self;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v16.receiver = self;
  v16.super_class = (Class)AVNowPlayingInfoController;
  v4 = -[AVNowPlayingInfoController init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_suspended = 0;
    v4->_enabled = 1;
    v6 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v4);
    keyValueObservationController = v5->_keyValueObservationController;
    v5->_keyValueObservationController = v6;

    objc_initWeak((id *)buf, v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __34__AVNowPlayingInfoController_init__block_invoke;
    v14[3] = &unk_1E5BB2A70;
    objc_copyWeak(&v15, (id *)buf);
    objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("AVPlayerControllerCurrentTimeJumpedNotification"), 0, v9, v14);
    v10 = objc_claimAutoreleasedReturnValue();
    playerControllerCurrentTimeJumpedObserver = v5->_playerControllerCurrentTimeJumpedObserver;
    v5->_playerControllerCurrentTimeJumpedObserver = (id)v10;

    objc_copyWeak(&v13, (id *)buf);
    v5->_commandHandlerIdentifier = (void *)MRMediaRemoteAddCommandHandlerBlock();
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  AVObservationController *keyValueObservationController;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  AVNowPlayingInfoController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_commandHandlerIdentifier)
    MRMediaRemoteRemoveCommandHandlerBlock();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_playerControllerCurrentTimeJumpedObserver);

  -[AVObservationController stopAllObservation](self->_keyValueObservationController, "stopAllObservation");
  keyValueObservationController = self->_keyValueObservationController;
  self->_keyValueObservationController = 0;

  -[AVNowPlayingInfoController _updateNowPlayingInfo:commandsAndStates:](self, "_updateNowPlayingInfo:commandsAndStates:", 0, 0);
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "-[AVNowPlayingInfoController dealloc]";
    v9 = 1024;
    v10 = 129;
    v11 = 2048;
    v12 = self;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v6.receiver = self;
  v6.super_class = (Class)AVNowPlayingInfoController;
  -[AVNowPlayingInfoController dealloc](&v6, sel_dealloc);
}

- (void)setPlayerController:(id)a3
{
  AVPlayerController *v5;
  NSObject *v6;
  void *v7;
  id v8;
  AVObservationController *keyValueObservationController;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AVObservationController *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[10];
  _QWORD v18[6];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  AVPlayerController *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (AVPlayerController *)a3;
  if (self->_playerController != v5)
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[AVNowPlayingInfoController setPlayerController:]";
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s playerController: %@", buf, 0x16u);
    }

    -[AVObservationController stopAllObservation](self->_keyValueObservationController, "stopAllObservation");
    objc_storeStrong((id *)&self->_playerController, a3);
    if (self->_playerController)
    {
      v18[0] = CFSTR("playerController.hasContent");
      v18[1] = CFSTR("playerController.contentDuration");
      v18[2] = CFSTR("playerController.playing");
      v18[3] = CFSTR("playerController.rate");
      v18[4] = CFSTR("playerController.metadata");
      v18[5] = CFSTR("playerController.hasLiveStreamingContent");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[AVObservationController startObserving:keyPaths:observationHandler:](self->_keyValueObservationController, "startObserving:keyPaths:observationHandler:", self, v7, &__block_literal_global_37_4202);
      keyValueObservationController = self->_keyValueObservationController;
      -[AVNowPlayingInfoController playerController](self, "playerController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "player");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](keyValueObservationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerItemAVKitDataDidChangeNotification"), v12, 0, &__block_literal_global_39);

      -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](self->_keyValueObservationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerControllerSelectedMediaOptionDidChangeNotification"), 0, 0, &__block_literal_global_40_4203);
      v17[0] = CFSTR("playerController.canPause");
      v17[1] = CFSTR("playerController.canPlay");
      v17[2] = CFSTR("playerController.canTogglePlayback");
      v17[3] = CFSTR("playerController.canSeek");
      v17[4] = CFSTR("playerController.canScanForward");
      v17[5] = CFSTR("playerController.canScanBackward");
      v17[6] = CFSTR("playerController.canSeekChapterForward");
      v17[7] = CFSTR("playerController.canSeekChapterBackward");
      v17[8] = CFSTR("playerController.audioMediaSelectionOptions");
      v17[9] = CFSTR("playerController.legibleMediaSelectionOptions");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_keyValueObservationController;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __50__AVNowPlayingInfoController_setPlayerController___block_invoke_4;
      v16[3] = &unk_1E5BB1010;
      v16[4] = self;
      v15 = -[AVObservationController startObserving:keyPaths:observationHandler:](v14, "startObserving:keyPaths:observationHandler:", self, v13, v16);

    }
    -[AVNowPlayingInfoController _setNowPlayingInfoNeedsUpdate](self, "_setNowPlayingInfoNeedsUpdate");
  }

}

- (void)setSuspended:(BOOL)a3
{
  if (self->_suspended != a3)
  {
    self->_suspended = a3;
    if (!a3)
      -[AVNowPlayingInfoController _setNowPlayingInfoNeedsUpdate](self, "_setNowPlayingInfoNeedsUpdate");
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[AVNowPlayingInfoController _setNowPlayingInfoNeedsUpdate](self, "_setNowPlayingInfoNeedsUpdate");
  }
}

- (void)setOverrideParentApplicationDisplayIdentifier:(id)a3
{
  NSString *v4;
  NSString *overrideParentApplicationDisplayIdentifier;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_overrideParentApplicationDisplayIdentifier, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    overrideParentApplicationDisplayIdentifier = self->_overrideParentApplicationDisplayIdentifier;
    self->_overrideParentApplicationDisplayIdentifier = v4;

    MRMediaRemoteGetLocalOrigin();
    if (self->_overrideParentApplicationDisplayIdentifier)
    {
      MRMediaRemoteSetParentApplication();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      MRMediaRemoteSetParentApplication();

    }
  }

}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
  if (self->_requiresLinearPlayback != a3)
  {
    self->_requiresLinearPlayback = a3;
    -[AVNowPlayingInfoController _setNowPlayingInfoNeedsUpdate](self, "_setNowPlayingInfoNeedsUpdate");
  }
}

- (void)startNowPlayingUpdatesForPlayerController:(id)a3 afterDelay:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[AVNowPlayingInfoController startNowPlayingUpdatesForPlayerController:afterDelay:]";
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s playerController: %@", buf, 0x16u);
  }

  -[AVNowPlayingInfoController playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v8))
  {

  }
  else
  {
    -[AVNowPlayingInfoController playerControllerToActivateAfterDelay](self, "playerControllerToActivateAfterDelay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isEqual:", v9);

    if ((v10 & 1) == 0)
    {
      -[AVNowPlayingInfoController setPlayerControllerToActivateAfterDelay:](self, "setPlayerControllerToActivateAfterDelay:", v6);
      -[AVNowPlayingInfoController playerController](self, "playerController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVNowPlayingInfoController stopNowPlayingUpdatesForPlayerController:](self, "stopNowPlayingUpdatesForPlayerController:", v11);

      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v6);
      -[AVNowPlayingInfoController startNowPlayingUpdatesTimer](self, "startNowPlayingUpdatesTimer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invalidate");

      v13 = (void *)MEMORY[0x1E0C99E88];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __83__AVNowPlayingInfoController_startNowPlayingUpdatesForPlayerController_afterDelay___block_invoke;
      v15[3] = &unk_1E5BB1038;
      objc_copyWeak(&v16, (id *)buf);
      objc_copyWeak(&v17, &location);
      objc_msgSend(v13, "scheduledTimerWithTimeInterval:repeats:block:", 0, v15, a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVNowPlayingInfoController setStartNowPlayingUpdatesTimer:](self, "setStartNowPlayingUpdatesTimer:", v14);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
  }

}

- (void)stopNowPlayingUpdatesForPlayerController:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[AVNowPlayingInfoController stopNowPlayingUpdatesForPlayerController:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s playerController: %@", (uint8_t *)&v10, 0x16u);
  }

  if (!v4
    || (-[AVNowPlayingInfoController playerController](self, "playerController"),
        v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == v4))
  {
    -[AVNowPlayingInfoController setPlayerController:](self, "setPlayerController:", 0);
  }
  -[AVNowPlayingInfoController playerControllerToActivateAfterDelay](self, "playerControllerToActivateAfterDelay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if (v8)
  {
    -[AVNowPlayingInfoController startNowPlayingUpdatesTimer](self, "startNowPlayingUpdatesTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[AVNowPlayingInfoController setPlayerControllerToActivateAfterDelay:](self, "setPlayerControllerToActivateAfterDelay:", 0);
  }

}

- (id)_createNowPlayingInfoFromPlaybackInfo:(id)a3
{
  void *v3;
  UIImage *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AVNowPlayingInfoMetadataCommonKeyArtworkImage"));
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = *MEMORY[0x1E0D4C990];
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C990]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        UIImagePNGRepresentation(v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v5);

      }
      objc_msgSend(v3, "removeObjectForKey:", CFSTR("AVNowPlayingInfoMetadataCommonKeyArtworkImage"));
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_setNowPlayingInfoNeedsUpdate
{
  if (!self->_nowPlayingInfoNeedsUpdate && !-[AVNowPlayingInfoController isSuspended](self, "isSuspended"))
  {
    self->_nowPlayingInfoNeedsUpdate = 1;
    -[AVNowPlayingInfoController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateNowPlayingInfoIfNeeded, 0, 0.0);
  }
}

- (void)_updateNowPlayingInfoIfNeeded
{
  NSObject *v3;
  _BOOL4 nowPlayingInfoNeedsUpdate;
  _BOOL4 suspended;
  _BOOL4 enabled;
  void *v7;
  void *v8;
  void *v9;
  NSObject *backgroundQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    nowPlayingInfoNeedsUpdate = self->_nowPlayingInfoNeedsUpdate;
    suspended = self->_suspended;
    enabled = self->_enabled;
    *(_DWORD *)buf = 67109632;
    v17 = nowPlayingInfoNeedsUpdate;
    v18 = 1024;
    v19 = suspended;
    v20 = 1024;
    v21 = enabled;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "Update now playing info:   needed: %d   suspended: %d   enabled: %d", buf, 0x14u);
  }

  if (self->_nowPlayingInfoNeedsUpdate)
  {
    self->_nowPlayingInfoNeedsUpdate = 0;
    if (!-[AVNowPlayingInfoController isSuspended](self, "isSuspended"))
    {
      kdebug_trace();
      self->_nowPlayingInfoNeedsUpdate = 0;
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateNowPlayingInfoIfNeeded, 0);
      -[AVNowPlayingInfoController _makePlaybackInfoDictionary](self, "_makePlaybackInfoDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[AVNowPlayingInfoController isEnabled](self, "isEnabled"))
      {
        -[AVNowPlayingInfoController playerController](self, "playerController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVNowPlayingInfoController _makeCommandsAndStatesDictionaryForPlayerController:](self, "_makeCommandsAndStatesDictionaryForPlayerController:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[AVNowPlayingInfoController _makeCommandsAndStatesDictionaryForPlayerController:](self, "_makeCommandsAndStatesDictionaryForPlayerController:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      backgroundQueue = self->_backgroundQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__AVNowPlayingInfoController__updateNowPlayingInfoIfNeeded__block_invoke;
      block[3] = &unk_1E5BB3B00;
      block[4] = self;
      v14 = v7;
      v15 = v9;
      v11 = v9;
      v12 = v7;
      dispatch_async(backgroundQueue, block);
      kdebug_trace();

    }
  }
}

- (void)_updateNowPlayingInfo:(id)a3 commandsAndStates:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "count"))
    MRMediaRemoteSetCanBeNowPlayingApplication();
  MRMediaRemoteSetNowPlayingInfoWithMergePolicy();
  -[AVNowPlayingInfoController _updateRegisteredRemoteCommandEnabledStatesWithCommandsAndStates:](self, "_updateRegisteredRemoteCommandEnabledStatesWithCommandsAndStates:", v6);

}

- (id)_makePlaybackInfoDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  const void *ExternalRepresentation;
  void *v15;
  uint64_t v16;
  const void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
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
  void *v34;
  void *v36;

  if (-[AVNowPlayingInfoController isEnabled](self, "isEnabled"))
  {
    -[AVNowPlayingInfoController playerController](self, "playerController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVNowPlayingInfoController playerController](self, "playerController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "hasContent"))
      {
        objc_msgSend(v4, "metadata");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A880]);
        v6 = objc_claimAutoreleasedReturnValue();
        if (v6)
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D4C980]);
        objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A888]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("AVNowPlayingInfoMetadataCommonKeyArtworkImage"));
        objc_msgSend(v4, "contentDurationWithinEndTimes");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D4CA18]);

        objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A8C0]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D4CB40]);
        v10 = (id)*MEMORY[0x1E0D4CB78];
        v36 = (void *)v6;
        if ((objc_msgSend(v4, "hasEnabledVideo") & 1) == 0 && objc_msgSend(v4, "hasEnabledAudio"))
        {
          v11 = (id)*MEMORY[0x1E0D4CB70];

          v10 = v11;
        }
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D4CAA0]);
        -[AVNowPlayingInfoController _availableLanguageOptions](self, "_availableLanguageOptions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13)
        {
          -[AVNowPlayingInfoController _availableLanguageOptions](self, "_availableLanguageOptions");
          ExternalRepresentation = (const void *)MRLanguageOptionGroupsCreateExternalRepresentation();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", ExternalRepresentation, *MEMORY[0x1E0D4C9C0]);
          CFRelease(ExternalRepresentation);
        }
        -[AVNowPlayingInfoController _currentLanguageOptions](self, "_currentLanguageOptions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v16)
        {
          -[AVNowPlayingInfoController _currentLanguageOptions](self, "_currentLanguageOptions");
          v17 = (const void *)MRLanguageOptionsCreateExternalRepresentation();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D4C9F0]);
          CFRelease(v17);
        }
        v18 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "timing");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "currentValue");
        v21 = v20;
        objc_msgSend(v4, "minTime");
        objc_msgSend(v18, "numberWithDouble:", v21 - v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D4CA20]);

        v24 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "rate");
        objc_msgSend(v24, "numberWithDouble:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D4CAB0]);

        objc_msgSend(v4, "currentDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D4C9F8]);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "hasLiveStreamingContent"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D4CA58]);

        -[AVNowPlayingInfoController playerController](self, "playerController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "player");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "currentItem");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "externalMetadata");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v31, "count"))
        {
          __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(v3, (uint64_t)v31, (uint64_t)CFSTR("avkt/ExternalContentIdentifier"), *MEMORY[0x1E0D4CA30]);
          __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(v3, (uint64_t)v31, (uint64_t)CFSTR("avkt/ExternalUserProfileIdentifier"), *MEMORY[0x1E0D4CA38]);
          __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(v3, (uint64_t)v31, (uint64_t)CFSTR("avkt/ServiceIdentifier"), *MEMORY[0x1E0D4CB00]);
          __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(v3, (uint64_t)v31, (uint64_t)CFSTR("avkt/iTunesStoreIdentifier"), *MEMORY[0x1E0D4CB88]);
          __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(v3, (uint64_t)v31, (uint64_t)CFSTR("avkt/BrandIdentifier"), *MEMORY[0x1E0D4C9C8]);
          __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(v3, (uint64_t)v31, (uint64_t)CFSTR("avkt/PlaybackProgress"), *MEMORY[0x1E0D4CAA8]);
          __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(v3, (uint64_t)v31, *MEMORY[0x1E0C8A870], *MEMORY[0x1E0D4CB40]);
          objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:filteredByIdentifier:", v31, *MEMORY[0x1E0C8A830]);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "dataValue");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D4C990]);

        }
      }

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_makeCommandsAndStatesDictionaryForPlayerController:(id)a3
{
  void *v3;
  id v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _BOOL8 v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
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
  _QWORD v54[16];
  _QWORD v55[18];

  v55[16] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[AVNowPlayingInfoController requiresLinearPlayback](self, "requiresLinearPlayback");
  v54[0] = &unk_1E5BF3570;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "canPause"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v53;
  v54[1] = &unk_1E5BF3588;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "canPlay"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v52;
  v54[2] = &unk_1E5BF35A0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "canPause"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v51;
  v54[3] = &unk_1E5BF35B8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "canTogglePlayback"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v50;
  v54[4] = &unk_1E5BF35D0;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  if (v6)
    v8 = 0;
  else
    v8 = objc_msgSend(v5, "hasContent");
  objc_msgSend(v7, "numberWithInt:", v8);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v49;
  v54[5] = &unk_1E5BF35E8;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  if (v6)
    v10 = 0;
  else
    v10 = objc_msgSend(v5, "hasContent");
  objc_msgSend(v9, "numberWithInt:", v10);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v48;
  v54[6] = &unk_1E5BF3600;
  v11 = (void *)MEMORY[0x1E0CB37E8];
  if (v6)
    v12 = 0;
  else
    v12 = objc_msgSend(v5, "hasContent");
  objc_msgSend(v11, "numberWithInt:", v12);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v47;
  v54[7] = &unk_1E5BF3618;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  if (v6)
    v14 = 0;
  else
    v14 = objc_msgSend(v5, "hasContent");
  objc_msgSend(v13, "numberWithInt:", v14);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v46;
  v54[8] = &unk_1E5BF3630;
  v15 = (void *)MEMORY[0x1E0CB37E8];
  if (v6)
    v16 = 0;
  else
    v16 = objc_msgSend(v5, "canTogglePlayback");
  objc_msgSend(v15, "numberWithInt:", v16);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[8] = v45;
  v54[9] = &unk_1E5BF3648;
  v17 = (void *)MEMORY[0x1E0CB37E8];
  if (v6)
    v18 = 0;
  else
    v18 = objc_msgSend(v5, "canSeek");
  objc_msgSend(v17, "numberWithInt:", v18);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v55[9] = v44;
  v54[10] = &unk_1E5BF3660;
  v19 = (void *)MEMORY[0x1E0CB37E8];
  if (v6)
  {
    v20 = 0;
  }
  else if ((objc_msgSend(v5, "canSeekChapterForward") & 1) != 0)
  {
    v20 = 1;
  }
  else
  {
    v20 = objc_msgSend(v5, "canScanForward");
  }
  objc_msgSend(v19, "numberWithInt:", v20);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[10] = v43;
  v54[11] = &unk_1E5BF3678;
  v21 = (void *)MEMORY[0x1E0CB37E8];
  if (v6)
  {
    v22 = 0;
  }
  else if ((objc_msgSend(v5, "canSeekChapterBackward") & 1) != 0)
  {
    v22 = 1;
  }
  else
  {
    v22 = objc_msgSend(v5, "canScanBackward");
  }
  objc_msgSend(v21, "numberWithInt:", v22);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55[11] = v42;
  v54[12] = &unk_1E5BF3690;
  v23 = (void *)MEMORY[0x1E0CB37E8];
  if (v6)
    v24 = 0;
  else
    v24 = objc_msgSend(v5, "canSeek");
  objc_msgSend(v23, "numberWithInt:", v24);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[12] = v41;
  v54[13] = &unk_1E5BF36A8;
  v25 = (void *)MEMORY[0x1E0CB37E8];
  if (v6)
    v26 = 0;
  else
    v26 = objc_msgSend(v5, "canSeek");
  objc_msgSend(v25, "numberWithInt:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v55[13] = v27;
  v54[14] = &unk_1E5BF36C0;
  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "audioMediaSelectionOptions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");
  if (v30)
  {
    v31 = 1;
  }
  else
  {
    objc_msgSend(v5, "legibleMediaSelectionOptions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v40, "count") != 0;
  }
  objc_msgSend(v28, "numberWithInt:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v55[14] = v32;
  v54[15] = &unk_1E5BF36D8;
  v33 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "audioMediaSelectionOptions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");
  if (v35)
  {
    v36 = 1;
  }
  else
  {
    objc_msgSend(v5, "legibleMediaSelectionOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v3, "count") != 0;
  }
  objc_msgSend(v33, "numberWithInt:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[15] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 16);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  if (!v30)

  return v38;
}

- (void)_updateRegisteredRemoteCommandEnabledStatesWithCommandsAndStates:(id)a3
{
  id v4;
  NSObject *backgroundQueue;
  __CFArray *Mutable;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD block[5];
  id v21;
  uint64_t v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    backgroundQueue = self->_backgroundQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__AVNowPlayingInfoController__updateRegisteredRemoteCommandEnabledStatesWithCommandsAndStates___block_invoke;
    block[3] = &unk_1E5BB3D20;
    block[4] = self;
    v21 = v4;
    dispatch_async(backgroundQueue, block);

  }
  else
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      v10 = *MEMORY[0x1E0D4C7F0];
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
          v13 = (const void *)MRMediaRemoteCommandInfoCreate();
          objc_msgSend(v12, "unsignedIntValue");
          MRMediaRemoteCommandInfoSetCommand();
          objc_msgSend(v4, "objectForKeyedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "BOOLValue");
          MRMediaRemoteCommandInfoSetEnabled();

          if (objc_msgSend(v12, "unsignedIntegerValue") == 17 || objc_msgSend(v12, "unsignedIntegerValue") == 18)
          {
            v22 = v10;
            v23 = &unk_1E5BF3F30;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
            MRMediaRemoteCommandInfoSetOptions();
          }
          CFArrayAppendValue(Mutable, v13);
          CFRelease(v13);
          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v8);
    }

    MRMediaRemoteGetLocalOrigin();
    MRMediaRemoteSetSupportedCommands();
    CFRelease(Mutable);
  }

}

- (unsigned)_handleRemoteCommand:(unsigned int)a3 options:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void **v24;
  const __CFString **v25;
  NSObject *v26;
  double v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  int v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void **v43;
  const __CFString **v44;
  NSObject *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  char v54;
  id v55;
  NSObject *v56;
  int v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  const __CFString *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  uint8_t buf[4];
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[AVNowPlayingInfoController isEnabled](self, "isEnabled"))
  {
    -[AVNowPlayingInfoController playerController](self, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = 0;
      switch(a3)
      {
        case 0u:
          _AVLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "Play command", buf, 2u);
          }

          if (!objc_msgSend(v7, "canPlay"))
            goto LABEL_85;
          objc_msgSend(v7, "play:", 0);
          goto LABEL_102;
        case 1u:
          _AVLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "Pause command", buf, 2u);
          }

          if (!objc_msgSend(v7, "canPause"))
            goto LABEL_85;
          objc_msgSend(v7, "pause:", 0);
          goto LABEL_102;
        case 2u:
          _AVLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "Toggle play pause command", buf, 2u);
          }

          if (!objc_msgSend(v7, "canTogglePlayback"))
            goto LABEL_85;
          objc_msgSend(v7, "togglePlayback:", 0);
          goto LABEL_102;
        case 3u:
          _AVLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "Stop command", buf, 2u);
          }

          if (objc_msgSend(v7, "canPause"))
          {
            objc_msgSend(v7, "pause:", 0);
            v8 = 0;
          }
          else
          {
            v8 = 2;
          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "postNotificationName:object:", CFSTR("AVNowPlayingInfoControllerDidReceiveStopCommandEventNotification"), self);
          goto LABEL_75;
        case 4u:
          _AVLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "Next track command", buf, 2u);
          }

          if (objc_msgSend(v7, "canSeekChapterForward"))
          {
            objc_msgSend(v7, "seekChapterForward:", 0);
            goto LABEL_102;
          }
          if (!objc_msgSend(v7, "canSeek"))
            goto LABEL_85;
          _AVLog();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v73 = 0x4024000000000000;
            _os_log_impl(&dword_1AC4B1000, v39, OS_LOG_TYPE_DEFAULT, "Can not seek chapter forward; skipping forward %.2f seconds instead.",
              buf,
              0xCu);
          }

          objc_msgSend(v7, "seekByTimeInterval:", 10.0);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = CFSTR("AVNowPlayingInfoSkipCommandDirectionKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v41;
          v42 = (void *)MEMORY[0x1E0C99D80];
          v43 = &v71;
          v44 = &v70;
          goto LABEL_84;
        case 5u:
          _AVLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_DEFAULT, "Previous track command", buf, 2u);
          }

          if (objc_msgSend(v7, "canSeekChapterBackward"))
          {
            objc_msgSend(v7, "seekChapterBackward:", 0);
            goto LABEL_102;
          }
          if (!objc_msgSend(v7, "canSeek"))
          {
LABEL_85:
            v8 = 2;
            goto LABEL_103;
          }
          _AVLog();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v73 = 0x4024000000000000;
            _os_log_impl(&dword_1AC4B1000, v45, OS_LOG_TYPE_DEFAULT, "Can not seek chapter backward; skipping backward %.2f seconds instead.",
              buf,
              0xCu);
          }

          objc_msgSend(v7, "seekByTimeInterval:", -10.0);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = CFSTR("AVNowPlayingInfoSkipCommandDirectionKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v41;
          v42 = (void *)MEMORY[0x1E0C99D80];
          v43 = &v69;
          v44 = &v68;
LABEL_84:
          objc_msgSend(v42, "dictionaryWithObjects:forKeys:count:", v43, v44, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "postNotificationName:object:userInfo:", CFSTR("AVNowPlayingInfoControllerDidReceiveSkipCommandEventNotification"), self, v46);

          goto LABEL_102;
        case 8u:
          _AVLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v15, OS_LOG_TYPE_DEFAULT, "Begin fast forward command", buf, 2u);
          }

          if (!objc_msgSend(v7, "hasContent"))
            goto LABEL_85;
          objc_msgSend(v7, "beginScanningForward:", 0);
          goto LABEL_102;
        case 9u:
          _AVLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v16, OS_LOG_TYPE_DEFAULT, "End fast forward command", buf, 2u);
          }

          objc_msgSend(v7, "endScanningForward:", 0);
          goto LABEL_102;
        case 0xAu:
          _AVLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v17, OS_LOG_TYPE_DEFAULT, "Begin rewind command", buf, 2u);
          }

          if (!objc_msgSend(v7, "hasContent"))
            goto LABEL_85;
          objc_msgSend(v7, "beginScanningBackward:", 0);
          goto LABEL_102;
        case 0xBu:
          _AVLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v18, OS_LOG_TYPE_DEFAULT, "End rewind command", buf, 2u);
          }

          objc_msgSend(v7, "endScanningBackward:", 0);
          goto LABEL_102;
        case 0x11u:
          _AVLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v19, OS_LOG_TYPE_DEFAULT, "Skip forward command", buf, 2u);
          }

          objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CCF0]);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 2;
          if (!objc_msgSend(v7, "canSeek") || !v20)
            goto LABEL_75;
          objc_msgSend(v20, "doubleValue");
          objc_msgSend(v7, "seekByTimeInterval:");
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = CFSTR("AVNowPlayingInfoSkipCommandDirectionKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v22;
          v23 = (void *)MEMORY[0x1E0C99D80];
          v24 = &v67;
          v25 = &v66;
          goto LABEL_53;
        case 0x12u:
          _AVLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v26, OS_LOG_TYPE_DEFAULT, "Skip backward command", buf, 2u);
          }

          objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CCF0]);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 2;
          if (!objc_msgSend(v7, "canSeek") || !v20)
            goto LABEL_75;
          objc_msgSend(v20, "doubleValue");
          objc_msgSend(v7, "seekByTimeInterval:", -v27);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = CFSTR("AVNowPlayingInfoSkipCommandDirectionKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v22;
          v23 = (void *)MEMORY[0x1E0C99D80];
          v24 = &v65;
          v25 = &v64;
LABEL_53:
          objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("AVNowPlayingInfoControllerDidReceiveSkipCommandEventNotification"), self, v28);

          v8 = 0;
LABEL_75:

          goto LABEL_103;
        case 0x13u:
          _AVLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v29, OS_LOG_TYPE_DEFAULT, "Change playback rate command", buf, 2u);
          }

          objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC48]);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "canTogglePlayback"))
          {
            objc_msgSend(v30, "doubleValue");
            objc_msgSend(v7, "setRate:");
LABEL_63:
            v8 = 0;
          }
          else
          {
            v8 = 2;
          }
          goto LABEL_112;
        case 0x18u:
          _AVLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v31, OS_LOG_TYPE_DEFAULT, "Seek to playback position command", buf, 2u);
          }

          objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC28]);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 2;
          if (!objc_msgSend(v7, "canSeek") || !v30)
            goto LABEL_112;
          objc_msgSend(v30, "doubleValue");
          objc_msgSend(v7, "seekToTime:");
          goto LABEL_63;
        case 0x1Bu:
          _AVLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v32, OS_LOG_TYPE_DEFAULT, "Enable language option command", buf, 2u);
          }

          objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC20]);
          v33 = MRLanguageOptionCreateFromExternalRepresentation();
          MRLanguageOptionCopyIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = MEMORY[0x1AF43E2C8](v33);
          if (v34 == 1)
            objc_msgSend(v7, "legibleMediaSelectionOptions");
          else
            objc_msgSend(v7, "audioMediaSelectionOptions");
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v47 = (id)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
          if (!v48)
          {
            v8 = 2;
            v55 = v47;
            goto LABEL_110;
          }
          v49 = v48;
          v58 = v34;
          v50 = *(_QWORD *)v60;
          break;
        case 0x1Cu:
          _AVLog();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC4B1000, v35, OS_LOG_TYPE_DEFAULT, "Disable language option command", buf, 2u);
          }

          objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC20]);
          v36 = MRLanguageOptionCreateFromExternalRepresentation();
          v37 = MEMORY[0x1AF43E2C8]();
          if (!v36)
            goto LABEL_85;
          if (v37 == 1)
          {
            objc_msgSend(MEMORY[0x1E0C8B200], "avkit_offOption");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setCurrentLegibleMediaSelectionOption:", v38);

          }
          else
          {
            objc_msgSend(v7, "setCurrentAudioMediaSelectionOption:", 0);
          }
          goto LABEL_102;
        default:
          goto LABEL_103;
      }
LABEL_90:
      v51 = 0;
      while (1)
      {
        if (*(_QWORD *)v60 != v50)
          objc_enumerationMutation(v47);
        v52 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v51);
        objc_msgSend(v52, "mediaRemoteIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "isEqualToString:", v30);

        if ((v54 & 1) != 0)
          break;
        if (v49 == ++v51)
        {
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
          if (!v49)
          {
            v8 = 2;
            v55 = v47;
            goto LABEL_110;
          }
          goto LABEL_90;
        }
      }
      v55 = v52;

      if (!v55)
      {
        v8 = 2;
        goto LABEL_111;
      }
      if (v58 == 1)
        objc_msgSend(v7, "setCurrentLegibleMediaSelectionOption:", v55);
      else
        objc_msgSend(v7, "setCurrentAudioMediaSelectionOption:", v55);
      v8 = 0;
LABEL_110:

LABEL_111:
LABEL_112:

    }
    else
    {
LABEL_102:
      v8 = 0;
    }
LABEL_103:

  }
  else
  {
    v8 = 0;
  }
  _AVLog();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v73 = v8;
    _os_log_impl(&dword_1AC4B1000, v56, OS_LOG_TYPE_DEFAULT, "Remote Command Status: %ld", buf, 0xCu);
  }

  return v8;
}

- (id)_availableLanguageOptions
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[AVNowPlayingInfoController playerController](self, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioMediaSelectionOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_msgSend((id)objc_opt_class(), "_createMediaRemoteLanguageOptionGroupWithAVMediaSelectionOptions:", v4);
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v3, "addObject:", v5);

    }
  }
  objc_msgSend(v2, "legibleMediaSelectionOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = objc_msgSend((id)objc_opt_class(), "_createMediaRemoteLanguageOptionGroupWithAVMediaSelectionOptions:", v7);
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v3, "addObject:", v8);

    }
  }

  return v3;
}

- (id)_currentLanguageOptions
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[AVNowPlayingInfoController playerController](self, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAudioMediaSelectionOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend((id)objc_opt_class(), "_createMediaRemoteLanguageOptionWithAVMediaSelectionOption:", v4);
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v3, "addObject:", v5);

    }
  }
  objc_msgSend(v2, "currentLegibleMediaSelectionOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_msgSend((id)objc_opt_class(), "_createMediaRemoteLanguageOptionWithAVMediaSelectionOption:", v7);
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v3, "addObject:", v8);

    }
  }

  return v3;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (NSString)overrideParentApplicationDisplayIdentifier
{
  return self->_overrideParentApplicationDisplayIdentifier;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (AVPlayerController)playerControllerToActivateAfterDelay
{
  return (AVPlayerController *)objc_loadWeakRetained((id *)&self->_playerControllerToActivateAfterDelay);
}

- (void)setPlayerControllerToActivateAfterDelay:(id)a3
{
  objc_storeWeak((id *)&self->_playerControllerToActivateAfterDelay, a3);
}

- (NSTimer)startNowPlayingUpdatesTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_startNowPlayingUpdatesTimer);
}

- (void)setStartNowPlayingUpdatesTimer:(id)a3
{
  objc_storeWeak((id *)&self->_startNowPlayingUpdatesTimer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_startNowPlayingUpdatesTimer);
  objc_destroyWeak((id *)&self->_playerControllerToActivateAfterDelay);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_overrideParentApplicationDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_keyValueObservationController, 0);
  objc_storeStrong(&self->_playerControllerCurrentTimeJumpedObserver, 0);
}

uint64_t __95__AVNowPlayingInfoController__updateRegisteredRemoteCommandEnabledStatesWithCommandsAndStates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRegisteredRemoteCommandEnabledStatesWithCommandsAndStates:", *(_QWORD *)(a1 + 40));
}

void __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a1;
  objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:filteredByIdentifier:", a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, a4);

}

void __59__AVNowPlayingInfoController__updateNowPlayingInfoIfNeeded__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_createNowPlayingInfoFromPlaybackInfo:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_updateNowPlayingInfo:commandsAndStates:", v2, *(_QWORD *)(a1 + 48));

}

void __83__AVNowPlayingInfoController_startNowPlayingUpdatesForPlayerController_afterDelay___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playerControllerToActivateAfterDelay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", v2);

  if (v4)
  {
    objc_msgSend(WeakRetained, "setPlayerController:", v2);
    objc_msgSend(WeakRetained, "setPlayerControllerToActivateAfterDelay:", 0);
  }

}

void __50__AVNowPlayingInfoController_setPlayerController___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isEnabled") && (objc_msgSend(*(id *)(a1 + 32), "isSuspended") & 1) == 0)
  {
    objc_msgSend(v5, "playerController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_makeCommandsAndStatesDictionaryForPlayerController:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_updateRegisteredRemoteCommandEnabledStatesWithCommandsAndStates:", v4);
  }

}

void __50__AVNowPlayingInfoController_setPlayerController___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(a4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    objc_msgSend(v7, "_setNowPlayingInfoNeedsUpdate");

}

uint64_t __50__AVNowPlayingInfoController_setPlayerController___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setNowPlayingInfoNeedsUpdate");
}

uint64_t __50__AVNowPlayingInfoController_setPlayerController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setNowPlayingInfoNeedsUpdate");
}

void __34__AVNowPlayingInfoController_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "playerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v6)
  {
    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v7, "_setNowPlayingInfoNeedsUpdate");

  }
}

uint64_t __34__AVNowPlayingInfoController_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
    v7 = objc_msgSend(WeakRetained, "_handleRemoteCommand:options:", a2, a3);
  else
    v7 = 2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)sharedNowPlayingInfoControllerWithCompletion:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = (void *)objc_msgSend(a3, "copy");
  if (sharedNowPlayingInfoControllerWithCompletion__createQueueOnceToken != -1)
    dispatch_once(&sharedNowPlayingInfoControllerWithCompletion__createQueueOnceToken, &__block_literal_global_4243);
  v5 = sharedNowPlayingInfoControllerWithCompletion__nowPlayingInfoCreationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__AVNowPlayingInfoController_sharedNowPlayingInfoControllerWithCompletion___block_invoke_2;
  v7[3] = &unk_1E5BB0F38;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (void)_createMediaRemoteLanguageOptionGroupWithAVMediaSelectionOptions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  const void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = *MEMORY[0x1E0C8A770];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "hasMediaCharacteristic:", v10, (_QWORD)v17);
        v13 = objc_msgSend(a1, "_createMediaRemoteLanguageOptionWithAVMediaSelectionOption:", v12);
        if (v13)
        {
          v14 = (const void *)v13;
          objc_msgSend(v5, "addObject:", v13);
          CFRelease(v14);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = (void *)MRLanguageOptionGroupCreate();
  return v15;
}

+ (void)_createMediaRemoteLanguageOptionWithAVMediaSelectionOption:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *AutomaticLanguageOptionForType;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A770]);
  objc_msgSend(MEMORY[0x1E0C8B200], "avkit_offOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    AutomaticLanguageOptionForType = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8B200], "avkit_autoOption");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqual:", v8);

    if (v9)
    {
      AutomaticLanguageOptionForType = (void *)MRLanguageOptionCreateAutomaticLanguageOptionForType();
    }
    else
    {
      objc_msgSend(a1, "_mediaRemoteLanguageOptionCharacteristicsForAVMediaSelectionOption:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "extendedLanguageTag");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mediaRemoteIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AutomaticLanguageOptionForType = (void *)MRLanguageOptionCreate();

    }
  }

  return AutomaticLanguageOptionForType;
}

+ (id)_mediaRemoteLanguageOptionCharacteristicsForAVMediaSelectionOption:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "_avMediaCharacteristics");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v4, "hasMediaCharacteristic:", v11, (_QWORD)v16))
        {
          objc_msgSend(a1, "_mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
            __assert_rtn("+[AVNowPlayingInfoController _mediaRemoteLanguageOptionCharacteristicsForAVMediaSelectionOption:]", "AVNowPlayingInfoController_Mobile.m", 928, "mediaRemoteMediaCharacteristic");
          v13 = (void *)v12;
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

+ (id)_avMediaCharacteristics
{
  if (_avMediaCharacteristics___once != -1)
    dispatch_once(&_avMediaCharacteristics___once, &__block_literal_global_93);
  return (id)_avMediaCharacteristics___mediaCharacteristics;
}

+ (id)_mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic____once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic____once, &__block_literal_global_94);
  objc_msgSend((id)_mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic____mediaCharacteristicMapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __95__AVNowPlayingInfoController__mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[10];
  _QWORD v17[11];

  v17[10] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C8A750];
  v1 = *MEMORY[0x1E0D4C730];
  v16[0] = *MEMORY[0x1E0D4C738];
  v16[1] = v1;
  v2 = *MEMORY[0x1E0C8A748];
  v17[0] = v0;
  v17[1] = v2;
  v3 = *MEMORY[0x1E0C8A710];
  v4 = *MEMORY[0x1E0D4C748];
  v16[2] = *MEMORY[0x1E0D4C708];
  v16[3] = v4;
  v5 = *MEMORY[0x1E0C8A780];
  v17[2] = v3;
  v17[3] = v5;
  v6 = *MEMORY[0x1E0C8A720];
  v7 = *MEMORY[0x1E0D4C728];
  v16[4] = *MEMORY[0x1E0D4C710];
  v16[5] = v7;
  v8 = *MEMORY[0x1E0C8A738];
  v17[4] = v6;
  v17[5] = v8;
  v9 = *MEMORY[0x1E0C8A728];
  v10 = *MEMORY[0x1E0D4C740];
  v16[6] = *MEMORY[0x1E0D4C718];
  v16[7] = v10;
  v11 = *MEMORY[0x1E0C8A768];
  v17[6] = v9;
  v17[7] = v11;
  v12 = *MEMORY[0x1E0D4C750];
  v16[8] = *MEMORY[0x1E0D4C720];
  v16[9] = v12;
  v13 = *MEMORY[0x1E0C8A790];
  v17[8] = *MEMORY[0x1E0C8A730];
  v17[9] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 10);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)_mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic____mediaCharacteristicMapping;
  _mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic____mediaCharacteristicMapping = v14;

}

void __53__AVNowPlayingInfoController__avMediaCharacteristics__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[11];

  v7[10] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C8A748];
  v7[0] = *MEMORY[0x1E0C8A750];
  v7[1] = v0;
  v1 = *MEMORY[0x1E0C8A780];
  v7[2] = *MEMORY[0x1E0C8A710];
  v7[3] = v1;
  v2 = *MEMORY[0x1E0C8A738];
  v7[4] = *MEMORY[0x1E0C8A720];
  v7[5] = v2;
  v3 = *MEMORY[0x1E0C8A768];
  v7[6] = *MEMORY[0x1E0C8A728];
  v7[7] = v3;
  v4 = *MEMORY[0x1E0C8A790];
  v7[8] = *MEMORY[0x1E0C8A730];
  v7[9] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_avMediaCharacteristics___mediaCharacteristics;
  _avMediaCharacteristics___mediaCharacteristics = v5;

}

void __75__AVNowPlayingInfoController_sharedNowPlayingInfoControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  _QWORD block[5];

  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__AVNowPlayingInfoController_sharedNowPlayingInfoControllerWithCompletion___block_invoke_3;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 40);
  if (AVNowPlayingInfoSkipCommandDirectionKey_block_invoke_createSharedControllerOnceToken != -1)
    dispatch_once(&AVNowPlayingInfoSkipCommandDirectionKey_block_invoke_createSharedControllerOnceToken, block);
  v3[0] = v2;
  v3[1] = 3221225472;
  v3[2] = __75__AVNowPlayingInfoController_sharedNowPlayingInfoControllerWithCompletion___block_invoke_4;
  v3[3] = &unk_1E5BB4610;
  v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

void __75__AVNowPlayingInfoController_sharedNowPlayingInfoControllerWithCompletion___block_invoke_3(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)AVNowPlayingInfoSkipCommandDirectionKey_block_invoke_nowPlayingInfoController;
  AVNowPlayingInfoSkipCommandDirectionKey_block_invoke_nowPlayingInfoController = (uint64_t)v1;

  objc_storeStrong((id *)(AVNowPlayingInfoSkipCommandDirectionKey_block_invoke_nowPlayingInfoController + 40), (id)sharedNowPlayingInfoControllerWithCompletion__nowPlayingInfoCreationQueue);
}

uint64_t __75__AVNowPlayingInfoController_sharedNowPlayingInfoControllerWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__AVNowPlayingInfoController_sharedNowPlayingInfoControllerWithCompletion___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.avkit.sharedNowPlayingInfoController", v2);
  v1 = (void *)sharedNowPlayingInfoControllerWithCompletion__nowPlayingInfoCreationQueue;
  sharedNowPlayingInfoControllerWithCompletion__nowPlayingInfoCreationQueue = (uint64_t)v0;

}

@end
