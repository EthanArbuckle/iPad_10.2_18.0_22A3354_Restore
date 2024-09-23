@implementation CSAudioInjectionRemoraEngine

- (CSAudioInjectionRemoraEngine)initWithStreamHandleId:(unint64_t)a3
{
  CSAudioInjectionRemoraEngine *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSUUID *uuid;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  int v13;
  double v14;
  double v15;
  uint64_t v16;
  CSAudioCircularBuffer *circularBuffer;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CSAudioInjectionRemoraEngine;
  v4 = -[CSAudioInjectionEngine initWithStreamHandleId:](&v19, sel_initWithStreamHandleId_);
  if (v4)
  {
    v5 = dispatch_queue_create("CSAudioInjectionRemoraEngine", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    v4->_voiceTriggerEnabled = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    uuid = v4->_uuid;
    v4->_uuid = (NSUUID *)v7;

    objc_msgSend(MEMORY[0x1E0D19068], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "converterForAudioStreamId:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0D18FD8]);
    v12 = objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingNumberOfChannels");
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    LODWORD(v14) = v13;
    LODWORD(v15) = 3.0;
    v16 = objc_msgSend(v11, "initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:", v12, v10, v15, v14);
    circularBuffer = v4->_circularBuffer;
    v4->_circularBuffer = (CSAudioCircularBuffer *)v16;

  }
  return v4;
}

- (BOOL)isAlwaysOnVoiceTriggerAvailable
{
  return 1;
}

- (void)setAlwaysOnVoiceTriggerEnabled:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__CSAudioInjectionRemoraEngine_setAlwaysOnVoiceTriggerEnabled___block_invoke;
  v4[3] = &unk_1E7C28480;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (BOOL)alwaysOnVoiceTriggerEnabled
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
  v5[2] = __59__CSAudioInjectionRemoraEngine_alwaysOnVoiceTriggerEnabled__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)attachDevice:(id)a3
{
  id v4;
  int v5;
  _BOOL8 v6;

  v4 = a3;
  -[CSAudioInjectionRemoraEngine setConnectedDevice:](self, "setConnectedDevice:", v4);
  v5 = objc_msgSend(v4, "enableAlwaysOnVoiceTrigger");

  v6 = v5 && -[CSAudioInjectionRemoraEngine isAlwaysOnVoiceTriggerAvailable](self, "isAlwaysOnVoiceTriggerAvailable");
  -[CSAudioInjectionRemoraEngine setAlwaysOnVoiceTriggerEnabled:](self, "setAlwaysOnVoiceTriggerEnabled:", v6);
}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSAudioInjectionRemoraEngine;
  v4 = a3;
  -[CSAudioInjectionEngine setDelegate:](&v5, sel_setDelegate_, self);
  objc_storeWeak((id *)&self->_delegate, v4);

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
    v7 = "-[CSAudioInjectionRemoraEngine dealloc]";
    v8 = 2112;
    v9 = uuid;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc CSAudioInjectionEngineRemoraEngine : %@", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSAudioInjectionRemoraEngine;
  -[CSAudioInjectionEngine dealloc](&v5, sel_dealloc);
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CSAudioInjectionRemoraEngine_start__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CSAudioInjectionRemoraEngine_stop__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)injectAudio:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSAudioInjectionRemoraEngine;
  return -[CSAudioInjectionEngine injectAudio:](&v4, sel_injectAudio_, a3);
}

- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSAudioInjectionRemoraEngine;
  return -[CSAudioInjectionEngine injectAudio:withScaleFactor:playbackStarted:completion:](&v7, sel_injectAudio_withScaleFactor_playbackStarted_completion_, a3, a5, a6);
}

- (BOOL)isRecording
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
  v5[2] = __43__CSAudioInjectionRemoraEngine_isRecording__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)startAudioStreamWithOption:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CSAudioInjectionRemoraEngine_startAudioStreamWithOption___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopAudioStream
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CSAudioInjectionRemoraEngine_stopAudioStream__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8
{
  id v12;
  NSObject *queue;
  id v14;
  _QWORD block[4];
  id v16;
  CSAudioInjectionRemoraEngine *v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;

  v12 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __122__CSAudioInjectionRemoraEngine_audioEngineBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_isFileLoadedBuffer___block_invoke;
  block[3] = &unk_1E7C25C70;
  v16 = v12;
  v17 = self;
  v18 = a4;
  v19 = a7;
  v20 = a8;
  v14 = v12;
  dispatch_async(queue, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSAudioInjectionEngineDelegate)delegate
{
  return (CSAudioInjectionEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CSKeywordAnalyzerNDAPI)keywordAnalyzer
{
  return self->_keywordAnalyzer;
}

- (void)setKeywordAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_keywordAnalyzer, a3);
}

- (CSAudioCircularBuffer)circularBuffer
{
  return self->_circularBuffer;
}

- (void)setCircularBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_circularBuffer, a3);
}

- (unint64_t)lastDetectedVoiceTriggerBeginSampleCount
{
  return self->_lastDetectedVoiceTriggerBeginSampleCount;
}

- (void)setLastDetectedVoiceTriggerBeginSampleCount:(unint64_t)a3
{
  self->_lastDetectedVoiceTriggerBeginSampleCount = a3;
}

- (unint64_t)lastForwardedSampleCount
{
  return self->_lastForwardedSampleCount;
}

- (void)setLastForwardedSampleCount:(unint64_t)a3
{
  self->_lastForwardedSampleCount = a3;
}

- (BOOL)voiceTriggerEnabled
{
  return self->_voiceTriggerEnabled;
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
  self->_voiceTriggerEnabled = a3;
}

