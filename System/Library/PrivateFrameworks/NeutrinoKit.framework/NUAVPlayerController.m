@implementation NUAVPlayerController

- (NUAVPlayerController)init
{
  NUAVPlayerController *v2;
  uint64_t v3;
  NSMutableArray *playerItemObservations;
  NUObservatory *v5;
  NUObservatory *observatory;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUAVPlayerController;
  v2 = -[NUAVPlayerController init](&v8, sel_init);
  v2->_updateInterval = 0.0333333333;
  v3 = objc_opt_new();
  playerItemObservations = v2->_playerItemObservations;
  v2->_playerItemObservations = (NSMutableArray *)v3;

  v5 = (NUObservatory *)objc_alloc_init(MEMORY[0x24BE6C3D0]);
  observatory = v2->_observatory;
  v2->_observatory = v5;

  v2->_appliesPerFrameHDRDisplayMetadata = 0;
  return v2;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_playerItemObservations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "playerItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NUAVPlayerController _removePlayerItemKVO:removeFromArray:](self, "_removePlayerItemKVO:removeFromArray:", v8, 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NUAVPlayerController _removePlayerKVO](self, "_removePlayerKVO");
  -[NUAVPlayerController _removeTimeObserver](self, "_removeTimeObserver");
  v9.receiver = self;
  v9.super_class = (Class)NUAVPlayerController;
  -[NUAVPlayerController dealloc](&v9, sel_dealloc);
}

- (BOOL)prepareWithAVAsset:(id)a3 videoComposition:(id)a4 audioMix:(id)a5 loopsVideo:(BOOL)a6 seekToTime:(id *)a7
{
  _BOOL8 v7;
  id v13;
  id v14;
  id v15;
  AVPlayer *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  AVPlayer *v29;
  AVPlayer *v30;
  AVPlayer *v31;
  void *v32;
  void *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v37;
  AVPlayer *player;
  id v39;
  id obj;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  int64_t var3;
  _QWORD v51[4];
  id v52;
  id location;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v7 = a6;
  v64 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  obj = a4;
  v14 = a4;
  v39 = a5;
  v15 = a5;
  player = self->_player;
  v42 = v13;
  v43 = v14;
  v44 = v15;
  if (player)
  {
    -[NUAVPlayerController _removeTimeObserver](self, "_removeTimeObserver");
    -[NUAVPlayerController _removePlayerKVO](self, "_removePlayerKVO");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NUAVPlayerController.m"), 132, CFSTR("expected an AVQueuePlayer"));

    }
    v16 = self->_player;
    -[AVPlayer items](v16, "items");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");

    -[NUAVPlayerController _playerItemsWithVideoAsset:videoComposition:audioMix:loopsVideo:](self, "_playerItemsWithVideoAsset:videoComposition:audioMix:loopsVideo:", v42, v14, v44, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v59 != v21)
            objc_enumerationMutation(v19);
          -[AVPlayer insertItem:afterItem:](v16, "insertItem:afterItem:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i), 0);
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      }
      while (v20);
    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v23 = v18;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v55 != v25)
            objc_enumerationMutation(v23);
          v27 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j);
          -[NUAVPlayerController _removePlayerItemKVO:removeFromArray:](self, "_removePlayerItemKVO:removeFromArray:", v27, 1);
          -[AVPlayer removeItem:](v16, "removeItem:", v27);
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      }
      while (v24);
    }

  }
  else
  {
    -[NUAVPlayerController _playerItemsWithVideoAsset:videoComposition:audioMix:loopsVideo:](self, "_playerItemsWithVideoAsset:videoComposition:audioMix:loopsVideo:", v13, v14, v15, v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (AVPlayer *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2670]), "initWithItems:", v28);
    -[AVPlayer setPreventsDisplaySleepDuringVideoPlayback:](v29, "setPreventsDisplaySleepDuringVideoPlayback:", 0);
    -[AVPlayer setActionAtItemEnd:](v29, "setActionAtItemEnd:", v7 ^ 1);
    -[AVPlayer setMuted:](v29, "setMuted:", self->_muted);
    v30 = self->_player;
    self->_player = v29;
    v31 = v29;

    objc_msgSend(MEMORY[0x24BDB1858], "auxiliarySession");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    v34 = (_QWORD *)MEMORY[0x24BDB1598];
    if (!v7)
      v34 = (_QWORD *)MEMORY[0x24BDB15A8];
    objc_msgSend(v32, "setCategory:error:", *v34, 0);
    -[AVPlayer setAudioSession:](self->_player, "setAudioSession:", v33);

  }
  v35 = MEMORY[0x24BDC0D40];
  *(_OWORD *)&self->_currentSeekTime.value = *MEMORY[0x24BDC0D40];
  self->_currentSeekTime.epoch = *(_QWORD *)(v35 + 16);
  objc_storeStrong((id *)&self->_videoAsset, a3);
  objc_storeStrong((id *)&self->_videoComposition, obj);
  objc_storeStrong((id *)&self->_audioMix, v39);
  self->_loopsVideo = v7;
  -[NUAVPlayerController _addPlayerKVO](self, "_addPlayerKVO");
  if ((a7->var2 & 1) != 0)
  {
    objc_initWeak(&location, self);
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __91__NUAVPlayerController_prepareWithAVAsset_videoComposition_audioMix_loopsVideo_seekToTime___block_invoke;
    v51[3] = &unk_24C625880;
    objc_copyWeak(&v52, &location);
    v49 = *(_OWORD *)&a7->var0;
    var3 = a7->var3;
    v47 = *MEMORY[0x24BDC0D88];
    v48 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    v45 = v47;
    v46 = v48;
    -[NUAVPlayerController seek:toleranceBefore:toleranceAfter:forceSeek:completionHandler:](self, "seek:toleranceBefore:toleranceAfter:forceSeek:completionHandler:", &v49, &v47, &v45, 1, v51);
    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);
  }
  else
  {
    -[NUAVPlayerController _addTimeObserver](self, "_addTimeObserver");
  }

  return player == 0;
}

