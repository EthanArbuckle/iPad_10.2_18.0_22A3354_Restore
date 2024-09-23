@implementation HFAudioPlayer

- (HFAudioPlayer)initWithAudioFileURL:(id)a3 audioSessionOptions:(unint64_t)a4 delegate:(id)a5
{
  id v9;
  id v10;
  HFAudioPlayer *v11;
  HFAudioPlayer *v12;
  unint64_t v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFAudioPlayer;
  v11 = -[HFAudioPlayer init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v12->_audioFileURL, a3);
    v12->_playerStopSource = 0;
    v13 = 2;
    if ((a4 & 1) == 0)
      v13 = a4;
    v12->_audioSessionOptions = v13;
  }

  return v12;
}

- (void)updateAudioFileURL:(id)a3
{
  NSURL *v4;
  NSURL *audioFileURL;

  v4 = (NSURL *)a3;
  if (-[HFAudioPlayer isPlaying](self, "isPlaying"))
    -[HFAudioPlayer _stopWithoutAudioSessionDeactivation](self, "_stopWithoutAudioSessionDeactivation");
  audioFileURL = self->_audioFileURL;
  self->_audioFileURL = v4;

}

- (void)dealloc
{
  objc_super v3;

  -[HFAudioPlayer _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)HFAudioPlayer;
  -[HFAudioPlayer dealloc](&v3, sel_dealloc);
}

- (void)_registerAudioSessionObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_audioSessionDidInterrupt_, *MEMORY[0x1E0C896F0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_audioSessionRouteChanged_, *MEMORY[0x1E0C89870], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_audioSessionMediaServicesWereLost_, *MEMORY[0x1E0C89730], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_audioSessionMediaServicesWereReset_, *MEMORY[0x1E0C89738], 0);

}

- (void)_deregisterAudioSessionObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C896F0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C89870], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C89730], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C89738], 0);

}

- (void)_displayLinkUpdated:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  float v16;
  id v17;

  -[HFAudioPlayer audioPlayer](self, "audioPlayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTime");
  -[HFAudioPlayer setPlayerCurrentTime:](self, "setPlayerCurrentTime:");

  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPlaying");

  if (!v6)
    return;
  -[HFAudioPlayer delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[HFAudioPlayer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1F0476350) & 1) == 0)
    {

      goto LABEL_7;
    }
    -[HFAudioPlayer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[HFAudioPlayer delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAudioPlayer playerCurrentTime](self, "playerCurrentTime");
      objc_msgSend(v8, "audioPlayer:didUpdatePlaybackTime:", self);
LABEL_7:

    }
  }
  -[HFAudioPlayer delegate](self, "delegate");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
    return;
  v17 = (id)v12;
  -[HFAudioPlayer delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "conformsToProtocol:", &unk_1F0476350))
  {
    -[HFAudioPlayer delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0)
      return;
    -[HFAudioPlayer delegate](self, "delegate");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[HFAudioPlayer audioPlayer](self, "audioPlayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "averagePowerForChannel:", 0);
    objc_msgSend(v17, "audioPlayer:didUpdateAveragePower:", self, v16);
  }

}

- (BOOL)_configureAudioSession:(id *)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAudioPlayer setAudioSession:](self, "setAudioSession:", v5);

  -[HFAudioPlayer _audioSessionCategory](self, "_audioSessionCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFAudioPlayer _audioSessionCategoryOptions](self, "_audioSessionCategoryOptions");
  HFLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v6;
    v27 = 2112;
    v28 = v22;
    _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Now setting audioSession Category = [%@] with Category Option = [%@]", buf, 0x16u);

  }
  -[HFAudioPlayer audioSession](self, "audioSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C89788];
  v24 = 0;
  v11 = objc_msgSend(v9, "setCategory:mode:options:error:", v6, v10, v7, &v24);
  v12 = v24;

  if ((v11 & 1) != 0)
  {

    -[HFAudioPlayer audioSession](self, "audioSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v14 = objc_msgSend(v13, "setActivationContext:error:", MEMORY[0x1E0C9AA70], &v23);
    v12 = v23;

    HFLogForCategory(0xAuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((v14 & 1) != 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[HFAudioPlayer audioSession](self, "audioSession");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "outputDataSources");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "Successfully configured Audio session with outputDataSources [%@]", buf, 0xCu);

      }
      v19 = 1;
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v12;
        _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Error setting activation context [%@]", buf, 0xCu);
      }

      v12 = objc_retainAutorelease(v12);
      v19 = 0;
      *a3 = v12;
    }
  }
  else
  {
    HFLogForCategory(0xAuLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v12;
      _os_log_error_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_ERROR, "Error setting Default Audio Session Category [%@]", buf, 0xCu);
    }

    v19 = 0;
  }

  return v19;
}

