@implementation CSContinuousAudioFingerprintProvider

- (CSContinuousAudioFingerprintProvider)init
{
  CSContinuousAudioFingerprintProvider *v2;
  uint64_t v3;
  NSHashTable *observers;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v8;
  NSMutableDictionary *inUseServices;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CSContinuousAudioFingerprintProvider;
  v2 = -[CSContinuousAudioFingerprintProvider init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("CSContinuousAudioFingerprintProvider", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v2->_isListenPollingStarting = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inUseServices = v2->_inUseServices;
    v2->_inUseServices = v8;

    objc_msgSend(MEMORY[0x1E0D19090], "defaultContinuousFingerprintBufferDuration");
    *(float *)&v10 = v10;
    v2->_currentMaximumBufferSize = *(float *)&v10;
    v2->_frameSkipCounter = 0;
  }
  return v2;
}

- (void)_setMaximumBufferSizeFromInUseServices
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t i;
  void *v9;
  float v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_inUseServices;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_inUseServices, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 < (float)(int)objc_msgSend(v9, "intValue"))
        {
          objc_msgSend(v9, "floatValue");
          v7 = v10;
        }

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  self->_currentMaximumBufferSize = v7;
}

- (void)startWithUUID:(id)a3 withMaximumBufferSize:(float)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  float v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__CSContinuousAudioFingerprintProvider_startWithUUID_withMaximumBufferSize___block_invoke;
    block[3] = &unk_1E7C26770;
    block[4] = self;
    v11 = v6;
    v12 = a4;
    dispatch_async(queue, block);

  }
  else
  {
    v9 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[CSContinuousAudioFingerprintProvider startWithUUID:withMaximumBufferSize:]";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s UUID was nil will not start fingerprint provider", buf, 0xCu);
    }
  }

}

- (void)stopWithUUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__CSContinuousAudioFingerprintProvider_stopWithUUID___block_invoke;
    v8[3] = &unk_1E7C292A0;
    v8[4] = self;
    v9 = v4;
    dispatch_async(queue, v8);

  }
  else
  {
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CSContinuousAudioFingerprintProvider stopWithUUID:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s UUID was nil will not stop fingerprint provider", buf, 0xCu);
    }
  }

}

- (void)registerObserver:(id)a3
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
    v7[2] = __57__CSContinuousAudioFingerprintProvider_registerObserver___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)unregisterObserver:(id)a3
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
    v7[2] = __59__CSContinuousAudioFingerprintProvider_unregisterObserver___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSContinuousAudioFingerprintProvider_reset__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4
{
  id v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  double v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (os_log_t *)MEMORY[0x1E0D18F60];
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSContinuousAudioFingerprintProvider _startListenPollingWithInterval:completion:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[CSContinuousAudioFingerprintProvider audioStream](self, "audioStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isStreaming"))
  {

  }
  else
  {
    -[CSContinuousAudioFingerprintProvider enablePolicy](self, "enablePolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEnabled");

    if (v11)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __83__CSContinuousAudioFingerprintProvider__startListenPollingWithInterval_completion___block_invoke;
      v13[3] = &unk_1E7C290B0;
      v13[4] = self;
      v15 = a3;
      v14 = v6;
      -[CSContinuousAudioFingerprintProvider _startListenWithCompletion:](self, "_startListenWithCompletion:", v13);

      goto LABEL_11;
    }
  }
  v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSContinuousAudioFingerprintProvider _startListenPollingWithInterval:completion:]";
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Skip listen polling since audio is streaming / Siri disabled", buf, 0xCu);
  }
  if (v6)
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
LABEL_11:

}

