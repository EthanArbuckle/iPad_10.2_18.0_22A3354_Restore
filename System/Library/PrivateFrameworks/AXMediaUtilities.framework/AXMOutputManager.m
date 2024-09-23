@implementation AXMOutputManager

- (AXMOutputManager)initWithComponents:(unint64_t)a3 options:(unint64_t)a4
{
  void *v7;
  AXMOutputManager *v8;

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setComponents:", a3);
  objc_msgSend(v7, "setUsesPrivateAudioSession:", a4 & 1);
  objc_msgSend(v7, "setHapticEngineUsesAutoShutdown:", (a4 >> 1) & 1);
  objc_msgSend(v7, "setHapticEngineAutoShutdownTimeout:", -1.0);
  v8 = -[AXMOutputManager initWithConfiguration:](self, "initWithConfiguration:", v7);

  return v8;
}

- (AXMOutputManager)initWithConfiguration:(id)a3
{
  id v4;
  AXMOutputManager *v5;
  AXMOutputManager *v6;
  NSObject *v7;
  AXMAudioSession *v8;
  AXMAudioSession *audioSession;
  AXMTaskDispatcher *v10;
  AXMTaskDispatcher *outputRequests;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  char v15;
  NSArray *v16;
  AXMSoundComponent *v17;
  AXMSoundComponent *queue_soundComponent;
  void *v19;
  AXMSpeechComponent *v20;
  AXMSpeechComponent *queue_speechComponent;
  AXMHapticComponent *v22;
  AXMHapticComponent *queue_hapticComponent;
  NSArray *queue_activeComponents;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AXMOutputManager;
  v5 = -[AXMOutputManager init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AXMOutputManager setConfiguration:](v5, "setConfiguration:", v4);
    AXMediaLogOutput();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v4;
      _os_log_impl(&dword_1B0E3B000, v7, OS_LOG_TYPE_DEFAULT, "Initializing output manager with config: %@", buf, 0xCu);
    }

    if (objc_msgSend(v4, "usesPrivateAudioSession"))
    {
      v8 = objc_alloc_init(AXMAudioSession);
      audioSession = v6->_audioSession;
      v6->_audioSession = v8;

    }
    v6->_state = 0;
    v10 = -[AXMTaskDispatcher initWithIdentifier:delegate:]([AXMTaskDispatcher alloc], "initWithIdentifier:delegate:", CFSTR("OutputManager"), v6);
    outputRequests = v6->_outputRequests;
    v6->_outputRequests = v10;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("OutputManager", v12);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    v15 = objc_msgSend(v4, "components");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if ((v15 & 2) != 0 && +[AXMSoundComponent isSupported](AXMSoundComponent, "isSupported"))
    {
      v17 = objc_alloc_init(AXMSoundComponent);
      queue_soundComponent = v6->_queue_soundComponent;
      v6->_queue_soundComponent = v17;

      if (objc_msgSend(v4, "usesPrivateAudioSession"))
      {
        -[AXMAudioSession session](v6->_audioSession, "session");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMSoundComponent setAudioSession:](v6->_queue_soundComponent, "setAudioSession:", v19);

      }
      -[NSArray addObject:](v16, "addObject:", v6->_queue_soundComponent);
    }
    if ((v15 & 1) != 0 && +[AXMSpeechComponent isSupported](AXMSpeechComponent, "isSupported"))
    {
      v20 = objc_alloc_init(AXMSpeechComponent);
      queue_speechComponent = v6->_queue_speechComponent;
      v6->_queue_speechComponent = v20;

      -[NSArray addObject:](v16, "addObject:", v6->_queue_speechComponent);
    }
    if ((v15 & 4) != 0 && +[AXMHapticComponent isSupported](AXMHapticComponent, "isSupported"))
    {
      v22 = objc_alloc_init(AXMHapticComponent);
      queue_hapticComponent = v6->_queue_hapticComponent;
      v6->_queue_hapticComponent = v22;

      -[AXMHapticComponent setAutoShutdownEnabled:](v6->_queue_hapticComponent, "setAutoShutdownEnabled:", objc_msgSend(v4, "hapticEngineUsesAutoShutdown"));
      objc_msgSend(v4, "hapticEngineAutoShutdownTimeout");
      -[AXMHapticComponent setAutoShutdownTimeout:](v6->_queue_hapticComponent, "setAutoShutdownTimeout:");
      -[AXMHapticComponent setUsesHapticsOnly:](v6->_queue_hapticComponent, "setUsesHapticsOnly:", objc_msgSend(v4, "hapticEngineUsesHapticsOnly"));
      -[NSArray addObject:](v16, "addObject:", v6->_queue_hapticComponent);
    }
    queue_activeComponents = v6->_queue_activeComponents;
    v6->_queue_activeComponents = v16;

  }
  return v6;
}

