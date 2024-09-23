@implementation VCCaptionsManager

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_13);
  return (id)defaultManager__vcCaptionsManager;
}

void __35__VCCaptionsManager_defaultManager__block_invoke()
{
  if (!defaultManager__vcCaptionsManager)
    defaultManager__vcCaptionsManager = objc_alloc_init(VCCaptionsManager);
}

- (VCCaptionsManager)init
{
  VCCaptionsManager *v2;
  NSObject *CustomRootQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCCaptionsManager;
  v2 = -[VCCaptionsManager init](&v5, sel_init);
  if (v2)
  {
    v2->_streamTokenList = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_connection = objc_alloc_init(AVConferenceXPCClient);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCCaptionsManager.xpcCommandQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCCaptionsManager deregisterBlocksForService](self, "deregisterBlocksForService");
  dispatch_release((dispatch_object_t)self->_xpcCommandQueue);

  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsManager;
  -[VCCaptionsManager dealloc](&v3, sel_dealloc);
}

- (void)registerCaptionsSource:(id)a3 streamToken:(int64_t)a4
{
  NSObject *xpcCommandQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__VCCaptionsManager_registerCaptionsSource_streamToken___block_invoke;
  v5[3] = &unk_1E9E53820;
  v5[5] = a3;
  v5[6] = a4;
  v5[4] = self;
  dispatch_async(xpcCommandQueue, v5);
}

void __56__VCCaptionsManager_registerCaptionsSource_streamToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  VCCaptionsManagerStreamTokenClientList *v5;

  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v2))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __56__VCCaptionsManager_registerCaptionsSource_streamToken___block_invoke_cold_1(v3, (uint64_t *)(a1 + 48), v4);
    }
  }
  v5 = -[VCCaptionsManagerStreamTokenClientList initWithStreamToken:captionsSource:]([VCCaptionsManagerStreamTokenClientList alloc], "initWithStreamToken:captionsSource:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v5, v2);
  objc_msgSend(*(id *)(a1 + 40), "registerCaptionsEventDelegate:", *(_QWORD *)(a1 + 32));

}

- (void)unregisterCaptionsSourceWithStreamToken:(int64_t)a3
{
  NSObject *xpcCommandQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__VCCaptionsManager_unregisterCaptionsSourceWithStreamToken___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(xpcCommandQueue, block);
}

uint64_t __61__VCCaptionsManager_unregisterCaptionsSourceWithStreamToken___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v2), "captionsSource"), "registerCaptionsEventDelegate:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", v2);
}

- (id)captionsSourceFromClientContext:(id)a3
{
  int64_t v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  if (!+[VCCaptionsManagerStreamTokenClientList isValidContext:](VCCaptionsManagerStreamTokenClientList, "isValidContext:", a3))return 0;
  v5 = +[VCCaptionsManagerStreamTokenClientList streamTokenFromClientContext:](VCCaptionsManagerStreamTokenClientList, "streamTokenFromClientContext:", a3);
  return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenList, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5)), "captionsSource");
}

- (id)deserializeLocale:(id)a3 withError:(id *)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  objc_class *v12;
  const char *Name;
  const __CFString *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("vcCaptionsLocale"));
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (v9 = VRTraceErrorLogLevelToCSTR(),
          v10 = *MEMORY[0x1E0CF2758],
          os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
      -[VCCaptionsManager deserializeLocale:withError:].cold.1(v9, v5, v10);
      if (!a4)
        return 0;
    }
    else if (!a4)
    {
      return 0;
    }
    goto LABEL_12;
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, a4);
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (v7 = VRTraceErrorLogLevelToCSTR(),
          v8 = *MEMORY[0x1E0CF2758],
          os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
      v12 = (objc_class *)objc_opt_class();
      Name = class_getName(v12);
      if (a4)
        v14 = (const __CFString *)*a4;
      else
        v14 = CFSTR("nil");
      v15 = 136316418;
      v16 = v7;
      v17 = 2080;
      v18 = "-[VCCaptionsManager deserializeLocale:withError:]";
      v19 = 1024;
      v20 = 184;
      v21 = 2112;
      v22 = v6;
      v23 = 2080;
      v24 = Name;
      v25 = 2112;
      v26 = v14;
      _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d deserializedLocale not deserialized into NSLocale, deserializedLocale=%@, class=%s, error=%@", (uint8_t *)&v15, 0x3Au);
      if (!a4)
        return 0;
    }
    else if (!a4)
    {
      return 0;
    }
