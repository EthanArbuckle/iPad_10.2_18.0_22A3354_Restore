@implementation LPStreamingVideoView

- (LPStreamingVideoView)initWithHost:(id)a3 video:(id)a4 style:(id)a5 posterFrame:(id)a6 posterFrameStyle:(id)a7 configuration:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  LPStreamingVideoView *v20;
  LPStreamingVideoView *v21;
  LPStreamingVideoView *v22;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)LPStreamingVideoView;
  v20 = -[LPVisualMediaView initWithHost:media:style:posterFrame:posterFrameStyle:configuration:](&v24, sel_initWithHost_media_style_posterFrame_posterFrameStyle_configuration_, v14, v15, v16, v17, v18, v19);
  v21 = v20;
  if (v20)
  {
    v20->_desiredVolume = 0.0;
    v20->_desiredPlayingState = -[LPStreamingVideoView shouldAutoPlay](v20, "shouldAutoPlay");
    v22 = v21;
  }

  return v21;
}

- (void)dealloc
{
  objc_super v3;

  -[LPStreamingVideoView destroyPlayer](self, "destroyPlayer");
  v3.receiver = self;
  v3.super_class = (Class)LPStreamingVideoView;
  -[LPVisualMediaView dealloc](&v3, sel_dealloc);
}

- (void)createPlayerItemAdjustedForLoopingWithAsset:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LPStreamingVideoView *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke;
  v10[3] = &unk_1E44A7D60;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v8, "loadValuesAsynchronouslyForKeys:keysForCollectionKeys:completionHandler:", &unk_1E44F0180, &unk_1E44F05A0, v10);

}

void __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2;
  v6[3] = &unk_1E44A7D38;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v8 = v4;
  __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2((uint64_t)v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);

}

id __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  double Seconds;
  _BOOL4 v9;
  int v10;
  double v11;
  int v13;
  double v14;
  CMTime v15;
  CMTime v16;
  CMTime v17;
  CMTime time;
  CMTime time2;
  CMTimeRange v20;
  CMTime v21;
  CMTimeRange range;
  _BYTE v23[32];
  CMTime rhs;
  CMTime time1;
  CMTime v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tracksWithMediaCharacteristic:", *MEMORY[0x1E0C8A788]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tracksWithMediaCharacteristic:", *MEMORY[0x1E0C8A6F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1 && objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEnabled") && (objc_msgSend(v6, "isEnabled") & 1) != 0)
    {
      memset(&v26, 0, sizeof(v26));
      if (v5)
        objc_msgSend(v5, "timeRange");
      else
        memset(&range, 0, sizeof(range));
      CMTimeRangeGetEnd(&v26, &range);
      memset(&v21, 0, sizeof(v21));
      if (v6)
        objc_msgSend(v6, "timeRange");
      else
        memset(&v20, 0, sizeof(v20));
      CMTimeRangeGetEnd(&v21, &v20);
      if ((v26.flags & 0x1D) == 1 && (v21.flags & 0x1D) == 1)
      {
        time1 = v26;
        time2 = v21;
        if (CMTimeCompare(&time1, &time2))
        {
          memset(&time1, 0, sizeof(time1));
          time2 = v26;
          rhs = v21;
          CMTimeSubtract(&time, &time2, &rhs);
          CMTimeAbsoluteValue(&time1, &time);
          time2 = time1;
          Seconds = CMTimeGetSeconds(&time2);
          v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
          if (Seconds <= 0.1)
          {
            if (v9)
            {
              v13 = objc_msgSend(*(id *)(a1 + 40), "loggingID");
              time2 = time1;
              v14 = CMTimeGetSeconds(&time2);
              __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_3((uint64_t)&time2, (uint64_t)v23, v13, v14);
            }
            rhs = v26;
            v16 = v21;
            CMTimeMinimum(&v17, &rhs, &v16);
            v15 = v17;
            objc_msgSend(v2, "setForwardPlaybackEndTime:", &v15);
          }
          else if (v9)
          {
            v10 = objc_msgSend(*(id *)(a1 + 40), "loggingID");
            time2 = time1;
            v11 = CMTimeGetSeconds(&time2);
            __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_2((uint64_t)&time2, (uint64_t)&rhs, v10, v11);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_1((uint64_t)&time1, objc_msgSend(*(id *)(a1 + 40), "loggingID"));
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_4((uint64_t)&time1, objc_msgSend(*(id *)(a1 + 40), "loggingID"));
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_5(objc_msgSend(v5, "isEnabled"), objc_msgSend(v6, "isEnabled"), (uint8_t *)&v26, objc_msgSend(*(id *)(a1 + 40), "loggingID"));
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "loggingID");
    objc_msgSend(v3, "count");
    objc_msgSend(v4, "count");
    __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_6((uint64_t)&v26, v7);
  }

  return v2;
}

- (void)createPlayerIfNeeded
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_0(&dword_1A0C41000, v2, (uint64_t)v2, "LPStreamingVideoView<%d>: creating player", v3);
}

void __44__LPStreamingVideoView_createPlayerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[77];
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C8B338], "playerLooperWithPlayer:templateItem:", v5, v8);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v4[78];
      v4[78] = (id)v6;

      objc_msgSend(v4[78], "addObserver:forKeyPath:options:context:", v4, CFSTR("status"), 1, statusChangeKVOContext);
    }
  }

}

