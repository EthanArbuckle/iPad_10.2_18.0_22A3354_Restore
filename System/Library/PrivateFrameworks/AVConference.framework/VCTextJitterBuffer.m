@implementation VCTextJitterBuffer

- (VCTextJitterBuffer)initWithConfiguration:(tagVCTextJitterBufferConfiguration *)a3
{
  VCTextJitterBuffer *v4;
  VCTextJitterBuffer *v5;
  JitterPreloadQueue_t *v6;
  uint64_t *v7;
  uint64_t v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCTextJitterBuffer;
  v4 = -[VCTextJitterBuffer init](&v11, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTextJitterBuffer initWithConfiguration:].cold.1();
    }
    goto LABEL_18;
  }
  v4->_configuration = *a3;
  objc_storeWeak(&v4->_delegate, a3->delegate);
  v6 = (JitterPreloadQueue_t *)JitterPreloadQueue_Create();
  v5->_preloadQueue = v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTextJitterBuffer initWithConfiguration:].cold.2();
    }
    goto LABEL_18;
  }
  JitterQueue_Create();
  v5->_jitterQueue = (JitterQueue_t *)v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTextJitterBuffer initWithConfiguration:].cold.3();
    }
LABEL_18:

    return 0;
  }
  JitterQueue_SetMaxPacketTimeDelta(v7, a3->sampleRate, 1.79769313e308);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v13 = v8;
      v14 = 2080;
      v15 = "-[VCTextJitterBuffer initWithConfiguration:]";
      v16 = 1024;
      v17 = 41;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Jitter Buffer Created Successfully", buf, 0x1Cu);
    }
  }
  return v5;
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
  uint64_t *jitterQueue;
  char *preloadQueue;
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
  VCTextJitterBuffer *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((VCTextJitterBuffer *)objc_opt_class() == self)
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
        v17 = "-[VCTextJitterBuffer dealloc]";
        v18 = 1024;
        v19 = 53;
        v6 = " [%s] %s:%d Cleaning up JitterBuffer";
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
      v3 = (const __CFString *)-[VCTextJitterBuffer performSelector:](self, "performSelector:", sel_logPrefix);
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
        v17 = "-[VCTextJitterBuffer dealloc]";
        v18 = 1024;
        v19 = 53;
        v20 = 2112;
        v21 = v3;
        v22 = 2048;
        v23 = self;
        v6 = " [%s] %s:%d %@(%p) Cleaning up JitterBuffer";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  objc_storeWeak(&self->_delegate, 0);
  jitterQueue = (uint64_t *)self->_jitterQueue;
  if (jitterQueue)
    JitterQueue_Destroy(jitterQueue);
  preloadQueue = (char *)self->_preloadQueue;
  if (preloadQueue)
    JitterPreloadQueue_Destroy(preloadQueue);
  v13.receiver = self;
  v13.super_class = (Class)VCTextJitterBuffer;
  -[VCTextJitterBuffer dealloc](&v13, sel_dealloc);
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (tagAudioPacket)allocTextPacket
{
  return (tagAudioPacket *)JitterPreloadQueue_AudioPacketAlloc((uint64_t)self->_preloadQueue);
}

- (void)releaseTextPacket:(tagAudioPacket *)a3
{
  uint64_t v5;

  if (a3->var16 >= 1)
  {
    v5 = 0;
    do
      JitterPreloadQueue_AudioFrameFree((uint64_t)self->_preloadQueue, a3->var15[v5++]);
    while (v5 < a3->var16);
  }
  JitterPreloadQueue_AudioPacketFree((uint64_t)self->_preloadQueue, a3);
}

- (tagAudioFrame)allocTextFrame
{
  return (tagAudioFrame *)JitterPreloadQueue_AudioFrameAlloc((uint64_t)self->_preloadQueue);
}

