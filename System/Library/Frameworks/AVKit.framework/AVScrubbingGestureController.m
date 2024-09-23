@implementation AVScrubbingGestureController

id *__56__AVScrubbingGestureController_initWithPlatformAdapter___block_invoke(uint64_t a1, id *a2)
{
  return -[AVScrubbingGestureController _updateAdapterState](a2);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setScrubsHaveMomentum:(BOOL)a3
{
  if (self->_scrubsHaveMomentum != a3)
  {
    self->_scrubsHaveMomentum = a3;
    if (!a3 && -[AVScrubbingGestureController state](self, "state") == 3)
      -[AVScrubbingGestureController _endScrubbingAndResetState]((uint64_t)self);
  }
}

- (void)setPlayerController:(id)a3
{
  AVPlayerController *v5;
  AVPlayerController *v6;

  v5 = (AVPlayerController *)a3;
  if (self->_playerController != v5)
  {
    v6 = v5;
    -[AVScrubbingGestureController _endScrubbingAndResetState]((uint64_t)self);
    objc_storeStrong((id *)&self->_playerController, a3);
    v5 = v6;
  }

}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[AVScrubbingGestureController _updateAdapterState]((id *)&self->super.isa);
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (AVScrubbingGestureController)initWithPlatformAdapter:(id)a3
{
  id v5;
  AVScrubbingGestureController *v6;
  AVScrubbingGestureController *v7;
  AVObservationController *v8;
  AVObservationController *observationController;
  id v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVScrubbingGestureController;
  v6 = -[AVScrubbingGestureController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_state = 1;
    objc_storeStrong((id *)&v6->_platformAdapter, a3);
    -[AVScrubbingGesturePlatformAdapter setDelegate:](v7->_platformAdapter, "setDelegate:", v7);
    v8 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v7);
    observationController = v7->_observationController;
    v7->_observationController = v8;

    v10 = -[AVObservationController startObserving:keyPath:observationHandler:](v7->_observationController, "startObserving:keyPath:observationHandler:", v7, CFSTR("playerController.canSeek"), &__block_literal_global_1107);
    -[AVScrubbingGestureController _updateAdapterState]((id *)&v7->super.isa);
  }

  return v7;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (id)_updateAdapterState
{
  id *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id *v5;

  if (result)
  {
    v1 = result;
    if ((objc_msgSend(result, "enabled") & 1) != 0)
    {
      objc_msgSend(v1, "playerController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        objc_msgSend(v1, "playerController");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v3, "canSeek");

      }
      else
      {
        v4 = 0;
      }

      v5 = v1 + 1;
      if ((_DWORD)v4 == objc_msgSend(v1[1], "gestureEnabled"))
        return (id *)objc_msgSend(*v5, "setGestureEnabled:", v4);
    }
    else
    {
      v5 = v1 + 1;
      v4 = 0;
      if ((objc_msgSend(v1[1], "gestureEnabled") & 1) == 0)
        return (id *)objc_msgSend(*v5, "setGestureEnabled:", v4);
    }
    -[AVScrubbingGestureController _endScrubbingAndResetState]((uint64_t)v1);
    return (id *)objc_msgSend(*v5, "setGestureEnabled:", v4);
  }
  return result;
}

- (void)_endScrubbingAndResetState
{
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    if ((objc_msgSend((id)a1, "state") & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      objc_msgSend((id)a1, "playerController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v2 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

      -[AVScrubbingGestureController _endScrubbingForPlayerController:](a1, v4);
      objc_msgSend(*(id *)(a1 + 48), "invalidate");
      v3 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

      *(_QWORD *)(a1 + 32) = 0;
      objc_msgSend(*(id *)(a1 + 64), "avkit_setWebKitSeekToTime:", NAN);
      objc_msgSend(*(id *)(a1 + 64), "avkit_setWebKitIsScrubbing:", 0);
      -[AVScrubbingGestureController _updateStateTo:]((_QWORD *)a1, 1);

    }
  }
}

- (void)dealloc
{
  void *v3;
  NSTimer *scrubMomentumIncrementTimer;
  objc_super v5;

  -[AVScrubbingGestureController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[AVScrubbingGestureController state](self, "state") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[AVScrubbingGestureController _endScrubbingForPlayerController:]((uint64_t)self, v3);
    if (self)
    {
      -[NSTimer invalidate](self->_scrubMomentumIncrementTimer, "invalidate");
      scrubMomentumIncrementTimer = self->_scrubMomentumIncrementTimer;
      self->_scrubMomentumIncrementTimer = 0;

      *(_QWORD *)&self->_currentScrubRate = 0;
      -[NSObject avkit_setWebKitSeekToTime:](self->_playerController, "avkit_setWebKitSeekToTime:", NAN);
      -[NSObject avkit_setWebKitIsScrubbing:](self->_playerController, "avkit_setWebKitIsScrubbing:", 0);
    }
  }
  -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");

  v5.receiver = self;
  v5.super_class = (Class)AVScrubbingGestureController;
  -[AVScrubbingGestureController dealloc](&v5, sel_dealloc);
}

- (AVScrubbingGesturePlatformAdapter)platformAdapter
{
  return self->_platformAdapter;
}

- (BOOL)scrubbingGesturePlatformAdapterIsActivelyScrubbing:(id)a3
{
  return (-[AVScrubbingGestureController state](self, "state", a3) & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)configurationForScrubbingGesturePlatformAdapter:(id)a3
{
  void *v4;
  id v5;
  AVScrubbingGestureConfiguration *v6;
  AVScrubbingGestureConfiguration *gestureConfiguration;

  if (self && !self->_gestureConfiguration)
  {
    -[AVScrubbingGestureController delegate](self, "delegate", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (id)objc_msgSend(v4, "configurationForScrubbingGestureController:", self);

    if (!self->_gestureConfiguration)
    {
      +[AVScrubbingGestureConfiguration defaultConfiguration](AVScrubbingGestureConfiguration, "defaultConfiguration");
      v6 = (AVScrubbingGestureConfiguration *)objc_claimAutoreleasedReturnValue();
      gestureConfiguration = self->_gestureConfiguration;
      self->_gestureConfiguration = v6;

    }
  }
  return -[AVScrubbingGestureConfiguration platformConfiguration](self->_gestureConfiguration, "platformConfiguration", a3);
}

- (void)scrubbingGesturePlatformAdapterDidBeginScrubbing:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSTimer *scrubMomentumIncrementTimer;
  id v8;
  double v9;
  uint8_t v10[16];

  if (!-[AVScrubbingGestureController state](self, "state", a3)
    && -[AVScrubbingGestureController state](self, "state") == 2)
  {
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_ERROR, "Error: Internal inconsistency. AVScrubbingGestureController state should never be unknown or scrubbing when a new scub gesture begins.", v10, 2u);
    }

  }
  -[AVScrubbingGestureController playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "canSeek"))
  {
    if (-[AVScrubbingGestureController state](self, "state") == 3)
    {
      if (self)
      {
        -[NSTimer invalidate](self->_scrubMomentumIncrementTimer, "invalidate");
        scrubMomentumIncrementTimer = self->_scrubMomentumIncrementTimer;
        self->_scrubMomentumIncrementTimer = 0;

        *(_QWORD *)&self->_currentScrubRate = 0;
      }
    }
    else if (self)
    {
      v8 = v6;
      objc_msgSend(v8, "rate");
      *(float *)&v9 = v9;
      self->_preScrubbingRate = *(float *)&v9;
      objc_msgSend(v8, "beginPlaybackSuspension");
      objc_msgSend(v8, "avkit_setWebKitIsScrubbing:", 1);
      objc_msgSend(v8, "beginScrubbing:", self);

    }
    -[AVScrubbingGestureController _updateStateTo:](self, 2);
    -[AVScrubbingGestureController _performScrubIncrement]((uint64_t)self);
  }

}

