@implementation VCMediaRecorderManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_36);
  return (id)sharedInstance__sharedManager;
}

VCMediaRecorderManager *__40__VCMediaRecorderManager_sharedInstance__block_invoke()
{
  VCMediaRecorderManager *result;

  result = objc_alloc_init(VCMediaRecorderManager);
  sharedInstance__sharedManager = (uint64_t)result;
  return result;
}

- (VCMediaRecorderManager)init
{
  VCMediaRecorderManager *v2;
  NSObject *CustomRootQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCMediaRecorderManager;
  v2 = -[VCMediaRecorderManager init](&v5, sel_init);
  if (v2)
  {
    v2->_streamTokenList = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMediaRecorderManager.xpcCommandQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaRecorderManager deregisterBlocksFromService](self, "deregisterBlocksFromService");
  dispatch_release((dispatch_object_t)self->_xpcCommandQueue);

  objc_storeWeak(&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaRecorderManager;
  -[VCMediaRecorderManager dealloc](&v3, sel_dealloc);
}

- (VCMediaRecorderDelegate)delegate
{
  return (VCMediaRecorderDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void)registerMediaRecorder:(id)a3 withStreamToken:(int64_t)a4
{
  NSObject *xpcCommandQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__VCMediaRecorderManager_registerMediaRecorder_withStreamToken___block_invoke;
  v5[3] = &unk_1E9E53820;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(xpcCommandQueue, v5);
}

uint64_t __64__VCMediaRecorderManager_registerMediaRecorder_withStreamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedRegisterMediaRecorder:withStreamToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)dispatchedRegisterMediaRecorder:(id)a3 withStreamToken:(int64_t)a4
{
  uint64_t v7;
  VCMediaRecorderManagerStreamTokenClientList *v8;
  uint64_t v9;
  NSObject *v10;
  VCMediaRecorderManagerStreamTokenClientList *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenList, "objectForKeyedSubscript:", v7))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCMediaRecorderManager dispatchedRegisterMediaRecorder:withStreamToken:]";
        v16 = 1024;
        v17 = 162;
        v18 = 1024;
        v19 = a4;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Context already exists for stream token=%u", buf, 0x22u);
      }
    }
  }
  else
  {
    v8 = -[VCMediaRecorderManagerStreamTokenClientList initWithStreamToken:mediaRecorder:]([VCMediaRecorderManagerStreamTokenClientList alloc], "initWithStreamToken:mediaRecorder:", a4, a3);
    if (v8)
    {
      v11 = v8;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamTokenList, "setObject:forKeyedSubscript:", v8, v7);
      objc_msgSend(a3, "setMediaRecorderDelegate:", self);

    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaRecorderManager dispatchedRegisterMediaRecorder:withStreamToken:].cold.1();
    }
  }
}

- (void)unregisterMediaRecorderWithStreamToken:(int64_t)a3
{
  NSObject *xpcCommandQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__VCMediaRecorderManager_unregisterMediaRecorderWithStreamToken___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_async(xpcCommandQueue, block);
}

uint64_t __65__VCMediaRecorderManager_unregisterMediaRecorderWithStreamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedUnregisterMediaRecorderWithStreamToken:", *(_QWORD *)(a1 + 40));
}

- (void)dispatchedUnregisterMediaRecorderWithStreamToken:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenList, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
  if (v5)
  {
    objc_msgSend((id)objc_msgSend(v5, "mediaRecorder"), "cleanUpActiveRequests");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCMediaRecorderManager dispatchedUnregisterMediaRecorderWithStreamToken:]";
      v12 = 1024;
      v13 = 186;
      v14 = 1024;
      v15 = a3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Context doesn't exists for stream token: %u", (uint8_t *)&v8, 0x22u);
    }
  }
}

- (id)mediaRecorderFromClientContext:(id)a3
{
  int64_t v5;

  if (!+[VCMediaRecorderManagerStreamTokenClientList isValidContext:](VCMediaRecorderManagerStreamTokenClientList, "isValidContext:"))return 0;
  v5 = +[VCMediaRecorderManagerStreamTokenClientList streamTokenFromClientContext:](VCMediaRecorderManagerStreamTokenClientList, "streamTokenFromClientContext:", a3);
  return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenList, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5)), "mediaRecorder");
}