- (void)destroyPlayer
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_0(&dword_1A0C41000, v2, (uint64_t)v2, "LPStreamingVideoView<%d>: destroying player", v3);
}

- (void)resetToPlaceholderView
{
  objc_super v3;

  -[LPStreamingVideoView destroyPlayer](self, "destroyPlayer");
  v3.receiver = self;
  v3.super_class = (Class)LPStreamingVideoView;
  -[LPVisualMediaView resetToPlaceholderView](&v3, sel_resetToPlaceholderView);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL4 v13;
  AVQueuePlayer *player;
  uint64_t v15;
  LPStreamingVideoView *v16;
  void (**readyForDisplayCallback)(void);
  id v18;
  BOOL v19;
  float v20;
  objc_super v21;
  _QWORD block[5];
  _QWORD v23[5];
  LPStreamingVideoView *v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)timeControlStatusKVOContext != a6)
  {
    if ((void *)readyForDisplayKVOContext == a6)
    {
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x3032000000;
      v23[3] = __Block_byref_object_copy_;
      v23[4] = __Block_byref_object_dispose_;
      v16 = self;
      v24 = v16;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__LPStreamingVideoView_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E44A7DB0;
      block[4] = v23;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      readyForDisplayCallback = (void (**)(void))v16->_readyForDisplayCallback;
      if (readyForDisplayCallback)
      {
        readyForDisplayCallback[2]();
        v18 = v16->_readyForDisplayCallback;
        v16->_readyForDisplayCallback = 0;

        -[AVPlayerLayer removeObserver:forKeyPath:context:](v16->_playerLayer, "removeObserver:forKeyPath:context:", v16, CFSTR("readyForDisplay"), &readyForDisplayKVOContext);
      }
      _Block_object_dispose(v23, 8);

    }
    else if ((void *)statusChangeKVOContext == a6)
    {
      if (-[AVPlayerLooper status](self->_looper, "status") == AVPlayerLooperStatusFailed)
        -[LPStreamingVideoView didFailToPlay](self, "didFailToPlay");
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)LPStreamingVideoView;
      -[LPStreamingVideoView observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
    }
    goto LABEL_20;
  }
  v13 = -[LPVisualMediaView hasEverPlayed](self, "hasEverPlayed");
  player = self->_player;
  if (v13)
  {
    if (-[AVQueuePlayer timeControlStatus](player, "timeControlStatus"))
    {
      v15 = 1;
      goto LABEL_18;
    }
    -[AVQueuePlayer rate](self->_player, "rate");
    v19 = v20 == 1.0;
  }
  else
  {
    v19 = -[AVQueuePlayer timeControlStatus](player, "timeControlStatus") == 2;
  }
  v15 = v19;
LABEL_18:
  -[LPVisualMediaView didChangePlayingState:](self, "didChangePlayingState:", v15);
  if (-[AVQueuePlayer timeControlStatus](self->_player, "timeControlStatus") == 2)
  {
    -[LPVisualMediaView setHasEverPlayed:](self, "setHasEverPlayed:", 1);
    -[LPVisualMediaView setWaitingForPlayback:](self, "setWaitingForPlayback:", 0);
    self->_playbackRetryCountWithoutSuccess = 0;
  }
LABEL_20:

}

void __71__LPStreamingVideoView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)didFailToPlay
{
  *(_DWORD *)a2 = 67109378;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2112;
  *(_QWORD *)(a2 + 10) = a1;
  OUTLINED_FUNCTION_2(&dword_1A0C41000, a4, a3, "LPStreamingVideoView<%d>: failed to play, will try again later (%@)", (uint8_t *)a2);

}

