@implementation HPSSpatialProfileEarTutorialView

- (HPSSpatialProfileEarTutorialView)init
{
  HPSSpatialProfileEarTutorialView *v2;
  HPSSpatialProfileEarTutorialView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HPSSpatialProfileEarTutorialView;
  v2 = -[HPSSpatialProfileEarTutorialView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_playersPlaying = 0;
    v2->_playersStartTriggered = 0;
    v2->_statusRightEar = 0;
    v2->_statusLeftEar = 0;
    -[HPSSpatialProfileEarTutorialView initPlayerRightEar](v2, "initPlayerRightEar");
    -[HPSSpatialProfileEarTutorialView initPlayerLeftEar](v3, "initPlayerLeftEar");
  }
  return v3;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HPSSpatialProfileEarTutorialView;
  -[HPSSpatialProfileEarTutorialView layoutSublayersOfLayer:](&v4, sel_layoutSublayersOfLayer_, a3);
  -[HPSSpatialProfileEarTutorialView bounds](self, "bounds");
  -[AVPlayerLayer setFrame:](self->_playerLayerLeftEar, "setFrame:");
  -[HPSSpatialProfileEarTutorialView bounds](self, "bounds");
  -[AVPlayerLayer setFrame:](self->_playerLayerRightEar, "setFrame:");
}

- (void)dealloc
{
  objc_super v3;

  -[AVPlayerLooper removeObserver:forKeyPath:context:](self->_looperLeftEar, "removeObserver:forKeyPath:context:", self, CFSTR("status"));
  -[AVQueuePlayer removeObserver:forKeyPath:context:](self->_playerLeftEar, "removeObserver:forKeyPath:context:", self, CFSTR("status"));
  -[AVPlayerLooper removeObserver:forKeyPath:context:](self->_looperRightEar, "removeObserver:forKeyPath:context:", self, CFSTR("status"));
  -[AVQueuePlayer removeObserver:forKeyPath:context:](self->_playerRightEar, "removeObserver:forKeyPath:context:", self, CFSTR("status"));
  v3.receiver = self;
  v3.super_class = (Class)HPSSpatialProfileEarTutorialView;
  -[HPSSpatialProfileEarTutorialView dealloc](&v3, sel_dealloc);
}

- (void)initPlayerLeftEar
{
  void *v3;
  void *v4;
  void *v5;
  AVPlayerItem *v6;
  AVPlayerItem *playerItemLeftEar;
  AVQueuePlayer *v8;
  AVQueuePlayer *playerLeftEar;
  void *v10;
  AVQueuePlayer *v11;
  AVPlayerItem *v12;
  AVPlayerLooper *v13;
  AVPlayerLooper *looperLeftEar;
  AVPlayerLayer *v15;
  AVPlayerLayer *playerLayerLeftEar;
  void *v17;
  CMTime v18;
  CMTime duration;
  CMTimeRange v20;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("HRTF_Tutorial_Left_Ear"), CFSTR("mov"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithURL:", v5);
  v6 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue();
  playerItemLeftEar = self->_playerItemLeftEar;
  self->_playerItemLeftEar = v6;

  -[AVPlayerItem setAllowedAudioSpatializationFormats:](self->_playerItemLeftEar, "setAllowedAudioSpatializationFormats:", 0);
  v8 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x1E0C8B350]);
  playerLeftEar = self->_playerLeftEar;
  self->_playerLeftEar = v8;

  -[AVQueuePlayer setAutomaticallyWaitsToMinimizeStalling:](self->_playerLeftEar, "setAutomaticallyWaitsToMinimizeStalling:", 0);
  v10 = (void *)MEMORY[0x1E0C8B338];
  v11 = self->_playerLeftEar;
  v12 = self->_playerItemLeftEar;
  CMTimeMake(&duration, 9000, 1000);
  v18 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  CMTimeRangeMake(&v20, &v18, &duration);
  objc_msgSend(v10, "playerLooperWithPlayer:templateItem:timeRange:", v11, v12, &v20);
  v13 = (AVPlayerLooper *)objc_claimAutoreleasedReturnValue();
  looperLeftEar = self->_looperLeftEar;
  self->_looperLeftEar = v13;

  -[AVPlayerLooper addObserver:forKeyPath:options:context:](self->_looperLeftEar, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 5, &self->_looperLeftEar);
  -[AVQueuePlayer addObserver:forKeyPath:options:context:](self->_playerLeftEar, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 5, &self->_playerLeftEar);
  objc_msgSend(MEMORY[0x1E0C8B330], "playerLayerWithPlayer:", self->_playerLeftEar);
  v15 = (AVPlayerLayer *)objc_claimAutoreleasedReturnValue();
  playerLayerLeftEar = self->_playerLayerLeftEar;
  self->_playerLayerLeftEar = v15;

  -[HPSSpatialProfileEarTutorialView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSublayer:", self->_playerLayerLeftEar);

  -[AVPlayerLayer setHidden:](self->_playerLayerLeftEar, "setHidden:", 1);
}

