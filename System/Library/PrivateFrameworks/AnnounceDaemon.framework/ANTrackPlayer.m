@implementation ANTrackPlayer

- (ANTrackPlayer)initWithOptions:(unint64_t)a3
{
  return -[ANTrackPlayer initWithOptions:endpointUUID:](self, "initWithOptions:endpointUUID:", a3, 0);
}

- (ANTrackPlayer)initWithOptions:(unint64_t)a3 endpointUUID:(id)a4
{
  id v7;
  ANTrackPlayer *v8;
  ANTrackPlayer *v9;
  uint64_t v10;
  NSMutableArray *playerItems;
  AVQueuePlayer *v12;
  AVQueuePlayer *queuePlayer;
  uint64_t v14;
  OS_os_log *log;
  uint64_t v16;
  ANTimer *interruptionTimer;
  uint64_t v18;
  ANTimer *playerTimer;
  uint64_t v20;
  AVAudioSession *audioSession;
  NSObject *v22;
  AVAudioSession *v23;
  ANAudioSessionManager *v24;
  AVAudioSession *v25;
  OS_dispatch_queue *mainQueue;
  void *v27;
  uint64_t v28;
  ANAudioSessionManager *audioSessionManager;
  objc_super v31;
  uint8_t buf[4];
  AVAudioSession *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)ANTrackPlayer;
  v8 = -[ANTrackPlayer init](&v31, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mainQueue, MEMORY[0x1E0C80D38]);
    v10 = objc_opt_new();
    playerItems = v9->_playerItems;
    v9->_playerItems = (NSMutableArray *)v10;

    v9->_silenceBetweenEachTrack = 0.1;
    v9->_previousSkipGoesToPreviousTrackDelta = 3.0;
    v9->_options = a3;
    v9->_playbackState = 3;
    v9->_readyToPlay = 0;
    v12 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x1E0C8B350]);
    queuePlayer = v9->_queuePlayer;
    v9->_queuePlayer = v12;

    objc_storeStrong((id *)&v9->_endpointUUID, a4);
    ANLogBuildCategoryName();
    ANLogWithCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    log = v9->_log;
    v9->_log = (OS_os_log *)v14;

    objc_msgSend(MEMORY[0x1E0CF7E90], "timerWithLabel:identifier:", CFSTR("AudioInterruption"), v7);
    v16 = objc_claimAutoreleasedReturnValue();
    interruptionTimer = v9->_interruptionTimer;
    v9->_interruptionTimer = (ANTimer *)v16;

    objc_msgSend(MEMORY[0x1E0CF7E90], "timerWithLabel:identifier:", CFSTR("AudioPlayer"), v7);
    v18 = objc_claimAutoreleasedReturnValue();
    playerTimer = v9->_playerTimer;
    v9->_playerTimer = (ANTimer *)v18;

    v9->_someOtherSidekickSessionAudioIsPlaying = 0;
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v20 = objc_claimAutoreleasedReturnValue();
    audioSession = v9->_audioSession;
    v9->_audioSession = (AVAudioSession *)v20;

    -[ANTrackPlayer log](v9, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v9->_audioSession;
      *(_DWORD *)buf = 138412290;
      v33 = v23;
      _os_log_impl(&dword_1D23A0000, v22, OS_LOG_TYPE_DEFAULT, "Using Shared Audio Session for local playback: %@", buf, 0xCu);
    }

    -[ANTrackPlayer _configureAudioSession](v9, "_configureAudioSession");
    v24 = [ANAudioSessionManager alloc];
    v25 = v9->_audioSession;
    mainQueue = v9->_mainQueue;
    -[ANTrackPlayer endpointUUID](v9, "endpointUUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[ANAudioSessionManager initWithAudioSession:queue:endpointID:](v24, "initWithAudioSession:queue:endpointID:", v25, mainQueue, v27);
    audioSessionManager = v9->_audioSessionManager;
    v9->_audioSessionManager = (ANAudioSessionManager *)v28;

    -[AVQueuePlayer setAudioSession:](v9->_queuePlayer, "setAudioSession:", v9->_audioSession);
    -[ANTrackPlayer _registerForNotificationsWithAudioSession:](v9, "_registerForNotificationsWithAudioSession:", v9->_audioSession);
    -[ANTrackPlayer _addObserverForPlayer:](v9, "_addObserverForPlayer:", v9->_queuePlayer);
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[ANTrackPlayer _deregisterForNotificationsWithAudioSession:](self, "_deregisterForNotificationsWithAudioSession:", self->_audioSession);
  -[ANTrackPlayer queuePlayer](self, "queuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANTrackPlayer _removeObserverForPlayer:](self, "_removeObserverForPlayer:", v3);

  -[ANTrackPlayer queuePlayer](self, "queuePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANTrackPlayer _removeItemObserverForPlayer:](self, "_removeItemObserverForPlayer:", v4);

  v5.receiver = self;
  v5.super_class = (Class)ANTrackPlayer;
  -[ANTrackPlayer dealloc](&v5, sel_dealloc);
}

- (void)setPlaybackState:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[ANTrackPlayer log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = a3;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "Setting Playback State to %lu", buf, 0xCu);
  }

  self->_playbackState = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__ANTrackPlayer_setPlaybackState___block_invoke;
  v6[3] = &unk_1E93902A8;
  v6[4] = self;
  v6[5] = a3;
  -[ANTrackPlayer _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v6);
}

void __34__ANTrackPlayer_setPlaybackState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "activelyPlayingAnnouncementID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackPlayer:didUpdatePlaybackState:announcementID:", v3, v2, v4);

}

- (BOOL)add:(id)a3 announcementID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ANTrackPlayer log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[ANTrackPlayer add:announcementID:]";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%s: track %@", (uint8_t *)&v11, 0x16u);
  }

  if (-[ANTrackPlayer _insertAudioBetween](self, "_insertAudioBetween"))
    v9 = -[ANTrackPlayer _add:announcementID:trackType:](self, "_add:announcementID:trackType:", v6, v7, 0);
  else
    v9 = 0;

  return v9;
}

- (BOOL)_add:(id)a3 announcementID:(id)a4 trackType:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[ANTrackPlayer log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[ANTrackPlayer _add:announcementID:trackType:]";
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "%s: track %@", (uint8_t *)&v14, 0x16u);
  }

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v8);
  v12 = -[ANTrackPlayer _addURL:announcementID:trackType:](self, "_addURL:announcementID:trackType:", v11, v9, a5);

  return v12;
}

