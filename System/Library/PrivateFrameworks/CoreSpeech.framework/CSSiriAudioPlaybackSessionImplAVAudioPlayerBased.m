@implementation CSSiriAudioPlaybackSessionImplAVAudioPlayerBased

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
  v9.super_class = (Class)CSSiriAudioPlaybackSessionImplAVAudioPlayerBased;
  -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  request = self->_request;
  AFAudioPlaybackOptionsGetNames();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {request = %@, options = %@, player = %@}"), v4, request, v6, self->_player);

  return (NSString *)v7;
}

- (CSSiriAudioPlaybackSessionImplAVAudioPlayerBased)initWithQueue:(id)a3 request:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *v11;
  CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *v12;
  uint64_t v13;
  AFAudioPlaybackRequest *request;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CSSiriAudioPlaybackSessionImplAVAudioPlayerBased;
  v11 = -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased init](&v16, sel_init);
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
  void (**v8)(id, id);
  NSObject *queue;
  id v10;
  id v11;
  id v12;

  v8 = (void (**)(id, id))a5;
  queue = self->_queue;
  v10 = a4;
  dispatch_assert_queue_V2(queue);
  v12 = 0;
  -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:](self, "_prepareWithOptions:audioSession:error:", a3, v10, &v12);

  v11 = v12;
  if (v8)
    v8[2](v8, v11);

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
  -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _startWithOptions:audioSession:preparationHandler:executionHandler:finalizationHandler:](self, "_startWithOptions:audioSession:preparationHandler:executionHandler:finalizationHandler:", a3, v16, v15, v14, v13);

}

- (void)stop:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _stop:](self, "_stop:", v4);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)handleBeginInterruption
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _handleBeginInterruption](self, "_handleBeginInterruption");
}

- (void)handleEndInterruption:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _handleEndInterruption:](self, "_handleEndInterruption:", v3);
}

