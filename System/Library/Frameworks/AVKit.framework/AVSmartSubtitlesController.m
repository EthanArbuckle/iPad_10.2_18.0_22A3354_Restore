@implementation AVSmartSubtitlesController

- (AVSmartSubtitlesController)init
{
  AVSmartSubtitlesController *v2;
  AVObservationController *v3;
  AVObservationController *smartSubtitlesControllerKVO;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVSmartSubtitlesController;
  v2 = -[AVSmartSubtitlesController init](&v6, sel_init);
  if (v2)
  {
    v3 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v2);
    smartSubtitlesControllerKVO = v2->_smartSubtitlesControllerKVO;
    v2->_smartSubtitlesControllerKVO = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AVSmartSubtitlesController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AVSmartSubtitlesController;
  -[AVSmartSubtitlesController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  __CFNotificationCenter *DarwinNotifyCenter;

  -[AVSmartSubtitlesController setState:](self, "setState:", 0);
  -[AVSmartSubtitlesController _setPlayerTimeObserver:]((id *)&self->super.isa, 0);
  if (self)
  {
    -[AVObservationController stopAllObservation](self->_smartSubtitlesControllerKVO, "stopAllObservation");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  }
}

- (void)setState:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  double timeOfSeekStart;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  CMTime v17;
  id location;
  _BYTE buf[24];
  double v20;
  id v21[4];

  v21[3] = *(id *)MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    self->_state = a3;
    switch(a3)
    {
      case 0:
        -[AVSmartSubtitlesController setCurrentSkipBackTimeInterval:](self, "setCurrentSkipBackTimeInterval:", 0.0);
        -[AVSmartSubtitlesController setLastSeekTime:](self, "setLastSeekTime:", 0.0);
        -[AVSmartSubtitlesController _setPlayerTimeObserver:]((id *)&self->super.isa, 0);
        -[AVSmartSubtitlesController setSkipBackSeekDelta:](self, "setSkipBackSeekDelta:", 0.0);
        -[AVSmartSubtitlesController setTimeOfSeekStart:](self, "setTimeOfSeekStart:", 0.0);
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel___transitionToDisplayingCaptionsIfAble, 0);
        if (-[AVSmartSubtitlesController didToggleCaptionsOn](self, "didToggleCaptionsOn"))
        {
          -[AVSmartSubtitlesController playerController](self, "playerController");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setMediaOptionCriteriaAlwaysOn:", 0);

        }
        -[AVSmartSubtitlesController setDidToggleCaptionsOn:](self, "setDidToggleCaptionsOn:", 0);
        _AVLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[AVSmartSubtitlesController _handleUpdatedState:]";
          _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s AVSkipBackSmartSubtitleStateIdle: Controller is idle", buf, 0xCu);
        }
        goto LABEL_13;
      case 1:
        -[AVSmartSubtitlesController setCurrentSkipBackTimeInterval:](self, "setCurrentSkipBackTimeInterval:", 0.0);
        -[AVSmartSubtitlesController _setPlayerTimeObserver:]((id *)&self->super.isa, 0);
        -[AVPlayerController currentTime](self->_playerController, "currentTime");
        -[AVSmartSubtitlesController setTimeOfSeekStart:](self, "setTimeOfSeekStart:");
        _AVLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[AVSmartSubtitlesController _handleUpdatedState:]";
          _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s AVSkipBackSmartSubtitleStatePreparing", buf, 0xCu);
        }
        goto LABEL_13;
      case 2:
        _AVLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[AVSmartSubtitlesController _handleUpdatedState:]";
          _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s AVSkipBackSmartSubtitleStateWaitingForPlayback", buf, 0xCu);
        }
LABEL_13:

        return;
      case 3:
        timeOfSeekStart = self->_timeOfSeekStart;
        -[AVPlayerController currentTime](self->_playerController, "currentTime");
        v8 = v7;
        v9 = vabdd_f64(timeOfSeekStart, v7);
        if (v9 >= INFINITY && v9 <= INFINITY)
        {
          _AVLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = "-[AVSmartSubtitlesController _handleUpdatedState:]";
            _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s Delta received is an invalid value, resetting controller to idle", buf, 0xCu);
          }
