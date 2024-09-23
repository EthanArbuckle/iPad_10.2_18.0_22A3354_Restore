@implementation ANTonePlayer

- (ANTonePlayer)initWithAudioSessionID:(unsigned int)a3 endpointUUID:(id)a4
{
  id v7;
  ANTonePlayer *v8;
  ANTonePlayer *v9;
  uint64_t v10;
  OS_os_log *log;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ANTonePlayer;
  v8 = -[ANTonePlayer init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endpointUUID, a4);
    v9->_proxyAudioSessionID = a3;
    v9->_usingProxyAudioSession = 0;
    ANLogBuildCategoryName();
    ANLogWithCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ANTonePlayer audioSession](self, "audioSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANTonePlayer _deregisterForNotificationsWithAudioSession:](self, "_deregisterForNotificationsWithAudioSession:", v3);

  v4.receiver = self;
  v4.super_class = (Class)ANTonePlayer;
  -[ANTonePlayer dealloc](&v4, sel_dealloc);
}

- (void)playFileURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  unsigned int v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD block[5];
  id v24;
  id v25;

  v6 = a3;
  -[ANTonePlayer setHandler:](self, "setHandler:", a4);
  v7 = (void *)MEMORY[0x1E0C89AE8];
  v8 = -[ANTonePlayer proxyAudioSessionID](self, "proxyAudioSessionID");
  -[ANTonePlayer endpointUUID](self, "endpointUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v7, "audioSessionWithProxyAudioSessionID:endpointID:error:", v8, v9, &v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v25;
  -[ANTonePlayer setAudioSession:](self, "setAudioSession:", v10);

  -[ANTonePlayer audioSession](self, "audioSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ANTonePlayer audioSession](self, "audioSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "opaqueSessionID");
    v15 = -[ANTonePlayer proxyAudioSessionID](self, "proxyAudioSessionID");

    if (v14 == v15)
    {
      -[ANTonePlayer setUsingProxyAudioSession:](self, "setUsingProxyAudioSession:", 1);
    }
    else
    {
      -[ANTonePlayer setUsingProxyAudioSession:](self, "setUsingProxyAudioSession:", 0);
      -[ANTonePlayer setProxyAudioSessionID:](self, "setProxyAudioSessionID:", 0);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__ANTonePlayer_playFileURL_completionHandler___block_invoke;
    block[3] = &unk_1E938F2F0;
    block[4] = self;
    v24 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    -[ANTonePlayer log](self, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ANTonePlayer playFileURL:completionHandler:].cold.1((uint64_t)v11, v16, v17, v18, v19, v20, v21, v22);

    -[ANTonePlayer _playSystemSoundWithFileURL:](self, "_playSystemSoundWithFileURL:", v6);
  }

}

uint64_t __46__ANTonePlayer_playFileURL_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playFileURL:", *(_QWORD *)(a1 + 40));
}

- (void)stop
{
  id v2;

  -[ANTonePlayer player](self, "player");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)_playSystemSoundWithFileURL:(id)a3
{
  void *v4;
  const __CFURL *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  id v13;
  _QWORD block[4];
  id v15;
  ANTonePlayer *v16;
  int v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D48560];
  v5 = (const __CFURL *)a3;
  objc_msgSend(v4, "sharedAVSystemController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "an_isCarPlayConnected");

  -[ANTonePlayer log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "CarPlay is Connected: %d", buf, 8u);
  }

  *(_DWORD *)buf = 0;
  AudioServicesCreateSystemSoundID(v5, (SystemSoundID *)buf);

  v9 = (void *)objc_opt_new();
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C92528]);
  dispatch_get_global_queue(25, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ANTonePlayer__playSystemSoundWithFileURL___block_invoke;
  block[3] = &unk_1E938FA20;
  v17 = *(_DWORD *)buf;
  v15 = v10;
  v16 = self;
  v13 = v10;
  dispatch_after(v12, v11, block);

}

uint64_t __44__ANTonePlayer__playSystemSoundWithFileURL___block_invoke()
{
  return AudioServicesPlaySystemSoundWithOptions();
}

uint64_t __44__ANTonePlayer__playSystemSoundWithFileURL___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callHandler:", 0);
}

