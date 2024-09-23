@implementation CSSiriAudioPlaybackService

- (CSSiriAudioPlaybackService)initWithAudioSessionController:(id)a3
{
  id v5;
  CSSiriAudioPlaybackService *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  _QWORD block[4];
  CSSiriAudioPlaybackService *v15;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CSSiriAudioPlaybackService;
  v6 = -[CSSiriAudioPlaybackService init](&v16, sel_init);
  if (v6)
  {
    CSSiriAudioServiceGetWorkloop();
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7)
      v9 = dispatch_queue_create_with_target_V2("com.apple.assistant.audio-playback-service", v8, v7);
    else
      v9 = dispatch_queue_create("com.apple.assistant.audio-playback-service", v8);
    v10 = (OS_dispatch_queue *)v9;

    queue = v6->_queue;
    v6->_queue = v10;

    objc_storeStrong((id *)&v6->_audioSessionController, a3);
    v12 = v6->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__CSSiriAudioPlaybackService_initWithAudioSessionController___block_invoke;
    block[3] = &unk_1E7C292C8;
    v15 = v6;
    dispatch_async(v12, block);

  }
  return v6;
}

- (void)startRequest:(id)a3 options:(unint64_t)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD);
  NSObject *queue;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD);
  unint64_t v24;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void (**)(_QWORD, _QWORD))v15;
  if (v12)
  {
    queue = self->_queue;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __107__CSSiriAudioPlaybackService_startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke;
    v19[3] = &unk_1E7C28860;
    v19[4] = self;
    v20 = v12;
    v24 = a4;
    v21 = v13;
    v22 = v14;
    v23 = v16;
    dispatch_async(queue, v19);

  }
  else if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:", 1407);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v16)[2](v16, v18);

  }
}

- (void)addListener:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__CSSiriAudioPlaybackService_addListener___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)removeListener:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__CSSiriAudioPlaybackService_removeListener___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)removeAllListeners
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSSiriAudioPlaybackService_removeAllListeners__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)prewarmRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  NSObject *queue;
  void *v10;
  _QWORD block[5];
  id v12;
  void (**v13)(_QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__CSSiriAudioPlaybackService_prewarmRequest_completion___block_invoke;
    block[3] = &unk_1E7C28EC8;
    block[4] = self;
    v12 = v6;
    v13 = v8;
    dispatch_async(queue, block);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:", 1407);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v10);

  }
}

- (void)startRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  -[CSSiriAudioPlaybackService startRequest:options:preparationHandler:executionHandler:finalizationHandler:](self, "startRequest:options:preparationHandler:executionHandler:finalizationHandler:", a3, a4, 0, 0, a5);
}

- (void)stopRequest:(id)a3 immediately:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__CSSiriAudioPlaybackService_stopRequest_immediately___block_invoke;
    block[3] = &unk_1E7C28888;
    block[4] = self;
    v10 = v6;
    v11 = a4;
    dispatch_async(queue, block);

  }
}

