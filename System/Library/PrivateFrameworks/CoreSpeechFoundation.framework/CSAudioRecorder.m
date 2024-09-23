@implementation CSAudioRecorder

- (CSAudioRecorder)init
{
  CSAudioRecorder *v2;
  void *v3;
  uint64_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSAudioRecorder;
  v2 = -[CSAudioRecorder init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSUtils getSerialQueue:qualityOfService:](CSUtils, "getSerialQueue:qualityOfService:", v3, 33);
    v4 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (CSAudioRecorder)initWithQueue:(id)a3 error:(id *)a4
{
  id v6;
  CSAudioRecorder *v7;
  CSAudioRecorder *v8;
  void *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  void *v12;
  uint64_t v13;
  OS_dispatch_queue *voiceControllerCreationQueue;
  uint64_t v15;
  id v16;
  AVVoiceController *voiceController;
  uint64_t v18;
  CSExclaveRecordClient *exclaveAudioClient;
  uint64_t v20;
  NSHashTable *observers;
  uint64_t v22;
  NSMutableDictionary *opusDecoders;
  NSMutableSet *v24;
  NSMutableSet *remoteAccessoryStreamIdSet;
  void *v26;
  float v27;
  double v28;
  double v29;
  CSReusableBufferPoolConfiguration *v30;
  CSReusableBufferPoolConfiguration *v31;
  CSReusableBufferPool *v32;
  CSReusableBufferPool *audioBufferPool;
  uint64_t v34;
  NSMutableDictionary *hasSetAlertDictionary;
  NSObject *v36;
  CSAudioRecorder *v37;
  void *v38;
  NSObject *v39;
  CSAudioRecorder *v40;
  id v42;
  objc_super v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  CSAudioRecorder *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CSAudioRecorder;
  v7 = -[CSAudioRecorder init](&v43, sel_init);
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      -[CSAudioRecorder setQueue:](v7, "setQueue:", v6);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSUtils getSerialQueue:qualityOfService:](CSUtils, "getSerialQueue:qualityOfService:", v9, 33);
      v10 = objc_claimAutoreleasedReturnValue();
      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v10;

    }
    objc_msgSend((id)objc_opt_class(), "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSUtils getSerialQueue:qualityOfService:](CSUtils, "getSerialQueue:qualityOfService:", v12, 9);
    v13 = objc_claimAutoreleasedReturnValue();
    voiceControllerCreationQueue = v8->_voiceControllerCreationQueue;
    v8->_voiceControllerCreationQueue = (OS_dispatch_queue *)v13;

    v42 = 0;
    -[CSAudioRecorder _createVoiceControllerWithError:](v8, "_createVoiceControllerWithError:", &v42);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v42;
    voiceController = v8->_voiceController;
    v8->_voiceController = (AVVoiceController *)v15;

    if (+[CSUtils isExclaveHardware](CSUtils, "isExclaveHardware"))
    {
      +[CSExclaveRecordClient sharedClient](CSExclaveRecordClient, "sharedClient");
      v18 = objc_claimAutoreleasedReturnValue();
      exclaveAudioClient = v8->_exclaveAudioClient;
      v8->_exclaveAudioClient = (CSExclaveRecordClient *)v18;

      -[CSExclaveRecordClient setDelegate:](v8->_exclaveAudioClient, "setDelegate:", v8);
    }
    if (v8->_voiceController && !v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v20 = objc_claimAutoreleasedReturnValue();
      observers = v8->_observers;
      v8->_observers = (NSHashTable *)v20;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v22 = objc_claimAutoreleasedReturnValue();
      opusDecoders = v8->_opusDecoders;
      v8->_opusDecoders = (NSMutableDictionary *)v22;

      v8->_audioFilePathIndex = 0;
      v8->_waitingForDidStart = 0;
      v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      remoteAccessoryStreamIdSet = v8->_remoteAccessoryStreamIdSet;
      v8->_remoteAccessoryStreamIdSet = v24;

      +[CSUserSessionActiveMonitor sharedInstance](CSUserSessionActiveMonitor, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObserver:", v8);

      if (CSIsHorseman_onceToken != -1)
        dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
      if (CSIsHorseman_isHorseman)
      {
        +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
        v28 = (float)(v27
                    * (float)+[CSConfig inputRecordingSampleByteDepth](CSConfig, "inputRecordingSampleByteDepth"));
        +[CSConfig inputRecordingBufferDuration](CSConfig, "inputRecordingBufferDuration");
        v30 = -[CSReusableBufferPoolConfiguration initWithBackingStoreCapacity:minimalNumberOfBackingStores:maximumNumberOfBackingStores:backingStoreIdleTimeout:]([CSReusableBufferPoolConfiguration alloc], "initWithBackingStoreCapacity:minimalNumberOfBackingStores:maximumNumberOfBackingStores:backingStoreIdleTimeout:", (unint64_t)(v29* v28* (double)+[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels")), 4, 32, 10.0);
        if (v30)
        {
          v31 = v30;
          v32 = -[CSReusableBufferPool initWithConfiguration:]([CSReusableBufferPool alloc], "initWithConfiguration:", v30);
          audioBufferPool = v8->_audioBufferPool;
          v8->_audioBufferPool = v32;

        }
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v34 = objc_claimAutoreleasedReturnValue();
      hasSetAlertDictionary = v8->_hasSetAlertDictionary;
      v8->_hasSetAlertDictionary = (NSMutableDictionary *)v34;

      v36 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "-[CSAudioRecorder initWithQueue:error:]";
        v46 = 2050;
        v47 = v8;
        _os_log_impl(&dword_1B502E000, v36, OS_LOG_TYPE_DEFAULT, "%s Create new CSAudioRecorder = %{public}p", buf, 0x16u);
      }
      goto LABEL_16;
    }
    v38 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v39 = v38;
      objc_msgSend(v16, "localizedDescription");
      v40 = (CSAudioRecorder *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v45 = "-[CSAudioRecorder initWithQueue:error:]";
      v46 = 2114;
      v47 = v40;
      _os_log_error_impl(&dword_1B502E000, v39, OS_LOG_TYPE_ERROR, "%s Failed to create AVVC : %{public}@", buf, 0x16u);

      if (a4)
        goto LABEL_21;
    }
    else if (a4)
    {
LABEL_21:
      v16 = objc_retainAutorelease(v16);
      v37 = 0;
      *a4 = v16;
      goto LABEL_24;
    }
    v37 = 0;
    goto LABEL_24;
  }
LABEL_16:
  if (a4)
    *a4 = 0;
  v37 = v8;
  v16 = 0;
LABEL_24:

  return v37;
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CSAudioRecorder_registerObserver___block_invoke;
  v7[3] = &unk_1E6880E88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__CSAudioRecorder_unregisterObserver___block_invoke;
  v7[3] = &unk_1E6880E88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setAudioSessionEventDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CSAudioRecorder_setAudioSessionEventDelegate___block_invoke;
  v7[3] = &unk_1E6880E88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)userSessionActivateMonitor:(id)a3 didReceivedUserSessionActiveHasChanged:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[5];

  if (!a4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__CSAudioRecorder_userSessionActivateMonitor_didReceivedUserSessionActiveHasChanged___block_invoke;
    block[3] = &unk_1E6881138;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)willDestroy
{
  NSObject *v3;
  uint64_t v4;
  NSObject *queue;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CSAudioRecorder willDestroy]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v4 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CSAudioRecorder_willDestroy__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async_and_wait(queue, block);
  if (self->_waitingForDidStart)
  {
    v6 = self->_queue;
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __30__CSAudioRecorder_willDestroy__block_invoke_2;
    v9[3] = &unk_1E6881138;
    v9[4] = self;
    dispatch_async(v6, v9);
  }
  v7 = self->_queue;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __30__CSAudioRecorder_willDestroy__block_invoke_3;
  v8[3] = &unk_1E6881138;
  v8[4] = self;
  dispatch_async(v7, v8);
}

- (void)dealloc
{
  AudioBufferList *pNonInterleavedABL;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  CSAudioRecorder *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CSAudioRecorder _destroyVoiceController](self, "_destroyVoiceController");
  pNonInterleavedABL = self->_pNonInterleavedABL;
  if (pNonInterleavedABL)
    free(pNonInterleavedABL);
  v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSAudioRecorder dealloc]";
    v8 = 2050;
    v9 = self;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioRecorder %{public}p deallocated", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSAudioRecorder;
  -[CSAudioRecorder dealloc](&v5, sel_dealloc);
}

- (void)_destroyVoiceController
{
  AVVoiceController *voiceController;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  AVVoiceController *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  voiceController = self->_voiceController;
  if (voiceController)
  {
    v4 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSAudioRecorder _destroyVoiceController]";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
      voiceController = self->_voiceController;
    }
    v11 = 0;
    -[AVVoiceController teardownWithError:](voiceController, "teardownWithError:", &v11);
    v5 = v11;
    if (v5)
    {
      v6 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v9 = v6;
        objc_msgSend(v5, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v13 = "-[CSAudioRecorder _destroyVoiceController]";
        v14 = 2114;
        v15 = v10;
        _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, "%s Failed to teardown AVVC : %{public}@", buf, 0x16u);

      }
    }
    v7 = (void *)MEMORY[0x1B5E46720]();
    v8 = self->_voiceController;
    self->_voiceController = 0;

    objc_autoreleasePoolPop(v7);
  }
  -[NSMutableDictionary removeAllObjects](self->_hasSetAlertDictionary, "removeAllObjects");
}

- (id)_createVoiceControllerWithError:(id *)a3
{
  AVVoiceController *voiceController;
  uint64_t v6;
  NSObject *voiceControllerCreationQueue;
  NSObject *queue;
  NSObject *v9;
  AVVoiceController *v10;
  AVVoiceController *v11;
  _QWORD v13[6];
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  AVVoiceController *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1733;
  v19 = __Block_byref_object_dispose__1734;
  v20 = 0;
  voiceController = self->_voiceController;
  if (!voiceController)
  {
    -[CSAudioRecorder clearListeningMicIndicatorProperty](self, "clearListeningMicIndicatorProperty");
    kdebug_trace();
    if (CSIsHorseman_onceToken != -1)
      dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
    v6 = MEMORY[0x1E0C809B0];
    if (CSIsHorseman_isHorseman)
    {
      voiceControllerCreationQueue = self->_voiceControllerCreationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__CSAudioRecorder__createVoiceControllerWithError___block_invoke;
      block[3] = &unk_1E6880D18;
      block[4] = self;
      block[5] = &v15;
      dispatch_sync(voiceControllerCreationQueue, block);
    }
    queue = self->_queue;
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __51__CSAudioRecorder__createVoiceControllerWithError___block_invoke_2;
    v13[3] = &unk_1E6880D18;
    v13[4] = self;
    v13[5] = &v15;
    dispatch_async_and_wait(queue, v13);
    if (a3)
      *a3 = objc_retainAutorelease((id)v16[5]);
    v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_voiceController;
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSAudioRecorder _createVoiceControllerWithError:]";
      v23 = 2050;
      v24 = v10;
      _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Successfully create AVVC : %{public}p", buf, 0x16u);
    }
    voiceController = self->_voiceController;
  }
  v11 = voiceController;
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (id)_getVoiceController
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1733;
  v10 = __Block_byref_object_dispose__1734;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__CSAudioRecorder__getVoiceController__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setAnnounceCallsEnabled:(BOOL)a3 withStreamHandleID:(unint64_t)a4
{
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v5 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[CSAudioRecorder setAnnounceCallsEnabled:withStreamHandleID:]";
    v11 = 1024;
    v12 = v5;
    v13 = 2048;
    v14 = a4;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Setting announced call flag to: %d with stream handle Id: %lu", (uint8_t *)&v9, 0x1Cu);
  }
  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAnnounceCallsEnabledForStream:enable:", a4, v5);

}

- (void)setContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t, uint64_t);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *queue;
  id v13;
  NSObject *v14;
  CSAudioFileReader *audioFileReader;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD block[5];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, uint64_t))a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__1733;
  v39 = __Block_byref_object_dispose__1734;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avvcContextSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)CSLogCategoryAudio;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v42 = "-[CSAudioRecorder setContext:completion:]";
    v43 = 2112;
    v44 = v11;
    _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setContext : %@", buf, 0x16u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CSAudioRecorder_setContext_completion___block_invoke;
  block[3] = &unk_1E687E528;
  v24 = &v31;
  block[4] = self;
  v13 = v9;
  v23 = v13;
  v25 = &v27;
  v26 = &v35;
  dispatch_async_and_wait(queue, block);
  if (!v32[3])
  {
    v14 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v36[5], "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v42 = "-[CSAudioRecorder setContext:completion:]";
      v43 = 2114;
      v44 = v21;
      _os_log_error_impl(&dword_1B502E000, v14, OS_LOG_TYPE_ERROR, "%s Failed to get handle id : %{public}@", buf, 0x16u);

    }
  }
  audioFileReader = self->_audioFileReader;
  self->_audioFileReader = 0;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)CSLogCategoryAudio;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v16, "timeIntervalSinceDate:", v8);
    v18 = v32[3];
    v19 = v28[3];
    *(_DWORD *)buf = 136315906;
    v42 = "-[CSAudioRecorder setContext:completion:]";
    v43 = 2050;
    v44 = v20;
    v45 = 2050;
    v46 = v18;
    v47 = 2050;
    v48 = v19;
    _os_log_impl(&dword_1B502E000, v17, OS_LOG_TYPE_DEFAULT, "%s setContext elapsed time = %{public}lf, streamHandleId = %{public}lu, streamType = %{public}lu", buf, 0x2Au);
  }

  if (v7)
    v7[2](v7, v32[3], v28[3], v36[5]);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

}

