@implementation HFCameraClipPlayer

- (HFCameraClipPlayer)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCameraProfile_clips_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraClipPlayer.m"), 48, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFCameraClipPlayer init]",
    v5);

  return 0;
}

- (HFCameraClipPlayer)initWithCameraProfile:(id)a3 clips:(id)a4
{
  id v6;
  id v7;
  HFCameraClipQueuePlayer *v8;
  HFCameraClipQueuePlayer *v9;
  HFCameraClipPlayer *v10;

  v6 = a4;
  v7 = a3;
  v8 = [HFCameraClipQueuePlayer alloc];
  v9 = -[HFCameraClipQueuePlayer initWithItems:](v8, "initWithItems:", MEMORY[0x1E0C9AA60]);
  v10 = -[HFCameraClipPlayer initWithCameraProfile:clips:queuePlayer:](self, "initWithCameraProfile:clips:queuePlayer:", v7, v6, v9);

  return v10;
}

- (HFCameraClipPlayer)initWithCameraProfile:(id)a3 clips:(id)a4 queuePlayer:(id)a5
{
  id v10;
  id v11;
  id v12;
  HFCameraClipPlayer *v13;
  HFCameraClipPlayer *v14;
  HFCameraVideoDownloader *v15;
  HFCameraVideoCache *v16;
  HFCameraVideoCache *videoCache;
  HFCameraVideoCache *v18;
  void *v19;
  void *v21;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraClipPlayer.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clips != nil"));

  }
  v22.receiver = self;
  v22.super_class = (Class)HFCameraClipPlayer;
  v13 = -[HFCameraClipPlayer init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_cameraProfile, a3);
    objc_storeStrong((id *)&v14->_clips, a4);
    objc_storeStrong((id *)&v14->_queuePlayer, a5);
    if (!+[HFCameraUtilities disableFullQualityVideoCaching](HFCameraUtilities, "disableFullQualityVideoCaching")&& !+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
    {
      v15 = -[HFCameraVideoDownloader initWithCameraProfile:]([HFCameraVideoDownloader alloc], "initWithCameraProfile:", v10);
      v16 = -[HFCameraVideoCache initWithVideoDownloader:]([HFCameraVideoCache alloc], "initWithVideoDownloader:", v15);
      videoCache = v14->_videoCache;
      v14->_videoCache = v16;

      if (objc_msgSend(v11, "count"))
      {
        v18 = v14->_videoCache;
        objc_msgSend(v11, "lastObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFCameraVideoCache cacheClip:](v18, "cacheClip:", v19);

      }
    }
    -[HFCameraClipPlayer _updatePlayerActionAtItemEnd](v14, "_updatePlayerActionAtItemEnd");
    -[HFCameraClipPlayer _setupPlayerObservation](v14, "_setupPlayerObservation");
  }

  return v14;
}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  HFCameraClipPlayer *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x17uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  if (!+[HFCameraUtilities disableFullQualityVideoCaching](HFCameraUtilities, "disableFullQualityVideoCaching")&& !+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    -[HFCameraClipPlayer videoCache](self, "videoCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "waitForOperations");

    -[HFCameraClipPlayer setVideoCache:](self, "setVideoCache:", 0);
  }
  -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:forKeyPath:", self, CFSTR("timeControlStatus"));

  -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:forKeyPath:", self, CFSTR("status"));

  -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:forKeyPath:", self, CFSTR("currentItem"));

  -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:forKeyPath:", self, CFSTR("muted"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:", self);

  v12.receiver = self;
  v12.super_class = (Class)HFCameraClipPlayer;
  -[HFCameraClipPlayer dealloc](&v12, sel_dealloc);
}

- (HFCameraClipPosition)currentPosition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double Seconds;
  CMTime time;

  -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);

    +[HFCameraClipPosition positionWithClip:offset:](HFCameraClipPosition, "positionWithClip:offset:", v5, Seconds);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return (HFCameraClipPosition *)v8;
}

