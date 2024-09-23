@implementation CSSiriAudioPlaybackSessionImplAVPlayerBased

- (NSString)description
{
  id v3;
  void *v4;
  AFAudioPlaybackRequest *request;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9.receiver = self;
  v9.super_class = (Class)CSSiriAudioPlaybackSessionImplAVPlayerBased;
  -[CSSiriAudioPlaybackSessionImplAVPlayerBased description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  request = self->_request;
  AFAudioPlaybackOptionsGetNames();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {request = %@, options = %@, player = %@, playerItem = %@}"), v4, request, v6, self->_player, self->_playerItem);

  return (NSString *)v7;
}

- (CSSiriAudioPlaybackSessionImplAVPlayerBased)initWithQueue:(id)a3 request:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  CSSiriAudioPlaybackSessionImplAVPlayerBased *v11;
  CSSiriAudioPlaybackSessionImplAVPlayerBased *v12;
  uint64_t v13;
  AFAudioPlaybackRequest *request;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CSSiriAudioPlaybackSessionImplAVPlayerBased;
  v11 = -[CSSiriAudioPlaybackSessionImplAVPlayerBased init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    v13 = objc_msgSend(v10, "copy");
    request = v12->_request;
    v12->_request = (AFAudioPlaybackRequest *)v13;

    v12->_options = a5;
  }

  return v12;
}

- (void)prepareWithOptions:(unint64_t)a3 audioSession:(id)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD);
  id v9;

  v9 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isActive)
  {
    if (v8)
      v8[2](v8, 0);
  }
  else
  {
    -[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:](self, "_prepareWithOptions:audioSession:completion:", a3, v9, v8);
  }

}

- (void)startWithOptions:(unint64_t)a3 audioSession:(id)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7
{
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  id v16;

  queue = self->_queue;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  dispatch_assert_queue_V2(queue);
  -[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHandler:executionHandler:finalizationHandler:](self, "_startWithOptions:audioSession:preparationHandler:executionHandler:finalizationHandler:", a3, v16, v15, v14, v13);

}

- (void)stop:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CSSiriAudioPlaybackSessionImplAVPlayerBased _stop:](self, "_stop:", v4);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)handleEndInterruption:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CSSiriAudioPlaybackSessionImplAVPlayerBased _handleEndInterruption:](self, "_handleEndInterruption:", v3);
}

