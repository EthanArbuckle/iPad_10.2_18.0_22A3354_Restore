@implementation CSAudioInjectionProvider

- (CSAudioInjectionProvider)init
{
  CSAudioInjectionProvider *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSHashTable *observers;
  uint64_t v7;
  NSMutableDictionary *audioInjectionEngines;
  uint64_t v9;
  NSMutableArray *connectedDevices;
  uint64_t v11;
  NSUUID *uuid;
  int v13;
  void *v14;
  uint64_t v15;
  NSString *atvRemoteDeviceID;
  CSAudioInjectionDevice *v17;
  uint64_t v18;
  CSAudioInjectionDevice **v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CSAudioInjectionProvider;
  v2 = -[CSAudioRecorder init](&v22, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSAudioInjectionProvider", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    audioInjectionEngines = v2->_audioInjectionEngines;
    v2->_audioInjectionEngines = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    connectedDevices = v2->_connectedDevices;
    v2->_connectedDevices = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v11;

    v2->_latestPluginStreamId = 2;
    v13 = CSIsTV();
    v2->_shouldSupportOnlyTVRemote = v13;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = objc_claimAutoreleasedReturnValue();
      atvRemoteDeviceID = v2->_atvRemoteDeviceID;
      v2->_atvRemoteDeviceID = (NSString *)v15;

      v17 = -[CSAudioInjectionDevice initWithDeviceType:deviceName:deviceID:productID:]([CSAudioInjectionDevice alloc], "initWithDeviceType:deviceName:deviceID:productID:", 5, CFSTR("ATVRemoteInput"), v2->_atvRemoteDeviceID, 0);
      v18 = 216;
    }
    else
    {
      v17 = -[CSAudioInjectionDevice initWithDeviceType:deviceName:deviceID:productID:]([CSAudioInjectionDevice alloc], "initWithDeviceType:deviceName:deviceID:productID:", 1, CFSTR("BuiltInMic"), 0, 0);
      v18 = 208;
    }
    v19 = (CSAudioInjectionDevice **)((char *)v2 + v18);
    v20 = *(Class *)((char *)&v2->super.super.isa + v18);
    *v19 = v17;

    -[NSMutableArray addObject:](v2->_connectedDevices, "addObject:", *v19);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  NSUUID *uuid;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  NSUUID *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSAudioInjectionProvider dealloc]";
    v8 = 2112;
    v9 = uuid;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc CSAudioInjectionProvider : %@", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSAudioInjectionProvider;
  -[CSAudioRecorder dealloc](&v5, sel_dealloc);
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CSAudioInjectionProvider_start__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_connectPluginDevice:(id)a3
{
  id v4;
  NSMutableDictionary *audioInjectionEngines;
  void *v6;
  id v7;

  v4 = a3;
  +[CSAudioInjectionEngineFactory engineWithDeviceType:streamHandleId:](CSAudioInjectionEngineFactory, "engineWithDeviceType:streamHandleId:", objc_msgSend(v4, "deviceType"), self->_latestPluginStreamId);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "start");
  objc_msgSend(v4, "setInjectionEngine:", v7);
  objc_msgSend(v7, "attachDevice:", v4);

  audioInjectionEngines = self->_audioInjectionEngines;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_latestPluginStreamId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](audioInjectionEngines, "setObject:forKey:", v7, v6);

  ++self->_latestPluginStreamId;
}

- (void)_tearDownSpeechDetectionVADIfNeeded
{
  CSAudioInjectionEngine *builtInAudioInjectionEngine;
  CSAudioInjectionEngine *v4;

  if ((CSIsWatch() & 1) == 0)
  {
    builtInAudioInjectionEngine = self->_builtInAudioInjectionEngine;
    if (builtInAudioInjectionEngine)
    {
      -[CSAudioInjectionEngine stop](builtInAudioInjectionEngine, "stop");
      v4 = self->_builtInAudioInjectionEngine;
      self->_builtInAudioInjectionEngine = 0;

      -[NSMutableDictionary removeObjectForKey:](self->_audioInjectionEngines, "removeObjectForKey:", &unk_1E7C63770);
    }
  }
}