- (void)setCurrentPosition:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  char v11;
  NSObject *v12;
  HFCameraClipPlayer *v13;
  _BOOL4 scrubbing;
  int v15;
  HFCameraClipPlayer *v16;
  __int16 v17;
  NSObject *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[HFCameraClipPlayer hasFatalError](self, "hasFatalError"))
  {
    HFLogForCategory(0x17uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = objc_claimAutoreleasedReturnValue();
      -[HFCameraClipPlayer error](self, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = self;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Ignoring request to -[%@ %@] as the player has a fatal error and cannot be used. Error: %@", (uint8_t *)&v15, 0x20u);

    }
    goto LABEL_9;
  }
  -[HFCameraClipPlayer currentPosition](self, "currentPosition");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  v6 = v10;
  if (v9 == v10)
  {

LABEL_9:
    goto LABEL_14;
  }
  if (v9)
  {
    v11 = -[NSObject isEqual:](v9, "isEqual:", v10);

    if ((v11 & 1) != 0)
      goto LABEL_14;
  }
  else
  {

  }
  HFLogForCategory(0x17uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraClipPlayer currentPosition](self, "currentPosition");
    v13 = (HFCameraClipPlayer *)objc_claimAutoreleasedReturnValue();
    scrubbing = self->_scrubbing;
    v15 = 138412802;
    v16 = v13;
    v17 = 2112;
    v18 = v6;
    v19 = 1024;
    LODWORD(v20) = scrubbing;
    _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Player updating playback position \nFROM:%@ \nTO:%@\nScrubbing:%{BOOL}d", (uint8_t *)&v15, 0x1Cu);

  }
  -[HFCameraClipPlayer _rebuildPlayerQueueForPosition:](self, "_rebuildPlayerQueueForPosition:", v6);
LABEL_14:

}

- (double)currentTime
{
  void *v2;
  void *v3;
  double Seconds;
  CMTime time;

  -[HFCameraClipPlayer player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- (void)setLastPlayerItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_loadWeakRetained((id *)&self->_lastPlayerItem);
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v5)
    {
      v8 = objc_msgSend(v5, "isEqual:", v6);

      if ((v8 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    HFLogForCategory(0x17uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_lastPlayerItem);
      v11 = 138412546;
      v12 = WeakRetained;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Updating lastPlayerItem from: %@ to: %@", (uint8_t *)&v11, 0x16u);

    }
    -[HFCameraClipPlayer _setupObservationForLastPlayerItem:](self, "_setupObservationForLastPlayerItem:", v7);
    objc_storeWeak((id *)&self->_lastPlayerItem, v7);
  }
LABEL_10:

}

- (int64_t)timeControlStatus
{
  void *v2;
  int64_t v3;

  -[HFCameraClipPlayer player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "timeControlStatus");

  return v3;
}

- (BOOL)hasFatalError
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HFCameraClipPlayer player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)play
{
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  Float64 Seconds;
  void *v15;
  void *v16;
  CMTime time;
  uint8_t buf[4];
  HFCameraClipPlayer *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  Float64 v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = -[HFCameraClipPlayer hasFatalError](self, "hasFatalError");
  HFLogForCategory(0x17uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraClipPlayer error](self, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = self;
      v20 = 2112;
      v21 = v7;
      v22 = 2112;
      v23 = *(double *)&v8;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring request to -[%@ %@] as the player has a fatal error and cannot be used. Error: %@", buf, 0x20u);

    }
  }
  else
  {
    if (v6)
    {
      -[HFCameraClipPlayer currentPosition](self, "currentPosition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clip");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraClipPlayer player](self, "player");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
        objc_msgSend(v12, "currentTime");
      else
        memset(&time, 0, sizeof(time));
      Seconds = CMTimeGetSeconds(&time);
      -[HFCameraClipPlayer player](self, "player");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v19 = self;
      v20 = 2112;
      v21 = v11;
      v22 = 2048;
      v23 = Seconds;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "-[%@ play] clipUUID:%@ at offset:%.2f for item:%@", buf, 0x2Au);

    }
    -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject play](v5, "play");
  }

}