LABEL_18:

          -[AVSmartSubtitlesController setState:](self, "setState:", 0);
          return;
        }
        _AVLog();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        if (timeOfSeekStart - v8 <= 0.0)
        {
          if (v11)
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "-[AVSmartSubtitlesController _handleUpdatedState:]";
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = timeOfSeekStart - v8;
            _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s Expected a skip backwards, but received a delta of %f, resetting controller to idle", buf, 0x16u);
          }
          goto LABEL_18;
        }
        if (v11)
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "-[AVSmartSubtitlesController _handleUpdatedState:]";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v8;
          *(_WORD *)&buf[22] = 2048;
          v20 = timeOfSeekStart;
          _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s Seek backwards finished with success, enabling captions from %f to %f", buf, 0x20u);
        }

        objc_initWeak(&location, self);
        -[AVSmartSubtitlesController playerController](self, "playerController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "player");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeWithSeconds(&v17, 0.5, 1000000000);
        v14 = MEMORY[0x1E0C80D38];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __50__AVSmartSubtitlesController__handleUpdatedState___block_invoke;
        v20 = COERCE_DOUBLE(&unk_1E5BB3E68);
        objc_copyWeak(v21, &location);
        v21[1] = *(id *)&timeOfSeekStart;
        objc_msgSend(v13, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v17, MEMORY[0x1E0C80D38], buf);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[AVSmartSubtitlesController _setPlayerTimeObserver:]((id *)&self->super.isa, v15);
        -[AVSmartSubtitlesController playerController](self, "playerController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setMediaOptionCriteriaAlwaysOn:", 1);

        -[AVSmartSubtitlesController setSkipBackSeekDelta:](self, "setSkipBackSeekDelta:", timeOfSeekStart - v8);
        if (!-[AVSmartSubtitlesController didToggleCaptionsOn](self, "didToggleCaptionsOn"))
          -[AVSmartSubtitlesController setDidToggleCaptionsOn:](self, "setDidToggleCaptionsOn:", 1);

        objc_destroyWeak(v21);
        objc_destroyWeak(&location);
        break;
      default:
        return;
    }
  }
}

- (void)setPlayerController:(id)a3
{
  AVPlayerController *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  AVPlayerController *v12;

  v5 = (AVPlayerController *)a3;
  if (self->_playerController != v5)
  {
    v12 = v5;
    -[AVObservationController stopAllObservation](self->_smartSubtitlesControllerKVO, "stopAllObservation");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
    -[AVSmartSubtitlesController setState:](self, "setState:", 0);
    objc_storeStrong((id *)&self->_playerController, a3);
    v5 = v12;
    if (v12)
    {
      -[AVSmartSubtitlesController smartSubtitlesControllerKVO](self, "smartSubtitlesControllerKVO");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v7, "startObserving:keyPath:observationHandler:", self, CFSTR("playerController.timeControlStatus"), &__block_literal_global_18411);
      v9 = (id)objc_msgSend(v7, "startObserving:keyPath:observationHandler:", self, CFSTR("playerController.player.currentItem"), &__block_literal_global_15);
      v10 = (id)objc_msgSend(v7, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.currentLegibleMediaSelectionOption"), 0, &__block_literal_global_20_18414);
      v11 = (id)objc_msgSend(v7, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.currentAssetIfReady"), 0, &__block_literal_global_25_18416);
      objc_msgSend(v7, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DDE030], 0, 0, &__block_literal_global_28_18417);
      objc_msgSend(v7, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DDE028], 0, 0, &__block_literal_global_30_18418);

      v5 = v12;
    }
  }

}

- (BOOL)smartSubtitlesActive
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "subtitleAutomaticallyEnabledState");

  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "YES";
    if (!v3)
      v5 = "NO";
    v7 = 136315394;
    v8 = "-[AVSmartSubtitlesController smartSubtitlesActive]";
    v9 = 2082;
    v10 = v5;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s AVSubtitleAutomaticallyEnabledState:%{public}s", (uint8_t *)&v7, 0x16u);
  }

  return v3 != 0;
}

- (void)updatePlayerVolumeToPlayerMuted:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[AVSmartSubtitlesController setPlayerMuted:](self, "setPlayerMuted:");
  -[AVSmartSubtitlesController setSubtitlesOnMuteActive:](self, "setSubtitlesOnMuteActive:", v3);
  -[AVSmartSubtitlesController _updateSubtitlesOnMute](self);
}

