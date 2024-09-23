@implementation VCSystemAudioCapture

- (VCSystemAudioCapture)initWithConfiguration:(id *)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  $E6593782B41B2E8D4452B38DD0207817 *v13;
  uint64_t v14;
  __CFString *captureContext;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  NSObject *CustomRootQueue;
  OS_dispatch_queue *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  UInt32 mChannelsPerFrame;
  int v26;
  __int128 v27;
  __int128 v28;
  unsigned int samplesPerFrame;
  __int128 v30;
  __int128 v31;
  unint64_t v32;
  unint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  NSObject *v36;
  objc_super v38;
  _BYTE buf[40];
  VCSystemAudioCapture *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!+[VCSystemAudioCapture isValidConfiguration:](VCSystemAudioCapture, "isValidConfiguration:"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCapture initWithConfiguration:].cold.9();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCapture initWithConfiguration:].cold.10();
      }
    }
    goto LABEL_64;
  }
  v38.receiver = self;
  v38.super_class = (Class)VCSystemAudioCapture;
  self = -[VCObject init](&v38, sel_init);
  if (!self)
  {
LABEL_64:

    return 0;
  }
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCSystemAudioCapture initWithConfiguration:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 77;
        v8 = " [%s] %s:%d ";
        v9 = v7;
        v10 = 28;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSystemAudioCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCSystemAudioCapture initWithConfiguration:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 77;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v5;
        *(_WORD *)&buf[38] = 2048;
        v40 = self;
        v8 = " [%s] %s:%d %@(%p) ";
        v9 = v12;
        v10 = 48;
        goto LABEL_13;
      }
    }
  }
  pthread_mutex_init(&self->_stateLock, 0);
  v13 = ($E6593782B41B2E8D4452B38DD0207817 *)malloc_type_calloc(1uLL, 0x88uLL, 0x1020040BC270CF7uLL);
  self->_audioRecorderQueue = v13;
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCapture initWithConfiguration:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCapture initWithConfiguration:].cold.2();
      }
    }
    goto LABEL_64;
  }
  v14 = *(_QWORD *)&a3->var3.source;
  *(_OWORD *)&self->_tapSettings.tapType = *(_OWORD *)&a3->var3.tapType;
  *(_QWORD *)&self->_tapSettings.source = v14;
  captureContext = self->_tapSettings.captureContext;
  if (captureContext)
    CFRetain(captureContext);
  v16 = *(_QWORD *)&a3->var0.format.mBitsPerChannel;
  v17 = *(_OWORD *)&a3->var0.format.mBytesPerPacket;
  *(_OWORD *)&self->_audioBasicDescriptionAudioQueue.mSampleRate = *(_OWORD *)&a3->var0.format.mSampleRate;
  *(_OWORD *)&self->_audioBasicDescriptionAudioQueue.mBytesPerPacket = v17;
  *(_QWORD *)&self->_audioBasicDescriptionAudioQueue.mBitsPerChannel = v16;
  v18 = *(_OWORD *)&a3->var0.format.mSampleRate;
  v19 = *(_OWORD *)&a3->var0.format.mBytesPerPacket;
  *(_QWORD *)&self->_audioBasicDescriptionAudioCapture.mBitsPerChannel = *(_QWORD *)&a3->var0.format.mBitsPerChannel;
  *(_OWORD *)&self->_audioBasicDescriptionAudioCapture.mSampleRate = v18;
  *(_OWORD *)&self->_audioBasicDescriptionAudioCapture.mBytesPerPacket = v19;
  self->_samplesPerFrame = a3->var0.samplesPerFrame;
  self->_sinkContext = a3->var1;
  self->_sinkProc = a3->var2;
  self->_firstAudioBufferReceived = 0;
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v21 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSystemAudioCapture.systemAudioQueue", 0, CustomRootQueue);
  self->_callbackQueue = v21;
  if (!v21)
  {
    if ((VCSystemAudioCapture *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCapture initWithConfiguration:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v34 = (const __CFString *)-[VCSystemAudioCapture performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v34 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v35 = VRTraceErrorLogLevelToCSTR();
        v36 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCSystemAudioCapture initWithConfiguration:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 90;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v34;
          *(_WORD *)&buf[38] = 2048;
          v40 = self;
          _os_log_error_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate system audio callback queue", buf, 0x30u);
        }
      }
    }
    goto LABEL_64;
  }
  if ((self->_audioBasicDescriptionAudioCapture.mFormatFlags & 0x20) != 0
    && self->_audioBasicDescriptionAudioCapture.mChannelsPerFrame == 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      v24 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v22;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCSystemAudioCapture initWithConfiguration:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 93;
          _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d System Audio Capture Format is Non-Interleaved, updating AudioQueue Format", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        -[VCSystemAudioCapture initWithConfiguration:].cold.8();
      }
    }
    self->_audioBasicDescriptionAudioQueue.mFormatFlags &= ~0x20u;
    mChannelsPerFrame = self->_audioBasicDescriptionAudioCapture.mChannelsPerFrame;
    self->_audioBasicDescriptionAudioQueue.mBytesPerFrame = mChannelsPerFrame
                                                          * self->_audioBasicDescriptionAudioCapture.mBytesPerFrame;
    self->_audioBasicDescriptionAudioQueue.mBytesPerPacket = self->_audioBasicDescriptionAudioCapture.mBytesPerPacket
                                                           * mChannelsPerFrame;
  }
  v26 = 2 * self->_samplesPerFrame;
  v27 = *(_OWORD *)&self->_audioBasicDescriptionAudioQueue.mSampleRate;
  v28 = *(_OWORD *)&self->_audioBasicDescriptionAudioQueue.mBytesPerPacket;
  *(_QWORD *)&buf[32] = *(_QWORD *)&self->_audioBasicDescriptionAudioQueue.mBitsPerChannel;
  *(_OWORD *)buf = v27;
  *(_OWORD *)&buf[16] = v28;
  if ((VCAudioBufferList_Allocate((__int128 *)buf, v26, &self->_audioBufferAppendList) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCapture initWithConfiguration:].cold.6();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCapture initWithConfiguration:].cold.7();
      }
    }
    goto LABEL_64;
  }
  samplesPerFrame = self->_samplesPerFrame;
  v30 = *(_OWORD *)&self->_audioBasicDescriptionAudioCapture.mSampleRate;
  v31 = *(_OWORD *)&self->_audioBasicDescriptionAudioCapture.mBytesPerPacket;
  *(_QWORD *)&buf[32] = *(_QWORD *)&self->_audioBasicDescriptionAudioCapture.mBitsPerChannel;
  *(_OWORD *)buf = v30;
  *(_OWORD *)&buf[16] = v31;
  if ((VCAudioBufferList_Allocate((__int128 *)buf, samplesPerFrame, &self->_audioBufferOutputList) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCapture initWithConfiguration:].cold.4();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCapture initWithConfiguration:].cold.5();
      }
    }
    goto LABEL_64;
  }
  -[VCSystemAudioCapture setupCannedAudioInjection](self, "setupCannedAudioInjection");
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info((mach_timebase_info_t)buf);
  LODWORD(v33) = *(_DWORD *)&buf[4];
  LODWORD(v32) = *(_DWORD *)buf;
  self->_conversionRatio = (double)v32 * 0.000000001 / (double)v33;
  self->_timestamp = 0;
  self->_hostTime = 0.0;
  self->_startHostTime = 0.0;
  self->_remoteDeviceInfo = (VCAudioHALPluginRemoteDeviceInfo *)a3->var4;
  return self;
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *callbackQueue;
  __CFString *captureContext;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCSystemAudioCapture *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v15 = v4;
        v16 = 2080;
        v17 = "-[VCSystemAudioCapture dealloc]";
        v18 = 1024;
        v19 = 125;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCSystemAudioCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v15 = v9;
        v16 = 2080;
        v17 = "-[VCSystemAudioCapture dealloc]";
        v18 = 1024;
        v19 = 125;
        v20 = 2112;
        v21 = v3;
        v22 = 2048;
        v23 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  pthread_mutex_destroy(&self->_stateLock);
  VCAudioBufferList_Destroy((uint64_t *)&self->_audioBufferAppendList);
  self->_audioBufferAppendList = 0;
  VCAudioBufferList_Destroy((uint64_t *)&self->_audioBufferOutputList);
  self->_audioBufferOutputList = 0;
  free(self->_audioRecorderQueue);
  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
  {
    dispatch_release(callbackQueue);
    self->_callbackQueue = 0;
  }
  self->_audioRecorderQueue = 0;

  captureContext = self->_tapSettings.captureContext;
  if (captureContext)
    CFRelease(captureContext);

  v13.receiver = self;
  v13.super_class = (Class)VCSystemAudioCapture;
  -[VCObject dealloc](&v13, sel_dealloc);
}