- (void)pause
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  HFCameraClipPlayer *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x17uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraClipPlayer currentPosition](self, "currentPosition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clip");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraClipPlayer currentPosition](self, "currentPosition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "-[%@ pause] clipUUID:%@ at:%@", (uint8_t *)&v10, 0x20u);

  }
  -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pause");

}

- (void)endScrubbingWithOffset:(double)a3
{
  id v5;

  -[HFCameraClipPlayer setScrubbing:](self, "setScrubbing:", 0);
  -[HFCameraClipPlayer scrubber](self, "scrubber");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endScrubbingWithTargetTime:", a3);

}

- (void)setScrubbing:(BOOL)a3
{
  id v3;

  if (self->_scrubbing != a3)
  {
    self->_scrubbing = a3;
    if (a3)
    {
      -[HFCameraClipPlayer scrubber](self, "scrubber");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "beginScrubbing");

    }
  }
}

- (id)addPeriodicTimeObserverForInterval:(double)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  CMTime v13;

  v6 = a4;
  -[HFCameraClipPlayer player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeWithSeconds(&v13, a3, 60);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__HFCameraClipPlayer_addPeriodicTimeObserverForInterval_usingBlock___block_invoke;
  v11[3] = &unk_1EA72A840;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v13, MEMORY[0x1E0C80D38], v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __68__HFCameraClipPlayer_addPeriodicTimeObserverForInterval_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeTimeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFCameraClipPlayer player](self, "player");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTimeObserver:", v4);

}

- (void)_updatePlayerActionAtItemEnd
{
  _BOOL8 v3;
  void *v4;
  id v5;

  -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "timeControlStatus") != 2;
  -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActionAtItemEnd:", v3);

}

- (void)_updateErrorState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD block[5];

  -[HFCameraClipPlayer error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipPlayer player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HFCameraClipPlayer setError:](self, "setError:", v5);
  }
  else
  {
    -[HFCameraClipPlayer player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraClipPlayer setError:](self, "setError:", v8);

  }
  -[HFCameraClipPlayer error](self, "error");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v3;
  v11 = v10;
  if (v9 == v10)
  {

  }
  else
  {
    if (v9)
    {
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if ((v12 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__HFCameraClipPlayer__updateErrorState__block_invoke;
    block[3] = &unk_1EA727DD8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    -[HFCameraClipPlayer error](self, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HFCameraClipPlayer error](self, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = +[HFCameraAnalyticsEventHandler sendCameraClipPlayerDidUpdateEventWithError:](HFCameraAnalyticsEventHandler, "sendCameraClipPlayerDidUpdateEventWithError:", v14);

    }
  }
LABEL_12:

}

void __39__HFCameraClipPlayer__updateErrorState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clipPlayer:didUpdateError:isFatal:", v2, v3, objc_msgSend(*(id *)(a1 + 32), "hasFatalError"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  HFCameraClipPlayer *v31;
  objc_super v32;
  _QWORD block[5];
  uint8_t buf[4];
  HFCameraClipPlayer *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if ((void *)HFCameraClipQueuePlayerContext != a6)
  {
    v32.receiver = self;
    v32.super_class = (Class)HFCameraClipPlayer;
    -[HFCameraClipPlayer observeValueForKeyPath:ofObject:change:context:](&v32, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
    goto LABEL_26;
  }
  if (-[HFCameraClipPlayer isMutatingQueue](self, "isMutatingQueue"))
    goto LABEL_26;
  if (objc_msgSend(v10, "isEqual:", CFSTR("timeControlStatus")))
  {
    HFLogForCategory(0x17uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = self;
      v36 = 2048;
      v37 = objc_msgSend(v12, "timeControlStatus");
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "clipPlayer:%@ didUpdateTimeControlStatus:%ld", buf, 0x16u);

    }
    -[HFCameraClipPlayer _updatePlayerActionAtItemEnd](self, "_updatePlayerActionAtItemEnd");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__HFCameraClipPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1EA727DD8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_26;
  }
  if (objc_msgSend(v10, "isEqual:", CFSTR("currentItem")))
  {
    HFLogForCategory(0x17uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = self;
      v36 = 2112;
      v37 = (uint64_t)v15;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "clipPlayer:%@ currentItemDidChange:%@", buf, 0x16u);

    }
    -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clip");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      +[HFCameraClipPosition positionWithClip:offset:](HFCameraClipPosition, "positionWithClip:offset:", v18, 0.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    HFLogForCategory(0x17uLL);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      -[HFCameraClipPlayer currentPosition](self, "currentPosition");
      v31 = (HFCameraClipPlayer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v31;
      v36 = 2112;
      v37 = (uint64_t)v19;
      _os_log_impl(&dword_1DD34E000, v30, OS_LOG_TYPE_DEFAULT, "Updating position from:%@ to:%@", buf, 0x16u);

    }
    -[HFCameraClipPlayer _rebuildPlayerQueueForPosition:](self, "_rebuildPlayerQueueForPosition:", v19);
    -[HFCameraClipPlayer _updateErrorState](self, "_updateErrorState");
    goto LABEL_25;
  }
  if (!objc_msgSend(v10, "isEqual:", CFSTR("status")))
  {
    if (!objc_msgSend(v10, "isEqual:", CFSTR("muted")))
      goto LABEL_26;
    HFLogForCategory(0x17uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)MEMORY[0x1E0CB37E8];
      -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "numberWithBool:", objc_msgSend(v28, "isMuted"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = self;
      v36 = 2112;
      v37 = (uint64_t)v29;
      _os_log_impl(&dword_1DD34E000, v26, OS_LOG_TYPE_DEFAULT, "clipPlayer:%@ mutedDidChange:%@", buf, 0x16u);

    }
    -[HFCameraClipPlayer delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "clipPlayer:didUpdateMuted:", self, objc_msgSend(v19, "isMuted"));
LABEL_25:

    goto LABEL_26;
  }
  HFLogForCategory(0x17uLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "status"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "error");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v35 = self;
    v36 = 2112;
    v37 = (uint64_t)v23;
    v38 = 2112;
    v39 = v25;
    _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "clipPlayer:%@ statusDidChange:%@, error: %@", buf, 0x20u);

  }
  -[HFCameraClipPlayer _updateErrorState](self, "_updateErrorState");
