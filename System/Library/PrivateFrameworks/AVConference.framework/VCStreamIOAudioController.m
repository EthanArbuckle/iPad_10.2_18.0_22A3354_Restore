@implementation VCStreamIOAudioController

- (VCStreamIOAudioController)initWithStreamInputID:(int64_t)a3 streamToken:(int64_t)a4 networkClockID:(unint64_t)a5
{
  VCStreamIOAudioController *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *CustomRootQueue;
  dispatch_queue_t v19;
  id v20;
  VCStreamInputAudio *streamInput;
  CFAllocatorRef SampleBufferAllocator;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  VCStreamIOAudioController *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)VCStreamIOAudioController;
  v8 = -[VCObject init](&v34, sel_init);
  if (v8)
  {
    -[VCObject setLogPrefix:](v8, "setLogPrefix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("streamInputID=%ld"), a3));
    if ((VCStreamIOAudioController *)objc_opt_class() == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v36 = v10;
          v37 = 2080;
          v38 = "-[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]";
          v39 = 1024;
          v40 = 82;
          v12 = "VCStreamIOAudioController [%s] %s:%d ";
          v13 = v11;
          v14 = 28;
LABEL_12:
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCStreamIOAudioController performSelector:](v8, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v36 = v15;
          v37 = 2080;
          v38 = "-[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]";
          v39 = 1024;
          v40 = 82;
          v41 = 2112;
          v42 = v9;
          v43 = 2048;
          v44 = v8;
          v12 = "VCStreamIOAudioController [%s] %s:%d %@(%p) ";
          v13 = v16;
          v14 = 48;
          goto LABEL_12;
        }
      }
    }
    if (a4)
    {
      v17 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.AVConference.streamIOAudioController_%ld"), a3), "UTF8String");
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
      v19 = dispatch_queue_create_with_target_V2(v17, 0, CustomRootQueue);
      v8->_stateQueue = (OS_dispatch_queue *)v19;
      if (v19)
      {
        if (a3
          && ((v20 = -[VCStreamInputManager streamInputWithID:](+[VCStreamInputManager sharedInstance](VCStreamInputManager, "sharedInstance"), "streamInputWithID:", a3), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)? (streamInput = v8->_streamInput): (streamInput = (VCStreamInputAudio *)v20, v8->_streamInput = streamInput), !streamInput))
        {
          if ((VCStreamIOAudioController *)objc_opt_class() == v8)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:].cold.4();
            }
            goto LABEL_64;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v27 = (const __CFString *)-[VCStreamIOAudioController performSelector:](v8, "performSelector:", sel_logPrefix);
          else
            v27 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v33 = VRTraceErrorLogLevelToCSTR();
            v29 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v36 = v33;
              v37 = 2080;
              v38 = "-[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]";
              v39 = 1024;
              v40 = 93;
              v41 = 2112;
              v42 = v27;
              v43 = 2048;
              v44 = v8;
              v30 = "VCStreamIOAudioController [%s] %s:%d %@(%p) StreamInputID not found in VCStreamInputManager";
              goto LABEL_63;
            }
          }
        }
        else
        {
          v8->_streamToken = a4;
          SampleBufferAllocator = VCAudioBufferList_CreateSampleBufferAllocator();
          v8->_audioSampleBufferAllocator = SampleBufferAllocator;
          if (SampleBufferAllocator)
          {
            -[VCStreamOutputManager registerStreamOutputSource:forStreamToken:](+[VCStreamOutputManager sharedInstance](VCStreamOutputManager, "sharedInstance"), "registerStreamOutputSource:forStreamToken:", v8, a4);
            v8->_networkClockID = a5;
            return v8;
          }
          if ((VCStreamIOAudioController *)objc_opt_class() == v8)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:].cold.3();
            }
            goto LABEL_64;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v26 = (const __CFString *)-[VCStreamIOAudioController performSelector:](v8, "performSelector:", sel_logPrefix);
          else
            v26 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v32 = VRTraceErrorLogLevelToCSTR();
            v29 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v36 = v32;
              v37 = 2080;
              v38 = "-[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]";
              v39 = 1024;
              v40 = 97;
              v41 = 2112;
              v42 = v26;
              v43 = 2048;
              v44 = v8;
              v30 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to create the sample buffer allocator";
              goto LABEL_63;
            }
          }
        }
LABEL_64:

        return 0;
      }
      if ((VCStreamIOAudioController *)objc_opt_class() == v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:].cold.2();
        }
        goto LABEL_64;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v25 = (const __CFString *)-[VCStreamIOAudioController performSelector:](v8, "performSelector:", sel_logPrefix);
      else
        v25 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_64;
      v31 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_64;
      *(_DWORD *)buf = 136316162;
      v36 = v31;
      v37 = 2080;
      v38 = "-[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]";
      v39 = 1024;
      v40 = 86;
      v41 = 2112;
      v42 = v25;
      v43 = 2048;
      v44 = v8;
      v30 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to allocate the dipatch queue";
    }
    else
    {
      if ((VCStreamIOAudioController *)objc_opt_class() == v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:].cold.1();
        }
        goto LABEL_64;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = (const __CFString *)-[VCStreamIOAudioController performSelector:](v8, "performSelector:", sel_logPrefix);
      else
        v24 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_64;
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_64;
      *(_DWORD *)buf = 136316162;
      v36 = v28;
      v37 = 2080;
      v38 = "-[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]";
      v39 = 1024;
      v40 = 83;
      v41 = 2112;
      v42 = v24;
      v43 = 2048;
      v44 = v8;
      v30 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Invalid streamToken";
    }