- (id)newClientContextWithStreamToken:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenList, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
  if (!v7)
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = -2;
LABEL_8:
      v10 = 0;
      *a4 = (id)objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderManager"), v12, 0);
      return v10;
    }
    return 0;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "newContext");
  if (!v9)
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = -3;
      goto LABEL_8;
    }
    return 0;
  }
  v10 = (void *)v9;
  objc_msgSend((id)objc_msgSend(v8, "mediaRecorder"), "registerClient");
  return v10;
}

- (void)registerBlocksForService
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__VCMediaRecorderManager_registerBlocksForService__block_invoke;
  v9[3] = &unk_1E9E53848;
  v9[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaRecorderInitialize", v9, self->_xpcCommandQueue);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_54;
  v8[3] = &unk_1E9E53848;
  v8[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaRecorderInitializeStandalone", v8, self->_xpcCommandQueue);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_2;
  v7[3] = &unk_1E9E53848;
  v7[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaRecorderUninitialize", v7, self->_xpcCommandQueue);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_64;
  v6[3] = &unk_1E9E53848;
  v6[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaRecorderStartRequest", v6, self->_xpcCommandQueue);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_67;
  v5[3] = &unk_1E9E53848;
  v5[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaRecorderEndRequest", v5, self->_xpcCommandQueue);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_69;
  v4[3] = &unk_1E9E53848;
  v4[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaRecorderRejectRequest", v4, self->_xpcCommandQueue);
}

uint64_t __50__VCMediaRecorderManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMomentsStreamToken"));
  if (!v8)
  {
    if (a3)
    {
      v6 = 0;
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderManager"), -1, 0);
      return v6;
    }
    return 0;
  }
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = objc_msgSend(*(id *)(a1 + 32), "newClientContextWithStreamToken:error:", v9, a3);
  if (!v10)
    return 0;
  v11 = (void *)v10;
  v12 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9));
  v13 = objc_alloc(MEMORY[0x1E0C99D80]);
  v6 = objc_msgSend(v13, "initWithObjectsAndKeys:", v11, CFSTR("CONTEXT"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(v12, "mediaRecorder"), "capabilities")), CFSTR("vcMomentsCapabilities"), 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v17 = v14;
      v18 = 2080;
      v19 = "-[VCMediaRecorderManager registerBlocksForService]_block_invoke";
      v20 = 1024;
      v21 = 250;
      v22 = 2048;
      v23 = v11;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d New moments client. Context=0x%p", buf, 0x26u);
    }
  }

  return v6;
}

uint64_t __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_54(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t ID;
  VCMediaRecorderLocal *v12;
  void *v13;
  id *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  uint64_t v21;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v6 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMomentsConfiguration"));
  if (!v6)
  {
    if (!a3)
      return 0;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = -6;
LABEL_16:
    *a3 = objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderManager"), v21, 0);
    return 0;
  }
  v7 = v6;
  v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID"));
  if (!v8)
  {
    if (!a3)
      return 0;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = -8;
    goto LABEL_16;
  }
  v9 = +[AVCMediaRecorderConfiguration newClientDictionary:clientPid:](AVCMediaRecorderConfiguration, "newClientDictionary:clientPid:", v7, objc_msgSend(v8, "intValue"));
  if (!v9)
  {
    if (!a3)
      return 0;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = -7;
    goto LABEL_16;
  }
  v10 = v9;
  ID = VCUniqueIDGenerator_GenerateID();
  v12 = -[VCMediaRecorderLocal initWithStreamToken:configuration:reportingAgent:]([VCMediaRecorderLocal alloc], "initWithStreamToken:configuration:reportingAgent:", ID, v10, 0);

  if (!v12)
  {
    if (!a3)
      return 0;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = -5;
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 32), "dispatchedRegisterMediaRecorder:withStreamToken:", v12, ID);

  v13 = (void *)objc_msgSend(*(id *)(a1 + 32), "newClientContextWithStreamToken:error:", ID, a3);
  v14 = *(id **)(a1 + 32);
  if (v13)
  {
    v15 = (void *)objc_msgSend(v14[1], "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ID));
    v16 = objc_alloc(MEMORY[0x1E0C99D80]);
    v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(v15, "mediaRecorder"), "capabilities"));
    v18 = objc_msgSend(v16, "initWithObjectsAndKeys:", v13, CFSTR("CONTEXT"), v17, CFSTR("vcMomentsCapabilities"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ID), CFSTR("vcMomentsStreamToken"), 0);

    return v18;
  }
  objc_msgSend(v14, "dispatchedUnregisterMediaRecorderWithStreamToken:", ID);
  return 0;
}

