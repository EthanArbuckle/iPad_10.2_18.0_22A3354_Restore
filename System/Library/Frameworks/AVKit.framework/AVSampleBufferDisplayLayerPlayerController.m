@implementation AVSampleBufferDisplayLayerPlayerController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AVSampleBufferDisplayLayerPlayerController sbdlObservationController](self, "sbdlObservationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  v4.receiver = self;
  v4.super_class = (Class)AVSampleBufferDisplayLayerPlayerController;
  -[AVPlayerController dealloc](&v4, sel_dealloc);
}

- (AVSampleBufferDisplayLayerPlayerController)init
{
  AVSampleBufferDisplayLayerPlayerController *v2;
  void *v3;
  AVPictureInPicturePlaybackState *v4;
  void *timeControlStatus;
  AVValueTiming *v6;
  void *epoch;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVSampleBufferDisplayLayerPlayerController;
  v2 = -[AVPlayerController init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v2->_timing) = objc_msgSend(v3, "isPiPAvailable");

    v4 = -[AVPictureInPicturePlaybackState initWithElapsedTime:timelineDuration:timelineRate:paused:]([AVPictureInPicturePlaybackState alloc], "initWithElapsedTime:timelineDuration:timelineRate:paused:", 1, NAN, NAN, 0.0);
    timeControlStatus = (void *)v2->_timeControlStatus;
    v2->_timeControlStatus = (int64_t)v4;

    v6 = -[AVValueTiming initWithAnchorValue:anchorTimeStamp:rate:]([AVValueTiming alloc], "initWithAnchorValue:anchorTimeStamp:rate:", NAN, NAN, 0.0);
    epoch = (void *)v2->super._seekToTimeInternal.epoch;
    v2->super._seekToTimeInternal.epoch = (int64_t)v6;

  }
  return v2;
}

- (double)_effectiveRate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double EffectiveRate;

  -[AVSampleBufferDisplayLayerPlayerController pictureInPictureController](self, "pictureInPictureController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sampleBufferDisplayLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sampleBufferRenderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "timebase");

  if (!v6)
    return 0.0;
  CFRetain(v6);
  EffectiveRate = CMTimebaseGetEffectiveRate((CMTimebaseRef)v6);
  CFRelease(v6);
  return EffectiveRate;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentSBDLTime
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v10;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  -[AVSampleBufferDisplayLayerPlayerController pictureInPictureController](self, "pictureInPictureController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sampleBufferDisplayLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sampleBufferRenderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "timebase");

  if (v8)
  {
    CFRetain(v8);
    CMTimebaseGetTime(&v10, (CMTimebaseRef)v8);
    *(CMTime *)retstr = v10;
    CFRelease(v8);
  }
  return result;
}

- (void)setPlaybackDelegate:(id)a3
{
  AVPictureInPictureController **p_pictureInPictureController;
  id v5;
  void *v6;

  p_pictureInPictureController = &self->_pictureInPictureController;
  v5 = a3;
  objc_storeWeak((id *)p_pictureInPictureController, v5);
  +[AVSampleBufferDisplayLayerPlaybackDelegateAdapter playbackDelegateAdapterWithDelegate:](AVSampleBufferDisplayLayerPlaybackDelegateAdapter, "playbackDelegateAdapterWithDelegate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVSampleBufferDisplayLayerPlayerController setPlaybackDelegateAdapter:](self, "setPlaybackDelegateAdapter:", v6);
  -[AVSampleBufferDisplayLayerPlayerController invalidatePlaybackState](self, "invalidatePlaybackState");
}

- (void)setPictureInPictureController:(id)a3
{
  AVPictureInPicturePlaybackState **p_playbackState;
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  p_playbackState = &self->_playbackState;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_playbackState);

  if (WeakRetained)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Expect this to only be set once.", v10, 2u);
    }

  }
  objc_storeWeak((id *)p_playbackState, v5);
  objc_msgSend(v5, "contentSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sampleBufferPlaybackDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSampleBufferDisplayLayerPlayerController setPlaybackDelegate:](self, "setPlaybackDelegate:", v9);

  -[AVSampleBufferDisplayLayerPlayerController _startObservation](self, "_startObservation");
}