LABEL_26:

}

void __69__HFCameraClipPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "queuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clipPlayer:didUpdateTimeControlStatus:", v2, objc_msgSend(v3, "timeControlStatus"));

}

- (void)_setupPlayerObservation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("timeControlStatus"), 0, HFCameraClipQueuePlayerContext);

  -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem"), 0, HFCameraClipQueuePlayerContext);

  -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 0, HFCameraClipQueuePlayerContext);

  -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("muted"), 0, HFCameraClipQueuePlayerContext);

}

- (void)_setupObservationForLastPlayerItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v4 = a3;
  -[HFCameraClipPlayer lastPlayerItem](self, "lastPlayerItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v10 = v6;
  if (v5 == v6)
  {

    v9 = v10;
    goto LABEL_8;
  }
  v7 = v6;
  if (v5)
  {
    v8 = objc_msgSend(v5, "isEqual:", v6);

    if ((v8 & 1) != 0)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC48], v5);
  }

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_playerItemDidPlayToEndTime_, *MEMORY[0x1E0C8AC48], v10);
LABEL_8:

  }
LABEL_9:

}

- (void)_rebuildPlayerQueueForPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  HFCameraClipPlayerQueueUpdate *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (+[HFCameraUtilities disableFullQualityVideoCaching](HFCameraUtilities, "disableFullQualityVideoCaching")|| +[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled")|| -[HFCameraClipPlayer isScrubbing](self, "isScrubbing"))
    {
      goto LABEL_19;
    }
    -[HFCameraClipPlayer clips](self, "clips");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v4, "clip");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
LABEL_19:
        HFLogForCategory(0x17uLL);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v39 = 138412290;
          v40 = (uint64_t)v4;
          _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "Rebuilding player queue for position:%@.", (uint8_t *)&v39, 0xCu);
        }

        v19 = [HFCameraClipPlayerQueueUpdate alloc];
        -[HFCameraClipPlayer cameraProfile](self, "cameraProfile");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "clipManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFCameraClipPlayer clips](self, "clips");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "items");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[HFCameraClipPlayerQueueUpdate initWithClipManager:clips:targetPosition:queuedItems:queueLimit:](v19, "initWithClipManager:clips:targetPosition:queuedItems:queueLimit:", v21, v22, v4, v24, 3);

        -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "timeControlStatus");

        if (-[NSObject queueChangesRequireRebuild](v16, "queueChangesRequireRebuild"))
        {
          -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "pause");

        }
        v28 = -[HFCameraClipPlayer isMutatingQueue](self, "isMutatingQueue");
        -[HFCameraClipPlayer setMutatingQueue:](self, "setMutatingQueue:", 1);
        -[NSObject performUpdatesOnQueue:](v16, "performUpdatesOnQueue:", self);
        -[HFCameraClipPlayer setMutatingQueue:](self, "setMutatingQueue:", v28);
        if (v26 && -[NSObject queueChangesRequireRebuild](v16, "queueChangesRequireRebuild"))
        {
          -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "play");

        }
        -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "items");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "lastObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFCameraClipPlayer setLastPlayerItem:](self, "setLastPlayerItem:", v32);

        HFLogForCategory(0x17uLL);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "timeControlStatus");
          -[HFCameraClipPlayer lastPlayerItem](self, "lastPlayerItem");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "items");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 134218498;
          v40 = v35;
          v41 = 2112;
          v42 = v36;
          v43 = 2112;
          v44 = v38;
          _os_log_impl(&dword_1DD34E000, v33, OS_LOG_TYPE_DEFAULT, "Finished rebuilding player queue for status:%lu for item:%@ for items = %@", (uint8_t *)&v39, 0x20u);

        }
        goto LABEL_29;
      }
      objc_opt_class();
      objc_msgSend(v4, "clip");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v5;
      else
        v7 = 0;
      v8 = v7;

      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0C99E60];
        -[HFCameraClipPlayer clips](self, "clips");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setWithArray:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v8);

        -[HFCameraClipPlayer videoCache](self, "videoCache");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFCameraClipPlayer clips](self, "clips");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v12)
        {
          objc_msgSend(v13, "cacheClip:inClips:", v8, v14);
        }
        else
        {
          objc_msgSend(v14, "lastObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "cacheClip:", v17);

        }
      }
      else
      {
        v5 = 0;
      }
    }

    goto LABEL_19;
  }
  HFLogForCategory(0x17uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v39) = 0;
    _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "Skipping rebuilding queue as we don't have a playback position yet", (uint8_t *)&v39, 2u);
  }