LABEL_63:
    _os_log_error_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0x30u);
    goto LABEL_64;
  }
  return v8;
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
  NSObject *stateQueue;
  __CFAllocator *audioSampleBufferAllocator;
  __CFAllocator *backingBufferAllocator;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCStreamIOAudioController *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v16 = v4;
        v17 = 2080;
        v18 = "-[VCStreamIOAudioController dealloc]";
        v19 = 1024;
        v20 = 113;
        v6 = "VCStreamIOAudioController [%s] %s:%d ";
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
      v3 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v16 = v9;
        v17 = 2080;
        v18 = "-[VCStreamIOAudioController dealloc]";
        v19 = 1024;
        v20 = 113;
        v21 = 2112;
        v22 = v3;
        v23 = 2048;
        v24 = self;
        v6 = "VCStreamIOAudioController [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  if (self->_isRunning)
    -[VCStreamIOAudioController dispatchedStopClient](self, "dispatchedStopClient");
  stateQueue = self->_stateQueue;
  if (stateQueue)
    dispatch_release(stateQueue);
  -[VCStreamIOAudioController cleanupStreamOutput](self, "cleanupStreamOutput");

  self->_streamInput = 0;
  audioSampleBufferAllocator = self->_audioSampleBufferAllocator;
  if (audioSampleBufferAllocator)
    CFRelease(audioSampleBufferAllocator);
  backingBufferAllocator = self->_backingBufferAllocator;
  if (backingBufferAllocator)
    CFRelease(backingBufferAllocator);

  self->_runningClient = 0;
  v14.receiver = self;
  v14.super_class = (Class)VCStreamIOAudioController;
  -[VCObject dealloc](&v14, sel_dealloc);
}

- (BOOL)_packetThreadStartWithClientFormat:(const tagVCAudioFrameFormat *)a3
{
  unsigned int samplesPerFrame;
  unsigned int **p_inputSamples;
  __int128 v6;
  int v7;
  int SerializedSize;
  uint64_t v9;
  PacketThread_s *v10;
  _BOOL4 v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v22[5];
  _BYTE buf[40];
  VCStreamIOAudioController *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_packetThread)
  {
    if ((VCStreamIOAudioController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v11)
          return v11;
        -[VCStreamIOAudioController _packetThreadStartWithClientFormat:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v11)
          return v11;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCStreamIOAudioController _packetThreadStartWithClientFormat:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 135;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v13;
        *(_WORD *)&buf[38] = 2048;
        v24 = self;
        _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) Packet thread is already running", buf, 0x30u);
      }
    }
    goto LABEL_40;
  }
  samplesPerFrame = a3->samplesPerFrame;
  p_inputSamples = (unsigned int **)&self->_inputSamples;
  v6 = *(_OWORD *)&a3->format.mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a3->format.mSampleRate;
  *(_OWORD *)&buf[16] = v6;
  *(_QWORD *)&buf[32] = *(_QWORD *)&a3->format.mBitsPerChannel;
  v7 = VCAudioBufferList_Allocate((__int128 *)buf, samplesPerFrame, &self->_inputSamples);
  if (v7 && *p_inputSamples)
  {
    SerializedSize = VCAudioBufferList_GetSerializedSize(*p_inputSamples);
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.AVConference.streamIOAudioController_%ld"), -[NSNumber longValue](-[VCStreamInput streamInputID](self->_streamInput, "streamInputID"), "longValue")), "UTF8String");
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __64__VCStreamIOAudioController__packetThreadStartWithClientFormat___block_invoke;
    v22[3] = &unk_1E9E53E68;
    v22[4] = self;
    v10 = (PacketThread_s *)PacketThread_Create(SerializedSize, 0, 0x10u, 19, v9, v22);
    self->_packetThread = v10;
    if (v10)
    {
      LOBYTE(v11) = 1;
      return v11;
    }
    if ((VCStreamIOAudioController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCStreamIOAudioController _packetThreadStartWithClientFormat:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v19;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCStreamIOAudioController _packetThreadStartWithClientFormat:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 148;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v14;
          *(_WORD *)&buf[38] = 2048;
          v24 = self;
          _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to create the packet thread", buf, 0x30u);
        }
      }
    }
  }
  else
  {
    if ((VCStreamIOAudioController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCStreamIOAudioController _packetThreadStartWithClientFormat:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCStreamIOAudioController _packetThreadStartWithClientFormat:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 138;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v12;
          *(_WORD *)&buf[38] = 2048;
          v24 = self;
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) Error allocating buffer list for stream IO", buf, 0x30u);
        }
      }
    }
    if (!v7)
      goto LABEL_40;
  }
  VCAudioBufferList_Destroy((uint64_t *)p_inputSamples);