- (id)_playerItemsWithVideoAsset:(id)a3 videoComposition:(id)a4 audioMix:(id)a5 loopsVideo:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v20[5];
  uint64_t v21;
  _QWORD v22[2];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v6 = a6;
  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v6)
  {
    -[NUAVPlayerController _loopingPlayerItemWithVideoAsset:videoComposition:audioMix:](self, "_loopingPlayerItemWithVideoAsset:videoComposition:audioMix:", v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = v13;
      v22[0] = v13;
      v15 = (void *)objc_msgSend(v13, "copy");
      v22[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __88__NUAVPlayerController__playerItemsWithVideoAsset_videoComposition_audioMix_loopsVideo___block_invoke;
      v20[3] = &unk_24C6253E8;
      v20[4] = self;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);

      goto LABEL_12;
    }
  }
  else
  {
    -[NUAVPlayerController _playerItemWithVideoAsset:videoComposition:audioMix:](self, "_playerItemWithVideoAsset:videoComposition:audioMix:", v10, v11, v12);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v14 = (void *)v17;
      v21 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
  v18 = *MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    _os_log_error_impl(&dword_20D1BC000, v18, OS_LOG_TYPE_ERROR, "Failed to create player item from asset: %@", buf, 0xCu);
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (id)_playerItemWithVideoAsset:(id)a3 videoComposition:(id)a4 audioMix:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDB2618];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "playerItemWithAsset:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVideoComposition:", v10);

  objc_msgSend(v11, "setAudioMix:", v9);
  objc_msgSend(v11, "setSeekingWaitsForVideoCompositionRendering:", 1);
  objc_msgSend(v11, "setAllowedAudioSpatializationFormats:", 4);
  AlwaysApplyPerFrameHDRDisplayMetadata();
  self->_appliesPerFrameHDRDisplayMetadata = 1;
  objc_msgSend(v11, "setAppliesPerFrameHDRDisplayMetadata:", 1);
  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
  v12 = *MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEFAULT))
  {
    if (self->_appliesPerFrameHDRDisplayMetadata)
      v13 = CFSTR("view with dolby metadata");
    else
      v13 = CFSTR("view ignoring dolby metadata");
    v15 = 138412290;
    v16 = v13;
    _os_log_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_DEFAULT, "Created 1 item to %@", (uint8_t *)&v15, 0xCu);
  }
  return v11;
}

- (id)_loopingPlayerItemWithVideoAsset:(id)a3 videoComposition:(id)a4 audioMix:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v22 = 0;
  objc_msgSend(MEMORY[0x24BE6C438], "repeatVideo:count:error:", a3, 10, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;
  if (v10)
  {
    if (v8)
    {
      v21 = 0;
      objc_msgSend(MEMORY[0x24BE6C438], "repeatVideoComposition:count:error:", v8, 10, &v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v21;

      if (!v12)
      {
        if (*MEMORY[0x24BE6C478] != -1)
          dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
        v18 = *MEMORY[0x24BE6C488];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v13;
          _os_log_error_impl(&dword_20D1BC000, v18, OS_LOG_TYPE_ERROR, "Failed to loop video composition %@", buf, 0xCu);
        }
        v16 = 0;
        goto LABEL_25;
      }
      v11 = v13;
      if (v9)
      {
LABEL_5:
        v20 = 0;
        objc_msgSend(MEMORY[0x24BE6C438], "repeatAudio:count:error:", v9, 10, &v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v20;

        if (!v14)
        {
          if (*MEMORY[0x24BE6C478] != -1)
            dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
          v15 = *MEMORY[0x24BE6C488];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v13;
            _os_log_error_impl(&dword_20D1BC000, v15, OS_LOG_TYPE_ERROR, "Failed to loop audio mix %@", buf, 0xCu);
          }
          v16 = 0;
          goto LABEL_19;
        }
LABEL_18:
        -[NUAVPlayerController _playerItemWithVideoAsset:videoComposition:audioMix:](self, "_playerItemWithVideoAsset:videoComposition:audioMix:", v10, v12, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
LABEL_25:
        v11 = v13;
        goto LABEL_26;
      }
    }
    else
    {
      v12 = 0;
      if (v9)
        goto LABEL_5;
    }
    v14 = 0;
    v13 = v11;
    goto LABEL_18;
  }
  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
  v17 = *MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v11;
    _os_log_error_impl(&dword_20D1BC000, v17, OS_LOG_TYPE_ERROR, "Failed to loop video composition %@", buf, 0xCu);
  }
  v16 = 0;
LABEL_26:

  return v16;
}

