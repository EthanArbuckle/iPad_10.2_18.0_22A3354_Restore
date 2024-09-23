@implementation QLMediaItemBaseViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  objc_storeStrong((id *)&self->_mediaAsset, a3);
  v16 = v10;
  v17 = v11;
  v13 = v10;
  v14 = v12;
  v15 = v11;
  QLRunInBackgroundThread();

}

void __93__QLMediaItemBaseViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject **v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject **v16;
  NSObject *v17;
  void (**v18)(id, id);
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
    objc_msgSend(MEMORY[0x24BDB1858], "primarySession");
  else
    objc_msgSend(MEMORY[0x24BDB1858], "auxiliarySession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v23 = 0;
    objc_msgSend(v2, "setParticipatesInNowPlayingAppPolicy:error:", 1, &v23);
    v4 = v23;
    v5 = (NSObject **)MEMORY[0x24BE7BF48];
    if (v4)
    {
      v6 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v6 = *v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v4;
        _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_ERROR, "Could not set participatesInNowPlayingAppPolicy: %@ #Media", buf, 0xCu);
      }
    }
    objc_msgSend(a1[4], "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAudioSession:", v3);

    v8 = (id)*MEMORY[0x24BDB15A8];
    objc_msgSend(a1[4], "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "audioSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v10, "setCategory:error:", v8, &v22);
    v11 = v22;

    if (v11)
    {
      v12 = *v5;
      if (!*v5)
      {
        QLSInitLogging();
        v12 = *v5;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v8;
        v26 = 2112;
        v27 = v11;
        _os_log_impl(&dword_20D4F5000, v12, OS_LOG_TYPE_ERROR, "Could not set category (%@): %@ #Media", buf, 0x16u);
      }
    }
    objc_msgSend(a1[4], "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      objc_msgSend(v14, "duration");

    objc_msgSend(a1[5], "isPlayable");
    v19 = a1[5];
    v21 = a1[7];
    v20 = a1[6];
    QLRunInMainThread();

  }
  else
  {
    v16 = (NSObject **)MEMORY[0x24BE7BF48];
    v17 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v17 = *v16;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4F5000, v17, OS_LOG_TYPE_ERROR, "Could not create audio session #Media", buf, 2u);
    }
    v18 = (void (**)(id, id))a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.mediaItemAggregatedViewController"), 1000, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v18[2](v18, v4);
  }

}