- (void)_createSpeechDetectionVADIfNeeded
{
  void *v3;
  CSAudioInjectionBuiltInEngine *v4;
  CSAudioInjectionEngine *builtInAudioInjectionEngine;
  CSAudioInjectionDevice *builtInDevice;
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_audioInjectionEngines, "objectForKeyedSubscript:", &unk_1E7C63770);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[CSAudioInjectionBuiltInEngine initWithStreamHandleId:]([CSAudioInjectionBuiltInEngine alloc], "initWithStreamHandleId:", 1);
    builtInAudioInjectionEngine = self->_builtInAudioInjectionEngine;
    self->_builtInAudioInjectionEngine = &v4->super;

    -[CSAudioInjectionEngine setDelegate:](self->_builtInAudioInjectionEngine, "setDelegate:", self);
    -[CSAudioInjectionEngine attachDevice:](self->_builtInAudioInjectionEngine, "attachDevice:", self->_builtInDevice);
    -[CSAudioInjectionEngine start](self->_builtInAudioInjectionEngine, "start");
    -[NSMutableDictionary setObject:forKey:](self->_audioInjectionEngines, "setObject:forKey:", self->_builtInAudioInjectionEngine, &unk_1E7C63770);
    builtInDevice = self->_builtInDevice;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_audioInjectionEngines, "objectForKeyedSubscript:", &unk_1E7C63770);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CSAudioInjectionDevice setInjectionEngine:](builtInDevice, "setInjectionEngine:", v7);

  }
}

- (void)stop
{
  NSObject *v3;
  NSUUID *uuid;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  NSUUID *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSAudioInjectionProvider stop]";
    v9 = 2112;
    v10 = uuid;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Stopping Audio Injection Provider : %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CSAudioInjectionProvider_stop__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)primaryInputDevice
{
  int *v2;

  if (self->_shouldSupportOnlyTVRemote)
    v2 = &OBJC_IVAR___CSAudioInjectionProvider__bundleTvRemote;
  else
    v2 = &OBJC_IVAR___CSAudioInjectionProvider__builtInDevice;
  return *(id *)((char *)&self->super.super.isa + *v2);
}

- (void)connectDevice:(id)a3
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
    v7[2] = __42__CSAudioInjectionProvider_connectDevice___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)disconnectDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[4];
  id v8;
  CSAudioInjectionProvider *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__CSAudioInjectionProvider_disconnectDevice___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v8 = v4;
    v9 = self;
    dispatch_async(queue, v7);

  }
}

- (void)willDestroy
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CSAudioInjectionProvider;
  -[CSAudioRecorder willDestroy](&v2, sel_willDestroy);
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
  v7[2] = __45__CSAudioInjectionProvider_registerObserver___block_invoke;
  v7[3] = &unk_1E7C292A0;
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
  v7[2] = __47__CSAudioInjectionProvider_unregisterObserver___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t, _QWORD);
  NSObject *queue;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, _QWORD))a4;
  if (objc_msgSend(v6, "isPluginContext"))
  {
    if (self->_shouldSupportOnlyTVRemote)
      objc_msgSend(v6, "setDeviceId:", self->_atvRemoteDeviceID);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    queue = self->_queue;
    v15 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__CSAudioInjectionProvider_setContext_completion___block_invoke;
    block[3] = &unk_1E7C277D0;
    block[4] = self;
    v10 = v6;
    v11 = &v12;
    dispatch_async_and_wait(queue, block);
    if (v7)
      v7[2](v7, v13[3], 1, 0);

    _Block_object_dispose(&v12, 8);
  }
  else if (v7)
  {
    v7[2](v7, 1, 2, 0);
  }

}

- (BOOL)setCurrentContext:(id)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)prepareAudioStreamRecord:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__CSAudioInjectionProvider_prepareAudioStreamRecord_recordDeviceIndicator_error___block_invoke;
  v10[3] = &unk_1E7C292A0;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  dispatch_async(queue, v10);

  return 1;
}