- (BOOL)setCurrentContext:(id)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  CSAudioFileReader *audioFileReader;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "type") == 5 && objc_msgSend(v8, "isRequestDuringActiveCall"))
  {
    v10 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[CSAudioRecorder setCurrentContext:streamHandleId:error:]";
      _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Will skip setting current record context because we were in active call and context was post or auto", buf, 0xCu);
    }
    v11 = 1;
  }
  else
  {
    objc_msgSend(v8, "avvcContextSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v12, "debugDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v29 = "-[CSAudioRecorder setCurrentContext:streamHandleId:error:]";
      v30 = 2114;
      v31 = (uint64_t)v15;
      _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setContextForStream : %{public}@", buf, 0x16u);

    }
    audioFileReader = self->_audioFileReader;
    self->_audioFileReader = 0;

    if (objc_msgSend(v12, "activationMode") == 1886352244 || objc_msgSend(v12, "activationMode") == 1635087471)
    {
      -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v11 = objc_msgSend(v17, "setContextForStream:forStream:error:", v12, a4, &v27);
      v18 = v27;

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        objc_msgSend(v19, "timeIntervalSinceDate:", v9);
        *(_DWORD *)buf = 136315394;
        v29 = "-[CSAudioRecorder setCurrentContext:streamHandleId:error:]";
        v30 = 2050;
        v31 = v22;
        _os_log_impl(&dword_1B502E000, v21, OS_LOG_TYPE_DEFAULT, "%s setCurrentContext elapsed time = %{public}lf", buf, 0x16u);

      }
      if (a5)
        *a5 = objc_retainAutorelease(v18);

    }
    else
    {
      v23 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        v25 = objc_msgSend(v12, "activationMode");
        *(_DWORD *)buf = 136315394;
        v29 = "-[CSAudioRecorder setCurrentContext:streamHandleId:error:]";
        v30 = 2048;
        v31 = v25;
        _os_log_impl(&dword_1B502E000, v24, OS_LOG_TYPE_DEFAULT, "%s Tried to setCurrentContext with mode %ld. This method can only be used for auto and post", buf, 0x16u);

      }
      v11 = 1;
    }

  }
  return v11;
}

- (BOOL)prepareAudioStreamRecord:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void **p_cache;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99D68];
  v10 = a3;
  objc_msgSend(v9, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAudioRecorder _getRecordSettingsWithRequest:](self, "_getRecordSettingsWithRequest:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  kdebug_trace();
  v13 = 0;
  if (objc_msgSend(v8, "shouldUseRemoteRecorder"))
  {
    objc_msgSend(v8, "deviceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioRecorder _fetchRemoteRecordClientWithDeviceId:streamHandleId:](self, "_fetchRemoteRecordClientWithDeviceId:streamHandleId:", v14, objc_msgSend(v8, "streamHandleId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v43 = 0;
      v16 = objc_msgSend(v15, "waitingForConnection:error:", &v43, 3.0);
      v17 = v43;

      v13 = v17;
      if ((v16 & 1) != 0)
        goto LABEL_4;
    }
    else
    {
      v32 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v39 = v32;
        objc_msgSend(v8, "deviceId");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315395;
        v45 = "-[CSAudioRecorder prepareAudioStreamRecord:recordDeviceIndicator:error:]";
        v46 = 2113;
        v47 = (uint64_t)v40;
        _os_log_error_impl(&dword_1B502E000, v39, OS_LOG_TYPE_ERROR, "%s Remote device with device id: %{private}@ not found", buf, 0x16u);

      }
      if (objc_msgSend(v8, "streamHandleId") == 1)
        v33 = 305;
      else
        v33 = 307;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), v33, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v34 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v35 = v34;
      objc_msgSend(v17, "localizedDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v45 = "-[CSAudioRecorder prepareAudioStreamRecord:recordDeviceIndicator:error:]";
      v46 = 2114;
      v47 = (uint64_t)v36;
      _os_log_error_impl(&dword_1B502E000, v35, OS_LOG_TYPE_ERROR, "%s Failed to prepare remote device : %{public}@", buf, 0x16u);

      if (a5)
        goto LABEL_23;
    }
    else if (a5)
    {
LABEL_23:
      v17 = objc_retainAutorelease(v17);
      v25 = 0;
      *a5 = v17;
      goto LABEL_26;
    }
    v25 = 0;
    goto LABEL_26;
  }
LABEL_4:
  v18 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    v20 = objc_msgSend(v8, "streamHandleId");
    *(_DWORD *)buf = 136315650;
    v45 = "-[CSAudioRecorder prepareAudioStreamRecord:recordDeviceIndicator:error:]";
    v46 = 2050;
    v47 = v20;
    v48 = 2114;
    v49 = v12;
    _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC prepareRecordForStream(%{public}llu) : %{public}@", buf, 0x20u);

  }
  v21 = objc_alloc(MEMORY[0x1E0C89BE8]);
  v22 = objc_msgSend(v8, "streamHandleId");
  +[CSConfig inputRecordingBufferDuration](CSConfig, "inputRecordingBufferDuration");
  v23 = (void *)objc_msgSend(v21, "initWithStreamID:settings:bufferDuration:", v22, v12);
  objc_msgSend(v23, "setMeteringEnabled:", 1);
  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v13;
  v25 = objc_msgSend(v24, "prepareRecordForStream:error:", v23, &v42);
  v17 = v42;

  if ((v25 & 1) != 0)
  {
    -[CSAudioRecorder _trackRemoteAccessoryStreamIdIfNeeded:](self, "_trackRemoteAccessoryStreamIdIfNeeded:", v8);
    p_cache = (void **)(CSUtils + 16);
    if (!a5)
      goto LABEL_12;
    goto LABEL_11;
  }
  p_cache = CSUtils.cache;
  v27 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    v38 = v27;
    objc_msgSend(v17, "localizedDescription");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v45 = "-[CSAudioRecorder prepareAudioStreamRecord:recordDeviceIndicator:error:]";
    v46 = 2114;
    v47 = (uint64_t)v41;
    _os_log_error_impl(&dword_1B502E000, v38, OS_LOG_TYPE_ERROR, "%s AVVC prepareRecordForStream failed : %{public}@", buf, 0x16u);

    if (!a5)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (a5)
LABEL_11:
    *a5 = objc_retainAutorelease(v17);
LABEL_12:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = p_cache[204];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = v29;
    objc_msgSend(v28, "timeIntervalSinceDate:", v11);
    *(_DWORD *)buf = 136315394;
    v45 = "-[CSAudioRecorder prepareAudioStreamRecord:recordDeviceIndicator:error:]";
    v46 = 2050;
    v47 = v31;
    _os_log_impl(&dword_1B502E000, v30, OS_LOG_TYPE_DEFAULT, "%s prepareRecordForStream elapsed time = %{public}lf", buf, 0x16u);

  }
  -[CSAudioRecorder _logResourceNotAvailableErrorIfNeeded:](self, "_logResourceNotAvailableErrorIfNeeded:", v17);

LABEL_26:
  return v25;
}

- (BOOL)_shouldInjectAudio
{
  void *v2;
  char v3;

  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "audioInjectionEnabled");

  return v3;
}

- (BOOL)_startAudioStreamForAudioInjectionWithAVVCContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unint64_t audioFilePathIndex;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  CSAudioFileReader *v21;
  void *v22;
  CSAudioFileReader *v23;
  CSAudioFileReader *audioFileReader;
  CSAudioFileReader *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  unint64_t v31;
  NSObject *v32;
  int v33;
  int v34;
  const char *v35;
  __int16 v36;
  _WORD v37[17];

  *(_QWORD *)&v37[13] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CSAudioRecorder _shouldInjectAudio](self, "_shouldInjectAudio"))
  {
    v5 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 136315138;
      v35 = "-[CSAudioRecorder _startAudioStreamForAudioInjectionWithAVVCContext:]";
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s ::: CSAudioRecord will inject audio file instead of recording", (uint8_t *)&v34, 0xCu);
    }
    if (-[CSAudioRecorder _needResetAudioInjectionIndex:](self, "_needResetAudioInjectionIndex:", v4))
    {
      v6 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        v34 = 136315138;
        v35 = "-[CSAudioRecorder _startAudioStreamForAudioInjectionWithAVVCContext:]";
        _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Resetting AudioFilePathIndex", (uint8_t *)&v34, 0xCu);
      }
      self->_audioFilePathIndex = 0;
    }
    else
    {
      v8 = self->_audioFilePathIndex + 1;
      self->_audioFilePathIndex = v8;
      v9 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        v34 = 136315394;
        v35 = "-[CSAudioRecorder _startAudioStreamForAudioInjectionWithAVVCContext:]";
        v36 = 1024;
        *(_DWORD *)v37 = v8;
        _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Increase AudioFilePathIndex = %d", (uint8_t *)&v34, 0x12u);
      }
    }
    +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "audioInjectionFilePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    audioFilePathIndex = self->_audioFilePathIndex;
    if (audioFilePathIndex >= objc_msgSend(v11, "count"))
    {
      v14 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v31 = self->_audioFilePathIndex;
        v32 = v14;
        v33 = objc_msgSend(v11, "count");
        v34 = 136315650;
        v35 = "-[CSAudioRecorder _startAudioStreamForAudioInjectionWithAVVCContext:]";
        v36 = 1024;
        *(_DWORD *)v37 = v31;
        v37[2] = 1024;
        *(_DWORD *)&v37[3] = v33;
        _os_log_error_impl(&dword_1B502E000, v32, OS_LOG_TYPE_ERROR, "%s AudioFilePathIndex is out-of-boundary _audioFilePathIndex:%d injectAudioFilePaths:%d", (uint8_t *)&v34, 0x18u);

      }
      v13 = objc_msgSend(v11, "count") - 1;
      self->_audioFilePathIndex = v13;
    }
    else
    {
      v13 = self->_audioFilePathIndex;
    }
    v15 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v11, "objectAtIndex:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 136315650;
      v35 = "-[CSAudioRecorder _startAudioStreamForAudioInjectionWithAVVCContext:]";
      v36 = 1024;
      *(_DWORD *)v37 = v13;
      v37[2] = 2112;
      *(_QWORD *)&v37[3] = v17;
      _os_log_impl(&dword_1B502E000, v16, OS_LOG_TYPE_DEFAULT, "%s AudioFilePathIndex:%d accessing:%@", (uint8_t *)&v34, 0x1Cu);

      v13 = self->_audioFilePathIndex;
    }
    objc_msgSend(v11, "objectAtIndex:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "fileExistsAtPath:", v18),
          v19,
          (v20 & 1) != 0))
    {
      v21 = [CSAudioFileReader alloc];
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[CSAudioFileReader initWithURL:](v21, "initWithURL:", v22);
      audioFileReader = self->_audioFileReader;
      self->_audioFileReader = v23;

      -[CSAudioFileReader setDelegate:](self->_audioFileReader, "setDelegate:", self);
      v25 = self->_audioFileReader;
      +[CSConfig inputRecordingBufferDuration](CSConfig, "inputRecordingBufferDuration");
      -[CSAudioFileReader setRecordBufferDuration:](v25, "setRecordBufferDuration:");
      +[CSAudioStreamRequest requestForLpcmRecordSettingsWithContext:](CSAudioStreamRequest, "requestForLpcmRecordSettingsWithContext:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSAudioRecorder _getRecordSettingsWithRequest:](self, "_getRecordSettingsWithRequest:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[CSAudioFileReader prepareRecording:](self->_audioFileReader, "prepareRecording:", v27);

      if (v28)
      {
        v7 = -[CSAudioFileReader startRecording](self->_audioFileReader, "startRecording");
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      v29 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v34 = 136315394;
        v35 = "-[CSAudioRecorder _startAudioStreamForAudioInjectionWithAVVCContext:]";
        v36 = 2112;
        *(_QWORD *)v37 = v18;
        _os_log_error_impl(&dword_1B502E000, v29, OS_LOG_TYPE_ERROR, "%s Unable to find injectAudioFilePath = %@", (uint8_t *)&v34, 0x16u);
      }
    }
    v7 = 0;
    goto LABEL_25;
  }
  v7 = 0;
LABEL_26:

  return v7;
}

- (BOOL)startAudioStreamWithOption:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void **p_cache;
  NSObject *v27;
  id *v28;
  id v29;
  CSRemoteRecordClient *remoteRecordClient;
  void *v31;
  BOOL v32;
  id v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void **v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  id v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  void **v54;
  void *v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  const __CFString *v72;
  void *v73;
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "avvcContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "shouldUseRemoteRecorder"))
  {
    objc_msgSend(v9, "recordContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "type");

    if ((-[CSRemoteRecordClient hasPendingTwoShotBeep](self->_remoteRecordClient, "hasPendingTwoShotBeep")
       || -[CSAudioRecorder _hasLocalPendingTwoShot](self, "_hasLocalPendingTwoShot"))
      && v14 != 27
      || objc_msgSend(v8, "startAlertBehavior") == 2)
    {
      -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "playAlertSoundForType:overrideMode:", 1, -1);

    }
    v16 = v12;
    v17 = v16;
    if (+[CSUtils isRecordContextVoiceTrigger:](CSUtils, "isRecordContextVoiceTrigger:", v16))
    {
      if (v14 == 27)
        +[CSAudioRecordContext contextForHomeButton](CSAudioRecordContext, "contextForHomeButton");
      else
        +[CSAudioRecordContext contextForBuiltInVoiceTrigger](CSAudioRecordContext, "contextForBuiltInVoiceTrigger");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "avvcContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v67 = v12;
    p_cache = CSUtils.cache;
    v27 = CSLogCategoryAudio;
    if (v17)
    {
      v28 = a5;
      v29 = v8;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
        v76 = 2114;
        v77 = v17;
        v78 = 2114;
        v79 = v16;
        _os_log_impl(&dword_1B502E000, v27, OS_LOG_TYPE_DEFAULT, "%s Asking startRecording to remote device with context : %{public}@ (original context : %{public}@)", buf, 0x20u);
      }
      remoteRecordClient = self->_remoteRecordClient;
      v72 = CFSTR("context");
      v73 = v17;
      v18 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1, v67);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 0;
      v32 = -[CSRemoteRecordClient startRecordingWithOptions:error:](remoteRecordClient, "startRecordingWithOptions:error:", v31, &v71);
      v33 = v71;

      if (v32)
      {
        self->_waitingForDidStart = 1;
        v8 = v29;
        a5 = v28;
        p_cache = (void **)(CSUtils + 16);
        if (!a5)
          goto LABEL_32;
        goto LABEL_31;
      }
      v8 = v29;
      a5 = v28;
      p_cache = CSUtils.cache;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
        _os_log_error_impl(&dword_1B502E000, v27, OS_LOG_TYPE_ERROR, "%s Failed to fetch valid context", buf, 0xCu);
      }
      v33 = 0;
    }
    v34 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v61 = v34;
      objc_msgSend(v33, "localizedDescription");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
      v76 = 2114;
      v77 = v62;
      _os_log_error_impl(&dword_1B502E000, v61, OS_LOG_TYPE_ERROR, "%s Failed to startRecording : %{public}@", buf, 0x16u);

    }
    v18 = 0;
    if (!a5)
      goto LABEL_32;
