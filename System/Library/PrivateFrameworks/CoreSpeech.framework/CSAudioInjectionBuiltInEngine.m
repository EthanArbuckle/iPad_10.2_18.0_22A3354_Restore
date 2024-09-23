@implementation CSAudioInjectionBuiltInEngine

- (CSAudioInjectionBuiltInEngine)initWithStreamHandleId:(unint64_t)a3
{
  CSAudioInjectionBuiltInEngine *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  CSAudioCircularBuffer *circularBuffer;
  uint64_t v16;
  NSUUID *uuid;
  uint64_t v18;
  NSMutableArray *hostTimeBuffer;
  NSDictionary *userIntentOptions;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CSAudioInjectionBuiltInEngine;
  v3 = -[CSAudioInjectionEngine initWithStreamHandleId:](&v22, sel_initWithStreamHandleId_, a3);
  if (v3)
  {
    v4 = dispatch_queue_create("CSAudioInjectionBuiltInEngine", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v3->_voiceTriggerEnabled = 0;
    v6 = objc_alloc(MEMORY[0x1E0D18FD8]);
    v7 = objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingNumberOfChannels");
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0D19068], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "converterForAudioStreamId:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 3.0;
    LODWORD(v13) = v9;
    v14 = objc_msgSend(v6, "initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:", v7, v11, v12, v13);
    circularBuffer = v3->_circularBuffer;
    v3->_circularBuffer = (CSAudioCircularBuffer *)v14;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = objc_claimAutoreleasedReturnValue();
    uuid = v3->_uuid;
    v3->_uuid = (NSUUID *)v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    hostTimeBuffer = v3->_hostTimeBuffer;
    v3->_hostTimeBuffer = (NSMutableArray *)v18;

    userIntentOptions = v3->_userIntentOptions;
    v3->_userIntentOptions = 0;

  }
  return v3;
}

- (void)setAlwaysOnVoiceTriggerEnabled:(BOOL)a3
{
  NSObject *queue;
  _QWORD v6[5];
  BOOL v7;

  if (CSHasAOP())
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__CSAudioInjectionBuiltInEngine_setAlwaysOnVoiceTriggerEnabled___block_invoke;
    v6[3] = &unk_1E7C28480;
    v6[4] = self;
    v7 = a3;
    dispatch_async(queue, v6);
  }
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
  v5[2] = __60__CSAudioInjectionBuiltInEngine_alwaysOnVoiceTriggerEnabled__block_invoke;
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
  -[CSAudioInjectionBuiltInEngine setConnectedDevice:](self, "setConnectedDevice:", v4);
  v5 = objc_msgSend(v4, "enableAlwaysOnVoiceTrigger");

  v6 = v5 && -[CSAudioInjectionBuiltInEngine isAlwaysOnVoiceTriggerAvailable](self, "isAlwaysOnVoiceTriggerAvailable");
  -[CSAudioInjectionBuiltInEngine setAlwaysOnVoiceTriggerEnabled:](self, "setAlwaysOnVoiceTriggerEnabled:", v6);
}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSAudioInjectionBuiltInEngine;
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
    v7 = "-[CSAudioInjectionBuiltInEngine dealloc]";
    v8 = 2112;
    v9 = uuid;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc CSAudioInjectionEngine : %@", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSAudioInjectionBuiltInEngine;
  -[CSAudioInjectionEngine dealloc](&v5, sel_dealloc);
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CSAudioInjectionBuiltInEngine_start__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)setUserIntentOptions:(id)a3
{
  objc_storeStrong((id *)&self->_userIntentOptions, a3);
}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CSAudioInjectionBuiltInEngine_stop__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)injectAudio:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSAudioInjectionBuiltInEngine;
  return -[CSAudioInjectionEngine injectAudio:](&v4, sel_injectAudio_, a3);
}

- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSAudioInjectionBuiltInEngine;
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
  v5[2] = __44__CSAudioInjectionBuiltInEngine_isRecording__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)getBestSampleCountWithOption:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t lastForwardedSampleCount;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v17;
  NSUUID *uuid;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  NSUUID *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_lastForwardedSampleCount = -[CSAudioCircularBuffer sampleCount](self->_circularBuffer, "sampleCount");
  if (objc_msgSend(v4, "requestHistoricalAudioDataWithHostTime"))
  {
    v5 = 10000000000;
    v20 = v4;
    v6 = objc_msgSend(v4, "startRecordingHostTime");
    lastForwardedSampleCount = -[CSAudioCircularBuffer sampleCount](self->_circularBuffer, "sampleCount");
    if ((int)-[NSMutableArray count](self->_hostTimeBuffer, "count") < 1)
    {
      v15 = 10000000000;
    }
    else
    {
      v8 = 0;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_hostTimeBuffer, "objectAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SampleCount"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntValue");

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HostTime"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedLongLongValue");
        v14 = v13 - v6;
        if (v13 - v6 >= v5)
          v14 = v5;
        if (v13 >= v6)
          v15 = v14;
        else
          v15 = v5;
        if (v13 - v6 <= v5 && v13 >= v6)
          lastForwardedSampleCount = v11;

        ++v8;
        v5 = v15;
      }
      while (v8 < (int)-[NSMutableArray count](self->_hostTimeBuffer, "count"));
    }
    v17 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      uuid = self->_uuid;
      *(_DWORD *)buf = 136315906;
      v22 = "-[CSAudioInjectionBuiltInEngine getBestSampleCountWithOption:]";
      v23 = 2048;
      v24 = v15;
      v25 = 2048;
      v26 = lastForwardedSampleCount;
      v27 = 2112;
      v28 = uuid;
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s Looking up audio diff:%llu sampleCount:%llu %@", buf, 0x2Au);
    }
    v4 = v20;
  }
  else
  {
    lastForwardedSampleCount = self->_lastForwardedSampleCount;
  }

  return lastForwardedSampleCount;
}

- (void)startAudioStreamWithOption:(id)a3
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
  v7[2] = __60__CSAudioInjectionBuiltInEngine_startAudioStreamWithOption___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)stopAudioStream
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSAudioInjectionBuiltInEngine_stopAudioStream__block_invoke;
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
  CSAudioInjectionBuiltInEngine *v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;

  v12 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __123__CSAudioInjectionBuiltInEngine_audioEngineBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_isFileLoadedBuffer___block_invoke;
  block[3] = &unk_1E7C25C70;
  v16 = v12;
  v17 = self;
  v18 = a7;
  v19 = a4;
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

- (CSKeywordAnalyzerNDEAPI)keywordAnalyzer
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

- (unint64_t)lastForwardedSampleCount
{
  return self->_lastForwardedSampleCount;
}

- (void)setLastForwardedSampleCount:(unint64_t)a3
{
  self->_lastForwardedSampleCount = a3;
}

- (NSMutableArray)hostTimeBuffer
{
  return self->_hostTimeBuffer;
}

- (void)setHostTimeBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_hostTimeBuffer, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
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

- (BOOL)isForwarding
{
  return self->_isForwarding;
}

- (void)setIsForwarding:(BOOL)a3
{
  self->_isForwarding = a3;
}

- (unint64_t)voiceTriggerSampleCount
{
  return self->_voiceTriggerSampleCount;
}

- (void)setVoiceTriggerSampleCount:(unint64_t)a3
{
  self->_voiceTriggerSampleCount = a3;
}

