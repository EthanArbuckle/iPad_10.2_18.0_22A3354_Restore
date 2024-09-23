@implementation VCAudioCaptions

- (VCAudioCaptions)initWithDelegate:(id)a3 isLocal:(BOOL)a4 taskIdentifier:(id)a5 reportingAgent:(opaqueRTCReporting *)a6
{
  _BOOL4 v8;
  VCAudioCaptions *v10;
  VCAudioCaptions *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 useAnalyzerSpeechAPI;
  NSObject *CustomRootQueue;
  dispatch_queue_t v16;
  opaqueRTCReporting *v17;
  dispatch_queue_t v18;
  dispatch_semaphore_t v19;
  NSMutableArray *v20;
  _BOOL4 v21;
  dispatch_semaphore_t v22;
  uint64_t v23;
  int ErrorLogLevelForModule;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  char *v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  unint64_t v37;
  uint64_t v38;
  NSObject *v39;
  double mSampleRate;
  unsigned int mBytesPerPacket;
  uint64_t v42;
  CFAllocatorRef v43;
  NSObject *v44;
  NSObject *v45;
  NSOperationQueue *v46;
  objc_super v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  _BYTE v56[20];
  _BYTE v57[10];
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v8 = a4;
  v64 = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)VCAudioCaptions;
  v10 = -[VCAudioCaptions init](&v48, sel_init);
  v11 = v10;
  if (!v10)
    return v11;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.1();
    }
    goto LABEL_57;
  }
  v10->_currentUtteranceNumber = 0;
  v10->_recognizerState = 0;
  v10->_copyBufferAllocator = 0;
  v10->_pcmCopyBufferAllocator = 0;
  v10->_taskIdentifier = (NSString *)a5;
  v11->_useAnalyzerSpeechAPI = VCFeatureFlagManager_UseAnalyzerSpeechAPI();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      useAnalyzerSpeechAPI = v11->_useAnalyzerSpeechAPI;
      *(_DWORD *)buf = 136316674;
      v50 = v12;
      v51 = 2080;
      v52 = "-[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:]";
      v53 = 1024;
      v54 = 162;
      v55 = 1024;
      *(_DWORD *)v56 = v8;
      *(_WORD *)&v56[4] = 2112;
      *(_QWORD *)&v56[6] = a5;
      *(_WORD *)&v56[14] = 1024;
      *(_DWORD *)&v56[16] = useAnalyzerSpeechAPI;
      *(_WORD *)v57 = 2048;
      *(_QWORD *)&v57[2] = a6;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Init VCAudioCaptions: isLocal=%{BOOL}d, taskIdentifier=%@, useAnalyzerSpeechAPI=%{BOOL}d, reportingAgent=%p", buf, 0x3Cu);
    }
  }
  v11->_audioConverter = 0;
  objc_storeWeak((id *)&v11->_delegate, a3);
  v11->_isLocal = v8;
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v16 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAudioCaptions.captionsQueue", 0, CustomRootQueue);
  v11->_captionsQueue = (OS_dispatch_queue *)v16;
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.2();
    }
    goto LABEL_57;
  }
  if (a6)
    v17 = (opaqueRTCReporting *)CFRetain(a6);
  else
    v17 = 0;
  v11->_reportingAgent = v17;
  reportingRegisterPeriodicTaskWeak();
  v18 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAudioCaptions.delegateQueue", 0, CustomRootQueue);
  v11->_delegateQueue = (OS_dispatch_queue *)v18;
  if (!v18)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.3();
    }
    goto LABEL_57;
  }
  v19 = dispatch_semaphore_create(1);
  v11->_teardownSemaphore = (OS_dispatch_semaphore *)v19;
  if (!v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.4();
    }
    goto LABEL_57;
  }
  v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11->_captionTasks = v20;
  if (!v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.5();
    }
    goto LABEL_57;
  }
  v21 = -[VCAudioCaptions captionsDebugDumpEnabled](v11, "captionsDebugDumpEnabled");
  v11->_isCaptionsDebugDumpEnabled = v21;
  if (v21)
    v11->_logCaptionsDump = VRLogfileAlloc(0, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("session_%@"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString")), "UTF8String"), (uint64_t)"captions_transcriptions", (uint64_t)".txt", "com.apple.AVConference.VCAudioCaptions.captionsQueue", 9);
  v22 = dispatch_semaphore_create(0);
  v11->_analyzerAllResultsSemaphore = (OS_dispatch_semaphore *)v22;
  if (!v22)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.6();
    }
    goto LABEL_57;
  }
  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithCommonFormat:sampleRate:channels:interleaved:", 3, 1, 0, 16000.0);
  v11->_analyzerAudioFormat = (AVAudioFormat *)v23;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v23)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.7();
    }
    goto LABEL_57;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(_QWORD *)-[AVAudioFormat streamDescription](v11->_analyzerAudioFormat, "streamDescription");
      v28 = FourccToCStr((int)-[AVAudioFormat streamDescription](v11->_analyzerAudioFormat, "streamDescription")[8]);
      v29 = (int)-[AVAudioFormat streamDescription](v11->_analyzerAudioFormat, "streamDescription")[16];
      v30 = (int)-[AVAudioFormat streamDescription](v11->_analyzerAudioFormat, "streamDescription")[20];
      v31 = (int)-[AVAudioFormat streamDescription](v11->_analyzerAudioFormat, "streamDescription")[24];
      v32 = (int)-[AVAudioFormat streamDescription](v11->_analyzerAudioFormat, "streamDescription")[28];
      v33 = (int)-[AVAudioFormat streamDescription](v11->_analyzerAudioFormat, "streamDescription")[32];
      *(_DWORD *)buf = 136317442;
      v50 = v25;
      v51 = 2080;
      v52 = "-[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:]";
      v53 = 1024;
      v54 = 203;
      v55 = 2048;
      *(_QWORD *)v56 = v27;
      *(_WORD *)&v56[8] = 2080;
      *(_QWORD *)&v56[10] = v28;
      *(_WORD *)&v56[18] = 1024;
      *(_DWORD *)v57 = v29;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = v30;
      v58 = 1024;
      v59 = v31;
      v60 = 1024;
      v61 = v32;
      v62 = 1024;
      v63 = v33;
      _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Analyzer preferred format: samplerate=%f formatid=%s bytePerPacket=%d framesPerPacket=%d bytesPerFrame=%d channelsPerFrame=%d bitsPerChannel=%d", buf, 0x4Eu);
    }
  }
  v34 = -[AVAudioFormat streamDescription](v11->_analyzerAudioFormat, "streamDescription");
  v35 = *(_QWORD *)(v34 + 32);
  v36 = *(_OWORD *)(v34 + 16);
  *(_OWORD *)&v11->_captionsFormat.mSampleRate = *(_OWORD *)v34;
  *(_OWORD *)&v11->_captionsFormat.mBytesPerPacket = v36;
  *(_QWORD *)&v11->_captionsFormat.mBitsPerChannel = v35;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v38 = VRTraceErrorLogLevelToCSTR();
    v39 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      mSampleRate = v11->_captionsFormat.mSampleRate;
      mBytesPerPacket = v11->_captionsFormat.mBytesPerPacket;
      v42 = 274877907 * (int)(mSampleRate * (double)mBytesPerPacket * 20.0);
      *(_DWORD *)buf = 136316418;
      v50 = v38;
      v51 = 2080;
      v52 = "-[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:]";
      v53 = 1024;
      v54 = 207;
      v55 = 1024;
      *(_DWORD *)v56 = (int)mSampleRate;
      *(_WORD *)&v56[4] = 1024;
      *(_DWORD *)&v56[6] = mBytesPerPacket;
      *(_WORD *)&v56[10] = 1024;
      *(_DWORD *)&v56[12] = (v42 >> 38) + ((unint64_t)v42 >> 63);
      _os_log_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Create PCM copy buffer allocator: sampleRate=%d, bytesPerPacket=%d, capacity=%d", buf, 0x2Eu);
    }
  }
  LODWORD(v37) = v11->_captionsFormat.mBytesPerPacket;
  v43 = VCAudioBufferAllocatorCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (unint64_t)(v11->_captionsFormat.mSampleRate * (double)v37 * 20.0 / 1000.0), 2u);
  v11->_pcmAudioBufferAllocator = v43;
  if (!v43)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.8();
    }
    goto LABEL_57;
  }
  v44 = VCDispatchQueue_GetCustomRootQueue(37);
  v45 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAudioCaptions.serialQueue", 0, v44);
  v46 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
  v11->_operationQueue = v46;
  if (!v46)
  {
    if (v45)
      dispatch_release(v45);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.9();
    }
LABEL_57:

    return 0;
  }
  -[NSOperationQueue setUnderlyingQueue:](v46, "setUnderlyingQueue:", v45);
  if (v45)
    dispatch_release(v45);
  return v11;
}

void __74__VCAudioCaptions_initWithDelegate_isLocal_taskIdentifier_reportingAgent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v3 = *(NSObject **)(a2 + 144);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__VCAudioCaptions_initWithDelegate_isLocal_taskIdentifier_reportingAgent___block_invoke_2;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a3;
  dispatch_sync(v3, block);
}

uint64_t __74__VCAudioCaptions_initWithDelegate_isLocal_taskIdentifier_reportingAgent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "gatherRealtimeStats:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *captionsQueue;
  NSObject *delegateQueue;
  __CFAllocator *audioBufferAllocator;
  __CFAllocator *pcmCopyBufferAllocator;
  __CFAllocator *pcmAudioBufferAllocator;
  NSObject *teardownSemaphore;
  NSObject *analyzerAllResultsSemaphore;
  opaqueRTCReporting *reportingAgent;
  uint64_t v16;
  NSObject *v17;
  objc_super v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v21 = v5;
      v22 = 2080;
      v23 = "-[VCAudioCaptions dealloc]";
      v24 = 1024;
      v25 = 228;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Tearing down captions", buf, 0x1Cu);
    }
  }
  if (self->_teardownSemaphore)
  {
    v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_teardownSemaphore, v7);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_teardownSemaphore);
  }
  v19 = 0;
  -[VCAudioCaptions transitionToState:withReason:error:](self, "transitionToState:withReason:error:", 0, 2, &v19);

  captionsQueue = self->_captionsQueue;
  if (captionsQueue)
    dispatch_release(captionsQueue);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
    dispatch_release(delegateQueue);
  objc_storeWeak((id *)&self->_delegate, 0);
  _VCAudioCaptions_DestroyCopyBufferAllocator((uint64_t)self);
  audioBufferAllocator = self->_audioBufferAllocator;
  if (audioBufferAllocator)
  {
    CFRelease(audioBufferAllocator);
    self->_audioBufferAllocator = 0;
  }
  pcmCopyBufferAllocator = self->_pcmCopyBufferAllocator;
  if (pcmCopyBufferAllocator)
  {
    CFRelease(pcmCopyBufferAllocator);
    self->_pcmCopyBufferAllocator = 0;
  }
  pcmAudioBufferAllocator = self->_pcmAudioBufferAllocator;
  if (pcmAudioBufferAllocator)
  {
    CFRelease(pcmAudioBufferAllocator);
    self->_pcmAudioBufferAllocator = 0;
  }
  teardownSemaphore = self->_teardownSemaphore;
  if (teardownSemaphore)
    dispatch_release(teardownSemaphore);
  -[NSMutableArray removeAllObjects](self->_captionTasks, "removeAllObjects");

  analyzerAllResultsSemaphore = self->_analyzerAllResultsSemaphore;
  if (analyzerAllResultsSemaphore)
    dispatch_release(analyzerAllResultsSemaphore);

  VRLogfileFree((uint64_t *)&self->_logCaptionsDump);
  reportingUnregisterPeriodicTask();
  reportingAgent = self->_reportingAgent;
  if (reportingAgent)
    CFRelease(reportingAgent);
  v18.receiver = self;
  v18.super_class = (Class)VCAudioCaptions;
  -[VCAudioCaptions dealloc](&v18, sel_dealloc);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v21 = v16;
      v22 = 2080;
      v23 = "-[VCAudioCaptions dealloc]";
      v24 = 1024;
      v25 = 270;
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Captions done", buf, 0x1Cu);
    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VCAudioCaptionsDelegate)delegate
{
  return (VCAudioCaptionsDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)gatherRealtimeStats:(__CFDictionary *)a3
{
  double v5;
  double v6;
  int v7;
  const __CFAllocator *v8;
  CFNumberRef v9;
  CFNumberRef v10;
  unsigned int v11;
  CFNumberRef v12;
  CFNumberRef v13;
  uint64_t v14;
  NSObject *v15;
  unint64_t captioningRequestCount;
  double captionsEnabledDuration;
  double captionedAudioDuration;
  unsigned int v19;
  _BOOL4 isLocal;
  int captionTaskCount;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  int v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  _BOOL4 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a3 && self->_lastCaptionsEnabledTime != 0.0)
  {
    v5 = micro();
    v6 = v5 - self->_lastCaptionsEnabledTime;
    self->_captionsEnabledDuration = v6;
    self->_lastCaptionsEnabledTime = v5;
    v7 = llround(self->_captionedAudioDuration / v6 * 100.0);
    captionTaskCount = v7;
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v9 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &captionTaskCount);
    CFDictionaryAddValue(a3, CFSTR("ACFCR"), v9);
    CFRelease(v9);
    captionTaskCount = self->_captionTaskCount;
    v10 = CFNumberCreate(v8, kCFNumberIntType, &captionTaskCount);
    CFDictionaryAddValue(a3, CFSTR("ACTC"), v10);
    CFRelease(v10);
    v11 = llround(self->_captionsUtteranceDuration * 1000.0);
    captionTaskCount = v11;
    v12 = CFNumberCreate(v8, kCFNumberIntType, &captionTaskCount);
    CFDictionaryAddValue(a3, CFSTR("ACUL"), v12);
    CFRelease(v12);
    captionTaskCount = self->_isLocal;
    v13 = CFNumberCreate(v8, kCFNumberIntType, &captionTaskCount);
    CFDictionaryAddValue(a3, CFSTR("ACTX"), v13);
    CFRelease(v13);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        captioningRequestCount = self->_captioningRequestCount;
        captionsEnabledDuration = self->_captionsEnabledDuration;
        captionedAudioDuration = self->_captionedAudioDuration;
        v19 = self->_captionTaskCount;
        isLocal = self->_isLocal;
        captionTaskCount = 136317698;
        v22 = v14;
        v23 = 2080;
        v24 = "-[VCAudioCaptions gatherRealtimeStats:]";
        v25 = 1024;
        v26 = 296;
        v27 = 2048;
        v28 = captioningRequestCount;
        v29 = 2048;
        v30 = captionsEnabledDuration;
        v31 = 2048;
        v32 = captionedAudioDuration;
        v33 = 2048;
        v34 = captionedAudioDuration / captionsEnabledDuration;
        v35 = 1024;
        v36 = v7;
        v37 = 1024;
        v38 = v19;
        v39 = 1024;
        v40 = v11 / v19;
        v41 = 1024;
        v42 = isLocal;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: VCAudioCaptions Reporting Captions RealTime Stats: captioningRequestCount=%lu captionsEnabledDuration=%f captionedAudioDuration=%f captionsRatio=%f (5s * 100)captionsRatio=%d captionTaskCount=%d (movingAverage ms)utteranceDuration=%d isUplink=%d", (uint8_t *)&captionTaskCount, 0x5Cu);
      }
    }
    self->_captionedAudioDuration = 0.0;
    self->_captionsEnabledDuration = 0.0;
  }
}