- (void)updateVideoComposition:(id)a3
{
  AVVideoComposition *v5;
  _BOOL4 v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (AVVideoComposition *)a3;
  if (self->_videoComposition != v5)
  {
    objc_storeStrong((id *)&self->_videoComposition, a3);
    v6 = -[NUAVPlayerController loopsVideo](self, "loopsVideo");
    if (v5 && v6)
    {
      v19 = 0;
      objc_msgSend(MEMORY[0x24BE6C438], "repeatVideoComposition:count:error:", v5, 10, &v19);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v19;
      if (!v7)
      {
        if (*MEMORY[0x24BE6C478] != -1)
          dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
        v14 = *MEMORY[0x24BE6C488];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v8;
          _os_log_error_impl(&dword_20D1BC000, v14, OS_LOG_TYPE_ERROR, "Failed to repeat video composition, error: %@", buf, 0xCu);
        }
        goto LABEL_14;
      }

      v5 = (AVVideoComposition *)v7;
    }
    -[NUAVPlayerController player](self, "player");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v8, "items", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "setVideoComposition:", v5);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v11);
    }

LABEL_14:
  }

}

- (void)updateWithVideoPrepareNodeFromVideoComposition:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "instructions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NUAVPlayerController player](self, "player");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "items");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v6)
    {
      v7 = v6;
      v20 = *(_QWORD *)v26;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          objc_msgSend(v9, "videoComposition");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "instructions");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v22;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v22 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v5, "videoRenderPrepareNode");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "setVideoRenderPrepareNode:", v17);

                }
                ++v15;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v13);
          }

          ++v8;
        }
        while (v8 != v7);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v7);
    }

  }
}

- (void)updateAudioMix:(id)a3
{
  AVAudioMix *v5;
  _BOOL4 v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (AVAudioMix *)a3;
  if (self->_audioMix != v5)
  {
    objc_storeStrong((id *)&self->_audioMix, a3);
    v6 = -[NUAVPlayerController loopsVideo](self, "loopsVideo");
    if (v5 && v6)
    {
      v19 = 0;
      objc_msgSend(MEMORY[0x24BE6C438], "repeatAudio:count:error:", v5, 10, &v19);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v19;
      if (!v7)
      {
        if (*MEMORY[0x24BE6C478] != -1)
          dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
        v14 = *MEMORY[0x24BE6C488];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v8;
          _os_log_error_impl(&dword_20D1BC000, v14, OS_LOG_TYPE_ERROR, "Failed to loop audio mix, error: %@", buf, 0xCu);
        }
        goto LABEL_14;
      }

      v5 = (AVAudioMix *)v7;
    }
    -[NUAVPlayerController player](self, "player");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v8, "items", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "setAudioMix:", v5);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v11);
    }

LABEL_14:
  }

}