LABEL_40:
  LOBYTE(v11) = 0;
  return v11;
}

double *__64__VCStreamIOAudioController__packetThreadStartWithClientFormat___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  double *result;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "sinkIO");
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  result = (double *)VCAudioBufferList_GetSampleFormat(a2);
  if (result)
  {
    LODWORD(v5[0]) = *result;
    v5[1] = VCAudioBufferList_GetTimestamp(a2);
    return (double *)(*(uint64_t (**)(_QWORD, _QWORD *, uint64_t))(v3 + 8))(*(_QWORD *)v3, v5, a2);
  }
  return result;
}

- (void)_packetThreadStop
{
  int *packetThread;

  packetThread = (int *)self->_packetThread;
  if (packetThread)
  {
    PacketThread_Destroy(packetThread);
    self->_packetThread = 0;
    VCAudioBufferList_Destroy((uint64_t *)&self->_inputSamples);
  }
}

- (void)startClient:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *stateQueue;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[6];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCStreamIOAudioController *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v19 = v6;
        v20 = 2080;
        v21 = "-[VCStreamIOAudioController startClient:]";
        v22 = 1024;
        v23 = 170;
        v8 = "VCStreamIOAudioController [%s] %s:%d ";
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
      v5 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v19 = v11;
        v20 = 2080;
        v21 = "-[VCStreamIOAudioController startClient:]";
        v22 = 1024;
        v23 = 170;
        v24 = 2112;
        v25 = v5;
        v26 = 2048;
        v27 = self;
        v8 = "VCStreamIOAudioController [%s] %s:%d %@(%p) ";
        v9 = v12;
        v10 = 48;
        goto LABEL_11;
      }
    }
  }
  if (a3)
  {
    stateQueue = self->_stateQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __41__VCStreamIOAudioController_startClient___block_invoke;
    v17[3] = &unk_1E9E52238;
    v17[4] = self;
    v17[5] = a3;
    dispatch_async(stateQueue, v17);
  }
  else if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamIOAudioController startClient:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v19 = v15;
        v20 = 2080;
        v21 = "-[VCStreamIOAudioController startClient:]";
        v22 = 1024;
        v23 = 173;
        v24 = 2112;
        v25 = v14;
        v26 = 2048;
        v27 = self;
        _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) nil client", buf, 0x30u);
      }
    }
  }
}

uint64_t __41__VCStreamIOAudioController_startClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "dispatchedStartClient:error:", *(_QWORD *)(a1 + 40), v5);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "delegate");
  return objc_msgSend(v3, "didStart:error:", v2, v5[0]);
}

- (BOOL)startInputForClient:(id)a3 error:(id *)a4
{
  __int128 v7;
  const AudioStreamBasicDescription *StreamBasicDescription;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  void *v13;
  char *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  VCStreamIOAudioController *v31;
  __int16 v32;
  uint64_t v33;
  char v34[16];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char __str[16];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v40 = v7;
  v41 = v7;
  *(_OWORD *)__str = v7;
  v39 = v7;
  v36 = v7;
  v37 = v7;
  *(_OWORD *)v34 = v7;
  v35 = v7;
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(-[VCStreamInput streamFormat](self->_streamInput, "streamFormat"));
  if (!StreamBasicDescription || !objc_msgSend(a3, "clientFormat"))
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AudioStreamBasicDescription is nil for client or stream. Client asbd=%s Stream asbd=%p for client (%p)"), FormatToCStr(objc_msgSend(a3, "clientFormat"), __str, 0x40uLL), StreamBasicDescription, a3);
    v12 = 32000;
    goto LABEL_14;
  }
  if (memcmp(StreamBasicDescription, (const void *)objc_msgSend(a3, "clientFormat"), 0x28uLL))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = FormatToCStr(objc_msgSend(a3, "clientFormat"), __str, 0x40uLL);
    v15 = objc_msgSend(v13, "stringWithFormat:", CFSTR("Client (%p) format=%s does not match stream input format=%s for StreamInputID=%ld"), a3, v14, FormatToCStr((uint64_t)StreamBasicDescription, v34, 0x40uLL), -[NSNumber longValue](-[VCStreamInput streamInputID](self->_streamInput, "streamInputID"), "longValue"));
