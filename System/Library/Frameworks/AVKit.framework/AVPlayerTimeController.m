@implementation AVPlayerTimeController

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_seekingInternal, a3);
}

- (AVPlayerTimeController)initWithPlayer:(id)a3
{
  id v5;
  AVPlayerTimeController *v6;
  AVPlayerTimeController *v7;
  AVObservationController *v8;
  AVValueTiming *maxTiming;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVPlayerTimeController;
  v6 = -[AVPlayerTimeController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    -[AVPlayerTimeController _commonInit](v6, "_commonInit");
    objc_storeStrong((id *)&v7->_seekingInternal, a3);
    v8 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v7);
    maxTiming = v7->_maxTiming;
    v7->_maxTiming = (AVValueTiming *)v8;

  }
  return v7;
}

- (void)_commonInit
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *seekQueue;
  NSObject *v5;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avkit.AVPlayerTimeController.SeekQueue", v5);
  seekQueue = self->_seekQueue;
  self->_seekQueue = v3;

}

- (id)initForIFramesWithPlayerItem:(id)a3
{
  id v4;
  AVPlayerTimeController *v5;
  id *p_isa;
  id v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVPlayerTimeController;
  v5 = -[AVPlayerTimeController init](&v10, sel_init);
  p_isa = (id *)&v5->super.isa;
  if (v5)
  {
    -[AVPlayerTimeController _commonInit](v5, "_commonInit");
    v7 = objc_alloc_init(MEMORY[0x1E0C8B2E8]);
    v8 = p_isa[9];
    p_isa[9] = v7;

    objc_msgSend(p_isa[9], "setPlayerRole:", *MEMORY[0x1E0C8ACB0]);
    objc_msgSend(p_isa[9], "replaceCurrentItemWithPlayerItem:", v4);
  }

  return p_isa;
}

- (void)dealloc
{
  objc_super v3;

  -[AVValueTiming stopAllObservation](self->_maxTiming, "stopAllObservation");
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerTimeController;
  -[AVPlayerTimeController dealloc](&v3, sel_dealloc);
}

- (void)startTimingObservation
{
  NSObject *v3;
  id v4;
  AVValueTiming *maxTiming;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[3];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[AVPlayerTimeController startTimingObservation]";
    v12 = 1024;
    v13 = 92;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v4 = (id)-[AVValueTiming startObserving:keyPath:observationHandler:](self->_maxTiming, "startObserving:keyPath:observationHandler:", self, CFSTR("player.currentItem.seekableTimeRanges"), &__block_literal_global_10153);
  maxTiming = self->_maxTiming;
  v9[0] = CFSTR("player.currentItem");
  v9[1] = CFSTR("player.currentItem.duration");
  v9[2] = CFSTR("readyToPlay");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)-[AVValueTiming startObserving:keyPaths:observationHandler:](maxTiming, "startObserving:keyPaths:observationHandler:", self, v6, &__block_literal_global_14_10158);

  v8 = *MEMORY[0x1E0CA2E78];
  -[AVValueTiming startObservingNotificationForName:object:notificationCenter:observationHandler:](self->_maxTiming, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0CA2E78], 0, 0, &__block_literal_global_16_10159);
  -[AVValueTiming startObservingNotificationForName:object:notificationCenter:observationHandler:](self->_maxTiming, "startObservingNotificationForName:object:notificationCenter:observationHandler:", v8, 0, 0, &__block_literal_global_17_10160);
}

- (void)stopTimingObservation
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[AVPlayerTimeController stopTimingObservation]";
    v6 = 1024;
    v7 = 119;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v4, 0x12u);
  }

  -[AVValueTiming stopAllObservation](self->_maxTiming, "stopAllObservation");
}

