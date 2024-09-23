@implementation CLKVideoPlayerView

- (CLKVideoPlayerView)initWithFrame:(CGRect)a3
{
  CLKVideoPlayerView *v3;
  void *v4;
  void *v5;
  void *v6;
  _CLKPlayerView *v7;
  uint64_t v8;
  _CLKPlayerView *playerView;
  id v10;
  uint64_t v11;
  objc_class *v12;
  AVQueuePlayer *v13;
  AVQueuePlayer *player;
  void *v15;
  void *v16;
  __int128 v17;
  AVQueuePlayer *v18;
  uint64_t v19;
  id periodicTimeObserver;
  void *v21;
  id *v22;
  void *v23;
  id v24;
  CLKVideoPlayerView *result;
  _QWORD v26[4];
  id v27;
  char v28[24];
  objc_super v29;
  __int128 v30;
  uint64_t v31;
  void *v32;
  id *v33;
  id location;
  id *p_location;
  uint64_t v36;
  uint64_t v37;

  v29.receiver = self;
  v29.super_class = (Class)CLKVideoPlayerView;
  v3 = -[CLKVideoPlayerView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v3)
    return v3;
  objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequiresNoAudioResources:error:", 1, 0);

  objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getAVAudioSessionCategoryAmbient();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCategory:withOptions:error:", v6, 1, 0);

  v3->_pausedViewEnabled = 1;
  v3->_gravityResize = 1;
  v7 = [_CLKPlayerView alloc];
  v8 = -[_CLKPlayerView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  playerView = v3->_playerView;
  v3->_playerView = (_CLKPlayerView *)v8;

  -[CLKVideoPlayerView addSubview:](v3, "addSubview:", v3->_playerView);
  location = 0;
  p_location = &location;
  v36 = 0x2050000000;
  v10 = (id)getAVQueuePlayerClass_softClass;
  v37 = getAVQueuePlayerClass_softClass;
  v11 = MEMORY[0x24BDAC760];
  if (!getAVQueuePlayerClass_softClass)
  {
    *(_QWORD *)&v30 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v30 + 1) = 3221225472;
    v31 = (uint64_t)__getAVQueuePlayerClass_block_invoke;
    v32 = &unk_24CBF9D00;
    v33 = &location;
    __getAVQueuePlayerClass_block_invoke((uint64_t)&v30);
    v10 = p_location[3];
  }
  v12 = (objc_class *)objc_retainAutorelease(v10);
  _Block_object_dispose(&location, 8);
  v13 = (AVQueuePlayer *)objc_alloc_init(v12);
  player = v3->_player;
  v3->_player = v13;

  -[AVQueuePlayer _setCALayerDestinationIsTVOut:](v3->_player, "_setCALayerDestinationIsTVOut:", 1);
  -[_CLKPlayerView layer](v3->_playerView, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPlayer:", v3->_player);

  -[CLKVideoPlayerView setGravityResize:](v3, "setGravityResize:", v3->_gravityResize);
  -[_CLKPlayerView layer](v3->_playerView, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:forKeyPath:options:context:", v3, CFSTR("readyForDisplay"), 0, &kCLKVideoPlayerLayerKVOContext);

  objc_initWeak(&location, v3);
  _CMTimeMakeWithSeconds(0xFFFFFFFFLL, 0.0);
  v17 = v30;
  v3->_willBeginPlayingTime.epoch = v31;
  *(_OWORD *)&v3->_willBeginPlayingTime.value = v17;
  v18 = v3->_player;
  _CMTimeMakeWithSeconds(60, 10.0);
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __36__CLKVideoPlayerView_initWithFrame___block_invoke;
  v26[3] = &unk_24CBFAFC8;
  objc_copyWeak(&v27, &location);
  -[AVQueuePlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](v18, "addPeriodicTimeObserverForInterval:queue:usingBlock:", v28, 0, v26);
  v19 = objc_claimAutoreleasedReturnValue();
  periodicTimeObserver = v3->_periodicTimeObserver;
  v3->_periodicTimeObserver = (id)v19;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v30 = 0;
  *((_QWORD *)&v30 + 1) = &v30;
  v31 = 0x2020000000;
  v22 = (id *)getAVPlayerItemDidPlayToEndTimeNotificationSymbolLoc_ptr;
  v32 = (void *)getAVPlayerItemDidPlayToEndTimeNotificationSymbolLoc_ptr;
  if (!getAVPlayerItemDidPlayToEndTimeNotificationSymbolLoc_ptr)
  {
    v23 = (void *)AVFoundationLibrary();
    v22 = (id *)dlsym(v23, "AVPlayerItemDidPlayToEndTimeNotification");
    *(_QWORD *)(*((_QWORD *)&v30 + 1) + 24) = v22;
    getAVPlayerItemDidPlayToEndTimeNotificationSymbolLoc_ptr = (uint64_t)v22;
  }
  _Block_object_dispose(&v30, 8);
  if (v22)
  {
    v24 = *v22;
    objc_msgSend(v21, "addObserver:selector:name:object:", v3, sel__handleDidPlayToEndTime_, v24, 0);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    return v3;
  }
  dlerror();
  result = (CLKVideoPlayerView *)abort_report_np();
  __break(1u);
  return result;
}

void __36__CLKVideoPlayerView_initWithFrame___block_invoke(uint64_t a1, __int128 *a2)
{
  id WeakRetained;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = *a2;
  v5 = *((_QWORD *)a2 + 2);
  objc_msgSend(WeakRetained, "_periodicTimeObserverChanged:", &v4);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[AVQueuePlayer removeTimeObserver:](self->_player, "removeTimeObserver:", self->_periodicTimeObserver);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CLKVideoPlayerView _stopObservingPlayerItem](self, "_stopObservingPlayerItem");
  -[_CLKPlayerView layer](self->_playerView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("readyForDisplay"), &kCLKVideoPlayerLayerKVOContext);

  v5.receiver = self;
  v5.super_class = (Class)CLKVideoPlayerView;
  -[CLKVideoPlayerView dealloc](&v5, sel_dealloc);
}

+ (void)_prewarm
{
  id v2;

  v2 = (id)objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKVideoPlayerView;
  -[CLKVideoPlayerView layoutSubviews](&v3, sel_layoutSubviews);
  -[CLKVideoPlayerView bounds](self, "bounds");
  -[_CLKPlayerView setFrame:](self->_playerView, "setFrame:");
  if (self->_pausedViewEnabled)
  {
    -[CLKVideoPlayerView bounds](self, "bounds");
    -[UIView setFrame:](self->_pausedView, "setFrame:");
  }
}

- (AVQueuePlayer)player
{
  return self->_player;
}

- (void)setGravityResize:(int64_t)a3
{
  id *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _Unwind_Exception *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  self->_gravityResize = a3;
  if (a3 == 1)
    goto LABEL_7;
  if (a3)
  {
    v7 = 0;
    goto LABEL_12;
  }
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v4 = (id *)getAVLayerVideoGravityResizeAspectSymbolLoc_ptr;
  v13 = getAVLayerVideoGravityResizeAspectSymbolLoc_ptr;
  if (!getAVLayerVideoGravityResizeAspectSymbolLoc_ptr)
  {
    v5 = (void *)AVFoundationLibrary();
    v4 = (id *)dlsym(v5, "AVLayerVideoGravityResizeAspect");
    v11[3] = (uint64_t)v4;
    getAVLayerVideoGravityResizeAspectSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v10, 8);
  if (!v4)
  {
    __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
LABEL_7:
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v4 = (id *)getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr;
    v13 = getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr;
    if (!getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr)
    {
      v6 = (void *)AVFoundationLibrary();
      v4 = (id *)dlsym(v6, "AVLayerVideoGravityResizeAspectFill");
      v11[3] = (uint64_t)v4;
      getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr = (uint64_t)v4;
    }
    _Block_object_dispose(&v10, 8);
    if (!v4)
    {
      v9 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
      _Block_object_dispose(&v10, 8);
      _Unwind_Resume(v9);
    }
  }
  v7 = *v4;
LABEL_12:
  -[_CLKPlayerView layer](self->_playerView, "layer", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVideoGravity:", v7);

}

- (void)_observePlayerItem:(id)a3
{
  AVPlayerItem **p_observedItem;
  id v6;

  p_observedItem = &self->_observedItem;
  objc_storeStrong((id *)&self->_observedItem, a3);
  v6 = a3;
  -[AVPlayerItem addObserver:forKeyPath:options:context:](*p_observedItem, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 0, &kCLKVideoPlayerViewKVOContext);

}

- (void)_stopObservingPlayerItem
{
  AVPlayerItem *observedItem;

  -[AVPlayerItem removeObserver:forKeyPath:context:](self->_observedItem, "removeObserver:forKeyPath:context:", self, CFSTR("status"), &kCLKVideoPlayerViewKVOContext);
  observedItem = self->_observedItem;
  self->_observedItem = 0;

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  AVPlayerItem *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  objc_super v18;

  v10 = a3;
  v11 = (AVPlayerItem *)a4;
  v12 = a5;
  if (a6 == &kCLKVideoPlayerViewKVOContext)
  {
    if (self->_observedItem == v11)
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("status")))
      {
        if (-[AVPlayerItem status](self->_playerItem, "status") == AVPlayerItemStatusReadyToPlay)
        {
          -[CLKVideoPlayerView _stopObservingPlayerItem](self, "_stopObservingPlayerItem");
          -[CLKVideoPlayerView _performNextRequest](self, "_performNextRequest");
          -[CLKVideoPlayerView delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_opt_respondsToSelector();

          if ((v14 & 1) != 0)
          {
            -[CLKVideoPlayerView delegate](self, "delegate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "videoPlayerViewWillBeginPlaying:", self);

          }
        }
      }
    }
  }
  else if (a6 == &kCLKVideoPlayerLayerKVOContext)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("readyForDisplay")))
    {
      -[_CLKPlayerView layer](self->_playerView, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isReadyForDisplay");

      if (v17)
        -[CLKVideoPlayerView _performNextRequest](self, "_performNextRequest");
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CLKVideoPlayerView;
    -[CLKVideoPlayerView observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_handleDidPlayToEndTime:(id)a3
{
  id v4;
  AVPlayerItem *v5;
  AVPlayerItem *playerItem;
  AVPlayerItem *v7;
  AVPlayerItem **p_playerItem;
  AVPlayerItem *v9;
  AVPlayerItem *queuedItem;
  AVPlayerItem *v11;
  void (*v12)(uint64_t);
  uint64_t *p_block;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t block;

  v4 = a3;
  if (-[AVQueuePlayer actionAtItemEnd](self->_player, "actionAtItemEnd") == 1)
  {
    objc_msgSend(v4, "object");
    v5 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue();
    playerItem = self->_playerItem;

    if (v5 == playerItem)
    {
      -[CLKVideoPlayerView _pause](self, "_pause");
      block = MEMORY[0x24BDAC760];
      v12 = __46__CLKVideoPlayerView__handleDidPlayToEndTime___block_invoke;
      p_block = &block;
LABEL_10:
      p_block[1] = 3221225472;
      p_block[2] = (uint64_t)v12;
      p_block[3] = (uint64_t)&unk_24CBF9F60;
      p_block[4] = (uint64_t)self;
      dispatch_async(MEMORY[0x24BDAC9B8], p_block);
      goto LABEL_11;
    }
  }
  if (!-[AVQueuePlayer actionAtItemEnd](self->_player, "actionAtItemEnd"))
  {
    objc_msgSend(v4, "object");
    v7 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue();
    p_playerItem = &self->_playerItem;
    v9 = self->_playerItem;

    if (v7 == v9)
    {
      queuedItem = self->_queuedItem;
      if (queuedItem)
      {
        objc_storeStrong((id *)&self->_playerItem, queuedItem);
        v11 = self->_queuedItem;
        self->_queuedItem = 0;

        if (-[AVPlayerItem status](*p_playerItem, "status") != AVPlayerItemStatusReadyToPlay)
          -[CLKVideoPlayerView _observePlayerItem:](self, "_observePlayerItem:", *p_playerItem);
        v16 = MEMORY[0x24BDAC760];
        v12 = __46__CLKVideoPlayerView__handleDidPlayToEndTime___block_invoke_2;
        p_block = &v16;
      }
      else
      {
        CLKLoggingObjectForDomain(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[CLKVideoPlayerView _handleDidPlayToEndTime:].cold.1(v14);

        v15 = MEMORY[0x24BDAC760];
        v12 = __46__CLKVideoPlayerView__handleDidPlayToEndTime___block_invoke_17;
        p_block = &v15;
      }
      goto LABEL_10;
    }
  }
LABEL_11:

}

void __46__CLKVideoPlayerView__handleDidPlayToEndTime___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoPlayerViewDidPauseAfterPlayingVideoToEnd:", *(_QWORD *)(a1 + 32));

}

void __46__CLKVideoPlayerView__handleDidPlayToEndTime___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoPlayerViewDidBeginPlayingQueuedVideo:", *(_QWORD *)(a1 + 32));

}

void __46__CLKVideoPlayerView__handleDidPlayToEndTime___block_invoke_17(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoPlayerViewDidPauseAfterPlayingVideoToEnd:", *(_QWORD *)(a1 + 32));

}

- (void)_periodicTimeObserverChanged:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_willBeginPlayingTime;
  id v5;
  __n128 v6;
  int64_t epoch;
  __n128 v8;
  int64_t var3;

  p_willBeginPlayingTime = &self->_willBeginPlayingTime;
  if (self->_willBeginPlayingTime.timescale >= 1)
  {
    v8 = *(__n128 *)&a3->var0;
    var3 = a3->var3;
    v6 = *(__n128 *)&p_willBeginPlayingTime->value;
    epoch = self->_willBeginPlayingTime.epoch;
    if (_CMTimeCompare((__int128 *)&v8, (__int128 *)&v6))
    {
      if (self->_pausedViewEnabled)
        -[CLKVideoPlayerView _hidePausedView](self, "_hidePausedView");
      getkCMTimePositiveInfinity(&v8);
      *(__n128 *)&p_willBeginPlayingTime->value = v8;
      p_willBeginPlayingTime->epoch = var3;
      kdebug_trace();
      -[CLKVideoPlayerView delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "videoPlayerViewDidBeginPlaying:", self);

    }
  }
}

- (BOOL)_readyToPerformRequest
{
  void *v3;
  BOOL v4;

  if (-[AVPlayerItem status](self->_playerItem, "status") != AVPlayerItemStatusReadyToPlay)
    return 0;
  -[_CLKPlayerView layer](self->_playerView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isReadyForDisplay"))
    v4 = self->_servicingRequest == 0;
  else
    v4 = 0;

  return v4;
}

- (void)_performNextRequest
{
  NSValue *seekRequested;
  _BYTE v4[24];

  if (-[CLKVideoPlayerView _readyToPerformRequest](self, "_readyToPerformRequest"))
  {
    seekRequested = self->_seekRequested;
    if (seekRequested)
    {
      -[NSValue CMTimeValue](seekRequested, "CMTimeValue");
      -[CLKVideoPlayerView _seekToTime:](self, "_seekToTime:", v4);
    }
    else if ((*((_BYTE *)self + 552) & 2) != 0)
    {
      -[CLKVideoPlayerView _preroll](self, "_preroll");
    }
    else if ((*((_BYTE *)self + 552) & 1) != 0)
    {
      -[CLKVideoPlayerView _play](self, "_play");
    }
  }
  else
  {
    -[AVPlayerItem status](self->_playerItem, "status");
  }
}

- (void)_showPausedView
{
  UIView *v3;
  UIView *pausedView;

  if (!self->_pausedView)
  {
    -[_CLKPlayerView snapshotViewAfterScreenUpdates:](self->_playerView, "snapshotViewAfterScreenUpdates:", 0);
    v3 = (UIView *)objc_claimAutoreleasedReturnValue();
    pausedView = self->_pausedView;
    self->_pausedView = v3;

    -[CLKVideoPlayerView addSubview:](self, "addSubview:", self->_pausedView);
  }
}

- (void)_hidePausedView
{
  UIView *pausedView;

  -[UIView removeFromSuperview](self->_pausedView, "removeFromSuperview");
  pausedView = self->_pausedView;
  self->_pausedView = 0;

}

- (void)setPausedViewEnabled:(BOOL)a3
{
  self->_pausedViewEnabled = a3;
  if (!a3)
    -[CLKVideoPlayerView _hidePausedView](self, "_hidePausedView");
}

- (BOOL)isPlaybackReady
{
  AVPlayerItem *v3;
  BOOL v4;
  void *v5;

  -[AVQueuePlayer currentItem](self->_player, "currentItem");
  v3 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue();
  if (v3 == self->_playerItem)
  {
    -[AVQueuePlayer currentItem](self->_player, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "status") == 1
      && -[AVQueuePlayer status](self->_player, "status") == 1
      && (*((_BYTE *)self + 552) & 4) == 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)resetRequestState
{
  NSValue *seekRequested;

  self->_servicingRequest = 0;
  *((_BYTE *)self + 552) &= ~1u;
  seekRequested = self->_seekRequested;
  self->_seekRequested = 0;

  *((_BYTE *)self + 552) &= ~2u;
  *((_BYTE *)self + 552) &= ~4u;
}

- (void)loadVideo:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CLKLoggingObjectForDomain(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2114F4000, v5, OS_LOG_TYPE_DEFAULT, "CLKVideoPlayerView loadVideo [video url]:%@", (uint8_t *)&v6, 0xCu);
  }

  -[CLKVideoPlayerView _loadVideo:](self, "_loadVideo:", v4);
}

- (void)queueVideo:(id)a3
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CLKLoggingObjectForDomain(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2114F4000, v4, OS_LOG_TYPE_DEFAULT, "CLKVideoPlayerView queueVideo [video url] :%@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)prepareNextQueuedVideo
{
  AVPlayerItem *queuedItem;
  AVPlayerItem **p_playerItem;
  AVPlayerItem *v5;

  queuedItem = self->_queuedItem;
  if (queuedItem)
  {
    p_playerItem = &self->_playerItem;
    objc_storeStrong((id *)&self->_playerItem, queuedItem);
    v5 = self->_queuedItem;
    self->_queuedItem = 0;

    if (-[AVPlayerItem status](*p_playerItem, "status") != AVPlayerItemStatusReadyToPlay)
      -[CLKVideoPlayerView _observePlayerItem:](self, "_observePlayerItem:", *p_playerItem);
  }
}

- (void)pause
{
  if (self->_playing)
    -[CLKVideoPlayerView _pause](self, "_pause");
}

- (void)play
{
  if (!self->_playing)
  {
    kdebug_trace();
    self->_playing = 1;
    if (-[CLKVideoPlayerView _readyToPerformRequest](self, "_readyToPerformRequest"))
      -[CLKVideoPlayerView _play](self, "_play");
    else
      *((_BYTE *)self + 552) |= 1u;
  }
}

- (void)seekToTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;
  __n128 v6;

  getkCMTimePositiveInfinity(&v6);
  v5 = *a3;
  -[CLKVideoPlayerView seekToTime:tolerance:](self, "seekToTime:tolerance:", &v5, &v6);
}

- (void)seekToTime:(id *)a3 tolerance:(id *)a4
{
  int64_t var3;
  NSValue *v8;
  NSValue *seekRequested;
  __int128 v10;
  int64_t v11;

  kdebug_trace();
  var3 = a4->var3;
  *(_OWORD *)&self->_seekWithTolerance.value = *(_OWORD *)&a4->var0;
  self->_seekWithTolerance.epoch = var3;
  if (-[CLKVideoPlayerView _readyToPerformRequest](self, "_readyToPerformRequest"))
  {
    v10 = *(_OWORD *)&a3->var0;
    v11 = a3->var3;
    -[CLKVideoPlayerView _seekToTime:](self, "_seekToTime:", &v10);
  }
  else
  {
    v10 = *(_OWORD *)&a3->var0;
    v11 = a3->var3;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v10);
    v8 = (NSValue *)objc_claimAutoreleasedReturnValue();
    seekRequested = self->_seekRequested;
    self->_seekRequested = v8;

  }
}