- (void)_deactivateAudioSession
{
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HFAudioPlayer audioSession](self, "audioSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v4 = objc_msgSend(v3, "setActive:withOptions:error:", 0, 1, &v9);
  v5 = v9;

  if ((v4 & 1) == 0)
  {
    HFLogForCategory(0xAuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Error deactivating audio session [%@]", buf, 0xCu);
    }

  }
  -[HFAudioPlayer audioSession](self, "audioSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v7, "setActivationContext:error:", MEMORY[0x1E0C9AA70], &v8);

  -[HFAudioPlayer setAudioSessionIsActive:](self, "setAudioSessionIsActive:", 0);
}

- (id)_audioSessionCategory
{
  char v3;
  char v4;
  id *v5;

  v3 = -[HFAudioPlayer audioSessionOptions](self, "audioSessionOptions");
  v4 = -[HFAudioPlayer audioSessionOptions](self, "audioSessionOptions");
  if ((v3 & 8) != 0)
  {
    v5 = (id *)MEMORY[0x1E0C89660];
  }
  else
  {
    v5 = (id *)MEMORY[0x1E0C89688];
    if ((v4 & 2) == 0)
      v5 = (id *)MEMORY[0x1E0C89690];
  }
  return *v5;
}

- (unint64_t)_audioSessionCategoryOptions
{
  int64_t v3;

  if ((-[HFAudioPlayer audioSessionOptions](self, "audioSessionOptions") & 8) != 0)
    v3 = 0;
  else
    v3 = ((int64_t)(-[HFAudioPlayer audioSessionOptions](self, "audioSessionOptions") << 62) >> 63) & 0x2C;
  return (-[HFAudioPlayer audioSessionOptions](self, "audioSessionOptions") >> 3) & 2 | v3;
}

- (void)_pauseWithReason:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pause");

  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentTime");
  -[HFAudioPlayer setPlayerCurrentTime:](self, "setPlayerCurrentTime:");

  -[HFAudioPlayer displayLink](self, "displayLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPaused:", 1);

  self->_paused = 1;
  -[HFAudioPlayer delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[HFAudioPlayer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1F0476350) & 1) == 0)
    {

      goto LABEL_6;
    }
    -[HFAudioPlayer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[HFAudioPlayer delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "audioPlayer:didPausePlaybackWithReason:", self, v12);
LABEL_6:

    }
  }

}

- (void)_stopWithoutAudioSessionDeactivation
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0xAuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HFAudioPlayer audioFileURL](self, "audioFileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Stopping Audio Player for URL = [%@]", (uint8_t *)&v13, 0xCu);

  }
  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pause");

  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stop");

  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentTime:", 0.0);

  self->_paused = 0;
  -[HFAudioPlayer delegate](self, "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[HFAudioPlayer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1F0476350) & 1) != 0)
    {
      -[HFAudioPlayer delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0)
        return;
      -[HFAudioPlayer delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "audioPlayerDidStopPlayback:", self);
    }
    else
    {

    }
  }
}

- (void)_cleanup
{
  void *v3;
  int v4;
  void *v5;
  AVAudioPlayer *audioPlayer;
  AVAudioSession *audioSession;
  CADisplayLink *displayLink;

  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaying");

  if (v4)
  {
    -[HFAudioPlayer audioPlayer](self, "audioPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stop");

  }
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  -[HFAudioPlayer _deregisterAudioSessionObservers](self, "_deregisterAudioSessionObservers");
  -[HFAudioPlayer _deactivateAudioSession](self, "_deactivateAudioSession");
  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = 0;

  audioSession = self->_audioSession;
  self->_audioSession = 0;

  displayLink = self->_displayLink;
  self->_displayLink = 0;

  self->_paused = 0;
}