- (void)releaseTextFrame:(tagAudioFrame *)a3
{
  JitterPreloadQueue_AudioFrameFree((uint64_t)self->_preloadQueue, a3);
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
  _BYTE v12[24];
  __int128 v13;
  VCTextJitterBuffer *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((VCTextJitterBuffer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v12 = 136315650;
        *(_QWORD *)&v12[4] = v4;
        *(_WORD *)&v12[12] = 2080;
        *(_QWORD *)&v12[14] = "-[VCTextJitterBuffer start]";
        *(_WORD *)&v12[22] = 1024;
        LODWORD(v13) = 94;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v12, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCTextJitterBuffer performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v12 = 136316162;
        *(_QWORD *)&v12[4] = v9;
        *(_WORD *)&v12[12] = 2080;
        *(_QWORD *)&v12[14] = "-[VCTextJitterBuffer start]";
        *(_WORD *)&v12[22] = 1024;
        LODWORD(v13) = 94;
        WORD2(v13) = 2112;
        *(_QWORD *)((char *)&v13 + 6) = v3;
        HIWORD(v13) = 2048;
        v14 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  self->_resetRequested = 1;
  return -[VCTextJitterBuffer startHeartbeat](self, "startHeartbeat", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14);
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
  VCTextJitterBuffer *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((VCTextJitterBuffer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136315650;
        *(_QWORD *)&v11[4] = v4;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCTextJitterBuffer stop]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 100;
        v6 = " [%s] %s:%d ";
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
      v3 = (const __CFString *)-[VCTextJitterBuffer performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136316162;
        *(_QWORD *)&v11[4] = v9;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCTextJitterBuffer stop]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 100;
        WORD2(v12) = 2112;
        *(_QWORD *)((char *)&v12 + 6) = v3;
        HIWORD(v12) = 2048;
        v13 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  -[VCTextJitterBuffer stopHeartbeat](self, "stopHeartbeat", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12, v13);
}

- (void)enqueuePacket:(tagAudioPacket *)a3
{
  JitterPreloadQueue_Enqueue((void ***)self->_preloadQueue, (void **)a3);
}

- (void)jitterQueuePushPacket:(tagAudioPacket *)a3
{
  uint64_t v5;
  tagAudioFrame **var15;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  if (a3->var16 >= 1)
  {
    v5 = 0;
    var15 = a3->var15;
    do
      JitterQueue_Insert((uint64_t)self->_jitterQueue, (unint64_t)var15[v5++], &v7);
    while (v5 < a3->var16);
  }
}

- (BOOL)startHeartbeat
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *global_queue;
  OS_dispatch_source *v12;
  OS_dispatch_source *v13;
  NSObject *heartbeat;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  VCTextJitterBuffer *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((VCTextJitterBuffer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v21 = v4;
        v22 = 2080;
        v23 = "-[VCTextJitterBuffer startHeartbeat]";
        v24 = 1024;
        v25 = 117;
        v26 = 2048;
        v27 = 0x3FA0E5604189374CLL;
        v6 = " [%s] %s:%d Starting heartbeat (interval=%f)";
        v7 = v5;
        v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCTextJitterBuffer performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v21 = v9;
        v22 = 2080;
        v23 = "-[VCTextJitterBuffer startHeartbeat]";
        v24 = 1024;
        v25 = 117;
        v26 = 2112;
        v27 = (uint64_t)v3;
        v28 = 2048;
        v29 = self;
        v30 = 2048;
        v31 = 0x3FA0E5604189374CLL;
        v6 = " [%s] %s:%d %@(%p) Starting heartbeat (interval=%f)";
        v7 = v10;
        v8 = 58;
        goto LABEL_11;
      }
    }
  }
  self->_firstFrameReceived = 0;
  global_queue = dispatch_get_global_queue(2, 0);
  v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, global_queue);
  v13 = v12;
  self->_heartbeat = v12;
  if (v12)
  {
    dispatch_source_set_timer((dispatch_source_t)v12, 0, 0x1F78A40uLL, 0xF4240uLL);
    heartbeat = self->_heartbeat;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __36__VCTextJitterBuffer_startHeartbeat__block_invoke;
    handler[3] = &unk_1E9E521C0;
    handler[4] = self;
    dispatch_source_set_event_handler(heartbeat, handler);
    dispatch_resume((dispatch_object_t)self->_heartbeat);
  }
  else if ((VCTextJitterBuffer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTextJitterBuffer startHeartbeat].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCTextJitterBuffer performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v21 = v17;
        v22 = 2080;
        v23 = "-[VCTextJitterBuffer startHeartbeat]";
        v24 = 1024;
        v25 = 121;
        v26 = 2112;
        v27 = (uint64_t)v16;
        v28 = 2048;
        v29 = self;
        _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create polling", buf, 0x30u);
      }
    }
  }
  return v13 != 0;
}