+ (BOOL)isValidConfiguration:(id *)a3
{
  unsigned int tapType;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  char IsOSFaultDisabled;
  NSObject *v8;

  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v6)
          return v6;
        +[VCSystemAudioCapture isValidConfiguration:].cold.1();
      }
      else
      {
        v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
        if (!v6)
          return v6;
        +[VCSystemAudioCapture isValidConfiguration:].cold.2();
      }
    }
    goto LABEL_40;
  }
  if (!a3->var2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v6)
          return v6;
        +[VCSystemAudioCapture isValidConfiguration:].cold.3();
      }
      else
      {
        v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
        if (!v6)
          return v6;
        +[VCSystemAudioCapture isValidConfiguration:].cold.4();
      }
    }
    goto LABEL_40;
  }
  tapType = a3->var3.tapType;
  if (tapType >= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v8 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        v6 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
        if (!v6)
          return v6;
        +[VCSystemAudioCapture isValidConfiguration:].cold.5();
      }
      else
      {
        v6 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);
        if (!v6)
          return v6;
        +[VCSystemAudioCapture isValidConfiguration:].cold.6();
      }
    }
    goto LABEL_40;
  }
  if (tapType == 2)
  {
    if (!a3->var3.captureContext)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v6)
            return v6;
          +[VCSystemAudioCapture isValidConfiguration:].cold.9();
        }
        else
        {
          v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
          if (!v6)
            return v6;
          +[VCSystemAudioCapture isValidConfiguration:].cold.10();
        }
      }
      goto LABEL_40;
    }