- (void)_prepareWithOptions:(unint64_t)a3 audioSession:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  os_log_t *v9;
  void *v10;
  AFAudioPlaybackRequest *request;
  NSObject *v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  id v14;
  id v15;
  void *v16;
  void *v17;
  os_log_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  AVPlayerItem *v20;
  AVPlayerItem *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  AVPlayerItem *v25;
  AVPlayerItem *v26;
  os_log_t v27;
  AVPlayer *player;
  AVPlayer *v29;
  AVPlayer *v30;
  AVPlayer *v31;
  NSObject *v32;
  AVPlayerItem *v33;
  void *v34;
  AVPlayerItem *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  OS_dispatch_queue *queue;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  AVPlayer *v50;
  AVPlayerItem *playerItem;
  NSObject *v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  AVPlayer *v54;
  AVPlayerItem *v55;
  AVPlayerItem *v56;
  NSObject *v57;
  uint64_t v58;
  AVPlayerItem *v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  CSSiriAudioPlaybackSessionImplAVPlayerBased *v64;
  id v65;
  _QWORD v66[6];
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _QWORD v73[4];
  id v74;
  _BYTE buf[24];
  uint64_t (*v76)(uint64_t, uint64_t);
  __int128 v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  v10 = (void *)*MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    v12 = v10;
    AFAudioPlaybackOptionsGetNames();
    v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = request;
    *(_WORD *)&buf[22] = 2112;
    v76 = v13;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s request = %@, options = %@", buf, 0x20u);

  }
  v14 = objc_alloc(MEMORY[0x1E0CFE960]);
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __91__CSSiriAudioPlaybackSessionImplAVPlayerBased__prepareWithOptions_audioSession_completion___block_invoke;
  v73[3] = &unk_1E7C28570;
  v15 = v8;
  v74 = v15;
  objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:", 40);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithBlock:defaultValue:", v73, v16);

  if (-[AVPlayerItem status](self->_playerItem, "status") == AVPlayerItemStatusFailed)
  {
    v18 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      playerItem = self->_playerItem;
      v52 = v18;
      -[AVPlayerItem error](playerItem, "error");
      v53 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = playerItem;
      *(_WORD *)&buf[22] = 2112;
      v76 = v53;
      _os_log_error_impl(&dword_1C2614000, v52, OS_LOG_TYPE_ERROR, "%s Player item %@ status is failed with error %@.", buf, 0x20u);

    }
    -[CSSiriAudioPlaybackSessionImplAVPlayerBased _resetPlayerItem](self, "_resetPlayerItem");
  }
  if (self->_playerItem)
    goto LABEL_17;
  -[AFAudioPlaybackRequest itemURL](self->_request, "itemURL");
  v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (AVPlayerItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B300]), "initWithURL:", v19);
    v21 = self->_playerItem;
    self->_playerItem = v20;

    v22 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v55 = self->_playerItem;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v55;
      *(_WORD *)&buf[22] = 2112;
      v76 = v19;
      _os_log_debug_impl(&dword_1C2614000, v22, OS_LOG_TYPE_DEBUG, "%s Created player item %@ from URL %@.", buf, 0x20u);
    }
  }

  if (self->_playerItem)
    goto LABEL_17;
  -[AFAudioPlaybackRequest itemData](self->_request, "itemData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithData:contentType:options:", v23, *MEMORY[0x1E0C8A2F0], 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (AVPlayerItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B300]), "initWithAsset:", v24);
    v26 = self->_playerItem;
    self->_playerItem = v25;

    v27 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v59 = self->_playerItem;
      v57 = v27;
      v58 = objc_msgSend(v23, "length");
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v59;
      *(_WORD *)&buf[22] = 2048;
      v76 = (uint64_t (*)(uint64_t, uint64_t))v58;
      _os_log_debug_impl(&dword_1C2614000, v57, OS_LOG_TYPE_DEBUG, "%s Created player item %@ from WAVE asset with %tu bytes of data .", buf, 0x20u);

    }
  }

  if (self->_playerItem)
  {
LABEL_17:
    player = self->_player;
    if (!player)
    {
      v29 = (AVPlayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B2E8]), "initWithDispatchQueue:", self->_queue);
      v30 = self->_player;
      self->_player = v29;

      v31 = self->_player;
      -[AFAudioPlaybackRequest volume](self->_request, "volume");
      -[AVPlayer setVolume:](v31, "setVolume:");
      -[AVPlayer setActionAtItemEnd:](self->_player, "setActionAtItemEnd:", 2);
      v32 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
      {
        v54 = self->_player;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v54;
        _os_log_debug_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEBUG, "%s Created player %@.", buf, 0x16u);
      }
      player = self->_player;
    }
    -[AVPlayer setAudioSession:](player, "setAudioSession:", v7, v59);
    -[AVPlayer replaceCurrentItemWithPlayerItem:](self->_player, "replaceCurrentItemWithPlayerItem:", self->_playerItem);
    -[AVPlayer currentItem](self->_player, "currentItem");
    v33 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    v35 = self->_playerItem;
    if (v33 == v35)
    {
      if (-[AVPlayerItem status](v33, "status") == AVPlayerItemStatusReadyToPlay)
      {
        v38 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
        {
          v56 = self->_playerItem;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v56;
          _os_log_debug_impl(&dword_1C2614000, v38, OS_LOG_TYPE_DEBUG, "%s Player item %@ status is ready to play.", buf, 0x16u);
        }
        objc_msgSend(v17, "invokeWithValue:", 0);
      }
      else
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v76 = __Block_byref_object_copy__8544;
        *(_QWORD *)&v77 = __Block_byref_object_dispose__8545;
        *((_QWORD *)&v77 + 1) = 0;
        v67 = 0;
        v68 = &v67;
        v69 = 0x3032000000;
        v70 = __Block_byref_object_copy__8544;
        v71 = __Block_byref_object_dispose__8545;
        v72 = 0;
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __91__CSSiriAudioPlaybackSessionImplAVPlayerBased__prepareWithOptions_audioSession_completion___block_invoke_13;
        v66[3] = &unk_1E7C25070;
        v66[4] = buf;
        v66[5] = &v67;
        v39 = (void *)MEMORY[0x1C3BC4734](v66);
        v40 = objc_alloc(MEMORY[0x1E0CFEAC8]);
        queue = self->_queue;
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __91__CSSiriAudioPlaybackSessionImplAVPlayerBased__prepareWithOptions_audioSession_completion___block_invoke_2;
        v62[3] = &unk_1E7C28EC8;
        v42 = v17;
        v63 = v42;
        v64 = self;
        v43 = v39;
        v65 = v43;
        v44 = objc_msgSend(v40, "initWithTimeoutInterval:onQueue:timeoutHandler:", queue, v62, 2.0);
        v45 = (void *)v68[5];
        v68[5] = v44;

        objc_msgSend((id)v68[5], "start");
        v60 = v42;
        v61 = v43;
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE8F0]), "initWithQueue:qosClass:asynchronous:", self->_queue, 33, 1);
        AFKeyValueObservingCreate();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v47;

        _Block_object_dispose(&v67, 8);
        _Block_object_dispose(buf, 8);

      }
    }
    else
    {
      v36 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        v50 = self->_player;
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v50;
        *(_WORD *)&buf[22] = 2112;
        v76 = (uint64_t (*)(uint64_t, uint64_t))v35;
        LOWORD(v77) = 2112;
        *(_QWORD *)((char *)&v77 + 2) = v34;
        _os_log_error_impl(&dword_1C2614000, v36, OS_LOG_TYPE_ERROR, "%s Unable to replace current item of player %@. Expected current item is %@, actual current item is %@.", buf, 0x2Au);
      }
      objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:", 1420, CFSTR("Unable to replace current item of player."));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "invokeWithValue:", v37);

    }
  }
  else
  {
    v49 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
      _os_log_error_impl(&dword_1C2614000, v49, OS_LOG_TYPE_ERROR, "%s Unable to create player item.", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:", 1423, CFSTR("Unable to create player item."), v59);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "invokeWithValue:", v34);
  }

}