LABEL_12:
    v10 = v15;
    v12 = 32016;
    goto LABEL_14;
  }
  if (!*(_QWORD *)(objc_msgSend(a3, "sinkIO") + 8))
  {
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client (%p) sinkIO is nil for StreamInputID=%ld"), a3, -[NSNumber longValue](-[VCStreamInput streamInputID](self->_streamInput, "streamInputID"), "longValue"), v20, v21);
    goto LABEL_12;
  }
  v9 = MEMORY[0x1E0CA2E68];
  *(_OWORD *)&self->_lastHostTime.value = *MEMORY[0x1E0CA2E68];
  self->_lastHostTime.epoch = *(_QWORD *)(v9 + 16);
  self->_lastSampleCount = 0;
  self->_nextExpectedSampleTime = 0;
  self->_timestampInitialized = 0;
  if (!-[VCStreamIOAudioController _packetThreadStartWithClientFormat:](self, "_packetThreadStartWithClientFormat:", objc_msgSend(a3, "clientFormat")))
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to start the packet thread for Client=%p for StreamInputID=%ld"), a3, -[NSNumber longValue](-[VCStreamInput streamInputID](self->_streamInput, "streamInputID"), "longValue"));
    v12 = 32015;
LABEL_14:
    if (!v10)
      goto LABEL_7;
    if ((VCStreamIOAudioController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[VCStreamIOAudioController startInputForClient:error:].cold.1();
          if (a4)
          {
LABEL_26:
            v19 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", v12, 0, v10);
            LOBYTE(v10) = 0;
            *a4 = v19;
            return v10;
          }
LABEL_28:
          LOBYTE(v10) = 0;
          return v10;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v23 = v17;
          v24 = 2080;
          v25 = "-[VCStreamIOAudioController startInputForClient:error:]";
          v26 = 1024;
          v27 = 214;
          v28 = 2112;
          v29 = v16;
          v30 = 2048;
          v31 = self;
          v32 = 2112;
          v33 = v10;
          _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) error=%@", buf, 0x3Au);
          if (a4)
            goto LABEL_26;
          goto LABEL_28;
        }
      }
    }
    if (a4)
      goto LABEL_26;
    goto LABEL_28;
  }
  PacketThread_ReceiverIsReady((uint64_t)self->_packetThread);
  -[VCStreamInputAudio registerSampleBufferCallback:context:](self->_streamInput, "registerSampleBufferCallback:context:", _VCStreamIOAudioController_SampleBufferCallback, self);
  LOBYTE(v10) = 1;
LABEL_7:
  -[VCStreamInput didStartStreamInputCaptureSource](self->_streamInput, "didStartStreamInputCaptureSource");
  return v10;
}

- (BOOL)startOutputForClient:(id)a3 error:(id *)a4
{
  BOOL result;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCStreamIOAudioController *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(objc_msgSend(a3, "sourceIO") + 8))
  {
    self->_sourceIO = (_VCAudioIOControllerClientIO *)objc_msgSend(a3, "sourceIO");
    if (-[VCStreamIOAudioController setupAndStartOutputClientThread](self, "setupAndStartOutputClientThread"))
      return 1;
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client (%p) Failed to create the outputClientThread"), a3);
    v9 = 32025;
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client (%p) sourceIO is nil for StreamToken=%ld"), a3, self->_streamToken);
    v9 = 32016;
  }
  self->_sourceIO = 0;
  if (!v8)
    return 0;
  if ((VCStreamIOAudioController *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v15 = v11;
        v16 = 2080;
        v17 = "-[VCStreamIOAudioController startOutputForClient:error:]";
        v18 = 1024;
        v19 = 240;
        v20 = 2112;
        v21 = v10;
        v22 = 2048;
        v23 = self;
        v24 = 2112;
        v25 = v8;
        _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) error=%@", buf, 0x3Au);
        if (a4)
          goto LABEL_18;
        return 0;
      }
    }
    goto LABEL_17;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3
    || (VRTraceErrorLogLevelToCSTR(), !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
  {
LABEL_17:
    if (a4)
      goto LABEL_18;
    return 0;
  }
  -[VCStreamIOAudioController startOutputForClient:error:].cold.1();
  if (a4)
  {
LABEL_18:
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", v9, 0, v8);
    result = 0;
    *a4 = v13;
    return result;
  }
  return 0;
}