- (BOOL)_addURL:(id)a3 announcementID:(id)a4 trackType:(int64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  ANTrackPlayerInfo *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0C8B300];
  v9 = a4;
  objc_msgSend(v8, "playerItemWithURL:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANTrackPlayer queuePlayer](self, "queuePlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertItem:afterItem:", v10, 0);

  objc_msgSend(v10, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, 0);
  v12 = -[ANTrackPlayerInfo initWithPlayerItem:announcementID:trackType:]([ANTrackPlayerInfo alloc], "initWithPlayerItem:announcementID:trackType:", v10, v9, a5);

  -[ANTrackPlayer playerItems](self, "playerItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v12);

  return 1;
}

- (BOOL)_insertAudioBetween
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  -[ANTrackPlayer audioFileAtStart](self, "audioFileAtStart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANTrackPlayer playerItems](self, "playerItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v7 = 1;
    if (v3)
      goto LABEL_3;
LABEL_5:
    v8 = 1;
    goto LABEL_6;
  }
  -[ANTrackPlayer audioFileTransition](self, "audioFileTransition");
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = 2;
  v3 = (void *)v6;
  if (!v6)
    goto LABEL_5;
LABEL_3:
  v8 = -[ANTrackPlayer _addURL:announcementID:trackType:](self, "_addURL:announcementID:trackType:", v3, 0, v7);
LABEL_6:

  return v8;
}

- (id)prepareToPlay
{
  void *v3;
  id v4;
  id v6;

  -[ANTrackPlayer audioSessionManager](self, "audioSessionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v3, "activateAudioSessionWithError:", &v6);
  v4 = v6;

  if (!v4)
    -[ANTrackPlayer setReadyToPlay:](self, "setReadyToPlay:", 1);
  return v4;
}

- (void)playWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ANTrackPlayer_playWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E938FBD8;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __43__ANTrackPlayer_playWithCompletionHandler___block_invoke(id *a1)
{
  id WeakRetained;
  NSObject *v3;
  _QWORD v4[5];
  id v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (objc_msgSend(WeakRetained, "playbackState") == 1 || objc_msgSend(WeakRetained, "playbackState") == 2)
  {
    objc_msgSend(a1[4], "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v7 = objc_msgSend(WeakRetained, "playbackState");
      _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "Already playing or interrupted. PlaybackState: %ld", buf, 0xCu);
    }

    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __43__ANTrackPlayer_playWithCompletionHandler___block_invoke_21;
    v4[3] = &unk_1E938F488;
    v4[4] = WeakRetained;
    v5 = a1[5];
    objc_msgSend(WeakRetained, "_playWithCompletionHandler:", v4);

  }
}

void __43__ANTrackPlayer_playWithCompletionHandler___block_invoke_21(uint64_t a1, void *a2)
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a2 == 0;
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "setPlaybackState:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_playWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[ANTrackPlayer readyToPlay](self, "readyToPlay"))
  {
    -[ANTrackPlayer _handleReadyToPlayWithCompletionHandler:](self, "_handleReadyToPlayWithCompletionHandler:", v4);
  }
  else
  {
    -[ANTrackPlayer audioSessionManager](self, "audioSessionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__ANTrackPlayer__playWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E938F488;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v6, "activateAudioSessionWithCompletionHandler:", v7);

  }
}

void __44__ANTrackPlayer__playWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__ANTrackPlayer__playWithCompletionHandler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v4, "setReadyToPlay:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_handleReadyToPlayWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }

}