- (void)scrubbingGesturePlatformAdapterDidContinueScrubbing:(id)a3
{
  double v4;
  double v5;
  double v6;

  if (self && (self->_initialNormalizedTouchTranslation == 0.0 || self->_initialNormalizedTimelinePosition == 0.0))
  {
    v4 = -[AVScrubbingGestureController _targetTime](self);
    -[AVPlayerController maxTime](self->_playerController, "maxTime");
    *(float *)&v5 = v4 / v5;
    self->_initialNormalizedTimelinePosition = *(float *)&v5;
    -[AVScrubbingGesturePlatformAdapter translation](self->_platformAdapter, "translation");
    *(float *)&v6 = v6;
    self->_initialNormalizedTouchTranslation = *(float *)&v6;
  }
  -[AVScrubbingGestureController _performScrubIncrement]((uint64_t)self);
}

- (void)scrubbingGesturePlatformAdapterDidEndScrubbing:(id)a3
{
  id v4;
  float v5;
  float currentScrubRate;
  void *v7;
  NSTimer *v8;
  NSTimer *scrubMomentumIncrementTimer;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  if (-[AVScrubbingGestureController state](self, "state") == 2)
  {
    v5 = -[AVScrubbingGestureController _resumptionRate]((float *)self);
    currentScrubRate = self->_currentScrubRate;
    if (-[AVScrubbingGestureController scrubsHaveMomentum](self, "scrubsHaveMomentum")
      && vabds_f32(currentScrubRate, v5) >= 10.0)
    {
      self->_startingMomentumRate = currentScrubRate;
      -[AVScrubbingGestureController _updateStateTo:](self, 3);
      objc_initWeak(&location, self);
      v7 = (void *)MEMORY[0x1E0C99E88];
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = __79__AVScrubbingGestureController_scrubbingGesturePlatformAdapterDidEndScrubbing___block_invoke;
      v13 = &unk_1E5BB49A8;
      objc_copyWeak(&v14, &location);
      objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v10, 0.0166666667);
      v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      scrubMomentumIncrementTimer = self->_scrubMomentumIncrementTimer;
      self->_scrubMomentumIncrementTimer = v8;

      -[NSTimer setTolerance:](self->_scrubMomentumIncrementTimer, "setTolerance:", 0.00833333333, v10, v11, v12, v13);
      -[AVScrubbingGestureController _performScrubIncrement]((uint64_t)self);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      -[AVScrubbingGestureController _endScrubbingAndResetState]((uint64_t)self);
    }
    *(_QWORD *)&self->_initialNormalizedTouchTranslation = 0;
  }

}

