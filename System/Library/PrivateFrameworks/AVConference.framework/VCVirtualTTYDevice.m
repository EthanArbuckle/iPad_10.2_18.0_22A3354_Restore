@implementation VCVirtualTTYDevice

- (BOOL)setStreamConfig:(id)a3 withError:(id *)a4
{
  return 1;
}

- (VCVirtualTTYDevice)initWithMode:(int64_t)a3 clientPid:(int)a4
{
  VCVirtualTTYDevice *v6;
  VCVirtualTTYDevice *v7;
  NSObject *CustomRootQueue;
  VCVirtualTTYDevice *v9;
  uint64_t v10;
  id v11;
  VCAudioPayloadConfig *v12;
  VCAudioPayload *v13;
  unsigned int v14;
  __int128 v15;
  SoundDec_t *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _BYTE v24[40];
  objc_super v25;
  _BYTE buf[40];
  _BYTE v27[40];
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)VCVirtualTTYDevice;
  v6 = -[VCVirtualTTYDevice init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_clientPid = a4;
    v6->_audioSessionId = VCUniqueIDGenerator_GenerateID();
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v7->delegateNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVirtualTTYDevice.delegateNotificationQueue", 0, CustomRootQueue);
    if (a3)
    {
      if (a3 == 1)
      {
        v9 = v7;
        v10 = 2;
      }
      else
      {
        if (a3 != 2)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCVirtualTTYDevice initWithMode:clientPid:].cold.1();
          }
          goto LABEL_9;
        }
        v9 = v7;
        v10 = 0;
      }
    }
    else
    {
      v9 = v7;
      v10 = 4;
    }
    -[VCVirtualTTYDevice setDeviceRole:](v9, "setDeviceRole:", v10);
LABEL_9:
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E9EF6968, CFSTR("vcAudioPayloadConfigKeyPayloadType"));
    v12 = -[VCAudioPayloadConfig initWithConfigDict:]([VCAudioPayloadConfig alloc], "initWithConfigDict:", v11);

    v13 = -[VCAudioPayload initWithConfig:]([VCAudioPayload alloc], "initWithConfig:", v12);
    v7->_currentAudioPayload = v13;
    v14 = -[VCAudioPayloadConfig codecSampleRate](-[VCAudioPayload config](v13, "config"), "codecSampleRate");
    v7->_vpioFormat.format.mSampleRate = (double)v14;
    *(_OWORD *)&v7->_vpioFormat.format.mFormatID = xmmword_1D9108BF0;
    *(_QWORD *)&v7->_vpioFormat.format.mBytesPerFrame = 0x100000004;
    v7->_vpioFormat.format.mBitsPerChannel = 32;
    v7->_vpioFormat.samplesPerFrame = ((double)v14 / 50.0);
    -[VCAudioPayload createEncoderWithInputFormat:](v7->_currentAudioPayload, "createEncoderWithInputFormat:", &v7->_vpioFormat);

    pthread_mutex_init(&v7->sessionLock, 0);
    *(_QWORD *)v24 = -1;
    *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v24[8] = v15;
    *(_OWORD *)&v24[24] = v15;
    LODWORD(v15) = v7->_vpioFormat.samplesPerFrame;
    SoundDec_FormatASBD(16785216, (uint64_t)v24, +[VCPayloadUtils codecSamplesPerFrameForPayload:blockSize:](VCPayloadUtils, "codecSamplesPerFrameForPayload:blockSize:", 99, (double)(unint64_t)v15 / v7->_vpioFormat.format.mSampleRate), 1u, 0, 0.02);
    v16 = (SoundDec_t *)malloc_type_calloc(1uLL, 0x110uLL, 0x1030040C827E633uLL);
    v17 = *(_OWORD *)&v24[16];
    v18 = *(_OWORD *)v24;
    *(_QWORD *)v27 = unk_1D910FC40;
    memset(&v27[8], 170, 32);
    v7->_decoder = v16;
    v28 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&buf[32] = *(_QWORD *)&v24[32];
    *(_OWORD *)buf = v18;
    *(_OWORD *)&buf[16] = v17;
    v19 = *(_OWORD *)&v7->_vpioFormat.format.mBytesPerPacket;
    v20 = *(_QWORD *)&v7->_vpioFormat.format.mBitsPerChannel;
    *(_OWORD *)v27 = *(_OWORD *)&v7->_vpioFormat.format.mSampleRate;
    *(_QWORD *)&v27[32] = v20;
    *(_OWORD *)&v27[16] = v19;
    LOWORD(v28) = 0;
    SoundDec_Create(&v7->_decoder, (uint64_t)buf);
    CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 100, &v7->_charQueue);
    v7->_characterPool = (tagVCMemoryPool *)VCMemoryPool_Create(2uLL);
    v7->_state = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCVirtualTTYDevice initWithMode:clientPid:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 134;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v7;
      *(_WORD *)&buf[38] = 2080;
      *(_QWORD *)v27 = "-[VCVirtualTTYDevice initWithMode:clientPid:]";
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "VCVirtualTTYDevice [%s] %s:%d VCVirtualTTYDevice[%p] %s", buf, 0x30u);
    }
  }
  return v7;
}