- (BOOL)prepareToPlay:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0C89AC8]);
  -[HFAudioPlayer audioFileURL](self, "audioFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v7 = (void *)objc_msgSend(v5, "initWithContentsOfURL:error:", v6, &v26);
  v8 = v26;
  -[HFAudioPlayer setAudioPlayer:](self, "setAudioPlayer:", v7);

  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMeteringEnabled:", 1);

  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  if (v8)
  {
    HFLogForCategory(0xAuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v8;
      _os_log_error_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "Error initializing AVAudioPlayer [%@]", buf, 0xCu);
    }

    v12 = objc_retainAutorelease(v8);
    v13 = 0;
    *a3 = v12;
  }
  else if (-[HFAudioPlayer isAudioSessionActive](self, "isAudioSessionActive"))
  {
    HFLogForCategory(0xAuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[HFAudioPlayer audioFileURL](self, "audioFileURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Audio Session is already active continuining with AVAudioPlayer configured for URL [%@]", buf, 0xCu);

    }
    v12 = 0;
    v13 = 1;
  }
  else
  {
    v25 = 0;
    v16 = -[HFAudioPlayer _configureAudioSession:](self, "_configureAudioSession:", &v25);
    v17 = v25;
    v18 = v17;
    if (v16)
    {
      -[HFAudioPlayer audioSession](self, "audioSession");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v18;
      v20 = objc_msgSend(v19, "setActive:error:", 1, &v24);
      v12 = v24;

      if ((v20 & 1) != 0)
      {
        v13 = 1;
        -[HFAudioPlayer setAudioSessionIsActive:](self, "setAudioSessionIsActive:", 1);
        -[HFAudioPlayer audioPlayer](self, "audioPlayer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "prepareToPlay");

        -[HFAudioPlayer _registerAudioSessionObservers](self, "_registerAudioSessionObservers");
      }
      else
      {
        HFLogForCategory(0xAuLL);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v12;
          _os_log_error_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_ERROR, "Failed activating audio session [%@]", buf, 0xCu);
        }

        -[HFAudioPlayer setAudioSessionIsActive:](self, "setAudioSessionIsActive:", 0);
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
      v12 = v17;
    }
  }

  return v13;
}

- (void)play
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HFAudioPlayer displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFAudioPlayer displayLink](self, "displayLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkUpdated_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAudioPlayer setDisplayLink:](self, "setDisplayLink:", v5);

  -[HFAudioPlayer displayLink](self, "displayLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredFramesPerSecond:", 60);

  -[HFAudioPlayer displayLink](self, "displayLink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addToRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "play");

}

- (void)pause
{
  -[HFAudioPlayer _pauseWithReason:](self, "_pauseWithReason:", CFSTR("User Initiated"));
}

- (void)resume
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "play");

  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAudioPlayer playerCurrentTime](self, "playerCurrentTime");
  v6 = v5;
  -[HFAudioPlayer playerCurrentTime](self, "playerCurrentTime");
  if (v6 >= 0.02)
    v7 = v7 + -0.02;
  objc_msgSend(v4, "setCurrentTime:", v7);

  -[HFAudioPlayer displayLink](self, "displayLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPaused:", 0);

  self->_paused = 0;
  -[HFAudioPlayer delegate](self, "delegate");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v13 = (id)v9;
    -[HFAudioPlayer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1F0476350) & 1) == 0)
    {

      goto LABEL_9;
    }
    -[HFAudioPlayer delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[HFAudioPlayer delegate](self, "delegate");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "audioPlayerDidResumePlayback:", self);
LABEL_9:

    }
  }
}

- (void)stop
{
  -[HFAudioPlayer _stopWithoutAudioSessionDeactivation](self, "_stopWithoutAudioSessionDeactivation");
  -[HFAudioPlayer _cleanup](self, "_cleanup");
}

- (BOOL)isPlaying
{
  void *v2;
  char v3;

  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaying");

  return v3;
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (void)setVolume:(float)a3
{
  NSObject *v5;
  void *v6;
  double v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Setting player volume to [%f]", (uint8_t *)&v8, 0xCu);
  }

  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "setVolume:", v7);

}