- (BOOL)createAudioConverterWithInputFormat:(const AudioStreamBasicDescription *)a3 outputFormat:(const AudioStreamBasicDescription *)a4 converter:(OpaqueAudioConverter *)a5
{
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  Float64 mSampleRate;
  AudioFormatID mFormatID;
  UInt32 mBytesPerPacket;
  UInt32 mFramesPerPacket;
  UInt32 mBytesPerFrame;
  UInt32 mChannelsPerFrame;
  UInt32 mBitsPerChannel;
  uint64_t v19;
  NSObject *v20;
  Float64 v21;
  AudioFormatID v22;
  UInt32 v23;
  UInt32 v24;
  UInt32 v25;
  UInt32 v26;
  UInt32 v27;
  _BOOL4 v28;
  int v30;
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  Float64 v37;
  __int16 v38;
  AudioFormatID v39;
  __int16 v40;
  UInt32 v41;
  __int16 v42;
  UInt32 v43;
  __int16 v44;
  UInt32 v45;
  __int16 v46;
  UInt32 v47;
  __int16 v48;
  UInt32 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  *a5 = 0;
  if (!memcmp(a4, a3, 0x28uLL))
  {
    LOBYTE(v28) = 1;
    return v28;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136315650;
      v31 = v8;
      v32 = 2080;
      v33 = "-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]";
      v34 = 1024;
      v35 = 314;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Creating converter for captions:", (uint8_t *)&v30, 0x1Cu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      mSampleRate = a3->mSampleRate;
      mFormatID = a3->mFormatID;
      mBytesPerPacket = a3->mBytesPerPacket;
      mFramesPerPacket = a3->mFramesPerPacket;
      mBytesPerFrame = a3->mBytesPerFrame;
      mChannelsPerFrame = a3->mChannelsPerFrame;
      mBitsPerChannel = a3->mBitsPerChannel;
      v30 = 136317442;
      v31 = v10;
      v32 = 2080;
      v33 = "-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]";
      v34 = 1024;
      v35 = 323;
      v36 = 2048;
      v37 = mSampleRate;
      v38 = 1024;
      v39 = mFormatID;
      v40 = 1024;
      v41 = mBytesPerPacket;
      v42 = 1024;
      v43 = mFramesPerPacket;
      v44 = 1024;
      v45 = mBytesPerFrame;
      v46 = 1024;
      v47 = mChannelsPerFrame;
      v48 = 1024;
      v49 = mBitsPerChannel;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d  InputFormat: samplerate=%f formatid=%x bytePerPacket=%d framesPerPacket=%d bytesPerFrame=%d channelsPerFrame=%d bitsPerChannel=%d", (uint8_t *)&v30, 0x4Au);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v21 = a4->mSampleRate;
      v22 = a4->mFormatID;
      v23 = a4->mBytesPerPacket;
      v24 = a4->mFramesPerPacket;
      v25 = a4->mBytesPerFrame;
      v26 = a4->mChannelsPerFrame;
      v27 = a4->mBitsPerChannel;
      v30 = 136317442;
      v31 = v19;
      v32 = 2080;
      v33 = "-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]";
      v34 = 1024;
      v35 = 332;
      v36 = 2048;
      v37 = v21;
      v38 = 1024;
      v39 = v22;
      v40 = 1024;
      v41 = v23;
      v42 = 1024;
      v43 = v24;
      v44 = 1024;
      v45 = v25;
      v46 = 1024;
      v47 = v26;
      v48 = 1024;
      v49 = v27;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d  OuputFormat: samplerate=%f formatid=%x bytePerPacket=%d framesPerPacket=%d bytesPerFrame=%d channelsPerFrame=%d bitsPerChannel=%d", (uint8_t *)&v30, 0x4Au);
    }
  }
  if (AudioConverterNew(a3, a4, a5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
LABEL_15:
      LOBYTE(v28) = 0;
      return v28;
    }
    VRTraceErrorLogLevelToCSTR();
    v28 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (v28)
    {
      -[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:].cold.2();
      goto LABEL_15;
    }
  }
  else
  {
    v30 = 2;
    if (AudioConverterSetProperty(*a5, 0x70726D6Du, 4u, &v30))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:].cold.1();
      }
    }
    LOBYTE(v28) = *a5 != 0;
  }
  return v28;
}

- (opaqueCMSampleBuffer)convertSamples:(char *)a3 numSamples:(int)a4
{
  id v7;
  double v8;
  size_t v9;
  uint64_t v10;
  char *v11;
  __int128 v12;
  UInt32 v13;
  opaqueCMSampleBuffer *v14;
  uint64_t *inInputDataProcUserData;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  UInt32 ioOutputDataPacketSize;
  AudioBufferList outOutputData;
  uint64_t v22;
  int v23;
  UInt32 v24;
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_audioConverter)
    return 0;
  v7 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v8 = self->_captionsFormat.mSampleRate * (double)a4 / self->_inputFormat.mSampleRate;
  ioOutputDataPacketSize = v8;
  v9 = self->_captionsFormat.mBytesPerPacket * v8;
  v10 = (v9 + 15) & 0x1FFFFFFF0;
  v11 = (char *)&inInputDataProcUserData - v10;
  if ((_DWORD)v9)
    memset((char *)&inInputDataProcUserData - v10, 170, self->_captionsFormat.mBytesPerPacket * v8);
  v12 = *(_OWORD *)&self->_inputFormat.mBytesPerPacket;
  v17 = *(_OWORD *)&self->_inputFormat.mSampleRate;
  outOutputData.mBuffers[0].mData = v11;
  v22 = 1;
  *(_QWORD *)&outOutputData.mNumberBuffers = 0;
  v25 = a3;
  v13 = self->_inputFormat.mBytesPerPacket * a4;
  v23 = 1;
  v24 = v13;
  outOutputData.mNumberBuffers = 1;
  outOutputData.mBuffers[0].mNumberChannels = 1;
  outOutputData.mBuffers[0].mDataByteSize = v9;
  v18 = v12;
  v19 = *(_QWORD *)&self->_inputFormat.mBitsPerChannel;
  inInputDataProcUserData = &v22;
  if (AudioConverterFillComplexBuffer(self->_audioConverter, (AudioConverterComplexInputDataProc)captionsAudioConverterCallback, &inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioCaptions convertSamples:numSamples:].cold.1();
    }
    bzero(v11, v9);
  }
  v14 = -[VCAudioCaptions createSampleBufferWithFormat:samples:numSamples:](self, "createSampleBufferWithFormat:samples:numSamples:", &self->_captionsFormat, v11, ioOutputDataPacketSize);

  return v14;
}

- (BOOL)handleStateLoadedError:(id *)a3
{
  id v5;
  _BOOL4 v6;

  if (!self->_useAnalyzerSpeechAPI)
  {
    v6 = -[VCAudioCaptions createRecognizer:](self, "createRecognizer:", a3);
    if (!v6)
      return v6;
LABEL_6:
    LOBYTE(v6) = 1;
    self->_recognizerState = 1;
    return v6;
  }
  if (-[VCAudioCaptions configureAnalyzerOptions](self, "configureAnalyzerOptions"))
    goto LABEL_6;
  if (a3)
  {
    v5 = +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionCaptionsErrorEvent:errorPath:returnCode:", 2, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 504), 9);
    LOBYTE(v6) = 0;
    *a3 = v5;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)idleStateToState:(int)a3 withReason:(int)a4 error:(id *)a5
{
  BOOL result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if ((a3 - 1) >= 2)
  {
    if (!a3)
      return 1;
    if (a5)
    {
      v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), *(_QWORD *)&a4, "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 529);
      v9 = 3;
      v10 = 7;
      goto LABEL_10;
    }
  }
  else
  {
    if (-[VCAudioCaptions supported](self, "supported"))
      return -[VCAudioCaptions handleStateLoadedError:](self, "handleStateLoadedError:", a5);
    if (a5)
    {
      v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 520);
      v9 = 2;
      v10 = 8;
LABEL_10:
      v11 = +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionCaptionsErrorEvent:errorPath:returnCode:", v9, v8, v10);
      result = 0;
      *a5 = v11;
      return result;
    }
  }
  return 0;
}

- (BOOL)loadedStateToState:(int)a3 withReason:(int)a4 error:(id *)a5
{
  int64_t currentActiveToken;
  NSObject *delegateQueue;
  id v10;
  _BOOL4 v11;
  _QWORD block[6];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 2:
      if (self->_useAnalyzerSpeechAPI)
      {
        if (-[VCAudioCaptions analyzerSetupWithError:](self, "analyzerSetupWithError:", a5))
        {
LABEL_8:
          currentActiveToken = self->_currentActiveToken;
          delegateQueue = self->_delegateQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __55__VCAudioCaptions_loadedStateToState_withReason_error___block_invoke;
          block[3] = &unk_1E9E52350;
          v14 = a4;
          block[4] = self;
          block[5] = currentActiveToken;
          dispatch_async(delegateQueue, block);
          self->_recognizerState = 2;
          goto LABEL_17;
        }
      }
      else if (-[VCAudioCaptions recognizerBufferSetupWithError:](self, "recognizerBufferSetupWithError:", a5))
      {
        goto LABEL_8;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v11)
          return v11;
        -[VCAudioCaptions loadedStateToState:withReason:error:].cold.1();
      }
LABEL_15:
      LOBYTE(v11) = 0;
      return v11;
    case 1:
LABEL_17:
      LOBYTE(v11) = 1;
      return v11;
    case 0:
      self->_recognizerState = 0;
      if (self->_useAnalyzerSpeechAPI)
        -[VCAudioCaptions analyzerTeardown](self, "analyzerTeardown");
      else
        -[VCAudioCaptions destroyRecognizer](self, "destroyRecognizer");
      goto LABEL_17;
  }
  if (!a5)
    goto LABEL_15;
  v10 = +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionCaptionsErrorEvent:errorPath:returnCode:", 3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), *(_QWORD *)&a4, "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 561), 7);
  LOBYTE(v11) = 0;
  *a5 = v10;
  return v11;
}

uint64_t __55__VCAudioCaptions_loadedStateToState_withReason_error___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didStartCaptioningWithReason:streamToken:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)handleStateStopping
{
  SFSpeechAnalyzer *analyzer;
  SFSpeechAnalyzer *v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  if (self->_useAnalyzerSpeechAPI)
  {
    analyzer = self->_analyzer;
    if (analyzer)
    {
      -[SFSpeechAnalyzer finishAudio](analyzer, "finishAudio");
      v4 = self->_analyzer;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __38__VCAudioCaptions_handleStateStopping__block_invoke;
      v5[3] = &unk_1E9E534F8;
      v5[4] = self;
      -[SFSpeechAnalyzer finalizeAndFinishThroughEndOfInputWithCompletion:](v4, "finalizeAndFinishThroughEndOfInputWithCompletion:", v5);
    }
  }
  else
  {
    -[SFSpeechAudioBufferRecognitionRequest endAudio](self->_recognizerRequest, "endAudio");
    -[SFSpeechRecognitionTask finish](self->_recognizerTask, "finish");
    if (self->_recognizerTask)
      ++self->_captionTaskCount;
  }
}

void __38__VCAudioCaptions_handleStateStopping__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;

  if (a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __38__VCAudioCaptions_handleStateStopping__block_invoke_cold_1(v4, a2, v5);
    }
  }
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 304);
}

- (BOOL)runningStateToState:(int)a3 withReason:(int)a4 error:(id *)a5
{
  double v6;
  uint64_t v7;
  NSObject *v8;
  SFSpeechRecognitionTask *recognizerTask;
  unsigned int captionTaskCount;
  $95D729B680665BEAEFA1D6FCA8238556 lastAudioProcessedTime;
  int v13;
  __int16 v14;
  SFSpeechRecognitionTask *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3 < 2)
    goto LABEL_4;
  if (a3 == 2)
    return 1;
  if (a3 == 3)
  {
LABEL_4:
    self->_recognizerState = 3;
    -[VCAudioCaptions handleStateStopping](self, "handleStateStopping");
    lastAudioProcessedTime = self->_lastAudioProcessedTime;
    v6 = CMTimeGetSeconds((CMTime *)&lastAudioProcessedTime) - self->_captionsLastUtteranceStart;
    self->_captionsUtteranceDuration = self->_captionsUtteranceDuration + v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        recognizerTask = self->_recognizerTask;
        captionTaskCount = self->_captionTaskCount;
        LODWORD(lastAudioProcessedTime.value) = 136316418;
        *(int64_t *)((char *)&lastAudioProcessedTime.value + 4) = v7;
        LOWORD(lastAudioProcessedTime.flags) = 2080;
        *(_QWORD *)((char *)&lastAudioProcessedTime.flags + 2) = "-[VCAudioCaptions runningStateToState:withReason:error:]";
        HIWORD(lastAudioProcessedTime.epoch) = 1024;
        v13 = 601;
        v14 = 2048;
        v15 = recognizerTask;
        v16 = 1024;
        v17 = captionTaskCount;
        v18 = 2048;
        v19 = v6;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ending Task=%p currentTaskCount=%d utteranceDuration=%f", (uint8_t *)&lastAudioProcessedTime, 0x36u);
      }
    }
    return 1;
  }
  return 0;
}

- (BOOL)stoppingStateToState:(int)a3 withReason:(int)a4 error:(id *)a5
{
  BOOL result;
  id v9;
  int64_t currentActiveToken;
  NSObject *delegateQueue;
  _QWORD block[6];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = 1;
  if (a3 >= 2)
  {
    if (a3 != 3)
    {
      if (a5)
      {
        v9 = +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionCaptionsErrorEvent:errorPath:returnCode:", 3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), *(_QWORD *)&a4, "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 630), 7);
        result = 0;
        *a5 = v9;
      }
      else
      {
        return 0;
      }
    }
  }
  else
  {
    self->_recognizerState = 1;
    if (self->_useAnalyzerSpeechAPI)
      -[VCAudioCaptions destroyAnalyzer](self, "destroyAnalyzer");
    else
      -[VCAudioCaptions recognizerBufferTeardown](self, "recognizerBufferTeardown");
    currentActiveToken = self->_currentActiveToken;
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__VCAudioCaptions_stoppingStateToState_withReason_error___block_invoke;
    block[3] = &unk_1E9E52350;
    v13 = a4;
    block[4] = self;
    block[5] = currentActiveToken;
    dispatch_sync(delegateQueue, block);
    return 1;
  }
  return result;
}