- (BOOL)setupAndStartOutputClientThread
{
  VCAudioRelay *v3;
  unint64_t networkClockID;
  uint64_t v5;
  VCAudioRelayIO *v6;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  VCStreamIOAudioController *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v3 = objc_alloc_init(VCAudioRelay);
  self->_outputThread = v3;
  if (v3)
  {
    networkClockID = self->_networkClockID;
    v5 = *MEMORY[0x1E0DBF0F0];
    if (networkClockID == *MEMORY[0x1E0DBF0F0]
      || -[VCAudioRelay setNetworkClockID:withError:](v3, "setNetworkClockID:withError:", self->_networkClockID, &v26))
    {
      v6 = objc_alloc_init(VCAudioRelayIO);
      self->_outputThreadClient = v6;
      if (!v6)
      {
        if ((VCStreamIOAudioController *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              if ((-[VCStreamIOAudioController setupAndStartOutputClientThread].cold.2(v13, v14, networkClockID == v5) & 1) == 0)
                return 1;
              goto LABEL_64;
            }
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v9 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v9 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v18 = VRTraceErrorLogLevelToCSTR();
            v19 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v28 = v18;
              v29 = 2080;
              v30 = "-[VCStreamIOAudioController setupAndStartOutputClientThread]";
              v31 = 1024;
              v32 = 262;
              v33 = 2112;
              v34 = v9;
              v35 = 2048;
              v36 = self;
              _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to allocate output thread client", buf, 0x30u);
            }
          }
        }
        if (networkClockID != v5)
          return 1;
        goto LABEL_64;
      }
      -[VCAudioRelayIO setSpeakerCallback:](v6, "setSpeakerCallback:", _VCStreamIOAudioController_PullAudioSamples);
      -[VCAudioRelayIO setSpeakerCallbackContext:](self->_outputThreadClient, "setSpeakerCallbackContext:", self);
      -[VCAudioRelayIO setClientFormat:](self->_outputThreadClient, "setClientFormat:", -[VCAudioIOControllerClient clientFormat](self->_runningClient, "clientFormat"));
      if (-[VCAudioRelay setClientIO:withError:](self->_outputThread, "setClientIO:withError:", self->_outputThreadClient, &v26))
      {
        if (-[VCAudioRelay startClientIO](self->_outputThread, "startClientIO"))
          return 1;
        if ((VCStreamIOAudioController *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCStreamIOAudioController setupAndStartOutputClientThread].cold.3();
          }
          goto LABEL_64;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v11 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v11 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v28 = v22;
            v29 = 2080;
            v30 = "-[VCStreamIOAudioController setupAndStartOutputClientThread]";
            v31 = 1024;
            v32 = 272;
            v33 = 2112;
            v34 = v11;
            v35 = 2048;
            v36 = self;
            v17 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to start streamOutput thread";
            goto LABEL_54;
          }
        }
        goto LABEL_64;
      }
      if ((VCStreamIOAudioController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCStreamIOAudioController setupAndStartOutputClientThread].cold.4();
        }
        goto LABEL_64;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_64;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_64;
      *(_DWORD *)buf = 136316418;
      v28 = v20;
      v29 = 2080;
      v30 = "-[VCStreamIOAudioController setupAndStartOutputClientThread]";
      v31 = 1024;
      v32 = 269;
      v33 = 2112;
      v34 = v10;
      v35 = 2048;
      v36 = self;
      v37 = 2112;
      v38 = v26;
      v17 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to set client error=%@";
    }
    else
    {
      if ((VCStreamIOAudioController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCStreamIOAudioController setupAndStartOutputClientThread].cold.5();
        }
        goto LABEL_64;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_64;
      v25 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_64;
      *(_DWORD *)buf = 136316418;
      v28 = v25;
      v29 = 2080;
      v30 = "-[VCStreamIOAudioController setupAndStartOutputClientThread]";
      v31 = 1024;
      v32 = 257;
      v33 = 2112;
      v34 = v12;
      v35 = 2048;
      v36 = self;
      v37 = 2112;
      v38 = v26;
      v17 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to create network clock for output thread with error=%@";
    }
    v23 = v21;
    v24 = 58;
    goto LABEL_63;
  }
  if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamIOAudioController setupAndStartOutputClientThread].cold.1();
    }
    goto LABEL_64;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v8 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v28 = v15;
      v29 = 2080;
      v30 = "-[VCStreamIOAudioController setupAndStartOutputClientThread]";
      v31 = 1024;
      v32 = 252;
      v33 = 2112;
      v34 = v8;
      v35 = 2048;
      v36 = self;
      v17 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to allocate output thread";
LABEL_54:
      v23 = v16;
      v24 = 48;
LABEL_63:
      _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v17, buf, v24);
    }
  }
LABEL_64:
  -[VCStreamIOAudioController cleanupOutputThread](self, "cleanupOutputThread");
  return 0;
}

- (void)cleanupOutputThread
{

  self->_outputThreadClient = 0;
  self->_outputThread = 0;
}

- (void)cleanupStreamOutput
{
  VCStreamOutput *streamOutput;

  streamOutput = self->_streamOutput;
  if (streamOutput)
  {

    self->_streamOutput = 0;
  }
}

- (void)stopClient:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *stateQueue;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[6];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCStreamIOAudioController *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v19 = v6;
        v20 = 2080;
        v21 = "-[VCStreamIOAudioController stopClient:]";
        v22 = 1024;
        v23 = 296;
        v8 = "VCStreamIOAudioController [%s] %s:%d ";
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
      v5 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v19 = v11;
        v20 = 2080;
        v21 = "-[VCStreamIOAudioController stopClient:]";
        v22 = 1024;
        v23 = 296;
        v24 = 2112;
        v25 = v5;
        v26 = 2048;
        v27 = self;
        v8 = "VCStreamIOAudioController [%s] %s:%d %@(%p) ";
        v9 = v12;
        v10 = 48;
        goto LABEL_11;
      }
    }
  }
  if (a3)
  {
    stateQueue = self->_stateQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__VCStreamIOAudioController_stopClient___block_invoke;
    v17[3] = &unk_1E9E52238;
    v17[4] = self;
    v17[5] = a3;
    dispatch_async(stateQueue, v17);
  }
  else if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamIOAudioController stopClient:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v19 = v15;
        v20 = 2080;
        v21 = "-[VCStreamIOAudioController stopClient:]";
        v22 = 1024;
        v23 = 299;
        v24 = 2112;
        v25 = v14;
        v26 = 2048;
        v27 = self;
        _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) nil client", buf, 0x30u);
      }
    }
  }
}