LABEL_31:
    *a5 = objc_retainAutorelease(v33);
LABEL_32:
    objc_msgSend(MEMORY[0x1E0C99D68], "date", v67);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = p_cache[204];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v36;
      objc_msgSend(v35, "timeIntervalSinceDate:", v10);
      *(_DWORD *)buf = 136315394;
      v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
      v76 = 2050;
      v77 = v38;
      _os_log_impl(&dword_1B502E000, v37, OS_LOG_TYPE_DEFAULT, "%s startRecordingWithOptions elapsed time = %{public}lf", buf, 0x16u);

    }
LABEL_55:
    v12 = v68;
    goto LABEL_56;
  }
  if (!-[CSAudioRecorder _shouldInjectAudio](self, "_shouldInjectAudio"))
  {
    mach_absolute_time();
    kdebug_trace();
    v19 = objc_msgSend(v9, "streamHandleId");
    if (v8)
    {
      +[CSCarKitUtils sharedInstance](CSCarKitUtils, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isCarPlayConnected");

      if (v21)
      {
        +[CSCarKitUtils sharedInstance](CSCarKitUtils, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "potentiallyAddHWLatencyToOption:streamHandle:voiceController:", v8, v19, v23);
        v24 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v24;
      }
    }
    else
    {
      +[CSAudioStartStreamOption noAlertOption](CSAudioStartStreamOption, "noAlertOption");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v39 = objc_msgSend(v9, "streamHandleId", v12);
    v40 = (void **)(CSUtils + 16);
    v41 = v8;
    if (v39 == *MEMORY[0x1E0C899D0] && +[CSUtils isExclaveHardware](CSUtils, "isExclaveHardware"))
    {
      objc_msgSend(MEMORY[0x1E0C89AF0], "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x1E0CB37E8];
      +[CSConfig inputRecordingDurationInSecs](CSConfig, "inputRecordingDurationInSecs");
      objc_msgSend(v43, "numberWithFloat:");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 0;
      v45 = objc_msgSend(v42, "setMXSessionProperty:value:error:", CFSTR("PreferredMinimumMicrophoneIndicatorLightOnTime"), v44, &v70);
      v46 = v70;

      v40 = CSUtils.cache;
      v47 = CSLogCategoryAudio;
      if ((v45 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
          _os_log_impl(&dword_1B502E000, v47, OS_LOG_TYPE_DEFAULT, "%s success", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v65 = v47;
        objc_msgSend(v46, "localizedDescription");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
        v76 = 2112;
        v77 = v66;
        _os_log_error_impl(&dword_1B502E000, v65, OS_LOG_TYPE_ERROR, "%s Failed to set preferred mic indicator light time : %@", buf, 0x16u);

        v40 = (void **)(CSUtils + 16);
      }
      -[CSExclaveRecordClient startAudioStream](self->_exclaveAudioClient, "startAudioStream");

      v8 = v41;
    }
    objc_msgSend(v8, "avvcStartRecordSettingsWithAudioStreamHandleId:", v19);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v40[204];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = v49;
      objc_msgSend(v48, "debugDescription");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
      v76 = 2114;
      v77 = v51;
      _os_log_impl(&dword_1B502E000, v50, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC startRecordForStream : %{public}@", buf, 0x16u);

    }
    -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0;
    v18 = objc_msgSend(v52, "startRecordForStream:error:", v48, &v69);
    v53 = v69;

    if ((v18 & 1) != 0)
    {
      self->_waitingForDidStart = 1;
    }
    else
    {
      v54 = CSUtils.cache;
      v55 = (void *)CSLogCategoryAudio;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
        goto LABEL_50;
      v63 = v55;
      objc_msgSend(v53, "localizedDescription");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
      v76 = 2114;
      v77 = v64;
      _os_log_error_impl(&dword_1B502E000, v63, OS_LOG_TYPE_ERROR, "%s startRecordForStream failed : %{public}@", buf, 0x16u);

    }
    v54 = (void **)(CSUtils + 16);
LABEL_50:
    if (a5)
      *a5 = objc_retainAutorelease(v53);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v54[204];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = v57;
      objc_msgSend(v56, "timeIntervalSinceDate:", v10);
      *(_DWORD *)buf = 136315394;
      v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
      v76 = 2050;
      v77 = v59;
      _os_log_impl(&dword_1B502E000, v58, OS_LOG_TYPE_DEFAULT, "%s startRecordForStream elapsed time = %{public}lf", buf, 0x16u);

    }
    -[CSAudioRecorder _logResourceNotAvailableErrorIfNeeded:](self, "_logResourceNotAvailableErrorIfNeeded:", v53);

    v8 = v41;
    goto LABEL_55;
  }
  v18 = -[CSAudioRecorder _startAudioStreamForAudioInjectionWithAVVCContext:](self, "_startAudioStreamForAudioInjectionWithAVVCContext:", v12);
LABEL_56:

  return v18;
}

- (BOOL)stopAudioStreamWithRecordDeviceIndicator:(id)a3 error:(id *)a4
{
  id v6;
  CSAudioFileReader *audioFileReader;
  char v8;
  void *v9;
  CSRemoteRecordClient *remoteRecordClient;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  audioFileReader = self->_audioFileReader;
  if (!audioFileReader)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "shouldUseRemoteRecorder"))
    {
      remoteRecordClient = self->_remoteRecordClient;
      v30 = 0;
      v8 = -[CSRemoteRecordClient stopRecording:](remoteRecordClient, "stopRecording:", &v30);
      v11 = v30;
      if ((v8 & 1) == 0
        && (v12 = (void *)CSLogCategoryAudio, os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR)))
      {
        v25 = v12;
        objc_msgSend(v11, "localizedDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v32 = "-[CSAudioRecorder stopAudioStreamWithRecordDeviceIndicator:error:]";
        v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1B502E000, v25, OS_LOG_TYPE_ERROR, "%s Failed to stopRecording to remoteRecordClient : %{public}@", buf, 0x16u);

        if (!a4)
        {
LABEL_8:
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
          {
            v15 = v14;
            objc_msgSend(v13, "timeIntervalSinceDate:", v9);
            *(_DWORD *)buf = 136315394;
            v32 = "-[CSAudioRecorder stopAudioStreamWithRecordDeviceIndicator:error:]";
            v33 = 2050;
            v34 = v16;
            v17 = "%s stopRecording elapsed time = %{public}lf";
LABEL_21:
            _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);

            goto LABEL_22;
          }
          goto LABEL_22;
        }
      }
      else if (!a4)
      {
        goto LABEL_8;
      }
      *a4 = objc_retainAutorelease(v11);
      goto LABEL_8;
    }
    v18 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[CSAudioRecorder stopAudioStreamWithRecordDeviceIndicator:error:]";
      _os_log_impl(&dword_1B502E000, v18, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC stopRecordForStream", buf, 0xCu);
    }
    v19 = objc_msgSend(v6, "streamHandleId");
    if (v19 == *MEMORY[0x1E0C899D0] && +[CSUtils isExclaveHardware](CSUtils, "isExclaveHardware"))
      -[CSExclaveRecordClient stopAudioStream](self->_exclaveAudioClient, "stopAudioStream");
    -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v8 = objc_msgSend(v20, "stopRecordForStream:error:", objc_msgSend(v6, "streamHandleId"), &v29);
    v11 = v29;

    if ((v8 & 1) == 0
      && (v21 = (void *)CSLogCategoryAudio, os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR)))
    {
      v27 = v21;
      objc_msgSend(v11, "localizedDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v32 = "-[CSAudioRecorder stopAudioStreamWithRecordDeviceIndicator:error:]";
      v33 = 2114;
      v34 = v28;
      _os_log_error_impl(&dword_1B502E000, v27, OS_LOG_TYPE_ERROR, "%s Failed to stopRecordForStream : %{public}@", buf, 0x16u);

      if (!a4)
      {
LABEL_19:
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          v15 = v22;
          objc_msgSend(v13, "timeIntervalSinceDate:", v9);
          *(_DWORD *)buf = 136315394;
          v32 = "-[CSAudioRecorder stopAudioStreamWithRecordDeviceIndicator:error:]";
          v33 = 2050;
          v34 = v23;
          v17 = "%s stopRecordForStream elapsed time = %{public}lf";
          goto LABEL_21;
        }
LABEL_22:
        self->_waitingForDidStart = 0;

        goto LABEL_23;
      }
    }
    else if (!a4)
    {
      goto LABEL_19;
    }
    *a4 = objc_retainAutorelease(v11);
    goto LABEL_19;
  }
  -[CSAudioFileReader stopRecording](audioFileReader, "stopRecording");
  v8 = 1;
LABEL_23:

  return v8;
}

- (BOOL)startDeliverSecureAudioStreamWithRecordDeviceIndicator:(id)a3 error:(id *)a4
{
  uint64_t v5;
  _BOOL4 v6;

  v5 = objc_msgSend(a3, "streamHandleId");
  if (v5 == *MEMORY[0x1E0C899D0])
  {
    v6 = +[CSUtils isExclaveHardware](CSUtils, "isExclaveHardware");
    if (v6)
    {
      -[CSExclaveRecordClient startAudioStream](self->_exclaveAudioClient, "startAudioStream");
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)fetchSecureAudioStreamWithRecordDeviceIndicator:(id)a3 from:(unint64_t)a4 numSamples:(unint64_t)a5 hostTime:(unint64_t)a6 error:(id *)a7
{
  -[CSExclaveRecordClient requestHistoricalAudioBufferFor:startSample:numSamples:hostTime:](self->_exclaveAudioClient, "requestHistoricalAudioBufferFor:startSample:numSamples:hostTime:", objc_msgSend(a3, "streamHandleId"), a4, a5, a6);
  return 1;
}

- (BOOL)stopDeliverSecureAudioStreamWithRecordDeviceIndicator:(id)a3 from:(unint64_t)a4 error:(id *)a5
{
  uint64_t v6;
  _BOOL4 v7;

  v6 = objc_msgSend(a3, "streamHandleId");
  if (v6 == *MEMORY[0x1E0C899D0])
  {
    v7 = +[CSUtils isExclaveHardware](CSUtils, "isExclaveHardware");
    if (v7)
    {
      -[CSExclaveRecordClient stopAudioStream](self->_exclaveAudioClient, "stopAudioStream");
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)isSessionCurrentlyActivated
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getCurrentSessionState");

  v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[CSAudioRecorder isSessionCurrentlyActivated]";
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Session State = %d", (uint8_t *)&v8, 0x12u);
    v4 = CSLogCategoryAudio;
  }
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == 6)
  {
    if (v5)
    {
      v8 = 136315138;
      v9 = "-[CSAudioRecorder isSessionCurrentlyActivated]";
      v6 = "%s AudioSessionState = YES";
LABEL_8:
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    v8 = 136315138;
    v9 = "-[CSAudioRecorder isSessionCurrentlyActivated]";
    v6 = "%s AudioSessionState = NO";
    goto LABEL_8;
  }
  return v3 == 6;
}

- (BOOL)isRecordingWithRecordDeviceIndicator:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  if (objc_msgSend(v4, "shouldUseRemoteRecorder"))
  {
    v5 = -[CSRemoteRecordClient isRecording](self->_remoteRecordClient, "isRecording");
  }
  else
  {
    -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "getCurrentStreamState:", objc_msgSend(v4, "streamHandleId"));

    v5 = v7 > 3;
  }

  return v5;
}