LABEL_29:

}

- (void)playerItemDidPlayToEndTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  _QWORD block[5];
  uint8_t buf[4];
  HFCameraClipPlayer *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  HFLogForCategory(0x17uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "clipPlayer:%@ did receive endTime notification:%@", buf, 0x16u);
  }

  if (v7)
  {
    -[HFCameraClipPlayer lastPlayerItem](self, "lastPlayerItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v9)
    {

    }
    else
    {
      v10 = objc_msgSend(v7, "isEqual:", v9);

      if ((v10 & 1) == 0)
      {

        goto LABEL_15;
      }
    }
    -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 <= 1)
    {
      HFLogForCategory(0x17uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v17 = self;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "lastPlayerItem for clipPlayer:%@ playerItemDidPlayToEndTime:%@", buf, 0x16u);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__HFCameraClipPlayer_playerItemDidPlayToEndTime___block_invoke;
      block[3] = &unk_1EA727DD8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
LABEL_15:

}

void __49__HFCameraClipPlayer_playerItemDidPlayToEndTime___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clipPlayerDidPlayToEndTime:", *(_QWORD *)(a1 + 32));

}

- (NSArray)queuableItems
{
  void *v2;
  void *v3;

  -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)createQueueableItemForClipManager:(id)a3 clip:(id)a4
{
  id v5;
  id v6;
  HFCameraClipPlayerItem *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HFCameraClipPlayerItem initWithClipManager:clip:]([HFCameraClipPlayerItem alloc], "initWithClipManager:clip:", v6, v5);

  return v7;
}