uint64_t __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D80]);
    v4 = objc_msgSend(v5, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
  }
  v6 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  if (+[VCMediaRecorderManagerStreamTokenClientList isValidContext:](VCMediaRecorderManagerStreamTokenClientList, "isValidContext:", v6))
  {
    v7 = +[VCMediaRecorderManagerStreamTokenClientList streamTokenFromClientContext:](VCMediaRecorderManagerStreamTokenClientList, "streamTokenFromClientContext:", v6);
    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7));
    objc_msgSend((id)objc_msgSend(v8, "mediaRecorder"), "invalidate");
    objc_msgSend(v8, "removeContext:", v6);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCMediaRecorderManager registerBlocksForService]_block_invoke_2";
        v16 = 1024;
        v17 = 333;
        v18 = 2048;
        v19 = v6;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unregister moments client. Context=0x%p", buf, 0x26u);
      }
    }
  }
  return v4;
}

uint64_t __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_64(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "mediaRecorderFromClientContext:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRequestWithArguments:state:", a2, 1);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          if (v8)
            v11 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
          else
            v11 = "<nil>";
          v13 = 136315906;
          v14 = v9;
          v15 = 2080;
          v16 = "-[VCMediaRecorderManager registerBlocksForService]_block_invoke";
          v17 = 1024;
          v18 = 350;
          v19 = 2080;
          v20 = v11;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d clientStartRequest %s", (uint8_t *)&v13, 0x26u);
        }
      }
      objc_msgSend(v7, "processClientRequest:error:", v8, a3);

    }
    else if (a3)
    {
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderManager"), -4, 0);
    }
  }
  return 0;
}

uint64_t __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_67(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "mediaRecorderFromClientContext:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRequestWithArguments:state:", a2, 2);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          if (v8)
            v11 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
          else
            v11 = "<nil>";
          v13 = 136315906;
          v14 = v9;
          v15 = 2080;
          v16 = "-[VCMediaRecorderManager registerBlocksForService]_block_invoke";
          v17 = 1024;
          v18 = 369;
          v19 = 2080;
          v20 = v11;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d clientEndRequest %s", (uint8_t *)&v13, 0x26u);
        }
      }
      objc_msgSend(v7, "processClientRequest:error:", v8, a3);

    }
    else if (a3)
    {
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderManager"), -4, 0);
    }
  }
  return 0;
}

uint64_t __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_69(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "mediaRecorderFromClientContext:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRequestWithArguments:state:", a2, 3);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          if (v8)
            v11 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
          else
            v11 = "<nil>";
          v13 = 136315906;
          v14 = v9;
          v15 = 2080;
          v16 = "-[VCMediaRecorderManager registerBlocksForService]_block_invoke";
          v17 = 1024;
          v18 = 388;
          v19 = 2080;
          v20 = v11;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d clientRejctRequest %s", (uint8_t *)&v13, 0x26u);
        }
      }
      objc_msgSend(v7, "processClientRequest:error:", v8, a3);

    }
    else if (a3)
    {
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderManager"), -4, 0);
    }
  }
  return 0;
}

- (void)deregisterBlocksFromService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaRecorderInitialize");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaRecorderInitializeStandalone");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaRecorderUninitialize");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaRecorderStartRequest");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaRecorderEndRequest");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaRecorderRejectRequest");
}

- (void)notifyClientsWithStreamToken:(int64_t)a3 service:(char *)a4 arguments:(id)a5
{
  NSObject *xpcCommandQueue;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__VCMediaRecorderManager_notifyClientsWithStreamToken_service_arguments___block_invoke;
  block[3] = &unk_1E9E53870;
  block[6] = a3;
  block[7] = a4;
  block[4] = self;
  block[5] = a5;
  dispatch_async(xpcCommandQueue, block);
}

