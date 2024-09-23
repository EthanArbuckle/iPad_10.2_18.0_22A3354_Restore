@implementation VCVideoStreamTransmitter

- (VCVideoStreamTransmitter)initWithConfig:(id)a3
{
  VCVideoStreamTransmitter *v4;
  unsigned int v5;
  double v6;
  double v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int encodingWidth;
  unsigned int encodingHeight;
  VCVideoRule *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  NSObject *CustomRootQueue;
  const __CFAllocator *v17;
  const CMBufferCallbacks *CallbacksForUnsortedSampleBuffers;
  uint64_t v19;
  opaqueRTCReporting *reportingAgent;
  opaqueRTCReporting *v21;
  __int128 v22;
  objc_super v24;
  CMTime buf;
  int v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)VCVideoStreamTransmitter;
  v4 = -[VCVideoStreamTransmitter init](&v24, sel_init);
  if (!v4)
  {
LABEL_32:

    return 0;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamTransmitter initWithConfig:].cold.1();
    }
    goto LABEL_32;
  }
  v4->_videoCodecType = objc_msgSend(a3, "codecType");
  v4->_videoSource = objc_msgSend(a3, "videoSource");
  if ((unint64_t)objc_msgSend(a3, "framerate") <= 0x3C && objc_msgSend(a3, "framerate"))
    v4->super._targetFramerate = objc_msgSend(a3, "framerate");
  v4->super._txMaxBitrate = objc_msgSend(a3, "txMaxBitrate");
  v4->super._txMinBitrate = objc_msgSend(a3, "txMinBitrate");
  v4->super._temporaryMaximumBitrate = objc_msgSend(a3, "txMinBitrate");
  if (objc_msgSend(a3, "videoResolution") == 27)
  {
    v4->super._encodingWidth = objc_msgSend(a3, "customWidth");
    v5 = objc_msgSend(a3, "customHeight");
  }
  else
  {
    +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", objc_msgSend(a3, "videoResolution"));
    v4->super._encodingWidth = v6;
    v5 = v7;
  }
  v4->super._encodingHeight = v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      encodingWidth = v4->super._encodingWidth;
      encodingHeight = v4->super._encodingHeight;
      LODWORD(buf.value) = 136316162;
      *(CMTimeValue *)((char *)&buf.value + 4) = v8;
      LOWORD(buf.flags) = 2080;
      *(_QWORD *)((char *)&buf.flags + 2) = "-[VCVideoStreamTransmitter initWithConfig:]";
      HIWORD(buf.epoch) = 1024;
      v26 = 140;
      v27 = 1024;
      v28 = encodingWidth;
      v29 = 1024;
      v30 = encodingHeight;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d encode = %dx%d", (uint8_t *)&buf, 0x28u);
    }
  }
  v4->_stats = objc_alloc_init(VCMediaStreamStats);
  pthread_mutex_init(&v4->_xMBs, 0);
  v4->_recommendedMTU = objc_msgSend(a3, "recommendedMTU");
  v4->_statisticsCollector = (AVCStatisticsCollector *)(id)objc_msgSend(a3, "statisticsCollector");
  v4->_keyFrameIntervalDuration = objc_msgSend(a3, "keyFrameInterval");
  v12 = [VCVideoRule alloc];
  v13 = v4->super._encodingWidth;
  v14 = v4->super._encodingHeight;
  *(float *)&v15 = (float)(unint64_t)objc_msgSend(a3, "framerate");
  v4->super._videoRule = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:](v12, "initWithFrameWidth:frameHeight:frameRate:", v13, v14, v15);
  v4->_dwRefreshFrameCounter = 0;
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v4->_transmitterQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoStreamTransmitter.transmitterQueue", 0, CustomRootQueue);
  v17 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CallbacksForUnsortedSampleBuffers = CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
  if (CMBufferQueueCreate(v17, 0, CallbacksForUnsortedSampleBuffers, &v4->_bufferQueue))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamTransmitter initWithConfig:].cold.4();
    }
    goto LABEL_32;
  }
  if (VTU_CreatePacketAllocator(objc_msgSend(a3, "recommendedMTU"), (uint64_t)v17, &v4->_videoPacketAllocator))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamTransmitter initWithConfig:].cold.3();
    }
    goto LABEL_32;
  }
  v4->_bufferQueueSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  v19 = VCRealTimeThread_Initialize(18, (uint64_t)VCVideoStreamEncoderProc, (uint64_t)v4, "com.apple.AVConference.VCVideoStreamTransmitter.encoderThread", 0);
  v4->_encoderThread = (tagVCRealTimeThread *)v19;
  if (!v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamTransmitter initWithConfig:].cold.2();
    }
    goto LABEL_32;
  }
  -[VCVideoStreamTransmitter generateKeyFrameWithFIRType:](v4, "generateKeyFrameWithFIRType:", 0);
  v4->_forceDisableBitrateCap = -[VCDefaults forceVideoStreamDisableBitrateCap](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoStreamDisableBitrateCap");
  reportingAgent = v4->_reportingAgent;
  v21 = (opaqueRTCReporting *)objc_msgSend(a3, "reportingAgent");
  v4->_reportingAgent = v21;
  if (v21)
    CFRetain(v21);
  if (reportingAgent)
    CFRelease(reportingAgent);
  v4->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
  objc_msgSend(a3, "reportingParentID");
  reportingInheritModuleSpecificInfoFromParent();
  v4->_enableCVO = objc_msgSend(a3, "enableCVO");
  v4->_cvoExtensionID = objc_msgSend(a3, "cvoExtensionID");
  v4->super._controlInfoGenerator = VCMediaControlInfoGeneratorCreateWithType(2);
  v4->_videoRTP = *(tagHANDLE **)objc_msgSend(a3, "streamConfigs");
  v4->super._timestamp = 0;
  CMTimeMake(&buf, 0, 90000);
  v22 = *(_OWORD *)&buf.value;
  v4->super._latestSampleBufferTimestamp.epoch = buf.epoch;
  *(_OWORD *)&v4->super._latestSampleBufferTimestamp.value = v22;
  v4->_encodingArgPool = (tagVCMemoryPool *)VCMemoryPool_Create(0x1C8uLL);
  v4->_tilesPerFrame = objc_msgSend(a3, "tilesPerFrame");
  v4->super._profileLevel = (NSString *)(id)objc_msgSend(a3, "profileLevel");
  v4->super._realtimeSPI.setFECRatio = VCVideoStreamTransmitter_SetFECRatio;
  v4->super._realtimeSPI.enqueueVideoFrame = VCVideoStreamTransmitter_EnqueueVideoFrame;
  v4->super._realtimeSPI.setMediaQueueSize = VCVideoStreamTransmitter_SetMediaQueueSize;
  return v4;
}

