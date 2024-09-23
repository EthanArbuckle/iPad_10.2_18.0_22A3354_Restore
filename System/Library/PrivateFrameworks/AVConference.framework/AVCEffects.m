@implementation AVCEffects

- (AVCEffects)initWithDelegate:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  AVCEffects *v7;
  NSObject *CustomRootQueue;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t pid;
  uint64_t QueueXPCObject;
  void *v15;
  id v16;
  uint64_t v17;
  int ErrorLogLevelForModule;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v26 = v5;
      v27 = 2080;
      v28 = "-[AVCEffects initWithDelegate:]";
      v29 = 1024;
      v30 = 39;
      v31 = 2112;
      v32 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d inDelegate=%@", buf, 0x26u);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)AVCEffects;
  v7 = -[AVCEffects init](&v24, sel_init);
  if (!v7)
    goto LABEL_35;
  v7->_connection = objc_alloc_init(AVConferenceXPCClient);
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v7->_avConferenceEffectsQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.effects", 0, CustomRootQueue);
  objc_storeWeak(&v7->_delegate, a3);
  v9 = -[AVConferenceXPCClient sendMessageSync:](v7->_connection, "sendMessageSync:", "vcEffectsInitialize");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v26 = v10;
      v27 = 2080;
      v28 = "-[AVCEffects initWithDelegate:]";
      v29 = 1024;
      v30 = 51;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Results from initialization: %@", buf, 0x26u);
    }
  }
  if (objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ERROR")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCEffects initWithDelegate:].cold.6(v21, v9);
    }
    goto LABEL_35;
  }
  -[AVCEffects registerBlocksForNotifications](v7, "registerBlocksForNotifications");
  v12 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("USERXPCARGUMENTS"));
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCEffects initWithDelegate:].cold.1();
    }
    goto LABEL_35;
  }
  if (!-[AVCEffects setupRemoteReceiverQueueWithSenderQueue:](v7, "setupRemoteReceiverQueueWithSenderQueue:", v12))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCEffects initWithDelegate:].cold.5();
    }
    goto LABEL_35;
  }
  pid = xpc_connection_get_pid(-[AVConferenceXPCClient connection](v7->_connection, "connection"));
  if (!VCRemoteImageQueue_CreateSenderQueue(pid, &v7->_senderQueue))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCEffects initWithDelegate:].cold.4();
    }
    goto LABEL_35;
  }
  QueueXPCObject = VCRemoteImageQueue_CreateQueueXPCObject((uint64_t)v7->_senderQueue);
  if (!QueueXPCObject)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCEffects initWithDelegate:].cold.2();
    }
    goto LABEL_35;
  }
  v15 = (void *)QueueXPCObject;
  v16 = -[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:](v7->_connection, "sendMessageSync:arguments:xpcArguments:", "vcEffectsClientQueue", 0, QueueXPCObject);
  v17 = objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ERROR"));
  xpc_release(v15);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v17)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCEffects initWithDelegate:].cold.3(v22, v16);
    }
LABEL_35:

    return 0;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v26 = v19;
      v27 = 2080;
      v28 = "-[AVCEffects initWithDelegate:]";
      v29 = 1024;
      v30 = 78;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Successfully setup the remoteImageQueue", buf, 0x1Cu);
    }
  }
  return v7;
}

- (void)dealloc
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v14 = v5;
      v15 = 2080;
      v16 = "-[AVCEffects dealloc]";
      v17 = 1024;
      v18 = 91;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Begin", buf, 0x1Cu);
    }
  }
  -[AVCEffects deregisterBlocksForNotifications](self, "deregisterBlocksForNotifications");
  v7 = -[AVConferenceXPCClient sendMessageSync:](self->_connection, "sendMessageSync:", "vcEffectsTerminate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v14 = v8;
      v15 = 2080;
      v16 = "-[AVCEffects dealloc]";
      v17 = 1024;
      v18 = 94;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Results from termination: %@", buf, 0x26u);
    }
  }
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_senderQueue);
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_receiverQueue);

  objc_storeWeak(&self->_delegate, 0);
  v12.receiver = self;
  v12.super_class = (Class)AVCEffects;
  -[AVCEffects dealloc](&v12, sel_dealloc);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v14 = v10;
      v15 = 2080;
      v16 = "-[AVCEffects dealloc]";
      v17 = 1024;
      v18 = 103;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d End", buf, 0x1Cu);
    }
  }
}