- (void)initPlayerRightEar
{
  void *v3;
  void *v4;
  void *v5;
  AVPlayerItem *v6;
  AVPlayerItem *playerItemRightEar;
  AVQueuePlayer *v8;
  AVQueuePlayer *playerRightEar;
  void *v10;
  AVQueuePlayer *v11;
  AVPlayerItem *v12;
  AVPlayerLooper *v13;
  AVPlayerLooper *looperRightEar;
  AVPlayerLayer *v15;
  AVPlayerLayer *playerLayerRightEar;
  void *v17;
  CMTime v18;
  CMTime duration;
  CMTimeRange v20;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("HRTF_Tutorial_Right_Ear"), CFSTR("mov"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithURL:", v5);
  v6 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue();
  playerItemRightEar = self->_playerItemRightEar;
  self->_playerItemRightEar = v6;

  v8 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x1E0C8B350]);
  playerRightEar = self->_playerRightEar;
  self->_playerRightEar = v8;

  -[AVQueuePlayer setAutomaticallyWaitsToMinimizeStalling:](self->_playerRightEar, "setAutomaticallyWaitsToMinimizeStalling:", 0);
  v10 = (void *)MEMORY[0x1E0C8B338];
  v11 = self->_playerRightEar;
  v12 = self->_playerItemRightEar;
  CMTimeMake(&duration, 9000, 1000);
  v18 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  CMTimeRangeMake(&v20, &v18, &duration);
  objc_msgSend(v10, "playerLooperWithPlayer:templateItem:timeRange:", v11, v12, &v20);
  v13 = (AVPlayerLooper *)objc_claimAutoreleasedReturnValue();
  looperRightEar = self->_looperRightEar;
  self->_looperRightEar = v13;

  -[AVPlayerLooper addObserver:forKeyPath:options:context:](self->_looperRightEar, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 5, &self->_looperRightEar);
  -[AVQueuePlayer addObserver:forKeyPath:options:context:](self->_playerRightEar, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 5, &self->_playerRightEar);
  objc_msgSend(MEMORY[0x1E0C8B330], "playerLayerWithPlayer:", self->_playerRightEar);
  v15 = (AVPlayerLayer *)objc_claimAutoreleasedReturnValue();
  playerLayerRightEar = self->_playerLayerRightEar;
  self->_playerLayerRightEar = v15;

  -[HPSSpatialProfileEarTutorialView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSublayer:", self->_playerLayerRightEar);

  -[AVPlayerLayer setHidden:](self->_playerLayerRightEar, "setHidden:", 0);
}

- (void)startPlayerLeftEar
{
  OUTLINED_FUNCTION_0(&dword_1DB30C000, a1, a3, "Spatial Profile: Ear Tutorial: Players are not ready", a5, a6, a7, a8, 0);
}