- (void)userRequestedSeekWithTimeInterval:(double)a3
{
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  double v13;

  -[AVSmartSubtitlesController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVSmartSubtitlesController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "observesMediaSelectionForSmartSubtitlesController:", self);

    if (-[AVSmartSubtitlesController isSubtitlesOnMuteActive](self, "isSubtitlesOnMuteActive") && !v8)
      return;
  }
  else
  {
    -[AVSmartSubtitlesController isSubtitlesOnMuteActive](self, "isSubtitlesOnMuteActive");
  }
  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "skipBackCaptionsEnabled");

  if (v10)
  {
    -[AVSmartSubtitlesController playerController](self, "playerController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasLegibleMediaSelectionOptions");

    if (v12)
    {
      v13 = fabs(a3);
      if (v13 != INFINITY)
      {
        if (a3 >= 0.0)
        {
          -[AVSmartSubtitlesController setState:](self, "setState:", 0);
        }
        else
        {
          -[AVSmartSubtitlesController setState:](self, "setState:", 1);
          self->_currentSkipBackTimeInterval = v13 + self->_currentSkipBackTimeInterval;
          objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel___transitionToDisplayingCaptionsIfAble, 0);
          -[AVSmartSubtitlesController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel___transitionToDisplayingCaptionsIfAble, 0, 1.25);
        }
      }
    }
  }
}

- (void)userRequestedSmartSubtitlesHiddenIfActive
{
  if (-[AVSmartSubtitlesController smartSubtitlesActive](self, "smartSubtitlesActive"))
  {
    -[AVSmartSubtitlesController setState:](self, "setState:", 0);
    -[AVSmartSubtitlesController setSubtitlesOnMuteActive:](self, "setSubtitlesOnMuteActive:", 0);
    -[AVSmartSubtitlesController _updateSubtitlesOnMute](self);
  }
}

- (void)_performSkipBackDelegateCallback
{
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[AVSmartSubtitlesController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSmartSubtitlesController skipBackSeekDelta](self, "skipBackSeekDelta");
  v5 = v4;
  if (fabs(v4) != INFINITY && v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[AVSmartSubtitlesController _performSkipBackDelegateCallback]";
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s Captions were toggled in response to a skip back, notifying delegate", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v3, "smartSubtitlesController:didToggleSubtitlesOnSkipBackForTimeInterval:", self, v5);
  }

}

- (void)__transitionToDisplayingCaptionsIfAble
{
  void *v3;
  void *v4;
  NSObject *v5;
  double currentSkipBackTimeInterval;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AVSmartSubtitlesController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_currentSkipBackTimeInterval > 30.0)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      currentSkipBackTimeInterval = self->_currentSkipBackTimeInterval;
      v13 = 136315394;
      v14 = "-[AVSmartSubtitlesController __transitionToDisplayingCaptionsIfAble]";
      v15 = 2048;
      v16 = currentSkipBackTimeInterval;
      v7 = "%s Skip back interval of %f exceeds the max, setting controller back to idle";
      v8 = v5;
      v9 = 22;
LABEL_11:
      _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, v9);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!objc_msgSend(v3, "isPlaying"))
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[AVSmartSubtitlesController __transitionToDisplayingCaptionsIfAble]";
      v7 = "%s Skip back performed, but the player is paused, setting controller back to idle";
      v8 = v5;
      v9 = 12;
      goto LABEL_11;
    }
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v10 = objc_msgSend(v4, "timeControlStatus");
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v10 == 1)
  {
    if (v11)
    {
      v13 = 136315138;
      v14 = "-[AVSmartSubtitlesController __transitionToDisplayingCaptionsIfAble]";
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s Skip back performed, waiting for playback to resume to display captions", (uint8_t *)&v13, 0xCu);
    }
    v12 = 2;
  }
  else
  {
    if (v11)
    {
      v13 = 136315138;
      v14 = "-[AVSmartSubtitlesController __transitionToDisplayingCaptionsIfAble]";
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s Skip back performed, playback is in progress", (uint8_t *)&v13, 0xCu);
    }
    v12 = 3;
  }
LABEL_13:

  -[AVSmartSubtitlesController setState:](self, "setState:", v12);
}