- (void)setDelegate:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVCEffects setDelegate:]";
      v11 = 1024;
      v12 = 107;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d delegate=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  objc_storeWeak(&self->_delegate, a3);
}

- (AVCEffectsDelegate)delegate
{
  return (AVCEffectsDelegate *)objc_loadWeak(&self->_delegate);
}

- (BOOL)setupRemoteReceiverQueueWithSenderQueue:(id)a3
{
  uint64_t v5;
  _BOOL4 v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      -[AVCEffects setupRemoteReceiverQueueWithSenderQueue:].cold.1();
    }
LABEL_10:
    LOBYTE(v6) = 0;
    return v6;
  }
  v5 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__AVCEffects_setupRemoteReceiverQueueWithSenderQueue___block_invoke;
  v8[3] = &unk_1E9E53A60;
  v8[4] = v5;
  VCRemoteImageQueue_CreateReceiverQueue((uint64_t)a3, (uint64_t)v8, (uint64_t)self->_avConferenceEffectsQueue, &self->_receiverQueue);
  if (!self->_receiverQueue)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      -[AVCEffects setupRemoteReceiverQueueWithSenderQueue:].cold.2();
    }
    goto LABEL_10;
  }
  LOBYTE(v6) = 1;
  return v6;
}

void *__54__AVCEffects_setupRemoteReceiverQueueWithSenderQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (result)
    return (void *)objc_msgSend(result, "remoteQueueOperationHandlerWithError:operation:", a2, a3);
  return result;
}

- (void)remoteQueueOperationHandlerWithError:(int)a3 operation:(FigRemoteOperation *)a4
{
  __CVBuffer *v6;
  __CVBuffer *ImageBuffer;
  const void *Value;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  __CVBuffer *lastReceivedPixelBuffer;
  AVCVideoFrame *v13;
  __CVBuffer *v14;
  __CVBuffer *lastReceivedDepthBuffer;
  AVCVideoFrame *v16;
  __CVBuffer *v17;
  _BYTE v18[24];
  _BYTE buf[24];
  int v20;
  __int16 v21;
  __CVBuffer *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCEffects remoteQueueOperationHandlerWithError:operation:].cold.2();
    }
  }
  else if (a4->var0 == 1)
  {
    memset(v18, 170, sizeof(v18));
    FigCFDictionaryGetCMTimeIfPresent();
    Value = CFDictionaryGetValue(a4->var4.var0.var0, CFSTR("vcEffectsImageData"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v11 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          lastReceivedPixelBuffer = self->_lastReceivedPixelBuffer;
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v9;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[AVCEffects remoteQueueOperationHandlerWithError:operation:]";
          *(_WORD *)&buf[22] = 1024;
          v20 = 162;
          v21 = 2048;
          v22 = lastReceivedPixelBuffer;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _lastReceivedPixelBuffer=%p", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[AVCEffects remoteQueueOperationHandlerWithError:operation:].cold.1(v9, (uint64_t)self, v10);
      }
    }
    if (self->_lastReceivedPixelBuffer)
    {
      v13 = [AVCVideoFrame alloc];
      v14 = self->_lastReceivedPixelBuffer;
      lastReceivedDepthBuffer = self->_lastReceivedDepthBuffer;
      *(_OWORD *)buf = *(_OWORD *)v18;
      *(_QWORD *)&buf[16] = *(_QWORD *)&v18[16];
      v16 = -[AVCVideoFrame initWithPixelBuffer:depthPixelBuffer:time:imageData:delegate:](v13, "initWithPixelBuffer:depthPixelBuffer:time:imageData:delegate:", v14, lastReceivedDepthBuffer, buf, Value, 0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(self->_delegate, "didCaptureVideoFrame:", v16);

      v17 = self->_lastReceivedPixelBuffer;
    }
    else
    {
      v17 = 0;
    }
    CVPixelBufferRelease(v17);
    self->_lastReceivedPixelBuffer = 0;
    CVPixelBufferRelease(self->_lastReceivedDepthBuffer);
    self->_lastReceivedDepthBuffer = 0;
  }
  else if (a4->var0 == 3)
  {
    v6 = self->_lastReceivedPixelBuffer;
    ImageBuffer = CMSampleBufferGetImageBuffer(a4->var4.var0.var0);
    if (v6)
      self->_lastReceivedDepthBuffer = ImageBuffer;
    else
      self->_lastReceivedPixelBuffer = ImageBuffer;
    CVPixelBufferRetain(ImageBuffer);
  }
}