- (void)invalidatePlaybackState
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  AVPictureInPicturePlaybackState *v9;
  double Seconds;
  double v11;
  double v12;
  AVPictureInPicturePlaybackState *v13;
  CMTime v14;
  CMTime v15;
  CMTime time;
  CMTime v17;
  CMTime rhs;
  CMTime lhs;
  _OWORD v20[3];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[5];
  CMTime v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v25.value) = 136315138;
      *(CMTimeValue *)((char *)&v25.value + 4) = (CMTimeValue)"-[AVSampleBufferDisplayLayerPlayerController invalidatePlaybackState]";
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "*** %s must be called on main thread. ***", (uint8_t *)&v25, 0xCu);
    }

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    -[AVSampleBufferDisplayLayerPlayerController playbackDelegateAdapter](self, "playbackDelegateAdapter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSampleBufferDisplayLayerPlayerController pictureInPictureController](self, "pictureInPictureController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "pictureInPictureControllerIsPlaybackPaused:", v5);

    -[AVSampleBufferDisplayLayerPlayerController playbackDelegateAdapter](self, "playbackDelegateAdapter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSampleBufferDisplayLayerPlayerController pictureInPictureController](self, "pictureInPictureController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v7, "pictureInPictureControllerTimeRangeForPlayback:", v8);
    }
    else
    {
      v22 = 0u;
      v23 = 0u;
      v21 = 0u;
    }
    v20[0] = v21;
    v20[1] = v22;
    v20[2] = v23;
    -[AVSampleBufferDisplayLayerPlayerController setContentTimeRange:](self, "setContentTimeRange:", v20);

    memset(&v25, 0, sizeof(v25));
    -[AVSampleBufferDisplayLayerPlayerController _currentSBDLTime](self, "_currentSBDLTime");
    -[AVSampleBufferDisplayLayerPlayerController contentTimeRange](self, "contentTimeRange");
    rhs = v17;
    CMTimeSubtract(&v25, &lhs, &rhs);
    v9 = [AVPictureInPicturePlaybackState alloc];
    time = v25;
    Seconds = CMTimeGetSeconds(&time);
    -[AVSampleBufferDisplayLayerPlayerController contentTimeRange](self, "contentTimeRange");
    v15 = v14;
    v11 = CMTimeGetSeconds(&v15);
    -[AVSampleBufferDisplayLayerPlayerController _effectiveRate](self, "_effectiveRate");
    v13 = -[AVPictureInPicturePlaybackState initWithElapsedTime:timelineDuration:timelineRate:paused:](v9, "initWithElapsedTime:timelineDuration:timelineRate:paused:", v6, Seconds, v11, v12);
    -[AVSampleBufferDisplayLayerPlayerController setPlaybackState:](self, "setPlaybackState:", v13);

    -[AVSampleBufferDisplayLayerPlayerController _updateBackgroundAudioPlaybackPolicy](self, "_updateBackgroundAudioPlaybackPolicy");
    -[AVSampleBufferDisplayLayerPlayerController _updateStatus](self, "_updateStatus");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__AVSampleBufferDisplayLayerPlayerController_invalidatePlaybackState__block_invoke;
    block[3] = &unk_1E5BB4CA0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)setPlaybackState:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if ((id)self->_timeControlStatus != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_timeControlStatus, a3);
    -[AVSampleBufferDisplayLayerPlayerController _updatePlaybackStateTiming](self, "_updatePlaybackStateTiming");
    v5 = v6;
  }

}

- (BOOL)isPaused
{
  void *v2;
  char v3;

  -[AVSampleBufferDisplayLayerPlayerController playbackState](self, "playbackState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaused");

  return v3;
}