- (void)_startListenWithCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  float currentMaximumBufferSize;
  int v18;
  double v19;
  double v20;
  CSAudioCircularBuffer *v21;
  CSAudioCircularBuffer *audioLoggingBuffer;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  void (**v34)(_QWORD, _QWORD, _QWORD);
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __67__CSContinuousAudioFingerprintProvider__startListenWithCompletion___block_invoke;
  v37[3] = &unk_1E7C290D8;
  v5 = v4;
  v38 = v5;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v37);
  objc_msgSend(MEMORY[0x1E0D19008], "contextForBuiltInVoiceTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v8, "audioProviderWithContext:error:", v7, &v36);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v36;

  if (v9)
  {
    v11 = v9;
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAdBlockerAudioLoggingEnabled");

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D19068], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "converterForAudioStreamId:", objc_msgSend(v11, "audioStreamId"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_alloc(MEMORY[0x1E0D18FD8]);
      currentMaximumBufferSize = self->_currentMaximumBufferSize;
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      LODWORD(v19) = v18;
      *(float *)&v20 = currentMaximumBufferSize;
      v21 = (CSAudioCircularBuffer *)objc_msgSend(v16, "initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:", 1, v15, v20, v19);
      audioLoggingBuffer = self->_audioLoggingBuffer;
      self->_audioLoggingBuffer = v21;

    }
    objc_msgSend(MEMORY[0x1E0D19058], "defaultRequestWithContext:", v7, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v11, "audioStreamWithRequest:streamName:error:", v23, v25, &v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v35;

    if (v26)
    {
      -[CSContinuousAudioFingerprintProvider setAudioStream:](self, "setAudioStream:", v26);
      objc_msgSend(v26, "setDelegate:", self);
      objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __67__CSContinuousAudioFingerprintProvider__startListenWithCompletion___block_invoke_2;
      v33[3] = &unk_1E7C29128;
      v33[4] = self;
      v34 = v6;
      objc_msgSend(v26, "startAudioStreamWithOption:completion:", v28, v33);

    }
    else
    {
      v29 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v30 = v29;
        objc_msgSend(v27, "description");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v40 = "-[CSContinuousAudioFingerprintProvider _startListenWithCompletion:]";
        v41 = 2114;
        v42 = v31;
        _os_log_error_impl(&dword_1C2614000, v30, OS_LOG_TYPE_ERROR, "%s Failed in requesting audio stream : %{public}@", buf, 0x16u);

      }
      ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v27);
    }

    v10 = v32;
  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v10);
  }

}

- (void)_startListenPolling
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_isListenPollingStarting)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[CSContinuousAudioFingerprintProvider _startListenPolling]";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Already started listen polling, skip", buf, 0xCu);
    }
  }
  else
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_isListenPollingStarting = 1;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __59__CSContinuousAudioFingerprintProvider__startListenPolling__block_invoke;
    v4[3] = &unk_1E7C29060;
    v4[4] = self;
    -[CSContinuousAudioFingerprintProvider _startListenPollingWithInterval:completion:](self, "_startListenPollingWithInterval:completion:", v4, 1.0);
  }
}

- (void)_stopListening
{
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0D18F60];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CSContinuousAudioFingerprintProvider _stopListening]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[CSContinuousAudioFingerprintProvider audioStream](self, "audioStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CSContinuousAudioFingerprintProvider audioStream](self, "audioStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__CSContinuousAudioFingerprintProvider__stopListening__block_invoke;
    v8[3] = &unk_1E7C29060;
    v8[4] = self;
    objc_msgSend(v6, "stopAudioStreamWithOption:completion:", 0, v8);

  }
  else
  {
    v7 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSContinuousAudioFingerprintProvider _stopListening]";
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s No audio stream to stop, we shouldn't hit this", buf, 0xCu);
    }
  }
}

- (void)_handleEnablePolicyEvent:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[CSContinuousAudioFingerprintProvider _handleEnablePolicyEvent:]";
    v11 = 1026;
    v12 = v3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Siri enabled : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__CSContinuousAudioFingerprintProvider__handleEnablePolicyEvent___block_invoke;
  v7[3] = &unk_1E7C28480;
  v8 = v3;
  v7[4] = self;
  dispatch_async(queue, v7);
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[CSContinuousAudioFingerprintProvider audioStreamProvider:didStopStreamUnexpectedly:]";
    v11 = 2050;
    v12 = a4;
    _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s stream stopped unexpectedly : %{public}ld", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__CSContinuousAudioFingerprintProvider_audioStreamProvider_didStopStreamUnexpectedly___block_invoke;
  v8[3] = &unk_1E7C29178;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(queue, v8);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSContinuousAudioFingerprintProvider CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s audiomxd/bridgeaudiod recovered from crash", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__CSContinuousAudioFingerprintProvider_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
  objc_storeStrong((id *)&self->_audioStream, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)isListenPollingStarting
{
  return self->_isListenPollingStarting;
}

- (void)setIsListenPollingStarting:(BOOL)a3
{
  self->_isListenPollingStarting = a3;
}

- (CSAudioCircularBuffer)audioLoggingBuffer
{
  return self->_audioLoggingBuffer;
}

- (void)setAudioLoggingBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_audioLoggingBuffer, a3);
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileWriter, a3);
}

- (NSMutableDictionary)inUseServices
{
  return self->_inUseServices;
}

- (void)setInUseServices:(id)a3
{
  objc_storeStrong((id *)&self->_inUseServices, a3);
}

- (float)currentMaximumBufferSize
{
  return self->_currentMaximumBufferSize;
}