- (BOOL)startAudioStreamWithOption:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *queue;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  float didStartDelayInSeconds;
  dispatch_time_t v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  _QWORD block[4];
  id v23;
  CSAudioInjectionProvider *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3869;
  v31 = __Block_byref_object_dispose__3870;
  v32 = 0;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__CSAudioInjectionProvider_startAudioStreamWithOption_recordDeviceIndicator_error___block_invoke;
  block[3] = &unk_1E7C28408;
  v11 = v7;
  v23 = v11;
  v24 = self;
  v26 = &v27;
  v12 = v8;
  v25 = v12;
  dispatch_async_and_wait(queue, block);
  v13 = v28[5];
  if (v13)
  {
    didStartDelayInSeconds = self->_didStartDelayInSeconds;
    if (didStartDelayInSeconds <= 0.0)
    {
      objc_msgSend((id)v28[5], "startAudioStreamWithOption:", v11);
    }
    else
    {
      v15 = dispatch_time(0, (uint64_t)(float)(didStartDelayInSeconds * 1000000000.0));
      v16 = self->_queue;
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __83__CSAudioInjectionProvider_startAudioStreamWithOption_recordDeviceIndicator_error___block_invoke_31;
      v19[3] = &unk_1E7C29228;
      v21 = &v27;
      v20 = v11;
      dispatch_after(v15, v16, v19);

    }
  }
  else
  {
    v17 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[CSAudioInjectionProvider startAudioStreamWithOption:recordDeviceIndicator:error:]";
      _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s AudioInjection Engine is nil", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v27, 8);
  return v13 != 0;
}

- (BOOL)stopAudioStreamWithRecordDeviceIndicator:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  NSUUID *uuid;
  NSObject *queue;
  id v9;
  uint64_t v10;
  _QWORD block[5];
  id v13;
  _BYTE *v14;
  _BYTE buf[24];
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSAudioInjectionProvider stopAudioStreamWithRecordDeviceIndicator:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = uuid;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Calling stop audio stream : %@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v16 = __Block_byref_object_copy__3869;
  v17 = __Block_byref_object_dispose__3870;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__CSAudioInjectionProvider_stopAudioStreamWithRecordDeviceIndicator_error___block_invoke;
  block[3] = &unk_1E7C277D0;
  v14 = buf;
  block[4] = self;
  v9 = v5;
  v13 = v9;
  dispatch_async_and_wait(queue, block);
  v10 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (v10)
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "stopAudioStream");

  _Block_object_dispose(buf, 8);
  return v10 != 0;
}

- (BOOL)isRecordingWithRecordDeviceIndicator:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  void *v7;
  char v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3869;
  v17 = __Block_byref_object_dispose__3870;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CSAudioInjectionProvider_isRecordingWithRecordDeviceIndicator___block_invoke;
  block[3] = &unk_1E7C277D0;
  v12 = &v13;
  block[4] = self;
  v6 = v4;
  v11 = v6;
  dispatch_async_and_wait(queue, block);
  v7 = (void *)v14[5];
  if (v7)
    v8 = objc_msgSend(v7, "isRecording");
  else
    v8 = 0;

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)recordRouteWithRecordDeviceIndicator:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3869;
  v16 = __Block_byref_object_dispose__3870;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CSAudioInjectionProvider_recordRouteWithRecordDeviceIndicator___block_invoke;
  block[3] = &unk_1E7C277D0;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_async_and_wait(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)recordDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4
{
  NSObject *queue;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3869;
  v12 = __Block_byref_object_dispose__3870;
  v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__CSAudioInjectionProvider_recordDeviceInfoWithStreamHandleId_recordDeviceIndicator___block_invoke;
  block[3] = &unk_1E7C26810;
  block[5] = &v8;
  block[6] = a3;
  block[4] = self;
  dispatch_async_and_wait(queue, block);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)audioDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (objc_class *)MEMORY[0x1E0D190E0];
  v7 = a4;
  v8 = [v6 alloc];
  -[CSAudioInjectionProvider recordDeviceInfoWithStreamHandleId:recordDeviceIndicator:](self, "recordDeviceInfoWithStreamHandleId:recordDeviceIndicator:", a3, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSAudioInjectionProvider getPlaybackRouteForStreamID:](self, "getPlaybackRouteForStreamID:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithRecordDeviceInfo:playbackRoute:playbackDeviceTypeList:", v9, v10, v11);

  return v12;
}