void __73__VCMediaRecorderManager_notifyClientsWithStreamToken_service_arguments___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_log_t *v6;
  void **p_vtable;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  void *v12;
  const char *v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  char *v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]));
  if (v2)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = (id)objc_msgSend(v2, "clientContextList");
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v36;
      v6 = (os_log_t *)MEMORY[0x1E0CF2758];
      p_vtable = (void **)(&OBJC_METACLASS___VCVideoTransmitterDefault + 24);
      v19 = *(_QWORD *)v36;
      do
      {
        v8 = 0;
        v20 = v4;
        do
        {
          if (*(_QWORD *)v36 != v5)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v8);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            __str = 0;
            v10 = *((_DWORD *)a1 + 12);
            v11 = (const char *)a1[7];
            v12 = (void *)a1[5];
            if (v12)
              v13 = (const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String");
            else
              v13 = "<nil>";
            asprintf(&__str, "streamToken=%u, service=%s, arguments=%s", v10, v11, v13);
            if (__str)
            {
              __lasts = 0;
              v14 = strtok_r(__str, "\n", &__lasts);
              do
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v15 = VRTraceErrorLogLevelToCSTR();
                  v16 = *v6;
                  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136316162;
                    v25 = v15;
                    v26 = 2080;
                    v27 = "-[VCMediaRecorderManager notifyClientsWithStreamToken:service:arguments:]_block_invoke";
                    v28 = 1024;
                    v29 = 415;
                    v30 = 2080;
                    v31 = "";
                    v32 = 2080;
                    v33 = v14;
                    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                  }
                }
                v14 = strtok_r(0, "\n", &__lasts);
              }
              while (v14);
              free(__str);
              v5 = v19;
            }
            v4 = v20;
            p_vtable = &OBJC_METACLASS___VCVideoTransmitterDefault.vtable;
          }
          objc_msgSend((id)objc_msgSend(p_vtable + 157, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", a1[7], a1[5], v9);
          ++v8;
        }
        while (v8 != v4);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
      }
      while (v4);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __73__VCMediaRecorderManager_notifyClientsWithStreamToken_service_arguments___block_invoke_cold_1(v17, v18);
  }
}

- (void)streamToken:(int64_t)a3 didStartProcessingRequest:(id)a4 error:(id)a5
{
  id v8;

  v8 = (id)objc_msgSend(a4, "mutableCopy");
  if (a5)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a5, 1, 0), CFSTR("vcMomentsError"));
  -[VCMediaRecorderManager notifyClientsWithStreamToken:service:arguments:](self, "notifyClientsWithStreamToken:service:arguments:", a3, "vcMediaRecorderDidStartProcessingRequest", v8);

}

+ (id)prepareURL:(id)a3 forXPCWithSandboxing:(BOOL)a4
{
  id v4;
  VCSandboxedURL *v5;
  VCSandboxedURL *v6;

  v4 = a3;
  if (a4)
  {
    v5 = -[VCSandboxedURL initWithURL:accessType:]([VCSandboxedURL alloc], "initWithURL:accessType:", a3, 2);
    v6 = v5;
    if (v5)
    {
      v4 = -[VCSandboxedURL serialize](v5, "serialize");
      if (v4)
      {
LABEL_4:

        return v4;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCMediaRecorderManager prepareURL:forXPCWithSandboxing:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaRecorderManager prepareURL:forXPCWithSandboxing:].cold.1();
    }
    v4 = 0;
    goto LABEL_4;
  }
  return v4;
}

- (void)streamToken:(int64_t)a3 didEndProcessingRequest:(id)a4 urlContext:(const tagVCMediaRecorderDelegateURLContext *)a5 error:(id)a6
{
  id var1;
  id var0;
  _BOOL4 var2;
  id v13;

  v13 = (id)objc_msgSend(a4, "mutableCopy");
  var0 = a5->var0;
  var1 = a5->var1;
  var2 = a5->var2;
  -[VCMediaRecorderManager saveImage:movie:](self, "saveImage:movie:", var0, var1);
  if (var0)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", +[VCMediaRecorderManager prepareURL:forXPCWithSandboxing:](VCMediaRecorderManager, "prepareURL:forXPCWithSandboxing:", var0, var2), CFSTR("vcMomentsStillImageURL"));
  if (var1)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", +[VCMediaRecorderManager prepareURL:forXPCWithSandboxing:](VCMediaRecorderManager, "prepareURL:forXPCWithSandboxing:", var1, var2), CFSTR("vcMomentsMovieURL"));
  if (a6)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a6, 1, 0), CFSTR("vcMomentsError"));
  -[VCMediaRecorderManager notifyClientsWithStreamToken:service:arguments:](self, "notifyClientsWithStreamToken:service:arguments:", a3, "vcMediaRecorderDidEndProcessingRequest", v13);

}