- (void)_handleReadyToPlayWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  void (**v31)(id, void *);
  id v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  _DWORD v36[7];

  *(_QWORD *)&v36[5] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[ANTrackPlayer readyToPlay](self, "readyToPlay"))
  {
    -[ANTrackPlayer queuePlayer](self, "queuePlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_8;
    -[ANTrackPlayer log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ANTrackPlayer _handleReadyToPlayWithCompletionHandler:].cold.1(self, v8);

    -[ANTrackPlayer queuePlayer](self, "queuePlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v4[2](v4, v10);

    }
    else
    {
LABEL_8:
      -[ANTrackPlayer queuePlayer](self, "queuePlayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "status");

      -[ANTrackPlayer queuePlayer](self, "queuePlayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "status");

      -[ANTrackPlayer log](self, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[ANTrackPlayer queuePlayer](self, "queuePlayer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "currentItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v36 = v19;
        _os_log_impl(&dword_1D23A0000, v17, OS_LOG_TYPE_DEFAULT, "Current Item = %@", buf, 0xCu);

      }
      -[ANTrackPlayer log](self, "log");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v36[0] = v13 == 1;
        LOWORD(v36[1]) = 1024;
        *(_DWORD *)((char *)&v36[1] + 2) = v16 == 1;
        _os_log_impl(&dword_1D23A0000, v20, OS_LOG_TYPE_DEFAULT, "QueuePlayerReady = %d, PlayerItemReady = %d", buf, 0xEu);
      }

      if (v13 == 1 && v16 == 1)
      {
        -[ANTrackPlayer playerTimer](self, "playerTimer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "cancel");

        -[ANTrackPlayer setPlaybackPending:](self, "setPlaybackPending:", 0);
        -[ANTrackPlayer setHandler:](self, "setHandler:", 0);
        -[ANTrackPlayer setReadyToPlay:](self, "setReadyToPlay:", 0);
        -[ANTrackPlayer log](self, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v36 = "-[ANTrackPlayer _handleReadyToPlayWithCompletionHandler:]";
          _os_log_impl(&dword_1D23A0000, v22, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __57__ANTrackPlayer__handleReadyToPlayWithCompletionHandler___block_invoke_26;
        v30[3] = &unk_1E93902D0;
        objc_copyWeak(&v32, (id *)buf);
        v31 = v4;
        -[ANTrackPlayer playInternalWithCompletionHandler:](self, "playInternalWithCompletionHandler:", v30);

        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        -[ANTrackPlayer log](self, "log");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D23A0000, v23, OS_LOG_TYPE_DEFAULT, "NOT ready to play.", buf, 2u);
        }

        -[ANTrackPlayer setPlaybackPending:](self, "setPlaybackPending:", 1);
        -[ANTrackPlayer setHandler:](self, "setHandler:", v4);
        objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "numberForDefault:", *MEMORY[0x1E0CF7BF8]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        v27 = v26;

        objc_initWeak((id *)buf, self);
        -[ANTrackPlayer playerTimer](self, "playerTimer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[ANTrackPlayer mainQueue](self, "mainQueue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __57__ANTrackPlayer__handleReadyToPlayWithCompletionHandler___block_invoke;
        v33[3] = &unk_1E938F518;
        objc_copyWeak(&v34, (id *)buf);
        objc_msgSend(v28, "startWithValue:queue:handler:", v29, v33, v27);

        objc_destroyWeak(&v34);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:", 1018);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v11);

  }
}

void __57__ANTrackPlayer__handleReadyToPlayWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __57__ANTrackPlayer__handleReadyToPlayWithCompletionHandler___block_invoke_cold_1(WeakRetained, v2);

  objc_msgSend(WeakRetained, "_stopAndUpdatePlaybackState:", 0);
  objc_msgSend(WeakRetained, "setPlaybackPending:", 0);
  objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1018, *MEMORY[0x1E0CF7C40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "handler");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v4)[2](v4, v3);

  objc_msgSend(WeakRetained, "setHandler:", 0);
}

void __57__ANTrackPlayer__handleReadyToPlayWithCompletionHandler___block_invoke_26(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "audioSessionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateAudioSessionAfterDelay:", 0.0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSString)activelyPlayingAnnouncementID
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  -[ANTrackPlayer playerItems](self, "playerItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "announcementID");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ANTrackPlayer_activelyPlayingAnnouncementID__block_invoke;
  block[3] = &unk_1E9390338;
  v11 = v5;
  v12 = &v13;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSString *)v8;
}

void __46__ANTrackPlayer_activelyPlayingAnnouncementID__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[16];

  objc_msgSend(*(id *)(a1 + 32), "playerItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __46__ANTrackPlayer_activelyPlayingAnnouncementID__block_invoke_cold_1();

    objc_msgSend(v3, "announcementID");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(NSObject **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "Did not find currently playing info. Using last item.", v8, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

BOOL __46__ANTrackPlayer_activelyPlayingAnnouncementID__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_msgSend(v2, "completed") & 1) == 0 && objc_msgSend(v2, "trackType") == 0;

  return v3;
}

- (void)stopWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANTrackPlayer log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[ANTrackPlayer stopWithCompletionHandler:]";
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__ANTrackPlayer_stopWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E938F8E0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __43__ANTrackPlayer_stopWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_stopAndUpdatePlaybackState:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_stopAndUpdatePlaybackState:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;

  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ANTrackPlayer interruptionTimer](self, "interruptionTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  -[ANTrackPlayer playerTimer](self, "playerTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  -[ANTrackPlayer stopInternalSync](self, "stopInternalSync");
  -[ANTrackPlayer setPlaybackState:](self, "setPlaybackState:", a3);
}

- (void)end
{
  NSObject *v3;
  _QWORD block[5];

  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__ANTrackPlayer_end__block_invoke;
  block[3] = &unk_1E938F9B0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __20__ANTrackPlayer_end__block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  double v5;
  id v6;

  v2 = 0.0;
  if ((objc_msgSend(*(id *)(a1 + 32), "options") & 0x200) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberForDefault:", *MEMORY[0x1E0CF7B18]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v2 = v5;

  }
  objc_msgSend(*(id *)(a1 + 32), "audioSessionManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateAudioSessionAfterDelay:", v2);

}

- (void)nextWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ANTrackPlayer_nextWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E938FBD8;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __43__ANTrackPlayer_nextWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[ANTrackPlayer nextWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  if (objc_msgSend(WeakRetained, "playbackState") == 1)
  {
    objc_msgSend(WeakRetained, "stopInternalSync");
    objc_msgSend(WeakRetained, "nextInternalSync");
    objc_msgSend(WeakRetained, "_playWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }

}

- (void)previousWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ANTrackPlayer_previousWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E938FBD8;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__ANTrackPlayer_previousWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[ANTrackPlayer previousWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  if (objc_msgSend(WeakRetained, "playbackState") == 1)
  {
    objc_msgSend(WeakRetained, "stopInternalSync");
    objc_msgSend(WeakRetained, "previousInternalSync");
    objc_msgSend(WeakRetained, "_playWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }

}

- (int)numberActiveTracks
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__ANTrackPlayer_numberActiveTracks__block_invoke;
  block[3] = &unk_1E9390338;
  v8 = v3;
  v9 = &v10;
  block[4] = self;
  v5 = v3;
  dispatch_async(v4, block);

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LODWORD(v4) = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return (int)v4;
}

void __35__ANTrackPlayer_numberActiveTracks__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __35__ANTrackPlayer_numberActiveTracks__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "playerItems", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v15, "completed") & 1) == 0 && !objc_msgSend(v15, "trackType"))
          ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
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
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_audioSessionMediaServicesLostHandler_, *MEMORY[0x1E0C89730], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_audioSessionMediaServicesResetHandler_, *MEMORY[0x1E0C89738], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_playerItemPlayedToEndHandler_, *MEMORY[0x1E0C8AC48], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_playerItemPlayedToEndHandler_, *MEMORY[0x1E0C8AC58], 0);

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

- (void)_configureAudioSession
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D23A0000, v0, v1, "Failed to configure Audio Session. Error = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_callDelegateWithBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[ANTrackPlayer delegateQueue](self, "delegateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ANTrackPlayer delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__ANTrackPlayer__callDelegateWithBlock___block_invoke;
    v8[3] = &unk_1E938FDD8;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v6, v8);

  }
  else
  {
    -[ANTrackPlayer delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v7);

  }
}

void __40__ANTrackPlayer__callDelegateWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)_playerInfoForAVPlayerItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    -[ANTrackPlayer playerItems](self, "playerItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__ANTrackPlayer__playerInfoForAVPlayerItem___block_invoke;
    v9[3] = &unk_1E9390360;
    v10 = v4;
    objc_msgSend(v6, "na_firstObjectPassingTest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

BOOL __44__ANTrackPlayer__playerInfoForAVPlayerItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)_addObserverForPlayer:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, 0);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("rate"), 1, 0);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("timeControlStatus"), 1, 0);

}

- (void)_removeObserverForPlayer:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("status"));
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("rate"));
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("timeControlStatus"));

}

- (void)_removeItemObserverForPlayer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "removeObserver:forKeyPath:context:", self, CFSTR("status"), 0);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)_stringForTimeControlStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E9390440[a3];
}

- (id)_stringForPlayerStatus:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("Failed");
  if (a3 == 1)
    return CFSTR("Ready to Play");
  else
    return (id)v3;
}