- (void)expectPreroll
{
  *((_BYTE *)self + 552) |= 4u;
}

- (void)preroll
{
  *((_BYTE *)self + 552) &= ~4u;
  kdebug_trace();
  if (-[CLKVideoPlayerView _readyToPerformRequest](self, "_readyToPerformRequest"))
    -[CLKVideoPlayerView _preroll](self, "_preroll");
  else
    *((_BYTE *)self + 552) |= 2u;
}

- (id)_createPlayerItemForVideoURL:(id)a3
{
  id v5;
  void *v6;
  id v7;
  AVAsset *v8;
  AVAsset *asset;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a3;
  if ((-[NSURL isEqual:](self->_assetURL, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_assetURL, a3);
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v6 = (void *)getAVURLAssetClass_softClass;
    v22 = getAVURLAssetClass_softClass;
    if (!getAVURLAssetClass_softClass)
    {
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __getAVURLAssetClass_block_invoke;
      v17 = &unk_24CBF9D00;
      v18 = &v19;
      __getAVURLAssetClass_block_invoke((uint64_t)&v14);
      v6 = (void *)v20[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v19, 8);
    objc_msgSend(v7, "URLAssetWithURL:options:", v5, 0);
    v8 = (AVAsset *)objc_claimAutoreleasedReturnValue();
    asset = self->_asset;
    self->_asset = v8;

  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v10 = (void *)getAVPlayerItemClass_softClass;
  v22 = getAVPlayerItemClass_softClass;
  if (!getAVPlayerItemClass_softClass)
  {
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __getAVPlayerItemClass_block_invoke;
    v17 = &unk_24CBF9D00;
    v18 = &v19;
    __getAVPlayerItemClass_block_invoke((uint64_t)&v14);
    v10 = (void *)v20[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v11, "playerItemWithAsset:", self->_asset);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_preroll
{
  void *v3;
  void *v4;
  void *v5;
  AVQueuePlayer *player;
  _QWORD v7[5];

  objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequiresNoAudioResources:error:", 1, 0);

  objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getAVAudioSessionCategoryAmbient();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCategory:withOptions:error:", v5, 1, 0);

  self->_servicingRequest = 2;
  kdebug_trace();
  player = self->_player;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__CLKVideoPlayerView__preroll__block_invoke;
  v7[3] = &unk_24CBFAFF8;
  v7[4] = self;
  -[AVQueuePlayer prerollAtRate:completionHandler:](player, "prerollAtRate:completionHandler:", v7, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0)));
}

uint64_t __30__CLKVideoPlayerView__preroll__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  char v5;
  id v6;

  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 560));
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 560));
    objc_msgSend(v6, "videoPlayerView:didFinishPrerolling:", *(_QWORD *)(a1 + 32), a2);

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 552) &= ~2u;
  return objc_msgSend(*(id *)(a1 + 32), "_performNextRequest");
}