- (id)recordRouteWithRecordDeviceIndicator:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "shouldUseRemoteRecorder")
    && -[CSRemoteRecordClient isRemoteDeviceGibraltar](self->_remoteRecordClient, "isRemoteDeviceGibraltar"))
  {
LABEL_7:
    v5 = CFSTR("Builtin Microphone");
    goto LABEL_9;
  }
  if (!objc_msgSend(v4, "shouldUseRemoteRecorder")
    || !-[CSRemoteRecordClient isRemoteDeviceDarwin](self->_remoteRecordClient, "isRemoteDeviceDarwin"))
  {
    if (!+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    {
      -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getRecordDeviceInfoForStream:", objc_msgSend(v4, "streamHandleId"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "recordRoute");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v5 = (__CFString *)(id)*MEMORY[0x1E0C89828];
LABEL_9:

  return v5;
}

- (id)recordDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4
{
  id v6;
  CSFAudioRecordDeviceInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  CSFAudioRecordDeviceInfo *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  CSFAudioRecordDeviceInfo *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getRecordDeviceInfoForStream:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      objc_msgSend(v11, "timeIntervalSinceDate:", v8);
      *(_DWORD *)buf = 136315394;
      v25 = "-[CSAudioRecorder recordDeviceInfoWithStreamHandleId:recordDeviceIndicator:]";
      v26 = 2050;
      v27 = v14;
      _os_log_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEFAULT, "%s fetch recordDeviceInfo elapsed time = %{public}lf", buf, 0x16u);

    }
    if (v10)
      v15 = -[CSFAudioRecordDeviceInfo initWithAVVCRecordDeviceInfo:]([CSFAudioRecordDeviceInfo alloc], "initWithAVVCRecordDeviceInfo:", v10);
    else
      v15 = 0;
    if (objc_msgSend(v6, "shouldUseRemoteRecorder")
      && -[CSRemoteRecordClient isRemoteDeviceDarwin](self->_remoteRecordClient, "isRemoteDeviceDarwin"))
    {
      v23 = [CSFAudioRecordDeviceInfo alloc];
      v22 = *MEMORY[0x1E0C89828];
      v16 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[CSRemoteRecordClient deviceId](self->_remoteRecordClient, "deviceId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithUUIDString:", v17);
      -[CSFAudioRecordDeviceInfo remoteDeviceProductIdentifier](v15, "remoteDeviceProductIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSFAudioRecordDeviceInfo remoteDeviceUIDString](v15, "remoteDeviceUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CSFAudioRecordDeviceInfo initWithRoute:isRemoteDevice:remoteDeviceUID:remoteDeviceProductIdentifier:remoteDeviceUIDString:](v23, "initWithRoute:isRemoteDevice:remoteDeviceUID:remoteDeviceProductIdentifier:remoteDeviceUIDString:", v22, 1, v18, v19, v20);

    }
    else
    {
      v7 = v15;
    }

  }
  return v7;
}

- (id)audioDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  CSFAudioDeviceInfo *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[CSAudioRecorder recordDeviceInfoWithStreamHandleId:recordDeviceIndicator:](self, "recordDeviceInfoWithStreamHandleId:recordDeviceIndicator:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAudioRecorder getPlaybackRouteForStreamID:](self, "getPlaybackRouteForStreamID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C897C8]) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C897D8]))
  {
    v26 = v8;
    objc_msgSend(MEMORY[0x1E0C89AF0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentRoute");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "outputs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v18 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v17), "endpointType");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v19);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v15);
    }

    v8 = v26;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    objc_msgSend(v20, "timeIntervalSinceDate:", v8);
    *(_DWORD *)buf = 136315394;
    v32 = "-[CSAudioRecorder audioDeviceInfoWithStreamHandleId:recordDeviceIndicator:]";
    v33 = 2050;
    v34 = v23;
    _os_log_impl(&dword_1B502E000, v22, OS_LOG_TYPE_DEFAULT, "%s fetch EndpointDeviceType elapsed time = %{public}lf", buf, 0x16u);

  }
  v24 = -[CSFAudioDeviceInfo initWithRecordDeviceInfo:playbackRoute:playbackDeviceTypeList:]([CSFAudioDeviceInfo alloc], "initWithRecordDeviceInfo:playbackRoute:playbackDeviceTypeList:", v6, v7, v9);

  return v24;
}

- (float)recordingSampleRateWithStreamHandleId:(unint64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  float v14;
  uint64_t v15;
  int v17;
  const char *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[CSAudioRecorder recordSettingsWithStreamHandleId:](self, "recordSettingsWithStreamHandleId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (v5 = *MEMORY[0x1E0C89978],
        objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C89978]),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    v10 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "-[CSAudioRecorder recordingSampleRateWithStreamHandleId:]";
      v19 = 2050;
      v20 = v9;
      v11 = "%s AVVC sampling rate = %{public}f";
      v12 = v10;
      v13 = 22;
LABEL_7:
      _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
    }
  }
  else
  {
    +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
    v9 = v14;
    v15 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315138;
      v18 = "-[CSAudioRecorder recordingSampleRateWithStreamHandleId:]";
      v11 = "%s AVVC doesn't return sampleRate, assume it is default sample rate";
      v12 = v15;
      v13 = 12;
      goto LABEL_7;
    }
  }

  return v9;
}

- (id)recordSettingsWithStreamHandleId:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getRecordSettingsForStream:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isNarrowBandWithStreamHandleId:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  int v12;
  const char *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v5 = CSLogCategoryAudio;
    LOBYTE(v6) = 0;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[CSAudioRecorder isNarrowBandWithStreamHandleId:]";
      v14 = 2050;
      v15 = a3;
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s (darwinOS) : isNarrowBand = NO for streamHandleId = %{public}lu", (uint8_t *)&v12, 0x16u);
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getRecordDeviceInfoForStream:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v8, "isUpsamplingSourceAudio");
    v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("NO");
      v13 = "-[CSAudioRecorder isNarrowBandWithStreamHandleId:]";
      v12 = 136315650;
      if (v6)
        v10 = CFSTR("YES");
      v14 = 2114;
      v15 = (unint64_t)v10;
      v16 = 2050;
      v17 = a3;
      _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s isNarrowBand = %{public}@ for streamHandleId = %{public}lu", (uint8_t *)&v12, 0x20u);
    }

  }
  return v6;
}

- (BOOL)prewarmAudioSessionWithStreamHandleId:(unint64_t)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSAudioRecorder prewarmAudioSessionWithStreamHandleId:error:]";
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setSessionActive for Prewarm", buf, 0xCu);
  }
  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = objc_msgSend(v8, "activateAudioSessionForStream:isPrewarm:error:", a3, 1, &v15);
  v10 = v15;

  if ((v9 & 1) == 0)
  {
    v11 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v13 = v11;
      objc_msgSend(v10, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v17 = "-[CSAudioRecorder prewarmAudioSessionWithStreamHandleId:error:]";
      v18 = 2114;
      v19 = v14;
      _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, "%s Prewarm AudioSession has failed : %{public}@", buf, 0x16u);

    }
  }
  kdebug_trace();
  if (a4)
    *a4 = objc_retainAutorelease(v10);

  return v9;
}

- (BOOL)_shouldLogResourceNotAvailableError
{
  if (_shouldLogResourceNotAvailableError_onceToken != -1)
    dispatch_once(&_shouldLogResourceNotAvailableError_onceToken, &__block_literal_global_1721);
  return _shouldLogResourceNotAvailableError_answer;
}

- (void)_logResourceNotAvailableErrorIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB2F90]))
    {
LABEL_6:

      v5 = v9;
      goto LABEL_7;
    }
    v7 = objc_msgSend(v9, "code");

    v5 = v9;
    if (v7 == 561145203)
    {
      v8 = -[CSAudioRecorder _shouldLogResourceNotAvailableError](self, "_shouldLogResourceNotAvailableError");
      v5 = v9;
      if (v8)
      {
        +[CSDiagnosticReporter sharedInstance](CSDiagnosticReporter, "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "submitAudioIssueReport:", CFSTR("resourceNotAvailable"));
        goto LABEL_6;
      }
    }
  }
LABEL_7:

}

- (BOOL)setRecordMode:(int64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    -[CSAudioRecorder _recordModeString:](self, "_recordModeString:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v29 = "-[CSAudioRecorder setRecordMode:streamHandleId:error:]";
    v30 = 2114;
    v31 = v12;
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setRecordMode to mode : %{public}@", buf, 0x16u);

  }
  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v14 = objc_msgSend(v13, "setRecordModeForStream:recordMode:error:", a4, a3, &v27);
  v15 = v27;

  if ((v14 & 1) != 0)
  {
    v16 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[CSAudioRecorder setRecordMode:streamHandleId:error:]";
      _os_log_impl(&dword_1B502E000, v16, OS_LOG_TYPE_DEFAULT, "%s AVVC successfully setRecordMode", buf, 0xCu);
      if (!a5)
        goto LABEL_14;
LABEL_13:
      *a5 = objc_retainAutorelease(v15);
      goto LABEL_14;
    }
LABEL_12:
    if (!a5)
      goto LABEL_14;
    goto LABEL_13;
  }
  objc_msgSend(v15, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB2F90]))
  {
    v18 = objc_msgSend(v15, "code");

    if (v18 == -11780)
      goto LABEL_12;
  }
  else
  {

  }
  v19 = (void *)CSLogCategoryAudio;
  if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    goto LABEL_12;
  v25 = v19;
  objc_msgSend(v15, "localizedDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136315394;
  v29 = "-[CSAudioRecorder setRecordMode:streamHandleId:error:]";
  v30 = 2114;
  v31 = v26;
  _os_log_error_impl(&dword_1B502E000, v25, OS_LOG_TYPE_ERROR, "%s AVVC setRecordMode has failed : %{public}@", buf, 0x16u);

  if (a5)
    goto LABEL_13;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    objc_msgSend(v20, "timeIntervalSinceDate:", v9);
    *(_DWORD *)buf = 136315394;
    v29 = "-[CSAudioRecorder setRecordMode:streamHandleId:error:]";
    v30 = 2050;
    v31 = v23;
    _os_log_impl(&dword_1B502E000, v22, OS_LOG_TYPE_DEFAULT, "%s setRecordMode elapsed time = %{public}lf", buf, 0x16u);

  }
  return v14;
}

- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  unint64_t v24;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[CSAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
    v32 = 2050;
    v33 = a4;
    _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setSessionActivate for activation with streamId(%{public}lu)", buf, 0x16u);
  }
  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a3 == 2)
  {
    v29 = 0;
    v13 = objc_msgSend(v11, "activateAudioSessionForStream:isPrewarm:recordMode:error:", a4, 0, 1, &v29);
    v14 = v29;
  }
  else
  {
    v28 = 0;
    v13 = objc_msgSend(v11, "activateAudioSessionForStream:isPrewarm:recordMode:error:", a4, 0, 0, &v28);
    v14 = v28;
  }
  v15 = v14;

  if ((v13 & 1) != 0)
  {
    v16 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[CSAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
      _os_log_impl(&dword_1B502E000, v16, OS_LOG_TYPE_DEFAULT, "%s AVVC successfully activated audioSession", buf, 0xCu);
    }
    v17 = 1;
    if (!a5)
      goto LABEL_19;
LABEL_18:
    *a5 = objc_retainAutorelease(v15);
    goto LABEL_19;
  }
  objc_msgSend(v15, "domain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB2F90]))
  {
    v19 = objc_msgSend(v15, "code");

    if (v19 != 561017449)
      goto LABEL_15;
    +[CSDiagnosticReporter sharedInstance](CSDiagnosticReporter, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "submitAudioIssueReport:", CFSTR("InsufficientPriority"));
  }

LABEL_15:
  v20 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    v26 = v20;
    objc_msgSend(v15, "localizedDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v31 = "-[CSAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
    v32 = 2114;
    v33 = (unint64_t)v27;
    _os_log_error_impl(&dword_1B502E000, v26, OS_LOG_TYPE_ERROR, "%s AVVC setSessionActivate has failed : %{public}@", buf, 0x16u);

  }
  v17 = 0;
  if (a5)
    goto LABEL_18;
LABEL_19:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    objc_msgSend(v21, "timeIntervalSinceDate:", v9);
    *(_DWORD *)buf = 136315394;
    v31 = "-[CSAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
    v32 = 2050;
    v33 = v24;
    _os_log_impl(&dword_1B502E000, v23, OS_LOG_TYPE_DEFAULT, "%s setSessionActivate elapsed time = %{public}lf", buf, 0x16u);

  }
  -[CSAudioRecorder _logResourceNotAvailableErrorIfNeeded:](self, "_logResourceNotAvailableErrorIfNeeded:", v15);

  return v17;
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  int v14;
  const char *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[CSAudioRecorder deactivateAudioSession:error:]";
    v16 = 2050;
    v17 = a3;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setSessionActivate for deactivation : %{public}tu", (uint8_t *)&v14, 0x16u);
  }
  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deactivateAudioSessionWithOptions:", +[CSAudioRecorder _convertDeactivateOption:](CSAudioRecorder, "_convertDeactivateOption:", a3));

  self->_waitingForDidStart = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v9, "timeIntervalSinceDate:", v6);
    v14 = 136315394;
    v15 = "-[CSAudioRecorder deactivateAudioSession:error:]";
    v16 = 2050;
    v17 = v12;
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s setSessionActivate elapsed time = %{public}lf", (uint8_t *)&v14, 0x16u);

  }
  return 1;
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v17;
  const char *v18;
  __int16 v19;
  _WORD v20[17];

  *(_QWORD *)&v20[13] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315650;
    v18 = "-[CSAudioRecorder deactivateAudioSession:streamHandleId:error:]";
    v19 = 1024;
    *(_DWORD *)v20 = a4;
    v20[2] = 2050;
    *(_QWORD *)&v20[3] = a3;
    _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setSessionActivate for deactivation for stream %d: %{public}tu", (uint8_t *)&v17, 0x1Cu);
  }
  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deactivateAudioSessionForStream:withOptions:error:", a4, +[CSAudioRecorder _convertDeactivateOption:](CSAudioRecorder, "_convertDeactivateOption:", a3), a5);

  self->_waitingForDidStart = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    objc_msgSend(v12, "timeIntervalSinceDate:", v9);
    v17 = 136315394;
    v18 = "-[CSAudioRecorder deactivateAudioSession:streamHandleId:error:]";
    v19 = 2050;
    *(_QWORD *)v20 = v15;
    _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s setSessionActivate elapsed time = %{public}lf", (uint8_t *)&v17, 0x16u);

  }
  return 1;
}