- (double)minTime
{
  return 0.0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)reversePlaybackEndTime
{
  void *v4;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v7;

  -[AVPlayerTimeController player](self, "player");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "reversePlaybackEndTime");
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (double)maxTime
{
  void *v2;
  void *v3;
  double Seconds;
  CMTime time;

  objc_msgSend(*(id *)&self->_seekingInternal, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "duration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)forwardPlaybackEndTime
{
  void *v4;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v7;

  -[AVPlayerTimeController player](self, "player");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "forwardPlaybackEndTime");
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (double)contentDuration
{
  void *v2;
  void *v3;
  double Seconds;
  CMTime time;

  objc_msgSend(*(id *)&self->_seekingInternal, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "duration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- (double)contentDurationWithinEndTimes
{
  double v3;
  double v4;
  double v5;

  -[AVPlayerTimeController maxTime](self, "maxTime");
  v4 = v3;
  -[AVPlayerTimeController minTime](self, "minTime");
  return v4 - v5;
}

- (NSArray)seekableTimeRanges
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)&self->_seekingInternal, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "seekableTimeRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isCompletelySeekable
{
  return 0;
}

- (BOOL)hasSeekableLiveStreamingContent
{
  return 0;
}

- (BOOL)canSeek
{
  return 0;
}

- (BOOL)isSeeking
{
  return 0;
}

- (double)seekToTime
{
  return NAN;
}

- (BOOL)isReadyToPlay
{
  return objc_msgSend(*(id *)&self->_seekingInternal, "status") == 2;
}

- (void)seekToTime:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5
{
  NSObject *v9;
  NSObject *seekQueue;
  _QWORD v11[4];
  id v12[4];
  id location[2];

  if (objc_msgSend(*(id *)&self->_seekingInternal, "_isInterstitialPlayer"))
  {
    _AVLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "seekToTime:toleranceBefore:toleranceAfter is not supported on interstitial players", (uint8_t *)location, 2u);
    }

  }
  objc_initWeak(location, self);
  seekQueue = self->_seekQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__AVPlayerTimeController_seekToTime_toleranceBefore_toleranceAfter___block_invoke;
  v11[3] = &unk_1E5BB24D8;
  objc_copyWeak(v12, location);
  v12[1] = *(id *)&a3;
  v12[2] = *(id *)&a4;
  v12[3] = *(id *)&a5;
  dispatch_async(seekQueue, v11);
  objc_destroyWeak(v12);
  objc_destroyWeak(location);
}

- (void)_updateTiming
{
  void *v3;
  OpaqueCMTimebase *v4;
  double EffectiveRate;
  double Seconds;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  CMTime v16;
  CMTime time;
  CMTime v18;

  if (objc_msgSend(*(id *)&self->_seekingInternal, "status") == 1
    && (objc_msgSend(*(id *)&self->_seekingInternal, "currentItem"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = (OpaqueCMTimebase *)objc_msgSend(v3, "timebase"),
        v3,
        v4))
  {
    memset(&v18, 0, sizeof(v18));
    CMTimebaseGetTime(&v18, v4);
    EffectiveRate = CMTimebaseGetEffectiveRate(v4);
    if (EffectiveRate == 0.0)
    {
      time = v18;
      Seconds = CMTimeGetSeconds(&time);
      v7 = NAN;
      v8 = 0.0;
    }
    else
    {
      v10 = EffectiveRate;
      +[AVValueTiming currentTimeStamp](AVValueTiming, "currentTimeStamp");
      v12 = v11;
      objc_msgSend(*(id *)&self->_seekingInternal, "currentItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        objc_msgSend(v13, "currentTime");
      else
        memset(&v16, 0, sizeof(v16));
      v15 = CMTimeGetSeconds(&v16);

      time = v18;
      v7 = v12 + fabs((v15 - CMTimeGetSeconds(&time)) / v10);
      Seconds = v15;
      v8 = v10;
    }
  }
  else
  {
    Seconds = NAN;
    v7 = NAN;
    v8 = NAN;
  }
  +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:", Seconds, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerTimeController setTiming:](self, "setTiming:", v9);

}

- (void)_updateMinAndMaxTiming
{
  void *v3;
  id v4;

  -[AVPlayerTimeController minTime](self, "minTime");
  +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AVPlayerTimeController maxTime](self, "maxTime");
  +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerTimeController setMinTiming:](self, "setMinTiming:", v4);
  -[AVPlayerTimeController setMaxTiming:](self, "setMaxTiming:", v3);

}

- (AVPlayer)player
{
  return *(AVPlayer **)&self->_seekingInternal;
}

- (AVValueTiming)timing
{
  return (AVValueTiming *)self->_player;
}

- (void)setTiming:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (AVValueTiming)minTiming
{
  return self->_timing;
}

- (void)setMinTiming:(id)a3
{
  objc_storeStrong((id *)&self->_timing, a3);
}

- (AVValueTiming)maxTiming
{
  return self->_minTiming;
}

- (void)setMaxTiming:(id)a3
{
  objc_storeStrong((id *)&self->_minTiming, a3);
}

- (AVObservationController)observationController
{
  return (AVObservationController *)self->_maxTiming;
}

- (BOOL)isSeekingInternal
{
  return BYTE4(self->_toleranceAfter.epoch);
}

- (void)setSeekingInternal:(BOOL)a3
{
  BYTE4(self->_toleranceAfter.epoch) = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekToTimeInternal
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)self + 112);
  return self;
}