- (NSDictionary)userIntentOptions
{
  return self->_userIntentOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIntentOptions, 0);
  objc_destroyWeak((id *)&self->_connectedDevice);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_hostTimeBuffer, 0);
  objc_storeStrong((id *)&self->_circularBuffer, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __123__CSAudioInjectionBuiltInEngine_audioEngineBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_isFileLoadedBuffer___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  char v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  float v27;
  float v28;
  double v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  float v46;
  double v47;
  double v48;
  _QWORD *v49;
  void *v50;
  unint64_t v51;
  double v52;
  double v53;
  float v54;
  void *v55;
  double v56;
  double v57;
  float v58;
  uint64_t v59;
  id WeakRetained;
  char v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  _QWORD v66[2];
  _QWORD v67[2];
  const __CFString *v68;
  void *v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  double v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  _QWORD v78[2];
  _QWORD v79[4];

  v79[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = v2 / objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingNumberOfChannels");
  v78[0] = CFSTR("SampleCount");
  v4 = v3 / objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleByteDepth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "sampleCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v5;
  v78[1] = CFSTR("HostTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
  v7 = objc_claimAutoreleasedReturnValue();

  v65 = (void *)v7;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "addObject:", v7);
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "count") >= 0x65)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "removeObjectAtIndex:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "addSamples:numSamples:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), v4);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 160))
  {
    v8 = objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat");
    v9 = objc_msgSend(MEMORY[0x1E0D19260], "isIOSDeviceSupportingBargeIn");
    v10 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      if ((v9 & 1) != 0)
        objc_msgSend(MEMORY[0x1E0D19100], "applyNegative20dBGainToFloatBuffer:", v10);
      else
        objc_msgSend(MEMORY[0x1E0D19100], "applyNegative32dBGainToFloatBuffer:", v10);
    }
    else if ((v9 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D19100], "applyNegative20dBGainToShortBuffer:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D19100], "applyNegative32dBGainToShortBuffer:", v10);
    }
    v11 = objc_alloc(MEMORY[0x1E0D18FC8]);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingNumberOfChannels");
    v14 = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") >> 1;
    v15 = (void *)objc_msgSend(v11, "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:remoteVAD:", v12, v13, v14 / objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingNumberOfChannels"), 2, 0, 0, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "processAudioChunk:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "firstPassDebuggingEnabled");

    if (v18)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "getLastResult");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)*MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        {
          v21 = v20;
          objc_msgSend(v19, "bestScore");
          *(_DWORD *)buf = 136315906;
          v71 = "-[CSAudioInjectionBuiltInEngine audioEngineBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:i"
                "sFileLoadedBuffer:]_block_invoke";
          v72 = 2048;
          v73 = v22;
          v74 = 2048;
          v75 = objc_msgSend(v19, "bestStart");
          v76 = 2048;
          v77 = objc_msgSend(v19, "bestEnd");
          _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s First Pass Score : %f, First Pass Best Start : %llu, First Pass Best End : %llu", buf, 0x2Au);

        }
      }

    }
    if (v16 && (objc_msgSend(v16, "isEarlyDetect") & 1) == 0)
    {
      v23 = objc_msgSend(v16, "bestEnd");
      v24 = objc_msgSend(v16, "bestStart");
      v25 = *(_QWORD *)(a1 + 48);
      v26 = (void *)MEMORY[0x1E0D19118];
      v27 = (float)(unint64_t)(v23 - v24);
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      *(float *)&v29 = v27 / v28;
      v30 = v25 - objc_msgSend(v26, "secondsToHostTime:", v29);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "reset");
      v31 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
      v68 = CFSTR("trigger-time");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v32;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "userIntentOptions");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = (void *)v34;
        v64 = v30;
        objc_msgSend(*(id *)(a1 + 40), "userIntentOptions");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("bypassVoiceTrigger"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isEqual:", MEMORY[0x1E0C9AAB0]);

        if (v38)
        {
          v66[0] = CFSTR("trigger-time");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v64);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v66[1] = CFSTR("bypassVoiceTrigger");
          v67[0] = v39;
          v67[1] = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
          v40 = objc_claimAutoreleasedReturnValue();

          v33 = (void *)v40;
        }
      }
      objc_msgSend(MEMORY[0x1E0D190A8], "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D190A0], "builtInMicVoiceTriggerEvent:hostTime:", v33, mach_absolute_time());
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "notifyActivationEvent:completion:", v42, 0);

    }
  }
  while (1)
  {
    v43 = (double)*(unint64_t *)(*(_QWORD *)(a1 + 40) + 200);
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
    v45 = v44;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v47 = v43 + v45 * v46;
    v48 = (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "sampleCount");
    v49 = *(_QWORD **)(a1 + 40);
    if (v47 >= v48)
      break;
    v50 = (void *)v49[24];
    v51 = v49[25];
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
    v53 = v52;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    objc_msgSend(v50, "copybufferFrom:to:", v51, (unint64_t)((double)v51 + v53 * v54));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
    v57 = v56;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200) = (unint64_t)((double)*(unint64_t *)(*(_QWORD *)(a1 + 40)
                                                                                               + 200)
                                                                 + v57 * v58);
    v59 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v59 + 161))
    {
      WeakRetained = objc_loadWeakRetained((id *)(v59 + 176));
      v61 = objc_opt_respondsToSelector();

      if ((v61 & 1) != 0)
      {
        v62 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 176));
        objc_msgSend(v62, "audioEngineBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:isFileLoadedBuffer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v55, 0, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));

      }
    }

  }
  objc_msgSend(v49, "userIntentOptions");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
    objc_msgSend(*(id *)(a1 + 40), "setUserIntentOptions:", 0);

}