- (void)enableSmartRoutingConsiderationForStream:(unint64_t)a3 enable:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = CSLogCategoryAudio;
  v8 = os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v8)
      goto LABEL_7;
    *(_DWORD *)buf = 136315138;
    v23 = "-[CSAudioRecorder enableSmartRoutingConsiderationForStream:enable:]";
    v9 = "%s Calling AVVC : Enable Smart Routing Consideration";
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    *(_DWORD *)buf = 136315138;
    v23 = "-[CSAudioRecorder enableSmartRoutingConsiderationForStream:enable:]";
    v9 = "%s Calling AVVC : Disable Smart Routing Consideration";
  }
  _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v12 = objc_msgSend(v11, "enableSmartRoutingConsiderationForStream:enable:error:", a3, v4, &v21);
  v13 = v21;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v14, "timeIntervalSinceDate:", v10);
    *(_DWORD *)buf = 136315394;
    v23 = "-[CSAudioRecorder enableSmartRoutingConsiderationForStream:enable:]";
    v24 = 2050;
    v25 = v17;
    _os_log_impl(&dword_1B502E000, v16, OS_LOG_TYPE_DEFAULT, "%s enableSmartRoutingConsiderationForStream elapsed time = %{public}lf", buf, 0x16u);

  }
  if ((v12 & 1) == 0)
  {
    v18 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      objc_msgSend(v13, "localizedDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v23 = "-[CSAudioRecorder enableSmartRoutingConsiderationForStream:enable:]";
      v24 = 2114;
      v25 = v20;
      _os_log_error_impl(&dword_1B502E000, v19, OS_LOG_TYPE_ERROR, "%s Fail to setSmartRoutingConsideration : %{public}@", buf, 0x16u);

    }
  }

}

- (void)setDuckMixWithOthersForStream:(unint64_t)a3 duckOthers:(BOOL)a4 duckToLevelInDB:(id)a5 mixWithOthers:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v6 = a6;
  v7 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = (objc_class *)MEMORY[0x1E0C89BD8];
  v11 = a5;
  v12 = objc_alloc_init(v10);
  v13 = objc_alloc(MEMORY[0x1E0C89BD0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithDuckOthers:duckToLevel:mixWithOthers:", v14, v11, v15);

  if (v11)
    objc_msgSend(v16, "setIsBlur:", 1);
  objc_msgSend(v12, "setDuckOverride:", v16);
  v17 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[CSAudioRecorder setDuckMixWithOthersForStream:duckOthers:duckToLevelInDB:mixWithOthers:]";
    v32 = 1024;
    LODWORD(v33) = a3;
    _os_log_impl(&dword_1B502E000, v17, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setDuckOthersForStream(%d) for DuckOthers/MixWithOthers", buf, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v20 = objc_msgSend(v19, "setDuckOthersForStream:withSettings:error:", a3, v12, &v29);
  v21 = v29;

  if ((v20 & 1) == 0)
  {
    v22 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v27 = v22;
      objc_msgSend(v21, "localizedDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v31 = "-[CSAudioRecorder setDuckMixWithOthersForStream:duckOthers:duckToLevelInDB:mixWithOthers:]";
      v32 = 2114;
      v33 = v28;
      _os_log_error_impl(&dword_1B502E000, v27, OS_LOG_TYPE_ERROR, "%s Failed to setDuckOthersForStream : %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    objc_msgSend(v23, "timeIntervalSinceDate:", v18);
    *(_DWORD *)buf = 136315394;
    v31 = "-[CSAudioRecorder setDuckMixWithOthersForStream:duckOthers:duckToLevelInDB:mixWithOthers:]";
    v32 = 2050;
    v33 = v26;
    _os_log_impl(&dword_1B502E000, v25, OS_LOG_TYPE_DEFAULT, "%s setDuckOthersForStream elapsed time = %{public}lf", buf, 0x16u);

  }
}

- (BOOL)setEnableInterruptionByRecordingClientsForStream:(unint64_t)a3 enable:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  _WORD v24[9];

  v4 = a4;
  *(_QWORD *)&v24[5] = *MEMORY[0x1E0C80C00];
  v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[CSAudioRecorder setEnableInterruptionByRecordingClientsForStream:enable:]";
    v23 = 1024;
    *(_DWORD *)v24 = a3;
    v24[2] = 1024;
    *(_DWORD *)&v24[3] = v4;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setEnableInterruptionByRecordingClientsForStream(%d) for enable(%d)", buf, 0x18u);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v10 = objc_msgSend(v9, "setEnableInterruptionByRecordingClientsForStream:enable:error:", a3, v4, &v20);
  v11 = v20;
  if (v4 && (v10 & 1) == 0)
  {
    v12 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v18 = v12;
      objc_msgSend(v11, "localizedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSAudioRecorder setEnableInterruptionByRecordingClientsForStream:enable:]";
      v23 = 2114;
      *(_QWORD *)v24 = v19;
      _os_log_error_impl(&dword_1B502E000, v18, OS_LOG_TYPE_ERROR, "%s Failed to setEnableInterruptionByRecordingClientsForStream : %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v13, "timeIntervalSinceDate:", v8);
    *(_DWORD *)buf = 136315394;
    v22 = "-[CSAudioRecorder setEnableInterruptionByRecordingClientsForStream:enable:]";
    v23 = 2050;
    *(_QWORD *)v24 = v16;
    _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, "%s setEnableInterruptionByRecordingClientsForStream elapsed time = %{public}lf", buf, 0x16u);

  }
  return v10;
}

- (void)enableMiniDucking:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (!CSIsHorseman_isHorseman)
  {
    v6 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("Disable");
      if (v3)
        v7 = CFSTR("Enable");
      v13 = 136315394;
      v14 = "-[CSAudioRecorder enableMiniDucking:]";
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@ miniDucking now", (uint8_t *)&v13, 0x16u);
    }
    -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enableMiniDucking:", v3);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v9, "timeIntervalSinceDate:", v5);
    v13 = 136315394;
    v14 = "-[CSAudioRecorder enableMiniDucking:]";
    v15 = 2050;
    v16 = v12;
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s enableMiniDucking elapsed time = %{public}lf", (uint8_t *)&v13, 0x16u);

  }
}

- (void)configureAlertBehavior:(id)a3 audioStreamHandleId:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[CSAudioRecorder configureAlertBehavior:audioStreamHandleId:]";
    v29 = 2114;
    v30 = v6;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89BB0]), "initWithStreamID:", a4);
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E68A1768);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E68A1768);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartAlert:", objc_msgSend(v11, "integerValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E68A1780);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E68A1780);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStopAlert:", objc_msgSend(v13, "integerValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E68A1798);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E68A1798);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStopOnErrorAlert:", objc_msgSend(v15, "integerValue"));

  }
  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v17 = objc_msgSend(v16, "configureAlertBehaviorForStream:error:", v9, &v26);
  v18 = v26;

  if ((v17 & 1) == 0)
  {
    v19 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v24 = v19;
      objc_msgSend(v18, "localizedDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v28 = "-[CSAudioRecorder configureAlertBehavior:audioStreamHandleId:]";
      v29 = 2114;
      v30 = v25;
      _os_log_error_impl(&dword_1B502E000, v24, OS_LOG_TYPE_ERROR, "%s Failed to configureAlertBehaviorForStream : %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    objc_msgSend(v20, "timeIntervalSinceDate:", v7);
    *(_DWORD *)buf = 136315394;
    v28 = "-[CSAudioRecorder configureAlertBehavior:audioStreamHandleId:]";
    v29 = 2050;
    v30 = v23;
    _os_log_impl(&dword_1B502E000, v22, OS_LOG_TYPE_DEFAULT, "%s configureAlertBehavior elapsed time = %{public}lf", buf, 0x16u);

  }
}

- (id)getPlaybackRouteForStreamID:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getPlaybackRouteForStream:withError:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "shouldUseRemoteRecorder") & 1) != 0)
  {
    objc_msgSend(v4, "deviceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioRecorder _fetchRemoteRecordClientWithDeviceId:streamHandleId:](self, "_fetchRemoteRecordClientWithDeviceId:streamHandleId:", v5, objc_msgSend(v4, "streamHandleId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "waitingForConnection:error:", 0, 3.0);
    objc_msgSend(v6, "voiceTriggerEventInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioRecorder _updateLanguageCodeForRemoteVTEIResult:](self, "_updateLanguageCodeForRemoteVTEIResult:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_9;
  }
  else
  {
    v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      v12 = 136315138;
      v13 = "-[CSAudioRecorder fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:]";
      _os_log_fault_impl(&dword_1B502E000, v9, OS_LOG_TYPE_FAULT, "%s Not using remoteRecorder. Deprecated use of voiceTriggerInfo from AVVC", (uint8_t *)&v12, 0xCu);
    }
  }
  v10 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    v12 = 136315138;
    v13 = "-[CSAudioRecorder fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:]";
    _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s VoiceTriggerInfo is nil from AVVC", (uint8_t *)&v12, 0xCu);
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (BOOL)isDuckingSupportedOnCurrentRouteWithStreamHandleID:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v14 = 0;
    v8 = objc_msgSend(v6, "isDuckingSupportedOnPickedRouteForStream:error:", a3, &v14);
    v9 = v14;
    v10 = v9;
    if (v9)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v9);
    }
    else
    {
      v11 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        v12 = CFSTR("is not");
        v16 = "-[CSAudioRecorder isDuckingSupportedOnCurrentRouteWithStreamHandleID:error:]";
        *(_DWORD *)buf = 136315650;
        if (v8)
          v12 = CFSTR("is");
        v17 = 2114;
        v18 = v12;
        v19 = 2050;
        v20 = a3;
        _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s Ducking %{public}@ supported on current route with streamId: %{public}ld", buf, 0x20u);
      }
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_updateLanguageCodeForRemoteVTEIResult:(id)a3
{
  return (id)objc_msgSend(a3, "mutableCopy");
}

- (BOOL)_shouldUseRemoteBuiltInMic:(id)a3
{
  void *v3;
  char v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("useRemoteBuiltInMic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)setListeningMicIndicatorProperty
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C89AF0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = objc_msgSend(v2, "setMXSessionProperty:value:error:", CFSTR("MicrophoneAttribution"), MEMORY[0x1E0C9AAB0], &v9);
  v4 = v9;

  v5 = CSLogCategoryAudio;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CSAudioRecorder setListeningMicIndicatorProperty]";
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s success", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    v7 = v5;
    objc_msgSend(v4, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAudioRecorder setListeningMicIndicatorProperty]";
    v12 = 2112;
    v13 = v8;
    _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Failed to set listening mic indicator lock property : %@", buf, 0x16u);

  }
  return v3;
}

- (BOOL)clearListeningMicIndicatorProperty
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C89AF0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = objc_msgSend(v2, "setMXSessionProperty:value:error:", CFSTR("MicrophoneAttribution"), MEMORY[0x1E0C9AAA0], &v9);
  v4 = v9;

  v5 = CSLogCategoryAudio;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CSAudioRecorder clearListeningMicIndicatorProperty]";
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s success", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    v7 = v5;
    objc_msgSend(v4, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAudioRecorder clearListeningMicIndicatorProperty]";
    v12 = 2112;
    v13 = v8;
    _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Failed to clear listening mic indicator lock property : %@", buf, 0x16u);

  }
  return v3;
}

- (void)_processAudioChain:(id)a3 audioStreamHandleId:(unint64_t)a4 remoteVAD:(id)a5 atTime:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7 numberOfChannels:(int)a8
{
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int v25;

  v14 = a3;
  v15 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __124__CSAudioRecorder__processAudioChain_audioStreamHandleId_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke;
  block[3] = &unk_1E687E570;
  block[4] = self;
  v20 = v14;
  v21 = v15;
  v22 = a4;
  v23 = a6;
  v24 = a7;
  v25 = a8;
  v17 = v15;
  v18 = v14;
  dispatch_async(queue, block);

}

- (void)_processExclaveBufferCallbackFrom:(unint64_t)a3 hostTime:(unint64_t)a4
{
  NSObject *queue;
  _QWORD block[7];

  if (-[CSExclaveRecordClient fetchAndStoreAudioBuffer](self->_exclaveAudioClient, "fetchAndStoreAudioBuffer"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__CSAudioRecorder__processExclaveBufferCallbackFrom_hostTime___block_invoke;
    block[3] = &unk_1E687F490;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(queue, block);
  }
}

- (void)_processAudioBuffer:(id)a3 audioStreamHandleId:(unint64_t)a4 arrivalTimestampToAudioRecorder:(unint64_t)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  CSAudioDecoder *v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  NSMutableDictionary *opusDecoders;
  void *v32;
  void *v33;
  NSMutableDictionary *v34;
  void *v35;
  CSAudioDecoder *v36;
  NSMutableDictionary *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  CSAudioRecorder *v41;
  unint64_t v42;
  unint64_t v43;
  char v44[40];
  char v45[40];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  unsigned int v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)MEMORY[0x1B5E46720]();
  v10 = *(_DWORD *)(objc_msgSend(v8, "streamDescription") + 8);
  if (v10 == 1869641075)
  {
    v13 = objc_msgSend(v8, "channels");
    v14 = objc_msgSend(v8, "packetDescriptionCount");
    v15 = objc_msgSend(v8, "bytesDataSize");
    v16 = v15;
    if (v14 >= 1 && v15 >= 1 && v13 > 0)
    {
      v42 = a4;
      v43 = a5;
      v17 = _processAudioBuffer_audioStreamHandleId_arrivalTimestampToAudioRecorder__heartbeat_105;
      v41 = self;
      if (__ROR8__(0xCCCCCCCCCCCCCCCDLL* _processAudioBuffer_audioStreamHandleId_arrivalTimestampToAudioRecorder__heartbeat_105, 2) <= 0xCCCCCCCCCCCCCCCuLL)
      {
        v18 = CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v47 = "-[CSAudioRecorder _processAudioBuffer:audioStreamHandleId:arrivalTimestampToAudioRecorder:]";
          v48 = 1026;
          v49 = v14;
          _os_log_impl(&dword_1B502E000, v18, OS_LOG_TYPE_INFO, "%s packets count %{public}d", buf, 0x12u);
          v17 = _processAudioBuffer_audioStreamHandleId_arrivalTimestampToAudioRecorder__heartbeat_105;
        }
      }
      _processAudioBuffer_audioStreamHandleId_arrivalTimestampToAudioRecorder__heartbeat_105 = v17 + 1;
      v19 = v14;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
      v20 = objc_msgSend(v8, "data");
      v21 = 0;
      while (1)
      {
        v22 = objc_msgSend(v8, "packetDescriptions");
        v23 = *(_DWORD *)(v22 + v21 + 12);
        if (v23 > v16)
          break;
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v20 + *(_QWORD *)(v22 + v21), v23 / v13);
        objc_msgSend(v11, "addObject:", v24);

        v21 += 16;
        if (!--v19)
          goto LABEL_23;
      }
      v30 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "-[CSAudioRecorder _processAudioBuffer:audioStreamHandleId:arrivalTimestampToAudioRecorder:]";
        v48 = 1026;
        v49 = v23;
        _os_log_error_impl(&dword_1B502E000, v30, OS_LOG_TYPE_ERROR, "%s Bad packet length %{public}d. Skipping rest of record buffer.", buf, 0x12u);
      }