- (void)stopAllRequests:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CSSiriAudioPlaybackService_stopAllRequests_completion___block_invoke;
  block[3] = &unk_1E7C288B0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)stopAllRequestsSynchronously
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CSSiriAudioPlaybackService_stopAllRequestsSynchronously__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)_hapticEngine
{
  NSMutableDictionary *pendingHapticRequests;
  void *v4;
  void *v5;
  void *v6;

  if (-[NSMutableDictionary count](self->_pendingHapticRequests, "count"))
  {
    pendingHapticRequests = self->_pendingHapticRequests;
  }
  else
  {
    if (!-[NSMutableDictionary count](self->_activeHapticRequests, "count"))
    {
      v6 = 0;
      return v6;
    }
    pendingHapticRequests = self->_activeHapticRequests;
  }
  -[NSMutableDictionary allKeys](pendingHapticRequests, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pendingHapticRequests, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_playHapticForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[CSSiriAudioPlaybackService _hapticEngine](self, "_hapticEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_3;
    v12 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSSiriAudioPlaybackService _playHapticForRequest:]";
      v23 = 2112;
      v24 = v4;
      _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s Failed to start playing haptic for request: %@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:", 1401);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
LABEL_3:
      objc_msgSend(v4, "hapticLibraryKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(MEMORY[0x1E0C9DD08], "patternForKey:error:", v6, &v20);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v20;

      if (!v8)
      {
        v19 = 0;
        objc_msgSend(v5, "createPlayerWithPattern:error:", v7, &v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v19;
        if (v10)
        {
          v8 = v10;
        }
        else
        {
          v15 = *MEMORY[0x1E0CFE6A0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v22 = "-[CSSiriAudioPlaybackService _playHapticForRequest:]";
            _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Starting haptic playback", buf, 0xCu);
          }
          v18 = 0;
          objc_msgSend(v9, "startAtTime:error:", &v18, 0.0);
          v16 = v18;
          v8 = v16;
          if (v5 && !v16)
          {
            -[NSMutableDictionary setObject:forKey:](self->_activeHapticRequests, "setObject:forKey:", v5, v4);
            -[NSMutableDictionary removeObjectForKey:](self->_pendingHapticRequests, "removeObjectForKey:", v4);
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __52__CSSiriAudioPlaybackService__playHapticForRequest___block_invoke;
            v17[3] = &unk_1E7C288D8;
            v17[4] = self;
            objc_msgSend(v5, "notifyWhenPlayersFinished:", v17);
            goto LABEL_15;
          }
        }
LABEL_14:
        -[NSMutableDictionary removeObjectForKey:](self->_pendingHapticRequests, "removeObjectForKey:", v4);
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      v8 = (id)v13;
      v7 = 0;
    }
    v9 = 0;
    goto LABEL_14;
  }
  v11 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[CSSiriAudioPlaybackService _playHapticForRequest:]";
    _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s audio playback request can not be nil", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:", 1401);
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v8;
}

- (void)_hapticPlaybackDidCompleteForAllActiveRequests
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__CSSiriAudioPlaybackService__hapticPlaybackDidCompleteForAllActiveRequests__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_initializeAndPrewarmHapticEngineIfNeededForRequest:(id)a3
{
  id v4;
  void *v5;
  os_log_t *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  id v11;
  os_log_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CSSiriAudioPlaybackService _hapticEngine](self, "_hapticEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  v7 = *MEMORY[0x1E0CFE6A8];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSSiriAudioPlaybackService _initializeAndPrewarmHapticEngineIfNeededForRequest:]";
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s haptic engine already created, adding %@ to pendingHapticRequests", buf, 0x16u);
    }
    goto LABEL_4;
  }
  if (v8)
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[CSSiriAudioPlaybackService _initializeAndPrewarmHapticEngineIfNeededForRequest:]";
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s creating haptic engine for audio playback request", buf, 0xCu);
  }
  v9 = objc_alloc(MEMORY[0x1E0C9DCC8]);
  -[CSSiriAudioPlaybackService _audioSession](self, "_audioSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v5 = (void *)objc_msgSend(v9, "initWithAudioSession:error:", v10, &v19);
  v11 = v19;

  if (v11)
  {
    v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSSiriAudioPlaybackService _initializeAndPrewarmHapticEngineIfNeededForRequest:]";
      v22 = 2112;
      v23 = v11;
      v13 = "%s error creating haptic engine %@";
      v14 = v12;
      v15 = 22;
LABEL_15:
      _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  objc_msgSend(v5, "setPlaysHapticsOnly:", 1);
  v18 = 0;
  objc_msgSend(v5, "startAndReturnError:", &v18);
  v16 = v18;
  if (v16)
  {
    v11 = v16;
    v17 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSSiriAudioPlaybackService _initializeAndPrewarmHapticEngineIfNeededForRequest:]";
      v13 = "%s Failed to start haptic engine";
      v14 = v17;
      v15 = 12;
      goto LABEL_15;
    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_4:
  -[NSMutableDictionary setObject:forKey:](self->_pendingHapticRequests, "setObject:forKey:", v5, v4);
LABEL_13:

}