- (id)_stringForPlayerItemStatus:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("Failed");
  if (a3 == 1)
    return CFSTR("Ready to Play");
  else
    return (id)v3;
}

- (void)_stopPlaybackAndFailWithItem:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[ANTrackPlayer _stopAndUpdatePlaybackState:](self, "_stopAndUpdatePlaybackState:", 0);
  if (v6)
  {
    -[ANTrackPlayer _playerInfoForAVPlayerItem:](self, "_playerInfoForAVPlayerItem:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "trackType");
      objc_msgSend(v10, "announcementID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
      v11 = -1;
    }

  }
  else
  {
    v12 = 0;
    v11 = -1;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__ANTrackPlayer__stopPlaybackAndFailWithItem_error___block_invoke;
  v15[3] = &unk_1E9390388;
  v15[4] = self;
  v16 = v12;
  v17 = v7;
  v18 = v11;
  v13 = v7;
  v14 = v12;
  -[ANTrackPlayer _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v15);

}

uint64_t __52__ANTrackPlayer__stopPlaybackAndFailWithItem_error___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "trackPlayer:didFinishPlayingTrackType:announcementID:error:", a1[4], a1[7], a1[5], a1[6]);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_initWeak(&location, self);
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__ANTrackPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v15[3] = &unk_1E938FCC0;
  objc_copyWeak(&v18, &location);
  v16 = v10;
  v17 = v9;
  v13 = v9;
  v14 = v10;
  dispatch_async(v12, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __64__ANTrackPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  float v4;
  float v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  id v27;
  NSObject *v28;
  char *v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  double v50;
  __int16 v51;
  double v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "queuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rate");
  v5 = v4;

  objc_msgSend(WeakRetained, "queuePlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&v7 = COERCE_DOUBLE(objc_msgSend(v6, "timeControlStatus"));

  objc_msgSend(WeakRetained, "_stringForTimeControlStatus:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "queuePlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "queuePlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reasonForWaitingToPlay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "queuePlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringForPlayerStatus:", objc_msgSend(v13, "status"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v14;
      v17 = v12;
      v18 = v10;
      v19 = v8;
      v20 = (const char *)a1[5];
      objc_msgSend(WeakRetained, "queuePlayer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414082;
      v48 = v20;
      v8 = v19;
      v10 = v18;
      v12 = v17;
      v14 = v16;
      v49 = 2048;
      v50 = v5;
      v51 = 2048;
      v52 = *(double *)&v7;
      v53 = 2112;
      v54 = v8;
      v55 = 2112;
      v56 = v10;
      v57 = 2112;
      v58 = v12;
      v59 = 2112;
      v60 = v16;
      v61 = 2112;
      v62 = v21;
      _os_log_impl(&dword_1D23A0000, v15, OS_LOG_TYPE_DEFAULT, "|> KeyPath (%@) changed                    \n    Queue Player Rate = %f                    \n    Time Control Status = (%ld) %@                    \n    Current Item = %@                    \n    Reason For Waiting To Play = %@                    \n    Player Status = %@                    \n    Error = %@", buf, 0x52u);

    }
    if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("status")))
    {
      v22 = a1[4];
      if (!v22)
        goto LABEL_37;
      objc_msgSend(WeakRetained, "queuePlayer");
      v23 = (id)objc_claimAutoreleasedReturnValue();

      if (v22 != v23)
        goto LABEL_37;
      v24 = objc_msgSend(v22, "status");
      if (v24 != 2)
      {
        if (v24 == 1)
        {
          objc_msgSend(WeakRetained, "log");
          v25 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          *(_DWORD *)buf = 136315138;
          v48 = "-[ANTrackPlayer observeValueForKeyPath:ofObject:change:context:]_block_invoke";
          v26 = "%s: Queue player is ready to play.";
          goto LABEL_20;
        }
        goto LABEL_37;
      }
      objc_msgSend(WeakRetained, "log");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        __64__ANTrackPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_1();

      objc_msgSend(v22, "error");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v40)
      {
        v42 = v40;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1055, *MEMORY[0x1E0CF7C40]);
        v42 = (id)objc_claimAutoreleasedReturnValue();
      }
      v34 = v42;

      objc_msgSend(v22, "currentItem");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_stopPlaybackAndFailWithItem:error:", v43, v34);

      goto LABEL_36;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("status")))
      {
        v27 = a1[4];
        if (v27)
        {
          v22 = v27;
          objc_msgSend(WeakRetained, "log");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(WeakRetained, "_stringForPlayerItemStatus:", objc_msgSend(v22, "status"));
            v29 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "asset");
            v30 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            objc_msgSend(v22, "duration");
            objc_msgSend(v22, "duration");
            objc_msgSend(v22, "error");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v48 = v29;
            v49 = 2112;
            v50 = v30;
            v51 = 2048;
            v52 = (double)v46 / (double)v45;
            v53 = 2112;
            v54 = v31;
            _os_log_impl(&dword_1D23A0000, v28, OS_LOG_TYPE_DEFAULT, "|> AVPlayerItem Status = %@                        \n    Asset = %@                        \n    Duration (sec) = %f                        \n    Error = %@", buf, 0x2Au);

          }
          v32 = objc_msgSend(v22, "status");
          if (v32 != 2)
          {
            if (v32 == 1)
            {
              objc_msgSend(WeakRetained, "log");
              v25 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                goto LABEL_21;
              *(_DWORD *)buf = 136315138;
              v48 = "-[ANTrackPlayer observeValueForKeyPath:ofObject:change:context:]_block_invoke";
              v26 = "%s: Player Item is ready to play.";
LABEL_20:
              _os_log_impl(&dword_1D23A0000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
LABEL_21:

              if (!objc_msgSend(WeakRetained, "playbackPending"))
                goto LABEL_37;
              objc_msgSend(WeakRetained, "handler");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v33)
                goto LABEL_37;
              objc_msgSend(WeakRetained, "handler");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "_playWithCompletionHandler:", v34);
              goto LABEL_36;
            }
LABEL_37:

            goto LABEL_38;
          }
          objc_msgSend(WeakRetained, "log");
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            __64__ANTrackPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_2();

          objc_msgSend(v22, "error");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (v36)
          {
            v38 = v36;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1053, *MEMORY[0x1E0CF7C40]);
            v38 = (id)objc_claimAutoreleasedReturnValue();
          }
          v34 = v38;

          objc_msgSend(WeakRetained, "_stopPlaybackAndFailWithItem:error:", v22, v34);
LABEL_36:

          goto LABEL_37;
        }
      }
    }
  }
