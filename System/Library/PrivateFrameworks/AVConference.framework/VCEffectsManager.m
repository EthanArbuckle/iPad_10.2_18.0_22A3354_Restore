@implementation VCEffectsManager

CFIndex __VCEffectsManager_IsEffectsOn_block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  CFIndex result;
  CFIndex v4;
  const void *ValueAtIndex;

  v2 = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 32);
  result = CFArrayGetCount(v2);
  if (result >= 1)
  {
    v4 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v2, v4);
      result = VCEffects_EffectsMode((uint64_t)ValueAtIndex);
      if ((_DWORD)result)
        break;
      ++v4;
      result = CFArrayGetCount(v2);
      if (v4 >= result)
        return result;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

+ (id)sharedManager
{
  if (VCEffectsManager_SharedManager_onceToken != -1)
    dispatch_once(&VCEffectsManager_SharedManager_onceToken, &__block_literal_global_104);
  return (id)VCEffectsManager_SharedManager__vcEffectsManager;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (BOOL)isFaceMeshTrackingEnabled
{
  NSObject *xpcCommandQueue;
  char v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VCEffectsManager_isFaceMeshTrackingEnabled__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(xpcCommandQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__VCEffectsManager_isFaceMeshTrackingEnabled__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "effectsArray");
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        result = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "faceMeshTrackingEnabled");
        if ((_DWORD)result)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          return result;
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (NSMutableArray)effectsArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (VCEffectsManager)init
{
  VCEffectsManager *v2;
  NSObject *CustomRootQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCEffectsManager;
  v2 = -[VCEffectsManager init](&v5, sel_init);
  if (v2)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCEffectsManager.xpc.commands", 0, CustomRootQueue);
    v2->_effectsArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_lastEffectsType = 0;
    pthread_mutex_init(&v2->_loggingLock, 0);
    -[VCEffectsManager resetEffectsLogging](v2, "resetEffectsLogging");
    -[VCEffectsManager createAllocators](v2, "createAllocators");
    v2->_consecutiveDroppedFrameCount = 0;
    v2->_forceDisableEffectsHealthCheck = -[VCDefaults forceDisableEffectsHealthCheck](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableEffectsHealthCheck");
    v2->_lastReceivedPixelBuffer = 0;
    v2->_thermalPressureLevel = 0;
  }
  return v2;
}

- (void)dealloc
{
  __CVBuffer *lastReceivedPixelBuffer;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_senderQueue);
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_receiverQueue);
  lastReceivedPixelBuffer = self->_lastReceivedPixelBuffer;
  if (lastReceivedPixelBuffer)
    CVPixelBufferRelease(lastReceivedPixelBuffer);
  -[VCEffectsManager releaseAllocators](self, "releaseAllocators");

  -[VCEffectsManager setReportingAgent:](self, "setReportingAgent:", 0);
  pthread_mutex_destroy(&self->_loggingLock);
  objc_storeWeak(&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)VCEffectsManager;
  -[VCEffectsManager dealloc](&v4, sel_dealloc);
}

- (BOOL)initializeReceiveQueue:(id)a3 error:(id *)a4
{
  uint64_t v7;
  BOOL ReceiverQueue;
  BOOL v9;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__VCEffectsManager_initializeReceiveQueue_error___block_invoke;
  v11[3] = &unk_1E9E53A60;
  v11[4] = v7;
  ReceiverQueue = VCRemoteImageQueue_CreateReceiverQueue((uint64_t)a3, (uint64_t)v11, (uint64_t)self->_xpcCommandQueue, &self->_receiverQueue);
  v9 = ReceiverQueue;
  if (a4 && !ReceiverQueue)
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCEffectsManager"), -2143682558, 0);
  return v9;
}

void *__49__VCEffectsManager_initializeReceiveQueue_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (result)
    return (void *)objc_msgSend(result, "remoteQueueOperationHandlerWithError:operation:", a2, a3);
  return result;
}