LABEL_12:
    LOBYTE(v6) = 1;
    return v6;
  }
  if (tapType != 1 || !a3->var3.var0.audioProcessIdToTap)
    goto LABEL_12;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    v4 = VRTraceIsOSFaultDisabled();
    v5 = *MEMORY[0x1E0CF2758];
    if ((v4 & 1) != 0)
    {
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      +[VCSystemAudioCapture isValidConfiguration:].cold.7();
    }
    else
    {
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_FAULT);
      if (!v6)
        return v6;
      +[VCSystemAudioCapture isValidConfiguration:].cold.8();
    }
  }
LABEL_40:
  LOBYTE(v6) = 0;
  return v6;
}

- (BOOL)start
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  _opaque_pthread_mutex_t *p_stateLock;
  unsigned int source;
  BOOL v13;
  _BYTE v15[24];
  __int128 v16;
  VCSystemAudioCapture *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 136315650;
        *(_QWORD *)&v15[4] = v4;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[VCSystemAudioCapture start]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 160;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v15, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCSystemAudioCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 136316162;
        *(_QWORD *)&v15[4] = v9;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[VCSystemAudioCapture start]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 160;
        WORD2(v16) = 2112;
        *(_QWORD *)((char *)&v16 + 6) = v3;
        HIWORD(v16) = 2048;
        v17 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  p_stateLock = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  if (self->_audioRecorderQueue->var4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCapture start].cold.1();
    }
    goto LABEL_22;
  }
  -[VCSystemAudioCapture setQueueState:](self, "setQueueState:", 1);
  source = self->_tapSettings.source;
  if (source >= 2)
  {
    if (source - 2 <= 1 && -[VCSystemAudioCapture startAudioHALPlugInSource:](self, "startAudioHALPlugInSource:"))
      goto LABEL_19;
LABEL_21:
    -[VCSystemAudioCapture setQueueState:](self, "setQueueState:", 0, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17);
LABEL_22:
    v13 = 0;
    goto LABEL_23;
  }
  if (!-[VCSystemAudioCapture startAudioQueue](self, "startAudioQueue"))
    goto LABEL_21;
LABEL_19:
  v13 = 1;
LABEL_23:
  pthread_mutex_unlock(p_stateLock);
  return v13;
}