- (void)_startHapticOnlyRequest:(id)a3 options:(unint64_t)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7
{
  id v11;
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  void (**v14)(id, _QWORD);
  os_log_t *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  __int128 *p_buf;
  _QWORD v25[5];
  id v26;
  uint8_t v27[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (void (**)(_QWORD))a5;
  v13 = (void (**)(_QWORD))a6;
  v14 = (void (**)(id, _QWORD))a7;
  v15 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  v16 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CSSiriAudioPlaybackService _startHapticOnlyRequest:options:preparationHandler:exec"
                                    "utionHandler:finalizationHandler:]";
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_INFO, "%s No audio file set, but haptic playback request present", (uint8_t *)&buf, 0xCu);
  }
  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __118__CSSiriAudioPlaybackService__startHapticOnlyRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke;
  v25[3] = &unk_1E7C28900;
  v25[4] = self;
  v18 = v11;
  v26 = v18;
  -[CSSiriAudioPlaybackService _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", v25);
  if (v12)
    v12[2](v12);
  if (v13)
    v13[2](v13);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__24975;
  v34 = __Block_byref_object_dispose__24976;
  -[CSSiriAudioPlaybackService _playHapticForRequest:](self, "_playHapticForRequest:", v18);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  if (v19)
  {
    v20 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v27 = 136315394;
      v28 = "-[CSSiriAudioPlaybackService _startHapticOnlyRequest:options:preparationHandler:executionHandler:finalizationHandler:]";
      v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_INFO, "%s Failed to play haptic for playback request: %@", v27, 0x16u);
    }
  }
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __118__CSSiriAudioPlaybackService__startHapticOnlyRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_13;
  v22[3] = &unk_1E7C28928;
  v22[4] = self;
  v21 = v18;
  v23 = v21;
  p_buf = &buf;
  -[CSSiriAudioPlaybackService _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", v22);
  if (v14)
    v14[2](v14, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

  _Block_object_dispose(&buf, 8);
}

- (void)_prewarmRequest:(id)a3 completion:(id)a4
{
  id v6;
  NSMutableDictionary *reusableSessionsByRequest;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  reusableSessionsByRequest = self->_reusableSessionsByRequest;
  v8 = a4;
  -[NSMutableDictionary objectForKey:](reusableSessionsByRequest, "objectForKey:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
    {
      v18 = 136315394;
      v19 = "-[CSSiriAudioPlaybackService _prewarmRequest:completion:]";
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_INFO, "%s Reuse existing session %@ from reusable session pool.", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    -[CSSiriAudioPlaybackService _createAudioPlaybackSessionWithRequest:options:](self, "_createAudioPlaybackSessionWithRequest:options:", v6, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
    {
      v18 = 136315394;
      v19 = "-[CSSiriAudioPlaybackService _prewarmRequest:completion:]";
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s Create new session %@.", (uint8_t *)&v18, 0x16u);
    }
    v13 = self->_reusableSessionsByRequest;
    if (!v13)
    {
      v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = self->_reusableSessionsByRequest;
      self->_reusableSessionsByRequest = v14;

      v13 = self->_reusableSessionsByRequest;
    }
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v10, v6);
  }
  objc_msgSend(v6, "hapticLibraryKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    -[CSSiriAudioPlaybackService _initializeAndPrewarmHapticEngineIfNeededForRequest:](self, "_initializeAndPrewarmHapticEngineIfNeededForRequest:", v6);
  -[CSSiriAudioPlaybackService _audioSession](self, "_audioSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "prepareWithOptions:audioSession:completion:", 0, v17, v8);

}

- (void)_startRequest:(id)a3 options:(unint64_t)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  CSSiriAudioPlaybackService *v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id location;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v25 = a5;
  v23 = a6;
  v13 = a7;
  if ((a4 & 1) != 0)
  {
    -[NSMutableDictionary objectForKey:](self->_reusableSessionsByRequest, "objectForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_reusableSessionsByRequest, "removeObjectForKey:", v12);
      v15 = *MEMORY[0x1E0CFE6A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[CSSiriAudioPlaybackService _startRequest:options:preparationHandler:executionHandler:finalizationHandler:]";
        v43 = 2112;
        v44 = v14;
        _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_INFO, "%s Reuse existing session %@ from reusable session pool.", buf, 0x16u);
      }
    }
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v12, "hapticLibraryKey", v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CSSiriAudioPlaybackService _initializeAndPrewarmHapticEngineIfNeededForRequest:](self, "_initializeAndPrewarmHapticEngineIfNeededForRequest:", v12);
    objc_msgSend(v12, "itemURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {

    }
    else
    {
      objc_msgSend(v12, "itemData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 == 0;

      if (v19)
      {
        -[CSSiriAudioPlaybackService _startHapticOnlyRequest:options:preparationHandler:executionHandler:finalizationHandler:](self, "_startHapticOnlyRequest:options:preparationHandler:executionHandler:finalizationHandler:", v12, a4, v25, v24, v13);
        goto LABEL_14;
      }
    }
  }
  if (!v14)
  {
    -[CSSiriAudioPlaybackService _createAudioPlaybackSessionWithRequest:options:](self, "_createAudioPlaybackSessionWithRequest:options:", v12, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[CSSiriAudioPlaybackService _startRequest:options:preparationHandler:executionHandler:finalizationHandler:]";
      v43 = 2112;
      v44 = v14;
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_INFO, "%s Create new session %@.", buf, 0x16u);
    }
  }
  -[NSMutableDictionary setObject:forKey:](self->_activeSessionsByRequest, "setObject:forKey:", v14, v12);
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v14);
  -[CSSiriAudioPlaybackService _audioSession](self, "_audioSession");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke;
  v36[3] = &unk_1E7C28950;
  v37 = v25;
  objc_copyWeak(&v38, (id *)buf);
  objc_copyWeak(&v39, &location);
  v30[0] = v22;
  v30[1] = 3221225472;
  v30[2] = __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_3;
  v30[3] = &unk_1E7C28978;
  v33 = v24;
  objc_copyWeak(&v34, (id *)buf);
  objc_copyWeak(&v35, &location);
  v31 = v12;
  v32 = self;
  v26[0] = v22;
  v26[1] = 3221225472;
  v26[2] = __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_2_15;
  v26[3] = &unk_1E7C289A0;
  v27 = v13;
  objc_copyWeak(&v28, (id *)buf);
  objc_copyWeak(&v29, &location);
  objc_msgSend(v14, "startWithOptions:audioSession:preparationHandler:executionHandler:finalizationHandler:", 0, v21, v36, v30, v26);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
LABEL_14:

}

