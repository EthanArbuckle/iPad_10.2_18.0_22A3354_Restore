@implementation VCStreamOutputManager

- (VCStreamOutputManager)init
{
  VCStreamOutputManager *v2;
  NSObject *CustomRootQueue;
  dispatch_queue_t v4;
  dispatch_queue_t v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCStreamOutputManager;
  v2 = -[VCStreamOutputManager init](&v9, sel_init);
  if (v2)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v4 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCStreamOutputManager.xpcCommandQueue", 0, CustomRootQueue);
    v2->_stateQueue = (OS_dispatch_queue *)v4;
    if (v4)
    {
      v5 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCStreamOutputManager.xpcCallbackQueue", 0, CustomRootQueue);
      v2->_xpcCallbackQueue = (OS_dispatch_queue *)v5;
      if (v5)
      {
        v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v2->_streamOutputSourceForStreamToken = v6;
        if (v6)
        {
          v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          v2->_streamOutputs = v7;
          if (v7)
          {
            v2->_useFigRemoteQueue = 1;
            return v2;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCStreamOutputManager init].cold.4();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCStreamOutputManager init].cold.3();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCStreamOutputManager init].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamOutputManager init].cold.1();
    }

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  NSObject *stateQueue;
  NSObject *xpcCallbackQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  if (stateQueue)
    dispatch_release(stateQueue);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  if (xpcCallbackQueue)
    dispatch_release(xpcCallbackQueue);

  v5.receiver = self;
  v5.super_class = (Class)VCStreamOutputManager;
  -[VCStreamOutputManager dealloc](&v5, sel_dealloc);
}

- (void)cleanupStreamOutput:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VCStreamOutputManager_cleanupStreamOutput___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __45__VCStreamOutputManager_cleanupStreamOutput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedCleanupStreamOutput:", *(_QWORD *)(a1 + 40));
}

- (void)dispatchedCleanupStreamOutput:(id)a3
{
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a3)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", objc_msgSend(a3, "streamToken"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamOutputs, "setObject:forKeyedSubscript:", 0, v5);

  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1)
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_66);
  return (id)_vcStreamOutputManager;
}

VCStreamOutputManager *__39__VCStreamOutputManager_sharedInstance__block_invoke()
{
  VCStreamOutputManager *result;

  result = objc_alloc_init(VCStreamOutputManager);
  _vcStreamOutputManager = (uint64_t)result;
  return result;
}

- (void)registerStreamOutputSource:(id)a3 forStreamToken:(int64_t)a4
{
  NSObject *stateQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__VCStreamOutputManager_registerStreamOutputSource_forStreamToken___block_invoke;
  v5[3] = &unk_1E9E53820;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(stateQueue, v5);
}

uint64_t __67__VCStreamOutputManager_registerStreamOutputSource_forStreamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedRegisterStreamOutputSource:forStreamToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)dispatchedRegisterStreamOutputSource:(id)a3 forStreamToken:(int64_t)a4
{
  int v4;
  void *v7;
  NSMutableDictionary *streamOutputSourceForStreamToken;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  VCStreamOutputManager *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v4 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a4);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  streamOutputSourceForStreamToken = self->_streamOutputSourceForStreamToken;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](streamOutputSourceForStreamToken, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(streamOutputSourceForStreamToken);
        v13 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamOutputSourceForStreamToken, "objectForKeyedSubscript:", v7) == v13)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCStreamOutputManager dispatchedRegisterStreamOutputSource:forStreamToken:].cold.1();
          }
          goto LABEL_23;
        }
      }
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](streamOutputSourceForStreamToken, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
      if (v10)
        continue;
      break;
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamOutputSourceForStreamToken, "setObject:forKeyedSubscript:", a3, v7);
  if ((VCStreamOutputManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136316162;
        v23 = v15;
        v24 = 2080;
        v25 = "-[VCStreamOutputManager dispatchedRegisterStreamOutputSource:forStreamToken:]";
        v26 = 1024;
        v27 = 135;
        v28 = 2048;
        v29 = a3;
        v30 = 1024;
        LODWORD(v31) = v4;
        v17 = " [%s] %s:%d Source=%p registered for streamToken=%u";
        v18 = v16;
        v19 = 44;
LABEL_22:
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, v19);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCStreamOutputManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136316674;
        v23 = v20;
        v24 = 2080;
        v25 = "-[VCStreamOutputManager dispatchedRegisterStreamOutputSource:forStreamToken:]";
        v26 = 1024;
        v27 = 135;
        v28 = 2112;
        v29 = (id)v14;
        v30 = 2048;
        v31 = self;
        v32 = 2048;
        v33 = a3;
        v34 = 1024;
        v35 = v4;
        v17 = " [%s] %s:%d %@(%p) Source=%p registered for streamToken=%u";
        v18 = v21;
        v19 = 64;
        goto LABEL_22;
      }
    }
  }