- (BOOL)createAllocators
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  _OWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12[0] = xmmword_1D9110990;
  v12[1] = unk_1D91109A0;
  v2 = VCAllocatorMultiQueue_Create((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (uint64_t)"EffectsManagerBufferAllocator", 4u, (unint64_t *)v12, &self->_bufferAllocator);
  if (v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315650;
        v7 = v3;
        v8 = 2080;
        v9 = "-[VCEffectsManager createAllocators]";
        v10 = 1024;
        v11 = 128;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to create stream input allocator", (uint8_t *)&v6, 0x1Cu);
      }
    }
  }
  return v2 == 0;
}

- (void)releaseAllocators
{
  __CFAllocator *bufferAllocator;

  bufferAllocator = self->_bufferAllocator;
  if (bufferAllocator)
    CFRelease(bufferAllocator);
}

- (void)setLastEffectsType:(int)a3
{
  -[VCEffectsManager setLastEffectsType:shouldReport:](self, "setLastEffectsType:shouldReport:", *(_QWORD *)&a3, 0);
}

- (void)setLastEffectsType:(int)a3 shouldReport:(BOOL)a4
{
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (self->_lastEffectsType != a3)
  {
    self->_lastEffectsType = a3;
    goto LABEL_5;
  }
  if (a4)
  {
LABEL_5:
    v5 = CFSTR("VCEMEffectsType");
    v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    -[VCEffectsManager reportingAgent](self, "reportingAgent");
    reportingGenericEvent();
  }
}

- (VCEffectsManagerDelegate)delegate
{
  return (VCEffectsManagerDelegate *)objc_loadWeak(&self->_delegate);
}

void __VCEffectsManager_SharedManager_block_invoke()
{
  if (!VCEffectsManager_SharedManager__vcEffectsManager)
    VCEffectsManager_SharedManager__vcEffectsManager = objc_alloc_init(VCEffectsManager);
}

- (void)registerBlocksForService
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[5];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__VCEffectsManager_registerBlocksForService__block_invoke;
  v9[3] = &unk_1E9E544F0;
  v9[4] = v3;
  v9[5] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcEffectsInitialize", v9, self->_xpcCommandQueue);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __44__VCEffectsManager_registerBlocksForService__block_invoke_28;
  v8[3] = &unk_1E9E53848;
  v8[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcEffectsClientQueue", v8, self->_xpcCommandQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __44__VCEffectsManager_registerBlocksForService__block_invoke_30;
  v7[3] = &unk_1E9E544F0;
  v7[4] = v3;
  v7[5] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcEffectsTerminate", v7, self->_xpcCommandQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __44__VCEffectsManager_registerBlocksForService__block_invoke_33;
  v6[3] = &unk_1E9E544F0;
  v6[4] = v3;
  v6[5] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcEffectsSetMode", v6, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", v4, 3221225472, __44__VCEffectsManager_registerBlocksForService__block_invoke_2, &unk_1E9E544F0, v3, self), "registerBlockForService:block:queue:", "vcEffectsSetEffectType", &v5, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:eventLogLevel:", "vcEffectsClientReleasedVideoFrame", &__block_literal_global_40, self->_xpcCommandQueue, 8);
}