- (BOOL)startAudioQueue
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  $E6593782B41B2E8D4452B38DD0207817 *audioRecorderQueue;
  uint64_t v12;
  __int128 v13;
  id v14;
  void *v15;
  void *v16;
  $E6593782B41B2E8D4452B38DD0207817 *v17;
  const AudioStreamBasicDescription *v18;
  NSObject *callbackQueue;
  BOOL v20;
  $E6593782B41B2E8D4452B38DD0207817 *v21;
  unsigned int samplesPerFrame;
  int v23;
  AudioQueueBufferRef *var2;
  uint64_t v25;
  OSStatus Buffer;
  OSStatus v27;
  OSStatus v29;
  BOOL v30;
  uint64_t v31;
  NSObject *v32;
  OSStatus v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  OSStatus v38;
  uint64_t v39;
  UInt32 ioDataSize;
  _QWORD inCallbackBlock[5];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  VCSystemAudioCapture *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v43 = v4;
        v44 = 2080;
        v45 = "-[VCSystemAudioCapture startAudioQueue]";
        v46 = 1024;
        v47 = 191;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCSystemAudioCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v43 = v9;
        v44 = 2080;
        v45 = "-[VCSystemAudioCapture startAudioQueue]";
        v46 = 1024;
        v47 = 191;
        v48 = 2112;
        v49 = v3;
        v50 = 2048;
        v51 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  audioRecorderQueue = self->_audioRecorderQueue;
  v12 = *(_QWORD *)&self->_audioBasicDescriptionAudioQueue.mBitsPerChannel;
  v13 = *(_OWORD *)&self->_audioBasicDescriptionAudioQueue.mBytesPerPacket;
  *(_OWORD *)&audioRecorderQueue->var1.mSampleRate = *(_OWORD *)&self->_audioBasicDescriptionAudioQueue.mSampleRate;
  *(_OWORD *)&audioRecorderQueue->var1.mBytesPerPacket = v13;
  *(_QWORD *)&audioRecorderQueue->var1.mBitsPerChannel = v12;
  VCAudioBufferList_Reset((uint64_t)self->_audioBufferAppendList);
  VCAudioBufferList_Reset((uint64_t)self->_audioBufferOutputList);
  v14 = -[VCSystemAudioCapture newAudioTapWithAudioStreamBasicDescription:](self, "newAudioTapWithAudioStreamBasicDescription:", &self->_audioBasicDescriptionAudioQueue);
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCapture startAudioQueue].cold.1();
    }
    goto LABEL_51;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C924E0]), "initWithTapDescription:", v14);
  if (!v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCapture startAudioQueue].cold.2();
    }
LABEL_51:
    v16 = 0;
LABEL_29:
    _VCSystemAudioCapture_destroyAudioQueueBuffers(&self->_audioRecorderQueue->var0);
    AudioQueueDispose(self->_audioRecorderQueue->var0, 1u);
    v30 = 0;
    goto LABEL_35;
  }
  v16 = v15;
  objc_msgSend(v15, "setScreenSharingHost:", (self->_tapSettings.var0.audioProcessIdToTap + 1) < 0xFFFFFFFE);
  v17 = self->_audioRecorderQueue;
  v18 = (const AudioStreamBasicDescription *)objc_msgSend((id)objc_msgSend(v14, "format"), "streamDescription");
  callbackQueue = self->_callbackQueue;
  inCallbackBlock[0] = MEMORY[0x1E0C809B0];
  inCallbackBlock[1] = 3221225472;
  inCallbackBlock[2] = __39__VCSystemAudioCapture_startAudioQueue__block_invoke;
  inCallbackBlock[3] = &unk_1E9E57D28;
  inCallbackBlock[4] = self;
  if (AudioQueueNewInputWithDispatchQueue(&v17->var0, v18, 0x800u, callbackQueue, inCallbackBlock))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCapture startAudioQueue].cold.8();
    }
    goto LABEL_29;
  }
  if (AudioQueueSetProperty(self->_audioRecorderQueue->var0, 0x71746F62u, v16, 8u))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCapture startAudioQueue].cold.7();
    }
    goto LABEL_29;
  }
  ioDataSize = 40;
  if (AudioQueueGetProperty(self->_audioRecorderQueue->var0, 0x61716674u, &self->_audioRecorderQueue->var1, &ioDataSize))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCapture startAudioQueue].cold.6();
    }
    goto LABEL_29;
  }
  v20 = 0;
  v21 = self->_audioRecorderQueue;
  samplesPerFrame = self->_samplesPerFrame;
  *(_OWORD *)&v21->var2[2] = 0u;
  *(_OWORD *)&v21->var2[4] = 0u;
  *(_OWORD *)&v21->var2[6] = 0u;
  *(_OWORD *)&v21->var2[8] = 0u;
  v23 = v21->var1.mBytesPerFrame * samplesPerFrame;
  *(_OWORD *)v21->var2 = 0u;
  var2 = v21->var2;
  v21->var3 = v23;
  v25 = -10;
  while (1)
  {
    Buffer = AudioQueueAllocateBuffer(v21->var0, v21->var3, var2);
    if (Buffer)
    {
      v34 = Buffer;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v35 = VRTraceErrorLogLevelToCSTR();
        v36 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v43 = v35;
          v44 = 2080;
          v45 = "_VCSystemAudioCapture_allocateAudioQueueBuffers";
          v46 = 1024;
          v47 = 564;
          v48 = 1024;
          LODWORD(v49) = v34;
          v37 = " [%s] %s:%d allocate error: %i";
          goto LABEL_62;
        }
      }