LABEL_23:

}

- (void)deregisterStreamOutputSourceForStreamToken:(int64_t)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VCStreamOutputManager_deregisterStreamOutputSourceForStreamToken___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __68__VCStreamOutputManager_deregisterStreamOutputSourceForStreamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedDeregisterStreamOutputSourceForStreamToken:", *(_QWORD *)(a1 + 40));
}

- (void)dispatchedDeregisterStreamOutputSourceForStreamToken:(int64_t)a3
{
  int v3;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *xpcCallbackQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  VCStreamOutputManager *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a3);
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamOutputSourceForStreamToken, "objectForKeyedSubscript:", v5))
  {
    if ((VCStreamOutputManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (v7 = VRTraceErrorLogLevelToCSTR(),
            v8 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_16:
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamOutputSourceForStreamToken, "setObject:forKeyedSubscript:", 0, v5);
        v16 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamOutputs, "objectForKeyedSubscript:", v5);
        if (v16)
        {
          v17 = v16;
          if (objc_msgSend(v16, "isClientInProcess"))
          {
            objc_msgSend(v17, "didInvalidate");
          }
          else
          {
            xpcCallbackQueue = self->_xpcCallbackQueue;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __78__VCStreamOutputManager_dispatchedDeregisterStreamOutputSourceForStreamToken___block_invoke;
            block[3] = &unk_1E9E521C0;
            block[4] = v17;
            dispatch_async(xpcCallbackQueue, block);
          }
        }
        goto LABEL_20;
      }
      v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_streamOutputSourceForStreamToken, "objectForKeyedSubscript:", v5);
      *(_DWORD *)buf = 136316162;
      v21 = v7;
      v22 = 2080;
      v23 = "-[VCStreamOutputManager dispatchedDeregisterStreamOutputSourceForStreamToken:]";
      v24 = 1024;
      v25 = 152;
      v26 = 2048;
      v27 = v9;
      v28 = 1024;
      LODWORD(v29) = v3;
      v10 = " [%s] %s:%d Source=%p unregistered for streamToken=%u";
      v11 = v8;
      v12 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCStreamOutputManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_16;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_streamOutputSourceForStreamToken, "objectForKeyedSubscript:", v5);
      *(_DWORD *)buf = 136316674;
      v21 = v13;
      v22 = 2080;
      v23 = "-[VCStreamOutputManager dispatchedDeregisterStreamOutputSourceForStreamToken:]";
      v24 = 1024;
      v25 = 152;
      v26 = 2112;
      v27 = (uint64_t)v6;
      v28 = 2048;
      v29 = self;
      v30 = 2048;
      v31 = v15;
      v32 = 1024;
      v33 = v3;
      v10 = " [%s] %s:%d %@(%p) Source=%p unregistered for streamToken=%u";
      v11 = v14;
      v12 = 64;
    }
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    goto LABEL_16;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCStreamOutputManager dispatchedDeregisterStreamOutputSourceForStreamToken:].cold.1();
  }
LABEL_20:

}

uint64_t __78__VCStreamOutputManager_dispatchedDeregisterStreamOutputSourceForStreamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "streamOutputDidReleaseRemoteVideoQueue", 0, *(_QWORD *)(a1 + 32));
}