uint64_t __44__VCEffectsManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  VCEffects *v7;
  void *v8;
  uint64_t v9;
  void *QueueXPCObject;
  uint64_t v11;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        v6 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v20 = v4;
            v21 = 2080;
            v22 = "-[VCEffectsManager registerBlocksForService]_block_invoke";
            v23 = 1024;
            v24 = 199;
            _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client has died. Cleaning up VCEffectsMananger by removing associated objects", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          __44__VCEffectsManager_registerBlocksForService__block_invoke_cold_3();
        }
      }
      v13 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
      v14 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
      if (objc_msgSend((id)objc_msgSend(v14, "effectsArray"), "containsObject:", v13))
        objc_msgSend((id)objc_msgSend(v14, "effectsArray"), "removeObject:", v13);
      if (objc_msgSend((id)objc_msgSend(v14, "effectsArray"), "count"))
      {
        v15 = (void *)objc_msgSend((id)objc_msgSend(v14, "effectsArray"), "firstObject");
        v16 = *(void **)(a1 + 40);
        v17 = objc_msgSend(v15, "effectsType");
        v18 = v16;
      }
      else
      {
        objc_msgSend((id)objc_msgSend(v14, "delegate"), "setFaceMeshTrackingEnabled:", 0);
        objc_msgSend((id)objc_msgSend(v14, "delegate"), "setEffectsApplied:", 0);
        objc_msgSend(v14, "tearDownRemoteQueues");
        v18 = *(void **)(a1 + 40);
        v17 = 0;
      }
      objc_msgSend(v18, "setLastEffectsType:", v17);
    }
  }
  else
  {
    v7 = objc_alloc_init(VCEffects);
    -[VCEffects setEffectsMode:](v7, "setEffectsMode:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setLastEffectsType:shouldReport:", 0, 1);
    v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID"));
    if (v8)
    {
      VCRemoteImageQueue_CreateSenderQueue(objc_msgSend(v8, "intValue"), (_QWORD *)(*(_QWORD *)(a1 + 40) + 208));
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208);
      if (v9)
      {
        QueueXPCObject = (void *)VCRemoteImageQueue_CreateQueueXPCObject(v9);
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("CONTEXT"), QueueXPCObject, CFSTR("USERXPCARGUMENTS"), 0);
        xpc_release(QueueXPCObject);

        return v11;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __44__VCEffectsManager_registerBlocksForService__block_invoke_cold_2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __44__VCEffectsManager_registerBlocksForService__block_invoke_cold_1();
    }

  }
  return 0;
}

uint64_t __44__VCEffectsManager_registerBlocksForService__block_invoke_28(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v6 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("USERXPCARGUMENTS"));
    if (v6)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "initializeReceiveQueue:error:", v6, a3);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __44__VCEffectsManager_registerBlocksForService__block_invoke_28_cold_1();
    }
  }
  return 0;
}

uint64_t __44__VCEffectsManager_registerBlocksForService__block_invoke_30(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D80]);
    v5 = objc_msgSend(v4, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
    v6 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (objc_msgSend((id)objc_msgSend(v7, "effectsArray"), "containsObject:", v6))
      objc_msgSend((id)objc_msgSend(v7, "effectsArray"), "removeObject:", v6);
    if (objc_msgSend((id)objc_msgSend(v7, "effectsArray"), "count"))
    {
      v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "effectsArray"), "firstObject");
      v9 = *(void **)(a1 + 40);
      v10 = objc_msgSend(v8, "effectsType");
      v11 = v9;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v7, "delegate"), "setFaceMeshTrackingEnabled:", 0);
      objc_msgSend((id)objc_msgSend(v7, "delegate"), "setEffectsApplied:", 0);
      objc_msgSend(v7, "tearDownRemoteQueues");
      v11 = *(void **)(a1 + 40);
      v10 = 0;
    }
    objc_msgSend(v11, "setLastEffectsType:", v10);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v16 = v12;
        v17 = 2080;
        v18 = "-[VCEffectsManager registerBlocksForService]_block_invoke";
        v19 = 1024;
        v20 = 273;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d context is not a class of VCEffects", buf, 0x1Cu);
      }
    }
    return 0;
  }
  return v5;
}