- (void)dealloc
{
  opaqueCMBufferQueue *bufferQueue;
  char *buffer;
  opaqueRTCReporting *reportingAgent;
  void *controlInfoGenerator;
  __CFAllocator *videoPacketAllocator;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  pthread_mutex_destroy(&self->_xMBs);

  VCRealTimeThread_Finalize((uint64_t)self->_encoderThread);
  dispatch_release((dispatch_object_t)self->_transmitterQueue);
  dispatch_release((dispatch_object_t)self->_bufferQueueSemaphore);
  bufferQueue = self->_bufferQueue;
  if (bufferQueue)
    CFRelease(bufferQueue);
  buffer = self->_buffer;
  if (buffer)
    free(buffer);
  free(self->_packetSizes);
  free(self->_packetFlags);

  VCMemoryPool_Destroy((OSQueueHead *)self->_encodingArgPool);
  reportingCacheModuleSpecificInfo();
  reportingAgent = self->_reportingAgent;
  if (reportingAgent)
    CFRelease(reportingAgent);
  controlInfoGenerator = self->super._controlInfoGenerator;
  if (controlInfoGenerator)
    CFRelease(controlInfoGenerator);
  videoPacketAllocator = self->_videoPacketAllocator;
  if (videoPacketAllocator)
    CFRelease(videoPacketAllocator);

  v8.receiver = self;
  v8.super_class = (Class)VCVideoStreamTransmitter;
  -[VCVideoTransmitterBase dealloc](&v8, sel_dealloc);
}

- (void)startVideo
{
  uint64_t v3;
  NSObject *v4;
  NSObject *transmitterQueue;
  _QWORD block[5];
  uint8_t buf[4];
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
      *(_DWORD *)buf = 136315650;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCVideoStreamTransmitter startVideo]";
      v11 = 1024;
      v12 = 224;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCVideoStreamTransmitter startVideo", buf, 0x1Cu);
    }
  }
  transmitterQueue = self->_transmitterQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__VCVideoStreamTransmitter_startVideo__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_sync(transmitterQueue, block);
}

uint64_t __38__VCVideoStreamTransmitter_startVideo__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 224) = 0;
  objc_msgSend(*(id *)(a1 + 32), "initVideoCompressionWithWidth:height:bitrate:keyFrameIntervalDuration:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 28), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 52), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 260));
  VCRealTimeThread_Start(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
  return reportingRegisterPeriodicTaskWeak();
}

uint64_t __38__VCVideoStreamTransmitter_startVideo__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "gatherRealtimeStats:");
}

- (void)stopVideo
{
  NSObject *transmitterQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  transmitterQueue = self->_transmitterQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__VCVideoStreamTransmitter_stopVideo__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_sync(transmitterQueue, v3);
}

intptr_t __37__VCVideoStreamTransmitter_stopVideo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  intptr_t result;
  uint64_t v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 400))
  {
    reportingUnregisterPeriodicTask();
    v2 = *(_QWORD *)(a1 + 32);
  }
  VCRealTimeThread_Stop(*(_QWORD *)(v2 + 176));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 184) = 1;
  result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 192));
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (_QWORD *)(v4 + 416);
    result = *(_QWORD *)(v4 + 432);
    if (result != 0xFFFFFFFFLL)
    {
      result = (*(uint64_t (**)(void))(*v5 + 8))();
      v5[2] = 0xFFFFFFFFLL;
    }
  }
  return result;
}

- (void)generateKeyFrameWithFIRType:(int)a3
{
  int *p_shouldGenerateKeyFrame;
  int v6;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_shouldGenerateKeyFrame = &self->_shouldGenerateKeyFrame;
  while (!__ldxr((unsigned int *)p_shouldGenerateKeyFrame))
  {
    v6 = 1;
    if (!__stxr(1u, (unsigned int *)p_shouldGenerateKeyFrame))
      goto LABEL_6;
  }
  v6 = 0;
  __clrex();
LABEL_6:
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315906;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VCVideoStreamTransmitter generateKeyFrameWithFIRType:]";
        v16 = 1024;
        v17 = 281;
        v18 = 1024;
        v19 = a3;
        v10 = " [%s] %s:%d key frame requested for next pixel buffer, FIRType %d.";
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x22u);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315906;
      v13 = v11;
      v14 = 2080;
      v15 = "-[VCVideoStreamTransmitter generateKeyFrameWithFIRType:]";
      v16 = 1024;
      v17 = 283;
      v18 = 1024;
      v19 = a3;
      v10 = " [%s] %s:%d key frame was already requested, FIRType: %d";
      goto LABEL_13;
    }
  }
}