LABEL_38:

}

- (void)playInternalWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)stopInternalSync
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ANTrackPlayer log](self, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ANTrackPlayer stopInternalSync]";
    _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[ANTrackPlayer queuePlayer](self, "queuePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pause");

  -[ANTrackPlayer setPlaybackPending:](self, "setPlaybackPending:", 0);
}

- (void)nextInternalSync
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ANTrackPlayer log](self, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[ANTrackPlayer nextInternalSync]";
    _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[ANTrackPlayer queuePlayer](self, "queuePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANTrackPlayer _playerInfoForAVPlayerItem:](self, "_playerInfoForAVPlayerItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "setCompleted:", 1);
  -[ANTrackPlayer queuePlayer](self, "queuePlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "advanceToNextItem");

}

- (void)previousInternalSync
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  double Seconds;
  double v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  ANTrackPlayer *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  CMTime time;
  uint8_t v37[128];
  uint8_t buf[16];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v29 = self;
  -[ANTrackPlayer log](self, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[ANTrackPlayer previousInternalSync]";
    _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[ANTrackPlayer playerItems](self, "playerItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_51);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[ANTrackPlayer queuePlayer](self, "queuePlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  -[ANTrackPlayer previousSkipGoesToPreviousTrackDelta](self, "previousSkipGoesToPreviousTrackDelta");
  if (Seconds <= v9 && v30)
  {
    -[ANTrackPlayer log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[ANTrackPlayer previousInternalSync]";
      _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "%s: Going back to previous announcement.", buf, 0xCu);
    }

    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[ANTrackPlayer playerItems](self, "playerItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (v17 == v30 || objc_msgSend(v11, "count"))
          {
            objc_msgSend(v17, "setCompleted:", 0);
            v18 = (void *)MEMORY[0x1E0C8B300];
            objc_msgSend(v17, "playerItem");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "asset");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "playerItemWithAsset:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "setPlayerItem:", v21);
            objc_msgSend(v11, "addObject:", v21);
            objc_msgSend(v21, "addObserver:forKeyPath:options:context:", v29, CFSTR("status"), 1, 0);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v14);
    }

    -[ANTrackPlayer queuePlayer](v29, "queuePlayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANTrackPlayer _removeItemObserverForPlayer:](v29, "_removeItemObserverForPlayer:", v22);

    -[ANTrackPlayer queuePlayer](v29, "queuePlayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeAllItems");

    -[ANTrackPlayer queuePlayer](v29, "queuePlayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANTrackPlayer _removeObserverForPlayer:](v29, "_removeObserverForPlayer:", v24);

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B350]), "initWithItems:", v11);
    -[ANTrackPlayer setQueuePlayer:](v29, "setQueuePlayer:", v25);
    -[ANTrackPlayer queuePlayer](v29, "queuePlayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANTrackPlayer _addObserverForPlayer:](v29, "_addObserverForPlayer:", v26);

    -[ANTrackPlayer audioSession](v29, "audioSession");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANTrackPlayer queuePlayer](v29, "queuePlayer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAudioSession:", v27);

  }
  else
  {
    -[ANTrackPlayer queuePlayer](self, "queuePlayer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __37__ANTrackPlayer_previousInternalSync__block_invoke_2;
    v35[3] = &unk_1E938FB50;
    v35[4] = self;
    *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
    v39 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    objc_msgSend(v25, "seekToTime:completionHandler:", buf, v35);
  }

}

uint64_t __37__ANTrackPlayer_previousInternalSync__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "trackType"))
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "completed");

  return v3;
}

void __37__ANTrackPlayer_previousInternalSync__block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "unsuccessful";
    if (a2)
      v4 = "successful";
    v5 = 136315394;
    v6 = "-[ANTrackPlayer previousInternalSync]_block_invoke_2";
    v7 = 2080;
    v8 = v4;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "%s: Attempt to restart announcement was %s.", (uint8_t *)&v5, 0x16u);
  }

}

- (void)_resumePlaybackAfterInterruptionAtTimeInterval:(double)a3
{
  id v5;
  double v6;
  _QWORD v7[5];

  v5 = -[ANTrackPlayer prepareToPlay](self, "prepareToPlay");
  objc_msgSend(MEMORY[0x1E0CF7E98], "machTimeToSeconds:", mach_absolute_time());
  -[ANTrackPlayer handleInterruptionDelay:](self, "handleInterruptionDelay:", v6 - a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__ANTrackPlayer__resumePlaybackAfterInterruptionAtTimeInterval___block_invoke;
  v7[3] = &unk_1E938F760;
  v7[4] = self;
  -[ANTrackPlayer _playWithCompletionHandler:](self, "_playWithCompletionHandler:", v7);
}

void __64__ANTrackPlayer__resumePlaybackAfterInterruptionAtTimeInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __64__ANTrackPlayer__resumePlaybackAfterInterruptionAtTimeInterval___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "setPlaybackState:", 0);
    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__ANTrackPlayer__resumePlaybackAfterInterruptionAtTimeInterval___block_invoke_56;
    v7[3] = &unk_1E93903D0;
    v7[4] = v6;
    v8 = v3;
    objc_msgSend(v6, "_callDelegateWithBlock:", v7);

  }
  else
  {
    objc_msgSend(v4, "setPlaybackState:", 1);
  }

}

uint64_t __64__ANTrackPlayer__resumePlaybackAfterInterruptionAtTimeInterval___block_invoke_56(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "trackPlayer:didFinishPlayingTrackType:announcementID:error:", *(_QWORD *)(a1 + 32), -1, 0, *(_QWORD *)(a1 + 40));
}

- (void)audioSessionMediaServicesLostHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];

  v4 = a3;
  -[ANTrackPlayer log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[ANTrackPlayer audioSessionMediaServicesLostHandler:].cold.1();

  if (-[ANTrackPlayer playbackState](self, "playbackState"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__ANTrackPlayer_audioSessionMediaServicesLostHandler___block_invoke;
    v6[3] = &unk_1E938F9B0;
    v6[4] = self;
    -[ANTrackPlayer stopWithCompletionHandler:](self, "stopWithCompletionHandler:", v6);
  }

}

void __54__ANTrackPlayer_audioSessionMediaServicesLostHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1024, *MEMORY[0x1E0CF7C40]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ANTrackPlayer_audioSessionMediaServicesLostHandler___block_invoke_2;
  v5[3] = &unk_1E93903D0;
  v5[4] = v3;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "_callDelegateWithBlock:", v5);

}