uint64_t __44__VCEffectsManager_registerBlocksForService__block_invoke_33(uint64_t a1, void *a2)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    objc_msgSend(v5, "setEffectsMode:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("vcEffectsSetEffectsMode")), "intValue"));
    if (!objc_msgSend(v5, "effectsMode"))
    {
      objc_msgSend(*(id *)(a1 + 40), "setLastEffectsType:", 0);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)(v7 + 136) = *MEMORY[0x1E0CA2E18];
      *(_QWORD *)(v7 + 152) = *(_QWORD *)(v8 + 16);
      objc_msgSend((id)objc_msgSend(v6, "effectsArray"), "removeObjectIdenticalTo:", v5);
      if (!objc_msgSend((id)objc_msgSend(v6, "effectsArray"), "count"))
      {
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "setFaceMeshTrackingEnabled:", 0);
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "setEffectsApplied:", 0);
        objc_msgSend(*(id *)(a1 + 40), "resetEffectsLogging");
        VCRemoteImageQueue_ReleaseIOSurfaces(objc_msgSend(v6, "senderQueue"));
      }
    }
    if (objc_msgSend(v5, "effectsMode")
      && (objc_msgSend((id)objc_msgSend(v6, "effectsArray"), "containsObject:", v5) & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(v6, "effectsArray"), "insertObject:atIndex:", v5, 0);
      objc_msgSend(v5, "setEffectsType:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("vcEffectsEffectsType")), "intValue"));
      objc_msgSend(*(id *)(a1 + 40), "setLastEffectsType:", objc_msgSend(v5, "effectsType"));
      objc_msgSend((id)objc_msgSend(v6, "delegate"), "setFaceMeshTrackingEnabled:", objc_msgSend(v5, "faceMeshTrackingEnabled"));
      objc_msgSend((id)objc_msgSend(v6, "delegate"), "setEffectsApplied:", objc_msgSend(v5, "effectsApplied"));
    }
  }
  return 0;
}

uint64_t __44__VCEffectsManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (objc_msgSend(v4, "effectsMode"))
    {
      objc_msgSend(v4, "setEffectsType:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("vcEffectsEffectsType")), "intValue"));
      objc_msgSend(*(id *)(a1 + 40), "setLastEffectsType:", objc_msgSend(v4, "effectsType"));
      objc_msgSend((id)objc_msgSend(v5, "delegate"), "setFaceMeshTrackingEnabled:", objc_msgSend(v4, "faceMeshTrackingEnabled"));
      objc_msgSend((id)objc_msgSend(v5, "delegate"), "setEffectsApplied:", objc_msgSend(v4, "effectsApplied"));
    }
  }
  return 0;
}

uint64_t __44__VCEffectsManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "releaseFrameWithTime:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcEffectsFrameTime")), "unsignedIntegerValue"));
  return 0;
}

- (void)updateThermalLevel:(int)a3
{
  NSObject *xpcCommandQueue;
  _QWORD block[5];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VCEffectsManager_updateThermalLevel___block_invoke;
  block[3] = &unk_1E9E52300;
  v5 = a3;
  block[4] = self;
  dispatch_async(xpcCommandQueue, block);
}

void __39__VCEffectsManager_updateThermalLevel___block_invoke(uint64_t a1)
{
  unsigned int v2;
  _DWORD *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v15;
  id obj;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 40);
  v3 = *(_DWORD **)(a1 + 32);
  v4 = v3[62];
  if (v2 > 0x1D)
  {
    if (v4 <= 0x1D)
    {
      objc_msgSend(v3, "setLastEffectsType:", 0);
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      obj = *(id *)(*(_QWORD *)(a1 + 32) + 32);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
      if (v7)
      {
        v9 = v7;
        v10 = *(_QWORD *)v27;
        *(_QWORD *)&v8 = 136315906;
        v15 = v8;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
            {
              v13 = VRTraceErrorLogLevelToCSTR();
              v14 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v15;
                v18 = v13;
                v19 = 2080;
                v20 = "-[VCEffectsManager updateThermalLevel:]_block_invoke";
                v21 = 1024;
                v22 = 410;
                v23 = 2112;
                v24 = v12;
                _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Turning off effect: %@", buf, 0x26u);
              }
            }
            objc_msgSend(v12, "setEffectsMode:", 0, v15);
            objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "setFaceMeshTrackingEnabled:", 0);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectIdenticalTo:", v12);
            objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcEffectsServerTimeOut", 0, v12);
          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
        }
        while (v9);
      }
    }
  }
  else if (v4 >= 0x1E && (int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v18 = v5;
      v19 = 2080;
      v20 = "-[VCEffectsManager updateThermalLevel:]_block_invoke";
      v21 = 1024;
      v22 = 405;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Turning effects back on is not supported", buf, 0x1Cu);
    }
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 248) = *(_DWORD *)(a1 + 40);
}