- (int64_t)timeControlStatus
{
  void *v2;
  int64_t v3;
  double v4;

  -[AVSampleBufferDisplayLayerPlayerController playbackState](self, "playbackState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isPaused") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "timelineRate");
    if (v4 == 0.0)
      v3 = 1;
    else
      v3 = 2;
  }

  return v3;
}

- (BOOL)isPlaying
{
  return !-[AVSampleBufferDisplayLayerPlayerController isPaused](self, "isPaused");
}

- (void)setPlaying:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (-[AVSampleBufferDisplayLayerPlayerController isPlaying](self, "isPlaying") != a3)
  {
    -[AVSampleBufferDisplayLayerPlayerController playbackDelegateAdapter](self, "playbackDelegateAdapter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSampleBufferDisplayLayerPlayerController pictureInPictureController](self, "pictureInPictureController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pictureInPictureController:setPlaying:", v6, v3);

    -[AVSampleBufferDisplayLayerPlayerController invalidatePlaybackState](self, "invalidatePlaybackState");
  }
}

- (void)pauseForAllCoordinatedPlaybackParticipants:(BOOL)a3
{
  -[AVSampleBufferDisplayLayerPlayerController setPlaying:](self, "setPlaying:", 0);
}

- (void)seekByTimeInterval:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5
{
  _BOOL4 v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  CMTime v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  double v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = -[AVSampleBufferDisplayLayerPlayerController isPlaying](self, "isPlaying", a3, a4, a5);
  if (v7)
    -[AVSampleBufferDisplayLayerPlayerController togglePlaybackEvenWhenInBackground:](self, "togglePlaybackEvenWhenInBackground:", self);
  _AVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    v17 = "-[AVSampleBufferDisplayLayerPlayerController seekByTimeInterval:toleranceBefore:toleranceAfter:]";
    *(_DWORD *)buf = 136315650;
    if (v7)
      v9 = CFSTR("YES");
    v18 = 2048;
    v19 = a3;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s  interval: %f shouldResumePlayback: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  -[AVSampleBufferDisplayLayerPlayerController playbackDelegate](self, "playbackDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSampleBufferDisplayLayerPlayerController pictureInPictureController](self, "pictureInPictureController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeWithSeconds(&v15, a3, 90000);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__AVSampleBufferDisplayLayerPlayerController_seekByTimeInterval_toleranceBefore_toleranceAfter___block_invoke;
  v12[3] = &unk_1E5BB4CC8;
  objc_copyWeak(&v13, (id *)buf);
  v14 = v7;
  objc_msgSend(v10, "pictureInPictureController:skipByInterval:completionHandler:", v11, &v15, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)togglePlaybackEvenWhenInBackground:(id)a3
{
  -[AVSampleBufferDisplayLayerPlayerController setPlaying:](self, "setPlaying:", -[AVSampleBufferDisplayLayerPlayerController isPlaying](self, "isPlaying", a3) ^ 1);
}

- (void)setPictureInPictureInterrupted:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AVSampleBufferDisplayLayerPlayerController;
  -[AVPlayerController setPictureInPictureInterrupted:](&v5, sel_setPictureInPictureInterrupted_);
  if (v3)
    -[AVSampleBufferDisplayLayerPlayerController setPlaying:](self, "setPlaying:", 0);
}

- (BOOL)isPictureInPicturePossible
{
  return -[AVSampleBufferDisplayLayerPlayerController status](self, "status") != 3
      && -[AVSampleBufferDisplayLayerPlayerController isPictureInPictureAvailable](self, "isPictureInPictureAvailable");
}

- (double)rate
{
  void *v2;
  double v3;
  double v4;

  -[AVSampleBufferDisplayLayerPlayerController playbackState](self, "playbackState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timelineRate");
  v4 = v3;

  return v4;
}

- (double)currentTimeWithinEndTimes
{
  void *v2;
  double v3;
  double v4;

  -[AVSampleBufferDisplayLayerPlayerController playbackState](self, "playbackState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentElapsedTime");
  v4 = v3;

  return v4;
}

- (double)contentDurationWithinEndTimes
{
  void *v2;
  double v3;
  double v4;

  -[AVSampleBufferDisplayLayerPlayerController playbackState](self, "playbackState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timelineDuration");
  v4 = v3;

  return v4;
}

- (BOOL)hasLiveStreamingContent
{
  _BOOL4 v3;
  unsigned __int8 v5;
  char v6;

  -[AVSampleBufferDisplayLayerPlayerController contentTimeRange](self, "contentTimeRange");
  if ((v6 & 1) != 0)
  {
    -[AVSampleBufferDisplayLayerPlayerController contentTimeRange](self, "contentTimeRange");
    return (v5 >> 2) & 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)timing
{
  return (id)self->super._seekToTimeInternal.epoch;
}

- (id)minTiming
{
  return +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:", 0.0, NAN, 0.0);
}

- (id)maxTiming
{
  -[AVSampleBufferDisplayLayerPlayerController contentDuration](self, "contentDuration");
  return +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:");
}

- (BOOL)hasSeekableLiveStreamingContent
{
  return 0;
}

- (void)setEnqueuedBufferDimensions:(CGSize)a3
{
  void *v4;

  *(CGSize *)&self->_playbackDelegateAdapter = a3;
  -[AVSampleBufferDisplayLayerPlayerController pictureInPictureController](self, "pictureInPictureController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSourceVideoRectInWindowChanged");

  -[AVSampleBufferDisplayLayerPlayerController _updateStatus](self, "_updateStatus");
}

- (void)_updatePlaybackStateTiming
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  AVValueTiming *v9;
  void *epoch;
  id v11;

  -[AVSampleBufferDisplayLayerPlayerController playbackState](self, "playbackState");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentElapsedTime");
  v4 = v3;
  if ((objc_msgSend(v11, "isPaused") & 1) != 0)
  {
    v5 = 0.0;
    v6 = NAN;
  }
  else
  {
    +[AVValueTiming currentTimeStamp](AVValueTiming, "currentTimeStamp");
    v6 = v7;
    objc_msgSend(v11, "timelineRate");
    v5 = v8;
  }
  v9 = -[AVValueTiming initWithAnchorValue:anchorTimeStamp:rate:]([AVValueTiming alloc], "initWithAnchorValue:anchorTimeStamp:rate:", v4, v6, v5);
  epoch = (void *)self->super._seekToTimeInternal.epoch;
  self->super._seekToTimeInternal.epoch = (int64_t)v9;

}

- (void)_updateStatus
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v7;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;

  -[AVSampleBufferDisplayLayerPlayerController contentDimensions](self, "contentDimensions");
  v7 = ((v4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v4 >= 0
    || (unint64_t)(v4 - 1) < 0xFFFFFFFFFFFFFLL;
  v9 = (v3 < 0 || ((v3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
    && (unint64_t)(v3 - 1) > 0xFFFFFFFFFFFFELL;
  v10 = 1;
  if (!v9 && v7)
  {
    -[AVSampleBufferDisplayLayerPlayerController contentTimeRange](self, "contentTimeRange", 1);
    if ((v14 & 1) == 0
      || (-[AVSampleBufferDisplayLayerPlayerController contentTimeRange](self, "contentTimeRange"), (v13 & 1) == 0)
      || (-[AVSampleBufferDisplayLayerPlayerController contentTimeRange](self, "contentTimeRange"), v12)
      || (-[AVSampleBufferDisplayLayerPlayerController contentTimeRange](self, "contentTimeRange"), v11 < 0))
    {
      v10 = 1;
    }
    else
    {
      v10 = 2;
    }
  }
  -[AVSampleBufferDisplayLayerPlayerController setStatus:](self, "setStatus:", v10);
}

- (void)_updateBackgroundAudioPlaybackPolicy
{
  AVPictureInPictureController **p_pictureInPictureController;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;

  p_pictureInPictureController = &self->_pictureInPictureController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureController);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_pictureInPictureController);
    -[AVSampleBufferDisplayLayerPlayerController pictureInPictureController](self, "pictureInPictureController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "pictureInPictureControllerShouldProhibitBackgroundAudioPlayback:", v7);

    if (v8)
      v9 = 2;
    else
      v9 = 1;
  }
  else
  {
    v9 = 1;
  }
  -[AVSampleBufferDisplayLayerPlayerController pictureInPictureController](self, "pictureInPictureController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundPlaybackPolicy:", v9);

}

- (void)_startObservation
{
  void *v3;
  AVObservationController *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[9];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  __int128 v57;
  __int128 v58;
  _QWORD v59[7];

  v59[6] = *MEMORY[0x1E0C80C00];
  -[AVSampleBufferDisplayLayerPlayerController sbdlObservationController](self, "sbdlObservationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
    -[AVSampleBufferDisplayLayerPlayerController setSbdlObservationController:](self, "setSbdlObservationController:", v4);

    -[AVSampleBufferDisplayLayerPlayerController sbdlObservationController](self, "sbdlObservationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "startObserving:keyPath:includeInitialValue:observationHandler:", v6, CFSTR("isPiPAvailable"), 1, &__block_literal_global_24340);

    -[AVSampleBufferDisplayLayerPlayerController sbdlObservationController](self, "sbdlObservationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0CA2E78], 0, 0, &__block_literal_global_124_24341);

    -[AVSampleBufferDisplayLayerPlayerController sbdlObservationController](self, "sbdlObservationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0CA2E88], 0, 0, &__block_literal_global_124_24341);

    -[AVSampleBufferDisplayLayerPlayerController pictureInPictureController](self, "pictureInPictureController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sampleBufferDisplayLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x4010000000;
    v56[3] = &unk_1AC617EFB;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(v12, "frame");
    *(_QWORD *)&v57 = v13;
    *((_QWORD *)&v57 + 1) = v14;
    *(_QWORD *)&v58 = v15;
    *((_QWORD *)&v58 + 1) = v16;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x4010000000;
    v53[3] = &unk_1AC617EFB;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v12, "bounds");
    *(_QWORD *)&v54 = v17;
    *((_QWORD *)&v54 + 1) = v18;
    *(_QWORD *)&v55 = v19;
    *((_QWORD *)&v55 + 1) = v20;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x5010000000;
    v49[3] = &unk_1AC617EFB;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    if (v12)
    {
      objc_msgSend(v12, "affineTransform");
      v37 = 0;
      v38 = &v37;
      v39 = 0xA010000000;
      v40 = &unk_1AC617EFB;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      objc_msgSend(v12, "transform");
      v25 = 0;
      v26 = &v25;
      v27 = 0xA010000000;
      v28 = &unk_1AC617EFB;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v12, "sublayerTransform");
    }
    else
    {
      v37 = 0;
      v38 = &v37;
      v39 = 0xA010000000;
      v40 = &unk_1AC617EFB;
      v41 = 0uLL;
      v42 = 0uLL;
      v43 = 0uLL;
      v44 = 0uLL;
      v45 = 0uLL;
      v46 = 0uLL;
      v47 = 0uLL;
      v48 = 0uLL;
      v25 = 0;
      v26 = &v25;
      v27 = 0xA010000000;
      v28 = &unk_1AC617EFB;
      v29 = 0uLL;
      v30 = 0uLL;
      v31 = 0uLL;
      v32 = 0uLL;
      v33 = 0uLL;
      v34 = 0uLL;
      v35 = 0uLL;
      v36 = 0uLL;
    }
    -[AVSampleBufferDisplayLayerPlayerController sbdlObservationController](self, "sbdlObservationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = CFSTR("bounds");
    v59[1] = CFSTR("frame");
    v59[2] = CFSTR("transform");
    v59[3] = CFSTR("affineTransform");
    v59[4] = CFSTR("sublayerTransform");
    v59[5] = CFSTR("videoGravity");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __63__AVSampleBufferDisplayLayerPlayerController__startObservation__block_invoke_3;
    v24[3] = &unk_1E5BB4D98;
    v24[4] = v56;
    v24[5] = v53;
    v24[6] = v49;
    v24[7] = &v37;
    v24[8] = &v25;
    v23 = (id)objc_msgSend(v21, "startObserving:keyPaths:includeInitialValue:observationHandler:", v12, v22, 1, v24);

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v53, 8);
    _Block_object_dispose(v56, 8);

  }
}

- (int64_t)status
{
  return *(_QWORD *)&self->_pictureInPictureAvailable;
}

- (void)setStatus:(int64_t)a3
{
  *(_QWORD *)&self->_pictureInPictureAvailable = a3;
}

- (BOOL)isPictureInPictureAvailable
{
  return (BOOL)self->_timing;
}

- (void)setPictureInPictureAvailable:(BOOL)a3
{
  LOBYTE(self->_timing) = a3;
}

- (void)setTimeControlStatus:(int64_t)a3
{
  self->_status = a3;
}

- (AVPictureInPicturePlaybackState)playbackState
{
  return (AVPictureInPicturePlaybackState *)self->_timeControlStatus;
}

- (AVPictureInPictureController)pictureInPictureController
{
  return (AVPictureInPictureController *)objc_loadWeakRetained((id *)&self->_playbackState);
}

- (AVPictureInPictureSampleBufferPlaybackDelegate)playbackDelegate
{
  return (AVPictureInPictureSampleBufferPlaybackDelegate *)objc_loadWeakRetained((id *)&self->_pictureInPictureController);
}

- (CGSize)enqueuedBufferDimensions
{
  AVSampleBufferDisplayLayerPlaybackDelegateAdapter *playbackDelegateAdapter;
  double width;
  CGSize result;

  playbackDelegateAdapter = self->_playbackDelegateAdapter;
  width = self->_enqueuedBufferDimensions.width;
  result.height = width;
  result.width = *(double *)&playbackDelegateAdapter;
  return result;
}

- (AVObservationController)sbdlObservationController
{
  return (AVObservationController *)self->_playbackDelegate;
}

- (void)setSbdlObservationController:(id)a3
{
  objc_storeStrong((id *)&self->_playbackDelegate, a3);
}

- (void)setPaused:(BOOL)a3
{
  BYTE1(self->_timing) = a3;
}

- ($008D8879F9973785877FFE498A5CE36E)contentTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[16].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[15].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[16].var0.var3;
  return self;
}

- (void)setContentTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.var3;
  v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_enqueuedBufferDimensions.height = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_contentTimeRange.start.timescale = v4;
  *(_OWORD *)&self->_contentTimeRange.duration.value = v3;
}

- (AVSampleBufferDisplayLayerPlaybackDelegateAdapter)playbackDelegateAdapter
{
  return (AVSampleBufferDisplayLayerPlaybackDelegateAdapter *)self->_sbdlObservationController;
}

- (void)setPlaybackDelegateAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_sbdlObservationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbdlObservationController, 0);
  objc_storeStrong((id *)&self->_playbackDelegate, 0);
  objc_destroyWeak((id *)&self->_pictureInPictureController);
  objc_destroyWeak((id *)&self->_playbackState);
  objc_storeStrong((id *)&self->_timeControlStatus, 0);
  objc_storeStrong((id *)&self->super._seekToTimeInternal.epoch, 0);
}

void __63__AVSampleBufferDisplayLayerPlayerController__startObservation__block_invoke_3(uint64_t a1, void *a2)
{
  __int128 v3;
  _QWORD block[4];
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  id v8;
  id location;

  objc_initWeak(&location, a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVSampleBufferDisplayLayerPlayerController__startObservation__block_invoke_4;
  block[3] = &unk_1E5BB4D70;
  objc_copyWeak(&v8, &location);
  v3 = *(_OWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 32);
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __63__AVSampleBufferDisplayLayerPlayerController__startObservation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  CGRect *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGRect *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  _OWORD *v16;
  __int128 v17;
  _OWORD *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD *v38;
  __int128 v39;
  __int128 v40;
  _OWORD *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _OWORD *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  CATransform3D v75;
  CATransform3D t1;
  CATransform3D b;
  CGAffineTransform t2;
  CGRect v79;
  CGRect v80;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "pictureInPictureController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sampleBufferDisplayLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained)
  {
    if (v5)
    {
      v6 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(v5, "frame");
      v79.origin.x = v7;
      v79.origin.y = v8;
      v79.size.width = v9;
      v79.size.height = v10;
      if (!CGRectEqualToRect(v6[1], v79))
        goto LABEL_8;
      v11 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
      objc_msgSend(v5, "bounds");
      v80.origin.x = v12;
      v80.origin.y = v13;
      v80.size.width = v14;
      v80.size.height = v15;
      if (!CGRectEqualToRect(v11[1], v80))
        goto LABEL_8;
      v16 = *(_OWORD **)(*(_QWORD *)(a1 + 48) + 8);
      objc_msgSend(v5, "affineTransform");
      v17 = v16[3];
      *(_OWORD *)&t1.m11 = v16[2];
      *(_OWORD *)&t1.m13 = v17;
      *(_OWORD *)&t1.m21 = v16[4];
      if (!CGAffineTransformEqualToTransform((CGAffineTransform *)&t1, &t2))
        goto LABEL_8;
      v18 = *(_OWORD **)(*(_QWORD *)(a1 + 56) + 8);
      objc_msgSend(v5, "transform");
      v19 = v18[7];
      *(_OWORD *)&t1.m31 = v18[6];
      *(_OWORD *)&t1.m33 = v19;
      v20 = v18[9];
      *(_OWORD *)&t1.m41 = v18[8];
      *(_OWORD *)&t1.m43 = v20;
      v21 = v18[3];
      *(_OWORD *)&t1.m11 = v18[2];
      *(_OWORD *)&t1.m13 = v21;
      v22 = v18[5];
      *(_OWORD *)&t1.m21 = v18[4];
      *(_OWORD *)&t1.m23 = v22;
      if (!CATransform3DEqualToTransform(&t1, &b))
        goto LABEL_8;
      v23 = *(_OWORD **)(*(_QWORD *)(a1 + 64) + 8);
      objc_msgSend(v5, "sublayerTransform");
      v24 = v23[7];
      *(_OWORD *)&t1.m31 = v23[6];
      *(_OWORD *)&t1.m33 = v24;
      v25 = v23[9];
      *(_OWORD *)&t1.m41 = v23[8];
      *(_OWORD *)&t1.m43 = v25;
      v26 = v23[3];
      *(_OWORD *)&t1.m11 = v23[2];
      *(_OWORD *)&t1.m13 = v26;
      v27 = v23[5];
      *(_OWORD *)&t1.m21 = v23[4];
      *(_OWORD *)&t1.m23 = v27;
      if (!CATransform3DEqualToTransform(&t1, &v75))
      {
LABEL_8:
        objc_msgSend(v5, "frame");
        v28 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
        v28[4] = v29;
        v28[5] = v30;
        v28[6] = v31;
        v28[7] = v32;
        objc_msgSend(v5, "bounds");
        v33 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
        v33[4] = v34;
        v33[5] = v35;
        v33[6] = v36;
        v33[7] = v37;
        objc_msgSend(v5, "affineTransform");
        v38 = *(_OWORD **)(*(_QWORD *)(a1 + 48) + 8);
        v40 = v73;
        v39 = v74;
        v38[2] = v72;
        v38[3] = v40;
        v38[4] = v39;
        objc_msgSend(v5, "transform");
        v41 = *(_OWORD **)(*(_QWORD *)(a1 + 56) + 8);
        v43 = v66;
        v42 = v67;
        v44 = v65;
        v41[2] = v64;
        v41[3] = v44;
        v46 = v70;
        v45 = v71;
        v47 = v69;
        v41[6] = v68;
        v41[7] = v47;
        v41[8] = v46;
        v41[9] = v45;
        v41[4] = v43;
        v41[5] = v42;
        objc_msgSend(v5, "sublayerTransform");
        v48 = *(_OWORD **)(*(_QWORD *)(a1 + 64) + 8);
        v50 = v58;
        v49 = v59;
        v51 = v57;
        v48[2] = v56;
        v48[3] = v51;
        v53 = v62;
        v52 = v63;
        v54 = v61;
        v48[6] = v60;
        v48[7] = v54;
        v48[8] = v53;
        v48[9] = v52;
        v48[4] = v50;
        v48[5] = v49;
        objc_msgSend(WeakRetained, "pictureInPictureController");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "contentSourceVideoRectInWindowChanged");

      }
    }
  }

}

void __63__AVSampleBufferDisplayLayerPlayerController__startObservation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a4;
  objc_msgSend(v12, "pictureInPictureController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sampleBufferDisplayLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sampleBufferRenderer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timebase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v5, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
      objc_msgSend(v12, "invalidatePlaybackState");
  }

}