- (void)setCurrentMaximumBufferSize:(float)a3
{
  self->_currentMaximumBufferSize = a3;
}

- (CSPolicy)enablePolicy
{
  return self->_enablePolicy;
}

- (void)setEnablePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_enablePolicy, a3);
}

- (unint64_t)frameSkipCounter
{
  return self->_frameSkipCounter;
}

- (void)setFrameSkipCounter:(unint64_t)a3
{
  self->_frameSkipCounter = a3;
}

- (unint64_t)frameSkipRate
{
  return self->_frameSkipRate;
}

- (void)setFrameSkipRate:(unint64_t)a3
{
  self->_frameSkipRate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enablePolicy, 0);
  objc_storeStrong((id *)&self->_inUseServices, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_audioLoggingBuffer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __89__CSContinuousAudioFingerprintProvider_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "enablePolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_startListenPolling");
}

void __86__CSContinuousAudioFingerprintProvider_audioStreamProvider_didStopStreamUnexpectedly___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "_reset");
  if (*(_QWORD *)(a1 + 40) != -11785)
  {
    objc_msgSend(*(id *)(a1 + 32), "enablePolicy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEnabled");

    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "_startListenPolling");
  }
}

uint64_t __65__CSContinuousAudioFingerprintProvider__handleEnablePolicyEvent___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40) && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count"))
    return objc_msgSend(*(id *)(a1 + 32), "_startListenPolling");
  else
    return objc_msgSend(*(id *)(a1 + 32), "_stopListening");
}

void __54__CSContinuousAudioFingerprintProvider__stopListening__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v5, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[CSContinuousAudioFingerprintProvider _stopListening]_block_invoke";
      v11 = 2114;
      v12 = v8;
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Failed to stop audio stream : %{public}@", (uint8_t *)&v9, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reset");

}

uint64_t __59__CSContinuousAudioFingerprintProvider__startListenPolling__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

uint64_t __67__CSContinuousAudioFingerprintProvider__startListenWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __67__CSContinuousAudioFingerprintProvider__startListenWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__CSContinuousAudioFingerprintProvider__startListenWithCompletion___block_invoke_3;
  v10[3] = &unk_1E7C29100;
  v14 = a2;
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v9 = v5;
  dispatch_async(v8, v10);

}

uint64_t __67__CSContinuousAudioFingerprintProvider__startListenWithCompletion___block_invoke_3(uint64_t a1)
{
  os_log_t *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F60];
  v3 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 56))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v5 = *(void **)(a1 + 32);
    v6 = v3;
    objc_msgSend(v5, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[CSContinuousAudioFingerprintProvider _startListenWithCompletion:]_block_invoke_3";
    v14 = 2114;
    v15 = v4;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Start audio stream successfully ? %{public}@, error : %{public}@", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "enablePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnabled");

  if ((v9 & 1) == 0)
  {
    v10 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[CSContinuousAudioFingerprintProvider _startListenWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s Received didStartRecording when Siri is off", (uint8_t *)&v12, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "_stopListening");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __83__CSContinuousAudioFingerprintProvider__startListenPollingWithInterval_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14[2];
  _BYTE location[12];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, 1, 0);
  }
  else
  {
    v7 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v10 = v7;
      objc_msgSend(v5, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[CSContinuousAudioFingerprintProvider _startListenPollingWithInterval:completion:]_block_invoke";
      v16 = 2114;
      v17 = v11;
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s listen polling has failed : %{public}@", location, 0x16u);

    }
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__CSContinuousAudioFingerprintProvider__startListenPollingWithInterval_completion___block_invoke_12;
    block[3] = &unk_1E7C29088;
    objc_copyWeak(v14, (id *)location);
    v14[1] = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 40);
    dispatch_after(v8, v9, block);

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)location);
  }

}

void __83__CSContinuousAudioFingerprintProvider__startListenPollingWithInterval_completion___block_invoke_12(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_startListenPollingWithInterval:completion:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

}

uint64_t __45__CSContinuousAudioFingerprintProvider_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

void __59__CSContinuousAudioFingerprintProvider_unregisterObserver___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "endAudio");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = 0;

  }
}

