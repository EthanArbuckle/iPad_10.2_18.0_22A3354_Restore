@implementation VCStreamOutput

- (VCStreamOutput)initWithStreamToken:(int64_t)a3 clientProcessID:(int)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  VCStreamOutput *v10;
  VCStreamOutput *v11;
  pid_t v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 isClientInProcess;
  const char *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  objc_super v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)VCStreamOutput;
  v10 = -[VCObject init](&v30, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_35;
  v10->_streamToken = a3;
  v10->_clientProcessID = a4;
  v12 = getpid();
  v11->_isClientInProcess = v12 == a4;
  if (v12 == a4)
  {
    if (a5 && a6)
    {
      v11->_delegateQueue = (OS_dispatch_queue *)a6;
      dispatch_retain((dispatch_object_t)a6);
      v11->_delegate = a5;
      goto LABEL_8;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v25 = VRTraceErrorLogLevelToCSTR(),
          v26 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_35:

      return 0;
    }
    *(_DWORD *)buf = 136316162;
    v32 = v25;
    v33 = 2080;
    v34 = "-[VCStreamOutput initWithStreamToken:clientProcessID:delegate:delegateQueue:]";
    v35 = 1024;
    v36 = 56;
    v37 = 2048;
    v38 = a5;
    v39 = 2048;
    v40 = a6;
    v27 = " [%s] %s:%d Incorrect input for clientInProcess: Client delegate=%p, delegateQueue=%p";
LABEL_31:
    _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0x30u);
    goto LABEL_35;
  }
  if ((unint64_t)a5 | (unint64_t)a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_35;
    v28 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    *(_DWORD *)buf = 136316162;
    v32 = v28;
    v33 = 2080;
    v34 = "-[VCStreamOutput initWithStreamToken:clientProcessID:delegate:delegateQueue:]";
    v35 = 1024;
    v36 = 62;
    v37 = 2048;
    v38 = a5;
    v39 = 2048;
    v40 = a6;
    v27 = " [%s] %s:%d Incorrect input for clientOutOfProcess, delegate=%p, delegateQueue=%p";
    goto LABEL_31;
  }
  v11->_useFigRemoteQueue = 1;
  if (!-[VCStreamOutput createRemoteQueue](v11, "createRemoteQueue"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamOutput initWithStreamToken:clientProcessID:delegate:delegateQueue:].cold.1();
    }
    goto LABEL_35;
  }
LABEL_8:
  if ((VCStreamOutput *)objc_opt_class() == v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        isClientInProcess = v11->_isClientInProcess;
        *(_DWORD *)buf = 136315906;
        v32 = v14;
        if (isClientInProcess)
          v17 = "in";
        else
          v17 = "out of";
        v33 = 2080;
        v34 = "-[VCStreamOutput initWithStreamToken:clientProcessID:delegate:delegateQueue:]";
        v35 = 1024;
        v36 = 76;
        v37 = 2080;
        v38 = (id)v17;
        v18 = " [%s] %s:%d Will run %s process";
        v19 = v15;
        v20 = 38;
        goto LABEL_24;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCStreamOutput performSelector:](v11, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = v11->_isClientInProcess;
        *(_DWORD *)buf = 136316418;
        v32 = v21;
        if (v23)
          v24 = "in";
        else
          v24 = "out of";
        v33 = 2080;
        v34 = "-[VCStreamOutput initWithStreamToken:clientProcessID:delegate:delegateQueue:]";
        v35 = 1024;
        v36 = 76;
        v37 = 2112;
        v38 = (id)v13;
        v39 = 2048;
        v40 = v11;
        v41 = 2080;
        v42 = v24;
        v18 = " [%s] %s:%d %@(%p) Will run %s process";
        v19 = v22;
        v20 = 58;
LABEL_24:
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
  }
  return v11;
}

- (void)invalidate
{
  NSObject *delegateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__VCStreamOutput_invalidate__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_sync(delegateQueue, v3);
}

uint64_t __28__VCStreamOutput_invalidate__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 208) = 0;
  return result;
}

- (void)dealloc
{
  NSObject *delegateQueue;
  __CFDictionary *attributes;
  __CFAllocator *backingBufferAllocator;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_remoteQueue);

  attributes = self->_attributes;
  if (attributes)
    CFRelease(attributes);
  backingBufferAllocator = self->_backingBufferAllocator;
  if (backingBufferAllocator)
    CFRelease(backingBufferAllocator);
  v6.receiver = self;
  v6.super_class = (Class)VCStreamOutput;
  -[VCObject dealloc](&v6, sel_dealloc);
}