void __93__QLMediaItemBaseViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_4(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  float v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  NSObject **v34;
  NSObject *v35;
  NSObject **v36;
  NSObject *v37;
  CMTimeValue v38;
  uint64_t v39;
  NSObject *v40;
  CMTimeValue v41;
  uint64_t v42;
  void *v43;
  id v44;
  CMTime buf;
  CMTime v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hasProtectedContent");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1192) = objc_msgSend(*(id *)(a1 + 40), "_assetIsDecodable:", *(_QWORD *)(a1 + 32)) & (v2 ^ 1);
  v3 = objc_msgSend(*(id *)(a1 + 40), "playable");
  v4 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v4, "setupPlayerWithMediaAsset:", *(_QWORD *)(a1 + 32));
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v5, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setupPlayerViewWithPlayer:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 1200);
    *(_QWORD *)(v8 + 1200) = v7;

    objc_msgSend(*(id *)(a1 + 40), "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v11, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:forKeyPath:options:context:", v11, CFSTR("rate"), 1, v12);

    objc_msgSend(*(id *)(a1 + 40), "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v14, "player");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:forKeyPath:options:context:", v14, CFSTR("status"), 1, v15);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(a1 + 40);
    v18 = *MEMORY[0x24BDB1FA8];
    objc_msgSend(v17, "player");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v17, sel_playerItemDidReachEnd_, v18, v20);

    memset(&v46, 0, sizeof(v46));
    objc_msgSend(*(id *)(a1 + 40), "playerTimeObservationInterval");
    CMTimeMakeWithSeconds(&v46, v21, 1000000000);
    objc_msgSend(*(id *)(a1 + 40), "player");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "playbackObserverBlock");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    buf = v46;
    objc_msgSend(v22, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &buf, 0, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1 + 40);
    v26 = *(void **)(v25 + 1152);
    *(_QWORD *)(v25 + 1152) = v24;

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1248) = 0;
    v27 = _Block_copy(*(const void **)(a1 + 56));
    v28 = *(_QWORD *)(a1 + 40);
    v29 = *(void **)(v28 + 1168);
    *(_QWORD *)(v28 + 1168) = v27;

    objc_msgSend(*(id *)(a1 + 40), "_updatePlayingStatus");
    objc_msgSend(*(id *)(a1 + 40), "_updateExternalPlayback");
    if (objc_msgSend(*(id *)(a1 + 48), "processIdentifier") >= 1)
    {
      objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "processIdentifier"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *MEMORY[0x24BE64878];
      v44 = 0;
      objc_msgSend(v30, "setAttribute:forKey:error:", v31, v32, &v44);
      v33 = v44;

      if (v33)
      {
        v34 = (NSObject **)MEMORY[0x24BE7BF48];
        v35 = *MEMORY[0x24BE7BF48];
        if (!*MEMORY[0x24BE7BF48])
        {
          QLSInitLogging();
          v35 = *v34;
        }
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v33;
          _os_log_impl(&dword_20D4F5000, v35, OS_LOG_TYPE_ERROR, "Error setting the PID to inherit the state from: %@ #Media", (uint8_t *)&buf, 0xCu);
        }
      }

    }
  }
  else
  {
    objc_msgSend(v4, "willChangeValueForKey:", CFSTR("playingStatus"));
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1248) = 3;
    objc_msgSend(*(id *)(a1 + 40), "didChangeValueForKey:", CFSTR("playingStatus"));
    objc_msgSend(*(id *)(a1 + 40), "didChangePlayingStatus");
    v36 = (NSObject **)MEMORY[0x24BE7BF48];
    if (v2)
    {
      v37 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v37 = *v36;
      }
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = *(_QWORD *)(a1 + 32);
        v39 = *(_QWORD *)(a1 + 40);
        LODWORD(v46.value) = 138412546;
        *(CMTimeValue *)((char *)&v46.value + 4) = v38;
        LOWORD(v46.flags) = 2112;
        *(_QWORD *)((char *)&v46.flags + 2) = v39;
        _os_log_impl(&dword_20D4F5000, v37, OS_LOG_TYPE_ERROR, "Can't play AVAsset with protected content: %@. %@ #Media", (uint8_t *)&v46, 0x16u);
      }
    }
    v40 = *v36;
    if (!*v36)
    {
      QLSInitLogging();
      v40 = *v36;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = *(_QWORD *)(a1 + 32);
      v42 = *(_QWORD *)(a1 + 40);
      LODWORD(v46.value) = 138412546;
      *(CMTimeValue *)((char *)&v46.value + 4) = v41;
      LOWORD(v46.flags) = 2112;
      *(_QWORD *)((char *)&v46.flags + 2) = v42;
      _os_log_impl(&dword_20D4F5000, v40, OS_LOG_TYPE_ERROR, "Asset is not playable: %@. %@ #Media", (uint8_t *)&v46, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.mediaItemAggregatedViewController"), 1, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (id)setupPlayerViewWithPlayer:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  AVPlayerLayer *v10;
  AVPlayerLayer *playerLayer;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = *MEMORY[0x24BDBEFB0];
  v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[QLMediaItemBaseViewController imageSize](self, "imageSize");
  objc_msgSend(v5, "setFrame:", v6, v7, v8, v9);
  objc_msgSend(MEMORY[0x24BDB2648], "playerLayerWithPlayer:", v4);
  v10 = (AVPlayerLayer *)objc_claimAutoreleasedReturnValue();

  playerLayer = self->_playerLayer;
  self->_playerLayer = v10;

  objc_msgSend(v5, "bounds");
  -[AVPlayerLayer setFrame:](self->_playerLayer, "setFrame:");
  objc_msgSend(v5, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSublayer:", self->_playerLayer);

  -[QLScrollableContentItemViewController setContentView:](self, "setContentView:", v5);
  return v5;
}

- (void)previewIsAppearingWithProgress:(double)a3
{
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemBaseViewController;
  -[QLItemViewController previewIsAppearingWithProgress:](&v6, sel_previewIsAppearingWithProgress_);
  v5 = a3 * 1.5;
  if (a3 * 1.5 > 1.0)
    v5 = 1.0;
  -[QLMediaItemBaseViewController setMediaVolume:](self, "setMediaVolume:", v5);
}

- (void)previewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemBaseViewController;
  -[QLScrollableContentItemViewController previewDidAppear:](&v6, sel_previewDidAppear_, a3);
  -[QLMediaItemBaseViewController setMediaVolume:](self, "setMediaVolume:", 1.0);
  self->_isVisible = 1;
  -[QLItemViewController appearance](self, "appearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "presentationMode");

  if (v5 == 4)
    -[QLMediaItemBaseViewController play](self, "play");
  -[QLMediaItemBaseViewController _updateExternalPlayback](self, "_updateExternalPlayback");
}

- (void)previewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLMediaItemBaseViewController;
  -[QLScrollableContentItemViewController previewDidDisappear:](&v4, sel_previewDidDisappear_, a3);
  self->_isVisible = 0;
  -[QLMediaItemBaseViewController _updateExternalPlayback](self, "_updateExternalPlayback");
  -[QLMediaItemBaseViewController pause](self, "pause");
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemBaseViewController;
  -[QLItemViewController previewBecameFullScreen:animated:](&v6, sel_previewBecameFullScreen_animated_, a3, a4);
  self->_isFullScreen = a3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (-[QLMediaItemBaseViewController playable](self, "playable"))
  {
    -[QLMediaItemBaseViewController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("rate"));

    -[QLMediaItemBaseViewController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("status"));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self);

  }
  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemBaseViewController;
  -[QLMediaItemBaseViewController dealloc](&v6, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[QLMediaItemBaseViewController player](self, "player");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == a6)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("rate")) & 1) != 0
      || objc_msgSend(v10, "isEqualToString:", CFSTR("status")))
    {
      -[QLMediaItemBaseViewController _updatePlayingStatus](self, "_updatePlayingStatus");
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)QLMediaItemBaseViewController;
    -[QLMediaItemBaseViewController observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_updateExternalPlayback
{
  _BOOL8 isVisible;
  id v3;

  isVisible = self->_isVisible;
  -[QLMediaItemBaseViewController player](self, "player");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsExternalPlayback:", isVisible);

}

- (void)_updatePlayingStatus
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  float v10;
  int64_t playingStatus;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void (**previewItemLoadingBlock)(id, void *);
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  id v22;

  -[QLMediaItemBaseViewController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLMediaItemBaseViewController setError:](self, "setError:", v4);

  -[QLMediaItemBaseViewController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");

  if (v6 == 1)
  {
    -[QLMediaItemBaseViewController player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[QLMediaItemBaseViewController player](self, "player");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rate");
      if (v10 == 0.0)
        v8 = 2;
      else
        v8 = 1;

    }
    else
    {
      v8 = 2;
    }
  }
  else
  {
    if (v6 != 2)
    {
      v8 = 0;
      goto LABEL_12;
    }
    -[QLMediaItemBaseViewController error](self, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemViewController notifyDelegatesDidFailWithError:](self, "notifyDelegatesDidFailWithError:", v7);
    v8 = 3;
  }

LABEL_12:
  if (v8 != self->_playingStatus)
  {
    -[QLMediaItemBaseViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("playingStatus"));
    playingStatus = self->_playingStatus;
    self->_playingStatus = v8;
    if (!playingStatus)
    {
      -[QLMediaItemBaseViewController player](self, "player");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "status");

      if (v13 == 1)
      {
        -[QLItemViewController appearance](self, "appearance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "presentationMode");

        if (v15 == 4)
          -[QLMediaItemBaseViewController play](self, "play");
      }
      previewItemLoadingBlock = (void (**)(id, void *))self->_previewItemLoadingBlock;
      if (previewItemLoadingBlock)
      {
        -[QLMediaItemBaseViewController player](self, "player");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "error");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        previewItemLoadingBlock[2](previewItemLoadingBlock, v18);

        v19 = self->_previewItemLoadingBlock;
        self->_previewItemLoadingBlock = 0;

      }
    }
    -[QLMediaItemBaseViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("playingStatus"));
    -[QLMediaItemBaseViewController didChangePlayingStatus](self, "didChangePlayingStatus");
    -[QLItemViewController delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      -[QLItemViewController delegate](self, "delegate");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "previewItemViewControllerWantsUpdateOverlay:animated:", self, 0);

    }
  }
}