- (void)startPlayerRightEar
{
  AVQueuePlayer *playerRightEar;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  if (self->_statusRightEar.looperReady && self->_statusRightEar.playerReady)
  {
    -[AVPlayerLayer setHidden:](self->_playerLayerRightEar, "setHidden:", 0);
    playerRightEar = self->_playerRightEar;
    v12 = *MEMORY[0x1E0CA2E68];
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    -[AVQueuePlayer seekToTime:](playerRightEar, "seekToTime:", &v12);
    -[AVQueuePlayer play](self->_playerRightEar, "play");
    -[AVPlayerLayer setHidden:](self->_playerLayerLeftEar, "setHidden:", 1);
    -[AVQueuePlayer pause](self->_playerLeftEar, "pause");
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileEarTutorialView startPlayerLeftEar].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

- (void)stopPlayerLeftEar
{
  -[AVQueuePlayer pause](self->_playerLeftEar, "pause");
  -[AVPlayerLayer setHidden:](self->_playerLayerLeftEar, "setHidden:", 1);
}

- (void)stopPlayerRightEar
{
  -[AVQueuePlayer pause](self->_playerRightEar, "pause");
  -[AVPlayerLayer setHidden:](self->_playerLayerRightEar, "setHidden:", 1);
}

- (void)stopPlayers
{
  -[AVQueuePlayer pause](self->_playerLeftEar, "pause");
  -[AVQueuePlayer pause](self->_playerRightEar, "pause");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  void *v12;

  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__HPSSpatialProfileEarTutorialView_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1EA29B838;
  v11 = v8;
  v12 = a6;
  block[4] = self;
  v9 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __83__HPSSpatialProfileEarTutorialView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2 == v3 + 416 || v2 == v3 + 424)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSObject integerValue](v4, "integerValue");
    else
      v5 = 0;
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    if (v6 == v7 + 416)
    {
      sharedBluetoothSettingsLogComponent();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 134217984;
        v18 = v5;
        _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Tutorial: LeftEar player status changed to %ld\n", (uint8_t *)&v17, 0xCu);
      }

      if (v5 != 1)
        goto LABEL_35;
      v9 = &OBJC_IVAR___HPSSpatialProfileEarTutorialView__statusLeftEar;
    }
    else
    {
      if (v6 != v7 + 424)
        goto LABEL_35;
      sharedBluetoothSettingsLogComponent();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 134217984;
        v18 = v5;
        _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Tutorial: RightEar player status changed to %ld\n", (uint8_t *)&v17, 0xCu);
      }

      if (v5 != 1)
        goto LABEL_35;
      v9 = &OBJC_IVAR___HPSSpatialProfileEarTutorialView__statusRightEar;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + *v9) = 1;
    goto LABEL_35;
  }
  if (v2 != v3 + 432 && v2 != v3 + 440)
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Tutorial: Invalid context\n", (uint8_t *)&v17, 2u);
    }
    goto LABEL_35;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = -[NSObject integerValue](v4, "integerValue");
  else
    v10 = 0;
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 32);
  if (v12 == v13 + 432)
  {
    sharedBluetoothSettingsLogComponent();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134217984;
      v18 = v10;
      _os_log_impl(&dword_1DB30C000, v16, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Tutorial: LeftEar looper status changed to %ld\n", (uint8_t *)&v17, 0xCu);
    }

    if (v10 == 1)
    {
      v15 = &OBJC_IVAR___HPSSpatialProfileEarTutorialView__statusLeftEar;
      goto LABEL_34;
    }
  }
  else if (v12 == v13 + 440)
  {
    sharedBluetoothSettingsLogComponent();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134217984;
      v18 = v10;
      _os_log_impl(&dword_1DB30C000, v14, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Tutorial: RightEar looper status changed to %ld\n", (uint8_t *)&v17, 0xCu);
    }

    if (v10 == 1)
    {
      v15 = &OBJC_IVAR___HPSSpatialProfileEarTutorialView__statusRightEar;
LABEL_34:
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + *v15 + 1) = 1;
    }
  }
LABEL_35:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerLayerRightEar, 0);
  objc_storeStrong((id *)&self->_playerLayerLeftEar, 0);
  objc_storeStrong((id *)&self->_playerItemRightEar, 0);
  objc_storeStrong((id *)&self->_playerItemLeftEar, 0);
  objc_storeStrong((id *)&self->_looperRightEar, 0);
  objc_storeStrong((id *)&self->_looperLeftEar, 0);
  objc_storeStrong((id *)&self->_playerRightEar, 0);
  objc_storeStrong((id *)&self->_playerLeftEar, 0);
}

@end