- (unsigned)setTemporaryMaximumBitrate:(unsigned int)a3
{
  NSObject *transmitterQueue;
  _QWORD block[5];
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  transmitterQueue = self->_transmitterQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__VCVideoStreamTransmitter_setTemporaryMaximumBitrate___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v7 = a3;
  dispatch_sync(transmitterQueue, block);
  return self->super._temporaryMaximumBitrate;
}

void __55__VCVideoStreamTransmitter_setTemporaryMaximumBitrate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  unsigned int v3;
  const void *v4;
  const __CFAllocator *v5;
  CFMutableArrayRef Mutable;
  __CFArray *v7;
  CFNumberRef v8;
  CFNumberRef v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if (*(_QWORD *)(v1 + 432) != 0xFFFFFFFFLL)
    {
      v4 = (const void *)(a1 + 40);
      v3 = *(_DWORD *)(a1 + 40);
      if (*(_DWORD *)(v1 + 52) != v3 && *(_DWORD *)(v1 + 44) >= v3 && *(_DWORD *)(v1 + 48) <= v3)
      {
        v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
        if (Mutable)
        {
          v7 = Mutable;
          v8 = CFNumberCreate(v5, kCFNumberIntType, v4);
          if (v8)
          {
            v9 = v8;
            CFArrayAppendValue(v7, v8);
            CFRelease(v9);
            v10 = *(_QWORD *)(a1 + 32);
            if (v10)
            {
              v11 = (_QWORD *)(v10 + 416);
              v12 = v11[2];
              if (v12 != 0xFFFFFFFFLL)
                (*(void (**)(uint64_t, __CFArray *))(*v11 + 24))(v12, v7);
            }
            CFRelease(v7);
            *(_DWORD *)(*(_QWORD *)(a1 + 32) + 52) = *(_DWORD *)(a1 + 40);
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              __55__VCVideoStreamTransmitter_setTemporaryMaximumBitrate___block_invoke_cold_2();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __55__VCVideoStreamTransmitter_setTemporaryMaximumBitrate___block_invoke_cold_1();
        }
      }
    }
  }
}

- (void)setTargetBitrate:(unsigned int)a3
{
  if (self->super._temporaryMaximumBitrate >= a3 && self->super._txMaxBitrate >= a3 && self->super._txMinBitrate <= a3)
  {
    self->super._targetBitrate = a3;
    -[VCVideoStreamTransmitter setTemporaryMaximumBitrate:](self, "setTemporaryMaximumBitrate:");
  }
}

- (void)setFECRedundancyVector:(id *)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStreamTransmitter setFECRedundancyVector:].cold.1();
  }
}

- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStreamTransmitter setMediaSuggestion:].cold.1();
  }
}

- (BOOL)setEncodingMode:(int)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStreamTransmitter setEncodingMode:].cold.1();
  }
  return 0;
}

- (void)handleThermalLevelChange:(int)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStreamTransmitter handleThermalLevelChange:].cold.1();
  }
}

- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStreamTransmitter updateWindowState:isLocal:windowRect:].cold.1();
  }
}

- (void)initVideoCompressionWithWidth:(unsigned int)a3 height:(unsigned int)a4 bitrate:(unsigned int)a5 keyFrameIntervalDuration:(unsigned int)a6
{
  unsigned int tilesPerFrame;
  NSString *profileLevel;
  $FD0A8E883267962782B632A32514C554 *p_encoder;
  _DWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v16 = 0u;
  v17 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v9[0] = a3;
  v9[1] = a4;
  DWORD2(v11) = a5;
  LODWORD(v10) = a6;
  tilesPerFrame = self->_tilesPerFrame;
  *(_QWORD *)&v16 = encoderFrameCallback;
  *((_QWORD *)&v16 + 1) = self;
  profileLevel = self->super._profileLevel;
  DWORD1(v17) = tilesPerFrame;
  v22 = 0;
  *(_QWORD *)&v18 = profileLevel;
  p_encoder = &self->_encoder;
  VCVideoEncoderVTInitialize((uint64_t)&self->_encoder);
  if (p_encoder->encoderHandle == (tagHANDLE *)0xFFFFFFFFLL)
    (*(void (**)(tagHANDLE **, _DWORD *))p_encoder->encoderVTable)(&p_encoder->encoderHandle, v9);
}

- (__CFDictionary)forceKeyFrameProperties
{
  int *p_shouldGenerateKeyFrame;
  unsigned int v3;
  __CFDictionary *result;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  p_shouldGenerateKeyFrame = &self->_shouldGenerateKeyFrame;
  while (1)
  {
    v3 = __ldxr((unsigned int *)p_shouldGenerateKeyFrame);
    if (v3 != 1)
      break;
    if (!__stxr(0, (unsigned int *)p_shouldGenerateKeyFrame))
    {
      ++self->_totalKeyFramesSent;
      keys[0] = *(void **)MEMORY[0x1E0CED5B8];
      values = (void *)*MEMORY[0x1E0C9AE50];
      return CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    }
  }
  result = 0;
  __clrex();
  return result;
}