LABEL_12:
    v6 = 0;
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCCaptionsManager"), -5, 0);
  }
  return v6;
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
  v9[2] = __45__VCCaptionsManager_registerBlocksForService__block_invoke;
  v9[3] = &unk_1E9E53848;
  v9[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcCaptionsClientInitialize", v9, self->_xpcCommandQueue);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __45__VCCaptionsManager_registerBlocksForService__block_invoke_60;
  v8[3] = &unk_1E9E53848;
  v8[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcCaptionsClientUninitialize", v8, self->_xpcCommandQueue);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __45__VCCaptionsManager_registerBlocksForService__block_invoke_63;
  v7[3] = &unk_1E9E53848;
  v7[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcCaptionsSetCaptionsConfiguration", v7, self->_xpcCommandQueue);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __45__VCCaptionsManager_registerBlocksForService__block_invoke_2;
  v6[3] = &unk_1E9E53848;
  v6[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcCaptionsGetCaptionsEnabled", v6, self->_xpcCommandQueue);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __45__VCCaptionsManager_registerBlocksForService__block_invoke_3;
  v5[3] = &unk_1E9E53848;
  v5[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcCaptionsGetCaptionsSupported", v5, self->_xpcCommandQueue);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __45__VCCaptionsManager_registerBlocksForService__block_invoke_4;
  v4[3] = &unk_1E9E53848;
  v4[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcCaptionsSetCaptionsEnabled", v4, self->_xpcCommandQueue);
}

uint64_t __45__VCCaptionsManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v6;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKey:", CFSTR("CLIENTDIED")))
    return 0;
  v8 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("vcCaptionsStreamToken"));
  if (!v8)
  {
    if (!a3)
      return 0;
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = -4;
LABEL_17:
    v6 = 0;
    *a3 = objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("VCCaptionsManager"), v16, 0);
    return v6;
  }
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9));
  if (!v10)
  {
    if (!a3)
      return 0;
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = -1;
    goto LABEL_17;
  }
  v11 = objc_msgSend(v10, "newContext");
  if (!v11)
  {
    if (a3)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = -3;
      goto LABEL_17;
    }
    return 0;
  }
  v12 = (void *)v11;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v11, CFSTR("CONTEXT"), 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = v13;
      v19 = 2080;
      v20 = "-[VCCaptionsManager registerBlocksForService]_block_invoke";
      v21 = 1024;
      v22 = 226;
      v23 = 2048;
      v24 = v12;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCCaptionsManager: New captions client. Context=0x%p", buf, 0x26u);
    }
  }

  return v6;
}

uint64_t __45__VCCaptionsManager_registerBlocksForService__block_invoke_60(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKey:", CFSTR("CLIENTDIED")))
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D80]);
    v4 = objc_msgSend(v5, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
  }
  v6 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  if (+[VCCaptionsManagerStreamTokenClientList isValidContext:](VCCaptionsManagerStreamTokenClientList, "isValidContext:", v6))
  {
    v7 = +[VCCaptionsManagerStreamTokenClientList streamTokenFromClientContext:](VCCaptionsManagerStreamTokenClientList, "streamTokenFromClientContext:", v6);
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7)), "removeContext:", v6);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v12 = v8;
        v13 = 2080;
        v14 = "-[VCCaptionsManager registerBlocksForService]_block_invoke";
        v15 = 1024;
        v16 = 245;
        v17 = 2048;
        v18 = v6;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCCaptionsManager: Unregister captions client. Context=0x%p", buf, 0x26u);
      }
    }
  }
  return v4;
}

uint64_t __45__VCCaptionsManager_registerBlocksForService__block_invoke_63(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (!objc_msgSend(a2, "objectForKey:", CFSTR("CLIENTDIED")))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "captionsSourceFromClientContext:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(*(id *)(a1 + 32), "deserializeLocale:withError:", a2, a3);
      if (v9)
        objc_msgSend(v8, "setCaptionsLocale:", v9);
      v10 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcCaptionsUsage"));
      if (v10)
        objc_msgSend(v8, "setCaptionsUsage:", v10);
    }
    else if (a3)
    {
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCCaptionsManager"), -2, 0);
    }
  }
  return 0;
}

uint64_t __45__VCCaptionsManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v7;
  void *v8;
  uint64_t v9;

  if (objc_msgSend(a2, "objectForKey:", CFSTR("CLIENTDIED")))
    return 0;
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "captionsSourceFromClientContext:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")));
  if (!v7)
  {
    if (a3)
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCCaptionsManager"), -2, 0);
    return 0;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v7, "captionsEnabled"));
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("vcCaptionsEnabled"), 0);

  return v9;
}

uint64_t __45__VCCaptionsManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v7;
  void *v8;
  uint64_t v9;

  if (objc_msgSend(a2, "objectForKey:", CFSTR("CLIENTDIED")))
    return 0;
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "captionsSourceFromClientContext:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")));
  if (!v7)
  {
    if (a3)
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCCaptionsManager"), -2, 0);
    return 0;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v7, "captionsSupported"));
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("vcCaptionsSupported"), 0);

  return v9;
}

uint64_t __45__VCCaptionsManager_registerBlocksForService__block_invoke_4(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if (!objc_msgSend(a2, "objectForKey:", CFSTR("CLIENTDIED")))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "captionsSourceFromClientContext:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("vcCaptionsEnable"));
      if (v9)
      {
        objc_msgSend(v8, "enableCaptions:", objc_msgSend(v9, "BOOLValue"));
        return 0;
      }
      if (!a3)
        return 0;
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = -6;
    }
    else
    {
      if (!a3)
        return 0;
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = -2;
    }
    *a3 = objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("VCCaptionsManager"), v11, 0);
  }
  return 0;
}