- (void)tearDownRemoteQueues
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCEffectsManager tearDownRemoteQueues]";
      v9 = 1024;
      v10 = 426;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Tearing down queues", (uint8_t *)&v5, 0x1Cu);
    }
  }
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_senderQueue);
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_receiverQueue);
}

- (void)flushRemoteQueue
{
  NSObject *xpcCommandQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__VCEffectsManager_flushRemoteQueue__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(xpcCommandQueue, v3);
}

uint64_t __36__VCEffectsManager_flushRemoteQueue__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  __int128 v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  VCRemoteImageQueue_ReleaseIOSurfaces(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v23;
    *(_QWORD *)&v4 = 136315906;
    v12 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v7);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          v11 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v12;
              v14 = v9;
              v15 = 2080;
              v16 = "-[VCEffectsManager flushRemoteQueue]_block_invoke";
              v17 = 1024;
              v18 = 439;
              v19 = 2112;
              v20 = v8;
              _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Notifying effects[%@] client to flush remote queue", buf, 0x26u);
            }
          }
          else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v12;
            v14 = v9;
            v15 = 2080;
            v16 = "-[VCEffectsManager flushRemoteQueue]_block_invoke";
            v17 = 1024;
            v18 = 439;
            v19 = 2112;
            v20 = v8;
            _os_log_debug_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Notifying effects[%@] client to flush remote queue", buf, 0x26u);
          }
        }
        objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", v12), "sendMessageAsync:arguments:context:", "vcEffectsFlushRemoteQueue", 0, v8);
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

CFIndex __VCEffectsManager_CapturedPixelBuffer_block_invoke(_QWORD *a1)
{
  const __CFArray *v2;
  CFIndex result;
  const void *ValueAtIndex;

  v2 = *(const __CFArray **)(a1[4] + 32);
  result = CFArrayGetCount(v2);
  if (result >= 1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v2, 0);
    if (ValueAtIndex)
      ValueAtIndex = CFRetain(ValueAtIndex);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = ValueAtIndex;
    result = VCEffects_EffectsMode(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  }
  return result;
}

- (void)resetEffectsLogging
{
  _opaque_pthread_mutex_t *p_loggingLock;
  uint64_t v4;
  __int128 v5;
  int64_t v6;

  p_loggingLock = &self->_loggingLock;
  pthread_mutex_lock(&self->_loggingLock);
  v4 = MEMORY[0x1E0CA2E18];
  v5 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&self->_lastPrintTimestamp.value = *MEMORY[0x1E0CA2E18];
  v6 = *(_QWORD *)(v4 + 16);
  self->_lastPrintTimestamp.epoch = v6;
  *(_OWORD *)&self->_lastReceivedTimestamp.value = v5;
  self->_lastReceivedTimestamp.epoch = v6;
  *(_OWORD *)&self->_lastSentTimestamp.value = v5;
  self->_lastSentTimestamp.epoch = v6;
  *(_QWORD *)&self->_droppedFrameCount = 0;
  *(_QWORD *)&self->_sentFrameCount = 0;
  pthread_mutex_unlock(p_loggingLock);
}

- (void)encodeProcessedPixelBuffer:(__CVBuffer *)a3 time:(id *)a4 imageData:(id)a5 processTime:(id)a6
{
  OpaqueCMClock *HostTimeClock;
  VCEffectsManagerDelegate *v12;
  $95D729B680665BEAEFA1D6FCA8238556 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  pthread_mutex_lock(&self->_loggingLock);
  ++self->_receivedFrameCount;
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime((CMTime *)&v13, HostTimeClock);
  self->_lastReceivedTimestamp = v13;
  pthread_mutex_unlock(&self->_loggingLock);
  v12 = -[VCEffectsManager delegate](self, "delegate");
  v13 = *($95D729B680665BEAEFA1D6FCA8238556 *)a4;
  -[VCEffectsManagerDelegate encodeProcessedPixelBuffer:time:imageData:processTime:](v12, "encodeProcessedPixelBuffer:time:imageData:processTime:", a3, &v13, a5, a6);
}

