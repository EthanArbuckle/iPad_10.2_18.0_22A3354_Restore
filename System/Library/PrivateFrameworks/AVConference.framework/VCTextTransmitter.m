@implementation VCTextTransmitter

- (VCTextTransmitter)initWithConfiguration:(_VCTextTransmitterConfiguration *)a3
{
  char *v4;
  VCTextTransmitter *v5;
  __int128 v6;
  double v7;
  BOOL v8;
  double v9;
  NSObject *CustomRootQueue;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCTextTransmitter;
  v4 = -[VCTextTransmitter init](&v12, sel_init);
  v5 = (VCTextTransmitter *)v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->rtpHandle;
    *((_QWORD *)v4 + 3) = *(_QWORD *)&a3->numRedundantPayloads;
    *(_OWORD *)(v4 + 8) = v6;
    LODWORD(v6) = *((_DWORD *)v4 + 7);
    v7 = *(float *)&v6;
    v8 = *(float *)&v6 <= 0.0;
    v9 = 0.0333333333;
    if (!v8)
      v9 = v7;
    *((double *)v4 + 4) = v9;
    *((_QWORD *)v4 + 8) = 0x6D00000014;
    *((_QWORD *)v4 + 7) = -[VCAudioRedBuilder initWithRedPayloadType:sampleRate:samplesPerFrame:numPayloads:maxDelay:includeSequenceOffset:]([VCAudioRedBuilder alloc], "initWithRedPayloadType:sampleRate:samplesPerFrame:numPayloads:maxDelay:includeSequenceOffset:", *((unsigned int *)v4 + 16));
    v5->_textFramesSendQueueLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v5->_textFramesSendQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_isIdle = 1;
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(56);
    v5->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCTextTransmitter", 0, CustomRootQueue);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCTextTransmitter;
  -[VCTextTransmitter dealloc](&v3, sel_dealloc);
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
  unsigned int numRedundantPayloads;
  int v12;
  unsigned int i;
  uint64_t v14;
  int currentPayloadType;
  int v17;
  int v18;
  _BYTE buf[12];
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCTextTransmitter *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((VCTextTransmitter *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCTextTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v9;
    v20 = 2080;
    v21 = "-[VCTextTransmitter start]";
    v22 = 1024;
    v23 = 60;
    v24 = 2112;
    v25 = v3;
    v26 = 2048;
    v27 = self;
    v6 = "VCTextTransmitter [%s] %s:%d %@(%p) ";
    v7 = v10;
    v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v4;
      v20 = 2080;
      v21 = "-[VCTextTransmitter start]";
      v22 = 1024;
      v23 = 60;
      v6 = "VCTextTransmitter [%s] %s:%d ";
      v7 = v5;
      v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  self->_startTime = micro();
  -[VCTextTransmitter sendCharacter:](self, "sendCharacter:", 65279);
  numRedundantPayloads = self->_config.numRedundantPayloads;
  if (numRedundantPayloads)
  {
    v12 = 0;
    for (i = 0; i < numRedundantPayloads; ++i)
    {
      v14 = -[VCTextTransmitter getCharTimestampForSystemTime:](self, "getCharTimestampForSystemTime:", self->_startTime - self->_txIntervalMin * (double)(numRedundantPayloads + v12));
      currentPayloadType = self->_currentPayloadType;
      v17 = 0;
      v18 = currentPayloadType;
      *(_QWORD *)buf = 0;
      -[VCTextTransmitter updatePayloadHistory:timestamp:payloadType:payload:payloadLength:](self, "updatePayloadHistory:timestamp:payloadType:payload:payloadLength:", &stru_1E9E58EE0, v14, &v18, buf, &v17);
      numRedundantPayloads = self->_config.numRedundantPayloads;
      --v12;
    }
  }
  return -[VCTextTransmitter startHeartbeat](self, "startHeartbeat");
}

- (void)stop
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  _BYTE v11[24];
  __int128 v12;
  VCTextTransmitter *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((VCTextTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136315650;
        *(_QWORD *)&v11[4] = v4;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCTextTransmitter stop]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 75;
        v6 = "VCTextTransmitter [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCTextTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136316162;
        *(_QWORD *)&v11[4] = v9;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCTextTransmitter stop]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 75;
        WORD2(v12) = 2112;
        *(_QWORD *)((char *)&v12 + 6) = v3;
        HIWORD(v12) = 2048;
        v13 = self;
        v6 = "VCTextTransmitter [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  self->_startTime = 0.0;
  -[VCTextTransmitter stopHeartbeat](self, "stopHeartbeat", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12, v13);
}

- (void)sendCharacter:(unsigned __int16)a3
{
  unsigned __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  -[VCTextTransmitter sendText:](self, "sendText:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v3, 1));
}

- (void)sendText:(id)a3
{
  const __CFString *v4;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  VCTextTransmitter *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_startTime == 0.0)
  {
    if ((VCTextTransmitter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTextTransmitter sendText:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)-[VCTextTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v8 = 136316162;
          v9 = v6;
          v10 = 2080;
          v11 = "-[VCTextTransmitter sendText:]";
          v12 = 1024;
          v13 = 88;
          v14 = 2112;
          v15 = v4;
          v16 = 2048;
          v17 = self;
          _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, "VCTextTransmitter [%s] %s:%d %@(%p) Trying to send when the transmitter is stopped!", (uint8_t *)&v8, 0x30u);
        }
      }
    }
  }
  else
  {
    -[NSLock lock](self->_textFramesSendQueueLock, "lock");
    -[NSMutableArray addObject:](self->_textFramesSendQueue, "addObject:", a3);
    -[NSLock unlock](self->_textFramesSendQueueLock, "unlock");
  }
}