uint64_t __37__LPStreamingVideoView_didFailToPlay__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  uint64_t result;
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 649) = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 624);
  if (!v2 || (result = objc_msgSend(v2, "status"), result == 2))
  {
    v4 = (id)LPLogChannelUI();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __37__LPStreamingVideoView_didFailToPlay__block_invoke_cold_1((uint64_t)v1, v6, objc_msgSend(*v1, "loggingID"), v4);

    v5 = *v1;
    if (*((_BYTE *)*v1 + 656))
      return objc_msgSend(v5, "createPlayerIfNeeded");
    else
      return objc_msgSend(v5, "setWaitingForPlayback:", 0);
  }
  return result;
}

- (void)beginLoadingMediaForPreroll
{
  -[LPVisualMediaView _swapVideoPlaceholderForVideoForAutoPlay:](self, "_swapVideoPlaceholderForVideoForAutoPlay:", 1);
  -[LPStreamingVideoView createPlayerIfNeeded](self, "createPlayerIfNeeded");
  -[LPVisualMediaView removePlaceholderViews](self, "removePlaceholderViews");
}

- (void)setPlaying:(BOOL)a3
{
  _BOOL8 v3;
  double v5;

  v3 = a3;
  if (-[LPVisualMediaView isPlaying](self, "isPlaying") != a3)
  {
    -[LPStreamingVideoView createPlayerIfNeeded](self, "createPlayerIfNeeded");
    self->_desiredPlayingState = v3;
    *(float *)&v5 = (float)v3;
    -[AVQueuePlayer setRate:](self->_player, "setRate:", v5);
    -[LPVisualMediaView setWaitingForPlayback:](self, "setWaitingForPlayback:", v3);
    -[LPVisualMediaView swapVideoPlaceholderForPlaybackIfNeeded](self, "swapVideoPlaceholderForPlaybackIfNeeded");
  }
}

- (BOOL)releaseDecodingResourcesIfInactive
{
  AVQueuePlayer *player;
  float v4;
  NSObject *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  player = self->_player;
  if (player)
  {
    -[AVQueuePlayer rate](player, "rate");
    if (v4 == 0.0 && !self->_desiredPlayingState)
    {
      v5 = (id)LPLogChannelUI();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[LPStreamingVideoView releaseDecodingResourcesIfInactive].cold.1((uint64_t)v7, -[LPVisualMediaView loggingID](self, "loggingID"));

      -[LPStreamingVideoView destroyPlayer](self, "destroyPlayer");
      LOBYTE(player) = 1;
    }
    else
    {
      LOBYTE(player) = 0;
    }
  }
  return (char)player;
}

- (BOOL)shouldAutoPlay
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (+[LPSettings disableAutoPlay](LPSettings, "disableAutoPlay"))
    return 0;
  -[LPVisualMediaView configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disableAutoPlay");

  if ((v4 & 1) != 0)
    return 0;
  -[LPVisualMediaView media](self, "media");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[LPVisualMediaView media](self, "media");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "streamingURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)usesSharedAudioSession
{
  return 1;
}

- (BOOL)shouldShowMuteButton
{
  void *v2;
  char v3;

  -[LPVisualMediaView media](self, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAudio");

  return v3;
}

- (BOOL)isMuted
{
  return self->_desiredVolume == 0.0;
}

- (void)setMuted:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[LPStreamingVideoView isMuted](self, "isMuted") != a3)
    -[LPStreamingVideoView setVolume:](self, "setVolume:", (double)!v3);
}

- (double)volume
{
  float v2;

  -[AVQueuePlayer volume](self->_player, "volume");
  return v2;
}

- (void)setVolume:(double)a3
{
  _BOOL4 v5;
  float v6;

  v5 = -[LPStreamingVideoView isMuted](self, "isMuted");
  v6 = a3;
  self->_desiredVolume = v6;
  -[AVQueuePlayer setVolume:](self->_player, "setVolume:");
  -[AVQueuePlayer setMuted:](self->_player, "setMuted:", 0);
  if (v5 != -[LPStreamingVideoView isMuted](self, "isMuted"))
    -[LPVisualMediaView didChangeMutedState:](self, "didChangeMutedState:", -[LPStreamingVideoView isMuted](self, "isMuted"));
}

- (void)layoutComponentView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LPStreamingVideoView;
  -[LPVisualMediaView layoutComponentView](&v5, sel_layoutComponentView);
  -[LPVisualMediaView playbackView](self, "playbackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[AVPlayerLayer setFrame:](self->_playerLayer, "setFrame:");

}

- (id)createFullScreenVideoViewController
{
  return -[LPFullScreenVideoController initWithPlayer:sourceView:]([LPFullScreenVideoController alloc], "initWithPlayer:sourceView:", self->_player, self);
}

- (BOOL)usesCustomFullScreenImplementation
{
  return 0;
}