LABEL_23:
      opusDecoders = v41->_opusDecoders;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](opusDecoders, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        v34 = v41->_opusDecoders;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", v35);
        v12 = (CSAudioDecoder *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = [CSAudioDecoder alloc];
        +[CSFAudioStreamBasicDescriptionFactory opusASBD](CSFAudioStreamBasicDescriptionFactory, "opusASBD");
        +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD](CSFAudioStreamBasicDescriptionFactory, "lpcmInt16ASBD");
        v12 = -[CSAudioDecoder initWithInASBD:outASBD:](v36, "initWithInASBD:outASBD:", v45, v44);
        -[CSAudioDecoder setDelegate:](v12, "setDelegate:", v41);
        v37 = v41->_opusDecoders;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v37, "setObject:forKey:", v12, v35);
      }

      v38 = mach_absolute_time();
      objc_msgSend(v8, "remoteVoiceActivityVADBuffer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v40) = *(_DWORD *)(objc_msgSend(v8, "streamDescription") + 28);
      -[CSAudioDecoder addPackets:audioStreamHandleId:remoteVAD:timestamp:arrivalTimestampToAudioRecorder:wasBuffered:receivedNumChannels:](v12, "addPackets:audioStreamHandleId:remoteVAD:timestamp:arrivalTimestampToAudioRecorder:wasBuffered:receivedNumChannels:", v11, v42, v39, v38, v43, 0, v40);

      goto LABEL_27;
    }
    v29 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v47 = "-[CSAudioRecorder _processAudioBuffer:audioStreamHandleId:arrivalTimestampToAudioRecorder:]";
      v48 = 1026;
      v49 = v14;
      v50 = 1026;
      v51 = v16;
      v52 = 1026;
      v53 = v13;
      v26 = "%s AVVCAudioBuffer contains %{public}d packet descriptions, size %{public}d, channels %{public}d. Ignoring";
      v27 = v29;
      v28 = 30;
      goto LABEL_20;
    }
  }
  else
  {
    if (v10 == 1819304813)
    {
      -[CSReusableBufferPool dataWithBytes:length:](self->_audioBufferPool, "dataWithBytes:length:", objc_msgSend(v8, "data"), (int)objc_msgSend(v8, "bytesDataSize"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", objc_msgSend(v8, "data"), (int)objc_msgSend(v8, "bytesDataSize"));
      -[CSAudioRecorder _compensateChannelDataIfNeeded:receivedNumChannels:](self, "_compensateChannelDataIfNeeded:receivedNumChannels:", v11, *(unsigned int *)(objc_msgSend(v8, "streamDescription") + 28));
      v12 = (CSAudioDecoder *)objc_claimAutoreleasedReturnValue();
      -[CSAudioRecorder _processAudioChain:audioStreamHandleId:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:](self, "_processAudioChain:audioStreamHandleId:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", v12, a4, 0, objc_msgSend(v8, "timeStamp"), a5, +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels"));
LABEL_27:

      goto LABEL_28;
    }
    v25 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "-[CSAudioRecorder _processAudioBuffer:audioStreamHandleId:arrivalTimestampToAudioRecorder:]";
      v48 = 1026;
      v49 = v10;
      v26 = "%s Cannot handle audio buffer : unexpected format(%{public}u)";
      v27 = v25;
      v28 = 18;
LABEL_20:
      _os_log_error_impl(&dword_1B502E000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    }
  }
LABEL_28:
  objc_autoreleasePoolPop(v9);

}

- (id)_compensateChannelDataIfNeeded:(id)a3 receivedNumChannels:(unsigned int)a4
{
  id v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (+[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels") <= a4)
  {
    v6 = v5;
  }
  else
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v5, "length")/ (unint64_t)a4* +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels"));
    v7 = +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels");
    v8 = _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat;
    if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat, 1) <= 0x888888888888888uLL)
    {
      v9 = v7;
      v10 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = "-[CSAudioRecorder _compensateChannelDataIfNeeded:receivedNumChannels:]";
        v14 = 1026;
        v15 = v9 - a4;
        v16 = 2050;
        v17 = v8;
        _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Compensating %{public}u channel(s), heartbeat = %{public}lld", (uint8_t *)&v12, 0x1Cu);
        v8 = _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat;
      }
    }
    _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat = v8 + 1;
    objc_msgSend(v6, "replaceBytesInRange:withBytes:", 0, objc_msgSend(v5, "length"), objc_msgSend(objc_retainAutorelease(v5), "bytes"));
  }

  return v6;
}

- (void)audioDecoderDidDecodePackets:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 timestamp:(unint64_t)a7 arrivalTimestampToAudioRecorder:(unint64_t)a8 wasBuffered:(BOOL)a9 receivedNumChannels:(unsigned int)a10
{
  id v15;
  id v16;
  id v17;
  unsigned int v18;
  NSObject *queue;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unsigned int v28;

  v15 = a5;
  v16 = a6;
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
  {
    v17 = v15;
    v18 = 1;
  }
  else
  {
    v18 = +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels");
    -[CSAudioRecorder _compensateChannelDataIfNeeded:receivedNumChannels:](self, "_compensateChannelDataIfNeeded:receivedNumChannels:", v15, a10);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __159__CSAudioRecorder_audioDecoderDidDecodePackets_audioStreamHandleId_buffer_remoteVAD_timestamp_arrivalTimestampToAudioRecorder_wasBuffered_receivedNumChannels___block_invoke;
  block[3] = &unk_1E687E570;
  block[4] = self;
  v23 = v17;
  v24 = v16;
  v25 = a4;
  v26 = a7;
  v27 = a8;
  v28 = v18;
  v20 = v16;
  v21 = v17;
  dispatch_async(queue, block);

}

- (void)_trackRemoteAccessoryStreamIdIfNeeded:(id)a3
{

}

- (void)_stopTrackingRemoteAccessoryStreamId:(unint64_t)a3
{
  NSMutableSet *remoteAccessoryStreamIdSet;
  void *v6;
  int v7;
  NSMutableSet *v8;
  id v9;

  remoteAccessoryStreamIdSet = self->_remoteAccessoryStreamIdSet;
  if (remoteAccessoryStreamIdSet)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSMutableSet containsObject:](remoteAccessoryStreamIdSet, "containsObject:", v6);

    if (v7)
    {
      v8 = self->_remoteAccessoryStreamIdSet;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeObject:](v8, "removeObject:", v9);

    }
  }
}

- (BOOL)_audioIsFromRemoteAccessory:(unint64_t)a3
{
  NSMutableSet *remoteAccessoryStreamIdSet;
  void *v4;
  char v5;

  remoteAccessoryStreamIdSet = self->_remoteAccessoryStreamIdSet;
  if (!remoteAccessoryStreamIdSet)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSMutableSet containsObject:](remoteAccessoryStreamIdSet, "containsObject:", v4);

  return v5;
}

- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5
{
  id v8;
  NSMutableDictionary *hasSetAlertDictionary;
  void *v10;
  void *v11;
  char v12;
  char v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;

  v8 = a3;
  if (a5)
    goto LABEL_4;
  hasSetAlertDictionary = self->_hasSetAlertDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](hasSetAlertDictionary, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if ((v12 & 1) == 0)
  {
LABEL_4:
    v14 = self->_hasSetAlertDictionary;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v15);

    -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v16, "setAlertSoundFromURL:forType:", v8, a4);

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (BOOL)playRecordStartingAlertAndResetEndpointerFromStream:(unint64_t)a3 withAlertOverride:(int64_t)a4
{
  return -[CSAudioRecorder playAlertSoundForType:overrideMode:](self, "playAlertSoundForType:overrideMode:", 1, a4);
}

- (BOOL)playAlertSoundForType:(int64_t)a3 overrideMode:(int64_t)a4
{
  NSObject *v7;
  int64_t v8;
  void *v9;
  char v10;
  int v12;
  const char *v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "-[CSAudioRecorder playAlertSoundForType:overrideMode:]";
    v14 = 2048;
    v15 = a3;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC playAlertSoundForType to play %ld alert with override %ld", (uint8_t *)&v12, 0x20u);
  }
  v8 = +[CSAudioStartStreamOption avvcAlertOverrideType:](CSAudioStartStreamOption, "avvcAlertOverrideType:", a4);
  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "playAlertSoundForType:overrideMode:", a3, v8);

  return v10;
}

- (BOOL)playAlertSoundForType:(int64_t)a3 recordDevideIndicator:(id)a4
{
  int v6;
  NSObject *v7;
  char v8;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a4, "shouldUseRemoteRecorder");
  if (a3 == 2 && v6 && -[CSRemoteRecordClient didPlayEndpointBeep](self->_remoteRecordClient, "didPlayEndpointBeep"))
  {
    v7 = CSLogCategoryAudio;
    v8 = 0;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[CSAudioRecorder playAlertSoundForType:recordDevideIndicator:]";
      _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Ignore playing endpoint beep(record stopped beep) since it already played beep in gibraltar", (uint8_t *)&v12, 0xCu);
      return 0;
    }
  }
  else
  {
    v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[CSAudioRecorder playAlertSoundForType:recordDevideIndicator:]";
      v14 = 2050;
      v15 = a3;
      _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC playAlertSoundsForType : %{public}ld", (uint8_t *)&v12, 0x16u);
    }
    -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "playAlertSoundForType:overrideMode:", a3, -1);

  }
  return v8;
}

- (unint64_t)alertStartTime
{
  void *v2;
  unint64_t v3;

  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "alertStartTime");

  return v3;
}

- (float)peakPowerForChannel:(unint64_t)a3
{
  return 0.0;
}

- (float)averagePowerForChannel:(unint64_t)a3
{
  return 0.0;
}

- (id)metrics
{
  void *v2;
  void *v3;

  -[CSAudioRecorder _getVoiceController](self, "_getVoiceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_audioRecorderDidStartRecordingSuccessfully:(BOOL)a3 streamHandleID:(unint64_t)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v6 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_observers;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "audioRecorderDidStartRecord:audioStreamHandleId:successfully:error:", self, a4, v6, v8, (_QWORD)v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  self->_waitingForDidStart = 0;
}

- (void)_audioRecorderDidStopRecordingForReason:(int64_t)a3 streamHandleID:(unint64_t)a4
{
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CSAudioRecorder _stopTrackingRemoteAccessoryStreamId:](self, "_stopTrackingRemoteAccessoryStreamId:", a4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_observers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "audioRecorderDidStopRecord:audioStreamHandleId:reason:", self, a4, a3, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  self->_waitingForDidStart = 0;
}

- (void)exclaveRecordClientAudioBuffer:(id)a3 audioStreamHandleId:(unint64_t)a4 audioBuffer:(id)a5 hostTime:(unint64_t)a6
{
  id v9;
  id v10;

  v9 = a5;
  -[CSAudioRecorder _compensateChannelDataIfNeeded:receivedNumChannels:](self, "_compensateChannelDataIfNeeded:receivedNumChannels:", v9, +[CSConfig exclaveRecordingNumChannels](CSConfig, "exclaveRecordingNumChannels"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[CSAudioRecorder _processAudioChain:audioStreamHandleId:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:](self, "_processAudioChain:audioStreamHandleId:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", v10, a4, 0, a6, mach_absolute_time(), +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels"));
}

- (void)voiceControllerDidStartRecording:(id)a3 forStream:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *queue;
  id v16;
  _QWORD v17[5];
  id v18;
  unint64_t v19;
  BOOL v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v7 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = (void *)CSLogCategoryAudio;
  if (!v7)
  {
    if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v13 = v12;
    objc_msgSend(v11, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v22 = "-[CSAudioRecorder voiceControllerDidStartRecording:forStream:successfully:error:]";
    v23 = 2050;
    v24 = v10;
    v25 = 2050;
    v26 = a4;
    v27 = 1026;
    v28 = 0;
    v29 = 2114;
    v30 = v14;
    _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, "%s Fail - Received didStartRecording : %{public}p, forStream:%{public}llu, successfully:%{public}d, error:%{public}@", buf, 0x30u);
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    objc_msgSend(v11, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v22 = "-[CSAudioRecorder voiceControllerDidStartRecording:forStream:successfully:error:]";
    v23 = 2050;
    v24 = v10;
    v25 = 2050;
    v26 = a4;
    v27 = 1026;
    v28 = 1;
    v29 = 2114;
    v30 = v14;
    _os_log_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEFAULT, "%s Received didStartRecording : %{public}p, forStream:%{public}llu, successfully:%{public}d, error:%{public}@", buf, 0x30u);
LABEL_4:

  }
LABEL_6:
  queue = self->_queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__CSAudioRecorder_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke;
  v17[3] = &unk_1E687F620;
  v20 = v7;
  v18 = v11;
  v19 = a4;
  v17[4] = self;
  v16 = v11;
  dispatch_async(queue, v17);

}

- (void)voiceControllerAudioCallback:(id)a3 forStream:(unint64_t)a4 buffer:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = voiceControllerAudioCallback_forStream_buffer__heartbeat;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * voiceControllerAudioCallback_forStream_buffer__heartbeat, 1) <= 0x888888888888888uLL)
  {
    v11 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = 136315906;
      v14 = "-[CSAudioRecorder voiceControllerAudioCallback:forStream:buffer:]";
      v15 = 1026;
      v16 = objc_msgSend(v9, "bytesDataSize");
      v17 = 2050;
      v18 = voiceControllerAudioCallback_forStream_buffer__heartbeat;
      v19 = 2050;
      v20 = a4;
      _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Received audio buffer %{public}d, heartbeat = %{public}llu, streamID (%{public}lu)", (uint8_t *)&v13, 0x26u);

      v10 = voiceControllerAudioCallback_forStream_buffer__heartbeat;
    }
  }
  voiceControllerAudioCallback_forStream_buffer__heartbeat = v10 + 1;
  if (*MEMORY[0x1E0C899D0] == a4 && +[CSUtils isExclaveHardware](CSUtils, "isExclaveHardware"))
    -[CSAudioRecorder _processExclaveBufferCallbackFrom:hostTime:](self, "_processExclaveBufferCallbackFrom:hostTime:", a4, objc_msgSend(v9, "timeStamp"));
  else
    -[CSAudioRecorder _processAudioBuffer:audioStreamHandleId:arrivalTimestampToAudioRecorder:](self, "_processAudioBuffer:audioStreamHandleId:arrivalTimestampToAudioRecorder:", v9, a4, mach_absolute_time());

}