- (void)dealloc
{
  opaqueCMSimpleQueue *charQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_storeWeak((id *)&self->delegate, 0);
  dispatch_release((dispatch_object_t)self->delegateNotificationQueue);
  pthread_mutex_destroy(&self->sessionLock);

  SoundDec_Destroy((uint64_t)self->_decoder);
  charQueue = self->_charQueue;
  if (charQueue)
    CFRelease(charQueue);
  VCMemoryPool_Destroy((OSQueueHead *)self->_characterPool);

  v4.receiver = self;
  v4.super_class = (Class)VCVirtualTTYDevice;
  -[VCVirtualTTYDevice dealloc](&v4, sel_dealloc);
}

- (id)start
{
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  int deviceRole;
  VCAudioIO *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int state;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  UInt32 v24[4];
  uint8_t buf[48];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCVirtualTTYDevice start]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 151;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVirtualTTYDevice [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  -[VCVirtualTTYDevice lock](self, "lock");
  if (self->_state)
  {
    if ((VCVirtualTTYDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVirtualTTYDevice start].cold.1(v9, &self->_state, v10);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCVirtualTTYDevice performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          state = self->_state;
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCVirtualTTYDevice start]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 155;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v5;
          *(_WORD *)&buf[38] = 2048;
          *(_QWORD *)&buf[40] = self;
          LOWORD(v26) = 1024;
          *(_DWORD *)((char *)&v26 + 2) = state;
          _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, "VCVirtualTTYDevice [%s] %s:%d %@(%p) Unable to start because of unexpected state:%d ", buf, 0x36u);
        }
      }
    }
    -[VCVirtualTTYDevice unlock](self, "unlock");
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v37 = CFSTR("state");
    v38[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_state);
    return (id)objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("VirtualTTYDevice"), -1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1));
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
    memset(buf, 0, sizeof(buf));
    *(_DWORD *)buf = VCUniqueIDGenerator_GenerateID();
    deviceRole = self->deviceRole;
    *(_DWORD *)&buf[8] = 3;
    *(_DWORD *)&buf[12] = deviceRole;
    *(_DWORD *)&buf[16] = 0;
    buf[20] = 3;
    DWORD2(v26) = 1;
    v27 = 0uLL;
    *(_QWORD *)&v29 = self;
    *((_QWORD *)&v32 + 1) = self;
    v7 = -[VCAudioIO initWithConfiguration:]([VCAudioIO alloc], "initWithConfiguration:", buf);
    self->_audioIO = v7;
    -[VCAudioIO setClientFormat:](v7, "setClientFormat:", &self->_vpioFormat);
    v24[0] = 0;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    AUIOGetAUNumber(v24);
    -[VCAudioIO setFarEndVersionInfo:](self->_audioIO, "setFarEndVersionInfo:", &v16);
    v8 = -[VCAudioIO start](self->_audioIO, "start", v16, v17, v18, v19, v20, v21, v22, v23);
    if (v8)
    {

      self->_audioIO = 0;
    }
    else
    {
      self->_state = 1;
    }
    -[VCVirtualTTYDevice unlock](self, "unlock");
  }
  return v8;
}