- (void)flushRemoteQueue
{
  VCRemoteImageQueue_ReleaseIOSurfaces((uint64_t)self->_senderQueue);
}

- (void)registerBlocksForNotifications
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__AVCEffects_registerBlocksForNotifications__block_invoke;
  v7[3] = &unk_1E9E52730;
  v7[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcEffectsServerDidDisconnect", v7, self->_avConferenceEffectsQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __44__AVCEffects_registerBlocksForNotifications__block_invoke_29;
  v6[3] = &unk_1E9E52730;
  v6[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcEffectsServerTimeOut", v6, self->_avConferenceEffectsQueue);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __44__AVCEffects_registerBlocksForNotifications__block_invoke_33;
  v5[3] = &unk_1E9E52730;
  v5[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcEffectsFlushRemoteQueue", v5, self->_avConferenceEffectsQueue);
}

uint64_t __44__AVCEffects_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  _BYTE v13[24];
  __int128 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (result)
    {
      v4 = (void *)result;
      objc_msgSend((id)result, "delegate");
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
      {
        if ((void *)objc_opt_class() == v4)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          *(_DWORD *)v13 = 136315650;
          *(_QWORD *)&v13[4] = v6;
          *(_WORD *)&v13[12] = 2080;
          *(_QWORD *)&v13[14] = "-[AVCEffects registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 194;
          v8 = " [%s] %s:%d received callback for serverDidDisconnect";
          v9 = v7;
          v10 = 28;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
          else
            v5 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          *(_DWORD *)v13 = 136316162;
          *(_QWORD *)&v13[4] = v11;
          *(_WORD *)&v13[12] = 2080;
          *(_QWORD *)&v13[14] = "-[AVCEffects registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 194;
          WORD2(v14) = 2112;
          *(_QWORD *)((char *)&v14 + 6) = v5;
          HIWORD(v14) = 2048;
          v15 = v4;
          v8 = " [%s] %s:%d %@(%p) received callback for serverDidDisconnect";
          v9 = v12;
          v10 = 48;
        }
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
        return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
      }
    }
  }
  return result;
}