- (void)_handlePreparationForSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriAudioPlaybackService _handlePreparationForSession:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s session = %@", buf, 0x16u);
  }
  objc_msgSend(v4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__CSSiriAudioPlaybackService__handlePreparationForSession___block_invoke;
  v8[3] = &unk_1E7C28900;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[CSSiriAudioPlaybackService _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", v8);

}

- (void)_handleExecutionForSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriAudioPlaybackService _handleExecutionForSession:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s session = %@", buf, 0x16u);
  }
  objc_msgSend(v4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__CSSiriAudioPlaybackService__handleExecutionForSession___block_invoke;
  v8[3] = &unk_1E7C28900;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[CSSiriAudioPlaybackService _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", v8);

}

- (void)_handleFinalizationForSession:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject **v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSMutableDictionary *reusableSessionsByRequest;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (NSObject **)MEMORY[0x1E0CFE6A8];
  v9 = *MEMORY[0x1E0CFE6A8];
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "-[CSSiriAudioPlaybackService _handleFinalizationForSession:error:]";
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v7;
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s session = %@, error = %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[CSSiriAudioPlaybackService _handleFinalizationForSession:error:]";
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s session = %@", buf, 0x16u);
  }
  objc_msgSend(v6, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_activeSessionsByRequest, "removeObjectForKey:", v10);
  if (!v7 && (objc_msgSend(v6, "options") & 2) != 0)
  {
    v11 = *v8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSSiriAudioPlaybackService _handleFinalizationForSession:error:]";
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_INFO, "%s Add successfully finalized session %@ to reusable session pool.", buf, 0x16u);
    }
    reusableSessionsByRequest = self->_reusableSessionsByRequest;
    if (!reusableSessionsByRequest)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v14 = self->_reusableSessionsByRequest;
      self->_reusableSessionsByRequest = v13;

      reusableSessionsByRequest = self->_reusableSessionsByRequest;
    }
    -[NSMutableDictionary setObject:forKey:](reusableSessionsByRequest, "setObject:forKey:", v6, v10);
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__CSSiriAudioPlaybackService__handleFinalizationForSession_error___block_invoke;
  v17[3] = &unk_1E7C289C8;
  v17[4] = self;
  v18 = v10;
  v19 = v7;
  v15 = v7;
  v16 = v10;
  -[CSSiriAudioPlaybackService _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", v17);

}