- (void)updateAppliesPerFrameHDRDisplayMetadata:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  self->_appliesPerFrameHDRDisplayMetadata = a3;
  AlwaysApplyPerFrameHDRDisplayMetadata();
  self->_appliesPerFrameHDRDisplayMetadata = 1;
  -[NUAVPlayerController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "items", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "setAppliesPerFrameHDRDisplayMetadata:", self->_appliesPerFrameHDRDisplayMetadata);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v7);
  }

  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
  v10 = (void *)*MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v4, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    v14 = CFSTR("view with dolby metadata");
    if (!self->_appliesPerFrameHDRDisplayMetadata)
      v14 = CFSTR("view ignoring dolby metadata");
    *(_DWORD *)buf = 134218242;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_20D1BC000, v11, OS_LOG_TYPE_DEFAULT, "Updated %lu items to %@", buf, 0x16u);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  float v20;
  float v21;
  NSObject *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_super v45;
  _BYTE buf[24];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if ((void *)kPlayerItemStatusCtx == a6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v11;
    else
      v14 = 0;
    v15 = v14;
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");

    if (v17 == 2)
    {
      if (*MEMORY[0x24BE6C478] != -1)
        dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
      v33 = (void *)*MEMORY[0x24BE6C488];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
        goto LABEL_48;
      v34 = v33;
      objc_msgSend(v15, "error");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v35;
      _os_log_debug_impl(&dword_20D1BC000, v34, OS_LOG_TYPE_DEBUG, "<%p> AVPlayerStatusFailed with error %@", buf, 0x16u);

    }
    else
    {
      if (v17 != 1)
      {
        if (!v17)
        {
          if (*MEMORY[0x24BE6C478] != -1)
            dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
          v18 = *MEMORY[0x24BE6C488];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = self;
            _os_log_debug_impl(&dword_20D1BC000, v18, OS_LOG_TYPE_DEBUG, "<%p> AVPlayerStatusUnknown", buf, 0xCu);
          }
        }
        goto LABEL_48;
      }
      if (*MEMORY[0x24BE6C478] != -1)
        dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
      v36 = *MEMORY[0x24BE6C488];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = self;
        _os_log_debug_impl(&dword_20D1BC000, v36, OS_LOG_TYPE_DEBUG, "<%p> AVPlayerStatusReadyToPlay", buf, 0xCu);
      }
      -[NUAVPlayerController player](self, "player");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "currentItem");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isEqual:", v11);

      if (!v39)
        goto LABEL_48;
      -[NUAVPlayerController delegate](self, "delegate");
      v34 = objc_claimAutoreleasedReturnValue();
      -[NSObject playerControllerIsReadyForPlayback:](v34, "playerControllerIsReadyForPlayback:", self);
    }

LABEL_48:
    goto LABEL_49;
  }
  if ((void *)kPlayerRateCtx == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    v21 = v20;

    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
    v22 = *MEMORY[0x24BE6C488];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v21;
      _os_log_debug_impl(&dword_20D1BC000, v22, OS_LOG_TYPE_DEBUG, "<%p> rate %g", buf, 0x16u);
    }
    *(float *)&v23 = v21;
    -[NUAVPlayerController _notifyPlaybackRateChange:](self, "_notifyPlaybackRateChange:", v23);
    -[NUAVPlayerController player](self, "player");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "currentItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "videoComposition");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "instructions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *(float *)&v29 = v21;
        objc_msgSend(v28, "setPlaybackRate:", v29);
      }
    }

  }
  else if ((void *)kPlayerStatusCtx == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "integerValue");

    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
    v32 = *MEMORY[0x24BE6C488];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v31;
      _os_log_debug_impl(&dword_20D1BC000, v32, OS_LOG_TYPE_DEBUG, "<%p> status %d", buf, 0x12u);
    }
    -[NUAVPlayerController _notifyPlayerStatusChange:](self, "_notifyPlayerStatusChange:", v31);
  }
  else
  {
    if ((void *)kPlayerCurrentItemCtx != a6)
    {
      if ((void *)kExternalPlaybackCtx == a6)
      {
        objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "BOOLValue");

        if (*MEMORY[0x24BE6C478] != -1)
          dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
        v44 = *MEMORY[0x24BE6C488];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v43;
          _os_log_debug_impl(&dword_20D1BC000, v44, OS_LOG_TYPE_DEBUG, "<%p> external playback active %d", buf, 0x12u);
        }
        -[NUAVPlayerController _notifyExternalPlaybackChange:](self, "_notifyExternalPlaybackChange:", v43);
      }
      else
      {
        v45.receiver = self;
        v45.super_class = (Class)NUAVPlayerController;
        -[NUAVPlayerController observeValueForKeyPath:ofObject:change:context:](&v45, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
      }
      goto LABEL_49;
    }
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
    v40 = *MEMORY[0x24BE6C488];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = self;
      _os_log_debug_impl(&dword_20D1BC000, v40, OS_LOG_TYPE_DEBUG, "<%p> kPlayerCurrentItemCtx", buf, 0xCu);
    }
    if (self->_loopsVideo)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[NUAVPlayerController _removePlayerKVO](self, "_removePlayerKVO");
        *(_OWORD *)buf = *MEMORY[0x24BDC0D88];
        *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
        objc_msgSend(v15, "seekToTime:completionHandler:", buf, &__block_literal_global);
        -[NUAVPlayerController player](self, "player");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "insertItem:afterItem:", v15, 0);

        -[NUAVPlayerController _addPlayerKVO](self, "_addPlayerKVO");
      }
      goto LABEL_48;
    }
  }
LABEL_49:

}

- (void)pause
{
  double v2;

  LODWORD(v2) = 0;
  -[NUAVPlayerController _setRate:](self, "_setRate:", v2);
}

- (void)play
{
  double v2;

  LODWORD(v2) = 1.0;
  -[NUAVPlayerController _setRate:](self, "_setRate:", v2);
}

