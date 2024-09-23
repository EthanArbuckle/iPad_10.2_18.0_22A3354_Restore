@implementation VCAudioPowerSpectrumMeter

- (VCAudioPowerSpectrumMeter)initWithBinCount:(unsigned __int16)a3 refreshRate:(double)a4 delegate:(id)a5
{
  VCAudioPowerSpectrumMeter *v8;
  VCAudioPowerSpectrumMeter *v9;
  __CFDictionary *v10;
  uint64_t v12;
  NSObject *v13;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCAudioPowerSpectrumMeter;
  v8 = -[VCObject init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_audioSpectrumBinCount = a3;
    objc_storeWeak((id *)&v8->_realtimeContext.powerSpectrumMeterDelegate, a5);
    v10 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9->_realtimeContext.var0 = v9;
    v9->_realtimeContext.audioSpectrumRefreshRate = a4;
    v9->_realtimeContext.nextDeliveryTime = NAN;
    v9->_realtimeContext.nextHeatlhPrintTime = NAN;
    v9->_realtimeContext.outputPowerSpectrums = v10;
    atomic_store(0, (unsigned __int8 *)&v9->_realtimeContext.isProcessingOutput);
    VCSingleLinkedListInitialize((uint64_t)&v9->_realtimeContext, (uint64_t)_VCAudioPowerSpectrumMeter_CompareListEntries);
    CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 5, &v9->_realtimeContext.eventQueue);
    if (!v9->_realtimeContext.eventQueue)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioPowerSpectrumMeter initWithBinCount:refreshRate:delegate:].cold.1(v12, v13);
      }

      return 0;
    }
  }
  return v9;
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
  opaqueCMSimpleQueue *eventQueue;
  __CFDictionary *outputPowerSpectrums;
  objc_super v13;
  _BYTE buf[12];
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCAudioPowerSpectrumMeter *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((VCAudioPowerSpectrumMeter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v4;
        v15 = 2080;
        v16 = "-[VCAudioPowerSpectrumMeter dealloc]";
        v17 = 1024;
        v18 = 55;
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
      v3 = (const __CFString *)-[VCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v9;
        v15 = 2080;
        v16 = "-[VCAudioPowerSpectrumMeter dealloc]";
        v17 = 1024;
        v18 = 55;
        v19 = 2112;
        v20 = v3;
        v21 = 2048;
        v22 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  objc_storeWeak((id *)&self->_realtimeContext.powerSpectrumMeterDelegate, 0);
  _VCAudioPowerSpectrumMeter_ProcessEventQueue((uint64_t)&self->_realtimeContext, 0);
  eventQueue = self->_realtimeContext.eventQueue;
  if (eventQueue)
    CFRelease(eventQueue);
  while (1)
  {
    *(_QWORD *)buf = VCSingleLinkedListPop((uint64_t *)&self->_realtimeContext);
    if (!*(_QWORD *)buf)
      break;
    _VCAudioPowerSpectrumMeter_FreeStream((_QWORD **)buf);
  }
  outputPowerSpectrums = self->_realtimeContext.outputPowerSpectrums;
  if (outputPowerSpectrums)
    CFRelease(outputPowerSpectrums);
  v13.receiver = self;
  v13.super_class = (Class)VCAudioPowerSpectrumMeter;
  -[VCObject dealloc](&v13, sel_dealloc);
}

- (void)registerNewAudioPowerSpectrumForStreamToken:(id)a3 powerSpectrumKey:(id)a4 spectrumSource:(id)a5
{
  uint64_t v9;
  NSObject *v10;
  _QWORD *v11;
  VCAudioPowerSpectrum *v12;
  OSStatus v13;
  OSStatus v14;
  uint64_t v15;
  NSObject *v16;
  opaqueCMSimpleQueue *eventQueue;
  _QWORD *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  opaqueCMSimpleQueue *v32;
  __int16 v33;
  OSStatus v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v20 = v9;
      v21 = 2080;
      v22 = "-[VCAudioPowerSpectrumMeter registerNewAudioPowerSpectrumForStreamToken:powerSpectrumKey:spectrumSource:]";
      v23 = 1024;
      v24 = 71;
      v25 = 2112;
      v26 = a3;
      v27 = 2112;
      v28 = a5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%@, powerSpectrumSource=%@", buf, 0x30u);
    }
  }
  v11 = malloc_type_calloc(1uLL, 0x50uLL, 0x10E004070F165FEuLL);
  v18 = v11;
  *((_DWORD *)v11 + 19) = 1;
  v11[1] = a3;
  v11[2] = a4;
  v11[5] = a5;
  v11[3] = objc_msgSend(a5, "realtimeContext");
  v11[4] = VCAudioPowerSpectrumSource_ProcessAudioSamples;
  v12 = -[VCAudioPowerSpectrum initWithBinCount:streamToken:sinkContext:sinkCallback:]([VCAudioPowerSpectrum alloc], "initWithBinCount:streamToken:sinkContext:sinkCallback:", self->_audioSpectrumBinCount, objc_msgSend(a3, "longValue"), &self->_realtimeContext, VCAudioPowerSpectrumMeter_ProcessOutput);
  v11[7] = v12;
  v11[6] = -[VCAudioPowerSpectrum realtimeContext](v12, "realtimeContext");
  v11[8] = objc_alloc_init(AVCAudioPowerSpectrum);
  v13 = CMSimpleQueueEnqueue(self->_realtimeContext.eventQueue, v11);
  if (v13)
  {
    v14 = v13;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        eventQueue = self->_realtimeContext.eventQueue;
        *(_DWORD *)buf = 136316930;
        v20 = v15;
        v21 = 2080;
        v22 = "-[VCAudioPowerSpectrumMeter registerNewAudioPowerSpectrumForStreamToken:powerSpectrumKey:spectrumSource:]";
        v23 = 1024;
        v24 = 87;
        v25 = 2048;
        v26 = v11;
        v27 = 2112;
        v28 = a3;
        v29 = 2112;
        v30 = a5;
        v31 = 2048;
        v32 = eventQueue;
        v33 = 1024;
        v34 = v14;
        _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to enqueue stream=%p streamToken=%@ powerSpectrumSource=%@ queue=%p status=%d", buf, 0x4Au);
      }
    }
    _VCAudioPowerSpectrumMeter_FreeStream(&v18);
  }
  VCAudioPowerSpectrumSource_RegisterAudioPowerSpectrumSink((CMSimpleQueueRef *)objc_msgSend(a5, "realtimeContext"), &self->_realtimeContext, self, self, VCAudioPowerSpectrumMeter_ProcessOutput);
}