- (void)insertQueueableItem:(id)a3 afterItem:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  if (v20)
  {
    -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    v9 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

    }
    v12 = objc_opt_class();
    v13 = v6;
    if (v13)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v13;
      if (v14)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v12, objc_opt_class());

    }
    v15 = 0;
LABEL_14:

    objc_msgSend(v7, "insertItem:afterItem:", v11, v15);
  }

}

- (void)removeQueueableItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[HFCameraClipPlayer queuePlayer](self, "queuePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v11 = v4;
  if (!v11)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v11;
  else
    v7 = 0;
  v8 = v11;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v6, objc_opt_class());

LABEL_7:
    v8 = 0;
  }

  objc_msgSend(v5, "removeItem:", v8);
}

- (void)seekToOffset:(double)a3 inItem:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  CMTime v20;
  uint8_t buf[4];
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_opt_class();
  v8 = v6;
  if (!v8)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v8;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class());

LABEL_7:
    v10 = 0;
  }

  objc_msgSend(v10, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "statusOfValueForKey:error:", CFSTR("duration"), 0);

  if (-[HFCameraClipPlayer isScrubbing](self, "isScrubbing")
    && (-[HFCameraClipPlayer scrubber](self, "scrubber"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v15)
    && v14 == 2)
  {
    if (!-[HFCameraClipPlayer shouldBypassScrubbing](self, "shouldBypassScrubbing"))
    {
      HFLogForCategory(0x17uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[HFCameraClipPlayer scrubber](self, "scrubber");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v22 = a3;
        v23 = 2112;
        v24 = *(double *)&v8;
        v25 = 2112;
        v26 = v17;
        _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "Seeking to offset: %f in item: %@ with scrubber:%@", buf, 0x20u);

      }
      -[HFCameraClipPlayer scrubber](self, "scrubber");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scrubToTime:", a3);

    }
  }
  else
  {
    HFLogForCategory(0x17uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = *(double *)&self;
      v23 = 2048;
      v24 = a3;
      _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "ClipPlayer:%@ Seeking to offset:%.2f", buf, 0x16u);
    }

    CMTimeMakeWithSeconds(&v20, a3, 1000);
    objc_msgSend(v10, "seekToTime:completionHandler:", &v20, 0);
  }

}

- (HFCameraClipPlayerDelegate)delegate
{
  return (HFCameraClipPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HFCameraClipScrubbing)scrubber
{
  return (HFCameraClipScrubbing *)objc_loadWeakRetained((id *)&self->_scrubber);
}

- (void)setScrubber:(id)a3
{
  objc_storeWeak((id *)&self->_scrubber, a3);
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (NSArray)clips
{
  return self->_clips;
}

- (void)setClips:(id)a3
{
  objc_storeStrong((id *)&self->_clips, a3);
}

- (BOOL)shouldBypassScrubbing
{
  return self->_shouldBypassScrubbing;
}

- (void)setShouldBypassScrubbing:(BOOL)a3
{
  self->_shouldBypassScrubbing = a3;
}

- (BOOL)isMutatingQueue
{
  return self->_mutatingQueue;
}

- (void)setMutatingQueue:(BOOL)a3
{
  self->_mutatingQueue = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (HFCameraClipPlayerItem)lastPlayerItem
{
  return (HFCameraClipPlayerItem *)objc_loadWeakRetained((id *)&self->_lastPlayerItem);
}

- (HFCameraVideoCache)videoCache
{
  return self->_videoCache;
}

- (void)setVideoCache:(id)a3
{
  objc_storeStrong((id *)&self->_videoCache, a3);
}

- (HFCameraClipQueuePlayer)queuePlayer
{
  return self->_queuePlayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuePlayer, 0);
  objc_storeStrong((id *)&self->_videoCache, 0);
  objc_destroyWeak((id *)&self->_lastPlayerItem);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_clips, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_destroyWeak((id *)&self->_scrubber);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