- (void)setLoopsVideo:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (self->_loopsVideo != a3)
  {
    v3 = a3;
    if (self->_videoAsset)
    {
      -[NUAVPlayerController _removePlayerKVO](self, "_removePlayerKVO");
      -[NUAVPlayerController _playerItemsWithVideoAsset:videoComposition:audioMix:loopsVideo:](self, "_playerItemsWithVideoAsset:videoComposition:audioMix:loopsVideo:", self->_videoAsset, self->_videoComposition, self->_audioMix, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUAVPlayerController player](self, "player");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rate");
      v8 = v7;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v6, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v25;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v9);
            -[NUAVPlayerController _removePlayerItemKVO:](self, "_removePlayerItemKVO:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13++));
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v11);
      }

      objc_msgSend(v6, "removeAllItems");
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v14 = v5;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v21;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v21 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(v6, "insertItem:afterItem:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18++), 0, (_QWORD)v20);
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        }
        while (v16);
      }

      -[AVPlayer setActionAtItemEnd:](self->_player, "setActionAtItemEnd:", v3 ^ 1);
      LODWORD(v19) = v8;
      objc_msgSend(v6, "setRate:", v19);
      -[NUAVPlayerController _addPlayerKVO](self, "_addPlayerKVO");

    }
    self->_loopsVideo = v3;
  }
}

- (void)setMuted:(BOOL)a3
{
  -[AVPlayer setMuted:](self->_player, "setMuted:");
  self->_muted = a3;
}

- (BOOL)currentlySeeking
{
  char v3;

  -[NUAVPlayerController currentSeekTime](self, "currentSeekTime");
  return v3 & 1;
}

- (void)seekForward
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CMTime v7;
  CMTime rhs;
  CMTime lhs;
  CMTime v10;
  CMTime v11;
  CMTime v12[2];

  -[NUAVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    memset(&v12[1], 0, sizeof(CMTime));
    objc_msgSend(v4, "duration");
    memset(v12, 0, 24);
    objc_msgSend(v5, "currentTime");
    memset(&v11, 0, sizeof(v11));
    CMTimeMake(&v11, 30, 1);
    memset(&v10, 0, sizeof(v10));
    lhs = v12[0];
    rhs = v11;
    CMTimeAdd(&v10, &lhs, &rhs);
    lhs = v10;
    rhs = v12[1];
    if (CMTimeCompare(&lhs, &rhs) >= 1)
    {
      CMTimeMake(&v7, 10, 1);
      rhs = v12[1];
      CMTimeSubtract(&lhs, &rhs, &v7);
      v10 = lhs;
    }
    -[NUAVPlayerController player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    lhs = v10;
    objc_msgSend(v6, "seekToTime:", &lhs);

  }
}

- (void)seekBack
{
  void *v3;
  void *v4;
  void *v5;
  CMTimeEpoch v6;
  void *v7;
  __int128 v8;
  CMTime rhs;
  CMTime lhs;
  CMTime v11;
  CMTime v12;
  CMTime v13;

  -[NUAVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    memset(&v13, 0, sizeof(v13));
    objc_msgSend(v4, "currentTime");
    memset(&v12, 0, sizeof(v12));
    CMTimeMake(&v12, 10, 1);
    memset(&v11, 0, sizeof(v11));
    lhs = v13;
    rhs = v12;
    CMTimeSubtract(&v11, &lhs, &rhs);
    lhs = v11;
    v8 = *MEMORY[0x24BDC0D88];
    *(_OWORD *)&rhs.value = *MEMORY[0x24BDC0D88];
    v6 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    rhs.epoch = v6;
    if (CMTimeCompare(&lhs, &rhs) == -1)
    {
      *(_OWORD *)&v11.value = v8;
      v11.epoch = v6;
    }
    -[NUAVPlayerController player](self, "player", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    lhs = v11;
    objc_msgSend(v7, "seekToTime:", &lhs);

  }
}

- (void)seek:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a3;
  v6 = *a4;
  v5 = *a4;
  -[NUAVPlayerController seek:toleranceBefore:toleranceAfter:forceSeek:](self, "seek:toleranceBefore:toleranceAfter:forceSeek:", &v7, &v6, &v5, 0);
}

- (void)seek:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 forceSeek:(BOOL)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v8 = *a3;
  v7 = *a4;
  v6 = *a5;
  -[NUAVPlayerController seek:toleranceBefore:toleranceAfter:forceSeek:completionHandler:](self, "seek:toleranceBefore:toleranceAfter:forceSeek:completionHandler:", &v8, &v7, &v6, a6, 0);
}