- (id)recordSettingsWithStreamHandleId:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  if (self->_shouldSupportOnlyTVRemote)
  {
    objc_msgSend(v4, "setObject:forKey:", &unk_1E7C63788, *MEMORY[0x1E0C89930]);
    objc_msgSend(v5, "setObject:forKey:", &unk_1E7C637A0, *MEMORY[0x1E0C89970]);
    objc_msgSend(v5, "setObject:forKey:", &unk_1E7C637B8, *MEMORY[0x1E0C898F0]);
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "useSpeexForAudioInjection");

    if (v7)
      v8 = &unk_1E7C637D0;
    else
      v8 = &unk_1E7C637E8;
    objc_msgSend(v5, "setObject:forKey:", v8, *MEMORY[0x1E0C898E0]);
  }
  return v5;
}

- (float)recordingSampleRateWithStreamHandleId:(unint64_t)a3
{
  float result;

  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate", a3);
  return result;
}

- (BOOL)isNarrowBandWithStreamHandleId:(unint64_t)a3
{
  return 0;
}

- (BOOL)prewarmAudioSessionWithStreamHandleId:(unint64_t)a3 error:(id *)a4
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v5, "setActive:withOptions:error:", 1, 0x2000, a4);

  return (char)a4;
}

- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  void *v7;
  char v8;
  void *v9;
  char v10;
  NSObject *v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  self->_activateStartTime = mach_absolute_time();
  if (CSIsHorseman()
    && (objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "setCategory:withOptions:error:", *MEMORY[0x1E0C89688], 1, a5),
        v7,
        (v8 & 1) == 0))
  {
    v12 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v13 = *a5;
      v14 = 136315394;
      v15 = "-[CSAudioInjectionProvider activateAudioSessionWithReason:streamHandleId:error:]";
      v16 = 2112;
      v17 = v13;
      _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s CS set AVAudioSession category/options failed with error: %@", (uint8_t *)&v14, 0x16u);
    }
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "setActive:error:", 1, a5);

    self->_activateEndTime = mach_absolute_time();
    return v10;
  }
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  void *v8;

  self->_deactivateStartTime = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v8, "setActive:withOptions:error:", 0, a3, a5);

  self->_deactivateEndTime = mach_absolute_time();
  return (char)a5;
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  void *v7;

  self->_deactivateStartTime = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "setActive:withOptions:error:", 0, a3, a4);

  self->_deactivateEndTime = mach_absolute_time();
  return (char)a4;
}

- (BOOL)setRecordMode:(int64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)duckOthersOption
{
  return 1;
}

- (id)getPlaybackRouteForStreamID:(unint64_t)a3
{
  return CFSTR("BuiltInSpeaker");
}

- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5
{
  return 1;
}

- (BOOL)playRecordStartingAlertAndResetEndpointerFromStream:(unint64_t)a3 withAlertOverride:(int64_t)a4
{
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CSAudioInjectionProvider playRecordStartingAlertAndResetEndpointerFromStream:withAlertOverride:]";
    v9 = 2048;
    v10 = a4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s playing start recording alert with override: %lu", (uint8_t *)&v7, 0x16u);
  }
  return 1;
}

- (BOOL)playAlertSoundForType:(int64_t)a3 recordDevideIndicator:(id)a4
{
  return 1;
}

- (unint64_t)alertStartTime
{
  return 0;
}

- (float)peakPowerForChannel:(unint64_t)a3
{
  return 0.0;
}

- (float)averagePowerForChannel:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)isSessionCurrentlyActivated
{
  return 0;
}

- (id)fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:(id)a3
{
  return 0;
}

- (id)metrics
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v18 = *MEMORY[0x1E0C89A20];
  v3 = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_activateStartTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v19 = *MEMORY[0x1E0C89A28];
  v5 = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_activateEndTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v18, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_deactivateStartTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v5;
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_deactivateEndTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0C89A18];
  v14[0] = *MEMORY[0x1E0C89A10];
  v14[1] = v11;
  v15[0] = v7;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)audioEngineDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  id v9;
  NSObject *queue;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  BOOL v15;

  v9 = a6;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __93__CSAudioInjectionProvider_audioEngineDidStartRecord_audioStreamHandleId_successfully_error___block_invoke;
  v12[3] = &unk_1E7C261F8;
  v13 = v9;
  v14 = a4;
  v15 = a5;
  v12[4] = self;
  v11 = v9;
  dispatch_async(queue, v12);

}

- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8
{
  id v13;
  id v14;
  NSObject *queue;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  BOOL v23;

  v13 = a5;
  v14 = a6;
  queue = self->_queue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __118__CSAudioInjectionProvider_audioEngineBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_isFileLoadedBuffer___block_invoke;
  v18[3] = &unk_1E7C24630;
  v23 = a8;
  v18[4] = self;
  v19 = v13;
  v20 = v14;
  v21 = a4;
  v22 = a7;
  v16 = v14;
  v17 = v13;
  dispatch_async(queue, v18);

}

- (void)audioEngineDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(unint64_t)a5
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__CSAudioInjectionProvider_audioEngineDidStopRecord_audioStreamHandleId_reason___block_invoke;
  block[3] = &unk_1E7C28520;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)audioEngineAudioChunkForTvAvailable:(id)a3 audioChunk:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__CSAudioInjectionProvider_audioEngineAudioChunkForTvAvailable_audioChunk___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (float)didStartDelayInSeconds
{
  return self->_didStartDelayInSeconds;
}

- (void)setDidStartDelayInSeconds:(float)a3
{
  self->_didStartDelayInSeconds = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSMutableArray)connectedDevices
{
  return self->_connectedDevices;
}

- (void)setConnectedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_connectedDevices, a3);
}

- (CSAudioInjectionDevice)builtInDevice
{
  return self->_builtInDevice;
}

- (void)setBuiltInDevice:(id)a3
{
  objc_storeStrong((id *)&self->_builtInDevice, a3);
}

- (CSAudioInjectionDevice)bundleTvRemote
{
  return self->_bundleTvRemote;
}

- (void)setBundleTvRemote:(id)a3
{
  objc_storeStrong((id *)&self->_bundleTvRemote, a3);
}

- (CSAudioInjectionEngine)builtInAudioInjectionEngine
{
  return self->_builtInAudioInjectionEngine;
}

- (void)setBuiltInAudioInjectionEngine:(id)a3
{
  objc_storeStrong((id *)&self->_builtInAudioInjectionEngine, a3);
}

- (NSMutableDictionary)audioInjectionEngines
{
  return self->_audioInjectionEngines;
}

- (void)setAudioInjectionEngines:(id)a3
{
  objc_storeStrong((id *)&self->_audioInjectionEngines, a3);
}

- (unint64_t)latestPluginStreamId
{
  return self->_latestPluginStreamId;
}

- (void)setLatestPluginStreamId:(unint64_t)a3
{
  self->_latestPluginStreamId = a3;
}

- (unint64_t)activateStartTime
{
  return self->_activateStartTime;
}

- (void)setActivateStartTime:(unint64_t)a3
{
  self->_activateStartTime = a3;
}

- (unint64_t)activateEndTime
{
  return self->_activateEndTime;
}

- (void)setActivateEndTime:(unint64_t)a3
{
  self->_activateEndTime = a3;
}

- (unint64_t)deactivateStartTime
{
  return self->_deactivateStartTime;
}

- (void)setDeactivateStartTime:(unint64_t)a3
{
  self->_deactivateStartTime = a3;
}

- (unint64_t)deactivateEndTime
{
  return self->_deactivateEndTime;
}

- (void)setDeactivateEndTime:(unint64_t)a3
{
  self->_deactivateEndTime = a3;
}

- (NSString)atvRemoteDeviceID
{
  return self->_atvRemoteDeviceID;
}

- (void)setAtvRemoteDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_atvRemoteDeviceID, a3);
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setAudioRecordContext:(id)a3
{
  objc_storeStrong((id *)&self->_audioRecordContext, a3);
}

- (BOOL)allowZeroInjection
{
  return self->_allowZeroInjection;
}

- (void)setAllowZeroInjection:(BOOL)a3
{
  self->_allowZeroInjection = a3;
}

- (BOOL)shouldSupportOnlyTVRemote
{
  return self->_shouldSupportOnlyTVRemote;
}