- (void)_startWithOptions:(unint64_t)a3 audioSession:(id)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7
{
  id v12;
  void (**v13)(_QWORD);
  id v14;
  void (**v15)(id, void *);
  os_log_t *v16;
  void *v17;
  AFAudioPlaybackRequest *request;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id completion;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  CSSiriAudioPlaybackSessionImplAVPlayerBased *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = (void (**)(_QWORD))a5;
  v14 = a6;
  v15 = (void (**)(id, void *))a7;
  v16 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  v17 = (void *)*MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    v19 = v17;
    AFAudioPlaybackOptionsGetNames();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v28 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHandler:executionHandl"
          "er:finalizationHandler:]";
    v29 = 2112;
    v30 = (CSSiriAudioPlaybackSessionImplAVPlayerBased *)request;
    v31 = 2112;
    v32 = v20;
    _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_INFO, "%s request = %@, options = %@", buf, 0x20u);

  }
  if (self->_isActive)
  {
    v21 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHandler:executionHan"
            "dler:finalizationHandler:]";
      v29 = 2112;
      v30 = self;
      _os_log_error_impl(&dword_1C2614000, v21, OS_LOG_TYPE_ERROR, "%s Attempted to start %@ when it is already active.", buf, 0x16u);
      if (!v15)
        goto LABEL_10;
      goto LABEL_6;
    }
    if (v15)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:underlyingError:", 1405, CFSTR("Attempted to start audio playback session when it is already active."), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v22);

    }
  }
  else
  {
    self->_isActive = 1;
    v23 = (void *)MEMORY[0x1C3BC4734](v15);
    completion = self->_completion;
    self->_completion = v23;

    if (v13)
      v13[2](v13);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __134__CSSiriAudioPlaybackSessionImplAVPlayerBased__startWithOptions_audioSession_preparationHandler_executionHandler_finalizationHandler___block_invoke;
    v25[3] = &unk_1E7C259F8;
    v25[4] = self;
    v26 = v14;
    -[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:](self, "_prepareWithOptions:audioSession:completion:", a3, v12, v25);

  }
LABEL_10:

}

- (void)_stop:(BOOL)a3
{
  void *v4;
  double v5;
  AVPlayer *player;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:", 1408, CFSTR("Stopped playback."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriAudioPlaybackSessionImplAVPlayerBased _finalizeWithError:](self, "_finalizeWithError:", v4);

  LODWORD(v5) = 0;
  -[AVPlayer setRate:](self->_player, "setRate:", v5);
  player = self->_player;
  v11 = *MEMORY[0x1E0CA2E68];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v9 = v11;
  v10 = v12;
  v7 = v11;
  v8 = v12;
  -[AVPlayer seekToTime:toleranceBefore:toleranceAfter:](player, "seekToTime:toleranceBefore:toleranceAfter:", &v11, &v9, &v7);
}

- (void)_handleBeginInterruption
{
  double v2;

  LODWORD(v2) = 0;
  -[AVPlayer setRate:](self->_player, "setRate:", v2);
}

- (void)_handleEndInterruption:(BOOL)a3
{
  double v3;

  if (a3 && self->_isActive)
  {
    LODWORD(v3) = 1.0;
    -[AVPlayer setRate:](self->_player, "setRate:", v3);
  }
}