- (NSString)description
{
  unint64_t state;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  state = self->_state;
  if (state > 2)
    v4 = &stru_1E6260C18;
  else
    v4 = off_1E625EFF8[state];
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_queue_speechComponent != 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_queue_soundComponent != 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_queue_hapticComponent != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("AXMOutputManager<%p>: state:'%@'. Speech? %@. Sound? %@. Haptics? %@."), self, v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)disable
{
  NSObject *queue;
  _QWORD block[5];

  if (self->_usesPrivateAudioSession)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__AXMOutputManager_disable__block_invoke;
    block[3] = &unk_1E625CCC0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __27__AXMOutputManager_disable__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v10 = 0;
  objc_msgSend(v1, "deactivateSessionWithError:", &v10);
  v2 = v10;
  if (v2)
  {
    AXMediaLogOutput();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __27__AXMOutputManager_disable__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)enableWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1B5E12AE8]();
    v7 = (void *)MEMORY[0x1B5E12AE8]();

  }
  else
  {
    v6 = (void *)objc_msgSend(&__block_literal_global_28, "copy");
    v7 = (void *)MEMORY[0x1B5E12AE8]();
  }

  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__AXMOutputManager_enableWithCompletion___block_invoke_2;
  v10[3] = &unk_1E625C480;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, v10);

}

void __41__AXMOutputManager_enableWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _QWORD block[5];
  id v24;
  _QWORD v25[4];
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 16)
    && (v3 = *(void **)(v2 + 24),
        v31 = 0,
        objc_msgSend(v3, "activateSessionWithError:", &v31),
        (v4 = v31) != 0))
  {
    v5 = v4;
    AXMediaLogOutput();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __41__AXMOutputManager_enableWithCompletion___block_invoke_2_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = dispatch_group_create();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    v15 = MEMORY[0x1E0C809B0];
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v28;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v18);
          dispatch_group_enter(v5);
          v25[0] = v15;
          v25[1] = 3221225472;
          v25[2] = __41__AXMOutputManager_enableWithCompletion___block_invoke_39;
          v25[3] = &unk_1E625CCC0;
          v26 = v5;
          objc_msgSend(v19, "transitionToState:completion:", 2, v25);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v16);
    }

    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(a1 + 40);
    v22 = *(NSObject **)(v20 + 40);
    block[0] = v15;
    block[1] = 3221225472;
    block[2] = __41__AXMOutputManager_enableWithCompletion___block_invoke_2_40;
    block[3] = &unk_1E625C480;
    block[4] = v20;
    v24 = v21;
    dispatch_group_notify(v5, v22, block);

  }
}