- (void)seek:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 forceSeek:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v7;
  id v12;
  void *v13;
  void *v14;
  AVAsset *videoAsset;
  CMTimeEpoch v16;
  void *v17;
  NSObject *v18;
  Float64 Seconds;
  Float64 v20;
  double v21;
  const __CFString *v22;
  __int128 v23;
  __int128 v24;
  int64_t var3;
  _QWORD v26[5];
  id v27;
  CMTime time2;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v29;
  CMTime v30;
  CMTime time1;
  Float64 v32;
  __int16 v33;
  double v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v7 = a6;
  v37 = *MEMORY[0x24BDAC8D0];
  v12 = a7;
  -[NUAVPlayerController player](self, "player");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && (!-[NUAVPlayerController currentlySeeking](self, "currentlySeeking") || v7))
  {
    memset(&v30, 0, sizeof(v30));
    videoAsset = self->_videoAsset;
    if (videoAsset)
      -[AVAsset duration](videoAsset, "duration");
    v29 = *a3;
    time1 = (CMTime)*a3;
    time2 = v30;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      time1 = (CMTime)*a3;
      v23 = *MEMORY[0x24BDC0D88];
      *(_OWORD *)&time2.value = *MEMORY[0x24BDC0D88];
      v16 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      time2.epoch = v16;
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        *(_OWORD *)&v29.var0 = v23;
        v29.var3 = v16;
      }
    }
    else
    {
      objc_msgSend(v14, "duration");
    }
    self->_currentSeekTime = ($95D729B680665BEAEFA1D6FCA8238556)v29;
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_181);
    v17 = (void *)*MEMORY[0x24BE6C488];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
    {
      time1 = (CMTime)*a3;
      v18 = v17;
      Seconds = CMTimeGetSeconds(&time1);
      time1 = (CMTime)*a4;
      v20 = CMTimeGetSeconds(&time1);
      time1 = (CMTime)*a5;
      v21 = CMTimeGetSeconds(&time1);
      LODWORD(time1.value) = 134219010;
      v22 = CFSTR("NO");
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)self;
      LOWORD(time1.flags) = 2048;
      if (v7)
        v22 = CFSTR("YES");
      *(Float64 *)((char *)&time1.flags + 2) = Seconds;
      HIWORD(time1.epoch) = 2048;
      v32 = v20;
      v33 = 2048;
      v34 = v21;
      v35 = 2112;
      v36 = v22;
      _os_log_debug_impl(&dword_20D1BC000, v18, OS_LOG_TYPE_DEBUG, "<%p> seekToTime:%f toleranceBefore:%f toleranceAfter:%f forceSeek:%@", (uint8_t *)&time1, 0x34u);

    }
    objc_msgSend(v14, "cancelPendingSeeks", v23);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __88__NUAVPlayerController_seek_toleranceBefore_toleranceAfter_forceSeek_completionHandler___block_invoke;
    v26[3] = &unk_24C625430;
    v26[4] = self;
    v27 = v12;
    time1 = (CMTime)v29;
    time2 = (CMTime)*a4;
    v24 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    objc_msgSend(v14, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &time1, &time2, &v24, v26);

  }
}

- (void)step:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[NUAVPlayerController player](self, "player");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "stepByCount:", a3);

}

- (void)addPlaybackRateObserver:(id)a3 block:(id)a4
{
  -[NUObservatory addObserver:forKey:queue:block:](self->_observatory, "addObserver:forKey:queue:block:", a3, 0, 0, a4);
}

- (void)_notifyPlaybackRateChange:(float)a3
{
  NUObservatory *observatory;
  _QWORD v4[4];
  float v5;

  observatory = self->_observatory;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__NUAVPlayerController__notifyPlaybackRateChange___block_invoke;
  v4[3] = &__block_descriptor_36_e14_v16__0___v___8l;
  v5 = a3;
  -[NUObservatory notifyAllObserversForKey:withBlock:](observatory, "notifyAllObserversForKey:withBlock:", 0, v4);
}

- (void)addPlaybackTimeObserver:(id)a3 block:(id)a4
{
  -[NUObservatory addObserver:forKey:queue:block:](self->_observatory, "addObserver:forKey:queue:block:", a3, 1, 0, a4);
}