- (void)remoteQueueOperationHandlerWithError:(int)a3 operation:(FigRemoteOperation *)a4
{
  uint64_t v6;
  NSObject *v7;
  __CVBuffer *ImageBuffer;
  __CFDictionary *var0;
  const void *Value;
  double v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  __CVBuffer *lastReceivedPixelBuffer;
  __CVBuffer *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _BYTE v20[24];
  _BYTE buf[24];
  int v22;
  __int16 v23;
  __CVBuffer *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCEffectsManager remoteQueueOperationHandlerWithError:operation:].cold.2();
    }
  }
  else if (a4->var0 == 1)
  {
    memset(v20, 170, sizeof(v20));
    var0 = a4->var4.var0.var0;
    FigCFDictionaryGetCMTimeIfPresent();
    FigCFDictionaryGetFloatIfPresent();
    Value = CFDictionaryGetValue(var0, CFSTR("vcEffectsImageData"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          lastReceivedPixelBuffer = self->_lastReceivedPixelBuffer;
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCEffectsManager remoteQueueOperationHandlerWithError:operation:]";
          *(_WORD *)&buf[22] = 1024;
          v22 = 631;
          v23 = 2048;
          v24 = lastReceivedPixelBuffer;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _lastReceivedPixelBuffer=%p", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        -[VCEffectsManager remoteQueueOperationHandlerWithError:operation:].cold.1();
      }
    }
    v16 = self->_lastReceivedPixelBuffer;
    if (v16)
    {
      LODWORD(v11) = -1;
      v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
      *(_OWORD *)buf = *(_OWORD *)v20;
      *(_QWORD *)&buf[16] = *(_QWORD *)&v20[16];
      -[VCEffectsManager encodeProcessedPixelBuffer:time:imageData:processTime:](self, "encodeProcessedPixelBuffer:time:imageData:processTime:", v16, buf, Value, v17);
      CVPixelBufferRelease(self->_lastReceivedPixelBuffer);
      self->_lastReceivedPixelBuffer = 0;
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCEffectsManager remoteQueueOperationHandlerWithError:operation:]";
        *(_WORD *)&buf[22] = 1024;
        v22 = 637;
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Expected sample buffer, received dictionary payload", buf, 0x1Cu);
      }
    }
  }
  else if (a4->var0 == 3)
  {
    if (self->_lastReceivedPixelBuffer)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCEffectsManager remoteQueueOperationHandlerWithError:operation:]";
          *(_WORD *)&buf[22] = 1024;
          v22 = 617;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Expected dictionary payload, received sample buffer", buf, 0x1Cu);
        }
      }
      CVPixelBufferRelease(self->_lastReceivedPixelBuffer);
    }
    ImageBuffer = CMSampleBufferGetImageBuffer(a4->var4.var0.var0);
    self->_lastReceivedPixelBuffer = ImageBuffer;
    CVPixelBufferRetain(ImageBuffer);
  }
}

- (void)effectsRegistered:(BOOL)a3
{
  if (a3)
  {
    self->_effectsRegistered = 1;
    -[VCEffectsManagerDelegate setFaceMeshTrackingEnabled:](-[VCEffectsManager delegate](self, "delegate"), "setFaceMeshTrackingEnabled:", 1);
  }
}

- (void)setEffectsArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (opaqueVCRemoteImageQueue)senderQueue
{
  return self->_senderQueue;
}

- (id)reportingAgent
{
  return self->_reportingAgent;
}

- (void)setReportingAgent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