- (void)_stopRequest:(id)a3 immediately:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[NSMutableDictionary objectForKey:](self->_activeSessionsByRequest, "objectForKey:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stop:completion:", v4, 0);

}

- (void)_stopAllRequests:(BOOL)a3 completion:(id)a4
{
  id v6;
  dispatch_group_t v7;
  NSMutableDictionary *activeSessionsByRequest;
  uint64_t v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  _QWORD block[4];
  id v14;
  _QWORD v15[4];
  dispatch_group_t v16;
  BOOL v17;

  v6 = a4;
  v7 = dispatch_group_create();
  activeSessionsByRequest = self->_activeSessionsByRequest;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__CSSiriAudioPlaybackService__stopAllRequests_completion___block_invoke;
  v15[3] = &unk_1E7C289F0;
  v16 = v7;
  v17 = a3;
  v10 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeSessionsByRequest, "enumerateKeysAndObjectsUsingBlock:", v15);
  queue = self->_queue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __58__CSSiriAudioPlaybackService__stopAllRequests_completion___block_invoke_3;
  block[3] = &unk_1E7C28F10;
  v14 = v6;
  v12 = v6;
  dispatch_group_notify(v10, queue, block);

}

- (void)_stopAllRequestsSynchronously
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_activeSessionsByRequest, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_19_24959);
}

- (void)_invalidate
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CFE918], "sharedObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  -[CSAudioSessionController unregisterObserver:](self->_audioSessionController, "unregisterObserver:", self);
  -[CSSiriAudioPlaybackService _stopAllRequests:completion:](self, "_stopAllRequests:completion:", 1, 0);
}

- (void)_enumerateListenersUsingBlock:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[NSHashTable setRepresentation](self->_listeners, "setRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__CSSiriAudioPlaybackService__enumerateListenersUsingBlock___block_invoke;
    v6[3] = &unk_1E7C28A58;
    v7 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  }
}

- (void)_evictAllReusableSessionsForReason:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSMutableDictionary *reusableSessionsByRequest;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableDictionary count](self->_reusableSessionsByRequest, "count");
  v6 = *MEMORY[0x1E0CFE6A8];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v9 = 136315650;
      v10 = "-[CSSiriAudioPlaybackService _evictAllReusableSessionsForReason:]";
      v11 = 2048;
      v12 = v5;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s Evict %tu sessions from reusable session pool because %@.", (uint8_t *)&v9, 0x20u);
    }
    -[NSMutableDictionary removeAllObjects](self->_reusableSessionsByRequest, "removeAllObjects");
    reusableSessionsByRequest = self->_reusableSessionsByRequest;
    self->_reusableSessionsByRequest = 0;

  }
  else if (v7)
  {
    v9 = 136315138;
    v10 = "-[CSSiriAudioPlaybackService _evictAllReusableSessionsForReason:]";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s Reusable session pool is already empty.", (uint8_t *)&v9, 0xCu);
  }

}