- (BOOL)_prepareWithOptions:(unint64_t)a3 audioSession:(id)a4 error:(id *)a5
{
  AVAudioSession *v8;
  os_log_t *v9;
  NSObject *v10;
  AVAudioPlayer *player;
  const char *v12;
  NSObject *v13;
  BOOL v14;
  AVAudioPlayer *v15;
  NSObject *v16;
  void *v17;
  id v18;
  AFAudioPlaybackRequest *request;
  void *v20;
  id *v21;
  uint64_t v22;
  double v23;
  AVAudioPlayer *v24;
  double v25;
  NSObject *v26;
  AVAudioPlayer *v27;
  BOOL v28;
  NSObject *v29;
  AVAudioPlayer *v30;
  AVAudioPlayer *v31;
  AVAudioPlayer *v32;
  AVAudioPlayer *v33;
  AVAudioPlayer *v34;
  NSObject *v35;
  AVAudioPlayer *v36;
  AVAudioPlayer *v38;
  AVAudioPlayer *v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  AVAudioPlayer *v45;
  __int16 v46;
  AVAudioSession *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = (AVAudioSession *)a4;
  if (a5)
    *a5 = 0;
  v9 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  if (self->_player)
  {
    if (self->_audioSession != v8)
    {
      objc_storeStrong((id *)&self->_audioSession, a4);
      -[AVAudioPlayer setAudioSession:](self->_player, "setAudioSession:", v8);
      self->_isPrepared = 0;
    }
    v10 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      player = self->_player;
      *(_DWORD *)buf = 136315650;
      v43 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
      v44 = 2112;
      v45 = player;
      v46 = 2112;
      v47 = v8;
      v12 = "%s Reused audio player %@ with audio session %@.";
LABEL_8:
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, v12, buf, 0x20u);
    }
  }
  else
  {
    self->_isPrepared = 0;
    v16 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_INFO, "%s Creating audio player...", buf, 0xCu);
    }
    -[AFAudioPlaybackRequest itemData](self->_request, "itemData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0C89AC8]);
    request = self->_request;
    if (v17)
    {
      -[AFAudioPlaybackRequest itemData](request, "itemData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v21 = (id *)&v41;
      v22 = objc_msgSend(v18, "initWithData:error:", v20, &v41);
    }
    else
    {
      -[AFAudioPlaybackRequest itemURL](request, "itemURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      v21 = (id *)&v40;
      v22 = objc_msgSend(v18, "initWithContentsOfURL:error:", v20, &v40);
    }
    v32 = (AVAudioPlayer *)v22;
    v33 = (AVAudioPlayer *)*v21;
    v34 = self->_player;
    self->_player = v32;

    if (v33)
    {
      v35 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
        v44 = 2112;
        v45 = v33;
        _os_log_error_impl(&dword_1C2614000, v35, OS_LOG_TYPE_ERROR, "%s Failed to create audio player due to error %@.", buf, 0x16u);
      }
      v36 = self->_player;
      self->_player = 0;

      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:underlyingError:", 1401, CFSTR("Failed to initialize AVAudioPlayer."), v33);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_35;
    }
    objc_storeStrong((id *)&self->_audioSession, a4);
    -[AVAudioPlayer setAudioSession:](self->_player, "setAudioSession:", v8);
    v10 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      v38 = self->_player;
      *(_DWORD *)buf = 136315650;
      v43 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
      v44 = 2112;
      v45 = v38;
      v46 = 2112;
      v47 = v8;
      v12 = "%s Created audio player %@ with audio session %@.";
      goto LABEL_8;
    }
  }
  if (self->_isPrepared)
  {
    v13 = *v9;
    v14 = 1;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      v15 = self->_player;
      *(_DWORD *)buf = 136315394;
      v43 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
      v44 = 2112;
      v45 = v15;
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_INFO, "%s Audio player %@ is already prepared to play.", buf, 0x16u);
    }
    goto LABEL_36;
  }
  -[AVAudioPlayer setNumberOfLoops:](self->_player, "setNumberOfLoops:", -[AFAudioPlaybackRequest numberOfLoops](self->_request, "numberOfLoops"));
  -[AFAudioPlaybackRequest fadeInDuration](self->_request, "fadeInDuration");
  v23 = v25;
  v24 = self->_player;
  LODWORD(v25) = 0;
  if (v23 <= 0.0)
    -[AFAudioPlaybackRequest volume](self->_request, "volume", v25);
  -[AVAudioPlayer setVolume:](v24, "setVolume:", v25);
  v26 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    v27 = self->_player;
    *(_DWORD *)buf = 136315394;
    v43 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
    v44 = 2112;
    v45 = v27;
    _os_log_impl(&dword_1C2614000, v26, OS_LOG_TYPE_INFO, "%s Preparing audio player %@ to play...", buf, 0x16u);
  }
  v28 = -[AVAudioPlayer prepareToPlay](self->_player, "prepareToPlay");
  v29 = *v9;
  if (!v28)
  {
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      v39 = self->_player;
      *(_DWORD *)buf = 136315394;
      v43 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
      v44 = 2112;
      v45 = v39;
      _os_log_error_impl(&dword_1C2614000, v29, OS_LOG_TYPE_ERROR, "%s Failed to prepare audio player %@ to play.", buf, 0x16u);
    }
    v31 = self->_player;
    self->_player = 0;

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:underlyingError:", 1402, CFSTR("Failed to prepare to play AVAudioPlayer."), 0);
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
LABEL_35:
    v14 = 0;
    goto LABEL_36;
  }
  v14 = 1;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    v30 = self->_player;
    *(_DWORD *)buf = 136315394;
    v43 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
    v44 = 2112;
    v45 = v30;
    _os_log_impl(&dword_1C2614000, v29, OS_LOG_TYPE_INFO, "%s Prepared audio player %@ to play.", buf, 0x16u);
  }
  self->_isPrepared = 1;
LABEL_36:

  return v14;
}

