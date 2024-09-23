@implementation CKInternalAudioPlayer

- (CKInternalAudioPlayer)initWithContentsOfURL:(id)a3 playerType:(int64_t)a4
{
  id v6;
  CKInternalAudioPlayer *v7;
  CKInternalAudioPlayer *v8;
  void *v9;
  uint64_t v10;
  AVPlayerItem *playerItem;
  uint64_t v12;
  AVPlayer *avPlayer;
  void *v14;
  void *v15;
  uint64_t v16;
  AVAudioPlayer *avAudioPlayer;
  CKInternalAudioPlayer *v18;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKInternalAudioPlayer;
  v7 = -[CKInternalAudioPlayer init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_playerType = a4;
    if (a4 == 1)
    {
      CKAVURLAssetForURL(v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      playerItem = v8->_playerItem;
      v8->_playerItem = (AVPlayerItem *)v10;

      -[AVPlayerItem setPlayHapticTracks:](v8->_playerItem, "setPlayHapticTracks:", 1);
      objc_msgSend(MEMORY[0x1E0C8B2E8], "playerWithPlayerItem:", v8->_playerItem);
      v12 = objc_claimAutoreleasedReturnValue();
      avPlayer = v8->_avPlayer;
      v8->_avPlayer = (AVPlayer *)v12;

      -[AVPlayerItem addObserver:forKeyPath:options:context:](v8->_playerItem, "addObserver:forKeyPath:options:context:", v8, CFSTR("status"), 3, CKInternalAudioPlayerAVPlayerItemKVOContext);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel__playerItemDidEndNotification_, *MEMORY[0x1E0C8AC48], v8->_playerItem);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObserver:selector:name:object:", v8, sel__playerItemDidEndNotification_, *MEMORY[0x1E0C8AC58], v8->_playerItem);

    }
    else
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC8]), "initWithContentsOfURL:error:", v6, 0);
      avAudioPlayer = v8->_avAudioPlayer;
      v8->_avAudioPlayer = (AVAudioPlayer *)v16;

      -[AVAudioPlayer setDelegate:](v8->_avAudioPlayer, "setDelegate:", v8);
    }
    v18 = v8;
  }

  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  objc_super v14;

  v10 = a5;
  if ((void *)CKInternalAudioPlayerAVPlayerItemKVOContext == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("status")))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v11, "isEqualToNumber:", v12) & 1) == 0)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __72__CKInternalAudioPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
          block[3] = &unk_1E274A208;
          block[4] = self;
          dispatch_async(MEMORY[0x1E0C80D38], block);
        }
      }

    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CKInternalAudioPlayer;
    -[CKInternalAudioPlayer observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);
  }

}

uint64_t __72__CKInternalAudioPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAVPlayerItemStateChange");
}

- (BOOL)playAtTime:(double)a3
{
  if (self->_playerType != 1 || -[AVPlayerItem status](self->_playerItem, "status"))
    return -[CKInternalAudioPlayer _playAtTime:](self, "_playAtTime:", a3);
  self->_avPlayerPlayRequested = 1;
  return 1;
}

- (BOOL)_playAtTime:(double)a3
{
  uint64_t v5;
  AVPlayer *avPlayer;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v5 = MEMORY[0x193FF3C24]("kCMTimeZero", CFSTR("CoreMedia"));
  v10 = *(_OWORD *)v5;
  v11 = *(_QWORD *)(v5 + 16);
  if (self->_playerType != 1)
    return -[AVAudioPlayer playAtTime:](self->_avAudioPlayer, "playAtTime:", a3);
  self->_avPlayerPlayRequested = 0;
  if (self->_avPlayerState == 3)
  {
    avPlayer = self->_avPlayer;
    v8 = v10;
    v9 = v11;
    -[AVPlayer seekToTime:](avPlayer, "seekToTime:", &v8);
  }
  -[AVPlayer play](self->_avPlayer, "play");
  self->_avPlayerState = 1;
  return 1;
}

- (double)deviceCurrentTime
{
  double result;

  if (self->_playerType == 1)
    return 0.0;
  -[AVAudioPlayer deviceCurrentTime](self->_avAudioPlayer, "deviceCurrentTime");
  return result;
}

- (void)stop
{
  if (self->_playerType == 1)
  {
    if ((self->_avPlayerState & 0xFFFFFFFFFFFFFFFELL) != 2)
      -[AVPlayer pause](self->_avPlayer, "pause");
    self->_avPlayerState = 3;
  }
  else
  {
    -[AVAudioPlayer stop](self->_avAudioPlayer, "stop");
  }
}

- (void)pause
{
  if (self->_playerType == 1)
  {
    -[AVPlayer pause](self->_avPlayer, "pause");
    self->_avPlayerState = 2;
  }
  else
  {
    -[AVAudioPlayer pause](self->_avAudioPlayer, "pause");
  }
}