uint64_t __44__AVCEffects_registerBlocksForNotifications__block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  _BYTE v13[24];
  __int128 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (result)
    {
      v4 = (void *)result;
      objc_msgSend((id)result, "delegate");
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
      {
        objc_msgSend(v4, "setMode:", 0);
        if ((void *)objc_opt_class() == v4)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidTimeout:", v4);
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidTimeout:", v4);
          *(_DWORD *)v13 = 136315650;
          *(_QWORD *)&v13[4] = v6;
          *(_WORD *)&v13[12] = 2080;
          *(_QWORD *)&v13[14] = "-[AVCEffects registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 209;
          v8 = " [%s] %s:%d received callback for serverDidTimeout";
          v9 = v7;
          v10 = 28;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
          else
            v5 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidTimeout:", v4);
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidTimeout:", v4);
          *(_DWORD *)v13 = 136316162;
          *(_QWORD *)&v13[4] = v11;
          *(_WORD *)&v13[12] = 2080;
          *(_QWORD *)&v13[14] = "-[AVCEffects registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 209;
          WORD2(v14) = 2112;
          *(_QWORD *)((char *)&v14 + 6) = v5;
          HIWORD(v14) = 2048;
          v15 = v4;
          v8 = " [%s] %s:%d %@(%p) received callback for serverDidTimeout";
          v9 = v12;
          v10 = 48;
        }
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
        return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidTimeout:", v4);
      }
    }
  }
  return result;
}

void *__44__AVCEffects_registerBlocksForNotifications__block_invoke_33(uint64_t a1, void *a2)
{
  void *result;

  result = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!result)
  {
    result = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (result)
      return (void *)objc_msgSend(result, "flushRemoteQueue");
  }
  return result;
}

- (void)deregisterBlocksForNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcEffectsServerDidDisconnect");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcEffectsServerTimeOut");
}

- (void)avcVideoFrameDidRelease:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("vcEffectsFrameTime");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  if (a3)
  {
    objc_msgSend(a3, "time");
    a3 = v5;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
  }
  v9[0] = objc_msgSend(v4, "numberWithLongLong:", a3, v5, v6, v7, v8);
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcEffectsClientReleasedVideoFrame", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
}

- (void)setMode:(int)a3
{
  uint64_t v3;
  int ErrorLogLevelForModule;
  os_log_t *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *avConferenceEffectsQueue;
  uint64_t v13;
  NSObject *v14;
  _QWORD block[6];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v3 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v6 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v17 = v7;
      v18 = 2080;
      v19 = "-[AVCEffects setMode:]";
      v20 = 1024;
      v21 = 246;
      v22 = 1024;
      v23 = v3;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d mode=%d", buf, 0x22u);
    }
  }
  self->_mode = v3;
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v10 = objc_alloc(MEMORY[0x1E0C99D80]);
  v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", v9, CFSTR("vcEffectsSetEffectsMode"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_effectType), CFSTR("vcEffectsEffectsType"), 0);
  avConferenceEffectsQueue = self->_avConferenceEffectsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__AVCEffects_setMode___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = v11;
  dispatch_async(avConferenceEffectsQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v17 = v13;
      v18 = 2080;
      v19 = "-[AVCEffects setMode:]";
      v20 = 1024;
      v21 = 271;
      v22 = 1024;
      v23 = v3;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting the effects mode %d", buf, 0x22u);
    }
  }
}

void __22__AVCEffects_setMode___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendMessageAsync:arguments:reply:", "vcEffectsSetMode", *(_QWORD *)(a1 + 40), 0);

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v2 + 32))
    VCRemoteImageQueue_ReleaseIOSurfaces(*(_QWORD *)(v2 + 56));
}

- (void)setEffectType:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  id v10;
  uint64_t v11;
  NSObject *avConferenceEffectsQueue;
  uint64_t v13;
  _QWORD block[6];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v16 = v5;
      v17 = 2080;
      v18 = "-[AVCEffects setEffectType:]";
      v19 = 1024;
      v20 = 277;
      v21 = 1024;
      v22 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d effectType=%d", buf, 0x22u);
    }
  }
  if (self->_effectType == (_DWORD)v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v16 = v7;
        v17 = 2080;
        v18 = "-[AVCEffects setEffectType:]";
        v19 = 1024;
        v20 = 279;
        v21 = 1024;
        v22 = v3;
        v9 = " [%s] %s:%d Effect type is already set to %d";
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0x22u);
      }
    }
  }
  else
  {
    self->_effectType = v3;
    if (self->_mode)
    {
      v10 = objc_alloc(MEMORY[0x1E0C99D80]);
      v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3), CFSTR("vcEffectsEffectsType"), 0);
      avConferenceEffectsQueue = self->_avConferenceEffectsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__AVCEffects_setEffectType___block_invoke;
      block[3] = &unk_1E9E52238;
      block[4] = self;
      block[5] = v11;
      dispatch_async(avConferenceEffectsQueue, block);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v16 = v13;
        v17 = 2080;
        v18 = "-[AVCEffects setEffectType:]";
        v19 = 1024;
        v20 = 299;
        v21 = 1024;
        v22 = v3;
        v9 = " [%s] %s:%d Setting the effect type to %d";
        goto LABEL_13;
      }
    }
  }
}