- (AVSmartSubtitlesControllerDelegate)delegate
{
  return (AVSmartSubtitlesControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (BOOL)isSubtitlesOnMuteActive
{
  return self->_subtitlesOnMuteActive;
}

- (void)setSubtitlesOnMuteActive:(BOOL)a3
{
  self->_subtitlesOnMuteActive = a3;
}

- (double)currentSkipBackTimeInterval
{
  return self->_currentSkipBackTimeInterval;
}

- (void)setCurrentSkipBackTimeInterval:(double)a3
{
  self->_currentSkipBackTimeInterval = a3;
}

- (double)lastSeekTime
{
  return self->_lastSeekTime;
}

- (void)setLastSeekTime:(double)a3
{
  self->_lastSeekTime = a3;
}

- (double)skipBackSeekDelta
{
  return self->_skipBackSeekDelta;
}

- (void)setSkipBackSeekDelta:(double)a3
{
  self->_skipBackSeekDelta = a3;
}

- (double)timeOfSeekStart
{
  return self->_timeOfSeekStart;
}

- (void)setTimeOfSeekStart:(double)a3
{
  self->_timeOfSeekStart = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (AVObservationController)smartSubtitlesControllerKVO
{
  return self->_smartSubtitlesControllerKVO;
}

- (void)setSmartSubtitlesControllerKVO:(id)a3
{
  objc_storeStrong((id *)&self->_smartSubtitlesControllerKVO, a3);
}

- (id)playerTimeObserver
{
  return self->_playerTimeObserver;
}

- (void)setPlayerTimeObserver:(id)a3
{
  objc_storeStrong(&self->_playerTimeObserver, a3);
}

- (BOOL)didToggleCaptionsOn
{
  return self->_didToggleCaptionsOn;
}

- (void)setDidToggleCaptionsOn:(BOOL)a3
{
  self->_didToggleCaptionsOn = a3;
}

- (BOOL)playerMuted
{
  return self->_playerMuted;
}

- (void)setPlayerMuted:(BOOL)a3
{
  self->_playerMuted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_playerTimeObserver, 0);
  objc_storeStrong((id *)&self->_smartSubtitlesControllerKVO, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_updateSubtitlesOnMute
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;

  if (a1)
  {
    objc_msgSend(a1, "playerController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "captionAppearanceDisplayType");

    objc_msgSend(a1, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(a1, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "observesMediaSelectionForSmartSubtitlesController:", a1);

      v8 = v7 ^ 1;
    }
    else
    {
      v8 = 0;
    }
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "subtitlesOnMuteiOSEnabled");

    if (!v10 || v8)
    {
      objc_msgSend(a1, "setSubtitlesOnMuteActive:", 0);
      if (v3 == 2)
      {
LABEL_16:
        objc_msgSend(a1, "playerController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v11;
        v12 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel___transitionToDisplayingCaptionsIfAble, 0);
      objc_msgSend(a1, "setDidToggleCaptionsOn:", 0);
      objc_msgSend(a1, "setState:", 0);
      if (v3 == 2)
      {
        if (objc_msgSend(a1, "isSubtitlesOnMuteActive"))
        {
          objc_msgSend(a1, "playerMuted");
          return;
        }
        objc_msgSend(a1, "setSubtitlesOnMuteActive:", 0);
        goto LABEL_16;
      }
      if (objc_msgSend(a1, "playerMuted"))
      {
        objc_msgSend(a1, "setSubtitlesOnMuteActive:", 1);
        objc_msgSend(a1, "playerController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v11;
        v12 = 1;
LABEL_17:
        objc_msgSend(v11, "setMediaOptionCriteriaAlwaysOn:", v12);

      }
    }
  }
}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_4(uint64_t a1, void *a2)
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, a2);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__AVSmartSubtitlesController__startObservations__block_invoke_5;
  v2[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  uint8_t buf[4];
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    _AVLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v5 = "-[AVSmartSubtitlesController _handleShowOnSkipBackNotification]";
      _os_log_impl(&dword_1AC4B1000, v2, OS_LOG_TYPE_DEFAULT, "%s Skip back user preference changed, ensuring state is set to idle", buf, 0xCu);
    }

    objc_msgSend(v3, "setState:", 0);
    WeakRetained = v3;
  }

}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_2_26(uint64_t a1, void *a2)
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, a2);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__AVSmartSubtitlesController__startObservations__block_invoke_3_29;
  v2[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_3_29(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[AVSmartSubtitlesController _updateSubtitlesOnMute](WeakRetained);
    WeakRetained = v2;
  }

}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_24(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a4;
  objc_msgSend(v16, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v16, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "observesMediaSelectionForSmartSubtitlesController:", v16);

    v10 = v9 ^ 1;
  }
  else
  {
    v10 = 0;
  }
  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "subtitlesOnMuteiOSEnabled"))
    goto LABEL_9;
  if ((v10 & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v5, "value");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_9;
  v13 = (void *)v12;
  objc_msgSend(v5, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oldValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 != v15)
  {
    objc_msgSend(v16, "playerController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMediaOptionCriteriaAlwaysOn:", objc_msgSend(v16, "isSubtitlesOnMuteActive"));
LABEL_9:

  }
}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_18(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a4;
  objc_msgSend(v6, "oldValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8B200], "avkit_autoOption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v9)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8B200], "avkit_offOption");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7 == v10;

  }
  objc_msgSend(MEMORY[0x1E0C8B200], "avkit_autoOption");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v12)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8B200], "avkit_offOption");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8 == v13;

  }
  if (objc_msgSend(v5, "state") != 3)
    goto LABEL_18;
  objc_msgSend(v5, "playerController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "timeControlStatus") != 2 || (objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
  {

    goto LABEL_11;
  }

  if (v11)
  {
    v11 = 1;
LABEL_11:
    if (((objc_msgSend(v5, "didToggleCaptionsOn") & v11 ^ 1 | v14) & 1) == 0)
      objc_msgSend(v5, "_performSkipBackDelegateCallback");
    goto LABEL_18;
  }
  _AVLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315138;
    v18 = "-[AVSmartSubtitlesController _startObservations]_block_invoke";
    _os_log_impl(&dword_1AC4B1000, v16, OS_LOG_TYPE_DEFAULT, "%s Captions were changed while we were displaying them, resetting controller to idle", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend(v5, "setDidToggleCaptionsOn:", 0);
  objc_msgSend(v5, "setState:", 0);
LABEL_18:

}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "state"))
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[AVSmartSubtitlesController _startObservations]_block_invoke_3";
      _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s Player item changed, resetting state to idle", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(v2, "setState:", 0);
  }

}