uint64_t __54__ANTrackPlayer_audioSessionMediaServicesLostHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "trackPlayer:didFinishPlayingTrackType:announcementID:error:", *(_QWORD *)(a1 + 32), -1, 0, *(_QWORD *)(a1 + 40));
}

- (void)audioSessionMediaServicesResetHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];

  v4 = a3;
  -[ANTrackPlayer log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[ANTrackPlayer audioSessionMediaServicesResetHandler:].cold.1();

  if (-[ANTrackPlayer playbackState](self, "playbackState"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__ANTrackPlayer_audioSessionMediaServicesResetHandler___block_invoke;
    v6[3] = &unk_1E938F9B0;
    v6[4] = self;
    -[ANTrackPlayer stopWithCompletionHandler:](self, "stopWithCompletionHandler:", v6);
  }
  else
  {
    -[ANTrackPlayer _configureAudioSession](self, "_configureAudioSession");
  }

}

void __55__ANTrackPlayer_audioSessionMediaServicesResetHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, void *);
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1025, *MEMORY[0x1E0CF7C40]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __55__ANTrackPlayer_audioSessionMediaServicesResetHandler___block_invoke_2;
  v8 = &unk_1E93903D0;
  v9 = v3;
  v10 = v2;
  v4 = v2;
  objc_msgSend(v3, "_callDelegateWithBlock:", &v5);
  objc_msgSend(*(id *)(a1 + 32), "_configureAudioSession", v5, v6, v7, v8, v9);

}

uint64_t __55__ANTrackPlayer_audioSessionMediaServicesResetHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "trackPlayer:didFinishPlayingTrackType:announcementID:error:", *(_QWORD *)(a1 + 32), -1, 0, *(_QWORD *)(a1 + 40));
}

- (void)_handleInterruptionEndedAndShouldResume:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  double v12;
  char *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  NSObject *v24;
  dispatch_time_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD block[5];
  id v33[2];
  id location;
  uint8_t buf[4];
  const char *v36;
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ANTrackPlayer interruptionTimer](self, "interruptionTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  objc_msgSend(MEMORY[0x1E0CF7E98], "machTimeToSeconds:", mach_absolute_time());
  v8 = v7;
  -[ANTrackPlayer interruptionStart](self, "interruptionStart");
  v10 = v9;
  -[ANTrackPlayer log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v8 - v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v13;
    _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "Seconds elapsed since interruption began: %@", buf, 0xCu);

  }
  if (-[ANTrackPlayer playbackState](self, "playbackState") != 2)
  {
    -[ANTrackPlayer log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[ANTrackPlayer _handleInterruptionEndedAndShouldResume:]";
      _os_log_impl(&dword_1D23A0000, v14, OS_LOG_TYPE_DEFAULT, "%s: Interruption ended but we are not interrupted, don't do anything", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if ((-[ANTrackPlayer options](self, "options") & 1) == 0)
  {
    -[ANTrackPlayer log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[ANTrackPlayer _handleInterruptionEndedAndShouldResume:]";
      _os_log_impl(&dword_1D23A0000, v14, OS_LOG_TYPE_DEFAULT, "%s: Option to resume after interruption ended not set, don't do anything", buf, 0xCu);
    }
LABEL_10:

    return;
  }
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberForDefault:", *MEMORY[0x1E0CF7BE0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  -[ANTrackPlayer log](self, "log");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v36 = *(const char **)&v18;
    _os_log_impl(&dword_1D23A0000, v19, OS_LOG_TYPE_DEFAULT, "Resume Timeout After Audio Interruption End: %f", buf, 0xCu);
  }

  if (v3 && v12 < v18)
  {
    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberForDefault:", *MEMORY[0x1E0CF7B20]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    objc_initWeak(&location, self);
    -[ANTrackPlayer log](self, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v36 = v23;
      _os_log_impl(&dword_1D23A0000, v24, OS_LOG_TYPE_DEFAULT, "Resume Audio Session Delay %f seconds", buf, 0xCu);
    }

    v25 = dispatch_time(0, (uint64_t)(*(double *)&v23 * 1000000000.0));
    -[ANTrackPlayer mainQueue](self, "mainQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__ANTrackPlayer__handleInterruptionEndedAndShouldResume___block_invoke;
    block[3] = &unk_1E93903F8;
    block[4] = self;
    v33[1] = (id)v23;
    objc_copyWeak(v33, &location);
    dispatch_after(v25, v26, block);

    objc_destroyWeak(v33);
    objc_destroyWeak(&location);
  }
  else
  {
    -[ANTrackPlayer log](self, "log");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D23A0000, v27, OS_LOG_TYPE_DEFAULT, "Will not resume playback after Audio Session Interruption ended", buf, 2u);
    }

    -[ANTrackPlayer _stopAndUpdatePlaybackState:](self, "_stopAndUpdatePlaybackState:", 0);
    objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1027, *MEMORY[0x1E0CF7C40]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __57__ANTrackPlayer__handleInterruptionEndedAndShouldResume___block_invoke_58;
    v30[3] = &unk_1E93903D0;
    v30[4] = self;
    v31 = v28;
    v29 = v28;
    -[ANTrackPlayer _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v30);

  }
}

void __57__ANTrackPlayer__handleInterruptionEndedAndShouldResume___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *WeakRetained;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "playbackState");
  objc_msgSend(*(id *)(a1 + 32), "log");
  WeakRetained = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
  if (v2 == 2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 48);
      v7 = 134217984;
      v8 = v5;
      _os_log_impl(&dword_1D23A0000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Still interrupted. Resuming playback after delaying for %f seconds", (uint8_t *)&v7, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "interruptionStart");
    -[NSObject _resumePlaybackAfterInterruptionAtTimeInterval:](WeakRetained, "_resumePlaybackAfterInterruptionAtTimeInterval:");
  }
  else if (v4)
  {
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 134217984;
    v8 = v6;
    _os_log_impl(&dword_1D23A0000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Playback state is not interrupted. Will not resume playback after delaying for %f seconds", (uint8_t *)&v7, 0xCu);
  }

}

uint64_t __57__ANTrackPlayer__handleInterruptionEndedAndShouldResume___block_invoke_58(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "trackPlayer:didFinishPlayingTrackType:announcementID:error:", *(_QWORD *)(a1 + 32), -1, 0, *(_QWORD *)(a1 + 40));
}

