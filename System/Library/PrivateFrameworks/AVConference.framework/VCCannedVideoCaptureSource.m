@implementation VCCannedVideoCaptureSource

- (VCCannedVideoCaptureSource)initWithVideo:(id)a3 callbackContext:(id)a4 frameCallback:(void *)a5
{
  VCCannedVideoCaptureSource *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  __objc2_class **v12;
  uint64_t v13;
  Frame *v14;
  uint64_t i;
  uint64_t v16;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)VCCannedVideoCaptureSource;
  v8 = -[VCObject init](&v18, sel_init);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoCaptureSource initWithVideo:callbackContext:frameCallback:].cold.1();
    }
    goto LABEL_19;
  }
  v9 = +[CannedVideoCapture cannedVideoTypeForPath:](CannedVideoCapture, "cannedVideoTypeForPath:", a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v20 = v10;
      v21 = 2080;
      v22 = "-[VCCannedVideoCaptureSource initWithVideo:callbackContext:frameCallback:]";
      v23 = 1024;
      v24 = 83;
      v25 = 1024;
      v26 = v9;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d cannedVideoType = %d", buf, 0x22u);
    }
  }
  if (v9 == 1)
  {
    v12 = &off_1E9E4D3B0;
  }
  else
  {
    if (v9 != 2)
    {
      v8->_frameFeeder = 0;
      goto LABEL_16;
    }
    v12 = off_1E9E4D3A8;
  }
  v13 = objc_msgSend(objc_alloc(*v12), "initWithPath:", a3);
  v8->_frameFeeder = (VCCannedVideoFrameFeeder *)v13;
  if (!v13)
  {
LABEL_16:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoCaptureSource initWithVideo:callbackContext:frameCallback:].cold.2();
    }
    goto LABEL_19;
  }
  v8->_context.frameRate = 0;
  v8->_context.hostClock = CMClockGetHostTimeClock();
  pthread_mutex_init(&v8->_context.attributeMutex, 0);
  pthread_mutex_init(&v8->_context.frameRingBufferMutex, 0);
  pthread_mutex_init(&v8->_context.producerMutex, 0);
  pthread_cond_init(&v8->_context.producerConditional, 0);
  pthread_mutex_init(&v8->_context.consumerMutex, 0);
  pthread_cond_init(&v8->_context.consumerConditional, 0);
  v14 = (Frame *)malloc_type_calloc(0x10uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
  v8->_context.frameRingBuffer = v14;
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoCaptureSource initWithVideo:callbackContext:frameCallback:].cold.3();
    }
    goto LABEL_19;
  }
  for (i = 0; i != 256; i += 16)
    *(_DWORD *)((char *)v14 + i) = -1;
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF26A0]), "initWithObject:", a4);
  v8->_weakCallbackContext = (VCWeakObjectHolder *)v16;
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoCaptureSource initWithVideo:callbackContext:frameCallback:].cold.4();
    }
LABEL_19:

    return 0;
  }
  v8->_frameCallback = a5;
  v8->_stateLock._os_unfair_lock_opaque = 0;
  return v8;
}

- (void)dealloc
{
  uint64_t i;
  __CVBuffer *v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[VCCannedVideoCaptureSource stop](self, "stop");
  if (self->_context.frameRingBuffer)
  {
    for (i = 8; i != 264; i += 16)
    {
      v4 = *(__CVBuffer **)((char *)self->_context.frameRingBuffer + i);
      if (v4)
        CVPixelBufferRelease(v4);
    }
    free(self->_context.frameRingBuffer);
  }
  pthread_mutex_destroy(&self->_context.attributeMutex);
  pthread_mutex_destroy(&self->_context.frameRingBufferMutex);
  pthread_mutex_destroy(&self->_context.producerMutex);
  pthread_cond_destroy(&self->_context.producerConditional);
  pthread_mutex_destroy(&self->_context.consumerMutex);
  pthread_cond_destroy(&self->_context.consumerConditional);

  v5.receiver = self;
  v5.super_class = (Class)VCCannedVideoCaptureSource;
  -[VCObject dealloc](&v5, sel_dealloc);
}

- (int)start
{
  os_unfair_lock_s *p_stateLock;
  CFDictionaryRef v4;
  int v5;
  unsigned int v6;
  OpaqueFigThread *consumerThread;
  NSObject *CustomRootQueue;
  OS_dispatch_queue *v9;
  CFDictionaryRef v10;
  const void *v12[2];

  v12[1] = *(const void **)MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_context.producerThreadCanceled = 0;
  if (!self->_context.producerThread)
  {
    v12[0] = CFSTR("com.apple.VideoConference.cannedvideocapture.producer");
    v4 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], MEMORY[0x1E0CA52C8], v12, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v5 = FigThreadCreate();
    if (v4)
      CFRelease(v4);
    if (v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedVideoCaptureSource start].cold.3();
      }
      goto LABEL_23;
    }
  }
  v6 = 0;
  consumerThread = self->_context.consumerThread;
  self->_context.consumerThreadCanceled = 0;
  if (!consumerThread)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v9 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("ConsumerThreadHelperQueue", 0, CustomRootQueue);
    if (!v9)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedVideoCaptureSource start].cold.1();
      }
      v6 = 4;
      goto LABEL_11;
    }
    self->_context.helperQueue = v9;
    v12[0] = CFSTR("com.apple.VideoConference.cannedvideocapture.consumer");
    v10 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], MEMORY[0x1E0CA52C8], v12, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v5 = FigThreadCreate();
    if (v10)
      CFRelease(v10);
    if (!v5)
    {
      v6 = 0;
      goto LABEL_11;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoCaptureSource start].cold.2();
    }