- (void)_finalizeWithError:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  double v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (**completion)(id, id);
  id v15;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A8];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (!v6)
      goto LABEL_7;
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)&v16[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _finalizeWithError:]";
    *(_WORD *)&v16[12] = 2112;
    *(_QWORD *)&v16[14] = v4;
    v8 = "%s error = %@";
    v9 = v5;
    v10 = 22;
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)&v16[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _finalizeWithError:]";
    v8 = "%s ";
    v9 = v5;
    v10 = 12;
  }
  _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, v8, v16, v10);
LABEL_7:
  if (self->_playerItem)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC48], self->_playerItem);
    objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC58], self->_playerItem);

  }
  if (self->_isActive)
  {
    self->_isActive = 0;
    LODWORD(v7) = 0;
    -[AVPlayer setRate:](self->_player, "setRate:", v7);
    if (v4)
    {
      objc_msgSend(v4, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CFEB48]) & 1) != 0)
      {
        v13 = objc_msgSend(v4, "code");

        if (v13 == 1408)
          goto LABEL_16;
      }
      else
      {

      }
      -[CSSiriAudioPlaybackSessionImplAVPlayerBased _resetPlayerItem](self, "_resetPlayerItem", *(_OWORD *)v16, *(_QWORD *)&v16[16], v17);
    }
  }
LABEL_16:
  completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, v4);
    v15 = self->_completion;
    self->_completion = 0;

  }
}

- (void)_resetPlayerItem
{
  AVPlayerItem *playerItem;
  NSObject *v4;
  void *v5;
  AVPlayerItem *v6;
  int v7;
  const char *v8;
  __int16 v9;
  AVPlayerItem *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  playerItem = self->_playerItem;
  if (playerItem)
  {
    v4 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
    {
      v7 = 136315394;
      v8 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _resetPlayerItem]";
      v9 = 2112;
      v10 = playerItem;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s Reset player item %@.", (uint8_t *)&v7, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC48], self->_playerItem);
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC58], self->_playerItem);
    -[AVPlayer replaceCurrentItemWithPlayerItem:](self->_player, "replaceCurrentItemWithPlayerItem:", 0);
    v6 = self->_playerItem;
    self->_playerItem = 0;

  }
}

- (void)playerItemDidPlayToEndTime:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased playerItemDidPlayToEndTime:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CSSiriAudioPlaybackSessionImplAVPlayerBased_playerItemDidPlayToEndTime___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);

}

- (void)playerItemFailedToPlayToEndTime:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased playerItemFailedToPlayToEndTime:]";
    v12 = 2112;
    v13 = v4;
    _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__CSSiriAudioPlaybackSessionImplAVPlayerBased_playerItemFailedToPlayToEndTime___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (AFAudioPlaybackRequest)request
{
  return self->_request;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __79__CSSiriAudioPlaybackSessionImplAVPlayerBased_playerItemFailedToPlayToEndTime___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = (void *)MEMORY[0x1E0CFE8B0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C8AC50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithCode:description:underlyingError:", 1424, CFSTR("Player item failed to play to end time."), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_finalizeWithError:", v4);

}

uint64_t __74__CSSiriAudioPlaybackSessionImplAVPlayerBased_playerItemDidPlayToEndTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finalizeWithError:", 0);
}

void __134__CSSiriAudioPlaybackSessionImplAVPlayerBased__startWithOptions_audioSession_preparationHandler_executionHandler_finalizationHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  _BYTE buf[24];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v5 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHandl"
                           "er:executionHandler:finalizationHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v20 = v3;
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Failed to prepare %@ due to error %@.", buf, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_finalizeWithError:", v3);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v6 + 16))
    {
      LODWORD(v4) = 0;
      objc_msgSend(*(id *)(v6 + 24), "setRate:", v4);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      v9 = *(void **)(v7 + 24);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __134__CSSiriAudioPlaybackSessionImplAVPlayerBased__startWithOptions_audioSession_preparationHandler_executionHandler_finalizationHandler___block_invoke_30;
      v17[3] = &unk_1E7C284D0;
      v17[4] = v7;
      v18 = v8;
      *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
      *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      v15 = *(_OWORD *)buf;
      v16 = *(_QWORD *)&buf[16];
      v13 = *(_OWORD *)buf;
      v14 = *(_QWORD *)&buf[16];
      objc_msgSend(v9, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", buf, &v15, &v13, v17);

    }
    else
    {
      v10 = *MEMORY[0x1E0CFE6A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHan"
                             "dler:executionHandler:finalizationHandler:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s Failed to start %@ because it is already inactive after preparation.", buf, 0x16u);
        v6 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:", 1409, CFSTR("Audio playback session is already inactive after preparation."));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v6, "_finalizeWithError:", v11);

    }
  }

}