- (void)_startWithOptions:(unint64_t)a3 audioSession:(id)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7
{
  id v12;
  void (**v13)(_QWORD);
  void (**v14)(_QWORD);
  void (**v15)(id, id);
  os_log_t *v16;
  NSObject *v17;
  AFAudioPlaybackRequest *request;
  NSObject *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  id completion;
  BOOL v27;
  NSObject *v28;
  AVAudioPlayer *player;
  BOOL v30;
  NSObject *v31;
  AVAudioPlayer *v32;
  double v33;
  AVAudioPlayer *v34;
  int v35;
  int v36;
  double v37;
  double v38;
  AVAudioPlayer *v39;
  void *v40;
  AVAudioPlayer *v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = (void (**)(_QWORD))a5;
  v14 = (void (**)(_QWORD))a6;
  v15 = (void (**)(id, id))a7;
  v16 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  v17 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    *(_DWORD *)buf = 136315394;
    v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _startWithOptions:audioSession:preparationHandler:execution"
          "Handler:finalizationHandler:]";
    v45 = 2112;
    v46 = request;
    _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_INFO, "%s request = %@", buf, 0x16u);
  }
  if (!self->_isActive)
  {
    if (!-[AVAudioPlayer isPlaying](self->_player, "isPlaying"))
    {
      self->_isActive = 1;
      v25 = (void *)MEMORY[0x1C3BC4734](v15);
      completion = self->_completion;
      self->_completion = v25;

      if (v13)
        v13[2](v13);
      v42 = 0;
      v27 = -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:](self, "_prepareWithOptions:audioSession:error:", a3, v12, &v42);
      v24 = v42;
      if (v27)
      {
        -[AVAudioPlayer setDelegate:](self->_player, "setDelegate:", self);
        v28 = *v16;
        if (os_log_type_enabled(*v16, OS_LOG_TYPE_INFO))
        {
          player = self->_player;
          *(_DWORD *)buf = 136315394;
          v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _startWithOptions:audioSession:preparationHandler:exe"
                "cutionHandler:finalizationHandler:]";
          v45 = 2112;
          v46 = player;
          _os_log_impl(&dword_1C2614000, v28, OS_LOG_TYPE_INFO, "%s Asking audio player %@ to play...", buf, 0x16u);
        }
        v30 = -[AVAudioPlayer play](self->_player, "play");
        v31 = *v16;
        if (v30)
        {
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_INFO))
          {
            v32 = self->_player;
            *(_DWORD *)buf = 136315394;
            v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _startWithOptions:audioSession:preparationHandler:e"
                  "xecutionHandler:finalizationHandler:]";
            v45 = 2112;
            v46 = v32;
            _os_log_impl(&dword_1C2614000, v31, OS_LOG_TYPE_INFO, "%s Started playing audio player %@.", buf, 0x16u);
          }
          self->_isPrepared = 0;
          if (v14)
            v14[2](v14);
          -[AFAudioPlaybackRequest fadeInDuration](self->_request, "fadeInDuration");
          if (v33 > 0.0)
          {
            v34 = self->_player;
            -[AFAudioPlaybackRequest volume](self->_request, "volume");
            v36 = v35;
            -[AFAudioPlaybackRequest fadeInDuration](self->_request, "fadeInDuration");
            v38 = v37;
            LODWORD(v37) = v36;
            -[AVAudioPlayer setVolume:fadeDuration:](v34, "setVolume:fadeDuration:", v37, v38);
          }
        }
        else
        {
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
          {
            v41 = self->_player;
            *(_DWORD *)buf = 136315394;
            v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _startWithOptions:audioSession:preparationHandler:e"
                  "xecutionHandler:finalizationHandler:]";
            v45 = 2112;
            v46 = v41;
            _os_log_error_impl(&dword_1C2614000, v31, OS_LOG_TYPE_ERROR, "%s Failed to play audio player %@.", buf, 0x16u);
          }
          -[AVAudioPlayer setDelegate:](self->_player, "setDelegate:", 0);
          v39 = self->_player;
          self->_player = 0;

          objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:underlyingError:", 1403, CFSTR("Failed to play AVAudioPlayer."), 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _didNotStartWithError:](self, "_didNotStartWithError:", v40);

        }
      }
      else
      {
        -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _didNotStartWithError:](self, "_didNotStartWithError:", v24);
      }
      goto LABEL_12;
    }
    v23 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _startWithOptions:audioSession:preparationHandler:executi"
            "onHandler:finalizationHandler:]";
      _os_log_error_impl(&dword_1C2614000, v23, OS_LOG_TYPE_ERROR, "%s Ignored because the audio player is already playing.", buf, 0xCu);
      if (!v15)
        goto LABEL_13;
    }
    else if (!v15)
    {
      goto LABEL_13;
    }
    v20 = (void *)MEMORY[0x1E0CFE8B0];
    v21 = CFSTR("Attempted to start audio playback session when AVAudioPlayer is already playing.");
    v22 = 1404;
    goto LABEL_11;
  }
  v19 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _startWithOptions:audioSession:preparationHandler:execution"
          "Handler:finalizationHandler:]";
    _os_log_error_impl(&dword_1C2614000, v19, OS_LOG_TYPE_ERROR, "%s Ignored because the session is already active.", buf, 0xCu);
    if (!v15)
      goto LABEL_13;
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v20 = (void *)MEMORY[0x1E0CFE8B0];
    v21 = CFSTR("Attempted to start audio playback session when it is already active.");
    v22 = 1405;