- (void)_play
{
  void *v3;
  void *v4;
  void *v5;
  AVQueuePlayer *player;
  __int128 v7;
  int64_t v8;

  objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequiresNoAudioResources:error:", 1, 0);

  objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getAVAudioSessionCategoryAmbient();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCategory:withOptions:error:", v5, 1, 0);

  kdebug_trace();
  player = self->_player;
  if (player)
  {
    -[AVQueuePlayer currentTime](player, "currentTime");
  }
  else
  {
    v7 = 0uLL;
    v8 = 0;
  }
  *(_OWORD *)&self->_willBeginPlayingTime.value = v7;
  self->_willBeginPlayingTime.epoch = v8;
  -[AVQueuePlayer play](self->_player, "play");
  *((_BYTE *)self + 552) &= ~1u;
  -[CLKVideoPlayerView _performNextRequest](self, "_performNextRequest");
}

- (void)_pause
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_willBeginPlayingTime;
  $95D729B680665BEAEFA1D6FCA8238556 v4;

  self->_playing = 0;
  *((_BYTE *)self + 552) &= ~1u;
  p_willBeginPlayingTime = &self->_willBeginPlayingTime;
  _CMTimeMakeWithSeconds(0xFFFFFFFFLL, 0.0);
  *p_willBeginPlayingTime = v4;
  -[AVQueuePlayer pause](self->_player, "pause");
  if (self->_pausedViewEnabled)
    -[CLKVideoPlayerView _showPausedView](self, "_showPausedView");
}