- (unsigned)getCharTimestampForSystemTime:(double)a3
{
  double startTime;
  double v4;

  startTime = self->_startTime;
  v4 = a3 - startTime;
  LODWORD(startTime) = self->_config.sampleRate;
  return (v4 * (double)*(unint64_t *)&startTime);
}

- (void)sendTextFrameWithRedundancy:(id)a3 marker:(int)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  double v25;
  uint64_t v26;
  float txIntervalMin;
  const __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  unsigned int v32;
  void *v33;
  int currentPayloadType;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  id v42;
  __int16 v43;
  VCTextTransmitter *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if ((VCTextTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v36 = v8;
        v37 = 2080;
        v38 = "-[VCTextTransmitter sendTextFrameWithRedundancy:marker:]";
        v39 = 1024;
        v40 = 103;
        v10 = "VCTextTransmitter [%s] %s:%d ";
        v11 = v9;
        v12 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCTextTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v36 = v13;
        v37 = 2080;
        v38 = "-[VCTextTransmitter sendTextFrameWithRedundancy:marker:]";
        v39 = 1024;
        v40 = 103;
        v41 = 2112;
        v42 = (id)v7;
        v43 = 2048;
        v44 = self;
        v10 = "VCTextTransmitter [%s] %s:%d %@(%p) ";
        v11 = v14;
        v12 = 48;
        goto LABEL_11;
      }
    }
  }
  if ((VCTextTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_29;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    v18 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      *(_DWORD *)buf = 136315906;
      v36 = v16;
      v37 = 2080;
      v38 = "-[VCTextTransmitter sendTextFrameWithRedundancy:marker:]";
      v39 = 1024;
      v40 = 104;
      v41 = 2112;
      v42 = a3;
      v19 = "VCTextTransmitter [%s] %s:%d Sending text:%@";
      v20 = v17;
      v21 = 38;
LABEL_24:
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      goto LABEL_29;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[VCTextTransmitter sendTextFrameWithRedundancy:marker:].cold.3();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCTextTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      v24 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          goto LABEL_29;
        *(_DWORD *)buf = 136316418;
        v36 = v22;
        v37 = 2080;
        v38 = "-[VCTextTransmitter sendTextFrameWithRedundancy:marker:]";
        v39 = 1024;
        v40 = 104;
        v41 = 2112;
        v42 = (id)v15;
        v43 = 2048;
        v44 = self;
        v45 = 2112;
        v46 = a3;
        v19 = "VCTextTransmitter [%s] %s:%d %@(%p) Sending text:%@";
        v20 = v23;
        v21 = 58;
        goto LABEL_24;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316418;
        v36 = v22;
        v37 = 2080;
        v38 = "-[VCTextTransmitter sendTextFrameWithRedundancy:marker:]";
        v39 = 1024;
        v40 = 104;
        v41 = 2112;
        v42 = (id)v15;
        v43 = 2048;
        v44 = self;
        v45 = 2112;
        v46 = a3;
        _os_log_debug_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEBUG, "VCTextTransmitter [%s] %s:%d %@(%p) Sending text:%@", buf, 0x3Au);
      }
    }
  }