- (void)encodeVideoFrame:(opaqueCMSampleBuffer *)a3
{
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v6;
  __CFDictionary *v7;
  const __CFNumber *v8;
  char *v9;
  tagHANDLE *encoderHandle;
  int v11;
  BOOL v12;
  CMTime v13;
  int valuePtr;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    v6 = ImageBuffer;
    v7 = -[VCVideoStreamTransmitter forceKeyFrameProperties](self, "forceKeyFrameProperties");
    valuePtr = -1431655766;
    v8 = (const __CFNumber *)CMGetAttachment(a3, CFSTR("cameraStatusBits"), 0);
    CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
    v9 = (char *)VCMemoryPool_Alloc((OSQueueHead *)self->_encodingArgPool);
    *((_QWORD *)v9 + 11) = v6;
    *((_QWORD *)v9 + 40) = v7;
    CMSampleBufferGetOutputPresentationTimeStamp(&v13, a3);
    *(CMTime *)(v9 + 292) = v13;
    v9[328] = valuePtr;
    encoderHandle = self->_encoder.encoderHandle;
    if (encoderHandle == (tagHANDLE *)0xFFFFFFFFLL
      || ((v11 = (*((uint64_t (**)(tagHANDLE *, char *))self->_encoder.encoderVTable + 4))(encoderHandle, v9),
           v11 != -2146959339)
        ? (v12 = v11 == -2146959358)
        : (v12 = 1),
          v12))
    {
      VCMemoryPool_Free((OSQueueHead *)self->_encodingArgPool, v9);
    }
    if (v7)
      CFRelease(v7);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStreamTransmitter encodeVideoFrame:].cold.1();
  }
}

- (BOOL)prependSPSPPS:(unint64_t *)a3 dataPointer:(char *)a4 sampleBuffer:(opaqueCMSampleBuffer *)a5
{
  size_t bufferSize;
  char *buffer;
  char *v11;
  size_t SPSPPSFromSampleBuffer;
  BOOL result;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  bufferSize = *a3 + 400;
  buffer = self->_buffer;
  if (self->_bufferSize >= bufferSize)
  {
    bufferSize = self->_bufferSize;
    goto LABEL_7;
  }
  if (buffer)
    free(self->_buffer);
  v11 = (char *)malloc_type_malloc(bufferSize, 0xFCF6ECDEuLL);
  self->_buffer = v11;
  if (v11)
  {
    buffer = v11;
    self->_bufferSize = bufferSize;
LABEL_7:
    SPSPPSFromSampleBuffer = VideoUtil_ExtractSPSPPSFromSampleBuffer(a5, (uint64_t)buffer, bufferSize);
    memcpy(&self->_buffer[SPSPPSFromSampleBuffer], a4, *a3);
    *a3 += SPSPPSFromSampleBuffer;
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    return 0;
  v14 = VRTraceErrorLogLevelToCSTR();
  v15 = *MEMORY[0x1E0CF2758];
  v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v16)
  {
    v17 = self->_bufferSize;
    v18 = 136315906;
    v19 = v14;
    v20 = 2080;
    v21 = "-[VCVideoStreamTransmitter prependSPSPPS:dataPointer:sampleBuffer:]";
    v22 = 1024;
    v23 = 445;
    v24 = 1024;
    v25 = v17;
    _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendFrame: Error while allocating %d bytes", (uint8_t *)&v18, 0x22u);
    return 0;
  }
  return result;
}

- (BOOL)isKeyFrame:(opaqueCMSampleBuffer *)a3
{
  const __CFArray *SampleAttachmentsArray;
  CFIndex Count;
  const __CFDictionary *ValueAtIndex;
  CFBooleanRef BOOLean[2];

  BOOLean[1] = *(CFBooleanRef *)MEMORY[0x1E0C80C00];
  SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(a3, 0);
  Count = CFArrayGetCount(SampleAttachmentsArray);
  if (Count)
  {
    BOOLean[0] = 0;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
    if (CFDictionaryGetValueIfPresent(ValueAtIndex, (const void *)*MEMORY[0x1E0CA2620], (const void **)BOOLean))
      LOBYTE(Count) = CFBooleanGetValue(BOOLean[0]) == 0;
    else
      LOBYTE(Count) = 1;
  }
  return Count;
}