uint64_t __57__VCAudioCaptions_stoppingStateToState_withReason_error___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didStopCaptioningWithReason:streamToken:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (BOOL)transitionToState:(int)a3 withReason:(int)a4 error:(id *)a5
{
  __int128 v5;
  os_log_t *v7;
  uint64_t v8;
  NSObject *v9;
  int recognizerState;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v19;
  BOOL v20;
  void **v21;
  int v22;
  int v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  v22 = a4;
  v23 = a3;
  v21 = a5;
  v20 = 1;
  v34[0] = sel_idleStateToState_withReason_error_;
  v34[1] = sel_loadedStateToState_withReason_error_;
  v34[2] = sel_runningStateToState_withReason_error_;
  v34[3] = sel_stoppingStateToState_withReason_error_;
  if (self->_recognizerState != a3)
  {
    v7 = (os_log_t *)MEMORY[0x1E0CF2758];
    *(_QWORD *)&v5 = 136315906;
    v19 = v5;
    while (1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          recognizerState = self->_recognizerState;
          *(_DWORD *)buf = 136316162;
          v25 = v8;
          v26 = 2080;
          v27 = "-[VCAudioCaptions transitionToState:withReason:error:]";
          v28 = 1024;
          v29 = 647;
          v30 = 1024;
          v31 = recognizerState;
          v32 = 1024;
          v33 = v23;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Captions State Transition: From=%d To=%d", buf, 0x28u);
        }
      }
      v11 = -[VCAudioCaptions methodSignatureForSelector:](self, "methodSignatureForSelector:", v34[self->_recognizerState], v19);
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v11);
      objc_msgSend(v12, "setTarget:", self);
      objc_msgSend(v12, "setSelector:", v34[self->_recognizerState]);
      objc_msgSend(v12, "setArgument:atIndex:", &v23, 2);
      objc_msgSend(v12, "setArgument:atIndex:", &v22, 3);
      objc_msgSend(v12, "setArgument:atIndex:", &v21, 4);
      objc_msgSend(v12, "invoke");
      v20 = 0;
      objc_msgSend(v12, "getReturnValue:", &v20);
      if (!v20)
        break;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          v15 = self->_recognizerState;
          *(_DWORD *)buf = v19;
          v25 = v13;
          v26 = 2080;
          v27 = "-[VCAudioCaptions transitionToState:withReason:error:]";
          v28 = 1024;
          v29 = 664;
          v30 = 1024;
          v31 = v15;
          _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d New captions state: %d", buf, 0x22u);
        }
      }
      if (self->_recognizerState == v23)
        return v20;
    }
    if (v21)
    {
      if (*v21)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
            -[VCAudioCaptions transitionToState:withReason:error:].cold.1(v16, &v21, v17);
        }
      }
    }
  }
  return v20;
}

- (void)enableCaptions:(BOOL)a3
{
  NSObject *captionsQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__VCAudioCaptions_enableCaptions___block_invoke;
  block[3] = &unk_1E9E521E8;
  v5 = a3;
  block[4] = self;
  dispatch_async(captionsQueue, block);
}

void __34__VCAudioCaptions_enableCaptions___block_invoke(uint64_t a1)
{
  int v2;
  int ErrorLogLevelForModule;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[6];
  _QWORD v20[6];
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v2 = *(unsigned __int8 *)(a1 + 40);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v2)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v23 = v11;
        v24 = 2080;
        v25 = "-[VCAudioCaptions enableCaptions:]_block_invoke_2";
        v26 = 1024;
        v27 = 701;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Disable captions", buf, 0x1Cu);
      }
    }
    v13 = *(_QWORD *)(a1 + 32);
    if (*(unsigned __int8 *)(v13 + 8) != *(unsigned __int8 *)(a1 + 40))
    {
      v14 = objc_msgSend((id)v13, "transitionToState:withReason:error:", 0, 2, &v21);
      v13 = *(_QWORD *)(a1 + 32);
      if (v14)
      {
        *(_BYTE *)(v13 + 8) = *(_BYTE *)(a1 + 40);
        *(double *)(*(_QWORD *)(a1 + 32) + 256) = *(double *)(*(_QWORD *)(a1 + 32) + 256)
                                                  + micro()
                                                  - *(double *)(*(_QWORD *)(a1 + 32) + 264);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296) = 0;
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = 0;
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) = 0;
        v13 = *(_QWORD *)(a1 + 32);
      }
    }
    v9 = *(NSObject **)(v13 + 152);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__VCAudioCaptions_enableCaptions___block_invoke_46;
    block[3] = &unk_1E9E52238;
    block[4] = v13;
    block[5] = v21;
    v10 = block;
    goto LABEL_21;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v23 = v4;
      v24 = 2080;
      v25 = "-[VCAudioCaptions enableCaptions:]_block_invoke";
      v26 = 1024;
      v27 = 676;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Enable captions", buf, 0x1Cu);
    }
  }
  if ((objc_msgSend(+[VCSpeechFrameworkWrapper defaultSpeechFrameworkWrapper](VCSpeechFrameworkWrapper, "defaultSpeechFrameworkWrapper"), "frameworkLoaded") & 1) != 0)
  {
    if ((objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-captions-enabled"), CFSTR("audioCaptionsEnabled"), &unk_1E9EF3AB8, 0), "BOOLValue") & 1) != 0)
    {
      v6 = *(_QWORD *)(a1 + 32);
      if (*(unsigned __int8 *)(v6 + 8) != *(unsigned __int8 *)(a1 + 40))
      {
        if (*(_BYTE *)(v6 + 9))
          v7 = 2;
        else
          v7 = 1;
        v8 = objc_msgSend((id)v6, "transitionToState:withReason:error:", v7, 2, &v21);
        v6 = *(_QWORD *)(a1 + 32);
        if (v8)
        {
          *(_BYTE *)(v6 + 8) = *(_BYTE *)(a1 + 40);
          *(double *)(*(_QWORD *)(a1 + 32) + 264) = micro();
          v6 = *(_QWORD *)(a1 + 32);
        }
      }
      v9 = *(NSObject **)(v6 + 152);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __34__VCAudioCaptions_enableCaptions___block_invoke_44;
      v20[3] = &unk_1E9E52238;
      v20[4] = v6;
      v20[5] = v21;
      v10 = v20;
LABEL_21:
      dispatch_async(v9, v10);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v23 = v17;
        v24 = 2080;
        v25 = "-[VCAudioCaptions enableCaptions:]_block_invoke";
        v26 = 1024;
        v27 = 684;
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Captions disabled via storebag or default", buf, 0x1Cu);
      }
    }
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = 685;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __34__VCAudioCaptions_enableCaptions___block_invoke_cold_1();
    }
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = 679;
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didEnableCaptions:error:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8), +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionCaptionsErrorEvent:errorPath:returnCode:", 1, objc_msgSend(v15, "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", v16), 2));
}

uint64_t __34__VCAudioCaptions_enableCaptions___block_invoke_44(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didEnableCaptions:error:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
}

uint64_t __34__VCAudioCaptions_enableCaptions___block_invoke_46(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didDisableCaptions:error:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) == 0, *(_QWORD *)(a1 + 40));
}

- (BOOL)supported
{
  int v2;

  v2 = +[VCHardwareSettings isCaptionsSupported](VCHardwareSettings, "isCaptionsSupported");
  if (v2)
    LOBYTE(v2) = objc_msgSend(+[VCSpeechFrameworkWrapper defaultSpeechFrameworkWrapper](VCSpeechFrameworkWrapper, "defaultSpeechFrameworkWrapper"), "frameworkLoaded");
  return v2;
}

- (BOOL)enabled
{
  NSObject *captionsQueue;
  char v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__VCAudioCaptions_enabled__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(captionsQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__VCAudioCaptions_enabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (NSLocale)locale
{
  NSObject *captionsQueue;
  NSLocale *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__VCAudioCaptions_locale__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(captionsQueue, block);
  v3 = (NSLocale *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__VCAudioCaptions_locale__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + 216);
  return result;
}

- (void)setLocale:(id)a3
{
  NSObject *captionsQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__VCAudioCaptions_setLocale___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(captionsQueue, block);
}

uint64_t __29__VCAudioCaptions_setLocale___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[12];
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(v4 + 216);
      v7 = *(_DWORD *)(v4 + 60);
      *(_DWORD *)v11 = 136316674;
      *(_QWORD *)&v11[4] = v2;
      v12 = 2080;
      v13 = "-[VCAudioCaptions setLocale:]_block_invoke";
      v14 = 1024;
      v15 = 742;
      v16 = 2048;
      v17 = v4;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      v22 = 1024;
      v23 = v7;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d (%p) setting locale=%@, originalLocale=%@, state=%u", v11, 0x40u);
    }
  }
  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "localeIdentifier"), "isEqualToString:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "localeIdentifier"));
  if ((result & 1) == 0)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(unsigned int *)(v9 + 60);
    *(_QWORD *)v11 = 0;
    if ((_DWORD)v10)
    {
      objc_msgSend((id)v9, "transitionToState:withReason:error:", 0, 2, v11);
      v9 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v9 + 216) = *(_QWORD *)(a1 + 40);
    return objc_msgSend(*(id *)(a1 + 32), "transitionToState:withReason:error:", v10, 2, v11);
  }
  return result;
}

- (void)callCompletionHandler:(id)a3 withResult:(BOOL)a4
{
  if (a3)
    (*((void (**)(id, BOOL))a3 + 2))(a3, a4);
}

- (BOOL)reallocCopyBufferAllocatorWithFormat:(const AudioStreamBasicDescription *)a3
{
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  size_t v11;
  __CFAllocator *v12;
  int ErrorLogLevelForModule;
  uint64_t v14;
  NSObject *v15;
  int mSampleRate;
  UInt32 mBytesPerPacket;
  _BOOL4 v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  UInt32 v29;
  __int16 v30;
  size_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  _VCAudioCaptions_DestroyCopyBufferAllocator((uint64_t)self);
  if ((VCMemoryUtil_IsAddressSanitizerEnabled() & 1) != 0
    || VCMemoryUtil_IsProbabilisticGuardMallocEnabled())
  {
    self->_copyBufferAllocator = (__CFAllocator *)*MEMORY[0x1E0C9AE00];
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_11;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v20 = 136315650;
    v21 = v6;
    v22 = 2080;
    v23 = "-[VCAudioCaptions reallocCopyBufferAllocatorWithFormat:]";
    v24 = 1024;
    v25 = 775;
    v8 = " [%s] %s:%d Disable copy buffer pool allocator. Use default allocator instead.";
    v9 = v7;
    v10 = 28;
LABEL_6:
    _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v20, v10);
LABEL_11:
    LOBYTE(v18) = 1;
    return v18;
  }
  LODWORD(v5) = a3->mBytesPerPacket;
  v11 = (unint64_t)(a3->mSampleRate * (double)v5 * 20.0 / 1000.0);
  v12 = VCAudioBufferAllocatorCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], v11, 2u);
  self->_copyBufferAllocator = v12;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v12)
  {
    if (ErrorLogLevelForModule < 7)
      goto LABEL_11;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    mSampleRate = (int)a3->mSampleRate;
    mBytesPerPacket = a3->mBytesPerPacket;
    v20 = 136316418;
    v21 = v14;
    v22 = 2080;
    v23 = "-[VCAudioCaptions reallocCopyBufferAllocatorWithFormat:]";
    v24 = 1024;
    v25 = 783;
    v26 = 1024;
    v27 = mSampleRate;
    v28 = 1024;
    v29 = mBytesPerPacket;
    v30 = 2048;
    v31 = v11;
    v8 = " [%s] %s:%d Create captions copy buffer allocator: sampleRate=%d bytesPerPacket=%d bufferSize=%zu";
    v9 = v15;
    v10 = 50;
    goto LABEL_6;
  }
  if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v18)
      return v18;
    -[VCAudioCaptions reallocCopyBufferAllocatorWithFormat:].cold.1();
  }
  LOBYTE(v18) = 0;
  return v18;
}

- (void)start:(const AudioStreamBasicDescription *)a3 forToken:(int64_t)a4 withCompletionHandler:(id)a5
{
  Float64 mSampleRate;
  __int128 v7;
  dispatch_block_t v8;
  _QWORD block[8];
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  mSampleRate = a3->mSampleRate;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__VCAudioCaptions_start_forToken_withCompletionHandler___block_invoke;
  block[3] = &unk_1E9E53520;
  block[5] = a5;
  block[6] = a4;
  block[4] = self;
  *(Float64 *)&block[7] = mSampleRate;
  v7 = *(_OWORD *)&a3->mBytesPerFrame;
  v10 = *(_OWORD *)&a3->mFormatID;
  v11 = v7;
  v8 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
  dispatch_async((dispatch_queue_t)self->_captionsQueue, v8);

}

uint64_t __56__VCAudioCaptions_start_forToken_withCompletionHandler___block_invoke(uint64_t a1)
{
  int v2;
  int ErrorLogLevelForModule;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  char v10;
  const void *v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  double v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  char v23;
  _BYTE v25[12];
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[10];
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432) = *(_QWORD *)(a1 + 48);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __56__VCAudioCaptions_start_forToken_withCompletionHandler___block_invoke_cold_2();
    }
    v4 = *(_QWORD **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 1;
    return objc_msgSend(v4, "callCompletionHandler:withResult:", v5, v6);
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)v25 = 136315906;
      *(_QWORD *)&v25[4] = v7;
      v26 = 2080;
      v27 = "-[VCAudioCaptions start:forToken:withCompletionHandler:]_block_invoke";
      v28 = 1024;
      v29 = 798;
      v30 = 2048;
      *(_QWORD *)v31 = v9;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Starting the speech recognizer for token=%ld", v25, 0x26u);
    }
  }
  if (+[VCAudioCaptions shouldAllocateNewAllocator:streamDesc:referenceStreamDesc:](VCAudioCaptions, "shouldAllocateNewAllocator:streamDesc:referenceStreamDesc:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), a1 + 56, *(_QWORD *)(a1 + 32) + 16))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "reallocCopyBufferAllocatorWithFormat:", a1 + 56);
    v4 = *(_QWORD **)(a1 + 32);
    if ((v10 & 1) != 0)
    {
      v11 = (const void *)v4[22];
      if (v11)
      {
        CFRelease(v11);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = 0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(double *)(a1 + 56);
          v16 = *(_DWORD *)(a1 + 72);
          v17 = 274877907 * (int)(v15 * (double)v16 * 20.0);
          *(_DWORD *)v25 = 136316418;
          *(_QWORD *)&v25[4] = v13;
          v26 = 2080;
          v27 = "-[VCAudioCaptions start:forToken:withCompletionHandler:]_block_invoke";
          v28 = 1024;
          v29 = 805;
          v30 = 1024;
          *(_DWORD *)v31 = (int)v15;
          *(_WORD *)&v31[4] = 1024;
          *(_DWORD *)&v31[6] = v16;
          v32 = 1024;
          v33 = (v17 >> 38) + ((unint64_t)v17 >> 63);
          _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Create PCM copy buffer allocator: sampleRate=%d, bytesPerPacket=%d, capacity=%d", v25, 0x2Eu);
        }
      }
      LODWORD(v12) = *(_DWORD *)(a1 + 72);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = VCAudioBufferAllocatorCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (unint64_t)(*(double *)(a1 + 56) * (double)v12 * 20.0 / 1000.0), 2u);
      v18 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v18 + 176))
      {
        *(_BYTE *)(v18 + 416) = 1;
        goto LABEL_18;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __56__VCAudioCaptions_start_forToken_withCompletionHandler___block_invoke_cold_1();
      }
      v4 = *(_QWORD **)(a1 + 32);
      if (v4[20])
      {
        _VCAudioCaptions_DestroyCopyBufferAllocator((uint64_t)v4);
        v4 = *(_QWORD **)(a1 + 32);
      }
    }
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 0;
    return objc_msgSend(v4, "callCompletionHandler:withResult:", v5, v6);
  }
