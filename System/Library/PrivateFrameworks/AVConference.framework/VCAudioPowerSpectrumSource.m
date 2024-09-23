@implementation VCAudioPowerSpectrumSource

- (VCAudioPowerSpectrumSource)initWithStreamToken:(int64_t)a3 delegate:(id)a4
{
  VCAudioPowerSpectrumSource *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)VCAudioPowerSpectrumSource;
  v6 = -[VCObject init](&v16, sel_init);
  if (v6)
  {
    if ((VCAudioPowerSpectrumSource *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136316162;
      v18 = v8;
      v19 = 2080;
      v20 = "-[VCAudioPowerSpectrumSource initWithStreamToken:delegate:]";
      v21 = 1024;
      v22 = 35;
      v23 = 2048;
      v24 = a3;
      v25 = 2048;
      v26 = a4;
      v10 = " [%s] %s:%d streamToken=%ld delegate=%p";
      v11 = v9;
      v12 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCAudioPowerSpectrumSource performSelector:](v6, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136316674;
      v18 = v13;
      v19 = 2080;
      v20 = "-[VCAudioPowerSpectrumSource initWithStreamToken:delegate:]";
      v21 = 1024;
      v22 = 35;
      v23 = 2112;
      v24 = (int64_t)v7;
      v25 = 2048;
      v26 = v6;
      v27 = 2048;
      v28 = a3;
      v29 = 2048;
      v30 = a4;
      v10 = " [%s] %s:%d %@(%p) streamToken=%ld delegate=%p";
      v11 = v14;
      v12 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_13:
    v6->_streamToken = a3;
    objc_storeWeak(&v6->_realtimeContext.powerSpectrumSourceDelegate, a4);
    VCSingleLinkedListInitialize((uint64_t)&v6->_realtimeContext, (uint64_t)_VCAudioPowerSpectrumSource_CompareListEntries);
    CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 32, &v6->_realtimeContext.eventQueue);
  }
  return v6;
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  int64_t streamToken;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  int64_t v12;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int64_t v21;
  __int16 v22;
  VCAudioPowerSpectrumSource *v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((VCAudioPowerSpectrumSource *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        streamToken = self->_streamToken;
        *(_DWORD *)buf = 136315906;
        v15 = v4;
        v16 = 2080;
        v17 = "-[VCAudioPowerSpectrumSource dealloc]";
        v18 = 1024;
        v19 = 45;
        v20 = 2048;
        v21 = streamToken;
        v7 = " [%s] %s:%d streamToken=%ld";
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
      v3 = (const __CFString *)-[VCAudioPowerSpectrumSource performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_streamToken;
        *(_DWORD *)buf = 136316418;
        v15 = v10;
        v16 = 2080;
        v17 = "-[VCAudioPowerSpectrumSource dealloc]";
        v18 = 1024;
        v19 = 45;
        v20 = 2112;
        v21 = (int64_t)v3;
        v22 = 2048;
        v23 = self;
        v24 = 2048;
        v25 = v12;
        v7 = " [%s] %s:%d %@(%p) streamToken=%ld";
        v8 = v11;
        v9 = 58;
        goto LABEL_11;
      }
    }
  }
  -[VCAudioPowerSpectrumSource cleanupAudioPowerSpectrumSinks](self, "cleanupAudioPowerSpectrumSinks");
  -[VCAudioPowerSpectrumSource cleanupQueue:](self, "cleanupQueue:", &self->_realtimeContext.eventQueue);
  objc_storeWeak(&self->_realtimeContext.powerSpectrumSourceDelegate, 0);
  v13.receiver = self;
  v13.super_class = (Class)VCAudioPowerSpectrumSource;
  -[VCObject dealloc](&v13, sel_dealloc);
}

- (void)invalidate
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  int64_t streamToken;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  int64_t v12;
  _BYTE v13[24];
  __int128 v14;
  VCAudioPowerSpectrumSource *v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((VCAudioPowerSpectrumSource *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        streamToken = self->_streamToken;
        *(_DWORD *)v13 = 136315906;
        *(_QWORD *)&v13[4] = v4;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[VCAudioPowerSpectrumSource invalidate]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 53;
        WORD2(v14) = 2048;
        *(_QWORD *)((char *)&v14 + 6) = streamToken;
        v7 = " [%s] %s:%d streamToken=%ld";
        v8 = v5;
        v9 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v13, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCAudioPowerSpectrumSource performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_streamToken;
        *(_DWORD *)v13 = 136316418;
        *(_QWORD *)&v13[4] = v10;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[VCAudioPowerSpectrumSource invalidate]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 53;
        WORD2(v14) = 2112;
        *(_QWORD *)((char *)&v14 + 6) = v3;
        HIWORD(v14) = 2048;
        v15 = self;
        LOWORD(v16) = 2048;
        *(_QWORD *)((char *)&v16 + 2) = v12;
        v7 = " [%s] %s:%d %@(%p) streamToken=%ld";
        v8 = v11;
        v9 = 58;
        goto LABEL_11;
      }
    }
  }
  -[VCAudioPowerSpectrumSource cleanupAudioPowerSpectrumSinks](self, "cleanupAudioPowerSpectrumSinks", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15, v16);
  -[VCAudioPowerSpectrumSource cleanupQueue:](self, "cleanupQueue:", &self->_realtimeContext.eventQueue);
  objc_storeWeak(&self->_realtimeContext.powerSpectrumSourceDelegate, 0);
}

- (void)cleanupQueue:(opaqueCMSimpleQueue *)a3
{
  opaqueCMSimpleQueue *v4;
  id *v5[2];

  v5[1] = *(id **)MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = *a3;
    if (*a3)
    {
      while (1)
      {
        v5[0] = (id *)CMSimpleQueueDequeue(v4);
        if (!v5[0])
          break;
        VCAudioPowerSpectrumSource_FreeClient(v5);
        v4 = *a3;
      }
      if (*a3)
        CFRelease(*a3);
      *a3 = 0;
    }
  }
}

- (void)cleanupAudioPowerSpectrumSinks
{
  uint64_t *p_realtimeContext;
  void *v3;
  id *i;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  p_realtimeContext = (uint64_t *)&self->_realtimeContext;
  for (i = (id *)VCSingleLinkedListPop((uint64_t *)&self->_realtimeContext);
        i;
        i = (id *)VCSingleLinkedListPop(p_realtimeContext))
  {
    VCAudioPowerSpectrumSource_FreeClient(&i);
    v3 = (void *)MEMORY[0x1DF086F1C](p_realtimeContext + 5);
    objc_msgSend(v3, "audioPowerSpectrumSinkDidUnregister", i, v5);
    if (v3)
      CFRelease(v3);
  }
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  VCAudioPowerSpectrumSource_ProcessAudioSamples((uint64_t)&self->_realtimeContext, (uint64_t)a3);
}

- (_VCAudioPowerSpectrumSourceRealtimeContext)realtimeContext
{
  return &self->_realtimeContext;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

@end