uint64_t __40__VCStreamIOAudioController_stopClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 176))
  {
    v3 = *(_QWORD *)(v2 + 232);
    if (*(_QWORD *)(a1 + 40) == v3)
    {
      objc_msgSend((id)v2, "dispatchedStopClient");
      v4 = 0;
      v5 = 1;
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStop:error:", v5, v4);
    }
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client (%p) does not match running client=%p. Cannot stop stream IO Audio"), *(_QWORD *)(a1 + 40), v3);
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client (%p) cannot stop stream IO Audio when not running"), *(_QWORD *)(a1 + 40), v12);
  }
  v4 = v7;
  if (v7)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __40__VCStreamIOAudioController_stopClient___block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v11 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136316418;
          v14 = v9;
          v15 = 2080;
          v16 = "-[VCStreamIOAudioController stopClient:]_block_invoke";
          v17 = 1024;
          v18 = 315;
          v19 = 2112;
          v20 = v8;
          v21 = 2048;
          v22 = v11;
          v23 = 2112;
          v24 = v4;
          _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) error=%@", buf, 0x3Au);
        }
      }
    }
    v4 = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32005, 0, v4);
  }
  v5 = 0;
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStop:error:", v5, v4);
}

- (BOOL)supportsVoiceActivityDetection
{
  return 0;
}

- (BOOL)dispatchedStartClient:(id)a3 error:(id *)a4
{
  char v7;
  _BOOL4 v8;
  BOOL v9;
  _BOOL4 v10;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  VCStreamIOAudioController *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_isRunning)
  {
    v9 = 0;
    v12 = CFSTR("Client (%p) cannot start stream IO Audio when already running");
    v13 = 32025;
    goto LABEL_17;
  }
  if (!objc_msgSend(a3, "direction"))
  {
    v9 = 0;
    v12 = CFSTR("Client (%p) direction is invalid");
    v13 = 32026;
    goto LABEL_17;
  }
  objc_msgSend((id)objc_msgSend(a3, "delegate"), "controllerFormatChanged:", objc_msgSend(a3, "clientFormat"));
  -[VCStreamIOAudioController setRunningClient:](self, "setRunningClient:", a3);
  v7 = objc_msgSend(a3, "direction");
  if ((v7 & 1) != 0)
  {
    v8 = -[VCStreamIOAudioController startOutputForClient:error:](self, "startOutputForClient:error:", a3, a4);
    self->_sourceStarted = v8;
    if (!v8)
    {
      v9 = 0;
      v12 = CFSTR("Client (%p) Starting output for client failed");
LABEL_16:
      v13 = 32005;
LABEL_17:
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v12, a3);
      if (!v14)
        return v9;
      v15 = v14;
      if ((VCStreamIOAudioController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            -[VCStreamIOAudioController dispatchedStartClient:error:].cold.1();
            if (!a4)
              goto LABEL_30;
            goto LABEL_29;
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v16 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v16 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            v20 = v17;
            v21 = 2080;
            v22 = "-[VCStreamIOAudioController dispatchedStartClient:error:]";
            v23 = 1024;
            v24 = 354;
            v25 = 2112;
            v26 = v16;
            v27 = 2048;
            v28 = self;
            v29 = 2112;
            v30 = v15;
            _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) error=%@", buf, 0x3Au);
            if (!a4)
              goto LABEL_30;
            goto LABEL_29;
          }
        }
      }
      if (!a4)
      {
LABEL_30:
        -[VCStreamIOAudioController dispatchedStopClient](self, "dispatchedStopClient");
        return 0;
      }
LABEL_29:
      *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", v13, 0, v15);
      goto LABEL_30;
    }
  }
  v9 = v7 & 1;
  if ((objc_msgSend(a3, "direction") & 2) != 0)
  {
    v10 = -[VCStreamIOAudioController startInputForClient:error:](self, "startInputForClient:error:", a3, a4);
    self->_sinkStarted = v10;
    if (v10)
    {
      v9 = 1;
      goto LABEL_8;
    }
    v12 = CFSTR("Client (%p) Stop the output for client");
    goto LABEL_16;
  }
LABEL_8:
  if (self->_sourceStarted || self->_sinkStarted)
  {
    self->_clientDirection = objc_msgSend(a3, "direction");
    self->_isRunning = 1;
  }
  return v9;
}