- (void)_notifyPlaybackTimeChange:(id *)a3
{
  NUObservatory *observatory;
  _QWORD v4[4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  observatory = self->_observatory;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__NUAVPlayerController__notifyPlaybackTimeChange___block_invoke;
  v4[3] = &__block_descriptor_56_e14_v16__0___v___8l;
  v5 = *a3;
  -[NUObservatory notifyAllObserversForKey:withBlock:](observatory, "notifyAllObserversForKey:withBlock:", 1, v4);
}

- (void)addPlayerStatusObserver:(id)a3 block:(id)a4
{
  -[NUObservatory addObserver:forKey:queue:block:](self->_observatory, "addObserver:forKey:queue:block:", a3, 2, 0, a4);
}

- (void)_notifyPlayerStatusChange:(int64_t)a3
{
  NUObservatory *observatory;
  _QWORD v4[5];

  observatory = self->_observatory;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__NUAVPlayerController__notifyPlayerStatusChange___block_invoke;
  v4[3] = &__block_descriptor_40_e14_v16__0___v___8l;
  v4[4] = a3;
  -[NUObservatory notifyAllObserversForKey:withBlock:](observatory, "notifyAllObserversForKey:withBlock:", 2, v4);
}

- (void)addExternalPlaybackObserver:(id)a3 block:(id)a4
{
  -[NUObservatory addObserver:forKey:queue:block:](self->_observatory, "addObserver:forKey:queue:block:", a3, 3, 0, a4);
}

- (void)_notifyExternalPlaybackChange:(BOOL)a3
{
  NUObservatory *observatory;
  _QWORD v4[4];
  BOOL v5;

  observatory = self->_observatory;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__NUAVPlayerController__notifyExternalPlaybackChange___block_invoke;
  v4[3] = &__block_descriptor_33_e14_v16__0___v___8l;
  v5 = a3;
  -[NUObservatory notifyAllObserversForKey:withBlock:](observatory, "notifyAllObserversForKey:withBlock:", 3, v4);
}

- (void)removeObserver:(id)a3
{
  -[NUObservatory removeObserver:](self->_observatory, "removeObserver:", a3);
}

- (void)_addTimeObserver
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id playerTimeObserver;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  CMTime v13;
  id from;
  id to;
  id location;

  if (!self->_playerTimeObserver)
  {
    -[NUAVPlayerController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NUAVPlayerController.m"), 599, CFSTR("We should have an AVPlayer object here"));

    }
    -[NUAVPlayerController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v5);

    objc_copyWeak(&to, (id *)&self->_delegate);
    objc_initWeak(&from, self);
    v6 = objc_loadWeakRetained(&location);
    CMTimeMakeWithSeconds(&v13, self->_updateInterval, 1000000000);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __40__NUAVPlayerController__addTimeObserver__block_invoke;
    v10[3] = &unk_24C6254D8;
    objc_copyWeak(&v11, &from);
    objc_copyWeak(&v12, &to);
    objc_msgSend(v6, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v13, 0, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    playerTimeObserver = self->_playerTimeObserver;
    self->_playerTimeObserver = v7;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&to);
    objc_destroyWeak(&location);
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_effectiveTimeForTime:(SEL)a3
{
  *retstr = *a4;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v10;
  int64_t var3;
  __int128 v12;
  int64_t v13;

  -[NUAVPlayerController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v8 = MEMORY[0x24BDC0D40];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x24BDC0D40];
    v7 = *(_QWORD *)(v8 + 16);
    goto LABEL_5;
  }
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  objc_msgSend(v5, "currentTime");
  if ((retstr->var2 & 1) != 0)
  {
    v10 = *(_OWORD *)&retstr->var0;
    var3 = retstr->var3;
    -[NUAVPlayerController _effectiveTimeForTime:](self, "_effectiveTimeForTime:", &v10);
    *(_OWORD *)&retstr->var0 = v12;
    v7 = v13;
LABEL_5:
    retstr->var3 = v7;
  }

  return result;
}

- (void)_removeTimeObserver
{
  void *v3;
  id playerTimeObserver;

  if (self->_playerTimeObserver)
  {
    -[NUAVPlayerController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeTimeObserver:", self->_playerTimeObserver);

    playerTimeObserver = self->_playerTimeObserver;
    self->_playerTimeObserver = 0;

  }
}

- (void)playerItemDidReachEnd:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double Seconds;
  void *v8;
  CMTime time;

  -[NUAVPlayerController player](self, "player", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "duration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  -[NUAVPlayerController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playerControllerDidFinishPlaying:duration:", self, Seconds);

}

- (void)playerItemFailedToPlayToEnd:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDB1FB0]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[NUAVPlayerController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerControllerFailedToPlayToEnd:error:", self, v6);

}

- (void)_setRate:(float)a3
{
  double v4;
  id v5;

  -[NUAVPlayerController player](self, "player");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rate");
  if (*(float *)&v4 != a3)
  {
    *(float *)&v4 = a3;
    objc_msgSend(v5, "setRate:", v4);
  }

}

- (void)_removePlayerKVO
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_playerControllerKVOFlags.registeredPlayer)
  {
    -[NUAVPlayerController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("rate"), kPlayerRateCtx);

    -[NUAVPlayerController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("status"), kPlayerStatusCtx);

    -[NUAVPlayerController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem"), kPlayerCurrentItemCtx);

    -[NUAVPlayerController player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("externalPlaybackActive"), kExternalPlaybackCtx);

    self->_playerControllerKVOFlags.registeredPlayer = 0;
  }
}

- (void)_addPlayerKVO
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!self->_playerControllerKVOFlags.registeredPlayer)
  {
    -[NUAVPlayerController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("rate"), 3, kPlayerRateCtx);

    -[NUAVPlayerController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 3, kPlayerStatusCtx);

    -[NUAVPlayerController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem"), 3, kPlayerCurrentItemCtx);

    -[NUAVPlayerController player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("externalPlaybackActive"), 3, kExternalPlaybackCtx);

    self->_playerControllerKVOFlags.registeredPlayer = 1;
  }
}