LABEL_11:
    objc_msgSend(v20, "errorWithCode:description:underlyingError:", v22, v21, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v24);
LABEL_12:

  }
LABEL_13:

}

- (void)_stop:(BOOL)a3
{
  _BOOL4 v3;
  os_log_t *v5;
  NSObject *v6;
  AFAudioPlaybackRequest *request;
  double v8;
  double v9;
  dispatch_time_t v10;
  NSObject *queue;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  AFAudioPlaybackRequest *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  v6 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    *(_DWORD *)buf = 136315650;
    v17 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _stop:]";
    v18 = 2112;
    v19 = request;
    v20 = 1024;
    v21 = v3;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s request = %@, immediately = %d", buf, 0x1Cu);
  }
  if (self->_player)
  {
    -[AFAudioPlaybackRequest fadeOutDuration](self->_request, "fadeOutDuration");
    if (v3 || (v9 = v8, v8 == 0.0))
    {
      v13 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _stop:]";
        _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_INFO, "%s Stopping audio player...", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:underlyingError:", 1408, CFSTR("Stopped playback of AVAudioPlayer."), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _didStopWithError:](self, "_didStopWithError:", v14);

    }
    else
    {
      LODWORD(v8) = 0;
      -[AVAudioPlayer setVolume:fadeDuration:](self->_player, "setVolume:fadeDuration:", v8, v9);
      v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__CSSiriAudioPlaybackSessionImplAVAudioPlayerBased__stop___block_invoke;
      block[3] = &unk_1E7C292C8;
      block[4] = self;
      dispatch_after(v10, queue, block);
    }
  }
  else
  {
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _stop:]";
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s Ignored because there's no audio player to stop.", buf, 0xCu);
    }
  }
}

- (void)_handleBeginInterruption
{
  os_log_t *v3;
  NSObject *v4;
  AFAudioPlaybackRequest *request;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  AFAudioPlaybackRequest *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  v4 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    v7 = 136315394;
    v8 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _handleBeginInterruption]";
    v9 = 2112;
    v10 = request;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s _request = %@", (uint8_t *)&v7, 0x16u);
  }
  if (-[AVAudioPlayer isPlaying](self->_player, "isPlaying"))
  {
    -[AVAudioPlayer pause](self->_player, "pause");
  }
  else
  {
    v6 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _handleBeginInterruption]";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s Ignored because there's no audio player to pause.", (uint8_t *)&v7, 0xCu);
    }
  }
  self->_isPrepared = 0;
}

- (void)_handleEndInterruption:(BOOL)a3
{
  _BOOL4 v3;
  os_log_t *v5;
  NSObject *v6;
  AFAudioPlaybackRequest *request;
  AVAudioPlayer *player;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  AFAudioPlaybackRequest *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  v6 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    v10 = 136315650;
    v11 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _handleEndInterruption:]";
    v12 = 2112;
    v13 = request;
    v14 = 1024;
    v15 = v3;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s _request = %@, shouldResume = %d", (uint8_t *)&v10, 0x1Cu);
  }
  if (!v3)
    goto LABEL_7;
  player = self->_player;
  if (player)
  {
    if (!-[AVAudioPlayer isPlaying](player, "isPlaying") && !-[AVAudioPlayer play](self->_player, "play"))
LABEL_7:
      -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _stop:](self, "_stop:", 1);
  }
  else
  {
    v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _handleEndInterruption:]";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s Ignored because there's no audio player to resume playing.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_didNotStartWithError:(id)a3
{
  id v4;
  NSObject *v5;
  AFAudioPlaybackRequest *request;
  int v7;
  const char *v8;
  __int16 v9;
  AFAudioPlaybackRequest *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
  {
    request = self->_request;
    v7 = 136315650;
    v8 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _didNotStartWithError:]";
    v9 = 2112;
    v10 = request;
    v11 = 2112;
    v12 = v4;
    _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s request = %@, error = %@", (uint8_t *)&v7, 0x20u);
  }
  -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _finalizeWithError:](self, "_finalizeWithError:", v4);

}