uint64_t __63__AVSampleBufferDisplayLayerPlayerController__startObservation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C89AE8];
  v3 = a2;
  objc_msgSend(v2, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPictureInPictureAvailable:", objc_msgSend(v4, "isPiPAvailable"));

  v5 = objc_msgSend(v3, "isPictureInPictureAvailable");
  return +[AVPlayerController setCachedIsPictureInPictureSupported:](AVPlayerController, "setCachedIsPictureInPictureSupported:", v5);
}

void __96__AVSampleBufferDisplayLayerPlayerController_seekByTimeInterval_toleranceBefore_toleranceAfter___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "Done seeking.", buf, 2u);
    }

    if (*(_BYTE *)(a1 + 40))
    {
      _AVLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "Resuming playback after a seek.", v5, 2u);
      }

      objc_msgSend(WeakRetained, "togglePlaybackEvenWhenInBackground:", WeakRetained);
    }
  }

}

uint64_t __69__AVSampleBufferDisplayLayerPlayerController_invalidatePlaybackState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidatePlaybackState");
}

+ (id)keyPathsForValuesAffectingPaused
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("playbackState.paused"), 0);
}

+ (id)keyPathsForValuesAffectingTimeControlStatus
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("playbackState.paused"), CFSTR("playbackState.timelineRate"), 0);
}

+ (id)keyPathsForValuesAffectingPlaying
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("paused"));
}

+ (id)keyPathsForValuesAffectingPictureInPicturePossible
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("status");
  v6[1] = CFSTR("pictureInPictureAvailable");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingContentDimensions
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("enqueuedBufferDimensions"));
}

+ (id)keyPathsForValuesAffectingRate
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("playbackState.timelineRate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingCurrentTimeWithinEndTimes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("playbackState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingContentDurationWithinEndTimes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("playbackState.timelineDuration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingContentDuration
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("contentDurationWithinEndTimes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingHasLiveStreamingContent
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("contentTimeRange");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingTiming
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("playbackState"), 0);
}

+ (id)keyPathsForValuesAffectingMaxTiming
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("contentDuration"), 0);
}

@end