- (id)allocStreamOutputWithStreamToken:(int64_t)a3 clientPid:(int)a4 options:(id)a5 errorCode:(int *)a6
{
  NSObject *stateQueue;
  void *v7;
  _QWORD block[9];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__25;
  v15 = __Block_byref_object_dispose__25;
  v16 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__VCStreamOutputManager_allocStreamOutputWithStreamToken_clientPid_options_errorCode___block_invoke;
  block[3] = &unk_1E9E56EA0;
  block[6] = &v11;
  block[7] = a3;
  v10 = a4;
  block[4] = self;
  block[5] = a5;
  block[8] = a6;
  dispatch_sync(stateQueue, block);
  v7 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __86__VCStreamOutputManager_allocStreamOutputWithStreamToken_clientPid_options_errorCode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:", *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (id)allocDispatchedStreamOutputWithStreamToken:(int64_t)a3 clientPid:(int)a4 options:(id)a5 errorCode:(int *)a6
{
  uint64_t v8;
  void *v11;
  uint64_t v12;
  void *v13;
  VCStreamOutput *v14;
  VCStreamOutput *v15;
  int v16;

  v8 = *(_QWORD *)&a4;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a3);
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamOutputs, "objectForKeyedSubscript:", v11))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:].cold.3();
    }
    v15 = 0;
    v16 = -6;
  }
  else
  {
    v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_streamOutputSourceForStreamToken, "objectForKeyedSubscript:", v11);
    if (v12)
    {
      v13 = (void *)v12;
      v14 = -[VCStreamOutput initWithStreamToken:clientProcessID:delegate:delegateQueue:]([VCStreamOutput alloc], "initWithStreamToken:clientProcessID:delegate:delegateQueue:", a3, v8, objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("vcStreamOutputInProcessDelegate")), objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("vcStreamOutputInProcessDelegateQueue")));
      if (v14)
      {
        v15 = v14;
        objc_msgSend(v13, "setStreamOutput:", v14);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamOutputs, "setObject:forKeyedSubscript:", v15, v11);
        v16 = 0;
        goto LABEL_5;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:].cold.1();
    }
    v15 = 0;
    v16 = -1;
  }
LABEL_5:
  if (a6)
    *a6 = v16;

  return v15;
}

- (BOOL)sourceExistsForStreamToken:(int64_t)a3
{
  NSObject *stateQueue;
  char v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__VCStreamOutputManager_sourceExistsForStreamToken___block_invoke;
  v6[3] = &unk_1E9E55810;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  dispatch_sync(stateQueue, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __52__VCStreamOutputManager_sourceExistsForStreamToken___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]));
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result != 0;
  return result;
}

- (id)serviceHandlerStreamOutputInitializeWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CLIENTPID"));
    if (v9)
    {
      v10 = -[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:](self, "allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:", objc_msgSend(v8, "unsignedIntValue"), objc_msgSend(v9, "intValue"), 0, &v17);
      if (v10)
      {
        v11 = v10;
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v10, CFSTR("CONTEXT"), 0);
        if (v12)
        {
          v13 = (void *)v12;
          if (self->_useFigRemoteQueue)
          {
            v14 = objc_msgSend(v11, "copyXpcSenderQueue");
            if (v14)
            {
              v15 = (void *)v14;
              objc_msgSend(v13, "setValue:forKey:", v14, CFSTR("USERXPCARGUMENTS"));
              goto LABEL_28;
            }
            v17 = -2;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCStreamOutputManager serviceHandlerStreamOutputInitializeWithArguments:error:].cold.5();
            }
          }
          v15 = 0;
LABEL_28:
          if (!v17)
            goto LABEL_31;
          goto LABEL_29;
        }
        v17 = -4;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCStreamOutputManager serviceHandlerStreamOutputInitializeWithArguments:error:].cold.4();
        }
        v15 = 0;
LABEL_23:
        v13 = 0;
        goto LABEL_28;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCStreamOutputManager serviceHandlerStreamOutputInitializeWithArguments:error:].cold.3();
      }
LABEL_18:
      v15 = 0;
      v11 = 0;
      goto LABEL_23;
    }
    v17 = -3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamOutputManager serviceHandlerStreamOutputInitializeWithArguments:error:].cold.2();
      goto LABEL_18;
    }
  }
  else
  {
    v17 = -3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamOutputManager serviceHandlerStreamOutputInitializeWithArguments:error:].cold.1();
      goto LABEL_18;
    }
  }
  v13 = 0;
  v11 = 0;
  v15 = 0;
LABEL_29:
  -[VCStreamOutputManager dispatchedCleanupStreamOutput:](self, "dispatchedCleanupStreamOutput:", v11);
  if (a4)
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCStreamOutputManager"), v17, 0);
LABEL_31:

  if (v15)
    xpc_release(v15);
  return v13;
}

- (id)serviceHandlerStreamOutputNotifyCacheWithArguments:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  uint64_t v8;

  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", objc_msgSend(v5, "streamToken"));
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "notifyCachedStateForStreamToken:", v6);
      goto LABEL_4;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamOutputManager serviceHandlerStreamOutputNotifyCacheWithArguments:error:].cold.2();
    }
    v8 = -7;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamOutputManager serviceHandlerStreamOutputNotifyCacheWithArguments:error:].cold.1();
    }
    v8 = -6;
  }
  if (a4)
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCStreamOutputManager"), v8, 0);
LABEL_4:

  return 0;
}