LABEL_41:
      if (v20)
        goto LABEL_22;
LABEL_42:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCapture startAudioQueue].cold.5();
      }
      goto LABEL_29;
    }
    v27 = AudioQueueEnqueueBuffer(v21->var0, *var2, 0, 0);
    if (v27)
      break;
    v20 = (unint64_t)(v25 + 10) > 8;
    ++var2;
    if (__CFADD__(v25++, 1))
      goto LABEL_22;
  }
  v38 = v27;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_41;
  v39 = VRTraceErrorLogLevelToCSTR();
  v36 = *MEMORY[0x1E0CF2758];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    goto LABEL_41;
  *(_DWORD *)buf = 136315906;
  v43 = v39;
  v44 = 2080;
  v45 = "_VCSystemAudioCapture_allocateAudioQueueBuffers";
  v46 = 1024;
  v47 = 566;
  v48 = 1024;
  LODWORD(v49) = v38;
  v37 = " [%s] %s:%d enqueue error: %i";
LABEL_62:
  _os_log_error_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_ERROR, v37, buf, 0x22u);
  if (!v20)
    goto LABEL_42;
LABEL_22:
  v29 = AudioQueueStart(self->_audioRecorderQueue->var0, 0);
  if (v29 == -66665)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCapture startAudioQueue].cold.4();
    }
    goto LABEL_26;
  }
  if (v29)
  {
LABEL_26:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCapture startAudioQueue].cold.3();
    }
    goto LABEL_29;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v31 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v43 = v31;
      v44 = 2080;
      v45 = "-[VCSystemAudioCapture startAudioQueue]";
      v46 = 1024;
      v47 = 239;
      _os_log_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Successfully started", buf, 0x1Cu);
    }
  }
  v30 = 1;
LABEL_35:

  return v30;
}

void __39__VCSystemAudioCapture_startAudioQueue__block_invoke(uint64_t a1, OpaqueAudioQueue *a2, AudioQueueBuffer *a3, uint64_t a4, unsigned int a5)
{
  uint64_t v5;
  void *mAudioData;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  mAudioData = a3->mAudioData;
  v7 = 0xAAAAAAAAAAAAAAAALL;
  LODWORD(v7) = a3->mAudioDataByteSize;
  _VCSystemAudioCapture_handleInputBuffer(v5, a2, a3, (uint64_t)&mAudioData, a4, a5);
}

- (BOOL)stop
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  _opaque_pthread_mutex_t *p_stateLock;
  unsigned int source;
  BOOL v13;
  BOOL v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VCSystemAudioCapture *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315650;
        v17 = v4;
        v18 = 2080;
        v19 = "-[VCSystemAudioCapture stop]";
        v20 = 1024;
        v21 = 252;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v16, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCSystemAudioCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136316162;
        v17 = v9;
        v18 = 2080;
        v19 = "-[VCSystemAudioCapture stop]";
        v20 = 1024;
        v21 = 252;
        v22 = 2112;
        v23 = v3;
        v24 = 2048;
        v25 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  p_stateLock = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  if (self->_audioRecorderQueue->var4)
  {
    -[VCSystemAudioCapture setQueueState:](self, "setQueueState:", 0);
    source = self->_tapSettings.source;
    if (source - 2 < 2)
    {
      v13 = -[VCSystemAudioCapture stopAudioHALPlugInSource:](self, "stopAudioHALPlugInSource:");
      goto LABEL_21;
    }
    if (source <= 1)
    {
      v13 = -[VCSystemAudioCapture stopAudioQueue](self, "stopAudioQueue");
LABEL_21:
      v14 = v13;
      goto LABEL_22;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSystemAudioCapture stop].cold.1();
  }
  v14 = 0;
LABEL_22:
  pthread_mutex_unlock(p_stateLock);
  return v14;
}