- (unsigned)_audioSessionID
{
  unsigned int result;

  result = self->_audioSessionID;
  if (!result)
  {
    result = -[CSAudioSessionController getAudioSessionID](self->_audioSessionController, "getAudioSessionID");
    self->_audioSessionID = result;
  }
  return result;
}

- (void)_setAudioSessionID:(unsigned int)a3
{
  AVAudioSession *audioSession;

  if (self->_audioSessionID != a3)
  {
    self->_audioSessionID = a3;
    audioSession = self->_audioSession;
    self->_audioSession = 0;

  }
}

- (id)_audioSession
{
  uint64_t v3;
  AVAudioSession *v4;
  AVAudioSession *audioSession;

  if (!self->_audioSession)
  {
    v3 = -[CSSiriAudioPlaybackService _audioSessionID](self, "_audioSessionID");
    if ((_DWORD)v3)
    {
      objc_msgSend(MEMORY[0x1E0C89AE8], "retrieveSessionWithID:", v3);
      v4 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
      audioSession = self->_audioSession;
      self->_audioSession = v4;

    }
  }
  return self->_audioSession;
}

- (id)_createAudioPlaybackSessionWithRequest:(id)a3 options:(unint64_t)a4
{
  id v6;
  CSSiriAudioPlaybackSessionImplAVPlayerBased *v7;

  v6 = a3;
  if ((a4 & 4) != 0
    || (v7 = -[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased initWithQueue:request:options:]([CSSiriAudioPlaybackSessionImplAVAudioPlayerBased alloc], "initWithQueue:request:options:", self->_queue, v6, a4)) == 0)
  {
    v7 = -[CSSiriAudioPlaybackSessionImplAVPlayerBased initWithQueue:request:options:]([CSSiriAudioPlaybackSessionImplAVPlayerBased alloc], "initWithQueue:request:options:", self->_queue, v6, a4);
  }

  return v7;
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  CSSiriAudioPlaybackService *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[CSSiriAudioPlaybackService audioSessionController:didReceiveAudioSessionInterruptionNotificationWithUserInfo:]";
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __112__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke;
  v9[3] = &unk_1E7C292A0;
  v10 = v5;
  v11 = self;
  v8 = v5;
  dispatch_async(queue, v9);

}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  _QWORD v9[6];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriAudioPlaybackService audioSessionController:didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __121__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo___block_invoke;
  v9[3] = &unk_1E7C29178;
  v9[4] = self;
  v9[5] = a2;
  dispatch_async(queue, v9);

}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  _QWORD v9[6];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriAudioPlaybackService audioSessionController:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __122__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo___block_invoke;
  v9[3] = &unk_1E7C29178;
  v9[4] = self;
  v9[5] = a2;
  dispatch_async(queue, v9);

}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerLostNotification:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  _QWORD v9[6];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriAudioPlaybackService audioSessionController:didReceiveAudioSessionOwnerLostNotification:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionOwnerLostNotification___block_invoke;
  v9[3] = &unk_1E7C29178;
  v9[4] = self;
  v9[5] = a2;
  dispatch_async(queue, v9);

}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerResetNotification:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  _QWORD v9[6];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriAudioPlaybackService audioSessionController:didReceiveAudioSessionOwnerResetNotification:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionOwnerResetNotification___block_invoke;
  v9[3] = &unk_1E7C29178;
  v9[4] = self;
  v9[5] = a2;
  dispatch_async(queue, v9);

}