- (void)_didStopWithError:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  AFAudioPlaybackRequest *request;
  AFAudioPlaybackRequest *v8;
  AVAudioPlayer *player;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  AFAudioPlaybackRequest *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  v6 = *MEMORY[0x1E0CFE6A8];
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
    {
      request = self->_request;
      v11 = 136315650;
      v12 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _didStopWithError:]";
      v13 = 2112;
      v14 = request;
      v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s request = %@, error = %@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v8 = self->_request;
    v11 = 136315394;
    v12 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _didStopWithError:]";
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s request = %@", (uint8_t *)&v11, 0x16u);
  }
  player = self->_player;
  if (player)
  {
    -[AVAudioPlayer setDelegate:](player, "setDelegate:", 0);
    -[AVAudioPlayer stop](self->_player, "stop");
  }
  else
  {
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _didStopWithError:]";
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s Ignored because there's no audio player to destroy.", (uint8_t *)&v11, 0xCu);
    }
  }
  -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _finalizeWithError:](self, "_finalizeWithError:", v4);

}

- (void)_finalizeWithError:(id)a3
{
  id v4;
  NSObject *v5;
  AFAudioPlaybackRequest *request;
  AFAudioPlaybackRequest *v7;
  void (**completion)(id, id);
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  AFAudioPlaybackRequest *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A8];
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
    {
      request = self->_request;
      v10 = 136315650;
      v11 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _finalizeWithError:]";
      v12 = 2112;
      v13 = request;
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s request = %@, error = %@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v7 = self->_request;
    v10 = 136315394;
    v11 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _finalizeWithError:]";
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s request = %@", (uint8_t *)&v10, 0x16u);
  }
  *(_WORD *)&self->_isActive = 0;
  completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, v4);
    v9 = self->_completion;
    self->_completion = 0;

  }
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  AFAudioPlaybackRequest *request;
  NSObject *queue;
  id v10;
  _QWORD v11[4];
  id v12;
  CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  AFAudioPlaybackRequest *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    *(_DWORD *)buf = 136315906;
    v15 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased audioPlayerDidFinishPlaying:successfully:]";
    v16 = 2112;
    v17 = request;
    v18 = 2112;
    v19 = v6;
    v20 = 1024;
    v21 = v4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s request = %@, player = %@, success = %d", buf, 0x26u);
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__CSSiriAudioPlaybackSessionImplAVAudioPlayerBased_audioPlayerDidFinishPlaying_successfully___block_invoke;
  v11[3] = &unk_1E7C292A0;
  v12 = v6;
  v13 = self;
  v10 = v6;
  dispatch_async(queue, v11);

}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  AFAudioPlaybackRequest *request;
  _QWORD block[4];
  id v14;
  CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  AFAudioPlaybackRequest *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
  {
    request = self->_request;
    *(_DWORD *)buf = 136315906;
    v18 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased audioPlayerDecodeErrorDidOccur:error:]";
    v19 = 2112;
    v20 = request;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s request = %@, player = %@, error = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__CSSiriAudioPlaybackSessionImplAVAudioPlayerBased_audioPlayerDecodeErrorDidOccur_error___block_invoke;
  block[3] = &unk_1E7C291C0;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

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
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __89__CSSiriAudioPlaybackSessionImplAVAudioPlayerBased_audioPlayerDecodeErrorDidOccur_error___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 16))
    return objc_msgSend(*(id *)(result + 40), "_didStopWithError:", *(_QWORD *)(result + 48));
  return result;
}

_QWORD *__93__CSSiriAudioPlaybackSessionImplAVAudioPlayerBased_audioPlayerDidFinishPlaying_successfully___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[2])
    return (_QWORD *)objc_msgSend(result, "_didStopWithError:", 0);
  return result;
}

void __58__CSSiriAudioPlaybackSessionImplAVAudioPlayerBased__stop___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _stop:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_INFO, "%s Stopping audio player...", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:underlyingError:", 1408, CFSTR("Stopped playback of AVAudioPlayer."), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_didStopWithError:", v4);

}

@end