- (void)setShouldSupportOnlyTVRemote:(BOOL)a3
{
  self->_shouldSupportOnlyTVRemote = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_atvRemoteDeviceID, 0);
  objc_storeStrong((id *)&self->_audioInjectionEngines, 0);
  objc_storeStrong((id *)&self->_builtInAudioInjectionEngine, 0);
  objc_storeStrong((id *)&self->_bundleTvRemote, 0);
  objc_storeStrong((id *)&self->_builtInDevice, 0);
  objc_storeStrong((id *)&self->_connectedDevices, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __75__CSAudioInjectionProvider_audioEngineAudioChunkForTvAvailable_audioChunk___block_invoke(uint64_t a1)
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
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 176);
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
          objc_msgSend(v7, "audioRecorderBufferAvailable:audioStreamHandleId:buffer:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "streamHandleID", (_QWORD)v8), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __80__CSAudioInjectionProvider_audioEngineDidStopRecord_audioStreamHandleId_reason___block_invoke(_QWORD *a1)
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
  v2 = *(id *)(a1[4] + 176);
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
          objc_msgSend(v7, "audioRecorderDidStopRecord:audioStreamHandleId:reason:", a1[4], a1[5], a1[6], (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __118__CSAudioInjectionProvider_audioEngineBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_isFileLoadedBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 168))
  {
    if (!*(_BYTE *)(a1 + 72))
      return;
    *(_BYTE *)(v2 + 168) = 1;
    v2 = *(_QWORD *)(a1 + 32);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = *(id *)(v2 + 176);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = v4;
          v9 = v5;
          v10 = *(_QWORD *)(a1 + 32);
          v11 = *(_QWORD *)(a1 + 40);
          v13 = *(_QWORD *)(a1 + 48);
          v12 = *(_QWORD *)(a1 + 56);
          v14 = *(_QWORD *)(a1 + 64);
          LODWORD(v16) = objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingNumberOfChannels");
          v15 = v10;
          v5 = v9;
          v4 = v8;
          objc_msgSend(v7, "audioRecorderBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", v15, v12, v11, v13, v14, 0, v16);
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

}

void __93__CSAudioInjectionProvider_audioEngineDidStartRecord_audioStreamHandleId_successfully_error___block_invoke(uint64_t a1)
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
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 176);
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
          objc_msgSend(v7, "audioRecorderDidStartRecord:audioStreamHandleId:successfully:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __85__CSAudioInjectionProvider_recordDeviceInfoWithStreamHandleId_recordDeviceIndicator___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1[4] + 232);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *(id *)(a1[4] + 200);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "injectionEngine", (_QWORD)v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          v12 = objc_alloc(MEMORY[0x1E0D190F0]);
          objc_msgSend(v10, "deviceName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v10, "isPluginDevice");
          objc_msgSend(v10, "deviceUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "productIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v12, "initWithRoute:isRemoteDevice:remoteDeviceUID:remoteDeviceProductIdentifier:", v13, v14, v15, v16);
          v18 = *(_QWORD *)(a1[5] + 8);
          v19 = *(void **)(v18 + 40);
          *(_QWORD *)(v18 + 40) = v17;

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

void __65__CSAudioInjectionProvider_recordRouteWithRecordDeviceIndicator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 232);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "streamHandleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 200);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "injectionEngine", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          objc_msgSend(v10, "deviceName");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v14 = *(void **)(v13 + 40);
          *(_QWORD *)(v13 + 40) = v12;

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

void __65__CSAudioInjectionProvider_isRecordingWithRecordDeviceIndicator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 232);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "streamHandleId"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __75__CSAudioInjectionProvider_stopAudioStreamWithRecordDeviceIndicator_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 232);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "streamHandleId"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __83__CSAudioInjectionProvider_startAudioStreamWithOption_recordDeviceIndicator_error___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  char v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F60];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(v4 + 192);
    v6 = *(_QWORD *)(v4 + 288);
    v7 = *(const __CFString **)(a1 + 32);
    v18 = 136315906;
    v19 = "-[CSAudioInjectionProvider startAudioStreamWithOption:recordDeviceIndicator:error:]_block_invoke";
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Calling start audio stream : %@ %@, context: %@", (uint8_t *)&v18, 0x2Au);
  }
  if (CSIsIOS()
    && (v8 = a1 + 40, (v9 = *(void **)(*(_QWORD *)(a1 + 40) + 288)) != 0)
    && !objc_msgSend(v9, "isVoiceTriggered"))
  {
    v10 = 0;
  }
  else
  {
    v8 = a1 + 40;
    v10 = 1;
  }
  *(_BYTE *)(*(_QWORD *)v8 + 168) = v10;
  v11 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 168))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v18 = 136315394;
    v19 = "-[CSAudioInjectionProvider startAudioStreamWithOption:recordDeviceIndicator:error:]_block_invoke";
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s allowZeroInjection : %@", (uint8_t *)&v18, 0x16u);
  }
  v13 = *(void **)(*(_QWORD *)(a1 + 40) + 232);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "streamHandleId"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