- (AVPlayer)player
{
  AVPlayer *player;
  void *v4;
  void *v5;
  AVPlayer *v6;
  AVPlayer *v7;

  player = self->_player;
  if (!player)
  {
    if (self->_mediaAsset)
    {
      v4 = (void *)MEMORY[0x24BDB2610];
      objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithAsset:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "playerWithPlayerItem:", v5);
      v6 = (AVPlayer *)objc_claimAutoreleasedReturnValue();
      v7 = self->_player;
      self->_player = v6;

      player = self->_player;
    }
    else
    {
      player = 0;
    }
  }
  return player;
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  void *v4;
  int64_t v5;
  uint64_t v6;
  __CFString **v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (!-[QLMediaItemBaseViewController shouldDisplayPlayButtonInNavigationBar](self, "shouldDisplayPlayButtonInNavigationBar", a3)|| !-[QLMediaItemBaseViewController playable](self, "playable"))
  {
    return MEMORY[0x24BDBD1A8];
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7BFD8]), "initWithIdentifier:", CFSTR("togglePlay"));
  objc_msgSend(v4, "setPlacement:", 0);
  v5 = -[QLMediaItemBaseViewController playingStatus](self, "playingStatus");
  if (v5 == 1)
    v6 = 18;
  else
    v6 = 17;
  if (v5 == 1)
    v7 = QLMediaItemViewControllerBarPlayButtonPausedAccessibilityIdentifier;
  else
    v7 = QLMediaItemViewControllerBarPlayButtonPlayingAccessibilityIdentifier;
  objc_msgSend(v4, "setSystemItem:", v6);
  objc_msgSend(v4, "setAccessibilityIdentifier:", *v7);
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGSize)imageSize
{
  CGSize *p_imageSize;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  double width;
  double height;
  CGSize result;

  p_imageSize = &self->_imageSize;
  if (self->_imageSize.width == *MEMORY[0x24BDBF148]
    && self->_imageSize.height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    -[QLMediaItemBaseViewController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[QLMediaItemBaseViewController player](self, "player");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ql_imageSizeOfFirstVideoTrack");
      p_imageSize->width = v9;
      p_imageSize->height = v10;

    }
  }
  width = p_imageSize->width;
  height = p_imageSize->height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)endOfMediaReached
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  CMTime v11;
  CMTime time1;

  -[QLMediaItemBaseViewController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "currentTime");
  else
    memset(&time1, 0, sizeof(time1));
  -[QLMediaItemBaseViewController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "duration");
  else
    memset(&v11, 0, sizeof(v11));
  v9 = CMTimeCompare(&time1, &v11) == 0;

  return v9;
}