- (BOOL)scrubsHaveMomentum
{
  return self->_scrubsHaveMomentum;
}

- (AVScrubbingGestureControllerDelegate)delegate
{
  return (AVScrubbingGestureControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_scrubMomentumIncrementTimer, 0);
  objc_storeStrong((id *)&self->_gestureConfiguration, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_platformAdapter, 0);
}

- (float)_resumptionRate
{
  void *v2;
  void *v3;
  double v4;
  float v5;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "avkit_isAVPlayerControllerOrSubclass"))
    {
      if (objc_msgSend(v3, "isPlaybackSuspended"))
        objc_msgSend(v3, "suspendedRate");
      else
        objc_msgSend(v3, "rate");
      v5 = v4;
    }
    else
    {
      v5 = a1[14];
    }
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)_updateStateTo:(_QWORD *)a1
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  uint8_t buf[4];
  _QWORD *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = a1[9];
    if (v4 != a2)
    {
      switch(v4)
      {
        case 0:
          if (a2 == 1)
            goto LABEL_11;
          goto LABEL_17;
        case 1:
          if (a2 != 2)
            goto LABEL_17;
          goto LABEL_11;
        case 2:
          if ((a2 & 0xFFFFFFFFFFFFFFFDLL) != 1)
            goto LABEL_17;
          goto LABEL_11;
        case 3:
          if ((unint64_t)(a2 - 1) >= 2)
            goto LABEL_17;
LABEL_11:
          a1[9] = a2;
          objc_msgSend(a1, "delegate");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "scrubbingGestureControllerStateDidChange:", a1);

          break;
        default:
          _AVLog();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            v8 = (_QWORD *)a1[9];
            *(_DWORD *)buf = 134217984;
            v11 = v8;
            _os_log_error_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_ERROR, "Error: Unknown AVScrubbingGestureControllerState - %ld", buf, 0xCu);
          }

LABEL_17:
          _AVLog();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            v7 = a1[9];
            *(_DWORD *)buf = 138543874;
            v11 = a1;
            v12 = 2048;
            v13 = v7;
            v14 = 2048;
            v15 = a2;
            _os_log_error_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_ERROR, "Error: Attempted invalid state transition for %{public}@ from %ld ==> %ld. Ignoring.", buf, 0x20u);
          }

          break;
      }
    }
  }
}

void __79__AVScrubbingGestureController_scrubbingGesturePlatformAdapterDidEndScrubbing___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AVScrubbingGestureController _performScrubIncrement]((uint64_t)WeakRetained);

}

