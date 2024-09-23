@implementation VCVirtualTextDevice

- (BOOL)setStreamConfig:(id)a3 withError:(id *)a4
{
  return 1;
}

- (VCVirtualTextDevice)initWithSendDelegate:(id)a3 clientPid:(int)a4 delegate:(id)a5 delegateFunctions:(const tagVCMediaStreamDelegateRealtimeInstanceVTable *)a6 delegateQueue:(id)a7
{
  VCVirtualTextDevice *v12;
  VCVirtualTextDevice *v13;
  void *updateFrequencyLevel;
  NSObject *CustomRootQueue;
  dispatch_queue_t v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  objc_super v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  VCVirtualTextDevice *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)VCVirtualTextDevice;
  v12 = -[VCVirtualTextDevice init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_clientPid = a4;
    objc_storeWeak(&v12->_sendDelegate, a3);
    objc_storeWeak(&v13->_mediaStreamDelegate, a5);
    updateFrequencyLevel = a6->updateFrequencyLevel;
    v13->_mediaStreamDelegateQueue = (OS_dispatch_queue *)a7;
    v13->_mediaStreamDelegateFunctions.updateFrequencyLevel = updateFrequencyLevel;
    dispatch_retain((dispatch_object_t)a7);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v16 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVirtualTextDevice.queue", 0, CustomRootQueue);
    v13->_state = 0;
    v13->_queue = (OS_dispatch_queue *)v16;
  }
  if ((VCVirtualTextDevice *)objc_opt_class() == v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v28 = v18;
        v29 = 2080;
        v30 = "-[VCVirtualTextDevice initWithSendDelegate:clientPid:delegate:delegateFunctions:delegateQueue:]";
        v31 = 1024;
        v32 = 51;
        v20 = " [%s] %s:%d ";
        v21 = v19;
        v22 = 28;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCVirtualTextDevice performSelector:](v13, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v28 = v23;
        v29 = 2080;
        v30 = "-[VCVirtualTextDevice initWithSendDelegate:clientPid:delegate:delegateFunctions:delegateQueue:]";
        v31 = 1024;
        v32 = 51;
        v33 = 2112;
        v34 = v17;
        v35 = 2048;
        v36 = v13;
        v20 = " [%s] %s:%d %@(%p) ";
        v21 = v24;
        v22 = 48;
        goto LABEL_13;
      }
    }
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_sendDelegate, 0);
  objc_storeWeak(&self->_mediaStreamDelegate, 0);
  dispatch_release((dispatch_object_t)self->_mediaStreamDelegateQueue);
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)VCVirtualTextDevice;
  -[VCVirtualTextDevice dealloc](&v3, sel_dealloc);
}

- (VCMediaStreamDelegate)mediaStreamDelegate
{
  return (VCMediaStreamDelegate *)objc_loadWeak(&self->_mediaStreamDelegate);
}

- (OS_dispatch_queue)mediaStreamDelegateQueue
{
  return self->_mediaStreamDelegateQueue;
}

- (void)setMediaStreamDelegate:(id)a3
{
  objc_storeWeak(&self->_mediaStreamDelegate, a3);
}

- (void)setMediaStreamDelegateQueue:(id)a3
{
  NSObject *mediaStreamDelegateQueue;

  mediaStreamDelegateQueue = self->_mediaStreamDelegateQueue;
  if (mediaStreamDelegateQueue)
  {
    dispatch_release(mediaStreamDelegateQueue);
    self->_mediaStreamDelegateQueue = 0;
  }
  if (a3)
  {
    self->_mediaStreamDelegateQueue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
  }
}

- (id)sendDelegate
{
  return objc_loadWeak(&self->_sendDelegate);
}

- (id)start
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *queue;
  void *v12;
  _QWORD v14[6];
  _BYTE buf[24];
  __int128 v16;
  VCVirtualTextDevice *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((VCVirtualTextDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v4;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCVirtualTextDevice start]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v16) = 93;
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
      v3 = (const __CFString *)-[VCVirtualTextDevice performSelector:](self, "performSelector:", sel_logPrefix);
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
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCVirtualTextDevice start]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v16) = 93;
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
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  *(_QWORD *)&v16 = __Block_byref_object_copy__27;
  *((_QWORD *)&v16 + 1) = __Block_byref_object_dispose__27;
  v17 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __28__VCVirtualTextDevice_start__block_invoke;
  v14[3] = &unk_1E9E522B0;
  v14[4] = self;
  v14[5] = buf;
  dispatch_sync(queue, v14);
  v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);
  return v12;
}