- (void)memoryPressureObserver:(id)a3 didChangeFromCondition:(int64_t)a4 toCondition:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  NSObject *queue;
  _QWORD v8[8];

  if (a5 >= 2)
  {
    v8[6] = v5;
    v8[7] = v6;
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __88__CSSiriAudioPlaybackService_memoryPressureObserver_didChangeFromCondition_toCondition___block_invoke;
    v8[3] = &unk_1E7C29178;
    v8[4] = self;
    v8[5] = a2;
    dispatch_async(queue, v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeHapticRequests, 0);
  objc_storeStrong((id *)&self->_pendingHapticRequests, 0);
  objc_storeStrong((id *)&self->_audioSessionController, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_reusableSessionsByRequest, 0);
  objc_storeStrong((id *)&self->_activeSessionsByRequest, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __88__CSSiriAudioPlaybackService_memoryPressureObserver_didChangeFromCondition_toCondition___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_evictAllReusableSessionsForReason:", v2);

}

void __98__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionOwnerResetNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_setAudioSessionID:", 0);
  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_evictAllReusableSessionsForReason:", v3);

}

void __97__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionOwnerLostNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_setAudioSessionID:", 0);
  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_evictAllReusableSessionsForReason:", v3);

}

void __122__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_setAudioSessionID:", 0);
  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_evictAllReusableSessionsForReason:", v3);

}

void __121__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_setAudioSessionID:", 0);
  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_evictAllReusableSessionsForReason:", v3);

}

void __112__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD v7[4];
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0C89718]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  if (v3)
  {
    if (v3 == 1)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_24_24949);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0C89700]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __112__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke_3;
    v7[3] = &__block_descriptor_33_e69_v32__0__AFAudioPlaybackRequest_8___CSSiriAudioPlaybackSession__16_B24l;
    v8 = v5 & 1;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);
  }
}

uint64_t __112__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "handleEndInterruption:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __112__CSSiriAudioPlaybackService_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "handleBeginInterruption");
}

uint64_t __60__CSSiriAudioPlaybackService__enumerateListenersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__CSSiriAudioPlaybackService__stopAllRequestsSynchronously__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "stop:completion:", 1, 0);
}

void __58__CSSiriAudioPlaybackService__stopAllRequests_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v4 = *(NSObject **)(a1 + 32);
  v5 = a3;
  dispatch_group_enter(v4);
  v6 = *(unsigned __int8 *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CSSiriAudioPlaybackService__stopAllRequests_completion___block_invoke_2;
  v7[3] = &unk_1E7C292C8;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v5, "stop:completion:", v6, v7);

}

uint64_t __58__CSSiriAudioPlaybackService__stopAllRequests_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __58__CSSiriAudioPlaybackService__stopAllRequests_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __66__CSSiriAudioPlaybackService__handleFinalizationForSession_error___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "audioPlaybackService:didStopRequest:error:", a1[4], a1[5], a1[6]);
}

uint64_t __57__CSSiriAudioPlaybackService__handleExecutionForSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "audioPlaybackService:didStartRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __59__CSSiriAudioPlaybackService__handlePreparationForSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "audioPlaybackService:willStartRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *WeakRetained;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = v4;
  if (WeakRetained && v4)
  {
    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_2;
    v7[3] = &unk_1E7C292A0;
    v8 = WeakRetained;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

void __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  _QWORD *WeakRetained;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  _QWORD *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "hapticLibraryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "_playHapticForRequest:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = *MEMORY[0x1E0CFE6A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[CSSiriAudioPlaybackService _startRequest:options:preparationHandler:executionHandler:finalizationHandler"
              ":]_block_invoke_3";
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s Failed to play haptic for playback request: %@", buf, 0x16u);
      }
    }

  }
  if (WeakRetained && v4)
  {
    v8 = WeakRetained[1];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_14;
    v9[3] = &unk_1E7C292A0;
    v10 = WeakRetained;
    v11 = v4;
    dispatch_async(v8, v9);

  }
}