- (void)_seekToTime:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  AVQueuePlayer *player;
  $95D729B680665BEAEFA1D6FCA8238556 v9;
  $95D729B680665BEAEFA1D6FCA8238556 seekWithTolerance;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  _QWORD v12[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;

  objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequiresNoAudioResources:error:", 1, 0);

  objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getAVAudioSessionCategoryAmbient();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCategory:withOptions:error:", v7, 1, 0);

  self->_servicingRequest = 1;
  kdebug_trace();
  player = self->_player;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __34__CLKVideoPlayerView__seekToTime___block_invoke;
  v12[3] = &unk_24CBFB020;
  v12[4] = self;
  v13 = *a3;
  v11 = *a3;
  seekWithTolerance = self->_seekWithTolerance;
  v9 = self->_seekWithTolerance;
  -[AVQueuePlayer seekToTime:toleranceBefore:toleranceAfter:completionHandler:](player, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v11, &seekWithTolerance, &v9, v12);
}

uint64_t __34__CLKVideoPlayerView__seekToTime___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  kdebug_trace();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512) = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 520);
  if (v2)
  {
    objc_msgSend(v2, "CMTimeValue");
  }
  else
  {
    v8 = 0uLL;
    v9 = 0;
  }
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  if (!_CMTimeCompare(&v6, &v8))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 520);
    *(_QWORD *)(v3 + 520) = 0;

  }
  return objc_msgSend(*(id *)(a1 + 32), "_performNextRequest");
}