uint64_t __28__VCVirtualTextDevice_start__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = result;
    result = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32026, v2, CFSTR("Invalid state"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 40) = result;
  }
  else
  {
    *(_QWORD *)(v1 + 16) = 2;
  }
  return result;
}

- (id)stop
{
  return -[VCVirtualTextDevice stopWithError:](self, "stopWithError:", 0);
}

- (id)stopWithError:(id)a3
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCVirtualTextDevice *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((VCVirtualTextDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v16 = v5;
        v17 = 2080;
        v18 = "-[VCVirtualTextDevice stopWithError:]";
        v19 = 1024;
        v20 = 111;
        v7 = " [%s] %s:%d ";
        v8 = v6;
        v9 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCVirtualTextDevice performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v16 = v10;
        v17 = 2080;
        v18 = "-[VCVirtualTextDevice stopWithError:]";
        v19 = 1024;
        v20 = 111;
        v21 = 2112;
        v22 = v4;
        v23 = 2048;
        v24 = self;
        v7 = " [%s] %s:%d %@(%p) ";
        v8 = v11;
        v9 = 48;
        goto LABEL_11;
      }
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__VCVirtualTextDevice_stopWithError___block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_sync(queue, block);
  return 0;
}

uint64_t __37__VCVirtualTextDevice_stopWithError___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = 0;
  return result;
}

- (id)pause
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *queue;
  void *v12;
  _QWORD v14[6];
  _BYTE buf[24];
  __int128 v16;
  VCVirtualTextDevice *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((VCVirtualTextDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v4;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCVirtualTextDevice pause]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v16) = 119;
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
      v3 = (const __CFString *)-[VCVirtualTextDevice performSelector:](self, "performSelector:", sel_logPrefix);
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
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCVirtualTextDevice pause]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v16) = 119;
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
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  *(_QWORD *)&v16 = __Block_byref_object_copy__27;
  *((_QWORD *)&v16 + 1) = __Block_byref_object_dispose__27;
  v17 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __28__VCVirtualTextDevice_pause__block_invoke;
  v14[3] = &unk_1E9E522B0;
  v14[4] = self;
  v14[5] = buf;
  dispatch_sync(queue, v14);
  v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);
  return v12;
}

uint64_t __28__VCVirtualTextDevice_pause__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2 == 2)
  {
    *(_QWORD *)(v1 + 16) = 1;
  }
  else
  {
    v3 = result;
    result = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32026, v2, CFSTR("Invalid state"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 40) = result;
  }
  return result;
}

- (id)resume
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *queue;
  void *v12;
  _QWORD v14[6];
  _BYTE buf[24];
  __int128 v16;
  VCVirtualTextDevice *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((VCVirtualTextDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v4;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCVirtualTextDevice resume]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v16) = 132;
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
      v3 = (const __CFString *)-[VCVirtualTextDevice performSelector:](self, "performSelector:", sel_logPrefix);
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
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCVirtualTextDevice resume]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v16) = 132;
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
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  *(_QWORD *)&v16 = __Block_byref_object_copy__27;
  *((_QWORD *)&v16 + 1) = __Block_byref_object_dispose__27;
  v17 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __29__VCVirtualTextDevice_resume__block_invoke;
  v14[3] = &unk_1E9E522B0;
  v14[4] = self;
  v14[5] = buf;
  dispatch_sync(queue, v14);
  v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);
  return v12;
}

uint64_t __29__VCVirtualTextDevice_resume__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2 == 1)
  {
    *(_QWORD *)(v1 + 16) = 2;
  }
  else
  {
    v3 = result;
    result = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32026, v2, CFSTR("Invalid state"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 40) = result;
  }
  return result;
}

- (id)setPause:(BOOL)a3
{
  if (a3)
    return -[VCVirtualTextDevice pause](self, "pause");
  else
    return -[VCVirtualTextDevice resume](self, "resume");
}