- (float)volume
{
  void *v2;
  float v3;
  float v4;

  -[HFAudioPlayer audioPlayer](self, "audioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v4 = v3;

  return v4;
}

- (void)audioSessionDidInterrupt:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Audio Session was interrupted [%@]", (uint8_t *)&v6, 0xCu);
  }

  -[HFAudioPlayer setPlayerStopSource:](self, "setPlayerStopSource:", 2);
  -[HFAudioPlayer _pauseWithReason:](self, "_pauseWithReason:", CFSTR("Audio Session Interrupted"));

}

- (void)audioSessionMediaServicesWereLost:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Media Services Were Lost [%@]", (uint8_t *)&v6, 0xCu);
  }

  -[HFAudioPlayer setPlayerStopSource:](self, "setPlayerStopSource:", 3);
  -[HFAudioPlayer _pauseWithReason:](self, "_pauseWithReason:", CFSTR("Audio Session Lost"));

}

- (void)audioSessionMediaServicesWereReset:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Media Services Were Reset [%@]", (uint8_t *)&v6, 0xCu);
  }

  -[HFAudioPlayer setPlayerStopSource:](self, "setPlayerStopSource:", 3);
  -[HFAudioPlayer _pauseWithReason:](self, "_pauseWithReason:", CFSTR("Audio Session Reset"));

}

- (void)audioSessionRouteChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Audio Session Route Changed [%@]", (uint8_t *)&v11, 0xCu);
  }

  if (-[HFAudioPlayer isAudioSessionActive](self, "isAudioSessionActive"))
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C89880]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    if ((unint64_t)(v8 - 1) <= 1)
    {
      HFLogForCategory(0xAuLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v10;
        _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Routes Changed for reason [%@]", (uint8_t *)&v11, 0xCu);

      }
      -[HFAudioPlayer setPlayerStopSource:](self, "setPlayerStopSource:", 4);
      -[HFAudioPlayer _pauseWithReason:](self, "_pauseWithReason:", CFSTR("Audio Routes Changed"));
    }
  }

}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  -[HFAudioPlayer displayLink](self, "displayLink", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[HFAudioPlayer setPlayerCurrentTime:](self, "setPlayerCurrentTime:", 0.0);
  -[HFAudioPlayer delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v13 = (id)v7;
    -[HFAudioPlayer delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1F0476350) & 1) == 0)
    {

LABEL_9:
      return;
    }
    -[HFAudioPlayer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[HFAudioPlayer delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      if (v4)
      {
        objc_msgSend(v11, "audioPlayerDidFinishPlayback:withError:", self, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 60);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "audioPlayerDidFinishPlayback:withError:", self, v12);

      }
      goto LABEL_9;
    }
  }
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory(0xAuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Audio Player Decode Error [%@]", (uint8_t *)&v7, 0xCu);
  }

  -[HFAudioPlayer _cleanup](self, "_cleanup");
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (unint64_t)playerStopSource
{
  return self->_playerStopSource;
}

- (void)setPlayerStopSource:(unint64_t)a3
{
  self->_playerStopSource = a3;
}

- (NSNumber)routeChangeReason
{
  return self->_routeChangeReason;
}

- (void)setRouteChangeReason:(id)a3
{
  objc_storeStrong((id *)&self->_routeChangeReason, a3);
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileURL, a3);
}

- (AVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_audioSession, a3);
}

- (BOOL)isAudioSessionActive
{
  return self->_audioSessionIsActive;
}

- (void)setAudioSessionIsActive:(BOOL)a3
{
  self->_audioSessionIsActive = a3;
}

- (double)playerCurrentTime
{
  return self->_playerCurrentTime;
}

- (void)setPlayerCurrentTime:(double)a3
{
  self->_playerCurrentTime = a3;
}

- (unint64_t)audioSessionOptions
{
  return self->_audioSessionOptions;
}

- (void)setAudioSessionOptions:(unint64_t)a3
{
  self->_audioSessionOptions = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (HFAudioPlayerDelegate)delegate
{
  return (HFAudioPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_routeChangeReason, 0);
}

@end