void __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_2_15(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD *WeakRetained;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  _QWORD *v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = v6;
  if (WeakRetained && v6)
  {
    v8 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_3_16;
    block[3] = &unk_1E7C291C0;
    v10 = WeakRetained;
    v11 = v7;
    v12 = v3;
    dispatch_async(v8, block);

  }
}

uint64_t __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_3_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFinalizationForSession:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleExecutionForSession:", *(_QWORD *)(a1 + 40));
}

uint64_t __108__CSSiriAudioPlaybackService__startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePreparationForSession:", *(_QWORD *)(a1 + 40));
}

uint64_t __118__CSSiriAudioPlaybackService__startHapticOnlyRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "audioPlaybackService:didStartRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __118__CSSiriAudioPlaybackService__startHapticOnlyRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke_13(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "audioPlaybackService:didStopRequest:error:", a1[4], a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __76__CSSiriAudioPlaybackService__hapticPlaybackDidCompleteForAllActiveRequests__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __52__CSSiriAudioPlaybackService__playHapticForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  dispatch_time_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (NSObject **)MEMORY[0x1E0CFE6A0];
  v5 = *MEMORY[0x1E0CFE6A0];
  if (v3 && os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[CSSiriAudioPlaybackService _playHapticForRequest:]_block_invoke";
    v13 = 2112;
    v14 = v3;
    _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Haptic playback stopped with error: %@", buf, 0x16u);
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CSSiriAudioPlaybackService _playHapticForRequest:]_block_invoke";
    _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Haptic playback stopped", buf, 0xCu);
  }
  v6 = dispatch_time(0, 1000000000);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CSSiriAudioPlaybackService__playHapticForRequest___block_invoke_9;
  block[3] = &unk_1E7C292C8;
  block[4] = v7;
  dispatch_after(v6, v8, block);

  return 1;
}

uint64_t __52__CSSiriAudioPlaybackService__playHapticForRequest___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hapticPlaybackDidCompleteForAllActiveRequests");
}

uint64_t __58__CSSiriAudioPlaybackService_stopAllRequestsSynchronously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopAllRequestsSynchronously");
}

uint64_t __57__CSSiriAudioPlaybackService_stopAllRequests_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopAllRequests:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __54__CSSiriAudioPlaybackService_stopRequest_immediately___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopRequest:immediately:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __56__CSSiriAudioPlaybackService_prewarmRequest_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prewarmRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __48__CSSiriAudioPlaybackService_removeAllListeners__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

uint64_t __45__CSSiriAudioPlaybackService_removeListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__CSSiriAudioPlaybackService_addListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __107__CSSiriAudioPlaybackService_startRequest_options_preparationHandler_executionHandler_finalizationHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startRequest:options:preparationHandler:executionHandler:finalizationHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __61__CSSiriAudioPlaybackService_initWithAudioSessionController___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v5;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 72);
  *(_QWORD *)(v9 + 72) = v8;

  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v11;

  objc_msgSend(MEMORY[0x1E0CFE918], "sharedObserver");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addListener:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "registerObserver:");
}

+ (id)sharedService
{
  if (sharedService_onceToken_24997 != -1)
    dispatch_once(&sharedService_onceToken_24997, &__block_literal_global_24998);
  return (id)sharedService_sharedService_24999;
}

void __43__CSSiriAudioPlaybackService_sharedService__block_invoke()
{
  CSSiriAudioPlaybackService *v0;
  void *v1;
  id v2;

  +[CSAudioSessionController sharedInstance](CSAudioSessionController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[CSSiriAudioPlaybackService initWithAudioSessionController:]([CSSiriAudioPlaybackService alloc], "initWithAudioSessionController:", v2);
  v1 = (void *)sharedService_sharedService_24999;
  sharedService_sharedService_24999 = (uint64_t)v0;

}

@end