- (void)releaseAudioPowerSpectrumForStreamToken:(id)a3
{
  _QWORD *v5;
  _VCAudioPowerSpectrumMeterRealtimeContext *p_realtimeContext;
  OSStatus v7;
  OSStatus v8;
  uint64_t v9;
  NSObject *v10;
  opaqueCMSimpleQueue *eventQueue;
  _QWORD *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _QWORD *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  opaqueCMSimpleQueue *v24;
  __int16 v25;
  OSStatus v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = malloc_type_calloc(1uLL, 0x50uLL, 0x10E004070F165FEuLL);
  v12 = v5;
  *((_DWORD *)v5 + 19) = 2;
  v5[1] = a3;
  p_realtimeContext = &self->_realtimeContext;
  v7 = CMSimpleQueueEnqueue(self->_realtimeContext.eventQueue, v5);
  if (v7)
  {
    v8 = v7;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        eventQueue = p_realtimeContext->eventQueue;
        *(_DWORD *)buf = 136316674;
        v14 = v9;
        v15 = 2080;
        v16 = "-[VCAudioPowerSpectrumMeter releaseAudioPowerSpectrumForStreamToken:]";
        v17 = 1024;
        v18 = 103;
        v19 = 2048;
        v20 = v5;
        v21 = 2112;
        v22 = a3;
        v23 = 2048;
        v24 = eventQueue;
        v25 = 1024;
        v26 = v8;
        _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to enqueue stream=%p streamToken=%@ queue=%p status=%d", buf, 0x40u);
      }
    }
    _VCAudioPowerSpectrumMeter_FreeStream(&v12);
  }
}

- (void)unregisterAllStreams
{
  _QWORD *v3;
  _VCAudioPowerSpectrumMeterRealtimeContext *p_realtimeContext;
  OSStatus v5;
  OSStatus v6;
  uint64_t v7;
  NSObject *v8;
  opaqueCMSimpleQueue *eventQueue;
  _QWORD *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _QWORD *v18;
  __int16 v19;
  opaqueCMSimpleQueue *v20;
  __int16 v21;
  OSStatus v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = malloc_type_calloc(1uLL, 0x50uLL, 0x10E004070F165FEuLL);
  v10 = v3;
  *((_DWORD *)v3 + 19) = 3;
  p_realtimeContext = &self->_realtimeContext;
  v5 = CMSimpleQueueEnqueue(self->_realtimeContext.eventQueue, v3);
  if (v5)
  {
    v6 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        eventQueue = p_realtimeContext->eventQueue;
        *(_DWORD *)buf = 136316418;
        v12 = v7;
        v13 = 2080;
        v14 = "-[VCAudioPowerSpectrumMeter unregisterAllStreams]";
        v15 = 1024;
        v16 = 115;
        v17 = 2048;
        v18 = v3;
        v19 = 2048;
        v20 = eventQueue;
        v21 = 1024;
        v22 = v6;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to enqueue stream=%p queue=%p status=%d", buf, 0x36u);
      }
    }
    _VCAudioPowerSpectrumMeter_FreeStream(&v10);
  }
}

- (void)realtimeContext
{
  return &self->_realtimeContext;
}

- (void)cleanUpEventQueue
{
  _VCAudioPowerSpectrumMeter_ProcessEventQueue((uint64_t)&self->_realtimeContext, 1);
}

- (void)initWithBinCount:(uint64_t)a1 refreshRate:(NSObject *)a2 delegate:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCAudioPowerSpectrumMeter initWithBinCount:refreshRate:delegate:]";
  v6 = 1024;
  v7 = 46;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create _streamTokenEventQueue", (uint8_t *)&v2, 0x1Cu);
}

@end