LABEL_29:
  v25 = micro();
  v26 = -[VCTextTransmitter getCharTimestampForSystemTime:](self, "getCharTimestampForSystemTime:");
  currentPayloadType = self->_currentPayloadType;
  v33 = 0;
  v32 = 0;
  -[VCTextTransmitter updatePayloadHistory:timestamp:payloadType:payload:payloadLength:](self, "updatePayloadHistory:timestamp:payloadType:payload:payloadLength:", a3, v26, &currentPayloadType, &v33, &v32);
  if (v33)
  {
    v31 = 0;
    txIntervalMin = self->_txIntervalMin;
    if ((RTPSendRTP((uint64_t)self->_config.rtpHandle, currentPayloadType, a4, v26, v33, v32, &v31, 0, v25, txIntervalMin, 0, 0, 0, 0, 0, 0) & 0x80000000) != 0)
    {
      if ((VCTextTransmitter *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTextTransmitter sendTextFrameWithRedundancy:marker:].cold.2();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v28 = (const __CFString *)-[VCTextTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v28 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v29 = VRTraceErrorLogLevelToCSTR();
          v30 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v36 = v29;
            v37 = 2080;
            v38 = "-[VCTextTransmitter sendTextFrameWithRedundancy:marker:]";
            v39 = 1024;
            v40 = 116;
            v41 = 2112;
            v42 = (id)v28;
            v43 = 2048;
            v44 = self;
            _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, "VCTextTransmitter [%s] %s:%d %@(%p) failed to send RTP", buf, 0x30u);
          }
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCTextTransmitter sendTextFrameWithRedundancy:marker:].cold.1();
  }
}