- (void)_performScrubIncrement
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  float v5;
  float v6;
  int v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  id v13;
  float v14;
  float v15;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  if (a1)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    {
      _AVLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1AC4B1000, v2, OS_LOG_TYPE_ERROR, "Warning: _performScrubIncrement should not be performed off of the main thread.", buf, 2u);
      }

    }
    if (objc_msgSend((id)a1, "state") != 2 && objc_msgSend((id)a1, "state") != 3)
    {
      _AVLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "Error: Internal inconsistency. Scrub increments should never be dispatched while not in the momentum or scrubbing states.", v17, 2u);
      }

    }
    if (!*(_QWORD *)(a1 + 24))
    {
      _AVLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_ERROR, "Error: Internal inconsistency. A gesture configuration should be created before a scrub starts.", v16, 2u);
      }

    }
    if (objc_msgSend((id)a1, "state") == 2)
    {
      objc_msgSend(*(id *)(a1 + 8), "timelineVelocity");
      v6 = v5;
      v7 = objc_msgSend(*(id *)(a1 + 24), "usesNaturalDirection");
      v8 = -v6;
      if (!v7)
        v8 = v6;
      goto LABEL_18;
    }
    if (objc_msgSend((id)a1, "state") == 3)
    {
      v9 = -[AVScrubbingGestureController _resumptionRate]((float *)a1);
      v10 = *(float *)(a1 + 32);
      if (vabds_f32(v10, v9) > 0.0333333333)
      {
        v11 = *(float *)(a1 + 36);
        if ((v11 <= v9 || v10 >= v9) && (v11 >= v9 || v10 <= v9))
        {
          v12 = v10 - v9;
          v13 = *(id *)(a1 + 24);
          objc_opt_self();
          objc_msgSend(v13, "syntheticFriction");
          v15 = v14;

          v8 = v9 + (float)(v15 * v12);
LABEL_18:
          *(float *)(a1 + 32) = v8;
          -[AVScrubbingGestureController _seekForScrubIncrement](a1);
          return;
        }
      }
      -[AVScrubbingGestureController _endScrubbingAndResetState](a1);
    }
  }
}

- (void)_endScrubbingForPlayerController:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "endScrubbing:", a1);
    objc_msgSend(v3, "avkit_setWebKitIsScrubbing:", 0);
    objc_msgSend(v3, "endPlaybackSuspension");

    *(_DWORD *)(a1 + 56) = 0;
  }
}

- (void)_seekForScrubIncrement
{
  void *v2;
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;

  objc_msgSend((id)a1, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v25 = v2;
    v4 = objc_msgSend(v2, "canSeek");
    v3 = v25;
    if (v4)
    {
      v5 = -[AVScrubbingGestureController _targetTime]((void *)a1);
      if (*(_QWORD *)(a1 + 72) == 3
        || !objc_msgSend(*(id *)(a1 + 24), "linearSeeking")
        || (objc_msgSend(*(id *)(a1 + 8), "translation"), v7 == 0.0) && v6 == 0.0)
      {
        v8 = *(float *)(a1 + 32) * 0.0166666667;
        v9 = fabs(v8 * 0.5);
        v10 = v5 + v8;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 8), "translation");
        v19 = v18 - *(float *)(a1 + 40) + *(float *)(a1 + 44);
        objc_msgSend(v25, "minTime");
        v21 = v20;
        objc_msgSend(v25, "maxTime");
        v23 = v22;
        objc_msgSend(v25, "minTime");
        v10 = v21 + v19 * (v23 - v24);
        v9 = 0.5;
      }
      if ((objc_msgSend(v25, "avkit_isAVPlayerControllerOrSubclass") & 1) != 0)
      {
        v11 = v10;
        v12 = v25;
      }
      else
      {
        objc_msgSend(v25, "minTime");
        v11 = v13;
        objc_msgSend(v25, "maxTime");
        v15 = fabs(v11);
        v16 = v10 < v11 || v15 == INFINITY;
        v12 = v25;
        if (!v16)
        {
          if (fabs(v14) != INFINITY && v10 <= v14)
            v11 = v10;
          else
            v11 = v14;
        }
      }
      objc_msgSend(v12, "seekToTime:toleranceBefore:toleranceAfter:", v11, v9, v9);
      objc_msgSend(v25, "avkit_setWebKitSeekToTime:", v11);
      v3 = v25;
    }
  }

}

- (double)_targetTime
{
  void *v1;
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "playerController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "avkit_isAVPlayerControllerOrSubclass"))
  {
    objc_msgSend(v1, "seekToTime");
    if (objc_msgSend(v1, "isSeeking"))
      objc_msgSend(v1, "seekToTime");
    else
      objc_msgSend(v1, "currentTimeWithinEndTimes");
    v4 = v2;
  }
  else
  {
    objc_msgSend(v1, "avkit_webkitSeekToTime");
    v4 = v3;
  }

  return v4;
}

@end
