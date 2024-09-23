@implementation CSRawAudioInjectionProvider

- (CSRawAudioInjectionProvider)init
{
  os_log_t *v3;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *queue;
  NSHashTable *v7;
  NSHashTable *observers;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0D18F38];
  v4 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[CSRawAudioInjectionProvider init]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Initializing CSRawAudioInjectionProvider", (uint8_t *)&v11, 0xCu);
  }
  if (self)
  {
    v5 = (OS_dispatch_queue *)dispatch_queue_create("CSRawAudioInjectionProvider", 0);
    queue = self->_queue;
    self->_queue = v5;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    observers = self->_observers;
    self->_observers = v7;

  }
  v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[CSRawAudioInjectionProvider init]";
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Done initializing CSRawAudioInjectionProvider", (uint8_t *)&v11, 0xCu);
  }
  return self;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSRawAudioInjectionProvider dealloc]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc CSRawAudioInjectionProvider", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSRawAudioInjectionProvider;
  -[CSAudioRecorder dealloc](&v4, sel_dealloc);
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
  v7[2] = __48__CSRawAudioInjectionProvider_registerObserver___block_invoke;
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
  v7[2] = __50__CSRawAudioInjectionProvider_unregisterObserver___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setContext:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, uint64_t, _QWORD);
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, uint64_t, uint64_t, _QWORD))a4;
  v7 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[CSRawAudioInjectionProvider setContext:completion:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Calling StreamId for : %@", (uint8_t *)&v8, 0x16u);
  }
  if (v6)
    v6[2](v6, 1, 2, 0);

}

- (BOOL)setCurrentContext:(id)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  id v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[CSRawAudioInjectionProvider setCurrentContext:streamHandleId:error:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Calling StreamId for : %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

- (BOOL)prepareAudioStreamRecord:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5
{
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSRawAudioInjectionProvider prepareAudioStreamRecord:recordDeviceIndicator:error:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Calling prepare", (uint8_t *)&v7, 0xCu);
  }
  return 1;
}

- (BOOL)startAudioStreamWithOption:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[CSRawAudioInjectionProvider startAudioStreamWithOption:recordDeviceIndicator:error:]";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Calling start audio stream : %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__CSRawAudioInjectionProvider_startAudioStreamWithOption_recordDeviceIndicator_error___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);

  return 1;
}

- (void)_readAudioBufferAndFeed
{
  id v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 1280);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (fread((void *)objc_msgSend(v3, "bytes"), 1uLL, 0x500uLL, self->_fp) <= 0x4FF)
    fseek(self->_fp, 44, 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_observers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          LODWORD(v10) = 1;
          objc_msgSend(v9, "audioRecorderBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", self, 1, v3, 0, mach_absolute_time(), 0, v10);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (BOOL)stopAudioStreamWithRecordDeviceIndicator:(id)a3 error:(id *)a4
{
  NSObject *v5;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CSRawAudioInjectionProvider stopAudioStreamWithRecordDeviceIndicator:error:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Calling stop audio stream", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CSRawAudioInjectionProvider_stopAudioStreamWithRecordDeviceIndicator_error___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
  return 1;
}

- (BOOL)isRecordingWithRecordDeviceIndicator:(id)a3
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSRawAudioInjectionProvider isRecordingWithRecordDeviceIndicator:]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Calling isRecording", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (id)recordRouteWithRecordDeviceIndicator:(id)a3
{
  return CFSTR("RawAudioInjection");
}

- (id)recordDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4
{
  return 0;
}

- (id)audioDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4
{
  return 0;
}

- (id)recordSettingsWithStreamHandleId:(unint64_t)a3
{
  return (id)MEMORY[0x1E0C9AA70];
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
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSRawAudioInjectionProvider prewarmAudioSessionWithStreamHandleId:error:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Calling prewarm", (uint8_t *)&v6, 0xCu);
  }
  return 1;
}

- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSRawAudioInjectionProvider activateAudioSessionWithReason:streamHandleId:error:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Calling activate audio session", (uint8_t *)&v7, 0xCu);
  }
  return 1;
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  return 1;
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
  v5 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CSRawAudioInjectionProvider playRecordStartingAlertAndResetEndpointerFromStream:withAlertOverride:]";
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
  return 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (OS_dispatch_source)audioFeedTimer
{
  return self->_audioFeedTimer;
}

- (void)setAudioFeedTimer:(id)a3
{
  objc_storeStrong((id *)&self->_audioFeedTimer, a3);
}

- (__sFILE)fp
{
  return self->_fp;
}

- (void)setFp:(__sFILE *)a3
{
  self->_fp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFeedTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __78__CSRawAudioInjectionProvider_stopAudioStreamWithRecordDeviceIndicator_error___block_invoke(uint64_t a1)
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
          objc_msgSend(v7, "audioRecorderDidStopRecord:audioStreamHandleId:reason:", *(_QWORD *)(a1 + 32), 1, 1, (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __86__CSRawAudioInjectionProvider_startAudioStreamWithOption_recordDeviceIndicator_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  FILE *v3;
  dispatch_source_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD handler[4];
  id v18;
  id location;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = fopen("/var/mobile/darwin_test.wav", "rb");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(FILE **)(v2 + 192);
  if (v3)
  {
    fseek(v3, 44, 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v2 + 168));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v4;

  dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 184), 0, 0x2625A00uLL, 0x5F5E100uLL);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 184);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __86__CSRawAudioInjectionProvider_startAudioStreamWithOption_recordDeviceIndicator_error___block_invoke_2;
  handler[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v18, &location);
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 184));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 176);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "audioRecorderDidStartRecord:audioStreamHandleId:successfully:error:", *(_QWORD *)(a1 + 32), 1, 1, 0, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    }
    while (v9);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __86__CSRawAudioInjectionProvider_startAudioStreamWithOption_recordDeviceIndicator_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_readAudioBufferAndFeed");

}

uint64_t __50__CSRawAudioInjectionProvider_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__CSRawAudioInjectionProvider_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "addObject:", *(_QWORD *)(a1 + 40));
}

@end