- (void)audioSessionInterruptionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  char *v7;
  BOOL v8;
  NSObject *v9;
  _BOOL4 v10;
  char *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  char *v19;
  NSObject *v20;
  _BOOL8 v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "object");
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[ANTrackPlayer audioSession](self, "audioSession");
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    v8 = v6 == v7;

    -[ANTrackPlayer log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_DWORD *)buf = 138412290;
        v34 = v6;
        _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "Received Audio Session Interruption Notification for Audio Session %@", buf, 0xCu);
      }

      objc_msgSend(v4, "userInfo");
      v12 = objc_claimAutoreleasedReturnValue();
      v9 = v12;
      if (v12)
      {
        -[NSObject valueForKey:](v12, "valueForKey:", *MEMORY[0x1E0C89718]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = objc_msgSend(v13, "unsignedIntegerValue");
          if (v15)
          {
            if (v15 == 1)
            {
              -[ANTrackPlayer log](self, "log");
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D23A0000, v16, OS_LOG_TYPE_DEFAULT, "Audio Session Interruption: Began", buf, 2u);
              }

              if (-[ANTrackPlayer playbackState](self, "playbackState") == 1)
              {
                objc_msgSend(MEMORY[0x1E0CF7E98], "machTimeToSeconds:", mach_absolute_time());
                -[ANTrackPlayer setInterruptionStart:](self, "setInterruptionStart:");
                -[ANTrackPlayer stopInternalSync](self, "stopInternalSync");
                if ((-[ANTrackPlayer options](self, "options") & 1) != 0)
                {
                  -[ANTrackPlayer setPlaybackState:](self, "setPlaybackState:", 2);
                  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "numberForDefault:", *MEMORY[0x1E0CF7BE0]);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "doubleValue");
                  v26 = v25;

                  objc_initWeak((id *)buf, self);
                  -[ANTrackPlayer interruptionTimer](self, "interruptionTimer");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ANTrackPlayer mainQueue](self, "mainQueue");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29[0] = MEMORY[0x1E0C809B0];
                  v29[1] = 3221225472;
                  v29[2] = __49__ANTrackPlayer_audioSessionInterruptionHandler___block_invoke_2;
                  v29[3] = &unk_1E938F960;
                  objc_copyWeak(&v30, (id *)buf);
                  v29[4] = self;
                  objc_msgSend(v27, "startWithValue:queue:handler:", v28, v29, v26);

                  objc_destroyWeak(&v30);
                  objc_destroyWeak((id *)buf);
                }
                else
                {
                  -[ANTrackPlayer setPlaybackState:](self, "setPlaybackState:", 0);
                  objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1027, *MEMORY[0x1E0CF7C40]);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v31[0] = MEMORY[0x1E0C809B0];
                  v31[1] = 3221225472;
                  v31[2] = __49__ANTrackPlayer_audioSessionInterruptionHandler___block_invoke;
                  v31[3] = &unk_1E93903D0;
                  v31[4] = self;
                  v32 = v17;
                  v18 = v17;
                  -[ANTrackPlayer _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v31);

                }
              }
              else
              {
                -[ANTrackPlayer log](self, "log");
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v34 = "-[ANTrackPlayer audioSessionInterruptionHandler:]";
                  _os_log_impl(&dword_1D23A0000, v22, OS_LOG_TYPE_DEFAULT, "%s: Interruption while not playing, don't do anything", buf, 0xCu);
                }

              }
            }
          }
          else
          {
            -[NSObject valueForKey:](v9, "valueForKey:", *MEMORY[0x1E0C89700]);
            v19 = (char *)objc_claimAutoreleasedReturnValue();
            -[ANTrackPlayer log](self, "log");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v19;
              _os_log_impl(&dword_1D23A0000, v20, OS_LOG_TYPE_DEFAULT, "Audio Session Interruption: Ended. Should Resume: %@", buf, 0xCu);
            }

            if (v19)
              v21 = objc_msgSend(v19, "unsignedIntegerValue") == 1;
            else
              v21 = 0;
            -[ANTrackPlayer _handleInterruptionEndedAndShouldResume:](self, "_handleInterruptionEndedAndShouldResume:", v21);

          }
        }

      }
    }
    else if (v10)
    {
      -[ANTrackPlayer audioSession](self, "audioSession");
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v11;
      v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "Received Audio Session Interruption Notification for different Audio Session. Expected: %@, Actual: %@", buf, 0x16u);

    }
  }
  else
  {
    -[ANTrackPlayer log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ANTonePlayer audioSessionInterruptionHandler:].cold.1();
  }

}

uint64_t __49__ANTrackPlayer_audioSessionInterruptionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "trackPlayer:didFinishPlayingTrackType:announcementID:error:", *(_QWORD *)(a1 + 32), -1, 0, *(_QWORD *)(a1 + 40));
}

void __49__ANTrackPlayer_audioSessionInterruptionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __49__ANTrackPlayer_audioSessionInterruptionHandler___block_invoke_2_cold_1(a1, v3);

  objc_msgSend(WeakRetained, "_stopAndUpdatePlaybackState:", 0);
}

- (void)playerRateChangedHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ANTrackPlayer *v9;

  v4 = a3;
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__ANTrackPlayer_playerRateChangedHandler___block_invoke;
  v7[3] = &unk_1E938F2F0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __42__ANTrackPlayer_playerRateChangedHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  double v5;
  NSObject *v6;
  float v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "queuePlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2 == v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(double *)(a1 + 32);
        v15 = 138412290;
        v16 = v5;
        _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "|> Rate Changed Notification: %@", (uint8_t *)&v15, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "rate");
        v15 = 134217984;
        v16 = v7;
        _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "|> Player Rate: %f", (uint8_t *)&v15, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AC98]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8ACA8]))
      {
        objc_msgSend(*(id *)(a1 + 40), "log");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[ANTonePlayer playerRateChangedHandler:].cold.1();

        objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1018, *MEMORY[0x1E0CF7C40]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(void **)(a1 + 40);
        objc_msgSend(v12, "queuePlayer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "currentItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_stopPlaybackAndFailWithItem:error:", v14, v11);

      }
    }
  }

}