void __41__AXMOutputManager_enableWithCompletion___block_invoke_39(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __41__AXMOutputManager_enableWithCompletion___block_invoke_2_40(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    v6 = 1;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "componentState", (_QWORD)v9) != 2)
        break;
      if (v4 == ++v7)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v6 = 2;
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v6;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)dispatchRequest:(id)a3
{
  id v4;
  _AXMOutputRequestTask *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  if (self->_state == 2)
  {
    v5 = objc_alloc_init(_AXMOutputRequestTask);
    -[_AXMOutputRequestTask setRequest:](v5, "setRequest:", v4);
    if (objc_msgSend(v4, "interruptsAndClearsQueue"))
    {
      v6 = -[AXMTaskDispatcher unscheduleAllTasks](self->_outputRequests, "unscheduleAllTasks");
      -[AXMSpeechComponent stopSpeakingAtNextWord](self->_queue_speechComponent, "stopSpeakingAtNextWord");
    }
    -[AXMTaskDispatcher scheduleTask:](self->_outputRequests, "scheduleTask:", v5);
    objc_msgSend(v4, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AXMediaLogOutput();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B0E3B000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring dispatch request. Output manager not ready", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (void)speak:(id)a3
{
  id v4;
  id v5;
  AXMOutputRequest *v6;

  v4 = a3;
  v6 = objc_alloc_init(AXMOutputRequest);
  -[AXMOutputRequest addSpeechItem:](v6, "addSpeechItem:", v4);

  v5 = -[AXMOutputManager dispatchRequest:](self, "dispatchRequest:", v6);
}

- (void)interrupt:(id)a3
{
  id v4;
  id v5;
  AXMOutputRequest *v6;

  v4 = a3;
  v6 = objc_alloc_init(AXMOutputRequest);
  -[AXMOutputRequest setInterruptsAndClearsQueue:](v6, "setInterruptsAndClearsQueue:", 1);
  -[AXMOutputRequest addSpeechItem:](v6, "addSpeechItem:", v4);

  v5 = -[AXMOutputManager dispatchRequest:](self, "dispatchRequest:", v6);
}

- (void)interruptImmediately
{
  id v3;
  NSObject *queue;
  _QWORD block[5];

  v3 = -[AXMTaskDispatcher unscheduleAllTasks](self->_outputRequests, "unscheduleAllTasks");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AXMOutputManager_interruptImmediately__block_invoke;
  block[3] = &unk_1E625CCC0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__AXMOutputManager_interruptImmediately__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "stopSpeakingImmediately");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "stopCurrentHaptics");
}

- (void)interruptPolitely
{
  id v3;
  NSObject *queue;
  _QWORD block[5];

  v3 = -[AXMTaskDispatcher unscheduleAllTasks](self->_outputRequests, "unscheduleAllTasks");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__AXMOutputManager_interruptPolitely__block_invoke;
  block[3] = &unk_1E625CCC0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__AXMOutputManager_interruptPolitely__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "stopSpeakingAtNextWord");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "stopCurrentHaptics");
}

- (void)playSound:(id)a3
{
  id v4;
  id v5;
  AXMOutputRequest *v6;

  v4 = a3;
  v6 = objc_alloc_init(AXMOutputRequest);
  -[AXMOutputRequest addSoundItemWithID:](v6, "addSoundItemWithID:", v4);

  v5 = -[AXMOutputManager dispatchRequest:](self, "dispatchRequest:", v6);
}

- (id)playActiveSound:(id)a3
{
  id v4;
  AXMOutputRequest *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(AXMOutputRequest);
  -[AXMOutputRequest addActiveSoundItemWithID:](v5, "addActiveSoundItemWithID:", v4);

  -[AXMOutputManager dispatchRequest:](self, "dispatchRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)dispatcher:(id)a3 handleTask:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  AXMOutputManager *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__AXMOutputManager_dispatcher_handleTask___block_invoke;
  v8[3] = &unk_1E625CB18;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __42__AXMOutputManager_dispatcher_handleTask___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = dispatch_group_create();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = a1;
  v4 = *(id *)(*(_QWORD *)(a1 + 40) + 72);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        objc_msgSend(v2, "request");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "canHandleRequest:", v10);

        if (v11)
        {
          dispatch_group_enter(v3);
          objc_msgSend(v2, "request");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __42__AXMOutputManager_dispatcher_handleTask___block_invoke_2;
          v18[3] = &unk_1E625CCC0;
          v19 = v3;
          objc_msgSend(v9, "handleRequest:completion:", v12, v18);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  v13 = *(NSObject **)(*(_QWORD *)(v15 + 40) + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AXMOutputManager_dispatcher_handleTask___block_invoke_3;
  block[3] = &unk_1E625CCC0;
  v17 = v2;
  v14 = v2;
  dispatch_group_notify(v3, v13, block);

}

void __42__AXMOutputManager_dispatcher_handleTask___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__AXMOutputManager_dispatcher_handleTask___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(void);
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "markAsComplete:", 1);
  objc_msgSend(*(id *)(a1 + 32), "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "completionBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

    objc_msgSend(*(id *)(a1 + 32), "request");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompletionBlock:", 0);

  }
}

- (AXMOutputManagerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_queue_activeComponents, 0);
  objc_storeStrong((id *)&self->_queue_hapticComponent, 0);
  objc_storeStrong((id *)&self->_queue_speechComponent, 0);
  objc_storeStrong((id *)&self->_queue_soundComponent, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_outputRequests, 0);
}

void __27__AXMOutputManager_disable__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Could not de-activate audio session: %@", a5, a6, a7, a8, 2u);
}

void __41__AXMOutputManager_enableWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Could not activate audio session: %@", a5, a6, a7, a8, 2u);
}

@end