LABEL_18:
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(_OWORD *)(a1 + 56);
  v21 = *(_OWORD *)(a1 + 72);
  *(_QWORD *)(v19 + 48) = *(_QWORD *)(a1 + 88);
  *(_OWORD *)(v19 + 16) = v20;
  *(_OWORD *)(v19 + 32) = v21;
  v22 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v22 + 8)
    && (*(_QWORD *)v25 = 0,
        v23 = objc_msgSend((id)v22, "transitionToState:withReason:error:", 2, 2, v25),
        v22 = *(_QWORD *)(a1 + 32),
        (v23 & 1) == 0))
  {
    _VCAudioCaptions_DestroyCopyBufferAllocator(v22);
    v22 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v22 + 176))
    {
      CFRelease(*(CFTypeRef *)(v22 + 176));
      v6 = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = 0;
      v22 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 1;
  }
  *(_BYTE *)(v22 + 9) = v6;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v4, "callCompletionHandler:withResult:", v5, v6);
}

- (void)stop
{
  -[VCAudioCaptions stopWithCompletionHandler:](self, "stopWithCompletionHandler:", 0);
}

- (void)stopWithCompletionHandler:(id)a3
{
  NSObject *captionsQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VCAudioCaptions_stopWithCompletionHandler___block_invoke;
  block[3] = &unk_1E9E53548;
  block[4] = self;
  block[5] = a3;
  dispatch_async(captionsQueue, block);
}

uint64_t __45__VCAudioCaptions_stopWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 9))
  {
    *(_BYTE *)(v2 + 9) = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = *(_QWORD *)(v5 + 80);
        v7 = *(_QWORD *)(v5 + 432);
        *(_DWORD *)buf = 136316162;
        v12 = v3;
        v13 = 2080;
        v14 = "-[VCAudioCaptions stopWithCompletionHandler:]_block_invoke";
        v15 = 1024;
        v16 = 851;
        v17 = 2048;
        v18 = v6;
        v19 = 2048;
        v20 = v7;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stopping the speech recognizer task=%p for token=%ld", buf, 0x30u);
      }
    }
    v8 = objc_msgSend(*(id *)(a1 + 32), "transitionToState:withReason:error:", 1, 2, &v10);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __45__VCAudioCaptions_stopWithCompletionHandler___block_invoke_cold_1();
    }
    v8 = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "callCompletionHandler:withResult:", *(_QWORD *)(a1 + 40), v8);
}

- (BOOL)createRecognizer:(id *)a3
{
  uint64_t v3;
  NSObject *v4;
  SFSpeechRecognizer *v7;
  double v8;
  SFSpeechRecognizer *recognizer;
  BOOL result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  _QWORD v18[6];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_recognizer)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v20 = v3;
        v21 = 2080;
        v22 = "-[VCAudioCaptions createRecognizer:]";
        v23 = 1024;
        v24 = 862;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d The speech recognizer already exists!!", buf, 0x1Cu);
      }
    }
    return 1;
  }
  v7 = (SFSpeechRecognizer *)objc_msgSend(+[VCSpeechFrameworkWrapper defaultSpeechFrameworkWrapper](VCSpeechFrameworkWrapper, "defaultSpeechFrameworkWrapper"), "newSFSpeechRecognizerWithLocale:", self->_locale);
  self->_recognizer = v7;
  if (!v7)
  {
    if (a3)
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 868);
      v12 = 4;
      v13 = 1;
LABEL_17:
      v17 = +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionCaptionsErrorEvent:errorPath:returnCode:", v12, v11, v13);
      result = 0;
      *a3 = v17;
      return result;
    }
    return 0;
  }
  if (!-[SFSpeechRecognizer isAvailable](v7, "isAvailable"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = -[SFSpeechRecognizer isAvailable](self->_recognizer, "isAvailable");
        *(_DWORD *)buf = 136315906;
        v20 = v14;
        v21 = 2080;
        v22 = "-[VCAudioCaptions createRecognizer:]";
        v23 = 1024;
        v24 = 873;
        v25 = 1024;
        v26 = v16;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Recognizer is not available at this point: (%d)", buf, 0x22u);
      }
    }

    self->_recognizer = 0;
    if (a3)
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 877);
      v12 = 5;
      v13 = 2;
      goto LABEL_17;
    }
    return 0;
  }
  -[SFSpeechRecognizer setDelegate:](self->_recognizer, "setDelegate:", self);
  -[SFSpeechRecognizer setDefaultTaskHint:](self->_recognizer, "setDefaultTaskHint:", 1004);
  v8 = micro();
  recognizer = self->_recognizer;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __36__VCAudioCaptions_createRecognizer___block_invoke;
  v18[3] = &unk_1E9E53570;
  *(double *)&v18[5] = v8;
  v18[4] = self;
  -[SFSpeechRecognizer _prepareToRecognizeWithTaskHint:completion:](recognizer, "_prepareToRecognizeWithTaskHint:completion:", 1004, v18);
  return 1;
}

void __36__VCAudioCaptions_createRecognizer___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4;
  uint64_t v5;
  NSObject *v6;
  double v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  double v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = micro();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v4 - *(double *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v12 = v5;
      v13 = 2080;
      v14 = "-[VCAudioCaptions createRecognizer:]_block_invoke";
      v15 = 1024;
      v16 = 887;
      v17 = 2048;
      v18 = v7;
      v19 = 2112;
      v20 = a2;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Speech model preloading durationInSeconds=%f error=%@", buf, 0x30u);
    }
  }
  if (!a2)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 144);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__VCAudioCaptions_createRecognizer___block_invoke_49;
    block[3] = &unk_1E9E521C0;
    block[4] = v8;
    dispatch_async(v9, block);
  }
}

uint64_t __36__VCAudioCaptions_createRecognizer___block_invoke_49(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 449) = 1;
  return result;
}

- (void)destroyRecognizer
{
  SFSpeechRecognizer *recognizer;

  recognizer = self->_recognizer;
  if (recognizer)
  {

    self->_recognizer = 0;
    self->_isSpeechModelLoaded = 0;
  }
}

- (void)recognizerBufferTeardown
{
  SFSpeechRecognitionTask *recognizerTask;
  SFSpeechAudioBufferRecognitionRequest *recognizerRequest;

  recognizerTask = self->_recognizerTask;
  if (recognizerTask)
  {
    -[SFSpeechRecognitionTask finish](recognizerTask, "finish");

    self->_recognizerTask = 0;
  }

  self->_currentTaskInfo = 0;
  recognizerRequest = self->_recognizerRequest;
  if (recognizerRequest)
  {
    -[SFSpeechAudioBufferRecognitionRequest endAudio](recognizerRequest, "endAudio");

    self->_recognizerRequest = 0;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_teardownSemaphore);
}

+ (BOOL)shouldAllocateNewAllocator:(void *)a3 streamDesc:(const AudioStreamBasicDescription *)a4 referenceStreamDesc:(const AudioStreamBasicDescription *)a5
{
  return !a3 || !VCAudioStructs_StreamDescriptionIsEqual((void *)a4, a5);
}

- (BOOL)recognizerBufferSetupWithError:(id *)a3
{
  SFSpeechAudioBufferRecognitionRequest *v5;
  SFSpeechAudioBufferRecognitionRequest *recognizerRequest;
  AVAudioFormat *v7;
  uint64_t v8;
  NSObject *v9;
  id *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  SFSpeechRecognitionTask *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  int v20;
  double v21;
  unint64_t v22;
  const __CFAllocator *v23;
  double v24;
  unint64_t v25;
  CFAllocatorRef audioBufferAllocator;
  char v27;
  uint64_t v28;
  __CFString *v29;
  VCCaptionTaskInfo *v30;
  int64_t currentActiveToken;
  uint64_t v32;
  VCCaptionTaskInfo *v33;
  uint64_t v34;
  NSObject *v35;
  SFSpeechRecognitionTask *recognizerTask;
  OpaqueAudioConverter *audioConverter;
  OpaqueAudioConverter *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  NSObject *v43;
  int v45;
  uint64_t v46;
  AudioConverterRef inAudioConverter;
  $95D729B680665BEAEFA1D6FCA8238556 buf;
  int v49;
  __int16 v50;
  _BYTE v51[10];
  _BYTE v52[6];
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  inAudioConverter = 0;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_teardownSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (SFSpeechAudioBufferRecognitionRequest *)objc_msgSend(+[VCSpeechFrameworkWrapper defaultSpeechFrameworkWrapper](VCSpeechFrameworkWrapper, "defaultSpeechFrameworkWrapper"), "newSFSpeechAudioBufferRecognitionRequest");
  if (!v5)
  {
    v27 = 0;
    v29 = CFSTR("Recognizer request creation failed");
    v28 = 3;
    goto LABEL_28;
  }
  recognizerRequest = v5;
  v7 = -[SFSpeechAudioBufferRecognitionRequest nativeAudioFormat](v5, "nativeAudioFormat");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v46 = *(_QWORD *)-[AVAudioFormat streamDescription](v7, "streamDescription");
      v45 = (int)-[AVAudioFormat streamDescription](v7, "streamDescription")[8];
      v10 = a3;
      v11 = (int)-[AVAudioFormat streamDescription](v7, "streamDescription")[16];
      v12 = (int)-[AVAudioFormat streamDescription](v7, "streamDescription")[20];
      v13 = (int)-[AVAudioFormat streamDescription](v7, "streamDescription")[24];
      v14 = (int)-[AVAudioFormat streamDescription](v7, "streamDescription")[28];
      v15 = (int)-[AVAudioFormat streamDescription](v7, "streamDescription")[32];
      LODWORD(buf.value) = 136317442;
      *(int64_t *)((char *)&buf.value + 4) = v8;
      LOWORD(buf.flags) = 2080;
      *(_QWORD *)((char *)&buf.flags + 2) = "-[VCAudioCaptions recognizerBufferSetupWithError:]";
      HIWORD(buf.epoch) = 1024;
      v49 = 953;
      v50 = 2048;
      *(_QWORD *)v51 = v46;
      *(_WORD *)&v51[8] = 1024;
      *(_DWORD *)v52 = v45;
      *(_WORD *)&v52[4] = 1024;
      v53 = v11;
      a3 = v10;
      v54 = 1024;
      v55 = v12;
      v56 = 1024;
      v57 = v13;
      v58 = 1024;
      v59 = v14;
      v60 = 1024;
      v61 = v15;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Recognizer request created. Preferred format: samplerate=%f formatid=%x bytePerPacket=%d framesPerPacket=%d bytesPerFrame=%d channelsPerFrame=%d bitsPerChannel=%d", (uint8_t *)&buf, 0x4Au);
    }
  }
  -[SFSpeechAudioBufferRecognitionRequest setShouldReportPartialResults:](recognizerRequest, "setShouldReportPartialResults:", 1);
  -[SFSpeechAudioBufferRecognitionRequest setTaskHint:](recognizerRequest, "setTaskHint:", 1004);
  -[SFSpeechAudioBufferRecognitionRequest setTaskIdentifier:](recognizerRequest, "setTaskIdentifier:", self->_taskIdentifier);
  -[SFSpeechAudioBufferRecognitionRequest setRequiresOnDeviceRecognition:](recognizerRequest, "setRequiresOnDeviceRecognition:", 1);
  -[SFSpeechAudioBufferRecognitionRequest setDetectMultipleUtterances:](recognizerRequest, "setDetectMultipleUtterances:", 1);
  -[SFSpeechAudioBufferRecognitionRequest setAddsPunctuation:](recognizerRequest, "setAddsPunctuation:", 1);
  if (+[VCAudioCaptions shouldAllocateNewAllocator:streamDesc:referenceStreamDesc:](VCAudioCaptions, "shouldAllocateNewAllocator:streamDesc:referenceStreamDesc:", self->_audioConverter, -[AVAudioFormat streamDescription](-[SFSpeechAudioBufferRecognitionRequest nativeAudioFormat](recognizerRequest, "nativeAudioFormat"), "streamDescription"), &self->_captionsFormat)|| self->_inputFormatDidChange)
  {
    if (!-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:](self, "createAudioConverterWithInputFormat:outputFormat:converter:", &self->_inputFormat, -[AVAudioFormat streamDescription](-[SFSpeechAudioBufferRecognitionRequest nativeAudioFormat](recognizerRequest, "nativeAudioFormat"), "streamDescription"), &inAudioConverter))
    {
      v27 = 0;
      v16 = 0;
      audioBufferAllocator = 0;
      v28 = 4;
      v29 = CFSTR("Failed to create the converter. Captions will not be available");
      goto LABEL_47;
    }
    self->_inputFormatDidChange = 0;
  }
  else
  {
    inAudioConverter = self->_audioConverter;
  }
  v16 = -[SFSpeechRecognizer recognitionTaskWithRequest:delegate:](self->_recognizer, "recognitionTaskWithRequest:delegate:", recognizerRequest, self);
  if (!v16)
  {
    v27 = 0;
    audioBufferAllocator = 0;
    v28 = 5;
    v29 = CFSTR("recognizer task failed!!");
    goto LABEL_47;
  }
  if (+[VCAudioCaptions shouldAllocateNewAllocator:streamDesc:referenceStreamDesc:](VCAudioCaptions, "shouldAllocateNewAllocator:streamDesc:referenceStreamDesc:", self->_audioBufferAllocator, -[AVAudioFormat streamDescription](-[SFSpeechAudioBufferRecognitionRequest nativeAudioFormat](recognizerRequest, "nativeAudioFormat"), "streamDescription"), &self->_captionsFormat))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = (int)*(double *)-[AVAudioFormat streamDescription](-[SFSpeechAudioBufferRecognitionRequest nativeAudioFormat](recognizerRequest, "nativeAudioFormat"), "streamDescription");
        v20 = (int)-[AVAudioFormat streamDescription](-[SFSpeechAudioBufferRecognitionRequest nativeAudioFormat](recognizerRequest, "nativeAudioFormat"), "streamDescription")[16];
        v21 = *(double *)-[AVAudioFormat streamDescription](-[SFSpeechAudioBufferRecognitionRequest nativeAudioFormat](recognizerRequest, "nativeAudioFormat"), "streamDescription");
        LODWORD(v22) = (_DWORD)-[AVAudioFormat streamDescription](-[SFSpeechAudioBufferRecognitionRequest nativeAudioFormat](recognizerRequest, "nativeAudioFormat"), "streamDescription")[16];
        LODWORD(buf.value) = 136316418;
        *(int64_t *)((char *)&buf.value + 4) = v17;
        LOWORD(buf.flags) = 2080;
        *(_QWORD *)((char *)&buf.flags + 2) = "-[VCAudioCaptions recognizerBufferSetupWithError:]";
        HIWORD(buf.epoch) = 1024;
        v49 = 978;
        v50 = 1024;
        *(_DWORD *)v51 = v19;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v20;
        *(_WORD *)v52 = 1024;
        *(_DWORD *)&v52[2] = (int)(v21 * (double)v22 * 20.0) / 1000;
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Create captions audio buffer allocator: sampleRate=%d, bytesPerPacket=%d, capacity=%d", (uint8_t *)&buf, 0x2Eu);
      }
    }
    v23 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v24 = *(double *)-[AVAudioFormat streamDescription](-[SFSpeechAudioBufferRecognitionRequest nativeAudioFormat](recognizerRequest, "nativeAudioFormat"), "streamDescription");
    LODWORD(v25) = (_DWORD)-[AVAudioFormat streamDescription](-[SFSpeechAudioBufferRecognitionRequest nativeAudioFormat](recognizerRequest, "nativeAudioFormat"), "streamDescription")[16];
    audioBufferAllocator = VCAudioBufferAllocatorCreate(v23, (unint64_t)(v24 * (double)v25 * 20.0 / 1000.0), 2u);
    if (!audioBufferAllocator)
    {
      v27 = 0;
      v28 = 6;
      v29 = CFSTR("Failed to create captions audio buffer allocator!!");
LABEL_47:
      -[SFSpeechAudioBufferRecognitionRequest endAudio](recognizerRequest, "endAudio");

      if (v16)
      if (audioBufferAllocator)
        CFRelease(audioBufferAllocator);
      goto LABEL_28;
    }
  }
  else
  {
    audioBufferAllocator = self->_audioBufferAllocator;
  }
  self->_recognizerTask = v16;
  v30 = [VCCaptionTaskInfo alloc];
  currentActiveToken = self->_currentActiveToken;
  ++self->_currentUtteranceNumber;
  v32 = -[VCCaptionTaskInfo initWithTask:token:utteranceNumber:](v30, "initWithTask:token:utteranceNumber:", v16, currentActiveToken);
  if (!v32)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioCaptions recognizerBufferSetupWithError:].cold.2();
    }
    v29 = 0;
    v28 = 0;
    v27 = 1;
    goto LABEL_47;
  }
  v33 = (VCCaptionTaskInfo *)v32;
  -[NSMutableArray addObject:](self->_captionTasks, "addObject:", v32);
  self->_currentTaskInfo = v33;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      recognizerTask = self->_recognizerTask;
      LODWORD(buf.value) = 136315906;
      *(int64_t *)((char *)&buf.value + 4) = v34;
      LOWORD(buf.flags) = 2080;
      *(_QWORD *)((char *)&buf.flags + 2) = "-[VCAudioCaptions recognizerBufferSetupWithError:]";
      HIWORD(buf.epoch) = 1024;
      v49 = 990;
      v50 = 2048;
      *(_QWORD *)v51 = recognizerTask;
      _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Creating Task=%p", (uint8_t *)&buf, 0x26u);
    }
  }
  if ((self->_lastAudioProcessedTime.flags & 1) != 0)
  {
    buf = self->_lastAudioProcessedTime;
    self->_captionsLastUtteranceStart = CMTimeGetSeconds((CMTime *)&buf);
  }
  self->_recognizerRequest = recognizerRequest;
  self->_audioBufferAllocator = audioBufferAllocator;
  audioConverter = self->_audioConverter;
  if (audioConverter != inAudioConverter)
  {
    if (audioConverter)
    {
      AudioConverterDispose(audioConverter);
      self->_audioConverter = 0;
    }
    CFAllocatorDeallocate(self->_copyBufferAllocator, self->_previousConverterSamples);
    v38 = inAudioConverter;
    self->_previousConverterSamples = 0;
    self->_audioConverter = v38;
    recognizerRequest = self->_recognizerRequest;
  }
  inAudioConverter = 0;
  v39 = -[AVAudioFormat streamDescription](-[SFSpeechAudioBufferRecognitionRequest nativeAudioFormat](recognizerRequest, "nativeAudioFormat"), "streamDescription");
  v28 = 0;
  v29 = 0;
  v40 = *(_QWORD *)(v39 + 32);
  v41 = *(_OWORD *)(v39 + 16);
  *(_OWORD *)&self->_captionsFormat.mSampleRate = *(_OWORD *)v39;
  *(_OWORD *)&self->_captionsFormat.mBytesPerPacket = v41;
  *(_QWORD *)&self->_captionsFormat.mBitsPerChannel = v40;
  v27 = 1;