- (void)setSeekToTimeInternal:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_seekToTimeInternal.timescale = a3->var3;
  *(_OWORD *)&self->_observationController = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxTiming, 0);
  objc_storeStrong((id *)&self->_minTiming, 0);
  objc_storeStrong((id *)&self->_timing, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_seekingInternal, 0);
  objc_storeStrong((id *)&self->_seekQueue, 0);
}

void __68__AVPlayerTimeController_seekToTime_toleranceBefore_toleranceAfter___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  CMTimeEpoch epoch;
  CMTime v4;
  CMTime v5;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMTimeMakeWithSeconds(&v5, *(Float64 *)(a1 + 40), 600);
    objc_msgSend(WeakRetained, "setSeekToTimeInternal:", &v5);
    CMTimeMakeWithSeconds(&v4, *(Float64 *)(a1 + 48), 600);
    epoch = v4.epoch;
    *(_OWORD *)(WeakRetained + 20) = *(_OWORD *)&v4.value;
    *(_QWORD *)(WeakRetained + 36) = epoch;
    CMTimeMakeWithSeconds(&v4, *(Float64 *)(a1 + 56), 600);
    *(CMTime *)(WeakRetained + 44) = v4;
    if (objc_msgSend(WeakRetained, "isSeekingInternal"))
      WeakRetained[16] = 1;
    else
      -[AVPlayerTimeController _actuallySeekToTime]((uint64_t)WeakRetained);
  }

}

- (void)_actuallySeekToTime
{
  void *v2;
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _BYTE v9[24];
  id location;

  if (a1)
  {
    objc_msgSend((id)a1, "setSeekingInternal:", 1);
    objc_initWeak(&location, (id)a1);
    objc_msgSend((id)a1, "player");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "seekToTimeInternal");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__AVPlayerTimeController__actuallySeekToTime__block_invoke;
    v7[3] = &unk_1E5BB4688;
    objc_copyWeak(&v8, &location);
    v5 = *(_OWORD *)(a1 + 20);
    v6 = *(_QWORD *)(a1 + 36);
    v3 = *(_OWORD *)(a1 + 44);
    v4 = *(_QWORD *)(a1 + 60);
    objc_msgSend(v2, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", v9, &v5, &v3, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __45__AVPlayerTimeController__actuallySeekToTime__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__AVPlayerTimeController__actuallySeekToTime__block_invoke_2;
    block[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }

}

void __45__AVPlayerTimeController__actuallySeekToTime__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained[16])
  {
    WeakRetained[16] = 0;
    -[AVPlayerTimeController _actuallySeekToTime](WeakRetained);
  }
  else
  {
    objc_msgSend(WeakRetained, "setSeekingInternal:", 0);
    v5 = *MEMORY[0x1E0CA2E18];
    v4 = v5;
    v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v3 = v6;
    objc_msgSend(v2, "setSeekToTimeInternal:", &v5);
    *(_OWORD *)(v2 + 20) = v4;
    *(_QWORD *)(v2 + 36) = v3;
    *(_OWORD *)(v2 + 44) = v4;
    *(_QWORD *)(v2 + 60) = v3;
  }

}

void __48__AVPlayerTimeController_startTimingObservation__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(a4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "timebase");

  if (v5 == (void *)v8)
    objc_msgSend(v9, "_updateTiming");

}

void __48__AVPlayerTimeController_startTimingObservation__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(a4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "timebase");

  if (v5 == (void *)v8)
    objc_msgSend(v9, "_updateTiming");

}

uint64_t __48__AVPlayerTimeController_startTimingObservation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateTiming");
}

uint64_t __48__AVPlayerTimeController_startTimingObservation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateMinAndMaxTiming");
}

+ (id)keyPathsForValuesAffectingReversePlaybackEndTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.currentItem.reversePlaybackEndTime"));
}

+ (id)keyPathsForValuesAffectingMaxTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.currentItem.duration"));
}

+ (id)keyPathsForValuesAffectingForwardPlaybackEndTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.currentItem.forwardPlaybackEndTime"));
}

+ (id)keyPathsForValuesAffectingContentDuration
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.currentItem.duration"));
}

+ (id)keyPathsForValuesAffectingContentDurationWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("minTime"), CFSTR("maxTime"), 0);
}

+ (id)keyPathsForValuesAffectingSeekableTimeRanges
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.currentItem.seekableTimeRanges"));
}

+ (id)keyPathsForValuesAffectingReadyToPlay
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.status"));
}

@end
