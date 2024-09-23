@implementation VCSystemAudioCaptureSession

- (VCSystemAudioCaptureSession)initWithConfiguration:(id *)a3
{
  char *v3;
  uint64_t v5;
  NSObject *v6;
  __int128 v7;
  uint64_t v8;
  const __CFAllocator *v9;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  char *v19;
  uint64_t v20;

  v3 = (char *)self;
  v20 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCaptureSession initWithConfiguration:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCaptureSession initWithConfiguration:].cold.2();
      }
    }
    goto LABEL_40;
  }
  v11.receiver = self;
  v11.super_class = (Class)VCSystemAudioCaptureSession;
  v3 = -[VCSystemAudioCaptureSession init](&v11, sel_init);
  if (!v3)
  {
LABEL_40:

    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v13 = v5;
      v14 = 2080;
      v15 = "-[VCSystemAudioCaptureSession initWithConfiguration:]";
      v16 = 1024;
      v17 = 42;
      v18 = 2048;
      v19 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p", buf, 0x26u);
    }
  }
  pthread_mutex_init((pthread_mutex_t *)(v3 + 8), 0);
  v7 = *(_OWORD *)&a3->var1.format.mSampleRate;
  v8 = *(_QWORD *)&a3->var1.format.mBitsPerChannel;
  *(_OWORD *)(v3 + 88) = *(_OWORD *)&a3->var1.format.mBytesPerPacket;
  *((_QWORD *)v3 + 13) = v8;
  *(_OWORD *)(v3 + 72) = v7;
  *((_DWORD *)v3 + 25) = 1;
  *((_DWORD *)v3 + 28) = a3->var1.samplesPerFrame;
  if ((objc_msgSend(v3, "setupAudioIOWithConfig:", a3) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCaptureSession initWithConfiguration:].cold.9();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCaptureSession initWithConfiguration:].cold.10();
      }
    }
    goto LABEL_40;
  }
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 10, (CMSimpleQueueRef *)v3 + 15))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCaptureSession initWithConfiguration:].cold.7();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCaptureSession initWithConfiguration:].cold.8();
      }
    }
    goto LABEL_40;
  }
  if (CMSimpleQueueCreate(v9, 11, (CMSimpleQueueRef *)v3 + 16))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCaptureSession initWithConfiguration:].cold.5();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCaptureSession initWithConfiguration:].cold.6();
      }
    }
    goto LABEL_40;
  }
  if ((objc_msgSend(v3, "createAudioBufferPool") & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCaptureSession initWithConfiguration:].cold.3();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCaptureSession initWithConfiguration:].cold.4();
      }
    }
    goto LABEL_40;
  }
  return (VCSystemAudioCaptureSession *)v3;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  VCSystemAudioCaptureSession *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCSystemAudioCaptureSession dealloc]";
      v10 = 1024;
      v11 = 66;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p", buf, 0x26u);
    }
  }
  pthread_mutex_destroy(&self->_stateLock);

  -[VCSystemAudioCaptureSession cleanupQueue:](self, "cleanupQueue:", &self->_poolQueue);
  -[VCSystemAudioCaptureSession cleanupQueue:](self, "cleanupQueue:", &self->_outputQueue);
  v5.receiver = self;
  v5.super_class = (Class)VCSystemAudioCaptureSession;
  -[VCSystemAudioCaptureSession dealloc](&v5, sel_dealloc);
}

- (BOOL)setupAudioIOWithConfig:(id *)a3
{
  unsigned int mSampleRate;
  unsigned int samplesPerFrame;
  __int128 v6;
  int var5;
  VCAudioIO *v8;
  _DWORD v10[2];
  int32x2_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void (*v21)(uint64_t, uint64_t);
  VCSystemAudioCaptureSession *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  mSampleRate = a3->var1.format.mSampleRate;
  samplesPerFrame = a3->var1.samplesPerFrame;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25 = v6;
  v24 = v6;
  v23 = v6;
  v11 = vrev64_s32(*(int32x2_t *)&a3->var2);
  v17 = v6;
  v18 = v6;
  v19 = v6;
  v20 = v6;
  v16 = v6;
  v15 = v6;
  v14 = v6;
  v12 = v6;
  v13 = v6;
  var5 = a3->var5;
  v10[0] = a3->var4;
  v10[1] = 0;
  LODWORD(v12) = 1;
  WORD2(v12) = 2;
  *((_QWORD *)&v12 + 1) = 0;
  *(_QWORD *)&v13 = __PAIR64__(mSampleRate, var5);
  DWORD2(v13) = samplesPerFrame;
  BYTE12(v13) = 0;
  *(_QWORD *)&v14 = 0;
  DWORD2(v14) = 2;
  v15 = 0uLL;
  WORD4(v16) = 0;
  *(_QWORD *)&v16 = 0;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v21 = _VCSystemAudioCaptureSession_audioSink;
  v22 = self;
  v23 = 0uLL;
  LOBYTE(v24) = 0;
  *((_QWORD *)&v24 + 1) = 0;
  *(_QWORD *)&v25 = 0;
  WORD4(v25) = 0;
  v8 = -[VCAudioIO initWithConfiguration:]([VCAudioIO alloc], "initWithConfiguration:", v10);
  self->_audioIO = v8;
  return v8 != 0;
}