void __28__AVCEffects_setEffectType___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendMessageAsync:arguments:reply:", "vcEffectsSetEffectType", *(_QWORD *)(a1 + 40), 0);

}

- (BOOL)enqueueSampleBuffer:(__CVBuffer *)a3 time:(id *)a4
{
  CMSampleBufferRef SampleBufferWithPixelBuffer;
  CMSampleBufferRef v6;
  int v7;
  _BOOL4 v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = *a4;
  SampleBufferWithPixelBuffer = createSampleBufferWithPixelBuffer(a3, (__int128 *)&v10.var0);
  if (SampleBufferWithPixelBuffer)
  {
    v6 = SampleBufferWithPixelBuffer;
    v7 = VCRemoteImageQueue_EnqueueFrame((uint64_t)self->_senderQueue, (unint64_t)SampleBufferWithPixelBuffer);
    CFRelease(v6);
    if (!v7)
    {
      LOBYTE(v8) = 1;
      return v8;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v8)
        return v8;
      -[AVCEffects enqueueSampleBuffer:time:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v8)
      return v8;
    -[AVCEffects enqueueSampleBuffer:time:].cold.1();
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (void)encodeProcessedVideoFrame:(id)a3
{
  int ErrorLogLevelForModule;
  _BYTE *v6;
  NSObject **v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *avConferenceEffectsQueue;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[6];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v6 = (_BYTE *)MEMORY[0x1E0CF2748];
  v7 = (NSObject **)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 8)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *v7;
    v10 = *v7;
    if (*v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v22 = v8;
        v23 = 2080;
        v24 = "-[AVCEffects encodeProcessedVideoFrame:]";
        v25 = 1024;
        v26 = 319;
        v27 = 2112;
        v28 = a3;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoFrame=%@", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[AVCEffects encodeProcessedVideoFrame:].cold.1();
    }
  }
  kdebug_trace();
  v11 = a3;
  avConferenceEffectsQueue = self->_avConferenceEffectsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AVCEffects_encodeProcessedVideoFrame___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(avConferenceEffectsQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *v7;
    v15 = *v7;
    if (*v6)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
        {
          objc_msgSend(a3, "time");
          v16 = v19;
        }
        else
        {
          v16 = 0;
        }
        *(_DWORD *)buf = 136315906;
        v22 = v13;
        v23 = 2080;
        v24 = "-[AVCEffects encodeProcessedVideoFrame:]";
        v25 = 1024;
        v26 = 358;
        v27 = 2048;
        v28 = v16;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Encoding processed video frame %lld", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      if (a3)
      {
        objc_msgSend(a3, "time");
        v17 = v18;
      }
      else
      {
        v17 = 0;
      }
      *(_DWORD *)buf = 136315906;
      v22 = v13;
      v23 = 2080;
      v24 = "-[AVCEffects encodeProcessedVideoFrame:]";
      v25 = 1024;
      v26 = 358;
      v27 = 2048;
      v28 = v17;
      _os_log_debug_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Encoding processed video frame %lld", buf, 0x26u);
    }
  }
}