LABEL_23:
    v6 = v5 | 0xA01D0000;
    os_unfair_lock_unlock(p_stateLock);
    -[VCCannedVideoCaptureSource stop](self, "stop");
    return v6;
  }
LABEL_11:
  os_unfair_lock_unlock(p_stateLock);
  return v6;
}

- (int)stop
{
  VCCannedVideoCaptureSource *v2;
  os_unfair_lock_s *p_stateLock;
  _tagVCCannedVideoCaptureSourceContext *p_context;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v2 = self;
  v16 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  p_context = &v2->_context;
  v2 = (VCCannedVideoCaptureSource *)((char *)v2 + 264);
  pthread_mutex_lock((pthread_mutex_t *)v2);
  p_context->producerThreadCanceled = 1;
  pthread_cond_signal(&p_context->producerConditional);
  pthread_mutex_unlock((pthread_mutex_t *)v2);
  pthread_mutex_lock(&p_context->consumerMutex);
  p_context->consumerThreadCanceled = 1;
  pthread_cond_signal(&p_context->consumerConditional);
  pthread_mutex_unlock(&p_context->consumerMutex);
  if (p_context->producerThread)
  {
    FigThreadJoin();
    p_context->producerThread = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315650;
        v11 = v5;
        v12 = 2080;
        v13 = "-[VCCannedVideoCaptureSource stop]";
        v14 = 1024;
        v15 = 228;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Producer thread stopped!", (uint8_t *)&v10, 0x1Cu);
      }
    }
  }
  if (p_context->consumerThread)
  {
    FigThreadJoin();
    p_context->consumerThread = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315650;
        v11 = v7;
        v12 = 2080;
        v13 = "-[VCCannedVideoCaptureSource stop]";
        v14 = 1024;
        v15 = 234;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Consumer thread stopped!", (uint8_t *)&v10, 0x1Cu);
      }
    }
  }
  os_unfair_lock_unlock(p_stateLock);
  return 0;
}

- (void)setFrameRate:(int)a3
{
  atomic_store(a3, (unsigned int *)&self->_context.frameRate);
}

- (int)frameRate
{
  return atomic_load((unsigned int *)&self->_context.frameRate);
}

- (void)setWidth:(int)a3 height:(int)a4
{
  -[VCCannedVideoFrameFeeder setWidth:height:](self->_frameFeeder, "setWidth:height:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

void ___VCCannedVideoCaptureSource_ConsumerThread_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, CMTime *);
  uint64_t v5;
  NSObject *v6;
  Float64 Seconds;
  int v8;
  CMTime v9;
  int v10;
  __int16 v11;
  Float64 v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "strong");
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void (**)(uint64_t, uint64_t, CMTime *))(*(_QWORD *)(a1 + 32) + 616);
    v9 = *(CMTime *)(a1 + 48);
    v4(v2, v3, &v9);
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 624) && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(CMTime *)(a1 + 48);
      Seconds = CMTimeGetSeconds(&v9);
      v8 = *(_DWORD *)(a1 + 72);
      LODWORD(v9.value) = 136316162;
      *(CMTimeValue *)((char *)&v9.value + 4) = v5;
      LOWORD(v9.flags) = 2080;
      *(_QWORD *)((char *)&v9.flags + 2) = "_VCCannedVideoCaptureSource_ConsumerThread_block_invoke";
      HIWORD(v9.epoch) = 1024;
      v10 = 450;
      v11 = 2048;
      v12 = Seconds;
      v13 = 1024;
      v14 = v8;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Timestamp Alignment: Canned Replay Host Time = %f, Frame Index = %d", (uint8_t *)&v9, 0x2Cu);
    }
  }
}

- (void)initWithVideo:callbackContext:frameCallback:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize self", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithVideo:callbackContext:frameCallback:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize frame feeder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithVideo:callbackContext:frameCallback:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Memory allocation for frameRingBuffer failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithVideo:callbackContext:frameCallback:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize weak callback context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)start
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCannedVideoCaptureSource start]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Producer Thread creation failed(%d)", v2, *(const char **)v3, (unint64_t)"-[VCCannedVideoCaptureSource start]" >> 16, 178);
  OUTLINED_FUNCTION_3();
}

@end