void ___VCEffectsManager_PixelBufferToClient_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CVBuffer *v3;
  const __CFAllocator *v4;
  CMSampleBufferRef SampleBufferWithPixelBuffer;
  CMSampleBufferRef v6;
  _OWORD *v7;
  __CVBuffer *v8;
  const __CFAllocator *v9;
  CMSampleBufferRef v10;
  CMSampleBufferRef v11;
  CFMutableDictionaryRef Mutable;
  void *v13;
  CFDataRef v14;
  _OWORD *v15;
  OpaqueCMClock *HostTimeClock;
  OpaqueCMClock *v17;
  double Seconds;
  uint64_t v19;
  NSObject *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  int v29;
  CMTime v30;
  CMTime time;
  CMTime v32;
  CMTime lhs;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  double v38;
  __int16 v39;
  int v40;
  __int16 v41;
  double v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 208))
    goto LABEL_13;
  v3 = *(__CVBuffer **)(a1 + 56);
  v4 = *(const __CFAllocator **)(v2 + 224);
  lhs = *(CMTime *)(a1 + 72);
  SampleBufferWithPixelBuffer = VideoUtil_CreateSampleBufferWithPixelBuffer(v3, (uint64_t)&lhs, v4, v4);
  if (SampleBufferWithPixelBuffer)
  {
    v6 = SampleBufferWithPixelBuffer;
    v7 = (_OWORD *)(a1 + 72);
    VCRemoteImageQueue_EnqueueFrame(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), (unint64_t)SampleBufferWithPixelBuffer);
    CFRelease(v6);
    v8 = *(__CVBuffer **)(a1 + 64);
    if (!v8)
    {
LABEL_6:
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      *(_OWORD *)&lhs.value = *v7;
      lhs.epoch = *(_QWORD *)(a1 + 88);
      FigCFDictionarySetCMTime();
      v13 = *(void **)(a1 + 40);
      if (v13)
      {
        v14 = CFDataCreate(0, (const UInt8 *)objc_msgSend(v13, "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"));
        FigCFDictionarySetValue();
        VCRemoteImageQueue_EnqueueAttributes(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), (unint64_t)Mutable);
        CFRelease(v14);
      }
      else
      {
        VCRemoteImageQueue_EnqueueAttributes(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), (unint64_t)Mutable);
      }
      CFRelease(Mutable);
      v2 = *(_QWORD *)(a1 + 32);
LABEL_13:
      pthread_mutex_lock((pthread_mutex_t *)(v2 + 48));
      v15 = (_OWORD *)(v2 + 112);
      if ((*(_BYTE *)(v2 + 124) & 1) == 0)
      {
        HostTimeClock = CMClockGetHostTimeClock();
        CMClockGetTime(&lhs, HostTimeClock);
        *v15 = *(_OWORD *)&lhs.value;
        *(_QWORD *)(v2 + 128) = lhs.epoch;
      }
      memset(&v32, 170, sizeof(v32));
      v17 = CMClockGetHostTimeClock();
      CMClockGetTime(&v32, v17);
      lhs = v32;
      *(_OWORD *)&v30.value = *v15;
      v30.epoch = *(_QWORD *)(v2 + 128);
      CMTimeSubtract(&time, &lhs, &v30);
      Seconds = CMTimeGetSeconds(&time);
      if (Seconds > 5.0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v21 = *(_DWORD *)(v2 + 188);
            v22 = *(_DWORD *)(v2 + 192);
            LODWORD(lhs.value) = 136317186;
            v23 = *(_DWORD *)(v2 + 196);
            v24 = *(_DWORD *)(v2 + 200);
            *(CMTimeValue *)((char *)&lhs.value + 4) = v19;
            LOWORD(lhs.flags) = 2080;
            *(_QWORD *)((char *)&lhs.flags + 2) = "_VCEffectsManager_CheckEffectsHealth";
            HIWORD(lhs.epoch) = 1024;
            v34 = 573;
            v35 = 1024;
            v36 = v21;
            v37 = 2048;
            v38 = (double)v21 / Seconds;
            v39 = 1024;
            v40 = v22;
            v41 = 2048;
            v42 = (double)v22 / Seconds;
            v43 = 1024;
            v44 = v23;
            v45 = 1024;
            v46 = v24;
            _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: VCEffectsManager Frames Sent: %d (%f FPS) Frames Received: %d (%f FPS) Frames Dropped: %d Frames Failed: %d", (uint8_t *)&lhs, 0x48u);
          }
        }
        *v15 = *(_OWORD *)&v32.value;
        *(_QWORD *)(v2 + 128) = v32.epoch;
        if (*(int *)(v2 + 184) >= 31)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_2();
          }