LABEL_28:
  if (inAudioConverter)
    AudioConverterDispose(inAudioConverter);
  if ((v27 & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (v42 = VRTraceErrorLogLevelToCSTR(),
          v43 = *MEMORY[0x1E0CF2758],
          os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
      -[VCAudioCaptions recognizerBufferSetupWithError:].cold.1(v42, v29, v43);
      if (!a3)
        goto LABEL_35;
    }
    else if (!a3)
    {
LABEL_35:
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_teardownSemaphore);
      return self->_recognizerTask != 0;
    }
    *a3 = +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionCaptionsErrorEvent:errorPath:returnCode:", 7, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 1029), v28);
    goto LABEL_35;
  }
  return self->_recognizerTask != 0;
}

- (id)taskInfoForTask:(id)a3
{
  NSMutableArray *captionTasks;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  captionTasks = self->_captionTasks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](captionTasks, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v7)
        objc_enumerationMutation(captionTasks);
      v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
      if ((id)objc_msgSend(v9, "task") == a3)
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](captionTasks, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315906;
        v14 = v10;
        v15 = 2080;
        v16 = "-[VCAudioCaptions taskInfoForTask:]";
        v17 = 1024;
        v18 = 1043;
        v19 = 2048;
        v20 = a3;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d We could not find the corresponding taskInfo for the task=%p", (uint8_t *)&v13, 0x26u);
      }
    }
    return 0;
  }
  return v9;
}

- (BOOL)configureAnalyzerOptions
{
  SFSpeechAnalyzerOptions *v3;
  SFSpeechAnalyzerTranscriberOptions *transcriberOptions;
  NSLocale *locale;
  _BOOL4 v6;

  v3 = (SFSpeechAnalyzerOptions *)objc_msgSend(+[VCSpeechFrameworkWrapper defaultSpeechFrameworkWrapper](VCSpeechFrameworkWrapper, "defaultSpeechFrameworkWrapper"), "newSFSpeechAnalyzerOptionsWithHighPriority:loggingInfo:powerContext:", 1, 0, 0);
  self->_analyzerOptions = v3;
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      -[VCAudioCaptions configureAnalyzerOptions].cold.1();
    }
    goto LABEL_13;
  }

  transcriberOptions = (SFSpeechAnalyzerTranscriberOptions *)objc_msgSend(+[VCSpeechFrameworkWrapper defaultSpeechFrameworkWrapper](VCSpeechFrameworkWrapper, "defaultSpeechFrameworkWrapper"), "newSFSpeechAnalyzerTranscriberOptions");
  self->_transcriberOptions = transcriberOptions;
  if (!transcriberOptions)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      -[VCAudioCaptions configureAnalyzerOptions].cold.2();
    }
LABEL_13:
    LOBYTE(v6) = 0;
    return v6;
  }
  locale = self->_locale;
  if (!locale)
  {
    locale = (NSLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    transcriberOptions = self->_transcriberOptions;
  }
  -[SFSpeechAnalyzerTranscriberOptions setLocale:](transcriberOptions, "setLocale:", locale);
  -[SFSpeechAnalyzerTranscriberOptions setTaskHint:](self->_transcriberOptions, "setTaskHint:", 1004);
  LOBYTE(v6) = 1;
  return v6;
}

- (void)destroyAnalyzer
{
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  uint64_t v6;
  NSObject *v7;
  SFSpeechAnalyzer *analyzer;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v3;
      v11 = 2080;
      v12 = "-[VCAudioCaptions destroyAnalyzer]";
      v13 = 1024;
      v14 = 1074;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v9, 0x1Cu);
    }
  }
  v5 = dispatch_time(0, 500000000);
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_analyzerAllResultsSemaphore, v5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315650;
        v10 = v6;
        v11 = 2080;
        v12 = "-[VCAudioCaptions destroyAnalyzer]";
        v13 = 1024;
        v14 = 1077;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Waiting for speech analyzer all results did timeout", (uint8_t *)&v9, 0x1Cu);
      }
    }
  }
  analyzer = self->_analyzer;
  if (analyzer)
  {

    self->_analyzer = 0;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_teardownSemaphore);
}

- (void)analyzerTeardown
{
  uint64_t v3;
  NSObject *v4;
  SFSpeechAnalyzerOptions *analyzerOptions;
  SFSpeechAnalyzerTranscriberOptions *transcriberOptions;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCAudioCaptions analyzerTeardown]";
      v11 = 1024;
      v12 = 1087;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v7, 0x1Cu);
    }
  }
  analyzerOptions = self->_analyzerOptions;
  if (analyzerOptions)
  {

    self->_analyzerOptions = 0;
  }
  transcriberOptions = self->_transcriberOptions;
  if (transcriberOptions)
  {

    self->_transcriberOptions = 0;
  }
}

- (BOOL)analyzerSetupWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSString *taskIdentifier;
  AVAudioFormat *analyzerAudioFormat;
  NSOperationQueue *operationQueue;
  id v13;
  SFSpeechAnalyzer *v14;
  VCCaptionTaskInfo *v15;
  SFSpeechAnalyzer *analyzer;
  int64_t currentActiveToken;
  uint64_t v18;
  void *v19;
  OpaqueAudioConverter *audioConverter;
  OpaqueAudioConverter *v21;
  char v22;
  uint64_t v23;
  __int128 v24;
  AudioConverterRef inAudioConverter;
  $95D729B680665BEAEFA1D6FCA8238556 buf;
  VCAudioCaptions *v27;
  NSOperationQueue *v28;
  __int128 v29;
  char v30;
  _BYTE v31[7];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 136315650;
      *(int64_t *)((char *)&buf.value + 4) = v5;
      LOWORD(buf.flags) = 2080;
      *(_QWORD *)((char *)&buf.flags + 2) = "-[VCAudioCaptions analyzerSetupWithError:]";
      HIWORD(buf.epoch) = 1024;
      LODWORD(v27) = 1099;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&buf, 0x1Cu);
    }
  }
  if (!self->_analyzer)
  {
    inAudioConverter = 0;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_teardownSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    if (+[VCAudioCaptions shouldAllocateNewAllocator:streamDesc:referenceStreamDesc:](VCAudioCaptions, "shouldAllocateNewAllocator:streamDesc:referenceStreamDesc:", self->_audioConverter, -[AVAudioFormat streamDescription](self->_analyzerAudioFormat, "streamDescription"), &self->_captionsFormat)|| self->_inputFormatDidChange)
    {
      if (!-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:](self, "createAudioConverterWithInputFormat:outputFormat:converter:", &self->_inputFormat, -[AVAudioFormat streamDescription](self->_analyzerAudioFormat, "streamDescription"), &inAudioConverter))
      {
        v22 = 0;
        v23 = 4;
        goto LABEL_29;
      }
      self->_inputFormatDidChange = 0;
    }
    else
    {
      inAudioConverter = self->_audioConverter;
    }
    taskIdentifier = self->_taskIdentifier;
    operationQueue = self->_operationQueue;
    analyzerAudioFormat = self->_analyzerAudioFormat;
    v24 = *(_OWORD *)&self->_transcriberOptions;
    v13 = +[VCSpeechFrameworkWrapper defaultSpeechFrameworkWrapper](VCSpeechFrameworkWrapper, "defaultSpeechFrameworkWrapper");
    buf.value = (int64_t)taskIdentifier;
    *(_QWORD *)&buf.timescale = analyzerAudioFormat;
    buf.epoch = (int64_t)self;
    v27 = self;
    v28 = operationQueue;
    v29 = v24;
    v30 = 0;
    memset(v31, 170, sizeof(v31));
    v32 = 0;
    v33 = 0;
    v14 = (SFSpeechAnalyzer *)objc_msgSend(v13, "newSFSpeechAnalyzerWithConfig:didChangeVolatileRange:", &buf, &__block_literal_global_61);
    self->_analyzer = v14;
    if (v14)
    {
      v15 = [VCCaptionTaskInfo alloc];
      analyzer = self->_analyzer;
      currentActiveToken = self->_currentActiveToken;
      ++self->_currentUtteranceNumber;
      v18 = -[VCCaptionTaskInfo initWithTask:token:utteranceNumber:](v15, "initWithTask:token:utteranceNumber:", analyzer, currentActiveToken);
      if (v18)
      {
        v19 = (void *)v18;
        -[NSMutableArray addObject:](self->_captionTasks, "addObject:", v18);

        if ((self->_lastAudioProcessedTime.flags & 1) != 0)
        {
          buf = self->_lastAudioProcessedTime;
          self->_captionsLastUtteranceStart = CMTimeGetSeconds((CMTime *)&buf);
        }
        audioConverter = self->_audioConverter;
        if (audioConverter != inAudioConverter)
        {
          if (audioConverter)
          {
            AudioConverterDispose(audioConverter);
            self->_audioConverter = 0;
          }
          CFAllocatorDeallocate(self->_copyBufferAllocator, self->_previousConverterSamples);
          v21 = inAudioConverter;
          self->_previousConverterSamples = 0;
          self->_audioConverter = v21;
        }
        return self->_analyzer != 0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioCaptions analyzerSetupWithError:].cold.2();
      }
      v23 = 0;
      v22 = 1;
    }
    else
    {
      v22 = 0;
      v23 = 3;
    }