- (BOOL)shouldDisplayPlayButtonInNavigationBar
{
  return 1;
}

- (float)playerTimeObservationInterval
{
  return 1.0;
}

- (id)playbackObserverBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__QLMediaItemBaseViewController_playbackObserverBlock__block_invoke;
  v4[3] = &unk_24C7266E8;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __54__QLMediaItemBaseViewController_playbackObserverBlock__block_invoke(uint64_t a1, CMTime *a2)
{
  id *v3;
  id WeakRetained;
  double v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  double v14;
  double v15;
  id v16;
  CMTime v17;
  CMTime time;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  time = *a2;
  objc_msgSend(WeakRetained, "observePlayingTime:", &time);

  time = *a2;
  v5 = round(CMTimeGetSeconds(&time));
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "setElapsedTime:", v5);

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "duration");
  else
    memset(&v17, 0, sizeof(v17));
  v12 = round(CMTimeGetSeconds(&v17));
  v13 = objc_loadWeakRetained(v3);
  objc_msgSend(v13, "elapsedTime");
  v15 = v12 - v14;
  v16 = objc_loadWeakRetained(v3);
  objc_msgSend(v16, "setRemainingTime:", v15);

}

- (BOOL)play
{
  void *v3;
  uint64_t v4;
  void *v6;

  if (!self->_isVisible)
    return 0;
  -[QLMediaItemBaseViewController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  if (v4 != 1)
    return 0;
  if (-[QLMediaItemBaseViewController endOfMediaReached](self, "endOfMediaReached"))
  {
    -[QLMediaItemBaseViewController resetToBeginningAndPlay](self, "resetToBeginningAndPlay");
  }
  else
  {
    -[QLMediaItemBaseViewController player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "play");

  }
  return 1;
}

- (BOOL)pause
{
  void *v2;
  void *v3;

  -[QLMediaItemBaseViewController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "silenceOutput:error:", 1, 0);

  return 1;
}

- (void)stop
{
  void *v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  -[QLMediaItemBaseViewController pause](self, "pause");
  -[QLMediaItemBaseViewController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDC0D88];
  v9 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v6 = v8;
  v7 = v9;
  v4 = v8;
  v5 = v9;
  objc_msgSend(v3, "seekToTime:toleranceBefore:toleranceAfter:", &v8, &v6, &v4);

}

- (BOOL)togglePlayback
{
  if (-[QLMediaItemBaseViewController playingStatus](self, "playingStatus") == 1)
    return -[QLMediaItemBaseViewController pause](self, "pause");
  else
    return -[QLMediaItemBaseViewController play](self, "play");
}

- (double)mediaDuration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double Seconds;
  CMTime time;

  -[QLMediaItemBaseViewController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[QLMediaItemBaseViewController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "duration");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);

  }
  else
  {
    Seconds = 0.0;
  }

  return Seconds;
}