- (CSAudioInjectionDevice)connectedDevice
{
  return (CSAudioInjectionDevice *)objc_loadWeakRetained((id *)&self->_connectedDevice);
}

- (void)setConnectedDevice:(id)a3
{
  objc_storeWeak((id *)&self->_connectedDevice, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)isForwarding
{
  return self->_isForwarding;
}

- (void)setIsForwarding:(BOOL)a3
{
  self->_isForwarding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_connectedDevice);
  objc_storeStrong((id *)&self->_circularBuffer, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

unint64_t __122__CSAudioInjectionRemoraEngine_audioEngineBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_isFileLoadedBuffer___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  id v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  float v23;
  double v24;
  unint64_t result;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  double v29;
  double v30;
  float v31;
  void *v32;
  double v33;
  double v34;
  float v35;
  uint64_t v36;
  id v37;
  char v38;
  id v39;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = v2 / objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingNumberOfChannels");
  v4 = v3 / objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleByteDepth");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "addSamples:numSamples:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), v4);
  v5 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v5 + 160) && !*(_BYTE *)(v5 + 161))
  {
    v6 = objc_alloc(MEMORY[0x1E0D18FC8]);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingNumberOfChannels");
    v9 = (void *)objc_msgSend(v6, "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:remoteVAD:", v7, v8, v4, objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleByteDepth"), 0, 0, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "getBestAnalyzedResultsFromAudioChunk:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bestScore");
    v12 = v11;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "getThreshold");
    if (v12 >= v13)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200) = objc_msgSend(v10, "bestStart");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "reset");
      v14 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
      objc_msgSend(MEMORY[0x1E0D190A8], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D190A0];
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 216));
      objc_msgSend(WeakRetained, "deviceID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "remoraVoiceTriggerEvent:activationInfo:hostTime:", v18, 0, mach_absolute_time());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "notifyActivationEvent:completion:", v19, &__block_literal_global_11628);

    }
  }
  while (1)
  {
    v20 = (double)*(unint64_t *)(*(_QWORD *)(a1 + 40) + 208);
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
    v22 = v21;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v24 = v20 + v22 * v23;
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "sampleCount");
    if (v24 >= (double)result)
      break;
    v26 = *(_QWORD *)(a1 + 40);
    v27 = *(void **)(v26 + 192);
    v28 = *(_QWORD *)(v26 + 208);
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
    v30 = v29;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    objc_msgSend(v27, "copybufferFrom:to:", v28, (unint64_t)((double)v28 + v30 * v31));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
    v34 = v33;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208) = (unint64_t)((double)*(unint64_t *)(*(_QWORD *)(a1 + 40)
                                                                                               + 208)
                                                                 + v34 * v35);
    v36 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v36 + 161))
    {
      v37 = objc_loadWeakRetained((id *)(v36 + 176));
      v38 = objc_opt_respondsToSelector();

      if ((v38 & 1) != 0)
      {
        v39 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 176));
        objc_msgSend(v39, "audioEngineBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:isFileLoadedBuffer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v32, 0, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));

      }
    }

  }
  return result;
}

void __47__CSAudioInjectionRemoraEngine_stopAudioStream__block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 161) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = 0;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
    objc_msgSend(v4, "audioEngineDidStopRecord:audioStreamHandleId:reason:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"), 0);

  }
}

void __59__CSAudioInjectionRemoraEngine_startAudioStreamWithOption___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  id WeakRetained;
  char v6;
  id v7;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 161) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "sampleCount");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 200);
  if (v3)
  {
    if (v3 >> 6 <= 0x7C)
      v4 = 0;
    else
      v4 = v3 - 8000;
    *(_QWORD *)(v2 + 208) = v4;
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 184), "reset");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
    objc_msgSend(v7, "audioEngineDidStartRecord:audioStreamHandleId:successfully:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"), 1, 0);

  }
}

uint64_t __43__CSAudioInjectionRemoraEngine_isRecording__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 161);
  return result;
}

uint64_t __36__CSAudioInjectionRemoraEngine_stop__block_invoke(uint64_t a1)
{
  objc_super v3;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)CSAudioInjectionRemoraEngine;
  objc_msgSendSuper2(&v4, sel_stopAudioStream);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)CSAudioInjectionRemoraEngine;
  objc_msgSendSuper2(&v3, sel_stop);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "reset");
}

void __37__CSAudioInjectionRemoraEngine_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  objc_super v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)CSAudioInjectionRemoraEngine;
  objc_msgSendSuper2(&v15, sel_start);
  objc_msgSend(MEMORY[0x1E0D18FC0], "defaultFallBackAssetForVoiceTrigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19290], "decodeConfigFrom:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D19138]);
  objc_msgSend(v3, "configPathNDAPI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourcePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "initWithConfigPath:resourcePath:", v5, v6);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 184);
  *(_QWORD *)(v8 + 184) = v7;

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  if (!v10)
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSAudioInjectionRemoraEngine start]_block_invoke";
      _os_log_fault_impl(&dword_1C2614000, v11, OS_LOG_TYPE_FAULT, "%s Failed to create NDAPI", buf, 0xCu);
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
    }
    else
    {
      v10 = 0;
    }
  }
  objc_msgSend(v10, "setActiveChannel:", 0);
  v12 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = v12;
  v14.super_class = (Class)CSAudioInjectionRemoraEngine;
  objc_msgSendSuper2(&v14, sel_startAudioStreamWithOption_, v13);

}

uint64_t __59__CSAudioInjectionRemoraEngine_alwaysOnVoiceTriggerEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 160);
  return result;
}

uint64_t __63__CSAudioInjectionRemoraEngine_setAlwaysOnVoiceTriggerEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 160) = *(_BYTE *)(result + 40);
  return result;
}

@end