- (void)_loadVideo:(id)a3
{
  id v4;
  AVPlayerItem *playerItem;
  AVPlayerItem *queuedItem;
  void *v7;
  void *v8;
  void *v9;
  AVPlayerItem *v10;
  AVPlayerItem *v11;
  AVPlayerItem *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t v21[16];

  v4 = a3;
  -[CLKVideoPlayerView resetRequestState](self, "resetRequestState");
  -[CLKVideoPlayerView _stopObservingPlayerItem](self, "_stopObservingPlayerItem");
  -[CLKVideoPlayerView _pause](self, "_pause");
  -[AVQueuePlayer removeAllItems](self->_player, "removeAllItems");
  playerItem = self->_playerItem;
  self->_playerItem = 0;

  queuedItem = self->_queuedItem;
  self->_queuedItem = 0;

  if (v4)
  {
    objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRequiresNoAudioResources:error:", 1, 0);

    objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getAVAudioSessionCategoryAmbient();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCategory:withOptions:error:", v9, 1, 0);

    -[CLKVideoPlayerView _createPlayerItemForVideoURL:](self, "_createPlayerItemForVideoURL:", v4);
    v10 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue();
    v11 = self->_playerItem;
    self->_playerItem = v10;

    v12 = self->_playerItem;
    CLKLoggingObjectForDomain(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_2114F4000, v14, OS_LOG_TYPE_DEFAULT, "CLKVideoPlayerView loadVideo [success]", v21, 2u);
      }

      -[CLKVideoPlayerView _observePlayerItem:](self, "_observePlayerItem:", self->_playerItem);
      -[AVQueuePlayer insertItem:afterItem:](self->_player, "insertItem:afterItem:", self->_playerItem, 0);
      -[AVQueuePlayer setActionAtItemEnd:](self->_player, "setActionAtItemEnd:", 1);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CLKVideoPlayerView _loadVideo:].cold.1((uint64_t)v4, v14, v15, v16, v17, v18, v19, v20);

    }
  }

}