- (void)setMediaVolume:(double)a3
{
  float v3;
  double v4;
  id v5;

  v3 = a3;
  -[QLMediaItemBaseViewController player](self, "player");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setVolume:", v4);

}

- (void)resetToBeginningAndPlay
{
  void *v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  -[QLMediaItemBaseViewController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__QLMediaItemBaseViewController_resetToBeginningAndPlay__block_invoke;
  v10[3] = &unk_24C726710;
  objc_copyWeak(&v11, &location);
  v8 = *MEMORY[0x24BDC0D88];
  v9 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v6 = v8;
  v7 = v9;
  v4 = v8;
  v5 = v9;
  objc_msgSend(v3, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v8, &v6, &v4, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __56__QLMediaItemBaseViewController_resetToBeginningAndPlay__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "player");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "play");

    WeakRetained = v3;
  }

}

- (void)hostApplicationDidEnterBackground:(id)a3
{
  if ((objc_msgSend(a3, "BOOLValue") & 1) == 0)
  {
    self->_mediaWasPausedOnResignActive = -[QLMediaItemBaseViewController playingStatus](self, "playingStatus") == 1;
    -[QLMediaItemBaseViewController pause](self, "pause");
  }
}

- (void)hostApplicationDidBecomeActive
{
  if (self->_mediaWasPausedOnResignActive
    && self->_isVisible
    && -[QLMediaItemBaseViewController playingStatus](self, "playingStatus") != 1)
  {
    -[QLMediaItemBaseViewController play](self, "play");
  }
  self->_mediaWasPausedOnResignActive = 0;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  -[QLItemViewController appearance](self, "appearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)QLMediaItemBaseViewController;
  -[QLScrollableContentItemViewController setAppearance:animated:](&v13, sel_setAppearance_animated_, v6, v4);

  v8 = objc_msgSend(v7, "presentationMode");
  -[QLItemViewController appearance](self, "appearance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "presentationMode");

  if (v8 != v10)
  {
    -[QLItemViewController appearance](self, "appearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "presentationMode");

    if (v12 == 4)
      -[QLMediaItemBaseViewController resetToBeginningAndPlay](self, "resetToBeginningAndPlay");
  }

}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("togglePlay")))
    -[QLMediaItemBaseViewController togglePlayback](self, "togglePlayback");
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (BOOL)_assetIsDecodable:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "tracks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isDecodable");
  return (char)v3;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (UIView)playerView
{
  return self->_playerView;
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setMediaDuration:(double)a3
{
  self->_mediaDuration = a3;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(double)a3
{
  self->_remainingTime = a3;
}

- (int64_t)playingStatus
{
  return self->_playingStatus;
}

- (BOOL)playable
{
  return self->_playable;
}

- (BOOL)visualTracksEnabled
{
  return self->_visualTracksEnabled;
}

- (double)mediaVolume
{
  return self->_mediaVolume;
}

- (AVAsset)mediaAsset
{
  return self->_mediaAsset;
}

- (BOOL)isFullScreen
{
  return self->_isFullScreen;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong(&self->_previewItemLoadingBlock, 0);
  objc_storeStrong((id *)&self->_playbackTimeObserver, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_mediaAsset, 0);
}

@end