LABEL_29:
    if (inAudioConverter)
      AudioConverterDispose(inAudioConverter);
    if ((v22 & 1) != 0)
      return self->_analyzer != 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
      -[VCAudioCaptions analyzerSetupWithError:].cold.1();
      if (!a3)
        goto LABEL_36;
    }
    else if (!a3)
    {
LABEL_36:
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_teardownSemaphore);
      return self->_analyzer != 0;
    }
    *a3 = +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionCaptionsErrorEvent:errorPath:returnCode:", 7, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 1175), v23);
    goto LABEL_36;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 136315650;
      *(int64_t *)((char *)&buf.value + 4) = v7;
      LOWORD(buf.flags) = 2080;
      *(_QWORD *)((char *)&buf.flags + 2) = "-[VCAudioCaptions analyzerSetupWithError:]";
      HIWORD(buf.epoch) = 1024;
      LODWORD(v27) = 1101;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d The speech analyzer already exists!!", (uint8_t *)&buf, 0x1Cu);
    }
  }
  return 1;
}

void __42__VCAudioCaptions_analyzerSetupWithError___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  Float64 Seconds;
  __int128 v10;
  Float64 v11;
  CMTimeValue v12;
  NSObject *v13;
  NSObject *v14;
  Float64 v15;
  CMTime v16;
  CMTimeRange time;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3 || (int)VRTraceGetErrorLogLevelForModule() < 8)
    goto LABEL_8;
  v6 = VRTraceErrorLogLevelToCSTR();
  v7 = *MEMORY[0x1E0CF2758];
  v8 = *MEMORY[0x1E0CF2758];
  if (*MEMORY[0x1E0CF2748])
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_OWORD *)&time.start.value = *(_OWORD *)a2;
      time.start.epoch = *(_QWORD *)(a2 + 16);
      Seconds = CMTimeGetSeconds(&time.start);
      LODWORD(time.start.value) = 136315906;
      *(CMTimeValue *)((char *)&time.start.value + 4) = v6;
      LOWORD(time.start.flags) = 2080;
      *(_QWORD *)((char *)&time.start.flags + 2) = "-[VCAudioCaptions analyzerSetupWithError:]_block_invoke";
      HIWORD(time.start.epoch) = 1024;
      LODWORD(time.duration.value) = 1141;
      WORD2(time.duration.value) = 2048;
      *(Float64 *)((char *)&time.duration.value + 6) = Seconds;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Volatile range changed start, finalized through start time=%f", (uint8_t *)&time, 0x26u);
      if (!a4)
        return;
      goto LABEL_9;
    }
LABEL_8:
    if (!a4)
      return;
    goto LABEL_9;
  }
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    goto LABEL_8;
  *(_OWORD *)&time.start.value = *(_OWORD *)a2;
  time.start.epoch = *(_QWORD *)(a2 + 16);
  v15 = CMTimeGetSeconds(&time.start);
  LODWORD(time.start.value) = 136315906;
  *(CMTimeValue *)((char *)&time.start.value + 4) = v6;
  LOWORD(time.start.flags) = 2080;
  *(_QWORD *)((char *)&time.start.flags + 2) = "-[VCAudioCaptions analyzerSetupWithError:]_block_invoke";
  HIWORD(time.start.epoch) = 1024;
  LODWORD(time.duration.value) = 1141;
  WORD2(time.duration.value) = 2048;
  *(Float64 *)((char *)&time.duration.value + 6) = v15;
  _os_log_debug_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Volatile range changed start, finalized through start time=%f", (uint8_t *)&time, 0x26u);
  if (!a4)
    return;
LABEL_9:
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&time.start.value = *(_OWORD *)a2;
  *(_OWORD *)&time.start.epoch = v10;
  *(_OWORD *)&time.duration.timescale = *(_OWORD *)(a2 + 32);
  CMTimeRangeGetEnd(&v16, &time);
  v11 = CMTimeGetSeconds(&v16);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    v14 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(time.start.value) = 136315906;
        *(CMTimeValue *)((char *)&time.start.value + 4) = v12;
        LOWORD(time.start.flags) = 2080;
        *(_QWORD *)((char *)&time.start.flags + 2) = "-[VCAudioCaptions analyzerSetupWithError:]_block_invoke";
        HIWORD(time.start.epoch) = 1024;
        LODWORD(time.duration.value) = 1145;
        WORD2(time.duration.value) = 2048;
        *(Float64 *)((char *)&time.duration.value + 6) = v11;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Volatile range changed end, finalized through end time=%f", (uint8_t *)&time, 0x26u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __42__VCAudioCaptions_analyzerSetupWithError___block_invoke_cold_1(v12);
    }
  }
}

- (opaqueCMSampleBuffer)createSampleBufferWithFormat:(const AudioStreamBasicDescription *)a3 samples:(char *)a4 numSamples:(int)a5
{
  int mSampleRate;
  UInt32 v8;
  CMTimeValue currentTime;
  CMTimeEpoch epoch;
  const __CFAllocator *v11;
  OSStatus v12;
  OSStatus v13;
  opaqueCMSampleBuffer *result;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  OSStatus v22;
  uint64_t v23;
  NSObject *v24;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef sbuf;
  CMTime presentationTimeStamp;
  int v28;
  __int16 v29;
  OSStatus v30;
  AudioBufferList bufferList;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  formatDescriptionOut = 0;
  sbuf = 0;
  mSampleRate = (int)a3->mSampleRate;
  v8 = a3->mBytesPerPacket * a5;
  self->_timescale = mSampleRate;
  currentTime = self->_currentTime;
  epoch = self->_epoch;
  self->_currentTime = currentTime + a5;
  if (a5 < 0)
    self->_epoch = epoch + 1;
  *(&bufferList.mNumberBuffers + 1) = -1431655766;
  bufferList.mNumberBuffers = 1;
  bufferList.mBuffers[0].mNumberChannels = 1;
  bufferList.mBuffers[0].mDataByteSize = v8;
  bufferList.mBuffers[0].mData = a4;
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, 0, 0, 0, 0, 0, &formatDescriptionOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    LODWORD(presentationTimeStamp.value) = 136315650;
    *(CMTimeValue *)((char *)&presentationTimeStamp.value + 4) = v15;
    LOWORD(presentationTimeStamp.flags) = 2080;
    *(_QWORD *)((char *)&presentationTimeStamp.flags + 2) = "-[VCAudioCaptions createSampleBufferWithFormat:samples:numSamples:]";
    HIWORD(presentationTimeStamp.epoch) = 1024;
    v28 = 1208;
    v17 = " [%s] %s:%d Failed to create format description for captions audio buffer";
    v18 = v16;
    v19 = 28;
LABEL_14:
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&presentationTimeStamp, v19);
    return 0;
  }
  presentationTimeStamp.value = currentTime;
  presentationTimeStamp.timescale = mSampleRate;
  presentationTimeStamp.flags = 1;
  presentationTimeStamp.epoch = epoch;
  v12 = CMAudioSampleBufferCreateWithPacketDescriptions(v11, 0, 0, 0, 0, formatDescriptionOut, a5, &presentationTimeStamp, 0, &sbuf);
  CFRelease(formatDescriptionOut);
  if (v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    LODWORD(presentationTimeStamp.value) = 136315906;
    *(CMTimeValue *)((char *)&presentationTimeStamp.value + 4) = v20;
    LOWORD(presentationTimeStamp.flags) = 2080;
    *(_QWORD *)((char *)&presentationTimeStamp.flags + 2) = "-[VCAudioCaptions createSampleBufferWithFormat:samples:numSamples:]";
    HIWORD(presentationTimeStamp.epoch) = 1024;
    v28 = 1212;
    v29 = 1024;
    v30 = v12;
    v17 = " [%s] %s:%d Failed to create the CMSampleBuffer description for captions: %d";
    v18 = v21;
    v19 = 34;
    goto LABEL_14;
  }
  v13 = CMSampleBufferSetDataBufferFromAudioBufferList(sbuf, v11, self->_audioBufferAllocator, 0, &bufferList);
  if (!v13)
    return sbuf;
  v22 = v13;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v23 = VRTraceErrorLogLevelToCSTR();
    v24 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(presentationTimeStamp.value) = 136315906;
      *(CMTimeValue *)((char *)&presentationTimeStamp.value + 4) = v23;
      LOWORD(presentationTimeStamp.flags) = 2080;
      *(_QWORD *)((char *)&presentationTimeStamp.flags + 2) = "-[VCAudioCaptions createSampleBufferWithFormat:samples:numSamples:]";
      HIWORD(presentationTimeStamp.epoch) = 1024;
      v28 = 1215;
      v29 = 1024;
      v30 = v22;
      _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to create the CMSampleBuffer for captions: %d", (uint8_t *)&presentationTimeStamp, 0x22u);
    }
  }
  result = sbuf;
  if (sbuf)
  {
    CFRelease(sbuf);
    return 0;
  }
  return result;
}

- (id)newPCMSampleBufferWithSamples:(char *)a3 numSamples:(int)a4
{
  size_t v7;
  void *v8;
  void *v9;
  const void *pcmCopyBufferAllocator;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  UInt32 mBytesPerPacket;
  const void *v16;
  _QWORD v17[6];
  _BYTE buf[24];
  _BYTE v19[10];
  __int16 v20;
  UInt32 v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v7 = self->_inputFormat.mBytesPerPacket * a4;
  v8 = CFAllocatorAllocate(self->_pcmCopyBufferAllocator, v7, 0);
  if (v8)
  {
    v9 = v8;
    memcpy(v8, a3, v7);
    LODWORD(v24) = 1;
    v25 = 1;
    v26 = v7;
    v27 = v9;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    *(_QWORD *)v19 = 0xAAAAAAAAAAAAAAAALL;
    pcmCopyBufferAllocator = self->_pcmCopyBufferAllocator;
    if (pcmCopyBufferAllocator)
      pcmCopyBufferAllocator = CFRetain(pcmCopyBufferAllocator);
    *(_QWORD *)v19 = pcmCopyBufferAllocator;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__VCAudioCaptions_newPCMSampleBufferWithSamples_numSamples___block_invoke;
    v17[3] = &unk_1E9E535B8;
    v17[4] = buf;
    v17[5] = v9;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC0]), "initWithPCMFormat:bufferListNoCopy:deallocator:", self->_analyzerAudioFormat, &v24, v17);
    if (!v11)
    {
      CFAllocatorDeallocate(*(CFAllocatorRef *)(*(_QWORD *)&buf[8] + 24), v9);
      v16 = *(const void **)(*(_QWORD *)&buf[8] + 24);
      if (v16)
        CFRelease(v16);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioCaptions newPCMSampleBufferWithSamples:numSamples:].cold.1();
      }
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        mBytesPerPacket = self->_inputFormat.mBytesPerPacket;
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAudioCaptions newPCMSampleBufferWithSamples:numSamples:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)v19 = 1234;
        *(_WORD *)&v19[4] = 1024;
        *(_DWORD *)&v19[6] = a4;
        v20 = 1024;
        v21 = mBytesPerPacket;
        v22 = 1024;
        v23 = v7;
        _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate PCM buffer for captions: numSamples=%d,  bytesPerPacket=%d, totalCapacity=%d", buf, 0x2Eu);
      }
    }
    return 0;
  }
  return v11;
}

void __60__VCAudioCaptions_newPCMSampleBufferWithSamples_numSamples___block_invoke(uint64_t a1)
{
  const void *v2;

  CFAllocatorDeallocate(*(CFAllocatorRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(void **)(a1 + 40));
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    CFRelease(v2);
}

- (void)pushSamplesToAnalyzer:(char *)a3 numSamples:(int)a4 hostTime:(double)a5
{
  OpaqueAudioConverter *audioConverter;
  UInt32 mBytesPerPacket;
  double mSampleRate;
  __CFAllocator *pcmAudioBufferAllocator;
  AVAudioFormat *analyzerAudioFormat;
  UInt32 v13;
  void *v14;
  void *v15;
  CFTypeRef v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  const void *v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  UInt32 ioOutputDataPacketSize;
  _BYTE inInputDataProcUserData[48];
  AudioBufferList outOutputData;
  uint64_t v31;
  int v32;
  int v33;
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  VCCaptionTaskInfo_HostTime((uint64_t)self->_currentTaskInfo);
  audioConverter = self->_audioConverter;
  if (audioConverter)
  {
    mBytesPerPacket = self->_captionsFormat.mBytesPerPacket;
    mSampleRate = self->_inputFormat.mSampleRate;
    v21 = *(_OWORD *)&self->_inputFormat.mBytesPerFrame;
    v22 = *(_OWORD *)&self->_inputFormat.mFormatID;
    pcmAudioBufferAllocator = self->_pcmAudioBufferAllocator;
    analyzerAudioFormat = self->_analyzerAudioFormat;
    v13 = (self->_captionsFormat.mSampleRate * (double)a4 / mSampleRate);
    ioOutputDataPacketSize = v13;
    v14 = CFAllocatorAllocate(pcmAudioBufferAllocator, mBytesPerPacket * v13, 0);
    if (v14)
    {
      v15 = v14;
      outOutputData.mBuffers[0].mData = v14;
      v31 = 1;
      v34 = a3;
      *(_QWORD *)&outOutputData.mNumberBuffers = 1;
      v32 = 1;
      v33 = DWORD2(v22) * a4;
      outOutputData.mBuffers[0].mNumberChannels = 1;
      outOutputData.mBuffers[0].mDataByteSize = mBytesPerPacket * v13;
      *(_QWORD *)inInputDataProcUserData = &v31;
      *(double *)&inInputDataProcUserData[8] = mSampleRate;
      *(_OWORD *)&inInputDataProcUserData[16] = v22;
      *(_OWORD *)&inInputDataProcUserData[32] = v21;
      if (AudioConverterFillComplexBuffer(audioConverter, (AudioConverterComplexInputDataProc)captionsAudioConverterCallback, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioCaptions pushSamplesToAnalyzer:numSamples:hostTime:].cold.3();
        }
        bzero(v15, mBytesPerPacket * v13);
      }
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 0xAAAAAAAAAAAAAAAALL;
      if (pcmAudioBufferAllocator)
        v16 = CFRetain(pcmAudioBufferAllocator);
      else
        v16 = 0;
      v27 = (unint64_t)v16;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = ___VCAudioCaptions_ConvertSamplesToPCM_block_invoke;
      v23[3] = &unk_1E9E535B8;
      v23[4] = &v24;
      v23[5] = v15;
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC0]), "initWithPCMFormat:bufferListNoCopy:deallocator:", analyzerAudioFormat, &outOutputData, v23);
      if (v19)
      {
        _Block_object_dispose(&v24, 8);
        -[VCAudioCaptions recordAudioSampleMetrics](self, "recordAudioSampleMetrics");
        -[SFSpeechAnalyzer addAudio:](self->_analyzer, "addAudio:", v19);

        return;
      }
      CFAllocatorDeallocate((CFAllocatorRef)v25[3], v15);
      v20 = (const void *)v25[3];
      if (v20)
        CFRelease(v20);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioCaptions pushSamplesToAnalyzer:numSamples:hostTime:].cold.2();
      }
      _Block_object_dispose(&v24, 8);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)inInputDataProcUserData = 136316418;
        *(_QWORD *)&inInputDataProcUserData[4] = v17;
        *(_WORD *)&inInputDataProcUserData[12] = 2080;
        *(_QWORD *)&inInputDataProcUserData[14] = "_VCAudioCaptions_ConvertSamplesToPCM";
        *(_WORD *)&inInputDataProcUserData[22] = 1024;
        *(_DWORD *)&inInputDataProcUserData[24] = 450;
        *(_WORD *)&inInputDataProcUserData[28] = 1024;
        *(_DWORD *)&inInputDataProcUserData[30] = v13;
        *(_WORD *)&inInputDataProcUserData[34] = 1024;
        *(_DWORD *)&inInputDataProcUserData[36] = mBytesPerPacket;
        *(_WORD *)&inInputDataProcUserData[40] = 1024;
        *(_DWORD *)&inInputDataProcUserData[42] = mBytesPerPacket * v13;
        _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate PCM copy buffer for captions: sampleCount=%d,  bytesPerPacket=%d, totalCapacity=%d", inInputDataProcUserData, 0x2Eu);
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioCaptions pushSamplesToAnalyzer:numSamples:hostTime:].cold.1();
  }
}