uint64_t __83__CSAudioInjectionProvider_startAudioStreamWithOption_recordDeviceIndicator_error___block_invoke_31(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "startAudioStreamWithOption:", *(_QWORD *)(a1 + 32));
}

void __81__CSAudioInjectionProvider_prepareAudioStreamRecord_recordDeviceIndicator_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "recordContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v1, "setAudioRecordContext:", v2);

}

void __50__CSAudioInjectionProvider_setContext_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 200);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v7, "isPluginDevice", (_QWORD)v12))
        {
          objc_msgSend(v7, "deviceID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "deviceId");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "isEqualToString:", v9);

          if (v10)
          {
            objc_msgSend(v7, "injectionEngine");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v11, "audioStreamHandleId");

          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __47__CSAudioInjectionProvider_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __45__CSAudioInjectionProvider_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "addObject:", *(_QWORD *)(a1 + 40));
}

void __45__CSAudioInjectionProvider_disconnectDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "injectionEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "audioStreamHandleId");
    objc_msgSend(v3, "stop");
    objc_msgSend(v3, "setDelegate:", 0);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = *(id *)(*(_QWORD *)(a1 + 40) + 176);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "audioRecorderStreamHandleIdInvalidated:", v4, (_QWORD)v13);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = *(void **)(*(_QWORD *)(a1 + 40) + 232);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v12);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 200), "removeObject:", *(_QWORD *)(a1 + 32), (_QWORD)v13);
  if (objc_msgSend(*(id *)(a1 + 32), "deviceType") == 6)
    objc_msgSend(*(id *)(a1 + 40), "_createSpeechDetectionVADIfNeeded");

}

uint64_t __42__CSAudioInjectionProvider_connectDevice___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "addObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 40), "isPluginDevice"))
    objc_msgSend(*(id *)(a1 + 32), "_connectPluginDevice:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "deviceType");
  if (result == 6)
    return objc_msgSend(*(id *)(a1 + 32), "_tearDownSpeechDetectionVADIfNeeded");
  return result;
}

void __32__CSAudioInjectionProvider_stop__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 232);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stop");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "removeAllObjects");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 176);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "audioRecorderStreamHandleIdInvalidated:", 1);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v10);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = *(id *)(*(_QWORD *)(a1 + 32) + 176);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v18);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "audioRecorderWillBeDestroyed:", *(_QWORD *)(a1 + 32), (_QWORD)v20);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v16);
  }

}

void __33__CSAudioInjectionProvider_start__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
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
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 200);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "deviceType", (_QWORD)v9) == 1)
        {
          objc_msgSend(*(id *)(a1 + 32), "_createSpeechDetectionVADIfNeeded");
        }
        else if (objc_msgSend(v8, "isPluginDevice"))
        {
          objc_msgSend(*(id *)(a1 + 32), "_connectPluginDevice:", v8);
          v5 = 1;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);

    if ((v5 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "_tearDownSpeechDetectionVADIfNeeded");
  }
  else
  {

  }
}

+ (id)defaultInjectionProvider
{
  if (defaultInjectionProvider_onceToken != -1)
    dispatch_once(&defaultInjectionProvider_onceToken, &__block_literal_global_3905);
  return (id)defaultInjectionProvider_sharedInstance;
}

void __52__CSAudioInjectionProvider_defaultInjectionProvider__block_invoke()
{
  CSAudioInjectionProvider *v0;
  void *v1;

  v0 = objc_alloc_init(CSAudioInjectionProvider);
  v1 = (void *)defaultInjectionProvider_sharedInstance;
  defaultInjectionProvider_sharedInstance = (uint64_t)v0;

}

@end