- (void)saveImage:(id)a3 movie:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (VCDefaults_GetBoolValueForKey(CFSTR("FaceTimePhotosSaveImagesForDebug"), 0))
  {
    if (a3)
    {
      v6 = objc_msgSend((id)objc_msgSend(a3, "URLByAppendingPathExtension:", CFSTR("debug")), "URLByAppendingPathExtension:", objc_msgSend(a3, "pathExtension"));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "copyItemAtURL:toURL:error:", a3, v6, 0);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315906;
          v13 = v7;
          v14 = 2080;
          v15 = "-[VCMediaRecorderManager saveImage:movie:]";
          v16 = 1024;
          v17 = 478;
          v18 = 2112;
          v19 = v6;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created for debugging: %@", (uint8_t *)&v12, 0x26u);
        }
      }
    }
    if (a4)
    {
      v9 = objc_msgSend((id)objc_msgSend(a4, "URLByAppendingPathExtension:", CFSTR("debug")), "URLByAppendingPathExtension:", objc_msgSend(a4, "pathExtension"));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "copyItemAtURL:toURL:error:", a4, v9, 0);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315906;
          v13 = v10;
          v14 = 2080;
          v15 = "-[VCMediaRecorderManager saveImage:movie:]";
          v16 = 1024;
          v17 = 485;
          v18 = 2112;
          v19 = v9;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created for debugging: %@", (uint8_t *)&v12, 0x26u);
        }
      }
    }
  }
}

- (void)streamToken:(int64_t)a3 didFinishRequest:(id)a4 didSucceed:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  v8 = (id)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5), CFSTR("vcMomentsRequestDidSucceed"));
  -[VCMediaRecorderManager notifyClientsWithStreamToken:service:arguments:](self, "notifyClientsWithStreamToken:service:arguments:", a3, "vcMediaRecorderDidFinishRequest", v8);

}

- (void)streamToken:(int64_t)a3 didUpdateCapabilities:(unsigned int)a4
{
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("vcMomentsCapabilities");
  v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4);
  -[VCMediaRecorderManager notifyClientsWithStreamToken:service:arguments:](self, "notifyClientsWithStreamToken:service:arguments:", a3, "vcMediaRecorderCapabilitiesDidChange", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
}

- (void)streamTokenDidCleanupAllRequests:(int64_t)a3
{
  NSObject *xpcCommandQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__VCMediaRecorderManager_streamTokenDidCleanupAllRequests___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_async(xpcCommandQueue, block);
}

void __59__VCMediaRecorderManager_streamTokenDidCleanupAllRequests___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v2 = a1 + 40;
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v3);
  if (v4)
  {
    objc_msgSend((id)objc_msgSend(v4, "mediaRecorder"), "setMediaRecorderDelegate:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", v3);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __59__VCMediaRecorderManager_streamTokenDidCleanupAllRequests___block_invoke_cold_1(v5, v2, v6);
  }
}

- (id)newRequestWithArguments:(id)a3 state:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;

  v4 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsMediaType")), CFSTR("vcMomentsMediaType"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequesterID")), CFSTR("vcMomentsRequesterID"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequesteeID")), CFSTR("vcMomentsRequesteeID"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsTransactionID")), CFSTR("vcMomentsTransactionID"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4), CFSTR("vcMomentsRequestState"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestMode")), CFSTR("vcMomentsRequestMode"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaRecorderDirectoryURL")), CFSTR("vcMediaRecorderDirectoryURL"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaRecorderMovieFragmentInterval")), CFSTR("vcMediaRecorderMovieFragmentInterval"));
  return v6;
}

- (void)dispatchedRegisterMediaRecorder:withStreamToken:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stream token entry for stream token=%u", v2, v3, v4, 165);
  OUTLINED_FUNCTION_3();
}

void __73__VCMediaRecorderManager_notifyClientsWithStreamToken_service_arguments___block_invoke_cold_1(uint64_t a1, NSObject *a2)
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
  v5 = "-[VCMediaRecorderManager notifyClientsWithStreamToken:service:arguments:]_block_invoke";
  v6 = 1024;
  v7 = 411;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d notifyClientsWithStreamToken streamClientList is nil", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

+ (void)prepareURL:forXPCWithSandboxing:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to issue read write sandboxedURL for url=%@");
  OUTLINED_FUNCTION_3();
}

+ (void)prepareURL:forXPCWithSandboxing:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to serialize sandboxedURL=%@");
  OUTLINED_FUNCTION_3();
}

void __59__VCMediaRecorderManager_streamTokenDidCleanupAllRequests___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[22];

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[VCMediaRecorderManager streamTokenDidCleanupAllRequests:]_block_invoke";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, a2, a3, " [%s] %s:%d Context doesn't exists for stream token: %u", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCMediaRecorderManager streamTokenDidCleanupAllRequests:]_block_invoke" >> 16, 507);
  OUTLINED_FUNCTION_3();
}

@end