- (void)pushSamplesToRecognizer:(char *)a3 numSamples:(int)a4 hostTime:(double)a5
{
  opaqueCMSampleBuffer *v6;
  opaqueCMSampleBuffer *v7;

  v6 = -[VCAudioCaptions convertSamples:numSamples:](self, "convertSamples:numSamples:", a3, *(_QWORD *)&a4, VCCaptionTaskInfo_HostTime((uint64_t)self->_currentTaskInfo));
  if (v6)
  {
    v7 = v6;
    -[VCAudioCaptions recordAudioSampleMetrics](self, "recordAudioSampleMetrics");
    -[SFSpeechAudioBufferRecognitionRequest appendAudioSampleBuffer:](self->_recognizerRequest, "appendAudioSampleBuffer:", v7);
    CFRelease(v7);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioCaptions pushSamplesToRecognizer:numSamples:hostTime:].cold.1();
  }
}

- (BOOL)shouldPushSamplesToRecognizer
{
  SFSpeechRecognitionTask *recognizerTask;
  BOOL result;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int recognizerState;
  SFSpeechRecognitionTask *v9;
  uint64_t v10;
  _BOOL4 isSpeechModelLoaded;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  SFSpeechRecognitionTask *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_recognizerState == 2)
  {
    recognizerTask = self->_recognizerTask;
    if (recognizerTask)
    {
      if (-[SFSpeechRecognitionTask state](recognizerTask, "state") != SFSpeechRecognitionTaskStateFinishing
        && -[SFSpeechRecognitionTask state](self->_recognizerTask, "state") != SFSpeechRecognitionTaskStateCanceling
        && self->_isSpeechModelLoaded)
      {
        return 1;
      }
    }
  }
  HIDWORD(v5) = -1030792151 * self->_logMessageCounter;
  LODWORD(v5) = HIDWORD(v5);
  if ((v5 >> 1) <= 0x51EB851 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      recognizerState = self->_recognizerState;
      v9 = self->_recognizerTask;
      v10 = -[SFSpeechRecognitionTask state](v9, "state");
      isSpeechModelLoaded = self->_isSpeechModelLoaded;
      v12 = 136316674;
      v13 = v6;
      v14 = 2080;
      v15 = "-[VCAudioCaptions shouldPushSamplesToRecognizer]";
      v16 = 1024;
      v17 = 1313;
      v18 = 1024;
      v19 = recognizerState;
      v20 = 2048;
      v21 = v9;
      v22 = 2048;
      v23 = v10;
      v24 = 1024;
      v25 = isSpeechModelLoaded;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Recognizer state=%d task=%p task.state=%ld _isSpeechModelLoaded=%{BOOL}d", (uint8_t *)&v12, 0x3Cu);
    }
  }
  result = 0;
  ++self->_logMessageCounter;
  return result;
}

- (BOOL)shouldPushSamplesToAnalyzer
{
  BOOL result;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int recognizerState;
  SFSpeechAnalyzer *analyzer;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  SFSpeechAnalyzer *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_recognizerState == 2 && self->_analyzer)
    return 1;
  HIDWORD(v4) = -1030792151 * self->_logMessageCounter;
  LODWORD(v4) = HIDWORD(v4);
  if ((v4 >> 1) <= 0x51EB851 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      recognizerState = self->_recognizerState;
      analyzer = self->_analyzer;
      v9 = 136316162;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCAudioCaptions shouldPushSamplesToAnalyzer]";
      v13 = 1024;
      v14 = 1324;
      v15 = 1024;
      v16 = recognizerState;
      v17 = 2048;
      v18 = analyzer;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Analyzer state=%d analyzer=%p", (uint8_t *)&v9, 0x2Cu);
    }
  }
  result = 0;
  ++self->_logMessageCounter;
  return result;
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  int SampleCount;
  uint64_t AudioBufferList;
  double HostTime;
  uint64_t SampleFormat;
  void *v9;
  NSObject *captionsQueue;
  uint64_t v11;
  NSObject *v12;
  int v13;
  _QWORD v14[7];
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (self->_isEnabled && self->_isStarted)
  {
    SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a3);
    AudioBufferList = VCAudioBufferList_GetAudioBufferList((uint64_t)a3);
    HostTime = VCAudioBufferList_GetHostTime((uint64_t)a3);
    SampleFormat = VCAudioBufferList_GetSampleFormat((uint64_t)a3);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = (void *)0xAAAAAAAAAAAAAAAALL;
    v19 = CFAllocatorAllocate(self->_copyBufferAllocator, (*(_DWORD *)(SampleFormat + 16) * SampleCount), 0);
    v9 = (void *)v17[3];
    if (v9)
    {
      memcpy(v9, *(const void **)(AudioBufferList + 16), (*(_DWORD *)(SampleFormat + 16) * SampleCount));
      captionsQueue = self->_captionsQueue;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __36__VCAudioCaptions_pushAudioSamples___block_invoke;
      v14[3] = &unk_1E9E535E0;
      v14[4] = self;
      v14[5] = &v16;
      v15 = SampleCount;
      *(double *)&v14[6] = HostTime;
      dispatch_async(captionsQueue, v14);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v13 = *(_DWORD *)(SampleFormat + 16);
        *(_DWORD *)buf = 136316418;
        v21 = v11;
        v22 = 2080;
        v23 = "-[VCAudioCaptions pushAudioSamples:]";
        v24 = 1024;
        v25 = 1345;
        v26 = 1024;
        v27 = SampleCount;
        v28 = 1024;
        v29 = v13;
        v30 = 1024;
        v31 = v13 * SampleCount;
        _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate copy buffer for captions: %d %d %d", buf, 0x2Eu);
      }
    }
    _Block_object_dispose(&v16, 8);
  }
}

void __36__VCAudioCaptions_pushAudioSamples___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[11])
  {
    if (objc_msgSend(v2, "shouldPushSamplesToAnalyzer"))
      objc_msgSend(*(id *)(a1 + 32), "pushSamplesToAnalyzer:numSamples:hostTime:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(unsigned int *)(a1 + 56), *(double *)(a1 + 48));
  }
  else if (objc_msgSend(v2, "shouldPushSamplesToRecognizer"))
  {
    objc_msgSend(*(id *)(a1 + 32), "pushSamplesToRecognizer:numSamples:hostTime:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(unsigned int *)(a1 + 56), *(double *)(a1 + 48));
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  CFAllocatorDeallocate(*(CFAllocatorRef *)(v3 + 160), *(void **)(v3 + 328));
  *(_QWORD *)(v3 + 328) = v4;
}

- (void)recordAudioSampleMetrics
{
  int64_t currentTime;
  CMTimeScale timescale;
  CMTimeEpoch epoch;
  double v6;
  $95D729B680665BEAEFA1D6FCA8238556 *p_lastAudioProcessedTime;
  double Seconds;
  CMTime v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  currentTime = self->_currentTime;
  timescale = self->_timescale;
  epoch = self->_epoch;
  if ((self->_lastAudioProcessedTime.flags & 1) != 0)
  {
    p_lastAudioProcessedTime = &self->_lastAudioProcessedTime;
    v9.value = self->_currentTime;
    v9.timescale = timescale;
    v9.flags = 1;
    v9.epoch = epoch;
    Seconds = CMTimeGetSeconds(&v9);
    *(_OWORD *)&v9.value = *(_OWORD *)&p_lastAudioProcessedTime->value;
    v9.epoch = self->_lastAudioProcessedTime.epoch;
    v6 = Seconds - CMTimeGetSeconds(&v9);
  }
  else
  {
    v9.value = self->_currentTime;
    v9.timescale = timescale;
    v9.flags = 1;
    v9.epoch = epoch;
    v6 = CMTimeGetSeconds(&v9);
  }
  self->_captionedAudioDuration = v6 + self->_captionedAudioDuration;
  self->_lastAudioProcessedTime.value = currentTime;
  self->_lastAudioProcessedTime.timescale = timescale;
  self->_lastAudioProcessedTime.flags = 1;
  self->_lastAudioProcessedTime.epoch = epoch;
  ++self->_captioningRequestCount;
}

- (void)packageAndSendTranscribedString:(id)a3 withTask:(id)a4 final:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  void *v10;
  VCCaptionsTranscription *v11;
  VCCaptionsTranscription *v12;
  NSObject *delegateQueue;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[6];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a3, "segments"), "count"))
  {
    -[VCAudioCaptions dumpCaptionsIfNeededForTranscription:final:](self, "dumpCaptionsIfNeededForTranscription:final:", a3, v5);
    if (-[VCAudioCaptions delegate](self, "delegate"))
    {
      v9 = -[VCAudioCaptions taskInfoForTask:](self, "taskInfoForTask:", a4);
      if (v9)
      {
        v10 = v9;
        v11 = -[VCCaptionsTranscription initWithSFTranscription:taskInfo:isLocal:isFinal:]([VCCaptionsTranscription alloc], "initWithSFTranscription:taskInfo:isLocal:isFinal:", a3, v9, self->_isLocal, v5);
        if (v11)
        {
          v12 = v11;
          delegateQueue = self->_delegateQueue;
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __66__VCAudioCaptions_packageAndSendTranscribedString_withTask_final___block_invoke;
          v16[3] = &unk_1E9E52238;
          v16[4] = self;
          v16[5] = v12;
          dispatch_async(delegateQueue, v16);

        }
        objc_msgSend(v10, "setUpdateNumber:", objc_msgSend(v10, "updateNumber") + 1);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v18 = v14;
          v19 = 2080;
          v20 = "-[VCAudioCaptions packageAndSendTranscribedString:withTask:final:]";
          v21 = 1024;
          v22 = 1396;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cannot sendTranscription as we don't have a task for it", buf, 0x1Cu);
        }
      }
    }
  }
}

uint64_t __66__VCAudioCaptions_packageAndSendTranscribedString_withTask_final___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didUpdateCaptions:", *(_QWORD *)(a1 + 40));
}

- (void)packageAndSendTranscriberResult:(id)a3 withTask:(id)a4 final:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  void *v10;
  VCCaptionsTranscription *v11;
  VCCaptionsTranscription *v12;
  NSObject *delegateQueue;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[6];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a3, "segments"), "count") && -[VCAudioCaptions delegate](self, "delegate"))
  {
    v9 = -[VCAudioCaptions taskInfoForTask:](self, "taskInfoForTask:", a4);
    if (v9)
    {
      v10 = v9;
      v11 = -[VCCaptionsTranscription initWithSTTranscriberMultisegmentResult:taskInfo:isLocal:isFinal:]([VCCaptionsTranscription alloc], "initWithSTTranscriberMultisegmentResult:taskInfo:isLocal:isFinal:", a3, v9, self->_isLocal, v5);
      if (v11)
      {
        v12 = v11;
        -[VCAudioCaptions dumpCaptionsIfNeededForCaptionsTranscription:final:](self, "dumpCaptionsIfNeededForCaptionsTranscription:final:", v11, v5);
        delegateQueue = self->_delegateQueue;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __66__VCAudioCaptions_packageAndSendTranscriberResult_withTask_final___block_invoke;
        v16[3] = &unk_1E9E52238;
        v16[4] = self;
        v16[5] = v12;
        dispatch_async(delegateQueue, v16);

      }
      objc_msgSend(v10, "setUpdateNumber:", objc_msgSend(v10, "updateNumber") + 1);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v18 = v14;
        v19 = 2080;
        v20 = "-[VCAudioCaptions packageAndSendTranscriberResult:withTask:final:]";
        v21 = 1024;
        v22 = 1421;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cannot sendTranscription as we don't have a task for it", buf, 0x1Cu);
      }
    }
  }
}

uint64_t __66__VCAudioCaptions_packageAndSendTranscriberResult_withTask_final___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didUpdateCaptions:", *(_QWORD *)(a1 + 40));
}

- (void)dumpCaptionsIfNeededForTranscription:(id)a3 final:(BOOL)a4
{
  void *v6;
  void *logCaptionsDump;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a4 && self->_logCaptionsDump && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(a3, "formattedString");
    logCaptionsDump = self->_logCaptionsDump;
    v8 = objc_msgSend(v6, "UTF8String");
    VRLogfilePrintWithTimestamp((uint64_t)logCaptionsDump, "%s\n", v9, v10, v11, v12, v13, v14, v8);
  }
}

- (void)dumpCaptionsIfNeededForCaptionsTranscription:(id)a3 final:(BOOL)a4
{
  void *logCaptionsDump;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    logCaptionsDump = self->_logCaptionsDump;
    if (logCaptionsDump)
    {
      if (a3)
      {
        v5 = objc_msgSend((id)objc_msgSend(a3, "formattedText"), "UTF8String");
        VRLogfilePrintWithTimestamp((uint64_t)logCaptionsDump, "%s\n", v6, v7, v8, v9, v10, v11, v5);

      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v16 = v12;
          v17 = 2080;
          v18 = "-[VCAudioCaptions dumpCaptionsIfNeededForCaptionsTranscription:final:]";
          v19 = 1024;
          v20 = 1451;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to init transcription for caption dump", buf, 0x1Cu);
        }
      }
    }
  }
}

- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4
{
  NSObject *captionsQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  captionsQueue = self->_captionsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__VCAudioCaptions_speechRecognitionTask_didHypothesizeTranscription___block_invoke;
  v5[3] = &unk_1E9E527D0;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a3;
  dispatch_async(captionsQueue, v5);
}