void __48__CSAudioInjectionBuiltInEngine_stopAudioStream__block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 161) = 0;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
    objc_msgSend(v4, "audioEngineDidStopRecord:audioStreamHandleId:reason:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"), 0);

  }
}

void __60__CSAudioInjectionBuiltInEngine_startAudioStreamWithOption___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = objc_msgSend(*(id *)(a1 + 32), "getBestSampleCountWithOption:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 161) = 1;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
    objc_msgSend(v4, "audioEngineDidStartRecord:audioStreamHandleId:successfully:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"), 1, 0);

  }
}

uint64_t __44__CSAudioInjectionBuiltInEngine_isRecording__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 161);
  return result;
}

uint64_t __37__CSAudioInjectionBuiltInEngine_stop__block_invoke(uint64_t a1)
{
  objc_super v3;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)CSAudioInjectionBuiltInEngine;
  objc_msgSendSuper2(&v4, sel_stopAudioStream);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)CSAudioInjectionBuiltInEngine;
  objc_msgSendSuper2(&v3, sel_stop);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "reset");
}

void __38__CSAudioInjectionBuiltInEngine_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v30.receiver = *(id *)(a1 + 32);
  v30.super_class = (Class)CSAudioInjectionBuiltInEngine;
  objc_msgSendSuper2(&v30, sel_start);
  v2 = dispatch_group_create();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  dispatch_group_enter(v2);
  v3 = (os_log_t *)MEMORY[0x1E0D18F60];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[CSAudioInjectionBuiltInEngine start]_block_invoke";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Entering assets query for AOP model in audio injection", buf, 0xCu);
  }
  +[CSVoiceTriggerAssetHandler sharedHandler](CSVoiceTriggerAssetHandler, "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __38__CSAudioInjectionBuiltInEngine_start__block_invoke_18;
  v21[3] = &unk_1E7C24F00;
  v23 = &v24;
  v6 = v2;
  v22 = v6;
  objc_msgSend(v5, "getVoiceTriggerAssetWithEndpointId:completion:", 0, v21);

  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[CSAudioInjectionBuiltInEngine start]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Done with assets query for AOP model in audio injection", buf, 0xCu);
  }
  v8 = (void *)v25[5];
  if (v8)
  {
    objc_msgSend(v8, "RTModelWithFallbackLanguage:", CFSTR("en-US"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0D19140]);
    objc_msgSend(v9, "modelData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithBlob:", v11);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 184);
    *(_QWORD *)(v13 + 184) = v12;

    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
    if (!v15)
    {
      v16 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[CSAudioInjectionBuiltInEngine start]_block_invoke";
        _os_log_fault_impl(&dword_1C2614000, v16, OS_LOG_TYPE_FAULT, "%s Failed to create NDAPI", buf, 0xCu);
        v15 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
      }
      else
      {
        v15 = 0;
      }
    }
    objc_msgSend(v15, "setActiveChannel:", 0);

  }
  else
  {
    v17 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[CSAudioInjectionBuiltInEngine start]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s Error : Model is missing", buf, 0xCu);
    }
  }
  v18 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = v18;
  v20.super_class = (Class)CSAudioInjectionBuiltInEngine;
  objc_msgSendSuper2(&v20, sel_startAudioStreamWithOption_, v19);

  _Block_object_dispose(&v24, 8);
}

void __38__CSAudioInjectionBuiltInEngine_start__block_invoke_18(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __60__CSAudioInjectionBuiltInEngine_alwaysOnVoiceTriggerEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 160);
  return result;
}

uint64_t __64__CSAudioInjectionBuiltInEngine_setAlwaysOnVoiceTriggerEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 160) = *(_BYTE *)(result + 40);
  return result;
}

@end
