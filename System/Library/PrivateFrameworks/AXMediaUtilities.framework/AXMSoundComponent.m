@implementation AXMSoundComponent

- (AVAudioSession)audioSession
{
  return (AVAudioSession *)-[AVAudioEngine audioSession](self->_engine, "audioSession");
}

- (void)setAudioSession:(id)a3
{
  -[AVAudioEngine setAudioSession:](self->_engine, "setAudioSession:", a3);
}

- (AXMSoundComponent)init
{
  AXMSoundComponent *v2;
  void *v3;
  uint64_t v4;
  id configChangedObserverToken;
  AVAudioEngine *v6;
  AVAudioEngine *engine;
  uint64_t v8;
  NSMutableArray *activeSounds;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXMSoundComponent;
  v2 = -[AXMOutputComponent init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0C89650], 0, 0, &__block_literal_global_33);
    v4 = objc_claimAutoreleasedReturnValue();
    configChangedObserverToken = v2->_configChangedObserverToken;
    v2->_configChangedObserverToken = (id)v4;

    v6 = (AVAudioEngine *)objc_alloc_init(MEMORY[0x1E0C89A88]);
    engine = v2->_engine;
    v2->_engine = v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    activeSounds = v2->_activeSounds;
    v2->_activeSounds = (NSMutableArray *)v8;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_configChangedObserverToken);

  v4.receiver = self;
  v4.super_class = (Class)AXMSoundComponent;
  -[AXMSoundComponent dealloc](&v4, sel_dealloc);
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)transitionToState:(int64_t)a3 completion:(id)a4
{
  id v6;
  int64_t v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;
  objc_super v20;
  objc_super v21;
  id v22;

  v6 = a4;
  v7 = -[AXMOutputComponent componentState](self, "componentState");
  if (a3 != 2 || v7)
  {
    AXMediaLogHaptics();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AXMSoundComponent transitionToState:completion:].cold.2(self, a3, v11);

    v19.receiver = self;
    v19.super_class = (Class)AXMSoundComponent;
    -[AXMOutputComponent transitionToState:completion:](&v19, sel_transitionToState_completion_, a3, v6);
  }
  else
  {
    v22 = 0;
    v8 = -[AXMSoundComponent _startEngineIfNeeded:](self, "_startEngineIfNeeded:", &v22);
    v9 = v22;
    v10 = v9;
    if (!v8 || v9)
    {
      AXMediaLogHaptics();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[AXMSoundComponent transitionToState:completion:].cold.1((uint64_t)v10, v12, v13, v14, v15, v16, v17, v18);

      v21.receiver = self;
      v21.super_class = (Class)AXMSoundComponent;
      -[AXMOutputComponent transitionToState:completion:](&v21, sel_transitionToState_completion_, 1, v6);
    }
    else
    {
      v20.receiver = self;
      v20.super_class = (Class)AXMSoundComponent;
      -[AXMOutputComponent transitionToState:completion:](&v20, sel_transitionToState_completion_, 2, v6);
    }

  }
}

- (BOOL)canHandleRequest:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "oneShotSoundActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "activeSoundActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count") != 0;

  }
  return v5;
}

- (void)handleRequest:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  AXMActiveSoundOutputActionHandleImpl *v28;
  void *v29;
  NSObject *v30;
  id v31;
  id v32;
  void *v33;
  NSObject *group;
  _QWORD block[4];
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  NSObject *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  id v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32 = a4;
  v33 = v5;
  group = dispatch_group_create();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v5, "oneShotSoundActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v12 = objc_alloc(MEMORY[0x1E0C89A98]);
        objc_msgSend(v11, "soundFileURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0;
        v14 = (void *)objc_msgSend(v12, "initForReading:error:", v13, &v45);
        v15 = v45;

        if (v15)
        {
          AXMediaLogSounds();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v52 = v5;
            v53 = 2112;
            v54 = v15;
            _os_log_error_impl(&dword_1B0E3B000, v16, OS_LOG_TYPE_ERROR, "Could not handle audio request: %@. Error:%@", buf, 0x16u);
          }
        }
        else
        {
          dispatch_group_enter(group);
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __46__AXMSoundComponent_handleRequest_completion___block_invoke;
          v43[3] = &unk_1E625CCC0;
          v44 = group;
          -[AXMSoundComponent _scheduleOneShotSound:completion:](self, "_scheduleOneShotSound:completion:", v14, v43);
          v16 = v44;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v8);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v5, "activeSoundActions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v40 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        v23 = objc_alloc(MEMORY[0x1E0C89A98]);
        objc_msgSend(v22, "soundFileURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        v25 = (void *)objc_msgSend(v23, "initForReading:error:", v24, &v38);
        v26 = v38;

        if (v26)
        {
          AXMediaLogSounds();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v52 = v33;
            v53 = 2112;
            v54 = v26;
            _os_log_error_impl(&dword_1B0E3B000, v27, OS_LOG_TYPE_ERROR, "Could not handle audio request: %@. Error:%@", buf, 0x16u);
          }
        }
        else
        {
          -[AXMSoundComponent _scheduleActiveSound:](self, "_scheduleActiveSound:", v25);
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = objc_alloc_init(AXMActiveSoundOutputActionHandleImpl);
            -[AXMActiveSoundOutputActionHandleImpl setActiveSound:](v28, "setActiveSound:", v27);
            -[AXMActiveSoundOutputActionHandleImpl setSoundComponent:](v28, "setSoundComponent:", self);
            objc_msgSend(v22, "handle");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setHandleProvider:", v28);

          }
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    }
    while (v19);
  }

  dispatch_get_global_queue(21, 0);
  v30 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AXMSoundComponent_handleRequest_completion___block_invoke_56;
  block[3] = &unk_1E625D100;
  v37 = v32;
  v31 = v32;
  dispatch_group_notify(group, v30, block);

}