void __134__CSSiriAudioPlaybackSessionImplAVPlayerBased__startWithOptions_audioSession_preparationHandler_executionHandler_finalizationHandler___block_invoke_30(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __134__CSSiriAudioPlaybackSessionImplAVPlayerBased__startWithOptions_audioSession_preparationHandler_executionHandler_finalizationHandler___block_invoke_2;
  block[3] = &unk_1E7C288B0;
  block[4] = v2;
  v7 = a2;
  v6 = v3;
  dispatch_async(v4, block);

}

void __134__CSSiriAudioPlaybackSessionImplAVPlayerBased__startWithOptions_audioSession_preparationHandler_executionHandler_finalizationHandler___block_invoke_2(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[16])
  {
    v7 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHandler:executionHan"
            "dler:finalizationHandler:]_block_invoke_2";
      v14 = 2112;
      v15 = v2;
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Failed to start %@ because it is already inactive after player seek to begin.", (uint8_t *)&v12, 0x16u);
      v2 = *(_BYTE **)(a1 + 32);
    }
    v8 = (void *)MEMORY[0x1E0CFE8B0];
    v9 = CFSTR("Audio playback session is already inactive after player seek to begin.");
    v10 = 1409;
    goto LABEL_13;
  }
  if (!*(_BYTE *)(a1 + 48))
  {
    v11 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHandler:executionHan"
            "dler:finalizationHandler:]_block_invoke";
      v14 = 2112;
      v15 = v2;
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Failed to start %@ because player failed to seek to begin.", (uint8_t *)&v12, 0x16u);
      v2 = *(_BYTE **)(a1 + 32);
    }
    v8 = (void *)MEMORY[0x1E0CFE8B0];
    v9 = CFSTR("Player failed to seek to begin.");
    v10 = 1425;
LABEL_13:
    objc_msgSend(v8, "errorWithCode:description:", v10, v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_finalizeWithError:", v3);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_playerItemDidPlayToEndTime_, *MEMORY[0x1E0C8AC48], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_playerItemFailedToPlayToEndTime_, *MEMORY[0x1E0C8AC58], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  LODWORD(v4) = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setRate:", v4);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();
  v6 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v12 = 136315138;
    v13 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHandler:executionHandl"
          "er:finalizationHandler:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s started", (uint8_t *)&v12, 0xCu);
  }
LABEL_14:

}

void __91__CSSiriAudioPlaybackSessionImplAVPlayerBased__prepareWithOptions_audioSession_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0CFE6A8];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s prepared", (uint8_t *)&v6, 0xCu);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __91__CSSiriAudioPlaybackSessionImplAVPlayerBased__prepareWithOptions_audioSession_completion___block_invoke_13(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidate");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "cancel");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

uint64_t __91__CSSiriAudioPlaybackSessionImplAVPlayerBased__prepareWithOptions_audioSession_completion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:", 1421, CFSTR("Timed out when waiting for player item status to change to ready to play."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "invokeWithValue:", v3);

  if ((_DWORD)v2)
  {
    v4 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1[5] + 32);
      v7 = 136315394;
      v8 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]_block_invoke_2";
      v9 = 2112;
      v10 = v6;
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Timed out when waiting for player item %@ status to change to ready to play.", (uint8_t *)&v7, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __91__CSSiriAudioPlaybackSessionImplAVPlayerBased__prepareWithOptions_audioSession_completion___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "integerValue");
    if (v5 == 2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:underlyingError:", 1422, CFSTR("Failed to change player item status to ready to play."), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = objc_msgSend(v8, "invokeWithValue:", v9);

      if ((_DWORD)v8)
      {
        v10 = *MEMORY[0x1E0CFE6A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
        {
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
          v13 = 136315650;
          v14 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]_block_invoke";
          v15 = 2112;
          v16 = v12;
          v17 = 2112;
          v18 = v7;
          _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s Failed to change player item %@ status to ready to play due to error %@.", (uint8_t *)&v13, 0x20u);
        }
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else if (v5 == 1)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", 0))
      {
        v6 = *MEMORY[0x1E0CFE6A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_DEBUG))
        {
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
          v13 = 136315394;
          v14 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]_block_invoke";
          v15 = 2112;
          v16 = v11;
          _os_log_debug_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEBUG, "%s Successfully changed player item %@ status to ready to play.", (uint8_t *)&v13, 0x16u);
        }
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

@end