- (void)transmitEncodedVideoFrame:(opaqueCMSampleBuffer *)a3 cameraStatusBits:(unsigned __int8)a4
{
  uint64_t v4;
  OpaqueCMBlockBuffer *DataBuffer;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  $95D729B680665BEAEFA1D6FCA8238556 *p_latestSampleBufferTimestamp;
  CMTimeValue value;
  uint64_t v15;
  CMTimeEpoch epoch;
  __int128 v17;
  CMTimeEpoch v18;
  double Seconds;
  int lastCameraStatusBits;
  BOOL v21;
  int v22;
  char **p_dataPointerOut;
  int v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  int v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  CMTime v35;
  CMTime rhs;
  CMTime lhs;
  CMTime v38;
  char *dataPointerOut;
  size_t SampleSize;
  CMTime buf;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  _BOOL4 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return;
  v4 = a4;
  dataPointerOut = 0;
  SampleSize = CMSampleBufferGetSampleSize(a3, 0);
  if (SampleSize)
  {
    DataBuffer = CMSampleBufferGetDataBuffer(a3);
    if (DataBuffer)
    {
      if (CMBlockBufferGetDataPointer(DataBuffer, 0, 0, 0, &dataPointerOut)
        && (int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        v10 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.value) = 136315650;
            *(CMTimeValue *)((char *)&buf.value + 4) = v8;
            LOWORD(buf.flags) = 2080;
            *(_QWORD *)((char *)&buf.flags + 2) = "-[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:]";
            HIWORD(buf.epoch) = 1024;
            v42 = 488;
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendFrame: Error: Error getting data buffer", (uint8_t *)&buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          -[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:].cold.3();
        }
      }
    }
  }
  v11 = -[VCVideoStreamTransmitter isKeyFrame:](self, "isKeyFrame:", a3);
  if (dataPointerOut)
  {
    v12 = v11;
    if (v11
      && !-[VCVideoStreamTransmitter prependSPSPPS:dataPointer:sampleBuffer:](self, "prependSPSPPS:dataPointer:sampleBuffer:", &SampleSize))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v33 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        v34 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.value) = 136315650;
            *(CMTimeValue *)((char *)&buf.value + 4) = v33;
            LOWORD(buf.flags) = 2080;
            *(_QWORD *)((char *)&buf.flags + 2) = "-[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:]";
            HIWORD(buf.epoch) = 1024;
            v42 = 502;
            v27 = " [%s] %s:%d Failed To Prepend SPS/PPS";
            goto LABEL_34;
          }
        }
        else if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          -[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:].cold.2();
        }
      }
      return;
    }
    memset(&v38, 170, sizeof(v38));
    CMSampleBufferGetPresentationTimeStamp(&v38, a3);
    p_latestSampleBufferTimestamp = &self->super._latestSampleBufferTimestamp;
    value = self->super._latestSampleBufferTimestamp.value;
    if (value)
    {
      lhs = v38;
      *(_OWORD *)&rhs.value = *(_OWORD *)&p_latestSampleBufferTimestamp->value;
      rhs.epoch = self->super._latestSampleBufferTimestamp.epoch;
      CMTimeSubtract(&buf, &lhs, &rhs);
      value = buf.value;
      v15 = *(_QWORD *)&buf.timescale;
      epoch = buf.epoch;
    }
    else
    {
      v15 = *(_QWORD *)&self->super._latestSampleBufferTimestamp.timescale;
      epoch = self->super._latestSampleBufferTimestamp.epoch;
    }
    memset(&v35, 170, sizeof(v35));
    buf.value = value;
    *(_QWORD *)&buf.timescale = v15;
    buf.epoch = epoch;
    CMTimeConvertScale(&v35, &buf, 90000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    self->super._timestamp += LODWORD(v35.value);
    v17 = *(_OWORD *)&v38.value;
    *(_OWORD *)&p_latestSampleBufferTimestamp->value = *(_OWORD *)&v38.value;
    v18 = v38.epoch;
    self->super._latestSampleBufferTimestamp.epoch = v38.epoch;
    *(_OWORD *)&buf.value = v17;
    buf.epoch = v18;
    Seconds = CMTimeGetSeconds(&buf);
    if (self->_enableCVO
      && ((lastCameraStatusBits = self->_lastCameraStatusBits, (lastCameraStatusBits & 0x80u) == 0)
        ? (v21 = lastCameraStatusBits == (_DWORD)v4)
        : (v21 = 0),
          !v21 ? (v22 = 1) : (v22 = v12),
          v22 == 1))
    {
      self->_lastCameraStatusBits = v4;
      if (!v12)
      {
LABEL_26:
        p_dataPointerOut = &dataPointerOut;
        goto LABEL_29;
      }
    }
    else
    {
      v4 = 0;
      if (!v12)
        goto LABEL_26;
    }
    p_dataPointerOut = &self->_buffer;
LABEL_29:
    v24 = -[VCVideoStreamTransmitter transmitEncodedVideoFrame:size:timestamp:hostTime:cameraStatusBits:](self, "transmitEncodedVideoFrame:size:timestamp:hostTime:cameraStatusBits:", *p_dataPointerOut, SampleSize, self->super._timestamp, v4, Seconds);
    if (v24 < 0)
    {
      v28 = v24;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.value) = 136316418;
          *(CMTimeValue *)((char *)&buf.value + 4) = v29;
          LOWORD(buf.flags) = 2080;
          *(_QWORD *)((char *)&buf.flags + 2) = "-[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:]";
          HIWORD(buf.epoch) = 1024;
          v42 = 528;
          v43 = 1024;
          v44 = v28;
          v45 = 1024;
          v46 = v28;
          v47 = 1024;
          v48 = v12;
          _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, " [%s] %s:%d sendFrame: transmitEncodedVideoFrame returned error %d (0x%08x). isKeyFrame=%d", (uint8_t *)&buf, 0x2Eu);
        }
      }
    }
    else if (v12)
    {
      self->_lastKeyFrameSampleBufferSize = SampleSize;
      -[VCVideoTransmitterBase setLastKeyFrameSentTime:](self, "setLastKeyFrameSentTime:", micro());
      -[VCVideoStreamTransmitter reportingVideoStreamEvent:](self, "reportingVideoStreamEvent:", 228);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.value) = 136315650;
          *(CMTimeValue *)((char *)&buf.value + 4) = v25;
          LOWORD(buf.flags) = 2080;
          *(_QWORD *)((char *)&buf.flags + 2) = "-[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:]";
          HIWORD(buf.epoch) = 1024;
          v42 = 534;
          v27 = " [%s] %s:%d successfully sent key frame";
LABEL_34:
          _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&buf, 0x1Cu);
          return;
        }
      }
    }
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v31 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    v32 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.value) = 136315650;
        *(CMTimeValue *)((char *)&buf.value + 4) = v31;
        LOWORD(buf.flags) = 2080;
        *(_QWORD *)((char *)&buf.flags + 2) = "-[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:]";
        HIWORD(buf.epoch) = 1024;
        v42 = 496;
        v27 = " [%s] %s:%d sendFrame: Error while getting image buffer data";
        goto LABEL_34;
      }
    }
    else if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      -[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:].cold.1();
    }
  }
}