- (void)deregisterBlocksForService
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcCaptionsClientInitialize");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcCaptionsClientUninitialize");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcCaptionsSetCaptionsConfiguration");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcCaptionsGetCaptionsEnabled");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcCaptionsGetCaptionsSupported");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcCaptionsSetCaptionsEnabled");
}

- (void)notifyClientsWithStreamToken:(int64_t)a3 service:(char *)a4 arguments:(id)a5
{
  NSObject *xpcCommandQueue;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VCCaptionsManager_notifyClientsWithStreamToken_service_arguments___block_invoke;
  block[3] = &unk_1E9E53870;
  block[6] = a3;
  block[7] = a4;
  block[4] = self;
  block[5] = a5;
  dispatch_async(xpcCommandQueue, block);
}

void *__68__VCCaptionsManager_notifyClientsWithStreamToken_service_arguments___block_invoke(_QWORD *a1)
{
  void *result;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = (void *)objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]));
  if (result)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (void *)objc_msgSend(result, "clientContextList");
    result = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", a1[7], a1[5], *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6));
          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        result = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)streamToken:(int64_t)a3 didEnableCaptions:(BOOL)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", a4);
  if (a5)
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a5, 1, 0);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v13, CFSTR("vcCaptionsEnabled"), v8, CFSTR("vcCaptionsError"), 0);
  }
  else
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v13, CFSTR("vcCaptionsEnabled"), 0, v11, v12);
  }
  v10 = (void *)v9;
  -[VCCaptionsManager notifyClientsWithStreamToken:service:arguments:](self, "notifyClientsWithStreamToken:service:arguments:", a3, "vcCaptionsDidEnableCaptions", v9);

}

- (void)streamToken:(int64_t)a3 didDisableCaptions:(BOOL)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", a4);
  if (a5)
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a5, 1, 0);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v13, CFSTR("vcCaptionsDisabled"), v8, CFSTR("vcCaptionsError"), 0);
  }
  else
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v13, CFSTR("vcCaptionsDisabled"), 0, v11, v12);
  }
  v10 = (void *)v9;
  -[VCCaptionsManager notifyClientsWithStreamToken:service:arguments:](self, "notifyClientsWithStreamToken:service:arguments:", a3, "vcCaptionsDidDisableCaptions", v9);

}

- (void)streamToken:(int64_t)a3 didStartCaptioningWithReason:(unsigned __int8)a4
{
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", a4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcCaptionsStartReason"), 0);
  -[VCCaptionsManager notifyClientsWithStreamToken:service:arguments:](self, "notifyClientsWithStreamToken:service:arguments:", a3, "vcCaptionsDidCaptionsStart", v6);

}

- (void)streamToken:(int64_t)a3 didStopCaptioningWithReason:(unsigned __int8)a4
{
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", a4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcCaptionsStopReason"), 0);
  -[VCCaptionsManager notifyClientsWithStreamToken:service:arguments:](self, "notifyClientsWithStreamToken:service:arguments:", a3, "vcCaptionsDidCaptionsEnd", v6);

}

- (void)streamToken:(int64_t)a3 didUpdateCaptions:(id)a4
{
  uint64_t v6;
  id v7;

  v6 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a4, 1, 0);
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("vcCaptionsTranscription"), 0);
  -[VCCaptionsManager notifyClientsWithStreamToken:service:arguments:](self, "notifyClientsWithStreamToken:service:arguments:", a3, "vcCaptionsDidUpdateCaptions", v7);

}

- (void)streamToken:(int64_t)a3 didDetectGibberish:(BOOL)a4
{
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", a4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcCaptionsGibberish"), 0);
  -[VCCaptionsManager notifyClientsWithStreamToken:service:arguments:](self, "notifyClientsWithStreamToken:service:arguments:", a3, "vcCaptionsDidDetectGibberish", v6);

}

void __56__VCCaptionsManager_registerCaptionsSource_streamToken___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCCaptionsManager registerCaptionsSource:streamToken:]_block_invoke";
  v8 = 1024;
  v9 = 140;
  v10 = 1024;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCCaptionsManager: Context already exists for stream token: %u", (uint8_t *)&v4, 0x22u);
}

- (void)deserializeLocale:(NSObject *)a3 withError:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *Name;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  v7 = 136316162;
  v8 = a1;
  v9 = 2080;
  v10 = "-[VCCaptionsManager deserializeLocale:withError:]";
  v11 = 1024;
  v12 = 176;
  v13 = 2112;
  v14 = a2;
  v15 = 2080;
  Name = class_getName(v6);
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d serializedLocale not present serializedLocale=%@, class=%s", (uint8_t *)&v7, 0x30u);
}

@end