- (float)volume
{
  uint64_t v2;
  float result;

  v2 = 8;
  if (self->_playerType == 1)
    v2 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v2), "volume");
  return result;
}

- (void)setVolume:(float)a3
{
  uint64_t v3;

  v3 = 8;
  if (self->_playerType == 1)
    v3 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v3), "setVolume:");
}

- (BOOL)isPlaying
{
  if (self->_playerType == 1)
    return self->_avPlayerState == 1;
  else
    return -[AVAudioPlayer isPlaying](self->_avAudioPlayer, "isPlaying");
}

- (void)setCurrentTime:(double)a3
{
  AVPlayer *avPlayer;
  CMTime v4;

  if (self->_playerType == 1)
  {
    avPlayer = self->_avPlayer;
    CMTimeMake(&v4, (uint64_t)a3, 1);
    -[AVPlayer seekToTime:](avPlayer, "seekToTime:", &v4);
  }
  else
  {
    -[AVAudioPlayer setCurrentTime:](self->_avAudioPlayer, "setCurrentTime:", a3);
  }
}

- (void)setPlaybackSpeed:(double)a3
{
  double v3;
  double v5;
  AVAudioPlayer *avAudioPlayer;

  v3 = a3;
  if (self->_playerType == 1)
  {
    *(float *)&a3 = a3;
    -[AVPlayer setRate:](self->_avPlayer, "setRate:", a3);
  }
  else
  {
    if (!-[AVAudioPlayer enableRate](self->_avAudioPlayer, "enableRate"))
      -[AVAudioPlayer setEnableRate:](self->_avAudioPlayer, "setEnableRate:", 1);
    *(float *)&v5 = v3;
    -[AVAudioPlayer setRate:](self->_avAudioPlayer, "setRate:", v5);
    avAudioPlayer = self->_avAudioPlayer;
    -[AVAudioPlayer currentTime](avAudioPlayer, "currentTime");
    -[AVAudioPlayer setCurrentTime:](avAudioPlayer, "setCurrentTime:");
  }
}

- (double)playbackSpeed
{
  id *p_avPlayer;
  float v3;

  if (self->_playerType == 1)
  {
    p_avPlayer = (id *)&self->_avPlayer;
  }
  else
  {
    p_avPlayer = (id *)&self->_avAudioPlayer;
    if (!-[AVAudioPlayer enableRate](self->_avAudioPlayer, "enableRate"))
      objc_msgSend(*p_avPlayer, "setEnableRate:", 1);
  }
  objc_msgSend(*p_avPlayer, "rate");
  return v3;
}

- (double)currentTime
{
  void (*v3)(_QWORD *);
  AVPlayer *avPlayer;
  double result;
  _QWORD v6[3];

  if (currentTime__pred_CMTimeGetSecondsCoreMedia != -1)
    dispatch_once(&currentTime__pred_CMTimeGetSecondsCoreMedia, &__block_literal_global_218);
  if (self->_playerType == 1)
  {
    v3 = (void (*)(_QWORD *))currentTime__CMTimeGetSeconds;
    avPlayer = self->_avPlayer;
    if (avPlayer)
      -[AVPlayer currentTime](avPlayer, "currentTime");
    else
      memset(v6, 0, sizeof(v6));
    v3(v6);
  }
  else
  {
    -[AVAudioPlayer currentTime](self->_avAudioPlayer, "currentTime");
  }
  return result;
}

void *__36__CKInternalAudioPlayer_currentTime__block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CMTimeGetSeconds", CFSTR("CoreMedia"));
  currentTime__CMTimeGetSeconds = result;
  return result;
}

- (double)duration
{
  uint64_t v3;
  void *v4;
  void *v5;
  double result;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  if (duration__pred_CMTimeCompareCoreMedia != -1)
    dispatch_once(&duration__pred_CMTimeCompareCoreMedia, &__block_literal_global_171_1);
  if (duration__pred_CMTimeGetSecondsCoreMedia_0 != -1)
    dispatch_once(&duration__pred_CMTimeGetSecondsCoreMedia_0, &__block_literal_global_173_1);
  v3 = MEMORY[0x193FF3C24]("kCMTimeIndefinite", CFSTR("CoreMedia"));
  v13 = *(_OWORD *)v3;
  v14 = *(_QWORD *)(v3 + 16);
  if (self->_playerType == 1)
  {
    v11 = 0uLL;
    v12 = 0;
    -[AVPlayer currentItem](self->_avPlayer, "currentItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "duration");
    }
    else
    {
      v11 = 0uLL;
      v12 = 0;
    }

    v9 = v11;
    v10 = v12;
    v7 = v13;
    v8 = v14;
    if (duration__CMTimeCompare(&v9, &v7))
    {
      v9 = v11;
      v10 = v12;
      duration__CMTimeGetSeconds_0(&v9);
    }
    else
    {
      return 0.0;
    }
  }
  else
  {
    -[AVAudioPlayer duration](self->_avAudioPlayer, "duration");
  }
  return result;
}

