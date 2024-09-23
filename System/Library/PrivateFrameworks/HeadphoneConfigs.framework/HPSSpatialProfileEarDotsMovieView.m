@implementation HPSSpatialProfileEarDotsMovieView

- (HPSSpatialProfileEarDotsMovieView)initWithFrame:(CGRect)a3
{
  HPSSpatialProfileEarDotsMovieView *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  AVPlayerItem *playerItem;
  uint64_t v9;
  AVPlayer *player;
  uint64_t v11;
  AVPlayerLayer *playerLayer;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HPSSpatialProfileEarDotsMovieView;
  v3 = -[HPSSpatialProfileEarDotsMovieView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", CFSTR("HRTF_Ear_Dots_Video"), CFSTR("mov"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithURL:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    playerItem = v3->_playerItem;
    v3->_playerItem = (AVPlayerItem *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8B2E8]), "initWithPlayerItem:", v3->_playerItem);
    player = v3->_player;
    v3->_player = (AVPlayer *)v9;

    objc_msgSend(MEMORY[0x1E0C8B330], "playerLayerWithPlayer:", v3->_player);
    v11 = objc_claimAutoreleasedReturnValue();
    playerLayer = v3->_playerLayer;
    v3->_playerLayer = (AVPlayerLayer *)v11;

    -[AVPlayerLayer setVideoGravity:](v3->_playerLayer, "setVideoGravity:", *MEMORY[0x1E0C8A6E0]);
    -[HPSSpatialProfileEarDotsMovieView bounds](v3, "bounds");
    -[AVPlayerLayer setFrame:](v3->_playerLayer, "setFrame:");
    -[HPSSpatialProfileEarDotsMovieView layer](v3, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v3->_playerLayer);

    -[HPSSpatialProfileEarDotsMovieView addBoundaryTimeObserver](v3, "addBoundaryTimeObserver");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[HPSSpatialProfileEarDotsMovieView removeBoundaryTimeObserver](self, "removeBoundaryTimeObserver");
  v3.receiver = self;
  v3.super_class = (Class)HPSSpatialProfileEarDotsMovieView;
  -[HPSSpatialProfileEarDotsMovieView dealloc](&v3, sel_dealloc);
}

- (void)addBoundaryTimeObserver
{
  void *v3;
  CMTimeEpoch epoch;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;
  CMTime lhs;
  CMTime rhs;
  CMTime v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v10 = *(_OWORD *)&v15.value;
  epoch = v15.epoch;
  CMTimeMakeWithSeconds(&rhs, 1.0, 1);
  *(_OWORD *)&lhs.value = v10;
  lhs.epoch = epoch;
  CMTimeAdd(&v15, &lhs, &rhs);
  lhs = v15;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &lhs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  lhs.value = 0;
  objc_initWeak((id *)&lhs, self);
  -[HPSSpatialProfileEarDotsMovieView player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C80D38];
  v8 = MEMORY[0x1E0C80D38];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__HPSSpatialProfileEarDotsMovieView_addBoundaryTimeObserver__block_invoke;
  v11[3] = &unk_1EA29A7C0;
  objc_copyWeak(&v12, (id *)&lhs);
  objc_msgSend(v6, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v3, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileEarDotsMovieView setTimeObserverToken:](self, "setTimeObserverToken:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)&lhs);

}

void __60__HPSSpatialProfileEarDotsMovieView_addBoundaryTimeObserver__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pause");

}

- (void)removeBoundaryTimeObserver
{
  void *v3;
  void *v4;
  void *v5;

  -[HPSSpatialProfileEarDotsMovieView timeObserverToken](self, "timeObserverToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HPSSpatialProfileEarDotsMovieView player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSSpatialProfileEarDotsMovieView timeObserverToken](self, "timeObserverToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeTimeObserver:", v5);

    -[HPSSpatialProfileEarDotsMovieView setTimeObserverToken:](self, "setTimeObserverToken:", 0);
  }
}

- (void)showDots
{
  NSObject *v3;
  AVPlayer *player;
  __int128 v5;
  uint64_t v6;

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Dots: Show Dots", (uint8_t *)&v5, 2u);
  }

  player = self->_player;
  v5 = *MEMORY[0x1E0CA2E68];
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  -[AVPlayer seekToTime:](player, "seekToTime:", &v5);
  -[AVPlayer play](self->_player, "play");
}

- (void)hideDots
{
  NSObject *v3;
  AVPlayer *player;
  CMTime v5;
  CMTime rhs;
  CMTime buf;

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Dots: Hide Dots", (uint8_t *)&buf, 2u);
  }

  memset(&buf, 0, sizeof(buf));
  CMTimeMakeWithSeconds(&rhs, 6.0, 1000);
  v5 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  CMTimeAdd(&buf, &v5, &rhs);
  player = self->_player;
  v5 = buf;
  -[AVPlayer seekToTime:](player, "seekToTime:", &v5);
  -[AVPlayer play](self->_player, "play");
}

- (id)timeObserverToken
{
  return objc_getProperty(self, a2, 432, 1);
}

- (void)setTimeObserverToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (AVPlayer)player
{
  return (AVPlayer *)objc_getProperty(self, a2, 440, 1);
}

- (void)setPlayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong(&self->_timeObserverToken, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
}

@end