- (void)_playFileURL:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t v25[8];
  id v26;

  objc_msgSend(MEMORY[0x1E0C8B2E8], "playerWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANTonePlayer setPlayer:](self, "setPlayer:", v4);

  -[ANTonePlayer player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v6 = -[ANTonePlayer _activateAudioSessionForPlayer:error:](self, "_activateAudioSessionForPlayer:error:", v5, &v26);
  v7 = v26;

  if (v6)
  {
    -[ANTonePlayer audioSession](self, "audioSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANTonePlayer _registerForNotificationsWithAudioSession:](self, "_registerForNotificationsWithAudioSession:", v8);

    -[ANTonePlayer player](self, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANTonePlayer setPlayerItem:](self, "setPlayerItem:", v10);

    -[ANTonePlayer endpointUUID](self, "endpointUUID");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11
      || (v12 = (void *)v11,
          -[ANTonePlayer endpointUUID](self, "endpointUUID"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "an_isLocalDevice"),
          v13,
          v12,
          v14))
    {
      objc_msgSend(MEMORY[0x1E0CF7EA0], "sharedController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setVolumeWithOptions:", 1);

    }
    -[ANTonePlayer player](self, "player");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "play");

    -[ANTonePlayer log](self, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1D23A0000, v17, OS_LOG_TYPE_DEFAULT, "Playback started", v25, 2u);
    }

  }
  else
  {
    -[ANTonePlayer log](self, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ANTonePlayer _playFileURL:].cold.1((uint64_t)v7, v18, v19, v20, v21, v22, v23, v24);

    -[ANTonePlayer _callHandler:](self, "_callHandler:", v7);
  }

}

- (BOOL)_activateAudioSessionForPlayer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v10;
  char v11;
  uint8_t v12[16];

  v6 = a3;
  -[ANTonePlayer audioSession](self, "audioSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAudioSession:", v7);

  if (-[ANTonePlayer usingProxyAudioSession](self, "usingProxyAudioSession"))
  {
    -[ANTonePlayer log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "Using proxy audio session. Skipping activation.", v12, 2u);
    }

    return 1;
  }
  else
  {
    -[ANTonePlayer audioSession](self, "audioSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "setActive:error:", 1, a4);

    return v11;
  }
}

- (void)_deactivateAudioSession
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[ANTonePlayer usingProxyAudioSession](self, "usingProxyAudioSession"))
  {
    -[ANTonePlayer audioSession](self, "audioSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "opaqueSessionID");

    -[ANTonePlayer audioSession](self, "audioSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v7 = objc_msgSend(v6, "setActive:withOptions:error:", 0, 1, &v11);
    v3 = v11;

    -[ANTonePlayer log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        goto LABEL_10;
      }
      -[ANTonePlayer audioSession](self, "audioSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 1024;
      v15 = v5;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "Deactivated audio session %@ (ID = %d)", buf, 0x12u);
    }
    else
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      -[ANTonePlayer audioSession](self, "audioSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v13 = v10;
      v14 = 1024;
      v15 = v5;
      v16 = 2112;
      v17 = v3;
      _os_log_error_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_ERROR, "Failed to deactivate audio session %@ (ID = %d), Error = %@", buf, 0x1Cu);
    }

    goto LABEL_9;
  }
  -[ANTonePlayer log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "Using proxy audio session. Skipping deactivation.", buf, 2u);
  }
LABEL_10:

}

- (void)_registerForNotificationsWithAudioSession:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_audioSessionInterruptionHandler_, *MEMORY[0x1E0C896F0], v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleFailure, *MEMORY[0x1E0C89730], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__handleFailure, *MEMORY[0x1E0C89738], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__handlePlayerItemPlayedToEnd_, *MEMORY[0x1E0C8AC48], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__handlePlayerItemFailedToPlayToEnd_, *MEMORY[0x1E0C8AC58], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_playerRateChangedHandler_, *MEMORY[0x1E0C8AC90], 0);

}

- (void)_deregisterForNotificationsWithAudioSession:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0C896F0], v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0C89730], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0C89738], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC48], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC58], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC90], 0);

}

- (void)audioSessionInterruptionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[ANTonePlayer audioSession](self, "audioSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ANTonePlayer log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5 != v6)
    {
      if (v8)
      {
        -[ANTonePlayer audioSession](self, "audioSession");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v9;
        v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "Received Audio Session Interruption Notification for different Audio Session. Expected: %@, Actual: %@", (uint8_t *)&v18, 0x16u);

      }
      goto LABEL_8;
    }
    if (v8)
    {
      v18 = 138412290;
      v19 = v5;
      _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "Received Audio Session Interruption Notification for Audio Session %@", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(v4, "userInfo");
    v10 = objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v10)
    {
      -[NSObject valueForKey:](v10, "valueForKey:", *MEMORY[0x1E0C89718]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = objc_msgSend(v11, "unsignedIntegerValue");
        if (!v13)
        {
          -[ANTonePlayer log](self, "log");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v18) = 0;
            _os_log_impl(&dword_1D23A0000, v17, OS_LOG_TYPE_DEFAULT, "Audio Session Interruption Ended. Not playing. Doing nothing.", (uint8_t *)&v18, 2u);
          }

          goto LABEL_29;
        }
        if (v13 == 1)
        {
          -[ANTonePlayer log](self, "log");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v18) = 0;
            _os_log_impl(&dword_1D23A0000, v14, OS_LOG_TYPE_DEFAULT, "Audio Session Interruption Began", (uint8_t *)&v18, 2u);
          }

          -[ANTonePlayer player](self, "player");
          v15 = objc_claimAutoreleasedReturnValue();
          -[NSObject pause](v15, "pause");
        }
        else
        {
          -[ANTonePlayer log](self, "log");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            -[ANTonePlayer audioSessionInterruptionHandler:].cold.4();
        }
      }
      else
      {
        -[ANTonePlayer log](self, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[ANTonePlayer audioSessionInterruptionHandler:].cold.3();
      }

      -[ANTonePlayer _handleFailure](self, "_handleFailure");
LABEL_29:

      goto LABEL_8;
    }
    -[ANTonePlayer log](self, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ANTonePlayer audioSessionInterruptionHandler:].cold.2();

    -[ANTonePlayer _handleFailure](self, "_handleFailure");
  }
  else
  {
    -[ANTonePlayer log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ANTonePlayer audioSessionInterruptionHandler:].cold.1();
  }