void __40__AVCEffects_encodeProcessedVideoFrame___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  CFMutableDictionaryRef Mutable;
  void *v6;
  float v7;
  float v8;
  float v9;
  CFDataRef v10;
  uint64_t v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "pixelBuffer");
  v4 = *(void **)(a1 + 40);
  if (v4)
    objc_msgSend(v4, "time");
  else
    memset(v12, 0, 24);
  if ((objc_msgSend(v2, "enqueueSampleBuffer:time:", v3, v12) & 1) != 0)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v6 = *(void **)(a1 + 40);
    if (v6)
      objc_msgSend(v6, "time");
    FigCFDictionarySetCMTime();
    objc_msgSend(*(id *)(a1 + 40), "renderProcessTime");
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 40), "renderProcessTime");
    if (v8 <= 0.0)
    {
      if (v9 < 0.0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __40__AVCEffects_encodeProcessedVideoFrame___block_invoke_cold_1();
      }
    }
    else
    {
      FigCFDictionarySetFloat();
    }
    if (objc_msgSend(*(id *)(a1 + 40), "imageData"))
    {
      v10 = CFDataCreate(0, (const UInt8 *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageData"), "bytes"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageData"), "length"));
      FigCFDictionarySetValue();
      VCRemoteImageQueue_EnqueueAttributes(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), (unint64_t)Mutable);
      CFRelease(v10);
    }
    else
    {
      VCRemoteImageQueue_EnqueueAttributes(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), (unint64_t)Mutable);
    }
    CFRelease(Mutable);

    v11 = *(_QWORD *)(a1 + 32);
    if (!*(_DWORD *)(v11 + 32))
      VCRemoteImageQueue_ReleaseIOSurfaces(*(_QWORD *)(v11 + 56));
  }
  else
  {

  }
}

- (int)mode
{
  return self->_mode;
}

- (int)effectType
{
  return self->_effectType;
}

- (void)initWithDelegate:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Received nil remote queue from server", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create sender queue xpc object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ERROR"));
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, " [%s] %s:%d Error initializing client send queue. Deallocing. error=%@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithDelegate:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d RemoteImageQueue could not be made on effects client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not set up the remoteReceiverQueue on the client side.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:(uint64_t)a1 .cold.6(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ERROR"));
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, " [%s] %s:%d Error initializing Effects. Deallocing. error=%@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupRemoteReceiverQueueWithSenderQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d xpcSenderQueue was null, cannot make the remote queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupRemoteReceiverQueueWithSenderQueue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error making the receiver queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)remoteQueueOperationHandlerWithError:(NSObject *)a3 operation:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[22];
  __int128 v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[AVCEffects remoteQueueOperationHandlerWithError:operation:]";
  LODWORD(v4) = 162;
  WORD2(v4) = 2048;
  *(_QWORD *)((char *)&v4 + 6) = *(_QWORD *)(a2 + 64);
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, a2, a3, " [%s] %s:%d _lastReceivedPixelBuffer=%p", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[AVCEffects remoteQueueOperationHandlerWithError:operation:]" >> 16, (const void *)v4);
  OUTLINED_FUNCTION_3();
}

- (void)remoteQueueOperationHandlerWithError:operation:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCEffects remoteQueueOperationHandlerWithError:operation:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error received from the remote Queue %d", v2, *(const char **)v3, (unint64_t)"-[AVCEffects remoteQueueOperationHandlerWithError:operation:]" >> 16, 143);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueSampleBuffer:time:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create sample buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueSampleBuffer:time:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCEffects enqueueSampleBuffer:time:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to enqueue video frame with error=%d", v2, *(const char **)v3, (unint64_t)"-[AVCEffects enqueueSampleBuffer:time:]" >> 16, 311);
  OUTLINED_FUNCTION_3();
}

- (void)encodeProcessedVideoFrame:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d videoFrame=%@");
  OUTLINED_FUNCTION_3();
}

void __40__AVCEffects_encodeProcessedVideoFrame___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Frame Render time is negative", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