- (void)playerItemPlayedToEndHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ANTrackPlayer mainQueue](self, "mainQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke;
  v7[3] = &unk_1E938F2F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "Player item played to end notification: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v8, "_playerInfoForAVPlayerItem:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*v2, "queuePlayer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = v12;
        v23 = 2112;
        v24 = v7;
        _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "Marking player item as completed for player %@: %@", buf, 0x16u);

      }
      -[NSObject setCompleted:](v9, "setCompleted:", 1);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C8AC58]);

      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 40), "userInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AC50]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 5004, *MEMORY[0x1E0CF7C40]);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v16 = 0;
      }
      v17 = *v2;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke_59;
      v18[3] = &unk_1E9390420;
      v18[4] = v17;
      v19 = v9;
      v20 = v16;
      v11 = v16;
      objc_msgSend(v17, "_callDelegateWithBlock:", v18);

    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke_cold_2(v2, (uint64_t)v7, v11);
    }

  }
  else
  {
    objc_msgSend(v8, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke_cold_1();
  }

}

void __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  v6 = objc_msgSend(v4, "trackType");
  objc_msgSend(*(id *)(a1 + 40), "announcementID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackPlayer:didFinishPlayingTrackType:announcementID:error:", v3, v6, v7, *(_QWORD *)(a1 + 48));

}

- (ANTrackPlayerDelegate)delegate
{
  return (ANTrackPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_delegateQueue);
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeWeak((id *)&self->_delegateQueue, a3);
}

- (unint64_t)playbackState
{
  return self->_playbackState;
}

- (AVQueuePlayer)queuePlayer
{
  return self->_queuePlayer;
}

- (void)setQueuePlayer:(id)a3
{
  objc_storeStrong((id *)&self->_queuePlayer, a3);
}

- (double)silenceBetweenEachTrack
{
  return self->_silenceBetweenEachTrack;
}

- (void)setSilenceBetweenEachTrack:(double)a3
{
  self->_silenceBetweenEachTrack = a3;
}

- (NSURL)audioFileAtStart
{
  return self->_audioFileAtStart;
}

- (void)setAudioFileAtStart:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileAtStart, a3);
}

- (double)trimStartTone
{
  return self->_trimStartTone;
}

- (void)setTrimStartTone:(double)a3
{
  self->_trimStartTone = a3;
}

- (NSURL)audioFileTransition
{
  return self->_audioFileTransition;
}

- (void)setAudioFileTransition:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileTransition, a3);
}

- (double)trimTransitionTone
{
  return self->_trimTransitionTone;
}

- (void)setTrimTransitionTone:(double)a3
{
  self->_trimTransitionTone = a3;
}

- (double)previousSkipGoesToPreviousTrackDelta
{
  return self->_previousSkipGoesToPreviousTrackDelta;
}

- (void)setPreviousSkipGoesToPreviousTrackDelta:(double)a3
{
  self->_previousSkipGoesToPreviousTrackDelta = a3;
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (NSMutableArray)playerItems
{
  return self->_playerItems;
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (OS_os_log)log
{
  return self->_log;
}

- (OS_dispatch_queue)mainQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 128, 1);
}

- (double)interruptionStart
{
  return self->_interruptionStart;
}

- (void)setInterruptionStart:(double)a3
{
  self->_interruptionStart = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (ANAudioSessionManager)audioSessionManager
{
  return self->_audioSessionManager;
}

- (BOOL)readyToPlay
{
  return self->_readyToPlay;
}

- (void)setReadyToPlay:(BOOL)a3
{
  self->_readyToPlay = a3;
}

- (ANTimer)interruptionTimer
{
  return self->_interruptionTimer;
}

- (void)setInterruptionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_interruptionTimer, a3);
}

- (ANTimer)playerTimer
{
  return self->_playerTimer;
}

- (void)setPlayerTimer:(id)a3
{
  objc_storeStrong((id *)&self->_playerTimer, a3);
}

- (BOOL)someOtherSidekickSessionAudioIsPlaying
{
  return self->_someOtherSidekickSessionAudioIsPlaying;
}

- (void)setSomeOtherSidekickSessionAudioIsPlaying:(BOOL)a3
{
  self->_someOtherSidekickSessionAudioIsPlaying = a3;
}

- (BOOL)playbackPending
{
  return self->_playbackPending;
}

- (void)setPlaybackPending:(BOOL)a3
{
  self->_playbackPending = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_playerTimer, 0);
  objc_storeStrong((id *)&self->_interruptionTimer, 0);
  objc_storeStrong((id *)&self->_audioSessionManager, 0);
  objc_storeStrong((id *)&self->_mainQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_playerItems, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_audioFileTransition, 0);
  objc_storeStrong((id *)&self->_audioFileAtStart, 0);
  objc_storeStrong((id *)&self->_queuePlayer, 0);
  objc_destroyWeak((id *)&self->_delegateQueue);
  objc_destroyWeak((id *)&self->_delegate);
}

void __44__ANTrackPlayer__playWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D23A0000, v0, v1, "Audio session activation error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleReadyToPlayWithCompletionHandler:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "queuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315394;
  v7 = "-[ANTrackPlayer _handleReadyToPlayWithCompletionHandler:]";
  v8 = 2112;
  v9 = v4;
  OUTLINED_FUNCTION_5(&dword_1D23A0000, a2, v5, "%s: Queue player error: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_5_0();
}

void __57__ANTrackPlayer__handleReadyToPlayWithCompletionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "playerTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1D23A0000, a2, v4, "Audio Player Timer Expired [%@]", v5);

  OUTLINED_FUNCTION_10();
}

void __46__ANTrackPlayer_activelyPlayingAnnouncementID__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1D23A0000, v0, v1, "Currently Playing: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __35__ANTrackPlayer_numberActiveTracks__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1D23A0000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __64__ANTrackPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1D23A0000, v0, v1, "AVPlayer Status Failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __64__ANTrackPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1D23A0000, v0, v1, "AVPlayerItem Status Failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __64__ANTrackPlayer__resumePlaybackAfterInterruptionAtTimeInterval___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D23A0000, v0, v1, "Failed to resume playback %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)audioSessionMediaServicesLostHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D23A0000, v0, v1, "Media Services Lost: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)audioSessionMediaServicesResetHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D23A0000, v0, v1, "Media Services Reset: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __49__ANTrackPlayer_audioSessionInterruptionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "interruptionTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1D23A0000, a2, v4, "Audio Session Interruption Timer Expired [%@]", v5);

  OUTLINED_FUNCTION_10();
}

void __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D23A0000, v0, v1, "Received notification for completed item, but couldn't cast to AVPlayerItem: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "queuePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v8 = 2112;
  v9 = a2;
  OUTLINED_FUNCTION_5(&dword_1D23A0000, a3, v6, "Received notification for completed item, but couldn't find record of it for player %@: %@", v7);

  OUTLINED_FUNCTION_5_0();
}

@end