- (void)_removePlayerItemKVO:(id)a3
{
  -[NUAVPlayerController _removePlayerItemKVO:removeFromArray:](self, "_removePlayerItemKVO:removeFromArray:", a3, 1);
}

- (void)_removePlayerItemKVO:(id)a3 removeFromArray:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_playerItemObservations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "playerItem", (_QWORD)v17);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v6)
        {
          v14 = v12;

          if (v14)
          {
            if (objc_msgSend(v14, "registeredKVO"))
            {
              objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("status"), kPlayerItemStatusCtx);
              objc_msgSend(v14, "setRegisteredKVO:", 0);
              objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "removeObserver:name:object:", self, *MEMORY[0x24BDB1FA8], v6);

              objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "removeObserver:name:object:", self, *MEMORY[0x24BDB1FB8], v6);

              if (v4)
                -[NSMutableArray removeObject:](self->_playerItemObservations, "removeObject:", v14);
            }
          }
          goto LABEL_14;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }

  v14 = 0;
LABEL_14:

}

- (void)_addPlayerItemKVO:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_playerItemObservations;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
      objc_msgSend(v10, "playerItem", (_QWORD)v15);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v10;

    if (v12)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v12 = (id)objc_opt_new();
  objc_msgSend(v12, "setPlayerItem:", v4);
  -[NSMutableArray addObject:](self->_playerItemObservations, "addObject:", v12);
LABEL_12:
  if ((objc_msgSend(v12, "registeredKVO", (_QWORD)v15) & 1) == 0)
  {
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 3, kPlayerItemStatusCtx);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_playerItemDidReachEnd_, *MEMORY[0x24BDB1FA8], v4);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_playerItemFailedToPlayToEnd_, *MEMORY[0x24BDB1FB8], v4);

    objc_msgSend(v12, "setRegisteredKVO:", 1);
  }

}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (AVAudioMix)audioMix
{
  return self->_audioMix;
}

- (NUAVPlayerControllerDelegate)delegate
{
  return (NUAVPlayerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)loopsVideo
{
  return self->_loopsVideo;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentSeekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioMix, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerItemObservations, 0);
  objc_storeStrong((id *)&self->_observatory, 0);
  objc_storeStrong(&self->_playerTimeObserver, 0);
}

void __40__NUAVPlayerController__addTimeObserver__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double Seconds;
  _BYTE v10[56];
  CMTime v11;

  if ((*(_BYTE *)(a2 + 12) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      memset(&v11, 0, sizeof(v11));
      objc_msgSend(WeakRetained, "videoAsset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
        objc_msgSend(v6, "duration");
      else
        memset(&v11, 0, sizeof(v11));

      memset(&v10[32], 0, 24);
      *(CMTime *)v10 = *(CMTime *)a2;
      objc_msgSend(v5, "_effectiveTimeForTime:", v10);
      v8 = objc_loadWeakRetained((id *)(a1 + 40));
      *(CMTime *)v10 = *(CMTime *)&v10[32];
      Seconds = CMTimeGetSeconds((CMTime *)v10);
      *(CMTime *)v10 = v11;
      objc_msgSend(v8, "playerController:didUpdateElapsedTime:duration:", v5, Seconds, CMTimeGetSeconds((CMTime *)v10));

      *(CMTime *)v10 = *(CMTime *)&v10[32];
      objc_msgSend(v5, "_notifyPlaybackTimeChange:", v10);
    }

  }
}

uint64_t __54__NUAVPlayerController__notifyExternalPlaybackChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(unsigned __int8 *)(a1 + 32));
}

uint64_t __50__NUAVPlayerController__notifyPlayerStatusChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

uint64_t __50__NUAVPlayerController__notifyPlaybackTimeChange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, __int128 *);
  __int128 v4;
  uint64_t v5;

  v2 = *(uint64_t (**)(uint64_t, __int128 *))(a2 + 16);
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  return v2(a2, &v4);
}

uint64_t __50__NUAVPlayerController__notifyPlaybackRateChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, float))(a2 + 16))(a2, *(float *)(a1 + 32));
}

uint64_t __88__NUAVPlayerController_seek_toleranceBefore_toleranceAfter_forceSeek_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = MEMORY[0x24BDC0D40];
    *(_OWORD *)(v2 + 96) = *MEMORY[0x24BDC0D40];
    *(_QWORD *)(v2 + 112) = *(_QWORD *)(v3 + 16);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __88__NUAVPlayerController__playerItemsWithVideoAsset_videoComposition_audioMix_loopsVideo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addPlayerItemKVO:", a2);
}

void __91__NUAVPlayerController_prepareWithAVAsset_videoComposition_audioMix_loopsVideo_seekToTime___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_addTimeObserver");

}

@end