uint64_t __36__VCTextJitterBuffer_startHeartbeat__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "heartbeat");
}

- (void)stopHeartbeat
{
  NSObject *heartbeat;

  dispatch_source_cancel((dispatch_source_t)self->_heartbeat);
  heartbeat = self->_heartbeat;
  if (heartbeat)
  {
    dispatch_release(heartbeat);
    self->_heartbeat = 0;
  }
}

- (void)heartbeat
{
  int *v3;
  unsigned __int16 *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  int v22;
  int v23;
  NSObject *v24;
  const char *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  NSObject *v36;
  const char *v37;
  uint32_t v38;
  int v39;
  int v40;
  int v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  _BYTE v50[10];
  VCTextJitterBuffer *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = JitterPreloadQueue_Dequeue((int *)self->_preloadQueue);
  v4 = (unsigned __int16 *)v3;
  if (v3 && v3[1] || self->_resetRequested)
  {
    if ((VCTextJitterBuffer *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_15;
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136315650;
      v44 = v6;
      v45 = 2080;
      v46 = "-[VCTextJitterBuffer heartbeat]";
      v47 = 1024;
      v48 = 141;
      v8 = " [%s] %s:%d Reset the queue";
      v9 = v7;
      v10 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCTextJitterBuffer performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_15;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136316162;
      v44 = v11;
      v45 = 2080;
      v46 = "-[VCTextJitterBuffer heartbeat]";
      v47 = 1024;
      v48 = 141;
      v49 = 2112;
      *(_QWORD *)v50 = v5;
      *(_WORD *)&v50[8] = 2048;
      v51 = self;
      v8 = " [%s] %s:%d %@(%p) Reset the queue";
      v9 = v12;
      v10 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_15:
    JitterQueue_Reset((uint64_t *)self->_jitterQueue);
    self->_resetRequested = 0;
  }
  if (v4)
  {
    if (self->_firstFrameReceived
      && ((v13 = v4[7] - LOWORD(self->_lastSequenceNumber)) == 0 || (unsigned __int16)v13 >= 0x7FFFu))
    {
      -[VCTextJitterBuffer releaseTextPacket:](self, "releaseTextPacket:", v4);
    }
    else
    {
      -[VCTextJitterBuffer jitterQueuePushPacket:](self, "jitterQueuePushPacket:", v4);
      JitterPreloadQueue_AudioPacketFree((uint64_t)self->_preloadQueue, v4);
    }
  }
  v14 = JitterQueue_Pop((uint64_t)self->_jitterQueue);
  if (v14)
  {
    v16 = v14;
    *(_QWORD *)&v15 = 136316418;
    v42 = v15;
    while (self->_firstFrameReceived
         && (unsigned __int16)(*(_WORD *)(v16 + 10) - LOWORD(self->_lastSequenceNumber)) != 1)
    {
      if (micro() - *(double *)(v16 + 1184) < 1.0)
      {
        JitterQueue_Insert((uint64_t)self->_jitterQueue, v16, 0);
        return;
      }
      objc_msgSend(-[VCTextJitterBuffer delegate](self, "delegate"), "didDetectMissingFrame");
      ++self->_lastSequenceNumber;
      JitterQueue_Insert((uint64_t)self->_jitterQueue, v16, 0);
LABEL_44:
      v16 = JitterQueue_Pop((uint64_t)self->_jitterQueue);
      if (!v16)
        return;
    }
    if ((VCTextJitterBuffer *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_43;
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      v29 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = *(unsigned __int16 *)(v16 + 10);
          v31 = *(_DWORD *)(v16 + 1144);
          v32 = *(unsigned __int8 *)(v16 + 8);
          *(_DWORD *)buf = v42;
          v44 = v27;
          v45 = 2080;
          v46 = "-[VCTextJitterBuffer heartbeat]";
          v47 = 1024;
          v48 = 171;
          v49 = 1024;
          *(_DWORD *)v50 = v30;
          *(_WORD *)&v50[4] = 1024;
          *(_DWORD *)&v50[6] = v31;
          LOWORD(v51) = 1024;
          *(_DWORD *)((char *)&v51 + 2) = v32;
          v24 = v28;
          v25 = " [%s] %s:%d Frame received seqNumber:%d length:%d isRed:%d";
          v26 = 46;
          goto LABEL_39;
        }
LABEL_43:
        objc_msgSend(-[VCTextJitterBuffer delegate](self, "delegate", v42), "didReceiveFrame:", v16);
        self->_lastSequenceNumber = *(unsigned __int16 *)(v16 + 10);
        self->_firstFrameReceived = 1;
        -[VCTextJitterBuffer releaseTextFrame:](self, "releaseTextFrame:", v16);
        goto LABEL_44;
      }
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        goto LABEL_43;
      v39 = *(unsigned __int16 *)(v16 + 10);
      v40 = *(_DWORD *)(v16 + 1144);
      v41 = *(unsigned __int8 *)(v16 + 8);
      *(_DWORD *)buf = v42;
      v44 = v27;
      v45 = 2080;
      v46 = "-[VCTextJitterBuffer heartbeat]";
      v47 = 1024;
      v48 = 171;
      v49 = 1024;
      *(_DWORD *)v50 = v39;
      *(_WORD *)&v50[4] = 1024;
      *(_DWORD *)&v50[6] = v40;
      LOWORD(v51) = 1024;
      *(_DWORD *)((char *)&v51 + 2) = v41;
      v36 = v28;
      v37 = " [%s] %s:%d Frame received seqNumber:%d length:%d isRed:%d";
      v38 = 46;
    }
    else
    {
      v17 = &stru_1E9E58EE0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)-[VCTextJitterBuffer performSelector:](self, "performSelector:", sel_logPrefix);
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_43;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      v20 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(unsigned __int16 *)(v16 + 10);
          v22 = *(_DWORD *)(v16 + 1144);
          v23 = *(unsigned __int8 *)(v16 + 8);
          *(_DWORD *)buf = 136316930;
          v44 = v18;
          v45 = 2080;
          v46 = "-[VCTextJitterBuffer heartbeat]";
          v47 = 1024;
          v48 = 171;
          v49 = 2112;
          *(_QWORD *)v50 = v17;
          *(_WORD *)&v50[8] = 2048;
          v51 = self;
          v52 = 1024;
          v53 = v21;
          v54 = 1024;
          v55 = v22;
          v56 = 1024;
          v57 = v23;
          v24 = v19;
          v25 = " [%s] %s:%d %@(%p) Frame received seqNumber:%d length:%d isRed:%d";
          v26 = 66;
LABEL_39:
          _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
          goto LABEL_43;
        }
        goto LABEL_43;
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        goto LABEL_43;
      v33 = *(unsigned __int16 *)(v16 + 10);
      v34 = *(_DWORD *)(v16 + 1144);
      v35 = *(unsigned __int8 *)(v16 + 8);
      *(_DWORD *)buf = 136316930;
      v44 = v18;
      v45 = 2080;
      v46 = "-[VCTextJitterBuffer heartbeat]";
      v47 = 1024;
      v48 = 171;
      v49 = 2112;
      *(_QWORD *)v50 = v17;
      *(_WORD *)&v50[8] = 2048;
      v51 = self;
      v52 = 1024;
      v53 = v33;
      v54 = 1024;
      v55 = v34;
      v56 = 1024;
      v57 = v35;
      v36 = v19;
      v37 = " [%s] %s:%d %@(%p) Frame received seqNumber:%d length:%d isRed:%d";
      v38 = 66;
    }
    _os_log_debug_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEBUG, v37, buf, v38);
    goto LABEL_43;
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
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid Config (nil)", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create pre-load queue", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create jitter queue", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create polling", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