void __57__CSContinuousAudioFingerprintProvider_registerObserver___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[40];
  _BYTE v17[40];

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 == 1)
    {
      v7 = (void *)MEMORY[0x1E0D18FE8];
      objc_msgSend(MEMORY[0x1E0D190F8], "utteranceFileASBD");
      objc_msgSend(MEMORY[0x1E0D190F8], "utteranceFileASBD");
      objc_msgSend(v7, "createAudioFileWriterForAdBlockerWithInputFormat:outputFormat:withAccessoryID:", v17, v16, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 48);
      *(_QWORD *)(v9 + 48) = v8;

      v15 = 0;
      v11 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copyBufferWithNumSamplesCopiedIn:", &v15);
      v12 = v11;
      if (v11)
      {
        v13 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        v14 = objc_msgSend(objc_retainAutorelease(v11), "bytes");
        objc_msgSend(v13, "addSamples:numSamples:", v14, v15);
      }

    }
  }
}

void __53__CSContinuousAudioFingerprintProvider_stopWithUUID___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  os_log_t *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(*(id *)(a1 + 40), "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectForKey:", v6);

      v7 = (os_log_t *)MEMORY[0x1E0D18F60];
      v8 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
        v10 = v8;
        v13 = 136315394;
        v14 = "-[CSContinuousAudioFingerprintProvider stopWithUUID:]_block_invoke";
        v15 = 2048;
        v16 = objc_msgSend(v9, "count");
        _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Updated in use services for fingerprintProvider. %lu services remaining", (uint8_t *)&v13, 0x16u);

      }
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count"))
      {
        objc_msgSend(*(id *)(a1 + 32), "_setMaximumBufferSizeFromInUseServices");
        objc_msgSend(*(id *)(a1 + 32), "_reset");
      }
      else
      {
        v11 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 136315138;
          v14 = "-[CSContinuousAudioFingerprintProvider stopWithUUID:]_block_invoke";
          _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Stopping continuousFingerprintProvider", (uint8_t *)&v13, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0D19028], "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObserver:", *(_QWORD *)(a1 + 32));

        objc_msgSend(*(id *)(a1 + 32), "_stopListening");
        objc_msgSend(*(id *)(a1 + 32), "setEnablePolicy:", 0);
      }
    }
  }
}

void __76__CSContinuousAudioFingerprintProvider_startWithUUID_withMaximumBufferSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_t *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    LODWORD(v5) = *(_DWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v7, v8);

    v9 = (os_log_t *)MEMORY[0x1E0D18F60];
    v10 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      v12 = v10;
      *(_DWORD *)buf = 136315394;
      v27 = "-[CSContinuousAudioFingerprintProvider startWithUUID:withMaximumBufferSize:]_block_invoke";
      v28 = 2048;
      v29 = objc_msgSend(v11, "count");
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Updated in use services for fingerprintProvider. %lu services in use", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_setMaximumBufferSizeFromInUseServices");
    objc_msgSend(*(id *)(a1 + 32), "_reset");
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count") <= 1)
    {
      v13 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[CSContinuousAudioFingerprintProvider startWithUUID:withMaximumBufferSize:]_block_invoke";
        _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Starting continuousFingerprintProvider", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setFrameSkipRate:", objc_msgSend(v14, "overridingFrameSkipRate"));

      if (!objc_msgSend(*(id *)(a1 + 32), "frameSkipRate"))
        objc_msgSend(*(id *)(a1 + 32), "setFrameSkipRate:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setFrameSkipCounter:", 0);
      +[CSContinuousAudioFingerprintEnabledPolicyFactory continuousAudioFingerprintEnabledPolicy](CSContinuousAudioFingerprintEnabledPolicyFactory, "continuousAudioFingerprintEnabledPolicy");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setEnablePolicy:", v15);

      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "enablePolicy");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __76__CSContinuousAudioFingerprintProvider_startWithUUID_withMaximumBufferSize___block_invoke_6;
      v24[3] = &unk_1E7C26D40;
      objc_copyWeak(&v25, (id *)buf);
      objc_msgSend(v16, "setCallback:", v24);

      objc_msgSend(*(id *)(a1 + 32), "enablePolicy");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEnabled");

      if (v19)
      {
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(NSObject **)(v20 + 32);
        v23[0] = v17;
        v23[1] = 3221225472;
        v23[2] = __76__CSContinuousAudioFingerprintProvider_startWithUUID_withMaximumBufferSize___block_invoke_2;
        v23[3] = &unk_1E7C292C8;
        v23[4] = v20;
        dispatch_async(v21, v23);
      }
      objc_msgSend(MEMORY[0x1E0D19028], "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObserver:", *(_QWORD *)(a1 + 32));

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __76__CSContinuousAudioFingerprintProvider_startWithUUID_withMaximumBufferSize___block_invoke_6(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleEnablePolicyEvent:", a2);

}

uint64_t __76__CSContinuousAudioFingerprintProvider_startWithUUID_withMaximumBufferSize___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startListenPolling");
}

@end