- (id)createVideoPlayerView
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  self->_hasCreatedVideoPlayerView = 1;
  -[LPStreamingVideoView createPlayerIfNeeded](self, "createPlayerIfNeeded");
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  if (self->_playerLayer)
  {
    v7[0] = self->_playerLayer;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSublayers:", v4);

  }
  return v3;
}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  void *v4;
  id readyForDisplayCallback;
  void (**aBlock)(void);

  aBlock = (void (**)(void))a3;
  if (-[AVPlayerLayer isReadyForDisplay](self->_playerLayer, "isReadyForDisplay"))
  {
    aBlock[2]();
  }
  else
  {
    if (!self->_readyForDisplayCallback)
      -[AVPlayerLayer addObserver:forKeyPath:options:context:](self->_playerLayer, "addObserver:forKeyPath:options:context:", self, CFSTR("readyForDisplay"), 0, &readyForDisplayKVOContext);
    v4 = _Block_copy(aBlock);
    readyForDisplayCallback = self->_readyForDisplayCallback;
    self->_readyForDisplayCallback = v4;

  }
}

- (void)fullScreenVideoDidPresent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LPStreamingVideoView;
  -[LPVisualMediaView fullScreenVideoDidPresent](&v3, sel_fullScreenVideoDidPresent);
  -[AVQueuePlayer setPreventsDisplaySleepDuringVideoPlayback:](self->_player, "setPreventsDisplaySleepDuringVideoPlayback:", 1);
}

- (void)fullScreenVideoWillDismiss
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LPStreamingVideoView;
  -[LPVisualMediaView fullScreenVideoWillDismiss](&v3, sel_fullScreenVideoWillDismiss);
  -[AVQueuePlayer setPreventsDisplaySleepDuringVideoPlayback:](self->_player, "setPreventsDisplaySleepDuringVideoPlayback:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_readyForDisplayCallback, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_looper, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

void __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_1(uint64_t a1, int a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_0(&dword_1A0C41000, MEMORY[0x1E0C81028], v2, "LPStreamingVideoView<%d> preparing video for looping, bailing (end times are identical)", v3);
}

void __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, int a3, double a4)
{
  uint64_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3(a4, 1.5047e-36, a1, a2, a3);
  OUTLINED_FUNCTION_2(&dword_1A0C41000, MEMORY[0x1E0C81028], v4, "LPStreamingVideoView<%d> preparing video for looping, bailing (end time delta=%f)", v5);
}

void __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_3(uint64_t a1, uint64_t a2, int a3, double a4)
{
  uint64_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3(a4, 1.5047e-36, a1, a2, a3);
  OUTLINED_FUNCTION_2(&dword_1A0C41000, MEMORY[0x1E0C81028], v4, "LPStreamingVideoView<%d> prepared video for looping (end time delta=%f)", v5);
}

void __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_4(uint64_t a1, int a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_0(&dword_1A0C41000, MEMORY[0x1E0C81028], v2, "LPStreamingVideoView<%d> preparing video for looping, bailing (non-numeric end time)", v3);
}

void __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_5(char a1, char a2, uint8_t *buf, int a4)
{
  *(_DWORD *)buf = 67109632;
  *((_DWORD *)buf + 1) = a4;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a1 & 1;
  *((_WORD *)buf + 7) = 1024;
  *((_DWORD *)buf + 4) = a2 & 1;
  _os_log_debug_impl(&dword_1A0C41000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "LPStreamingVideoView<%d> preparing video for looping, bailing (enabled: video=%d, audio=%d)", buf, 0x14u);
}

void __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_6(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;

  v2 = OUTLINED_FUNCTION_1(a1, a2, 1.5048e-36);
  *(_WORD *)(v2 + 8) = 2048;
  *(_QWORD *)(v2 + 10) = v3;
  *(_WORD *)(v2 + 18) = 2048;
  *(_QWORD *)(v2 + 20) = v4;
  _os_log_debug_impl(&dword_1A0C41000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "LPStreamingVideoView<%d> preparing video for looping, bailing (count: video=%lu, audio=%lu)", v5, 0x1Cu);
}

void __37__LPStreamingVideoView_didFailToPlay__block_invoke_cold_1(uint64_t a1, uint8_t *buf, int a3, os_log_t log)
{
  int v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)a1 + 656);
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = v4;
  _os_log_debug_impl(&dword_1A0C41000, log, OS_LOG_TYPE_DEBUG, "LPStreamingVideoView<%d>: retrying playback after failing to play (desiredPlayingState=%d)", buf, 0xEu);
}

- (void)releaseDecodingResourcesIfInactive
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_0(&dword_1A0C41000, v2, (uint64_t)v2, "LPStreamingVideoView<%d>: explicitly destroying inactive player", v3);
}

@end