- (BOOL)stopAudioQueue
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCSystemAudioCapture *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315650;
        v15 = v4;
        v16 = 2080;
        v17 = "-[VCSystemAudioCapture stopAudioQueue]";
        v18 = 1024;
        v19 = 278;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v14, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCSystemAudioCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316162;
        v15 = v9;
        v16 = 2080;
        v17 = "-[VCSystemAudioCapture stopAudioQueue]";
        v18 = 1024;
        v19 = 278;
        v20 = 2112;
        v21 = v3;
        v22 = 2048;
        v23 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  if (AudioQueueStop(self->_audioRecorderQueue->var0, 1u))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCapture stopAudioQueue].cold.2();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = v11;
      v16 = 2080;
      v17 = "-[VCSystemAudioCapture stopAudioQueue]";
      v18 = 1024;
      v19 = 284;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio queue stopped", (uint8_t *)&v14, 0x1Cu);
    }
  }
  _VCSystemAudioCapture_destroyAudioQueueBuffers(&self->_audioRecorderQueue->var0);
  if (AudioQueueDispose(self->_audioRecorderQueue->var0, 1u))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCapture stopAudioQueue].cold.1();
    }
  }
  self->_firstAudioBufferReceived = 0;
  return 1;
}

- (void)setQueueState:(int)a3
{
  NSObject *callbackQueue;
  _QWORD block[5];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__VCSystemAudioCapture_setQueueState___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_sync(callbackQueue, block);
}

uint64_t __38__VCSystemAudioCapture_setQueueState___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 232) + 132) = *(_DWORD *)(result + 40);
  return result;
}

- (int)getQueueState
{
  NSObject *callbackQueue;
  int v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1431655766;
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__VCSystemAudioCapture_getQueueState__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(callbackQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__VCSystemAudioCapture_getQueueState__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 232)
                                                                              + 132);
  return result;
}

+ (id)newAudioTapWithProcessID:(int)a3 audioFormat:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
  {
    if (VCFeatureFlagManager_UseAvconferenced())
    {
      v9[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
      v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C924E8]), "initSystemTapWithFormat:excludePIDs:", a4, v6);
    }
    else
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C924E8]), "initSystemTapWithFormat:", a4);
    }
  }
  else
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C924E8]), "initProcessTapWithFormat:PID:", a4, *(_QWORD *)&a3);
  }
  v7 = (void *)v5;
  if (!v5 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCSystemAudioCapture newAudioTapWithProcessID:audioFormat:].cold.1();
  }
  return v7;
}

+ (unsigned)audioTapSessionTypeForInternalSessionType:(unsigned int)a3
{
  return a3 == 0;
}

+ (id)newAudioTapWithSessionType:(unsigned int)a3 audioFormat:(id)a4
{
  id result;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315906;
        v9 = v6;
        v10 = 2080;
        v11 = "+[VCSystemAudioCapture newAudioTapWithSessionType:audioFormat:]";
        v12 = 1024;
        v13 = 352;
        v14 = 1024;
        v15 = a3;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid sessionType=%d", (uint8_t *)&v8, 0x22u);
      }
    }
    return 0;
  }
  result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C924E8]), "initPreSpatialSessionTypeTapWithFormat:sessionType:", a4, +[VCSystemAudioCapture audioTapSessionTypeForInternalSessionType:](VCSystemAudioCapture, "audioTapSessionTypeForInternalSessionType:", 0));
  if (!result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCSystemAudioCapture newAudioTapWithSessionType:audioFormat:].cold.1();
    }
    return 0;
  }
  return result;
}

+ (id)newAudioTapWithCaptureContext:(__CFString *)a3 audioFormat:(id)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C924E8]), "initPreSpatialSceneIdentifierTapWithFormat:sceneIdentifier:", a4, a3);
  if (!v4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCSystemAudioCapture newAudioTapWithCaptureContext:audioFormat:].cold.1();
  }
  return v4;
}

- (id)newAudioTapWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3
{
  tagVCSystemAudioCaptureTapSettings *p_tapSettings;
  uint64_t v4;
  void *v5;
  unsigned int tapType;
  id v7;
  void *v8;

  p_tapSettings = &self->_tapSettings;
  if (self->_tapSettings.tapType >= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCapture newAudioTapWithAudioStreamBasicDescription:].cold.1();
    }
    goto LABEL_21;
  }
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithStreamDescription:", a3);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCapture newAudioTapWithAudioStreamBasicDescription:].cold.2();
    }