- (void)updatePayloadHistory:(id)a3 timestamp:(unsigned int)a4 payloadType:(int *)a5 payload:(char *)a6 payloadLength:(int *)a7
{
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  __int128 v22;
  uint64_t PrimaryPayloadAndAppendSamples;
  tagVCAudioRedPayload *v24;
  int bufferLength;
  _BYTE v26[40];
  VCTextTransmitter *v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((VCTextTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v26 = 136315650;
        *(_QWORD *)&v26[4] = v14;
        *(_WORD *)&v26[12] = 2080;
        *(_QWORD *)&v26[14] = "-[VCTextTransmitter updatePayloadHistory:timestamp:payloadType:payload:payloadLength:]";
        *(_WORD *)&v26[22] = 1024;
        *(_DWORD *)&v26[24] = 124;
        v16 = "VCTextTransmitter [%s] %s:%d ";
        v17 = v15;
        v18 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, v26, v18);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCTextTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v26 = 136316162;
        *(_QWORD *)&v26[4] = v19;
        *(_WORD *)&v26[12] = 2080;
        *(_QWORD *)&v26[14] = "-[VCTextTransmitter updatePayloadHistory:timestamp:payloadType:payload:payloadLength:]";
        *(_WORD *)&v26[22] = 1024;
        *(_DWORD *)&v26[24] = 124;
        *(_WORD *)&v26[28] = 2112;
        *(_QWORD *)&v26[30] = v13;
        *(_WORD *)&v26[38] = 2048;
        v27 = self;
        v16 = "VCTextTransmitter [%s] %s:%d %@(%p) ";
        v17 = v20;
        v18 = 48;
        goto LABEL_11;
      }
    }
  }
  *a5 = self->_currentPayloadType;
  *a6 = (char *)objc_msgSend(a3, "cStringUsingEncoding:", 4, *(_OWORD *)v26, *(_QWORD *)&v26[16], *(_OWORD *)&v26[24], v27);
  *a7 = objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4);
  if (self->_config.isRedEnabled)
  {
    v21 = RTPGetExternalPayload((uint64_t)self->_config.rtpHandle, LOWORD(self->_currentPayloadType));
    *a5 = v21;
    *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v26 = v22;
    *(_OWORD *)&v26[16] = v22;
    v26[0] = 1;
    *(_QWORD *)&v26[8] = *a6;
    *(_DWORD *)&v26[16] = *a7;
    *(_DWORD *)&v26[20] = a4;
    v26[24] = -1;
    v27 = 0;
    v28 = 0;
    *(_QWORD *)&v26[32] = 0;
    PrimaryPayloadAndAppendSamples = VCAudioRedBuilder_GetPrimaryPayloadAndAppendSamples((uint64_t)self->_redBuilder, v26, v21);
    if (-[VCAudioRedBuilder numPayloads](self->_redBuilder, "numPayloads"))
    {
      v24 = -[VCAudioRedBuilder redPayloadForPrimaryPayload:](self->_redBuilder, "redPayloadForPrimaryPayload:", PrimaryPayloadAndAppendSamples);
      if (v24)
      {
        *a5 = v24->payloadType;
        *a6 = v24->buffer;
        bufferLength = v24->bufferLength;
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTextTransmitter updatePayloadHistory:timestamp:payloadType:payload:payloadLength:].cold.1();
        }
        bufferLength = 0;
        *a6 = 0;
      }
      *a7 = bufferLength;
    }
    if (objc_msgSend(a3, "length") != 1 || objc_msgSend(a3, "characterAtIndex:", 0) != 65279)
      VCAudioRedBuilder_UpdatePayloadHistory((uint64_t)self->_redBuilder);
  }
}

- (void)heartbeat
{
  id v3;
  double v4;

  -[NSLock lock](self->_textFramesSendQueueLock, "lock");
  if (-[NSMutableArray count](self->_textFramesSendQueue, "count"))
  {
    v3 = (id)-[NSMutableArray componentsJoinedByString:](self->_textFramesSendQueue, "componentsJoinedByString:", &stru_1E9E58EE0);
    -[NSMutableArray removeAllObjects](self->_textFramesSendQueue, "removeAllObjects");
    -[NSLock unlock](self->_textFramesSendQueueLock, "unlock");
    -[VCTextTransmitter sendTextFrameWithRedundancy:marker:](self, "sendTextFrameWithRedundancy:marker:", v3, self->_isIdle);

    self->_idleDuration = 0.0;
    self->_emptyFramesToBeSent = self->_config.numRedundantPayloads;
    self->_isIdle = 0;
  }
  else
  {
    -[NSLock unlock](self->_textFramesSendQueueLock, "unlock");
    v4 = self->_txIntervalMin + self->_idleDuration;
    self->_idleDuration = v4;
    if (v4 > 0.3)
    {
      self->_isIdle = 1;
      if (self->_emptyFramesToBeSent)
      {
        -[VCTextTransmitter sendTextFrameWithRedundancy:marker:](self, "sendTextFrameWithRedundancy:marker:", &stru_1E9E58EE0, 0);
        --self->_emptyFramesToBeSent;
      }
    }
  }
}