- (void)voiceControllerDidStopRecording:(id)a3 forStream:(unint64_t)a4 forReason:(int64_t)a5
{
  id v8;
  NSObject *v9;
  NSObject *queue;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v13 = "-[CSAudioRecorder voiceControllerDidStopRecording:forStream:forReason:]";
    v14 = 2050;
    v15 = v8;
    v16 = 2050;
    v17 = a4;
    v18 = 2050;
    v19 = a5;
    _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Received didStopRecording : %{public}p forStream:%{public}llu forReason:%{public}ld", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__CSAudioRecorder_voiceControllerDidStopRecording_forStream_forReason___block_invoke;
  block[3] = &unk_1E687F490;
  block[4] = self;
  block[5] = a5;
  block[6] = a4;
  dispatch_async(queue, block);

}

- (void)voiceControllerStreamInvalidated:(id)a3 forStream:(unint64_t)a4
{
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[CSAudioRecorder voiceControllerStreamInvalidated:forStream:]";
    v11 = 2050;
    v12 = a4;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Received Stream Invalidated : %{public}llu", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__CSAudioRecorder_voiceControllerStreamInvalidated_forStream___block_invoke;
  v8[3] = &unk_1E6881228;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(queue, v8);
}

- (void)voiceControllerRecordHardwareConfigurationDidChange:(id)a3 toConfiguration:(int)a4
{
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[5];
  int v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAudioRecorder voiceControllerRecordHardwareConfigurationDidChange:toConfiguration:]";
    v12 = 1026;
    v13 = a4;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s toConfiguration : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__CSAudioRecorder_voiceControllerRecordHardwareConfigurationDidChange_toConfiguration___block_invoke;
  v8[3] = &unk_1E687E598;
  v8[4] = self;
  v9 = a4;
  dispatch_async(queue, v8);
}

- (void)voiceControllerDidFinishAlertPlayback:(id)a3 ofType:(int)a4 error:(id)a5
{
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  int v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[CSAudioRecorder voiceControllerDidFinishAlertPlayback:ofType:error:]";
    v16 = 1026;
    v17 = a4;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s type : %{public}d, error : %{public}@", buf, 0x1Cu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CSAudioRecorder_voiceControllerDidFinishAlertPlayback_ofType_error___block_invoke;
  block[3] = &unk_1E687E5C0;
  v13 = a4;
  block[4] = self;
  v12 = v7;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)voiceControllerEncoderErrorDidOccur:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v14 = "-[CSAudioRecorder voiceControllerEncoderErrorDidOccur:error:]";
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Encoder error : %{public}@", buf, 0x16u);

  }
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__CSAudioRecorder_voiceControllerEncoderErrorDidOccur_error___block_invoke;
  v11[3] = &unk_1E6880E88;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  dispatch_async(queue, v11);

}

- (void)voiceControllerBeginRecordInterruption:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSAudioRecorder voiceControllerBeginRecordInterruption:]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CSAudioRecorder_voiceControllerBeginRecordInterruption___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)voiceControllerBeginRecordInterruption:(id)a3 withContext:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[CSAudioRecorder voiceControllerBeginRecordInterruption:withContext:]";
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s withContext : %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__CSAudioRecorder_voiceControllerBeginRecordInterruption_withContext___block_invoke;
  v9[3] = &unk_1E6880E88;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(queue, v9);

}

- (void)voiceControllerEndRecordInterruption:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSAudioRecorder voiceControllerEndRecordInterruption:]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CSAudioRecorder_voiceControllerEndRecordInterruption___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)voiceControllerWillSetAudioSessionActive:(id)a3 willActivate:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAudioRecorder voiceControllerWillSetAudioSessionActive:willActivate:]";
    v12 = 1026;
    v13 = v4;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s activate : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__CSAudioRecorder_voiceControllerWillSetAudioSessionActive_willActivate___block_invoke;
  v8[3] = &unk_1E687F440;
  v8[4] = self;
  v9 = v4;
  dispatch_async(queue, v8);
}

- (void)voiceControllerDidSetAudioSessionActive:(id)a3 isActivated:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAudioRecorder voiceControllerDidSetAudioSessionActive:isActivated:]";
    v12 = 1026;
    v13 = v4;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s activate : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__CSAudioRecorder_voiceControllerDidSetAudioSessionActive_isActivated___block_invoke;
  v8[3] = &unk_1E687F440;
  v8[4] = self;
  v9 = v4;
  dispatch_async(queue, v8);
}

- (void)remoteRecordDidStartRecordingWithStreamHandleId:(unint64_t)a3 error:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  CSAudioRecorder *v11;
  unint64_t v12;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__CSAudioRecorder_remoteRecordDidStartRecordingWithStreamHandleId_error___block_invoke;
  block[3] = &unk_1E687FCC0;
  v10 = v6;
  v11 = self;
  v12 = a3;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)remoteRecordDidStopRecordingWithWithStreamHandleId:(unint64_t)a3 error:(id)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__CSAudioRecorder_remoteRecordDidStopRecordingWithWithStreamHandleId_error___block_invoke;
  v5[3] = &unk_1E6881228;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(queue, v5);
}

- (void)remoteRecordLPCMBufferAvailable:(id)a3 streamHandleId:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *queue;
  id v11;
  _QWORD block[5];
  id v13;
  unint64_t v14;

  -[CSAudioRecorder _compensateChannelDataIfNeeded:receivedNumChannels:](self, "_compensateChannelDataIfNeeded:receivedNumChannels:", a3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
  {
    v8 = v7;
    if (+[CSConfig inputRecordingIsFloat](CSConfig, "inputRecordingIsFloat"))
    {
      +[CSFLPCMTypeConverter convertToFloatLPCMBufFromShortLPCMBuf:](CSFLPCMTypeConverter, "convertToFloatLPCMBufFromShortLPCMBuf:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v9;
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__CSAudioRecorder_remoteRecordLPCMBufferAvailable_streamHandleId___block_invoke;
    block[3] = &unk_1E687FCC0;
    v13 = v8;
    v14 = a4;
    block[4] = self;
    v11 = v8;
    dispatch_async(queue, block);

  }
}

- (void)remoteRecordConnectionDisconnected:(id)a3
{
  uint64_t v4;
  NSObject *queue;
  _QWORD v6[6];

  v4 = objc_msgSend(a3, "audioStreamHandleId");
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__CSAudioRecorder_remoteRecordConnectionDisconnected___block_invoke;
  v6[3] = &unk_1E6881228;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

- (BOOL)_hasLocalPendingTwoShot
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CSAudioRecorder__hasLocalPendingTwoShot__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_needResetAudioInjectionIndex:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v10;

  v3 = a3;
  v4 = v3;
  if (v3
    && (v5 = *MEMORY[0x1E0C899E8],
        objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E8]),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    v10 = v8 != 1886352244 && v8 != 1635087471;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)audioFileReaderBufferAvailable:(id)a3 buffer:(id)a4 atTime:(unint64_t)a5
{
  id v7;

  v7 = a4;
  -[CSAudioRecorder _processAudioChain:audioStreamHandleId:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:](self, "_processAudioChain:audioStreamHandleId:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", v7, 0, 0, a5, 0, +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels"));

}

- (void)audioFileReaderDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__CSAudioRecorder_audioFileReaderDidStartRecording_successfully_error___block_invoke;
  v9[3] = &unk_1E6880E88;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

}

- (void)audioFileReaderDidStopRecording:(id)a3 forReason:(int64_t)a4
{
  -[CSAudioRecorder _audioRecorderDidStopRecordingForReason:streamHandleID:](self, "_audioRecorderDidStopRecordingForReason:streamHandleID:", a4, 1);
}

- (id)_getRecordSettingsWithRequest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[8];
  _QWORD v24[8];
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "useCustomizedRecordSettings") & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "recordContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSAudioStreamRequest defaultRequestWithContext:](CSAudioStreamRequest, "defaultRequestWithContext:", v5);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_msgSend(v4, "audioFormat");
  if (v6 >= 3)
  {
    v8 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[CSAudioRecorder _getRecordSettingsWithRequest:]";
      _os_log_error_impl(&dword_1B502E000, v8, OS_LOG_TYPE_ERROR, "%s Unsupported audio format!", buf, 0xCu);
    }
    v7 = 0;
  }
  else
  {
    v7 = *(unsigned int *)&aMcplsupoxeps[4 * v6];
  }
  v9 = objc_msgSend(v4, "numberOfChannels") > 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7, *MEMORY[0x1E0C898E8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v10;
  v23[1] = *MEMORY[0x1E0C89978];
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "sampleRate");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v12;
  v23[2] = *MEMORY[0x1E0C898F8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "lpcmBitDepth"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v13;
  v23[3] = *MEMORY[0x1E0C89918];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "lpcmIsFloat"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v14;
  v23[4] = *MEMORY[0x1E0C89938];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "numberOfChannels"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v15;
  v23[5] = *MEMORY[0x1E0C898C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "encoderBitRate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0C89940];
  v18 = *MEMORY[0x1E0C89950];
  v24[5] = v16;
  v24[6] = v18;
  v19 = *MEMORY[0x1E0C89920];
  v23[6] = v17;
  v23[7] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_fetchRemoteRecordClientWithDeviceId:(id)a3 streamHandleId:(unint64_t)a4
{
  __CFString *v6;
  _BOOL4 v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  CSRemoteRecordClient *remoteRecordClient;
  void *v16;
  char v17;
  CSRemoteRecordClient *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  CSRemoteRecordClient *v22;
  CSRemoteRecordClient *v23;
  CSRemoteRecordClient *v24;
  void *v25;
  CSRemoteRecordClient *v26;
  CSRemoteRecordClient *v28;
  NSObject *v29;
  uint64_t v30;
  int v31;
  const char *v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  if (+[CSUtils hasRemoteCoreSpeech](CSUtils, "hasRemoteCoreSpeech")
    && (v7 = +[CSUtils hasRemoteBuiltInMic](CSUtils, "hasRemoteBuiltInMic"), a4 == 1)
    && v7)
  {
    v8 = CFSTR("BuiltInMicrophoneDevice");
    v9 = CFSTR("BuiltInMicrophoneDevice");
    v10 = v6;
  }
  else
  {
    +[CSRemoteDarwinDeviceInfo sharedInstance](CSRemoteDarwinDeviceInfo, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasDarwinDeviceConnected");

    v8 = v6;
    if (!v12)
      goto LABEL_10;
    +[CSRemoteDarwinDeviceInfo sharedInstance](CSRemoteDarwinDeviceInfo, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchDeviceUUIDStringFromUID:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v10 = v14;

      v8 = v10;
    }
    else
    {
      v10 = 0;
      v8 = v6;
    }
  }

LABEL_10:
  remoteRecordClient = self->_remoteRecordClient;
  if (!remoteRecordClient)
  {
LABEL_16:
    v23 = -[CSRemoteRecordClient initWithDeviceId:audioStreamHandleId:]([CSRemoteRecordClient alloc], "initWithDeviceId:audioStreamHandleId:", v8, a4);
    v24 = self->_remoteRecordClient;
    self->_remoteRecordClient = v23;

    -[CSRemoteRecordClient setDelegate:](self->_remoteRecordClient, "setDelegate:", self);
    goto LABEL_17;
  }
  -[CSRemoteRecordClient deviceId](remoteRecordClient, "deviceId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", v8);

  if ((v17 & 1) == 0)
  {
    v18 = self->_remoteRecordClient;
    if (v18)
    {
      v19 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        -[CSRemoteRecordClient deviceId](v18, "deviceId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 136315650;
        v32 = "-[CSAudioRecorder _fetchRemoteRecordClientWithDeviceId:streamHandleId:]";
        v33 = 2112;
        v34 = (unint64_t)v21;
        v35 = 2112;
        v36 = v6;
        _os_log_impl(&dword_1B502E000, v20, OS_LOG_TYPE_DEFAULT, "%s Existing remoteRecordClient (deviceId = %@) doesn't match required one (deviceId = %@), create new remoteRecordClient", (uint8_t *)&v31, 0x20u);

        v18 = self->_remoteRecordClient;
      }
      -[CSRemoteRecordClient setDelegate:](v18, "setDelegate:", 0);
      v22 = self->_remoteRecordClient;
      self->_remoteRecordClient = 0;

    }
    goto LABEL_16;
  }
LABEL_17:
  if (-[CSRemoteRecordClient audioStreamHandleId](self->_remoteRecordClient, "audioStreamHandleId") != a4)
  {
    v25 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      v28 = self->_remoteRecordClient;
      v29 = v25;
      v30 = -[CSRemoteRecordClient audioStreamHandleId](v28, "audioStreamHandleId");
      v31 = 136315650;
      v32 = "-[CSAudioRecorder _fetchRemoteRecordClientWithDeviceId:streamHandleId:]";
      v33 = 2050;
      v34 = a4;
      v35 = 2050;
      v36 = (__CFString *)v30;
      _os_log_fault_impl(&dword_1B502E000, v29, OS_LOG_TYPE_FAULT, "%s The input streamHandleId(%{public}lu) is not expected(%{public}lu)", (uint8_t *)&v31, 0x20u);

    }
  }
  v26 = self->_remoteRecordClient;

  return v26;
}

- (BOOL)_isDarwinDeviceId:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[CSRemoteDarwinDeviceInfo sharedInstance](CSRemoteDarwinDeviceInfo, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRemoteDarwinConnectedWithUUID:", v3);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    +[CSRemoteDarwinDeviceInfo sharedInstance](CSRemoteDarwinDeviceInfo, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchDeviceUUIDStringFromUID:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v8 != 0;
  }

  return v6;
}

- (id)_recordModeString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("Listening");
  if (a3 == 1)
    return CFSTR("Recording");
  else
    return (id)v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)voiceControllerCreationQueue
{
  return self->_voiceControllerCreationQueue;
}