LABEL_21:
    v8 = 0;
    v5 = 0;
    goto LABEL_14;
  }
  v5 = (void *)v4;
  tapType = p_tapSettings->tapType;
  if (p_tapSettings->tapType == 2)
  {
    v7 = +[VCSystemAudioCapture newAudioTapWithCaptureContext:audioFormat:](VCSystemAudioCapture, "newAudioTapWithCaptureContext:audioFormat:", p_tapSettings->captureContext, v4);
    goto LABEL_9;
  }
  if (tapType == 1)
  {
    v7 = +[VCSystemAudioCapture newAudioTapWithSessionType:audioFormat:](VCSystemAudioCapture, "newAudioTapWithSessionType:audioFormat:", p_tapSettings->var0.sessionTypeToTap, v4);
LABEL_9:
    v8 = v7;
    if (v7)
      goto LABEL_14;
    goto LABEL_10;
  }
  if (!tapType)
  {
    v7 = +[VCSystemAudioCapture newAudioTapWithProcessID:audioFormat:](VCSystemAudioCapture, "newAudioTapWithProcessID:audioFormat:", p_tapSettings->var0.sessionTypeToTap, v4);
    goto LABEL_9;
  }
LABEL_10:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSystemAudioCapture newAudioTapWithAudioStreamBasicDescription:].cold.3();
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (void)setupCannedAudioInjection
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the canned audio injector", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (BOOL)startAudioHALPlugInSource:(unsigned int)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int samplesPerFrame;
  __int128 v14;
  __objc2_class **v15;
  VCAudioHALPluginCaptureSource *v16;
  BOOL result;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  VCSystemAudioCapture *v33;
  _BYTE buf[40];
  unint64_t v35;
  VCSystemAudioCapture *v36;
  void (*v37)(uint64_t, uint64_t, uint64_t, unsigned int);
  VCAudioHALPluginRemoteDeviceInfo *remoteDeviceInfo;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCSystemAudioCapture startAudioHALPlugInSource:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 701;
        v8 = " [%s] %s:%d ";
        v9 = v7;
        v10 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSystemAudioCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCSystemAudioCapture startAudioHALPlugInSource:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 701;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v5;
        *(_WORD *)&buf[38] = 2048;
        v35 = (unint64_t)self;
        v8 = " [%s] %s:%d %@(%p) ";
        v9 = v12;
        v10 = 48;
        goto LABEL_11;
      }
    }
  }
  objc_msgSend(+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice](VCAudioHALPluginDevice, "sharedAudioHALPluginNullDevice"), "stop");
  samplesPerFrame = self->_samplesPerFrame;
  v14 = *(_OWORD *)&self->_audioBasicDescriptionAudioCapture.mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&self->_audioBasicDescriptionAudioCapture.mSampleRate;
  *(_OWORD *)&buf[16] = v14;
  *(_QWORD *)&buf[32] = *(_QWORD *)&self->_audioBasicDescriptionAudioCapture.mBitsPerChannel;
  v35 = samplesPerFrame | 0xAAAAAAAA00000000;
  v36 = self;
  v37 = _VCSystemAudioCapture_handleInputBufferFromAudioHALPlugin;
  remoteDeviceInfo = self->_remoteDeviceInfo;
  v15 = off_1E9E4D5C0;
  if (a3 == 2)
    v15 = off_1E9E4D5C8;
  v16 = (VCAudioHALPluginCaptureSource *)objc_msgSend(objc_alloc(*v15), "initWithConfig:", buf);
  self->_audioHALPlugin = v16;
  if (!v16)
  {
    if ((VCSystemAudioCapture *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCapture startAudioHALPlugInSource:].cold.1();
      }
      goto LABEL_37;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[VCSystemAudioCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_37;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    v24 = 136316162;
    v25 = v20;
    v26 = 2080;
    v27 = "-[VCSystemAudioCapture startAudioHALPlugInSource:]";
    v28 = 1024;
    v29 = 722;
    v30 = 2112;
    v31 = v18;
    v32 = 2048;
    v33 = self;
    v22 = " [%s] %s:%d %@(%p) can not create plug in device for audio server driver plug in";
    goto LABEL_39;
  }
  if ((-[VCAudioHALPluginCaptureSource start](v16, "start") & 1) == 0)
  {
    if ((VCSystemAudioCapture *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCapture startAudioHALPlugInSource:].cold.2();
      }
      goto LABEL_37;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCSystemAudioCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v23 = VRTraceErrorLogLevelToCSTR(),
          v21 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_37:

      result = 0;
      self->_audioHALPlugin = 0;
      return result;
    }
    v24 = 136316162;
    v25 = v23;
    v26 = 2080;
    v27 = "-[VCSystemAudioCapture startAudioHALPlugInSource:]";
    v28 = 1024;
    v29 = 724;
    v30 = 2112;
    v31 = v19;
    v32 = 2048;
    v33 = self;
    v22 = " [%s] %s:%d %@(%p) can not start plug in device for audio server driver plug in";
LABEL_39:
    _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v24, 0x30u);
    goto LABEL_37;
  }
  return 1;
}