LABEL_23:
          v25 = *(unsigned __int8 *)(v2 + 204);
          *(_QWORD *)(v2 + 196) = 0;
          *(_QWORD *)(v2 + 188) = 0;
          pthread_mutex_unlock((pthread_mutex_t *)(v2 + 48));
          if (!v25)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_1();
            }
            objc_msgSend(*(id *)(a1 + 48), "setEffectsMode:", 0);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 48));
            objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcEffectsServerTimeOut", 0, *(_QWORD *)(a1 + 48));
          }
          goto LABEL_32;
        }
        if (*(int *)(v2 + 188) >= 11 && !*(_DWORD *)(v2 + 192))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v26 = VRTraceErrorLogLevelToCSTR();
            v27 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              v28 = *(_DWORD *)(v2 + 188);
              v29 = *(_DWORD *)(v2 + 192);
              LODWORD(lhs.value) = 136316162;
              *(CMTimeValue *)((char *)&lhs.value + 4) = v26;
              LOWORD(lhs.flags) = 2080;
              *(_QWORD *)((char *)&lhs.flags + 2) = "_VCEffectsManager_CheckEffectsHealth";
              HIWORD(lhs.epoch) = 1024;
              v34 = 582;
              v35 = 1024;
              v36 = v28;
              v37 = 1024;
              LODWORD(v38) = v29;
              _os_log_error_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_ERROR, " [%s] %s:%d Have not received frames from AVCEffects. Sent Frames: %d Received Frames: %d", (uint8_t *)&lhs, 0x28u);
            }
          }
          goto LABEL_23;
        }
        *(_QWORD *)(v2 + 188) = 0;
        *(_QWORD *)(v2 + 196) = 0;
      }
      pthread_mutex_unlock((pthread_mutex_t *)(v2 + 48));
LABEL_32:
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 64));
      return;
    }
    v9 = *(const __CFAllocator **)(*(_QWORD *)(a1 + 32) + 224);
    *(_OWORD *)&lhs.value = *v7;
    lhs.epoch = *(_QWORD *)(a1 + 88);
    v10 = VideoUtil_CreateSampleBufferWithPixelBuffer(v8, (uint64_t)&lhs, v9, v9);
    if (v10)
    {
      v11 = v10;
      VCRemoteImageQueue_EnqueueFrame(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), (unint64_t)v10);
      CFRelease(v11);
      goto LABEL_6;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_4();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_3();
  }
}

void __44__VCEffectsManager_registerBlocksForService__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error getting the client pid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__VCEffectsManager_registerBlocksForService__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d RemoteImageQueue could not be made", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__VCEffectsManager_registerBlocksForService__block_invoke_cold_3()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d Client has died. Cleaning up VCEffectsMananger by removing associated objects", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__VCEffectsManager_registerBlocksForService__block_invoke_28_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d xpcClientQueue was null, cannot make the remote queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)remoteQueueOperationHandlerWithError:operation:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  v3 = "-[VCEffectsManager remoteQueueOperationHandlerWithError:operation:]";
  v4 = 1024;
  v5 = 631;
  v6 = 2048;
  v7 = v0;
  _os_log_debug_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d _lastReceivedPixelBuffer=%p", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)remoteQueueOperationHandlerWithError:operation:.cold.2()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  _BYTE v4[14];

  OUTLINED_FUNCTION_2();
  *(_WORD *)&v4[4] = v0;
  *(_QWORD *)&v4[6] = "-[VCEffectsManager remoteQueueOperationHandlerWithError:operation:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Error received from the remote Queue. error=%d", v3, *(const char **)v4, (unint64_t)"-[VCEffectsManager remoteQueueOperationHandlerWithError:operation:]" >> 16, 611);
  OUTLINED_FUNCTION_3();
}

void ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Disabling effects mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "_VCEffectsManager_CheckEffectsHealth";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot send frames to AVCEffects. Consecutive Dropped frames: %d", v2, *(const char **)v3, (unint64_t)"_VCEffectsManager_CheckEffectsHealth" >> 16, 579);
  OUTLINED_FUNCTION_3();
}

void ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_3()
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

void ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_4()
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

@end