void *__33__CKInternalAudioPlayer_duration__block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CMTimeCompare", CFSTR("CoreMedia"));
  duration__CMTimeCompare = result;
  return result;
}

void *__33__CKInternalAudioPlayer_duration__block_invoke_2()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CMTimeGetSeconds", CFSTR("CoreMedia"));
  duration__CMTimeGetSeconds_0 = result;
  return result;
}

- (void)prepareToPlay
{
  CKInternalAudioPlayer *v3;
  _BOOL8 v4;
  AVPlayerItemStatus v5;

  if (self->_playerType != 1)
  {
    v4 = -[AVAudioPlayer prepareToPlay](self->_avAudioPlayer, "prepareToPlay");
LABEL_7:
    v3 = self;
    goto LABEL_8;
  }
  if (-[CKInternalAudioPlayer isPlaying](self, "isPlaying"))
  {
    v3 = self;
    v4 = 1;
LABEL_8:
    -[CKInternalAudioPlayer _notifyPlayerDidPrepareAudioFileSuccessfully:](v3, "_notifyPlayerDidPrepareAudioFileSuccessfully:", v4);
    return;
  }
  v5 = -[AVPlayerItem status](self->_playerItem, "status");
  if (v5)
  {
    v4 = v5 == AVPlayerItemStatusReadyToPlay;
    goto LABEL_7;
  }
  self->_avPlayerPrepareRequested = 1;
}

- (void)resetCurrentTime
{
  AVPlayer *avPlayer;
  __int128 v3;
  uint64_t v4;

  if (self->_playerType == 1)
  {
    avPlayer = self->_avPlayer;
    v3 = *MEMORY[0x1E0CA2E68];
    v4 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    -[AVPlayer seekToTime:](avPlayer, "seekToTime:", &v3);
  }
  else
  {
    -[AVAudioPlayer setCurrentTime:](self->_avAudioPlayer, "setCurrentTime:", 0.0);
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[AVPlayerItem removeObserver:forKeyPath:](self->_playerItem, "removeObserver:forKeyPath:", self, CFSTR("status"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC48], self->_playerItem);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC58], self->_playerItem);

  -[AVAudioPlayer setDelegate:](self->_avAudioPlayer, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CKInternalAudioPlayer;
  -[CKInternalAudioPlayer dealloc](&v5, sel_dealloc);
}

- (void)_playerItemDidEndNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__CKInternalAudioPlayer__playerItemDidEndNotification___block_invoke;
  v6[3] = &unk_1E274A108;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __55__CKInternalAudioPlayer__playerItemDidEndNotification___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 3;
  objc_msgSend(*(id *)(a1 + 40), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8AC48]);

  return objc_msgSend(*(id *)(a1 + 32), "_notifyPlayerDidFinishSuccessfully:", v3);
}

- (void)_handleAVPlayerItemStateChange
{
  AVPlayerItemStatus v3;
  AVPlayerItemStatus v4;

  v3 = -[AVPlayerItem status](self->_playerItem, "status");
  v4 = v3;
  if (self->_avPlayerPrepareRequested)
  {
    self->_avPlayerPrepareRequested = 0;
    -[CKInternalAudioPlayer _notifyPlayerDidPrepareAudioFileSuccessfully:](self, "_notifyPlayerDidPrepareAudioFileSuccessfully:", v3 == AVPlayerItemStatusReadyToPlay);
  }
  if (self->_avPlayerPlayRequested && v4 != AVPlayerItemStatusUnknown)
  {
    self->_avPlayerPlayRequested = 0;
    -[CKInternalAudioPlayer _playAtTime:](self, "_playAtTime:", 0.0);
  }
}

- (void)_notifyPlayerDidFinishSuccessfully:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CKInternalAudioPlayer delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "internalAudioPlayerDidFinishPlaying:successfully:", self, v3);

}

- (void)_notifyPlayerDidPrepareAudioFileSuccessfully:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CKInternalAudioPlayer delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "internalAudioPlayerDidPrepareAudioForPlaying:successfully:", self, v3);

}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  -[CKInternalAudioPlayer _notifyPlayerDidFinishSuccessfully:](self, "_notifyPlayerDidFinishSuccessfully:", a4);
}

- (int64_t)playerType
{
  return self->_playerType;
}

- (CKInternalAudioPlayerDelegate)delegate
{
  return (CKInternalAudioPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_avPlayer, 0);
  objc_storeStrong((id *)&self->_avAudioPlayer, 0);
}

@end