- (id)serviceHandlerStreamOutputTerminateWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v11;

  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
      -[VCStreamOutputManager serviceHandlerStreamOutputTerminateWithArguments:error:].cold.1();
      if (!a4)
        goto LABEL_10;
    }
    else if (!a4)
    {
      goto LABEL_10;
    }
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCStreamOutputManager"), -6, 0);
    v9 = 0;
    *a4 = v11;
    return v9;
  }
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    v9 = 0;
    return v9;
  }
  -[VCStreamOutputManager dispatchedCleanupStreamOutput:](self, "dispatchedCleanupStreamOutput:", v7);
  v8 = objc_alloc(MEMORY[0x1E0C99D80]);
  v9 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
  return v9;
}

- (void)registerBlocksForService
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__VCStreamOutputManager_registerBlocksForService__block_invoke;
  v7[3] = &unk_1E9E53848;
  v7[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "streamOutputInitialize", v7, self->_stateQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __49__VCStreamOutputManager_registerBlocksForService__block_invoke_2;
  v6[3] = &unk_1E9E53848;
  v6[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "streamOutputTerminate", v6, self->_stateQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", v4, 3221225472, __49__VCStreamOutputManager_registerBlocksForService__block_invoke_3, &unk_1E9E53848, v3), "registerBlockForService:block:queue:", "streamOutputCachedNotifications", &v5, self->_stateQueue);
}

id __49__VCStreamOutputManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    v6 = 0;
  else
    v6 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "serviceHandlerStreamOutputInitializeWithArguments:error:", a2, a3);
  return v6;
}

id __49__VCStreamOutputManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  else
    return (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "serviceHandlerStreamOutputTerminateWithArguments:error:", a2, a3);
}

uint64_t __49__VCStreamOutputManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  else
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "serviceHandlerStreamOutputNotifyCacheWithArguments:error:", a2, a3);
}

- (void)deregisterBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "streamOutputInitialize");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "streamOutputTerminate");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "streamOutputCachedNotifications");
}

- (void)dispatchedRemoteMediaDidStall:(BOOL)a3 streamToken:(int64_t)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *xpcCallbackQueue;
  _QWORD block[7];

  v4 = a3;
  block[6] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a4);
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamOutputs, "objectForKeyedSubscript:", v6);
  if (objc_msgSend(v7, "isClientInProcess"))
  {
    objc_msgSend(v7, "didStall:", v4);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v4);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("conferenceIsRemoteMediaStalled"), 0);
    xpcCallbackQueue = self->_xpcCallbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__VCStreamOutputManager_dispatchedRemoteMediaDidStall_streamToken___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = v7;
    block[5] = v9;
    dispatch_async(xpcCallbackQueue, block);

  }
}

uint64_t __67__VCStreamOutputManager_dispatchedRemoteMediaDidStall_streamToken___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "streamOutputDidRemoteMediaStall", *(_QWORD *)(result + 40), *(_QWORD *)(result + 32));
  return result;
}

- (void)dispatchedRemoteVideoDidDegrade:(BOOL)a3 streamToken:(int64_t)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *xpcCallbackQueue;
  _QWORD block[7];

  v4 = a3;
  block[6] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a4);
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamOutputs, "objectForKeyedSubscript:", v6);
  if (objc_msgSend(v7, "isClientInProcess"))
  {
    objc_msgSend(v7, "didDegrade:", v4);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v4);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("conferenceIsVideoDegraded"), 0);
    xpcCallbackQueue = self->_xpcCallbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__VCStreamOutputManager_dispatchedRemoteVideoDidDegrade_streamToken___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = v7;
    block[5] = v9;
    dispatch_async(xpcCallbackQueue, block);

  }
}

uint64_t __69__VCStreamOutputManager_dispatchedRemoteVideoDidDegrade_streamToken___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "streamOutputDidVideoDegrade", *(_QWORD *)(result + 40), *(_QWORD *)(result + 32));
  return result;
}

- (void)dispatchedRemoteVideoDidPause:(BOOL)a3 streamToken:(int64_t)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *xpcCallbackQueue;
  _QWORD block[7];

  v4 = a3;
  block[6] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a4);
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamOutputs, "objectForKeyedSubscript:", v6);
  if (objc_msgSend(v7, "isClientInProcess"))
  {
    objc_msgSend(v7, "didPause:", v4);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v4);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("conferenceVideoPause"), 0);
    xpcCallbackQueue = self->_xpcCallbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__VCStreamOutputManager_dispatchedRemoteVideoDidPause_streamToken___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = v7;
    block[5] = v9;
    dispatch_async(xpcCallbackQueue, block);

  }
}