- (void)setVoiceControllerCreationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_voiceControllerCreationQueue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (CSAudioSessionEventProvidingDelegate)sessionEventDelegate
{
  return (CSAudioSessionEventProvidingDelegate *)objc_loadWeakRetained((id *)&self->_sessionEventDelegate);
}

- (void)setSessionEventDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sessionEventDelegate, a3);
}

- (NSMutableSet)remoteAccessoryStreamIdSet
{
  return self->_remoteAccessoryStreamIdSet;
}

- (void)setRemoteAccessoryStreamIdSet:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAccessoryStreamIdSet, a3);
}

- (unint64_t)exclaveSampleCountForStream
{
  return self->_exclaveSampleCountForStream;
}

- (void)setExclaveSampleCountForStream:(unint64_t)a3
{
  self->_exclaveSampleCountForStream = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAccessoryStreamIdSet, 0);
  objc_destroyWeak((id *)&self->_sessionEventDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_voiceControllerCreationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_exclaveAudioClient, 0);
  objc_storeStrong((id *)&self->_hasSetAlertDictionary, 0);
  objc_storeStrong((id *)&self->_audioBufferPool, 0);
  objc_storeStrong((id *)&self->_audioFileReader, 0);
  objc_storeStrong((id *)&self->_opusDecoders, 0);
  objc_storeStrong((id *)&self->_remoteRecordClient, 0);
  objc_storeStrong((id *)&self->_voiceController, 0);
}

uint64_t __71__CSAudioRecorder_audioFileReaderDidStartRecording_successfully_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_audioRecorderDidStartRecordingSuccessfully:streamHandleID:error:", 1, 1, *(_QWORD *)(a1 + 40));
}

void __42__CSAudioRecorder__hasLocalPendingTwoShot__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  if (v2)
  {
    +[CSVoiceTriggerEventInfoProvider sharedInstance](CSVoiceTriggerEventInfoProvider, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 == objc_msgSend(v3, "triggerNotifiedMachTime");

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    v7 = 136315650;
    v8 = "-[CSAudioRecorder _hasLocalPendingTwoShot]_block_invoke";
    v9 = 1026;
    v10 = v5;
    v11 = 2050;
    v12 = v6;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s hasLocalPendingTwoShot = %{public}d, token : %{public}llu", (uint8_t *)&v7, 0x1Cu);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
}

void __54__CSAudioRecorder_remoteRecordConnectionDisconnected___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioRecorderDisconnected:", *(_QWORD *)(a1 + 32), (_QWORD)v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioRecorderStreamHandleIdInvalidated:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 48);
  *(_QWORD *)(v8 + 48) = 0;

}

void __66__CSAudioRecorder_remoteRecordLPCMBufferAvailable_streamHandleId___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1[4] + 136);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v5);
        v8 = a1[5];
        v7 = a1[6];
        v9 = a1[4];
        v10 = mach_absolute_time();
        v11 = mach_absolute_time();
        LODWORD(v12) = +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels");
        objc_msgSend(v6, "audioRecorderBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", v9, v7, v8, 0, v10, v11, v12);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }

}

uint64_t __76__CSAudioRecorder_remoteRecordDidStopRecordingWithWithStreamHandleId_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_audioRecorderDidStopRecordingForReason:streamHandleID:", 2, *(_QWORD *)(a1 + 40));
}

uint64_t __73__CSAudioRecorder_remoteRecordDidStartRecordingWithStreamHandleId_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_audioRecorderDidStartRecordingSuccessfully:streamHandleID:error:", *(_QWORD *)(a1 + 32) == 0, *(_QWORD *)(a1 + 48));
}

void __71__CSAudioRecorder_voiceControllerDidSetAudioSessionActive_isActivated___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioRecorder:didSetAudioSessionActive:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), (_QWORD)v9);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "audioSessionEventProvidingDidSetAudioSessionActive:", *(unsigned __int8 *)(a1 + 40));

}

void __73__CSAudioRecorder_voiceControllerWillSetAudioSessionActive_willActivate___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioRecorder:willSetAudioSessionActive:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), (_QWORD)v9);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "audioSessionEventProvidingWillSetAudioSessionActive:", *(unsigned __int8 *)(a1 + 40));

}

void __56__CSAudioRecorder_voiceControllerEndRecordInterruption___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioRecorderEndRecordInterruption:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __70__CSAudioRecorder_voiceControllerBeginRecordInterruption_withContext___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioRecorderBeginRecordInterruption:withContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __58__CSAudioRecorder_voiceControllerBeginRecordInterruption___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioRecorderBeginRecordInterruption:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __61__CSAudioRecorder_voiceControllerEncoderErrorDidOccur_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioRecorderBuiltInAudioStreamInvalidated:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __70__CSAudioRecorder_voiceControllerDidFinishAlertPlayback_ofType_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioRecorderDidFinishAlertPlayback:ofType:error:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __87__CSAudioRecorder_voiceControllerRecordHardwareConfigurationDidChange_toConfiguration___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioRecorderRecordHardwareConfigurationDidChange:toConfiguration:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __62__CSAudioRecorder_voiceControllerStreamInvalidated_forStream___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioRecorderStreamHandleIdInvalidated:", *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __71__CSAudioRecorder_voiceControllerDidStopRecording_forStream_forReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_audioRecorderDidStopRecordingForReason:streamHandleID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __81__CSAudioRecorder_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_audioRecorderDidStartRecordingSuccessfully:streamHandleID:error:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __159__CSAudioRecorder_audioDecoderDidDecodePackets_audioStreamHandleId_buffer_remoteVAD_timestamp_arrivalTimestampToAudioRecorder_wasBuffered_receivedNumChannels___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        LODWORD(v7) = *(_DWORD *)(a1 + 80);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "audioRecorderBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __62__CSAudioRecorder__processExclaveBufferCallbackFrom_hostTime___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1[4] + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioRecorderExclaveBufferAvailable:audioStreamHandleId:hostTime:arrivalTimestampToAudioRecorder:", a1[4], a1[5], a1[6], mach_absolute_time(), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __124__CSAudioRecorder__processAudioChain_audioStreamHandleId_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        LODWORD(v7) = *(_DWORD *)(a1 + 80);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "audioRecorderBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __54__CSAudioRecorder__shouldLogResourceNotAvailableError__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  char v4;

  +[CSUtils deviceProductVersion](CSUtils, "deviceProductVersion");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "isEqualToString:", CFSTR("iPhone9,1")) & 1) != 0)
    goto LABEL_6;
  +[CSUtils deviceProductVersion](CSUtils, "deviceProductVersion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone9,2")) & 1) != 0)
  {
LABEL_5:

LABEL_6:
LABEL_7:
    _shouldLogResourceNotAvailableError_answer = 1;
    return;
  }
  +[CSUtils deviceProductVersion](CSUtils, "deviceProductVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone9,3")))
  {

    goto LABEL_5;
  }
  +[CSUtils deviceProductVersion](CSUtils, "deviceProductVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone9,4"));

  if ((v4 & 1) != 0)
    goto LABEL_7;
}

void __41__CSAudioRecorder_setContext_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  v4 = *(_QWORD *)(a1[7] + 8) + 24;
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v3, "setContext:streamType:error:", v2, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v6;
}

void __38__CSAudioRecorder__getVoiceController__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

void __51__CSAudioRecorder__createVoiceControllerWithError___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = objc_alloc(MEMORY[0x1E0C89C08]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "initWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v4;

}

void __51__CSAudioRecorder__createVoiceControllerWithError___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id obj;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = objc_alloc(MEMORY[0x1E0C89C08]);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v3 + 40);
    v4 = objc_msgSend(v2, "initWithError:", &obj);
    objc_storeStrong((id *)(v3 + 40), obj);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v4;

  }
  kdebug_trace();
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v7)
  {
    objc_msgSend(v7, "setRecordDelegate:");
  }
  else
  {
    v8 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSAudioRecorder _createVoiceControllerWithError:]_block_invoke_2";
      _os_log_error_impl(&dword_1B502E000, v8, OS_LOG_TYPE_ERROR, "%s AVVC initialization failed", buf, 0xCu);
    }
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v9)
    {
      v10 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        objc_msgSend(v9, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v15 = "-[CSAudioRecorder _createVoiceControllerWithError:]_block_invoke";
        v16 = 2114;
        v17 = v12;
        _os_log_error_impl(&dword_1B502E000, v11, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);

      }
    }
  }
}

uint64_t __30__CSAudioRecorder_willDestroy__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "clearListeningMicIndicatorProperty");
  return objc_msgSend(*(id *)(a1 + 32), "_destroyVoiceController");
}

void __30__CSAudioRecorder_willDestroy__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 205, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_audioRecorderDidStartRecordingSuccessfully:streamHandleID:error:", 0, 0, v2);

}

void __30__CSAudioRecorder_willDestroy__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioRecorderWillBeDestroyed:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __85__CSAudioRecorder_userSessionActivateMonitor_didReceivedUserSessionActiveHasChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSAudioRecorder userSessionActivateMonitor:didReceivedUserSessionActiveHasChanged:]_block_invoke";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Tear down _remoteRecordClient if needed", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  if (v4)
  {
    *(_QWORD *)(v3 + 48) = 0;

  }
}

id __48__CSAudioRecorder_setAudioSessionEventDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 144), *(id *)(a1 + 40));
}

uint64_t __38__CSAudioRecorder_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __36__CSAudioRecorder_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "addObject:", *(_QWORD *)(a1 + 40));
}

+ (unint64_t)_convertDeactivateOption:(unint64_t)a3
{
  return a3 == 1;
}

+ (void)createSharedAudioSession
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    objc_msgSend(MEMORY[0x1E0C89AF0], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v3 = objc_msgSend(v2, "setIAmTheAssistant:error:", 1, &v15);
    v4 = v15;

    v5 = CSLogCategoryAudio;
    if ((v3 & 1) == 0 && os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v10 = v5;
      objc_msgSend(v4, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v17 = "+[CSAudioRecorder createSharedAudioSession]";
      v18 = 2114;
      v19 = v11;
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s Failed to setIamTheAssistant : %{public}@", buf, 0x16u);

      v5 = CSLogCategoryAudio;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "+[CSAudioRecorder createSharedAudioSession]";
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Creating audio session with allow mixable audio while recording to YES", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C89AF0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v7 = objc_msgSend(v6, "setAllowMixableAudioWhileRecording:error:", 1, &v14);
    v8 = v14;

    if ((v7 & 1) == 0)
    {
      v9 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v12 = v9;
        objc_msgSend(v8, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v17 = "+[CSAudioRecorder createSharedAudioSession]";
        v18 = 2114;
        v19 = v13;
        _os_log_error_impl(&dword_1B502E000, v12, OS_LOG_TYPE_ERROR, "%s Failed to setAllowMixableAudioWhileRecording : %{public}@", buf, 0x16u);

      }
    }

  }
}

+ (void)resetDuckSettings
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "+[CSAudioRecorder resetDuckSettings]";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Calling audio session reset ducking settings", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C89AF0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "setDuckToLevelDB:error:", 0, &v13);
  v5 = v13;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v6, "timeIntervalSinceDate:", v3);
    *(_DWORD *)buf = 136315394;
    v15 = "+[CSAudioRecorder resetDuckSettings]";
    v16 = 2050;
    v17 = v9;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s resetDuckSettings elapsed time = %{public}lf", buf, 0x16u);

  }
  if (v5)
  {
    v10 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      objc_msgSend(v5, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v15 = "+[CSAudioRecorder resetDuckSettings]";
      v16 = 2114;
      v17 = v12;
      _os_log_error_impl(&dword_1B502E000, v11, OS_LOG_TYPE_ERROR, "%s Failed to setDuckToLevelDB : %{public}@", buf, 0x16u);

    }
  }

}

@end