- (void)sendCharacter:(unsigned __int16)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *queue;
  _QWORD v16[5];
  unsigned __int16 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCVirtualTextDevice *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((VCVirtualTextDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v19 = v6;
          v20 = 2080;
          v21 = "-[VCVirtualTextDevice sendCharacter:]";
          v22 = 1024;
          v23 = 156;
          v9 = " [%s] %s:%d ";
          v10 = v7;
          v11 = 28;
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCVirtualTextDevice sendCharacter:].cold.1();
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCVirtualTextDevice performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v19 = v12;
          v20 = 2080;
          v21 = "-[VCVirtualTextDevice sendCharacter:]";
          v22 = 1024;
          v23 = 156;
          v24 = 2112;
          v25 = v5;
          v26 = 2048;
          v27 = self;
          v9 = " [%s] %s:%d %@(%p) ";
          v10 = v13;
          v11 = 48;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316162;
        v19 = v12;
        v20 = 2080;
        v21 = "-[VCVirtualTextDevice sendCharacter:]";
        v22 = 1024;
        v23 = 156;
        v24 = 2112;
        v25 = v5;
        v26 = 2048;
        v27 = self;
        _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) ", buf, 0x30u);
      }
    }
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __37__VCVirtualTextDevice_sendCharacter___block_invoke;
  v16[3] = &unk_1E9E52A50;
  v16[4] = self;
  v17 = a3;
  dispatch_async(queue, v16);
}

_QWORD *__37__VCVirtualTextDevice_sendCharacter___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[2] == 2)
    return (_QWORD *)objc_msgSend((id)objc_msgSend(result, "sendDelegate"), "sendCharacter:", *(unsigned __int16 *)(a1 + 40));
  return result;
}

- (void)sendText:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *queue;
  _QWORD v16[6];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  VCVirtualTextDevice *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((VCVirtualTextDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v18 = v6;
          v19 = 2080;
          v20 = "-[VCVirtualTextDevice sendText:]";
          v21 = 1024;
          v22 = 167;
          v9 = " [%s] %s:%d ";
          v10 = v7;
          v11 = 28;
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCVirtualTextDevice sendText:].cold.1();
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCVirtualTextDevice performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v18 = v12;
          v19 = 2080;
          v20 = "-[VCVirtualTextDevice sendText:]";
          v21 = 1024;
          v22 = 167;
          v23 = 2112;
          v24 = v5;
          v25 = 2048;
          v26 = self;
          v9 = " [%s] %s:%d %@(%p) ";
          v10 = v13;
          v11 = 48;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316162;
        v18 = v12;
        v19 = 2080;
        v20 = "-[VCVirtualTextDevice sendText:]";
        v21 = 1024;
        v22 = 167;
        v23 = 2112;
        v24 = v5;
        v25 = 2048;
        v26 = self;
        _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) ", buf, 0x30u);
      }
    }
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __32__VCVirtualTextDevice_sendText___block_invoke;
  v16[3] = &unk_1E9E52238;
  v16[4] = self;
  v16[5] = a3;
  dispatch_async(queue, v16);
}

_QWORD *__32__VCVirtualTextDevice_sendText___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[2] == 2)
    return (_QWORD *)objc_msgSend((id)objc_msgSend(result, "sendDelegate"), "sendText:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)didReceiveText:(id)a3
{
  NSObject *mediaStreamDelegateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  mediaStreamDelegateQueue = self->_mediaStreamDelegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__VCVirtualTextDevice_didReceiveText___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(mediaStreamDelegateQueue, block);
}

uint64_t __38__VCVirtualTextDevice_didReceiveText___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "mediaStreamDelegate"), "vcMediaStream:didReceiveText:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (tagVCMediaStreamDelegateRealtimeInstanceVTable)mediaStreamDelegateFunctions
{
  return self->_mediaStreamDelegateFunctions;
}

- (void)setMediaStreamDelegateFunctions:(tagVCMediaStreamDelegateRealtimeInstanceVTable)a3
{
  self->_mediaStreamDelegateFunctions = a3;
}

- (void)sendCharacter:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, 2u);
}

- (void)sendText:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, 2u);
}

@end