uint64_t __67__VCStreamOutputManager_dispatchedRemoteVideoDidPause_streamToken___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "streamOutputDidRemoteVideoPause", *(_QWORD *)(result + 40), *(_QWORD *)(result + 32));
  return result;
}

- (void)dispatchedRemoteVideoDidSuspend:(BOOL)a3 streamToken:(int64_t)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *xpcCallbackQueue;
  _QWORD block[7];

  v4 = a3;
  block[6] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a4);
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamOutputs, "objectForKeyedSubscript:", v6);
  if (objc_msgSend(v7, "isClientInProcess"))
  {
    objc_msgSend(v7, "didSuspend:", v4);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v4);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("conferenceIsVideoSuspended"), 0);
    xpcCallbackQueue = self->_xpcCallbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__VCStreamOutputManager_dispatchedRemoteVideoDidSuspend_streamToken___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = v7;
    block[5] = v9;
    dispatch_async(xpcCallbackQueue, block);

  }
}

uint64_t __69__VCStreamOutputManager_dispatchedRemoteVideoDidSuspend_streamToken___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "streamOutputDidVideoSuspend", *(_QWORD *)(result + 40), *(_QWORD *)(result + 32));
  return result;
}

- (void)remoteMediaDidStall:(BOOL)a3 streamToken:(int64_t)a4
{
  NSObject *stateQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__VCStreamOutputManager_remoteMediaDidStall_streamToken___block_invoke;
  v5[3] = &unk_1E9E529D8;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(stateQueue, v5);
}

uint64_t __57__VCStreamOutputManager_remoteMediaDidStall_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedRemoteMediaDidStall:streamToken:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)remoteVideoDidPause:(BOOL)a3 streamToken:(int64_t)a4
{
  NSObject *stateQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__VCStreamOutputManager_remoteVideoDidPause_streamToken___block_invoke;
  v5[3] = &unk_1E9E529D8;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(stateQueue, v5);
}

uint64_t __57__VCStreamOutputManager_remoteVideoDidPause_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedRemoteVideoDidPause:streamToken:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)remoteVideoDidSuspend:(BOOL)a3 streamToken:(int64_t)a4
{
  NSObject *stateQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__VCStreamOutputManager_remoteVideoDidSuspend_streamToken___block_invoke;
  v5[3] = &unk_1E9E529D8;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(stateQueue, v5);
}

uint64_t __59__VCStreamOutputManager_remoteVideoDidSuspend_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedRemoteVideoDidSuspend:streamToken:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)remoteVideoDidDegrade:(BOOL)a3 streamToken:(int64_t)a4
{
  NSObject *stateQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__VCStreamOutputManager_remoteVideoDidDegrade_streamToken___block_invoke;
  v5[3] = &unk_1E9E529D8;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(stateQueue, v5);
}

uint64_t __59__VCStreamOutputManager_remoteVideoDidDegrade_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedRemoteVideoDidDegrade:streamToken:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)init
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate _streamOutputs dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedRegisterStreamOutputSource:forStreamToken:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCStreamOutputManager dispatchedRegisterStreamOutputSource:forStreamToken:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d This streamOutputSource has already been registered with streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[VCStreamOutputManager dispatchedRegisterStreamOutputSource:forStreamToken:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedDeregisterStreamOutputSourceForStreamToken:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCStreamOutputManager dispatchedDeregisterStreamOutputSourceForStreamToken:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d StreamToken was not registered:%u", v2, *(const char **)v3, (unint64_t)"-[VCStreamOutputManager dispatchedDeregisterStreamOutputSourceForStreamToken:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d No streamOutputSource registered for streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create stream output for streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stream output already registered", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerStreamOutputInitializeWithArguments:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Call ID argument is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerStreamOutputInitializeWithArguments:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Client process ID argument is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerStreamOutputInitializeWithArguments:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create output stream for streamToken=%@");
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerStreamOutputInitializeWithArguments:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to allocate memory for dictionary. streamToken=%@");
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerStreamOutputInitializeWithArguments:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid sender queue for streamToken=%@");
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerStreamOutputNotifyCacheWithArguments:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to get context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerStreamOutputNotifyCacheWithArguments:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerStreamOutputTerminateWithArguments:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to get context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