void __48__AVSmartSubtitlesController__startObservations__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD block[4];
  id v5;

  v2 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVSmartSubtitlesController__startObservations__block_invoke_2;
  block[3] = &unk_1E5BB4CA0;
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;

  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "skipBackCaptionsEnabled");

  if (v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "state");
    objc_msgSend(*(id *)(a1 + 32), "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "timeControlStatus");

    if (v6 == 2 && v4 == 2)
    {
      v8 = 3;
    }
    else
    {
      if (v6)
        return;
      v8 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "setState:", v8);
  }
}

- (void)_setPlayerTimeObserver:(id *)a1
{
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    if (a1[10])
    {
      objc_msgSend(a1, "playerController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "player");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeTimeObserver:", a1[10]);

    }
    objc_storeStrong(a1 + 10, a2);
  }

}

void __50__AVSmartSubtitlesController__handleUpdatedState___block_invoke(uint64_t a1, CMTime *a2)
{
  id WeakRetained;
  double Seconds;
  double v6;
  NSObject *v7;
  uint64_t v8;
  CMTime v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = *a2;
  Seconds = CMTimeGetSeconds(&v9);
  if (WeakRetained)
  {
    v6 = Seconds;
    if (Seconds >= *(double *)(a1 + 40))
    {
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 40);
        LODWORD(v9.value) = 136315650;
        *(CMTimeValue *)((char *)&v9.value + 4) = (CMTimeValue)"-[AVSmartSubtitlesController _handleUpdatedState:]_block_invoke";
        LOWORD(v9.flags) = 2048;
        *(double *)((char *)&v9.flags + 2) = v6;
        HIWORD(v9.epoch) = 2048;
        v10 = v8;
        _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s Current playback time %f has reached or passed the original time of %f, resetting controller to idle", (uint8_t *)&v9, 0x20u);
      }

      objc_msgSend(WeakRetained, "setState:", 0);
    }
  }

}

@end