- (int)transmitEncodedVideoFrame:(char *)a3 size:(unint64_t)a4 timestamp:(unsigned int)a5 hostTime:(double)a6 cameraStatusBits:(unsigned __int8)a7
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  __int128 v13;
  int IsIPv6;
  unsigned int v15;
  unsigned int temporaryMaximumBitrate;
  int v17;
  uint64_t v18;
  void *ptr;
  unsigned __int16 *v21[7];
  __int128 v22;
  _OWORD v23[2];
  _QWORD v24[4];

  v7 = a7;
  v8 = *(_QWORD *)&a5;
  v9 = a4;
  v24[3] = *MEMORY[0x1E0C80C00];
  memset(v24, 170, 20);
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v21[1] = (unsigned __int16 *)0xAAAAAAAAAAAA000ALL;
  v22 = v13;
  v23[0] = v13;
  v23[1] = v13;
  v21[0] = (unsigned __int16 *)v24;
  v21[2] = (unsigned __int16 *)&self->_iSMBCount;
  v21[3] = (unsigned __int16 *)&self->_xMBs;
  v21[4] = (unsigned __int16 *)&self->_packetSizes;
  v21[5] = (unsigned __int16 *)&self->_packetFlags;
  v21[6] = (unsigned __int16 *)&self->_maxPacketCount;
  *((_QWORD *)&v23[0] + 1) = self->_videoPacketAllocator;
  *(_QWORD *)((char *)&v22 + 7) = 0;
  *(_QWORD *)&v22 = 0;
  IsIPv6 = RTPGetIsIPv6((uint64_t)self->_videoRTP, (BOOL *)v23 + 2);
  if (IsIPv6 < 0)
  {
    v17 = IsIPv6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamTransmitter transmitEncodedVideoFrame:size:timestamp:hostTime:cameraStatusBits:].cold.1();
    }
  }
  else
  {
    if (BYTE2(v23[0]))
      v15 = 1280;
    else
      v15 = 1450;
    LOWORD(v23[0]) = v15;
    BYTE4(v23[0]) = 0;
    if (self->_recommendedMTU && self->_recommendedMTU < v15)
      LOWORD(v23[0]) = self->_recommendedMTU;
    LOWORD(v23[0]) -= VTU_GetOverhead(0, 0, 0, BYTE2(v23[0]) != 0);
    if (self->_forceDisableBitrateCap)
      temporaryMaximumBitrate = self->super._temporaryMaximumBitrate;
    else
      temporaryMaximumBitrate = 164000;
    ptr = (void *)0xAAAAAAAAAAAAAAAALL;
    v18 = VTU_SplitVideoIntoPackets(v21, 123, a3, v9, &ptr, 0, 0, 1, 0, 0, temporaryMaximumBitrate, 0);
    if ((_DWORD)v18)
    {
      v17 = -[VCVideoStreamTransmitter transmitFrameInGroups:numOfPackets:timestamp:hostTime:cameraStatusBits:](self, "transmitFrameInGroups:numOfPackets:timestamp:hostTime:cameraStatusBits:", ptr, v18, v8, v7, a6);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoStreamTransmitter transmitEncodedVideoFrame:size:timestamp:hostTime:cameraStatusBits:].cold.2();
      }
      v17 = -2147418105;
    }
    if (ptr && ptr != a3)
      CFAllocatorDeallocate(self->_videoPacketAllocator, ptr);
  }
  return v17;
}

- (int)transmitFrameInGroups:(char *)a3 numOfPackets:(int)a4 timestamp:(unsigned int)a5 hostTime:(double)a6 cameraStatusBits:(unsigned __int8)a7
{
  int v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
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
  uint64_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  if (a4 < 1)
  {
    v12 = 0;
    v11 = 0;
    v16 = 0;
  }
  else
  {
    v9 = a4;
    LODWORD(v11) = 0;
    v12 = 0;
    v13 = 0;
    do
    {
      if (v9 == 9)
        v14 = 5;
      else
        v14 = 8;
      if (v9 >= 8)
        v15 = v14;
      else
        v15 = v9;
      v9 -= v15;
      LOBYTE(v19) = a7;
      v16 = -[VCVideoStreamTransmitter transmitVideoPackets:packetSizes:startPacket:packetCount:lastGroup:timestamp:hostTime:cameraStatusBits:bytesSent:](self, "transmitVideoPackets:packetSizes:startPacket:packetCount:lastGroup:timestamp:hostTime:cameraStatusBits:bytesSent:", &a3[(int)v11], self->_packetSizes, v12, v15, v9 < 1, a5, a6, v19, &v23);
      if (v16 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          v25 = v20;
          v26 = 2080;
          v27 = "-[VCVideoStreamTransmitter transmitFrameInGroups:numOfPackets:timestamp:hostTime:cameraStatusBits:]";
          v28 = 1024;
          v29 = 626;
          v30 = 1024;
          v31 = 626;
          v32 = 2048;
          v33 = v16;
          v34 = 1024;
          v35 = v13;
          v36 = 1024;
          v37 = v15;
          _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoStreamTransmitter.m:%d: VideoTransmitter transmitGroup failed (%08lX) for group (%d) #packet (%d)", buf, 0x38u);
        }
      }
      v11 = (v23 + v11);
      v12 = (v15 + v12);
      ++v13;
    }
    while (v9 > 0);
  }
  -[VCMediaStreamStats recordDataWithSize:atTime:](self->_stats, "recordDataWithSize:atTime:", (double)(int)v11, micro());
  -[VCVideoStreamTransmitter updateSendStatisticsWithTimestamp:frameSize:packetsInFrame:](self, "updateSendStatisticsWithTimestamp:frameSize:packetsInFrame:", a5, v11, v12);
  return v16;
}