- (void)sendCharacter:(unsigned __int16)a3
{
  int v3;
  _WORD *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCVirtualTTYDevice *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = VCMemoryPool_Alloc((OSQueueHead *)self->_characterPool);
  *v5 = v3;
  if (CMSimpleQueueEnqueue(self->_charQueue, v5))
  {
    if ((VCVirtualTTYDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVirtualTTYDevice sendCharacter:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCVirtualTTYDevice performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v12 = 136316162;
          v13 = v7;
          v14 = 2080;
          v15 = "-[VCVirtualTTYDevice sendCharacter:]";
          v16 = 1024;
          v17 = 199;
          v18 = 2112;
          v19 = v6;
          v20 = 2048;
          v21 = self;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, "VCVirtualTTYDevice [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full", (uint8_t *)&v12, 0x30u);
        }
      }
    }
    VCMemoryPool_Free((OSQueueHead *)self->_characterPool, v5);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    v11 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315906;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCVirtualTTYDevice sendCharacter:]";
        v16 = 1024;
        v17 = 202;
        v18 = 1024;
        LODWORD(v19) = v3;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCVirtualTTYDevice [%s] %s:%d Sending character:'%C'", (uint8_t *)&v12, 0x22u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[VCVirtualTTYDevice sendCharacter:].cold.1(v9, v3, v10);
    }
  }
}

- (void)sendText:(id)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVirtualTTYDevice sendText:].cold.1();
  }
}

- (id)stop
{
  return -[VCVirtualTTYDevice stopWithError:](self, "stopWithError:", 0);
}

- (id)stopWithError:(id)a3
{
  id v4;

  -[VCVirtualTTYDevice lock](self, "lock", a3);
  if (self->_state == 1)
  {
    v4 = -[VCAudioIO stop](self->_audioIO, "stop");

    self->_audioIO = 0;
    self->_state = 0;
  }
  else
  {
    v4 = 0;
  }
  -[VCVirtualTTYDevice unlock](self, "unlock");
  return v4;
}

- (id)setPause:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = v5;
      v10 = 2080;
      v11 = "-[VCVirtualTTYDevice setPause:]";
      v12 = 1024;
      v13 = 235;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCVirtualTTYDevice [%s] %s:%d ", (uint8_t *)&v8, 0x1Cu);
    }
  }
  if (v3)
    return -[VCVirtualTTYDevice stop](self, "stop");
  else
    return -[VCVirtualTTYDevice start](self, "start");
}

- (void)lock
{
  pthread_mutex_lock(&self->sessionLock);
}

- (void)unlock
{
  pthread_mutex_unlock(&self->sessionLock);
}

- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3
{
  uint64_t SampleFormat;
  char *BufferAtIndex;
  signed int v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SampleFormat = VCAudioBufferList_GetSampleFormat((uint64_t)a3);
  v10 = -1431655766;
  BufferAtIndex = (char *)VCAudioBufferList_GetBufferAtIndex((uint64_t)a3, 0, &v10);
  v7 = *(_DWORD *)(SampleFormat + 16) * v10;
  v9 = v7;
  if (CMSimpleQueueGetCount(self->_charQueue) < 1)
  {
    SoundDec_Decode((uint64_t)self->_decoder, 0, 0, BufferAtIndex, v7, &v9, 0);
  }
  else
  {
    v8 = (void *)CMSimpleQueueDequeue(self->_charQueue);
    SoundDec_Decode((uint64_t)self->_decoder, v8, 1u, BufferAtIndex, v9, &v9, 0);
    VCMemoryPool_Free((OSQueueHead *)self->_characterPool, v8);
  }
  VCAudioBufferList_InvalidateAveragePower((uint64_t)a3);
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  int v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *delegateNotificationQueue;
  _QWORD block[5];
  char v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  _OWORD v24[2];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  memset(v24, 0, sizeof(v24));
  v4 = -[VCAudioPayload encodeAudio:numInputSamples:outputBytes:numOutputBytes:shortREDBytes:](self->_currentAudioPayload, "encodeAudio:numInputSamples:outputBytes:numOutputBytes:shortREDBytes:", a3, VCAudioBufferList_GetSampleCount((uint64_t)a3), v24, 32, 0);
  if (v4 >= 1)
  {
    v5 = v4;
    v6 = (char *)v24;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = *v6++;
      v8 = v9;
      if (v9)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          v12 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v17 = v10;
              v18 = 2080;
              v19 = "-[VCVirtualTTYDevice pushAudioSamples:]";
              v20 = 1024;
              v21 = 283;
              v22 = 1024;
              v23 = v8;
              _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCVirtualTTYDevice [%s] %s:%d Received character:%c", buf, 0x22u);
            }
          }
          else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v17 = v10;
            v18 = 2080;
            v19 = "-[VCVirtualTTYDevice pushAudioSamples:]";
            v20 = 1024;
            v21 = 283;
            v22 = 1024;
            v23 = v8;
            _os_log_debug_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEBUG, "VCVirtualTTYDevice [%s] %s:%d Received character:%c", buf, 0x22u);
          }
        }
        delegateNotificationQueue = self->delegateNotificationQueue;
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __39__VCVirtualTTYDevice_pushAudioSamples___block_invoke;
        block[3] = &unk_1E9E521E8;
        block[4] = self;
        v15 = v8;
        dispatch_async(delegateNotificationQueue, block);
      }
      --v5;
    }
    while (v5);
  }
}

uint64_t __39__VCVirtualTTYDevice_pushAudioSamples___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcMediaStream:didReceiveTTYCharacter:", *(_QWORD *)(a1 + 32), (unsigned __int16)*(char *)(a1 + 40));
}

- (void)serverDidDie
{
  NSObject *delegateNotificationQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__VCVirtualTTYDevice_serverDidDie__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(delegateNotificationQueue, v3);
}

uint64_t __34__VCVirtualTTYDevice_serverDidDie__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "vcMediaStreamServerDidDie:");
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVirtualTTYDevice didUpdateBasebandCodec:].cold.1();
  }
}

- (BOOL)isValid
{
  return self->isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->isValid = a3;
}

- (int)deviceRole
{
  return self->deviceRole;
}

- (void)setDeviceRole:(int)a3
{
  self->deviceRole = a3;
}

- (VCMediaStreamDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (VCMediaStreamDelegate *)a3;
}

- (void)initWithMode:clientPid:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCVirtualTTYDevice initWithMode:clientPid:]";
  v6 = 1024;
  v7 = 92;
  v8 = 2048;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, "VCVirtualTTYDevice [%s] %s:%d Virtual TTY Device mode(%ld) not supported", v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)start
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCVirtualTTYDevice start]";
  v8 = 1024;
  v9 = 155;
  v10 = 1024;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, "VCVirtualTTYDevice [%s] %s:%d Unable to start because of unexpected state:%d ", (uint8_t *)&v4, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)sendCharacter:(os_log_t)log .cold.1(uint64_t a1, unsigned __int16 a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[VCVirtualTTYDevice sendCharacter:]";
  v7 = 1024;
  v8 = 202;
  v9 = 1024;
  v10 = a2;
  _os_log_debug_impl(&dword_1D8A54000, log, OS_LOG_TYPE_DEBUG, "VCVirtualTTYDevice [%s] %s:%d Sending character:'%C'", (uint8_t *)&v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)sendCharacter:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVirtualTTYDevice [%s] %s:%d CMSimpleQueueEnqueue Full", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendText:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVirtualTTYDevice [%s] %s:%d Not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)didUpdateBasebandCodec:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVirtualTTYDevice [%s] %s:%d Unexpected SPI call", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