LABEL_8:

}

- (void)_handleFailure
{
  NSObject *v3;
  uint8_t v4[16];

  -[ANTonePlayer log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "Handling Failure. Deactivating Audio Session and Ending Playback.", v4, 2u);
  }

  -[ANTonePlayer _deactivateAudioSession](self, "_deactivateAudioSession");
  -[ANTonePlayer _callHandler:](self, "_callHandler:", 0);
}

- (void)_handlePlayerItemFailedToPlayToEnd:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  -[ANTonePlayer playerItem](self, "playerItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ANTonePlayer playerItem](self, "playerItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v9)
    {
      -[ANTonePlayer log](self, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ANTonePlayer _handlePlayerItemFailedToPlayToEnd:].cold.1();

      -[ANTonePlayer _handleFailure](self, "_handleFailure");
    }
  }

}

- (void)_handlePlayerItemPlayedToEnd:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  -[ANTonePlayer playerItem](self, "playerItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ANTonePlayer playerItem](self, "playerItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v9)
    {
      -[ANTonePlayer log](self, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "Tone Player Finished Playing", v11, 2u);
      }

      -[ANTonePlayer _deactivateAudioSession](self, "_deactivateAudioSession");
      -[ANTonePlayer _callHandler:](self, "_callHandler:", 0);
    }
  }

}

- (void)playerRateChangedHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  float v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ANTonePlayer player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      -[ANTonePlayer log](self, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = *(double *)&v4;
        _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "|> Rate Changed Notification: %@", (uint8_t *)&v13, 0xCu);
      }

      -[ANTonePlayer log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "rate");
        v13 = 134217984;
        v14 = v9;
        _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "|> Player Rate: %f", (uint8_t *)&v13, 0xCu);
      }

      objc_msgSend(v4, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AC98]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C8ACA8]))
      {
        -[ANTonePlayer log](self, "log");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[ANTonePlayer playerRateChangedHandler:].cold.1();

        -[ANTonePlayer _handleFailure](self, "_handleFailure");
      }

    }
  }

}

- (void)_callHandler:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[ANTonePlayer handler](self, "handler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ANTonePlayer handler](self, "handler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

    -[ANTonePlayer setHandler:](self, "setHandler:", 0);
  }

}

- (unsigned)proxyAudioSessionID
{
  return self->_proxyAudioSessionID;
}

- (void)setProxyAudioSessionID:(unsigned int)a3
{
  self->_proxyAudioSessionID = a3;
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_audioSession, a3);
}

- (BOOL)usingProxyAudioSession
{
  return self->_usingProxyAudioSession;
}

- (void)setUsingProxyAudioSession:(BOOL)a3
{
  self->_usingProxyAudioSession = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_playerItem, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
}

- (void)playFileURL:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D23A0000, a2, a3, "Failed to create Audio Session. Error = %@", a5, a6, a7, a8, 2u);
}

- (void)_playFileURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D23A0000, a2, a3, "Failed to activate Audio Session. Error = %@", a5, a6, a7, a8, 2u);
}

- (void)audioSessionInterruptionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1D23A0000, v0, v1, "Received Audio Session Interruption Notification Without an Audio Session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)audioSessionInterruptionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1D23A0000, v0, v1, "Invalid audio session interruption notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)audioSessionInterruptionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1D23A0000, v0, v1, "Missing audio session interruption type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)audioSessionInterruptionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1D23A0000, v0, v1, "Invalid audio session interruption type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_handlePlayerItemFailedToPlayToEnd:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1D23A0000, v0, v1, "Tone Player Failed to Play to End ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)playerRateChangedHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1D23A0000, v0, v1, "|> Failed to set rate.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