- (void)dispatchedStopClient
{
  self->_isRunning = 0;
  if (self->_sourceStarted)
  {
    -[VCAudioRelay stopClientIO](self->_outputThread, "stopClientIO");
    -[VCStreamIOAudioController cleanupOutputThread](self, "cleanupOutputThread");
    self->_sourceIO = 0;
    self->_sourceStarted = 0;
  }
  if (self->_sinkStarted)
  {
    -[VCStreamInputAudio registerSampleBufferCallback:context:](self->_streamInput, "registerSampleBufferCallback:context:", 0, 0);
    -[VCStreamIOAudioController _packetThreadStop](self, "_packetThreadStop");
    -[VCStreamInput didStopStreamInputCaptureSource](self->_streamInput, "didStopStreamInputCaptureSource");
    self->_sinkStarted = 0;
  }
  -[VCStreamIOAudioController setRunningClient:](self, "setRunningClient:", 0);
}

- (void)dispatchedUpdateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4
{
  int v7;
  int var0;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  VCAudioIOControllerClient *runningClient;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  VCAudioIOControllerClient *v20;
  uint64_t v21;
  NSObject *v22;
  _DWORD v23[3];
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  VCStreamIOAudioController *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  VCAudioIOControllerClient *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v7 = objc_msgSend(a3, "direction");
  var0 = a4->var0;
  objc_msgSend(a3, "setDirection:", a4->var0);
  objc_msgSend(a3, "setSpatialAudioDisabled:", a4->var1);
  objc_msgSend(a3, "setIsVoiceActivityEnabled:", a4->var2);
  objc_msgSend(a3, "setIsMediaPriorityEnabled:", a4->var3);
  if (self->_runningClient != a3)
  {
    if ((VCStreamIOAudioController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      runningClient = self->_runningClient;
      v23[0] = 136316162;
      *(_QWORD *)&v23[1] = v12;
      v24 = 2080;
      v25 = "-[VCStreamIOAudioController dispatchedUpdateClient:settings:]";
      v26 = 1024;
      v27 = 388;
      v28 = 2048;
      v29 = a3;
      v30 = 2048;
      v31 = (VCStreamIOAudioController *)runningClient;
      v15 = "VCStreamIOAudioController [%s] %s:%d client=%p != runningClient=%p";
      v16 = v13;
      v17 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      v20 = self->_runningClient;
      v23[0] = 136316674;
      *(_QWORD *)&v23[1] = v18;
      v24 = 2080;
      v25 = "-[VCStreamIOAudioController dispatchedUpdateClient:settings:]";
      v26 = 1024;
      v27 = 388;
      v28 = 2112;
      v29 = (id)v10;
      v30 = 2048;
      v31 = self;
      v32 = 2048;
      v33 = a3;
      v34 = 2048;
      v35 = v20;
      v15 = "VCStreamIOAudioController [%s] %s:%d %@(%p) client=%p != runningClient=%p";
      v16 = v19;
      v17 = 68;
    }
LABEL_29:
    _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)v23, v17);
    return;
  }
  if (-[VCStreamIOAudioController canSetDirection:](self, "canSetDirection:", a4->var0))
  {
    if (self->_isRunning && v7 != var0)
    {
      -[VCStreamIOAudioController dispatchedStopClient](self, "dispatchedStopClient", 0);
      -[VCStreamIOAudioController dispatchedStartClient:error:](self, "dispatchedStartClient:error:", a3, v23);
    }
    return;
  }
  if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamIOAudioController dispatchedUpdateClient:settings:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v23[0] = 136316418;
        *(_QWORD *)&v23[1] = v21;
        v24 = 2080;
        v25 = "-[VCStreamIOAudioController dispatchedUpdateClient:settings:]";
        v26 = 1024;
        v27 = 391;
        v28 = 2112;
        v29 = (id)v11;
        v30 = 2048;
        v31 = self;
        v32 = 2048;
        v33 = a3;
        v15 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Could not update the direction for client=%p";
        v16 = v22;
        v17 = 58;
        goto LABEL_29;
      }
    }
  }
}

- (void)updateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4
{
  NSObject *stateQueue;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  _QWORD block[6];
  tagVCAudioIOControllerClientSettings v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCStreamIOAudioController *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      stateQueue = self->_stateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__VCStreamIOAudioController_updateClient_settings___block_invoke;
      block[3] = &unk_1E9E522D8;
      block[4] = self;
      block[5] = a3;
      v13 = *a4;
      dispatch_async(stateQueue, block);
      return;
    }
    if ((VCStreamIOAudioController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCStreamIOAudioController updateClient:settings:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v15 = v11;
          v16 = 2080;
          v17 = "-[VCStreamIOAudioController updateClient:settings:]";
          v18 = 1024;
          v19 = 403;
          v20 = 2112;
          v21 = v7;
          v22 = 2048;
          v23 = self;
          v10 = "VCStreamIOAudioController [%s] %s:%d %@(%p) settings is NULL";
          goto LABEL_25;
        }
      }
    }
  }
  else if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamIOAudioController updateClient:settings:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v15 = v8;
        v16 = 2080;
        v17 = "-[VCStreamIOAudioController updateClient:settings:]";
        v18 = 1024;
        v19 = 402;
        v20 = 2112;
        v21 = v6;
        v22 = 2048;
        v23 = self;
        v10 = "VCStreamIOAudioController [%s] %s:%d %@(%p) client is nil";