void __46__AXMSoundComponent_handleRequest_completion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __46__AXMSoundComponent_handleRequest_completion___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_scheduleActiveSound:(id)a3
{
  id v4;
  AXMActiveSound *v5;
  _BOOL4 v6;
  id v7;
  AXMActiveSound *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;

  v4 = a3;
  v5 = objc_alloc_init(AXMActiveSound);
  -[AXMActiveSound connectToEngine:](v5, "connectToEngine:", self->_engine);
  v17 = 0;
  v6 = -[AXMActiveSound beginPlayback:withError:](v5, "beginPlayback:withError:", v4, &v17);

  v7 = v17;
  if (v6)
  {
    -[NSMutableArray addObject:](self->_activeSounds, "addObject:", v5);
    v8 = v5;
  }
  else
  {
    AXMediaLogSounds();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AXMSoundComponent _scheduleActiveSound:].cold.1((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);

    -[AXMActiveSound disconnectFromEngine:](v5, "disconnectFromEngine:", self->_engine);
    v8 = 0;
  }

  return v8;
}

- (void)_scheduleOneShotSound:(id)a3 completion:(id)a4
{
  id v6;
  AVAudioPlayerNode *oneShotSoundPlayer;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  oneShotSoundPlayer = self->_oneShotSoundPlayer;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__AXMSoundComponent__scheduleOneShotSound_completion___block_invoke;
  v9[3] = &unk_1E625D100;
  v10 = v6;
  v8 = v6;
  -[AVAudioPlayerNode scheduleFile:atTime:completionHandler:](oneShotSoundPlayer, "scheduleFile:atTime:completionHandler:", a3, 0, v9);
  -[AVAudioPlayerNode play](self->_oneShotSoundPlayer, "play");

}

uint64_t __54__AXMSoundComponent__scheduleOneShotSound_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  AXMediaLogSounds();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B0E3B000, v2, OS_LOG_TYPE_INFO, "One-shot sound player did finish playing sound", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_startEngineIfNeeded:(id *)a3
{
  AVAudioPlayerNode *v5;
  AVAudioPlayerNode *oneShotSoundPlayer;
  void *v7;
  void *v8;
  id v9;
  char v10;
  AVAudioEngine *engine;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;

  if (!self->_oneShotSoundPlayer)
  {
    v5 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x1E0C89AD8]);
    oneShotSoundPlayer = self->_oneShotSoundPlayer;
    self->_oneShotSoundPlayer = v5;

    -[AVAudioEngine attachNode:](self->_engine, "attachNode:", self->_oneShotSoundPlayer);
    -[AVAudioEngine mainMixerNode](self->_engine, "mainMixerNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initStandardFormatWithSampleRate:channels:", 2, 44100.0);
    -[AVAudioEngine connect:to:fromBus:toBus:format:](self->_engine, "connect:to:fromBus:toBus:format:", self->_oneShotSoundPlayer, v7, 0, objc_msgSend(v7, "nextAvailableInputBus"), v8);

  }
  if (-[AVAudioEngine isRunning](self->_engine, "isRunning"))
  {
    v9 = 0;
    v10 = 1;
  }
  else
  {
    engine = self->_engine;
    v20 = 0;
    v10 = -[AVAudioEngine startAndReturnError:](engine, "startAndReturnError:", &v20);
    v9 = v20;
    if (v9)
    {
      AXMediaLogSounds();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[AXMSoundComponent _startEngineIfNeeded:].cold.1((uint64_t)v9, v12, v13, v14, v15, v16, v17, v18);

    }
  }
  if (a3)
    *a3 = objc_retainAutorelease(v9);

  return v10;
}

- (void)_stopActiveSound:(id)a3
{
  AVAudioEngine *engine;
  id v5;

  if (a3)
  {
    engine = self->_engine;
    v5 = a3;
    objc_msgSend(v5, "disconnectFromEngine:", engine);
    -[NSMutableArray removeObject:](self->_activeSounds, "removeObject:", v5);

  }
}

- (id)configChangedObserverToken
{
  return self->_configChangedObserverToken;
}

- (void)setConfigChangedObserverToken:(id)a3
{
  objc_storeStrong(&self->_configChangedObserverToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configChangedObserverToken, 0);
  objc_storeStrong((id *)&self->_activeSounds, 0);
  objc_storeStrong((id *)&self->_oneShotSoundPlayer, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

- (void)transitionToState:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Error starting audio engine: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)transitionToState:(NSObject *)a3 completion:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "componentState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1B0E3B000, a3, OS_LOG_TYPE_ERROR, "Unexpected state change. from %@. to %@", (uint8_t *)&v7, 0x16u);

}

- (void)_scheduleActiveSound:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Could not begin active sound playback: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_startEngineIfNeeded:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Could not start engine: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