- (BOOL)createRemoteQueue
{
  __CFAllocator *v3;
  __CFAllocator *backingBufferAllocator;

  if (self->_useFigRemoteQueue
    && VCRemoteImageQueue_CreateSenderQueue(self->_clientProcessID, &self->_remoteQueue))
  {
    v3 = (__CFAllocator *)VCRemoteImageQueue_SharedMemoryPoolAllocator(self->_remoteQueue);
    self->_backingBufferAllocator = v3;
    if (v3)
    {
      CFRetain(v3);
      LOBYTE(backingBufferAllocator) = 1;
      return (char)backingBufferAllocator;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamOutput createRemoteQueue].cold.1();
    }
  }
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_remoteQueue);
  backingBufferAllocator = self->_backingBufferAllocator;
  if (backingBufferAllocator)
  {
    CFRelease(backingBufferAllocator);
    LOBYTE(backingBufferAllocator) = 0;
  }
  return (char)backingBufferAllocator;
}

- (id)copyXpcSenderQueue
{
  if (self->_useFigRemoteQueue)
    return (id)VCRemoteImageQueue_CreateQueueXPCObject((uint64_t)self->_remoteQueue);
  else
    return 0;
}

void __VCStreamOutput_EnqueueSampleBuffer_block_invoke(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "didReceiveSampleBuffer:", *(_QWORD *)(a1 + 40));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

- (BOOL)initXPCCommandQueue
{
  NSObject *CustomRootQueue;
  OS_dispatch_queue *v4;

  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v4 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCStreamOutput.xpcCommandQueue", 0, CustomRootQueue);
  self->_xpcCommandQueue = v4;
  if (!v4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCStreamOutput initXPCCommandQueue].cold.1();
  }
  return v4 != 0;
}

- (void)didPause:(BOOL)a3
{
  _QWORD block[5];
  BOOL v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__VCStreamOutput_didPause___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v4 = a3;
  if (self->_isClientInProcess)
  {
    dispatch_async((dispatch_queue_t)self->_delegateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCStreamOutput didPause:].cold.1();
  }
}

uint64_t __27__VCStreamOutput_didPause___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "didPause:", *(unsigned __int8 *)(a1 + 40));
}

- (void)didDegrade:(BOOL)a3
{
  _QWORD block[5];
  BOOL v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__VCStreamOutput_didDegrade___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v4 = a3;
  if (self->_isClientInProcess)
  {
    dispatch_async((dispatch_queue_t)self->_delegateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCStreamOutput didPause:].cold.1();
  }
}

uint64_t __29__VCStreamOutput_didDegrade___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "didDegrade:", *(unsigned __int8 *)(a1 + 40));
}

- (void)didInvalidate
{
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __31__VCStreamOutput_didInvalidate__block_invoke;
  v2[3] = &unk_1E9E521C0;
  v2[4] = self;
  if (self->_isClientInProcess)
  {
    dispatch_async((dispatch_queue_t)self->_delegateQueue, v2);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCStreamOutput didPause:].cold.1();
  }
}

uint64_t __31__VCStreamOutput_didInvalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "didInvalidate");
}

- (void)didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__VCStreamOutput_didReceiveSampleBuffer___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  if (self->_isClientInProcess)
  {
    dispatch_async((dispatch_queue_t)self->_delegateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCStreamOutput didPause:].cold.1();
  }
}

uint64_t __41__VCStreamOutput_didReceiveSampleBuffer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "didReceiveSampleBuffer:", *(_QWORD *)(a1 + 40));
}

- (void)didStall:(BOOL)a3
{
  _QWORD block[5];
  BOOL v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__VCStreamOutput_didStall___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v4 = a3;
  if (self->_isClientInProcess)
  {
    dispatch_async((dispatch_queue_t)self->_delegateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCStreamOutput didPause:].cold.1();
  }
}

uint64_t __27__VCStreamOutput_didStall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "didStall:", *(unsigned __int8 *)(a1 + 40));
}

- (void)didSuspend:(BOOL)a3
{
  _QWORD block[5];
  BOOL v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__VCStreamOutput_didSuspend___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v4 = a3;
  if (self->_isClientInProcess)
  {
    dispatch_async((dispatch_queue_t)self->_delegateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCStreamOutput didPause:].cold.1();
  }
}

uint64_t __29__VCStreamOutput_didSuspend___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "didSuspend:", *(unsigned __int8 *)(a1 + 40));
}

- (void)didUpdateAttachments:(__CFDictionary *)a3
{
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VCStreamOutput_didUpdateAttachments___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  if (self->_isClientInProcess)
  {
    dispatch_async((dispatch_queue_t)self->_delegateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCStreamOutput didPause:].cold.1();
  }
}

uint64_t __39__VCStreamOutput_didUpdateAttachments___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "didUpdateAttachments:", *(_QWORD *)(a1 + 40));
}

- (int)processID
{
  return self->_clientProcessID;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (BOOL)isClientInProcess
{
  return self->_isClientInProcess;
}

- (__CFAllocator)backingBufferAllocator
{
  return self->_backingBufferAllocator;
}

void ___VCStreamOutput_SendSampleBufferToXPCClient_block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:xpcArguments:context:", "streamOutputDidReceiveFrame", v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)initWithStreamToken:clientProcessID:delegate:delegateQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createRemoteQueue
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not get the shared pool allocator for the remoteQueue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initXPCCommandQueue
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create xpcCommandQueue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)didPause:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Client run out of process, should not do delegate callback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