- (int)transmitVideoPackets:(const char *)a3 packetSizes:(int *)a4 startPacket:(int)a5 packetCount:(int)a6 lastGroup:(int)a7 timestamp:(unsigned int)a8 hostTime:(double)a9 cameraStatusBits:(unsigned __int8)a10 bytesSent:(int *)a11
{
  unint64_t v13;
  int v14;
  int *v15;
  VCMediaControlInfoFaceTimeAudio *ControlInfo;
  signed int v17;
  BOOL v18;
  int v19;
  void *controlInfoGenerator;
  tagHANDLE *videoRTP;
  int v23;
  uint64_t v25;
  uint64_t v26;
  int v30;
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  *a11 = 0;
  if (a6 < 1)
    return 0;
  v13 = 0;
  v14 = -2147418092;
  v26 = 4 * (a6 - 1);
  v25 = 4 * a6;
  v15 = &a4[a5];
  while (1)
  {
    ControlInfo = 0;
    v17 = v15[v13 / 4];
    if (a7)
      v18 = v26 == v13;
    else
      v18 = 0;
    v19 = v18;
    v31[0] = 0xAAAAAAAAAAAAAAAALL;
    if ((a10 & 0x80) != 0 && self->_enableCVO && v19 != 0)
    {
      VCCVOExtensionUtils_FillCVOExtension(a10, self->_cvoExtensionID, (uint64_t)v31);
      controlInfoGenerator = self->super._controlInfoGenerator;
      if (controlInfoGenerator)
      {
        ControlInfo = VCMediaControlInfoGeneratorCreateControlInfo((uint64_t)controlInfoGenerator);
        VCMediaControlInfoSetInfo(ControlInfo, (const char *)9, (uint64_t)v31, 8);
      }
      else
      {
        ControlInfo = 0;
      }
    }
    videoRTP = self->_videoRTP;
    v30 = 0;
    v23 = RTPSendH264Packet((uint64_t)videoRTP, 123, 1u, v19, a8, (void *)&a3[*a11], v17, &v30, a9, 0, 0, v13 == 0, 0, a10, 0, 0, 0, self->_dwRefreshFrameCounter, (uint64_t)ControlInfo,
            0,
            0,
            0,
            0);
    if (v23 == -2147418092)
      break;
    *a11 += v15[v13 / 4];
    v13 += 4;
    if (v25 == v13)
      return v23;
  }
  -[VCVideoStreamTransmitter generateKeyFrameWithFIRType:](self, "generateKeyFrameWithFIRType:", 0);
  return v14;
}

- (void)updateSendStatisticsWithTimestamp:(unsigned int)a3 frameSize:(unsigned int)a4 packetsInFrame:(unsigned int)a5
{
  double v7;
  unint64_t totalBytesSent;
  unsigned int totalPacketsSent;
  AVCStatisticsCollector *statisticsCollector;
  _QWORD v11[3];
  unsigned int v12;
  unsigned int v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  self->_totalBytesSent += a4;
  self->_totalPacketsSent += a5;
  v25 = 0;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v7 = micro();
  totalBytesSent = self->_totalBytesSent;
  totalPacketsSent = self->_totalPacketsSent;
  statisticsCollector = self->_statisticsCollector;
  v11[0] = 6;
  *(double *)&v11[1] = v7;
  v11[2] = 0;
  v12 = a3 >> 8;
  v13 = totalPacketsSent;
  v14 = totalBytesSent;
  VCRateControlSetStatistics(statisticsCollector, v11);
}