- (void)_queueVideo:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  AVPlayerItem *v15;
  AVPlayerItem *queuedItem;
  AVPlayerItem *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26[16];

  v4 = a3;
  if (v4)
  {
    if (self->_playerItem)
    {
      if (self->_queuedItem)
      {
        CLKLoggingObjectForDomain(0);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          -[CLKVideoPlayerView _queueVideo:].cold.2((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

      }
      else
      {
        objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setRequiresNoAudioResources:error:", 1, 0);

        objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        getAVAudioSessionCategoryAmbient();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setCategory:withOptions:error:", v14, 1, 0);

        kdebug_trace();
        -[CLKVideoPlayerView _createPlayerItemForVideoURL:](self, "_createPlayerItemForVideoURL:", v4);
        v15 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue();
        queuedItem = self->_queuedItem;
        self->_queuedItem = v15;

        v17 = self->_queuedItem;
        CLKLoggingObjectForDomain(0);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v17)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v26 = 0;
            _os_log_impl(&dword_2114F4000, v19, OS_LOG_TYPE_DEFAULT, "CLKVideoPlayerView _createPlayerItemForVideoURL [success]", v26, 2u);
          }

          -[AVQueuePlayer insertItem:afterItem:](self->_player, "insertItem:afterItem:", self->_queuedItem, 0);
          -[AVQueuePlayer setActionAtItemEnd:](self->_player, "setActionAtItemEnd:", 0);
        }
        else
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[CLKVideoPlayerView _loadVideo:].cold.1((uint64_t)v4, v19, v20, v21, v22, v23, v24, v25);

        }
        kdebug_trace();
      }
    }
    else
    {
      -[CLKVideoPlayerView _loadVideo:](self, "_loadVideo:", v4);
    }
  }

}

- (CLKVideoPlayerViewDelegate)delegate
{
  return (CLKVideoPlayerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)gravityResize
{
  return self->_gravityResize;
}

- (BOOL)pausedViewEnabled
{
  return self->_pausedViewEnabled;
}

- (BOOL)playing
{
  return self->_playing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_seekRequested, 0);
  objc_storeStrong((id *)&self->_pausedView, 0);
  objc_storeStrong(&self->_periodicTimeObserver, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_queuedItem, 0);
  objc_storeStrong((id *)&self->_observedItem, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
}

- (void)_handleDidPlayToEndTime:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2114F4000, log, OS_LOG_TYPE_ERROR, "Trying to AVPlayerActionAtItemEndAdvance without a _queuedItem. This shouldn't happen.", v1, 2u);
}

- (void)_loadVideo:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2114F4000, a2, a3, "Failed to load video from %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_queueVideo:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2114F4000, a2, a3, "Too many queued videos attempts from %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