LABEL_25:
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x30u);
      }
    }
  }
}

uint64_t __51__VCStreamIOAudioController_updateClient_settings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateClient:settings:", *(_QWORD *)(a1 + 40), a1 + 48);
}

- (BOOL)canSetDirection:(unsigned __int8)a3
{
  return -[VCAudioIOControllerClient direction](self->_runningClient, "direction") == a3
      || (a3 & 2) == 0
      || self->_streamInput;
}

- (void)invalidate
{
  -[VCStreamOutputManager deregisterStreamOutputSourceForStreamToken:](+[VCStreamOutputManager sharedInstance](VCStreamOutputManager, "sharedInstance"), "deregisterStreamOutputSourceForStreamToken:", self->_streamToken);
}

- (NSDictionary)reportingStats
{
  NSDictionary *result;

  result = (NSDictionary *)self->_streamInput;
  if (result)
    return (NSDictionary *)-[NSDictionary reportingStats](result, "reportingStats");
  return result;
}

- (VCStreamOutput)streamOutput
{
  os_unfair_lock_s *p_streamOutputLock;
  VCStreamOutput *v4;

  p_streamOutputLock = &self->_streamOutputLock;
  os_unfair_lock_lock(&self->_streamOutputLock);
  v4 = self->_streamOutput;
  os_unfair_lock_unlock(p_streamOutputLock);
  return v4;
}

- (void)setStreamOutput:(id)a3
{
  os_unfair_lock_s *p_streamOutputLock;
  VCStreamOutput *streamOutput;
  __CFAllocator *v7;

  p_streamOutputLock = &self->_streamOutputLock;
  os_unfair_lock_lock(&self->_streamOutputLock);

  streamOutput = (VCStreamOutput *)a3;
  self->_streamOutput = streamOutput;
  if (self->_backingBufferAllocator)
  {
    CFRelease(self->_backingBufferAllocator);
    streamOutput = self->_streamOutput;
  }
  v7 = -[VCStreamOutput backingBufferAllocator](streamOutput, "backingBufferAllocator");
  self->_backingBufferAllocator = v7;
  if (v7)
    CFRetain(v7);
  os_unfair_lock_unlock(p_streamOutputLock);
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
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
  VCStreamIOAudioController *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = v5;
        v14 = 2080;
        v15 = "-[VCStreamIOAudioController didUpdateBasebandCodec:]";
        v16 = 1024;
        v17 = 457;
        v7 = "VCStreamIOAudioController [%s] %s:%d not handled";
        v8 = v6;
        v9 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCStreamIOAudioController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136316162;
        v13 = v10;
        v14 = 2080;
        v15 = "-[VCStreamIOAudioController didUpdateBasebandCodec:]";
        v16 = 1024;
        v17 = 457;
        v18 = 2112;
        v19 = v4;
        v20 = 2048;
        v21 = self;
        v7 = "VCStreamIOAudioController [%s] %s:%d %@(%p) not handled";
        v8 = v11;
        v9 = 48;
        goto LABEL_11;
      }
    }
  }
}

- (VCAudioIOControllerClient)runningClient
{
  return (VCAudioIOControllerClient *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRunningClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (void)initWithStreamInputID:streamToken:networkClockID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Invalid streamToken", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamInputID:streamToken:networkClockID:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Failed to allocate the dipatch queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamInputID:streamToken:networkClockID:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Failed to create the sample buffer allocator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamInputID:streamToken:networkClockID:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d StreamInputID not found in VCStreamInputManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_packetThreadStartWithClientFormat:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Error allocating buffer list for stream IO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_packetThreadStartWithClientFormat:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Failed to create the packet thread", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_packetThreadStartWithClientFormat:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Packet thread is already running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startClient:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d nil client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startInputForClient:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)startOutputForClient:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)setupAndStartOutputClientThread
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Failed to create network clock for output thread with error=%@");
  OUTLINED_FUNCTION_3();
}

- (uint64_t)setupAndStartOutputClientThread
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v11;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v4, v5, "VCStreamIOAudioController [%s] %s:%d Failed to allocate output thread client", v6, v7, v8, v9, v11);
  return a3 & 1;
}

- (void)stopClient:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d nil client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __40__VCStreamIOAudioController_stopClient___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedStartClient:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedUpdateClient:settings:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCStreamIOAudioController dispatchedUpdateClient:settings:]";
  OUTLINED_FUNCTION_4();
  LODWORD(v4) = 391;
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Could not update the direction for client=%p", v2, *(const char **)v3, (unint64_t)"-[VCStreamIOAudioController dispatchedUpdateClient:settings:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)updateClient:settings:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d client is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateClient:settings:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCStreamIOAudioController [%s] %s:%d settings is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