- (void)gatherRealtimeStats:(__CFDictionary *)a3
{
  __CFDictionary *v4;
  double v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const __CFAllocator *v11;
  CFStringRef v12;
  CFStringRef v13;
  CFStringRef v14;
  CFStringRef v15;
  uint64_t v16;
  CFStringRef v17;
  uint64_t v18;
  CFStringRef v19;
  uint64_t v20;
  CFStringRef v21;
  CFStringRef v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  unsigned int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (__CFDictionary *)selectDestinationForRTMetrics();
  v5 = micro();
  if (self->_reportingIntervalStartTime == 0.0)
    self->_reportingIntervalStartTime = v5;
  if (self->_reportingLastUpdateTime > 0.0)
  {
    -[VCMediaStreamStats updateMinMaxSinceTime:](self->_stats, "updateMinMaxSinceTime:");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        -[VCMediaStreamStats framerate](self->_stats, "framerate");
        v9 = v8;
        v10 = -[VCMediaStreamStats bitrateKbps](self->_stats, "bitrateKbps");
        *(_DWORD *)buf = 136316162;
        v28 = v6;
        v29 = 2080;
        v30 = "-[VCVideoStreamTransmitter gatherRealtimeStats:]";
        v31 = 1024;
        v32 = 709;
        v33 = 2048;
        v34 = v9;
        v35 = 1024;
        v36 = v10;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoStreamStats - Tx - framerate:%f, bitrate:%dkbps", buf, 0x2Cu);
      }
    }
  }
  self->_reportingLastUpdateTime = v5;
  if (v4)
  {
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v12 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%u"), -[VCMediaStreamStats maxFrameDurationMillis](self->_stats, "maxFrameDurationMillis"));
    CFDictionaryAddValue(v4, CFSTR("VCVSTxMaxFrameDuration"), v12);
    CFRelease(v12);
    -[VCMediaStreamStats setMaxFrameDurationMillis:](self->_stats, "setMaxFrameDurationMillis:", 0);
    v13 = CFStringCreateWithFormat(v11, 0, CFSTR("%u"), -[VCMediaStreamStats getBitrateKbpsSinceTime:](self->_stats, "getBitrateKbpsSinceTime:", self->_reportingIntervalStartTime));
    CFDictionaryAddValue(v4, CFSTR("VCVSTxAvgBitrate"), v13);
    CFRelease(v13);
    v14 = CFStringCreateWithFormat(v11, 0, CFSTR("%u"), -[VCMediaStreamStats maxBitrateKbps](self->_stats, "maxBitrateKbps"));
    CFDictionaryAddValue(v4, CFSTR("VCVSTxMaxBitrate"), v14);
    CFRelease(v14);
    -[VCMediaStreamStats setMaxBitrateKbps:](self->_stats, "setMaxBitrateKbps:", 0);
    v15 = CFStringCreateWithFormat(v11, 0, CFSTR("%u"), -[VCMediaStreamStats minBitrateKbps](self->_stats, "minBitrateKbps"));
    CFDictionaryAddValue(v4, CFSTR("VCVSTxMinBitrate"), v15);
    CFRelease(v15);
    -[VCMediaStreamStats setMinBitrateKbps:](self->_stats, "setMinBitrateKbps:", 0xFFFFFFFFLL);
    -[VCMediaStreamStats getFramerateSinceTime:](self->_stats, "getFramerateSinceTime:", self->_reportingIntervalStartTime);
    v17 = CFStringCreateWithFormat(v11, 0, CFSTR("%5.2f"), v16);
    CFDictionaryAddValue(v4, CFSTR("VCVSTxAvgFramerate"), v17);
    CFRelease(v17);
    -[VCMediaStreamStats maxFramerate](self->_stats, "maxFramerate");
    v19 = CFStringCreateWithFormat(v11, 0, CFSTR("%5.2f"), v18);
    CFDictionaryAddValue(v4, CFSTR("VCVSTxMaxFramerate"), v19);
    CFRelease(v19);
    -[VCMediaStreamStats setMaxFramerate:](self->_stats, "setMaxFramerate:", 0.0);
    -[VCMediaStreamStats minFramerate](self->_stats, "minFramerate");
    v21 = CFStringCreateWithFormat(v11, 0, CFSTR("%5.2f"), v20);
    CFDictionaryAddValue(v4, CFSTR("VCVSTxMinFramerate"), v21);
    CFRelease(v21);
    -[VCMediaStreamStats setMinFramerate:](self->_stats, "setMinFramerate:", 1.79769313e308);
    v22 = CFStringCreateWithFormat(v11, 0, CFSTR("%d"), self->_totalKeyFramesSent);
    CFDictionaryAddValue(v4, CFSTR("VCVSTxKeyFramesSent"), v22);
    CFRelease(v22);
    self->_reportingIntervalStartTime = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      v25 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = objc_msgSend((id)-[__CFDictionary description](v4, "description"), "UTF8String");
          *(_DWORD *)buf = 136315906;
          v28 = v23;
          v29 = 2080;
          v30 = "-[VCVideoStreamTransmitter gatherRealtimeStats:]";
          v31 = 1024;
          v32 = 754;
          v33 = 2080;
          v34 = v26;
          _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Tx RTCReporting:%s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        -[VCVideoStreamTransmitter gatherRealtimeStats:].cold.1(v23, v4, v24);
      }
    }
  }
}

- (void)reportingVideoStreamEvent:(unsigned __int16)a3
{
  int v3;
  const __CFAllocator *v5;
  __CFDictionary *Mutable;
  CFStringRef v7;

  v3 = a3;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v3 == 228)
  {
    v7 = CFStringCreateWithFormat(v5, 0, CFSTR("%zu"), self->_lastKeyFrameSampleBufferSize);
    CFDictionaryAddValue(Mutable, CFSTR("VCVSKeyFrameSize"), v7);
    CFRelease(v7);
  }
  reportingVideoStreamEvent();
  CFRelease(Mutable);
}

- (void)handleActiveConnectionChange:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCVideoStreamTransmitter handleActiveConnectionChange:]";
      v9 = 1024;
      v10 = 777;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Handling active connection change is not implemented for VCVST", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)initWithConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Configuration pointer is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.2()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VCVideoStreamTransmitter initWithConfig:]";
  v4 = 1024;
  v5 = 163;
  v6 = v0;
  v7 = "com.apple.AVConference.VCVideoStreamTransmitter.encoderThread";
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create thread \"%s\", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create video packet allocator: %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create buffer queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __55__VCVideoStreamTransmitter_setTemporaryMaximumBitrate___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate bitRate array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __55__VCVideoStreamTransmitter_setTemporaryMaximumBitrate___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create bitRate value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setFECRedundancyVector:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Not implemented!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setMediaSuggestion:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Not implemented!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setEncodingMode:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Not implemented!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleThermalLevelChange:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Not implemented!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateWindowState:isLocal:windowRect:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Not implemented!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)encodeVideoFrame:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to get image buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)transmitEncodedVideoFrame:cameraStatusBits:.cold.1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d sendFrame: Error while getting image buffer data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)transmitEncodedVideoFrame:cameraStatusBits:.cold.2()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed To Prepend SPS/PPS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)transmitEncodedVideoFrame:cameraStatusBits:.cold.3()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d sendFrame: Error: Error getting data buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)transmitEncodedVideoFrame:size:timestamp:hostTime:cameraStatusBits:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d RTPGetIsIPv6 failed %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)transmitEncodedVideoFrame:size:timestamp:hostTime:cameraStatusBits:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTU_SplitVideoIntoPackets returned 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)gatherRealtimeStats:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCVideoStreamTransmitter gatherRealtimeStats:]";
  v8 = 1024;
  v9 = 754;
  v10 = 2080;
  v11 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  _os_log_debug_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Tx RTCReporting:%s", (uint8_t *)&v4, 0x26u);
}

@end