- (BOOL)start
{
  _opaque_pthread_mutex_t *p_stateLock;
  uint64_t v4;
  NSObject *v5;
  id v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  VCSystemAudioCaptureSession *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VCSystemAudioCaptureSession start]";
      v12 = 1024;
      v13 = 100;
      v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p", (uint8_t *)&v8, 0x26u);
    }
  }
  v6 = -[VCAudioIO start](self->_audioIO, "start");
  pthread_mutex_unlock(p_stateLock);
  return v6 == 0;
}

- (BOOL)stop
{
  _opaque_pthread_mutex_t *p_stateLock;
  uint64_t v4;
  NSObject *v5;
  id v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  VCSystemAudioCaptureSession *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VCSystemAudioCaptureSession stop]";
      v12 = 1024;
      v13 = 109;
      v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p", (uint8_t *)&v8, 0x26u);
    }
  }
  v6 = -[VCAudioIO stop](self->_audioIO, "stop");
  -[VCSystemAudioCaptureSession resetAudioBufferPool](self, "resetAudioBufferPool");
  pthread_mutex_unlock(p_stateLock);
  return v6 == 0;
}

- (BOOL)createAudioBufferPool
{
  BOOL v3;
  unint64_t v4;
  AudioStreamBasicDescription *p_audioBasicDescription;
  unsigned int samplesPerFrame;
  __int128 v7;
  __int128 v9[2];
  uint64_t v10;
  void *element[2];

  v3 = 0;
  v4 = 0;
  element[1] = *(void **)MEMORY[0x1E0C80C00];
  p_audioBasicDescription = &self->_audioBasicDescription;
  while (1)
  {
    element[0] = (void *)0xAAAAAAAAAAAAAAAALL;
    samplesPerFrame = self->_samplesPerFrame;
    v7 = *(_OWORD *)&p_audioBasicDescription->mBytesPerPacket;
    v9[0] = *(_OWORD *)&p_audioBasicDescription->mSampleRate;
    v9[1] = v7;
    v10 = *(_QWORD *)&p_audioBasicDescription->mBitsPerChannel;
    if ((VCAudioBufferList_Allocate(v9, samplesPerFrame, element) & 1) == 0)
      break;
    VCAudioBufferList_Reset((uint64_t)element[0]);
    if (CMSimpleQueueEnqueue(self->_poolQueue, element[0]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSystemAudioCaptureSession createAudioBufferPool].cold.1();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[VCSystemAudioCaptureSession createAudioBufferPool].cold.2();
        }
      }
      return v3;
    }
    v3 = v4++ > 8;
    if (v4 == 10)
      return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if ((VRTraceIsOSFaultDisabled() & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCaptureSession createAudioBufferPool].cold.3();
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
    {
      -[VCSystemAudioCaptureSession createAudioBufferPool].cold.4();
    }
  }
  return v3;
}

- (void)cleanupQueue:(opaqueCMSimpleQueue *)a3
{
  uint64_t v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    while (1)
    {
      v4[0] = (uint64_t)CMSimpleQueueDequeue(*a3);
      if (!v4[0])
        break;
      VCAudioBufferList_Destroy(v4);
    }
    if (*a3)
      CFRelease(*a3);
    *a3 = 0;
  }
}

- (void)resetAudioBufferPool
{
  const void *v3;
  const void *v4;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  VCSystemAudioCaptureSession *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = CMSimpleQueueDequeue(self->_outputQueue);
  if (v3)
  {
    v4 = v3;
    v5 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if (CMSimpleQueueEnqueue(self->_poolQueue, v4) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v9 = v6;
          v10 = 2080;
          v11 = "-[VCSystemAudioCaptureSession resetAudioBufferPool]";
          v12 = 1024;
          v13 = 147;
          v14 = 2048;
          v15 = self;
          _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %p Error returning output to audio buffer pool", buf, 0x26u);
        }
      }
      v4 = CMSimpleQueueDequeue(self->_outputQueue);
    }
    while (v4);
  }
}

- (void)initWithConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_10();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d null configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_10();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d null configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not audio buffers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not audio buffers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not create queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not create queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_15();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not create queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_15();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not create queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to configure the audio IO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to configure the audio IO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createAudioBufferPool
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not create audio buffer list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