- (BOOL)startHeartbeat
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  double txIntervalMin;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  double v12;
  OS_dispatch_source *v13;
  OS_dispatch_source *v14;
  NSObject *heartbeat;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  double v28;
  __int16 v29;
  VCTextTransmitter *v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if ((VCTextTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        txIntervalMin = self->_txIntervalMin;
        *(_DWORD *)buf = 136315906;
        v22 = v4;
        v23 = 2080;
        v24 = "-[VCTextTransmitter startHeartbeat]";
        v25 = 1024;
        v26 = 192;
        v27 = 2048;
        v28 = txIntervalMin;
        v7 = "VCTextTransmitter [%s] %s:%d Starting sending heartbeat (interval=%f)";
        v8 = v5;
        v9 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCTextTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_txIntervalMin;
        *(_DWORD *)buf = 136316418;
        v22 = v10;
        v23 = 2080;
        v24 = "-[VCTextTransmitter startHeartbeat]";
        v25 = 1024;
        v26 = 192;
        v27 = 2112;
        v28 = *(double *)&v3;
        v29 = 2048;
        v30 = self;
        v31 = 2048;
        v32 = v12;
        v7 = "VCTextTransmitter [%s] %s:%d %@(%p) Starting sending heartbeat (interval=%f)";
        v8 = v11;
        v9 = 58;
        goto LABEL_11;
      }
    }
  }
  v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v14 = v13;
  self->_heartbeat = v13;
  if (v13)
  {
    dispatch_source_set_timer((dispatch_source_t)v13, 0, (unint64_t)(self->_txIntervalMin * 1000000000.0), 0xF4240uLL);
    heartbeat = self->_heartbeat;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __35__VCTextTransmitter_startHeartbeat__block_invoke;
    handler[3] = &unk_1E9E521C0;
    handler[4] = self;
    dispatch_source_set_event_handler(heartbeat, handler);
    dispatch_resume((dispatch_object_t)self->_heartbeat);
  }
  else if ((VCTextTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTextTransmitter startHeartbeat].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCTextTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v22 = v18;
        v23 = 2080;
        v24 = "-[VCTextTransmitter startHeartbeat]";
        v25 = 1024;
        v26 = 195;
        v27 = 2112;
        v28 = *(double *)&v17;
        v29 = 2048;
        v30 = self;
        _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, "VCTextTransmitter [%s] %s:%d %@(%p) Failed to create polling", buf, 0x30u);
      }
    }
  }
  return v14 != 0;
}

uint64_t __35__VCTextTransmitter_startHeartbeat__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "heartbeat");
}

- (void)stopHeartbeat
{
  NSObject *heartbeat;
  NSObject *v4;

  heartbeat = self->_heartbeat;
  if (heartbeat)
  {
    dispatch_source_cancel(heartbeat);
    v4 = self->_heartbeat;
    if (v4)
    {
      dispatch_release(v4);
      self->_heartbeat = 0;
    }
  }
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCTextTransmitter [%s] %s:%d Trying to send when the transmitter is stopped!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendTextFrameWithRedundancy:marker:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCTextTransmitter [%s] %s:%d Invalid payload!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendTextFrameWithRedundancy:marker:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCTextTransmitter [%s] %s:%d failed to send RTP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendTextFrameWithRedundancy:marker:.cold.3()
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
  v5 = "-[VCTextTransmitter sendTextFrameWithRedundancy:marker:]";
  v6 = 1024;
  v7 = 104;
  v8 = 2112;
  v9 = v1;
  _os_log_debug_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_DEBUG, "VCTextTransmitter [%s] %s:%d Sending text:%@", v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)updatePayloadHistory:timestamp:payloadType:payload:payloadLength:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCTextTransmitter [%s] %s:%d Invalid red payload!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startHeartbeat
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCTextTransmitter [%s] %s:%d Failed to create polling", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