- (BOOL)stopAudioHALPlugInSource:(unsigned int)a3
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  char v12;
  _BYTE v14[24];
  __int128 v15;
  VCSystemAudioCapture *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v14 = 136315650;
        *(_QWORD *)&v14[4] = v5;
        *(_WORD *)&v14[12] = 2080;
        *(_QWORD *)&v14[14] = "-[VCSystemAudioCapture stopAudioHALPlugInSource:]";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 735;
        v7 = " [%s] %s:%d ";
        v8 = v6;
        v9 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v14, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCSystemAudioCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v14 = 136316162;
        *(_QWORD *)&v14[4] = v10;
        *(_WORD *)&v14[12] = 2080;
        *(_QWORD *)&v14[14] = "-[VCSystemAudioCapture stopAudioHALPlugInSource:]";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 735;
        WORD2(v15) = 2112;
        *(_QWORD *)((char *)&v15 + 6) = v4;
        HIWORD(v15) = 2048;
        v16 = self;
        v7 = " [%s] %s:%d %@(%p) ";
        v8 = v11;
        v9 = 48;
        goto LABEL_11;
      }
    }
  }
  v12 = -[VCAudioHALPluginCaptureSource stop](self->_audioHALPlugin, "stop", *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16);
  -[VCAudioHALPluginCaptureSource invalidate](self->_audioHALPlugin, "invalidate");

  self->_audioHALPlugin = 0;
  return v12;
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
  OUTLINED_FUNCTION_15_10();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not allocate audio queue recorder", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_15_10();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not allocate audio queue recorder", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate system audio callback queue", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_14_15();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not allocate audio buffer list", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_14_15();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not allocate audio buffer list", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_17_3();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not allocate audio buffer list", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_17_3();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not allocate audio buffer list", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d System Audio Capture Format is Non-Interleaved, updating AudioQueue Format", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_16_7();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid config", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_16_7();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d null configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d null configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d null sinkProc", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d null sinkProc", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.5()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "+[VCSystemAudioCapture isValidConfiguration:]";
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid tapType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCapture isValidConfiguration:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "+[VCSystemAudioCapture isValidConfiguration:]";
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_10_7(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid tapType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCapture isValidConfiguration:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.7()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "+[VCSystemAudioCapture isValidConfiguration:]";
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid sessionType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCapture isValidConfiguration:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.8()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "+[VCSystemAudioCapture isValidConfiguration:]";
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_10_7(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid sessionType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCapture isValidConfiguration:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18_5();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d NULL captureContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18_5();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d NULL captureContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)start
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d start called but already started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startAudioQueue
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSystemAudioCapture startAudioQueue]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d start error: %i", v2, *(const char **)v3, (unint64_t)"-[VCSystemAudioCapture startAudioQueue]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)stop
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d stop called but not never start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopAudioQueue
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSystemAudioCapture stopAudioQueue]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d stop error: %i", v2, *(const char **)v3, (unint64_t)"-[VCSystemAudioCapture stopAudioQueue]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)newAudioTapWithProcessID:audioFormat:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create audio tap", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)newAudioTapWithSessionType:audioFormat:.cold.1()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "+[VCSystemAudioCapture newAudioTapWithSessionType:audioFormat:]";
  OUTLINED_FUNCTION_4();
  v4 = 359;
  v5 = v0;
  v6 = 0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create audio tap for sessionType=%d", v2, 0x22u);
  OUTLINED_FUNCTION_3();
}

+ (void)newAudioTapWithCaptureContext:audioFormat:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "+[VCSystemAudioCapture newAudioTapWithCaptureContext:audioFormat:]";
  OUTLINED_FUNCTION_4();
  v4 = 371;
  v5 = 2112;
  v6 = v0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create audio tap for captureContext=%@", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioTapWithAudioStreamBasicDescription:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unsupported tapType=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioTapWithAudioStreamBasicDescription:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d allocate audioFormat error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioTapWithAudioStreamBasicDescription:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create audio tap", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startAudioHALPlugInSource:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d can not create plug in device for audio server driver plug in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startAudioHALPlugInSource:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d can not start plug in device for audio server driver plug in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