uint64_t __69__VCAudioCaptions_speechRecognitionTask_didHypothesizeTranscription___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "packageAndSendTranscribedString:withTask:final:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  NSObject *captionsQueue;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = (__int16)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "bestTranscription"), "segments"), "count");
      objc_msgSend((id)objc_msgSend(a4, "speechRecognitionMetadata"), "speechDuration");
      *(_DWORD *)buf = 136316418;
      v14 = v7;
      v15 = 2080;
      v16 = "-[VCAudioCaptions speechRecognitionTask:didFinishRecognition:]";
      v17 = 1024;
      v18 = 1469;
      v19 = 2048;
      v20 = a3;
      v21 = 1024;
      v22 = v9;
      v23 = 2048;
      v24 = v10;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d speechRecognitionTask=%p didFinishRecognition (final) count=%d, duration=%f", buf, 0x36u);
    }
  }
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__VCAudioCaptions_speechRecognitionTask_didFinishRecognition___block_invoke;
  block[3] = &unk_1E9E527D0;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_async(captionsQueue, block);
}

uint64_t __62__VCAudioCaptions_speechRecognitionTask_didFinishRecognition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "packageAndSendTranscribedString:withTask:final:", objc_msgSend(*(id *)(a1 + 40), "bestTranscription"), *(_QWORD *)(a1 + 48), 1);
}

- (void)speechRecognitionTaskWasCancelled:(id)a3
{
  NSObject *captionsQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  captionsQueue = self->_captionsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__VCAudioCaptions_speechRecognitionTaskWasCancelled___block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(captionsQueue, v4);
}

uint64_t __53__VCAudioCaptions_speechRecognitionTaskWasCancelled___block_invoke(uint64_t a1)
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  return objc_msgSend(*(id *)(a1 + 32), "transitionToState:withReason:error:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8), 2, v2);
}

- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  uint64_t v6;
  NSObject *v7;
  NSObject *captionsQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    if (objc_msgSend(a3, "error"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioCaptions speechRecognitionTask:didFinishSuccessfully:].cold.1(v6, a3, v7);
      }
    }
  }
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__VCAudioCaptions_speechRecognitionTask_didFinishSuccessfully___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(captionsQueue, block);
}

uint64_t __63__VCAudioCaptions_speechRecognitionTask_didFinishSuccessfully___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "removeObject:", objc_msgSend(*(id *)(a1 + 32), "taskInfoForTask:", *(_QWORD *)(a1 + 40)));
}

- (void)speechRecognizer:(id)a3 availabilityDidChange:(BOOL)a4
{
  NSObject *captionsQueue;
  _QWORD block[5];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__VCAudioCaptions_speechRecognizer_availabilityDidChange___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v6 = a4;
  dispatch_async(captionsQueue, block);
}

uint64_t __58__VCAudioCaptions_speechRecognizer_availabilityDidChange___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 8) && *(_BYTE *)(v1 + 9))
  {
    v2 = result;
    v8 = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(unsigned __int8 *)(v2 + 40);
        *(_DWORD *)buf = 136315906;
        v10 = v3;
        v11 = 2080;
        v12 = "-[VCAudioCaptions speechRecognizer:availabilityDidChange:]_block_invoke";
        v13 = 1024;
        v14 = 1501;
        v15 = 1024;
        v16 = v5;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Speech model availability status=%d", buf, 0x22u);
      }
    }
    if (*(_BYTE *)(v2 + 40))
      v6 = 4;
    else
      v6 = 1;
    if (*(_BYTE *)(v2 + 40))
      v7 = 2;
    else
      v7 = 1;
    return objc_msgSend(*(id *)(v2 + 32), "transitionToState:withReason:error:", v7, v6, &v8);
  }
  return result;
}

- (void)speechAnalyzer:(id)a3 didProduceTranscriberResult:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  Float64 Seconds;
  NSObject *captionsQueue;
  _QWORD v13[7];
  BOOL v14;
  __int128 v15;
  _OWORD v16[2];
  CMTime time;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  int v29;
  __int16 v30;
  Float64 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a4, "contextualizedTranscriberMultisegmentResult");
  v7 = objc_msgSend(v6, "earResultType");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = (__int16)objc_msgSend((id)objc_msgSend(v6, "segments"), "count");
      if (v6)
      {
        objc_msgSend(v6, "recognitionAudioRange");
      }
      else
      {
        memset(v16, 0, sizeof(v16));
        v15 = 0u;
      }
      time = *(CMTime *)((char *)v16 + 8);
      Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 136316674;
      v19 = v8;
      v20 = 2080;
      v21 = "-[VCAudioCaptions speechAnalyzer:didProduceTranscriberResult:]";
      v22 = 1024;
      v23 = 1514;
      v24 = 2112;
      v25 = a3;
      v26 = 1024;
      v27 = v7 == 4;
      v28 = 1024;
      v29 = v10;
      v30 = 2048;
      v31 = Seconds;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d speechAnalyzer=%@ didProduceTranscriberResult isFinal=%d, count=%d, duration=%f", buf, 0x3Cu);
    }
  }
  captionsQueue = self->_captionsQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__VCAudioCaptions_speechAnalyzer_didProduceTranscriberResult___block_invoke;
  v13[3] = &unk_1E9E53608;
  v13[4] = self;
  v13[5] = v6;
  v13[6] = a3;
  v14 = v7 == 4;
  dispatch_async(captionsQueue, v13);
}

uint64_t __62__VCAudioCaptions_speechAnalyzer_didProduceTranscriberResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "packageAndSendTranscriberResult:withTask:final:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (void)speechAnalyzer:(id)a3 didStopTranscriptionWithError:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316162;
      v10 = v7;
      v11 = 2080;
      v12 = "-[VCAudioCaptions speechAnalyzer:didStopTranscriptionWithError:]";
      v13 = 1024;
      v14 = 1522;
      v15 = 2112;
      v16 = a3;
      v17 = 2112;
      v18 = objc_msgSend(a4, "localizedDescription");
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d speechAnalyzer=%@ didStopTranscriptionWithError=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  if (a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioCaptions speechAnalyzer:didStopTranscriptionWithError:].cold.1();
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_analyzerAllResultsSemaphore);
}

- (void)speechAnalyzerDidProduceAllTranscriberResults:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCAudioCaptions speechAnalyzerDidProduceAllTranscriberResults:]";
      v11 = 1024;
      v12 = 1531;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d speechAnalyzer=%@ speechAnalyzerDidProduceAllTranscriberResults", (uint8_t *)&v7, 0x26u);
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_analyzerAllResultsSemaphore);
}

- (void)speechAnalyzer:(id)a3 didProduceEndpointingResult:(id)a4
{
  double Seconds;
  double v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CMTimeRange v16;
  CMTime v17;
  __int128 v18;
  _OWORD v19[2];
  CMTime time;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    objc_msgSend(a4, "range");
  }
  else
  {
    memset(v19, 0, sizeof(v19));
    v18 = 0u;
  }
  time = *(CMTime *)((char *)v19 + 8);
  Seconds = CMTimeGetSeconds(&time);
  if (a4)
    objc_msgSend(a4, "range");
  else
    memset(&v16, 0, sizeof(v16));
  CMTimeRangeGetEnd(&v17, &v16);
  v7 = CMTimeGetSeconds(&v17);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = (uint64_t)Seconds;
      v11 = objc_msgSend(a4, "wordCount");
      objc_msgSend(a4, "eosLikelihood");
      v13 = v12;
      v14 = objc_msgSend(a4, "pauseCounts");
      objc_msgSend(a4, "silencePosterior");
      *(_DWORD *)buf = 136317442;
      v22 = v8;
      v23 = 2080;
      v24 = "-[VCAudioCaptions speechAnalyzer:didProduceEndpointingResult:]";
      v25 = 1024;
      v26 = 1541;
      v27 = 2112;
      v28 = a3;
      v29 = 2048;
      v30 = v11;
      v31 = 2048;
      v32 = v10;
      v33 = 2048;
      v34 = v13;
      v35 = 2112;
      v36 = v14;
      v37 = 2048;
      v38 = v15;
      v39 = 2048;
      v40 = (uint64_t)(v7 * 1000.0);
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d speechAnalyzer=%@ didProduceEndpointingResult wordcount=%ld, trailingSilenceDuration=%ld, eosLikelihood=%f, pauseCounts=%@, silencePosterior=%f, processedAudioDurationInMilliseconds=%ld", buf, 0x62u);
    }
  }
}

- (void)speechAnalyzer:(id)a3 didStopEndpointingWithError:(id)a4
{
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCAudioCaptions speechAnalyzer:didStopEndpointingWithError:]";
      v12 = 1024;
      v13 = 1545;
      v14 = 2112;
      v15 = a3;
      v16 = 2112;
      v17 = objc_msgSend(a4, "localizedDescription");
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d speechAnalyzer=%@ didStopEndpointingWithError=%@", (uint8_t *)&v8, 0x30u);
    }
  }
}

- (BOOL)captionsDebugDumpEnabled
{
  int ManagedBoolValueForKey;

  ManagedBoolValueForKey = VCDefaults_GetManagedBoolValueForKey(CFSTR("enableCaptionsDump"), 0);
  if (ManagedBoolValueForKey)
    LOBYTE(ManagedBoolValueForKey) = VRTraceIsInternalOSInstalled();
  return ManagedBoolValueForKey;
}

- (NSSet)localLanguages
{
  return self->_localLanguages;
}

- (void)setLocalLanguages:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 384);
}

- (NSSet)remoteLanguages
{
  return self->_remoteLanguages;
}

- (void)setRemoteLanguages:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 392);
}

- (BOOL)remoteCanDisplay
{
  return self->_remoteCanDisplay;
}

- (void)setRemoteCanDisplay:(BOOL)a3
{
  self->_remoteCanDisplay = a3;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

void ___VCAudioCaptions_ConvertSamplesToPCM_block_invoke(uint64_t a1)
{
  const void *v2;

  CFAllocatorDeallocate(*(CFAllocatorRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(void **)(a1 + 40));
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    CFRelease(v2);
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Delegate object is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create delegate queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create semaphore", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the captionsTask array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create _analyzerAllResultsSemaphore", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init analyzer audio format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the PCM copy buffer allocator for captions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init analyzer operation queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createAudioConverterWithInputFormat:outputFormat:converter:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AudioConverterSetProperty(kAudioConverterPrimeMethod) failed with error %d", v2, *(const char **)v3, (unint64_t)"-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)createAudioConverterWithInputFormat:outputFormat:converter:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d newAudioResamplerWithInputFormat failed with error %d", v2, *(const char **)v3, (unint64_t)"-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)convertSamples:numSamples:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioCaptions convertSamples:numSamples:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AudioConverterFillComplexBuffer failed with %d", v2, *(const char **)v3, (unint64_t)"-[VCAudioCaptions convertSamples:numSamples:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)loadedStateToState:withReason:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup speech recognizer for running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __38__VCAudioCaptions_handleStateStopping__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  const char *v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v7 = 136315906;
  v8 = a1;
  OUTLINED_FUNCTION_7_1();
  v9 = "-[VCAudioCaptions handleStateStopping]_block_invoke";
  OUTLINED_FUNCTION_4();
  v10 = 584;
  v11 = 2112;
  v12 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v6, " [%s] %s:%d Finishing analyzing failed with the error=%@", (uint8_t *)&v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)transitionToState:(uint64_t)a1 withReason:(void *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, void ***a2, NSObject *a3)
{
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = **a2;
  if (v5)
    objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
  v9 = 136315906;
  v10 = a1;
  OUTLINED_FUNCTION_7_1();
  v11 = "-[VCAudioCaptions transitionToState:withReason:error:]";
  v12 = 1024;
  v13 = 660;
  v14 = v6;
  v15 = v7;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v8, " [%s] %s:%d Failed captions state transition. Error=%s", (uint8_t *)&v9);
  OUTLINED_FUNCTION_3_0();
}

void __34__VCAudioCaptions_enableCaptions___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Speech framework not loaded for captioning feature", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reallocCopyBufferAllocatorWithFormat:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the copy buffer allocator for captions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__VCAudioCaptions_start_forToken_withCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the PCM copy buffer allocator for captions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__VCAudioCaptions_start_forToken_withCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Starting speech recognizer but it is already started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__VCAudioCaptions_stopWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stopping speech recognizer but it is already stopped", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)recognizerBufferSetupWithError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  v8 = 136315906;
  v9 = a1;
  OUTLINED_FUNCTION_7_1();
  v10 = "-[VCAudioCaptions recognizerBufferSetupWithError:]";
  v11 = 1024;
  v12 = 1027;
  v13 = v5;
  v14 = v6;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v7, " [%s] %s:%d %s", (uint8_t *)&v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)recognizerBufferSetupWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d taskInfo failed to allocate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureAnalyzerOptions
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init speech analyzer transcriber options", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)analyzerSetupWithError:.cold.1()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCAudioCaptions analyzerSetupWithError:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d error=%@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)analyzerSetupWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init analyzerInfo", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __42__VCAudioCaptions_analyzerSetupWithError___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  const char *v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  OUTLINED_FUNCTION_7_1();
  v5 = "-[VCAudioCaptions analyzerSetupWithError:]_block_invoke";
  OUTLINED_FUNCTION_4();
  v6 = 1145;
  v7 = 2048;
  v8 = v1;
  _os_log_debug_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Volatile range changed end, finalized through end time=%f", (uint8_t *)&v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)newPCMSampleBufferWithSamples:numSamples:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init PCM audio buffer.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)pushSamplesToAnalyzer:numSamples:hostTime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Sample PCM buffer is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)pushSamplesToAnalyzer:numSamples:hostTime:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init PCM audio buffer.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)pushSamplesToAnalyzer:numSamples:hostTime:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "_VCAudioCaptions_ConvertSamplesToPCM";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AudioConverterFillComplexBuffer failed with result=%d", v2, *(const char **)v3, (unint64_t)"_VCAudioCaptions_ConvertSamplesToPCM" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)pushSamplesToRecognizer:numSamples:hostTime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Sample buffer is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)speechRecognitionTask:(NSObject *)a3 didFinishSuccessfully:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6;
  __int16 v7;
  int v8;
  int v9;
  uint64_t v10;
  const char *v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend((id)objc_msgSend(a2, "error"), "localizedDescription");
  objc_msgSend((id)objc_msgSend(a2, "error"), "code");
  v9 = 136316162;
  v10 = a1;
  OUTLINED_FUNCTION_7_1();
  v11 = "-[VCAudioCaptions speechRecognitionTask:didFinishSuccessfully:]";
  OUTLINED_FUNCTION_4();
  v12 = 1484;
  v13 = 2112;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Task failed with error: %@, status: %d", (uint8_t *)&v9, 0x2Cu);
}

- (void)speechAnalyzer:didStopTranscriptionWithError:.cold.1()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCAudioCaptions speechAnalyzer:didStopTranscriptionWithError:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Analyzer failed with error=%@", v1);
  OUTLINED_FUNCTION_3();
}

@end
