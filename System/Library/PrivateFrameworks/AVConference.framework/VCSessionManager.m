@implementation VCSessionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_32);
  return (id)sharedInstance__vcSessionManager;
}

void __34__VCSessionManager_sharedInstance__block_invoke()
{
  if (!sharedInstance__vcSessionManager)
    sharedInstance__vcSessionManager = objc_alloc_init(VCSessionManager);
}

+ (void)addNSError:(id)a3 toXPCArgumentDictionary:(id)a4
{
  id v6;

  if (a3)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    if (objc_msgSend(a3, "domain"))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "domain"), CFSTR("ERROR_DOMAIN"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "code")), CFSTR("ERROR_CODE"));
    if (objc_msgSend(a3, "userInfo"))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "userInfo"), CFSTR("ERROR_USERINFO"));
    objc_msgSend(a4, "setObject:forKeyedSubscript:", v6, CFSTR("vcSessionError"));

  }
}

- (VCSessionManager)init
{
  VCSessionManager *v2;
  NSObject *CustomRootQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCSessionManager;
  v2 = -[VCSessionManager init](&v5, sel_init);
  if (v2)
  {
    v2->_sessions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSessionManager.xpcCommandQueue", 0, CustomRootQueue);
    v2->_sessionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSessionManager.sessionQueue", MEMORY[0x1E0C80D50], CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *xpcCommandQueue;
  NSObject *sessionQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[VCSessionManager deregisterBlocksForService](self, "deregisterBlocksForService");

  xpcCommandQueue = self->_xpcCommandQueue;
  if (xpcCommandQueue)
  {
    dispatch_release(xpcCommandQueue);
    self->_xpcCommandQueue = 0;
  }
  sessionQueue = self->_sessionQueue;
  if (sessionQueue)
  {
    dispatch_release(sessionQueue);
    self->_sessionQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)VCSessionManager;
  -[VCSessionManager dealloc](&v5, sel_dealloc);
}

- (id)sessionForUUID:(id)a3
{
  NSObject *xpcCommandQueue;
  void *v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = 0;
  xpcCommandQueue = self->_xpcCommandQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__VCSessionManager_sessionForUUID___block_invoke;
  v6[3] = &unk_1E9E527A8;
  v6[5] = a3;
  v6[6] = &v7;
  v6[4] = self;
  dispatch_sync(xpcCommandQueue, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __35__VCSessionManager_sessionForUUID___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (id)sessionForStreamToken:(unsigned int)a3
{
  NSObject *xpcCommandQueue;
  void *v4;
  _QWORD v6[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  xpcCommandQueue = self->_xpcCommandQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__VCSessionManager_sessionForStreamToken___block_invoke;
  v6[3] = &unk_1E9E54D70;
  v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(xpcCommandQueue, v6);
  v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __42__VCSessionManager_sessionForStreamToken___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = *(_DWORD *)(a1 + 48);
        result = objc_msgSend(v7, "transportSessionID");
        if (v8 == (_DWORD)result)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v7;
          return result;
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (void)setSharingEnabled:(BOOL)a3
{
  NSObject *xpcCommandQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__VCSessionManager_setSharingEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(xpcCommandQueue, block);
}

void __38__VCSessionManager_setSharingEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = objc_opt_class();
  v5 = *(_QWORD *)(a1 + 32);
  if (v2 != v3)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(unsigned __int8 *)(a1 + 40);
          *(_DWORD *)buf = 136315906;
          v39 = v14;
          v40 = 2080;
          v41 = "-[VCSessionManager setSharingEnabled:]_block_invoke";
          v42 = 1024;
          v43 = 108;
          v44 = 1024;
          LODWORD(v45) = v16;
          v17 = " [%s] %s:%d changing _isSharingEnabled to %d";
          v18 = v15;
          v19 = 34;
LABEL_23:
          _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v26 = *(_QWORD *)(a1 + 32);
          v27 = *(unsigned __int8 *)(a1 + 40);
          *(_DWORD *)buf = 136316418;
          v39 = v24;
          v40 = 2080;
          v41 = "-[VCSessionManager setSharingEnabled:]_block_invoke";
          v42 = 1024;
          v43 = 108;
          v44 = 2112;
          v45 = v7;
          v46 = 2048;
          v47 = v26;
          v48 = 1024;
          v49 = v27;
          v17 = " [%s] %s:%d %@(%p) changing _isSharingEnabled to %d";
          v18 = v25;
          v19 = 54;
          goto LABEL_23;
        }
      }
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = *(_BYTE *)(a1 + 40);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v28 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v35 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "setSharingEnabled:", *(unsigned __int8 *)(a1 + 40));
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
      }
      while (v30);
    }
    return;
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v39 = v8;
        v40 = 2080;
        v41 = "-[VCSessionManager setSharingEnabled:]_block_invoke";
        v42 = 1024;
        v43 = 115;
        v44 = 1024;
        LODWORD(v45) = v10;
        v11 = " [%s] %s:%d _isSharingEnabled already set to %d";
        v12 = v9;
        v13 = 34;
LABEL_18:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v39 = v20;
        v40 = 2080;
        v41 = "-[VCSessionManager setSharingEnabled:]_block_invoke";
        v42 = 1024;
        v43 = 115;
        v44 = 2112;
        v45 = v6;
        v46 = 2048;
        v47 = v22;
        v48 = 1024;
        v49 = v23;
        v11 = " [%s] %s:%d %@(%p) _isSharingEnabled already set to %d";
        v12 = v21;
        v13 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (void)setScreenAndCameraMixingEnabled:(BOOL)a3
{
  NSObject *xpcCommandQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__VCSessionManager_setScreenAndCameraMixingEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(xpcCommandQueue, block);
}

void __52__VCSessionManager_setScreenAndCameraMixingEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 33);
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = objc_opt_class();
  v5 = *(_QWORD *)(a1 + 32);
  if (v2 != v3)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(unsigned __int8 *)(a1 + 40);
          *(_DWORD *)buf = 136315906;
          v39 = v14;
          v40 = 2080;
          v41 = "-[VCSessionManager setScreenAndCameraMixingEnabled:]_block_invoke";
          v42 = 1024;
          v43 = 123;
          v44 = 1024;
          LODWORD(v45) = v16;
          v17 = " [%s] %s:%d changing _screenAndCameraMixingEnabled to %d";
          v18 = v15;
          v19 = 34;
LABEL_23:
          _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v26 = *(_QWORD *)(a1 + 32);
          v27 = *(unsigned __int8 *)(a1 + 40);
          *(_DWORD *)buf = 136316418;
          v39 = v24;
          v40 = 2080;
          v41 = "-[VCSessionManager setScreenAndCameraMixingEnabled:]_block_invoke";
          v42 = 1024;
          v43 = 123;
          v44 = 2112;
          v45 = v7;
          v46 = 2048;
          v47 = v26;
          v48 = 1024;
          v49 = v27;
          v17 = " [%s] %s:%d %@(%p) changing _screenAndCameraMixingEnabled to %d";
          v18 = v25;
          v19 = 54;
          goto LABEL_23;
        }
      }
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = *(_BYTE *)(a1 + 40);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v28 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v35 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "setScreenAndCameraMixingEnabled:", *(unsigned __int8 *)(a1 + 40));
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
      }
      while (v30);
    }
    return;
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v39 = v8;
        v40 = 2080;
        v41 = "-[VCSessionManager setScreenAndCameraMixingEnabled:]_block_invoke";
        v42 = 1024;
        v43 = 130;
        v44 = 1024;
        LODWORD(v45) = v10;
        v11 = " [%s] %s:%d _screenAndCameraMixingEnabled already set to %d";
        v12 = v9;
        v13 = 34;
LABEL_18:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v39 = v20;
        v40 = 2080;
        v41 = "-[VCSessionManager setScreenAndCameraMixingEnabled:]_block_invoke";
        v42 = 1024;
        v43 = 130;
        v44 = 2112;
        v45 = v6;
        v46 = 2048;
        v47 = v22;
        v48 = 1024;
        v49 = v23;
        v11 = " [%s] %s:%d %@(%p) _screenAndCameraMixingEnabled already set to %d";
        v12 = v21;
        v13 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (void)vcSession:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  uint64_t v8;

  v6 = a4;
  if (a4)
    kdebug_trace();
  v8 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6), CFSTR("vcSessionStarted"), 0);
  +[VCSessionManager addNSError:toXPCArgumentDictionary:](VCSessionManager, "addNSError:toXPCArgumentDictionary:", a5, v8);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionDidStart", v8, a3);
}

- (void)vcSession:(id)a3 didStopWithError:(id)a4
{
  void *v6;

  kdebug_trace();
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  if (a4)
    +[VCSessionManager addNSError:toXPCArgumentDictionary:](VCSessionManager, "addNSError:toXPCArgumentDictionary:", a4, v6);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "transportMetadata"), CFSTR("vcSessionDidStopMetadata"));
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionDidStop", v6, a3);
}

- (void)vcSession:(id)a3 uplinkRateAdaptationDidChangeWithInfo:(id)a4
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionUplinkRateAdaptationInfoDidChange", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", a4, CFSTR("vcSessionParameterRateAdaptationInfo"), 0), a3);
}

- (void)vcSession:(id)a3 downlinkRateAdaptationDidChangeWithInfo:(id)a4
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionDownlinkRateAdaptationInfoDidChange", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", a4, CFSTR("vcSessionParameterRateAdaptationInfo"), 0), a3);
}

- (void)vcSession:(id)a3 addParticipantWithID:(id)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a5;
  v10 = (void *)objc_msgSend(a3, "participantForID:", a4);
  objc_msgSend(v10, "participantVideoToken");
  objc_msgSend(v10, "idsParticipantID");
  kdebug_trace();
  v11 = (void *)objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "newNSDictionaryWidthNSDictionary:", objc_msgSend(v10, "participantStreamTokens"));
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7), CFSTR("vcSessionSucceeded"), a4, CFSTR("vcSessionParticipantID"), v11, CFSTR("vcSessionParameterStreamTokens"), 0);
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "newNSDictionaryWidthNSDictionary:", objc_msgSend(v10, "participantSpatialAudioSourceIDs"));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("vcSessionSpatialSourceIDs"));

    }
  }

  +[VCSessionManager addNSError:toXPCArgumentDictionary:](VCSessionManager, "addNSError:toXPCArgumentDictionary:", a6, v12);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionAddParticipantDidSuceed", v12, a3);
}

- (void)vcSession:(id)a3 removeParticipantWithID:(id)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  uint64_t v8;

  v8 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5), CFSTR("vcSessionSucceeded"), a4, CFSTR("vcSessionParticipantID"), 0);
  +[VCSessionManager addNSError:toXPCArgumentDictionary:](VCSessionManager, "addNSError:toXPCArgumentDictionary:", a6, v8);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionRemoveParticipantDidSucceed", v8, a3);
}

- (void)vcSession:(id)a3 updateConfiguration:(id)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  uint64_t v8;

  v8 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5), CFSTR("vcSessionSucceeded"), a4, CFSTR("vcSessionConfiguration"), 0);
  +[VCSessionManager addNSError:toXPCArgumentDictionary:](VCSessionManager, "addNSError:toXPCArgumentDictionary:", a6, v8);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionDidUpdateConfiguration", v8, a3);
}

- (void)vcSession:(id)a3 oneToOneModeEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v7 = a4;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5);
  v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("vcSessionSucceeded"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7), CFSTR("vcSessionOneOnOneModeEnabled"), 0);
  +[VCSessionManager addNSError:toXPCArgumentDictionary:](VCSessionManager, "addNSError:toXPCArgumentDictionary:", a6, v11);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionSetOneToOneEnabledDidChange", v11, a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 audioEnabled:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = a6;
  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5);
  v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", CFSTR("vcSessionAudioEnabledDidSucceed"), CFSTR("vcServiceType"), a4, CFSTR("vcSessionParticipantID"), v12, CFSTR("vcSessionParameterAudioEnabled"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8), CFSTR("vcSessionSucceeded"), 0);
  +[VCSessionManager addNSError:toXPCArgumentDictionary:](VCSessionManager, "addNSError:toXPCArgumentDictionary:", a7, v13);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionAudioEnabledDidSucceed", v13, a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 videoEnabled:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = a6;
  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5);
  v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", CFSTR("vcSessionVideoEnabledDidSucceed"), CFSTR("vcServiceType"), a4, CFSTR("vcSessionParticipantID"), v12, CFSTR("vcSessionParameterVideoEnabled"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8), CFSTR("vcSessionSucceeded"), 0);
  +[VCSessionManager addNSError:toXPCArgumentDictionary:](VCSessionManager, "addNSError:toXPCArgumentDictionary:", a7, v13);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionVideoEnabledDidSucceed", v13, a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 screenEnabled:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = a6;
  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5);
  v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", CFSTR("vcSessionScreenEnabledDidSucceed"), CFSTR("vcServiceType"), a4, CFSTR("vcSessionParticipantID"), v12, CFSTR("vcSessionParameterScreenEnabled"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8), CFSTR("vcSessionSucceeded"), 0);
  +[VCSessionManager addNSError:toXPCArgumentDictionary:](VCSessionManager, "addNSError:toXPCArgumentDictionary:", a7, v13);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionScreenEnabledDidSucceed", v13, a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 remoteAudioEnabledDidChange:(BOOL)a5
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionRemoteAudioEnabledDidChange", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("vcSessionRemoteAudioEnabledDidChange"), CFSTR("vcServiceType"), a4, CFSTR("vcSessionParticipantID"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5), CFSTR("vcSessionParameterAudioEnabled"), 0), a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 remoteVideoEnabledDidChange:(BOOL)a5
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionRemoteVideoEnabledDidChange", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("vcSessionRemoteVideoEnabledDidChange"), CFSTR("vcServiceType"), a4, CFSTR("vcSessionParticipantID"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5), CFSTR("vcSessionParameterVideoEnabled"), 0), a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 remoteScreenEnabledDidChange:(BOOL)a5
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionRemoteScreenEnabledDidChange", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("vcSessionRemoteScreenEnabledDidChange"), CFSTR("vcServiceType"), a4, CFSTR("vcSessionParticipantID"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5), CFSTR("vcSessionParameterScreenEnabled"), 0), a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 audioPaused:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = a6;
  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5);
  v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", CFSTR("vcSessionAudioPausedDidSucceed"), CFSTR("vcServiceType"), a4, CFSTR("vcSessionParticipantID"), v12, CFSTR("vcSessionParameterAudioPaused"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8), CFSTR("vcSessionSucceeded"), 0);
  +[VCSessionManager addNSError:toXPCArgumentDictionary:](VCSessionManager, "addNSError:toXPCArgumentDictionary:", a7, v13);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionAudioPausedDidSucceed", v13, a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 videoPaused:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = a6;
  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5);
  v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", CFSTR("vcSessionVideoPausedDidSucceed"), CFSTR("vcServiceType"), a4, CFSTR("vcSessionParticipantID"), v12, CFSTR("vcSessionParameterVideoPaused"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8), CFSTR("vcSessionSucceeded"), 0);
  +[VCSessionManager addNSError:toXPCArgumentDictionary:](VCSessionManager, "addNSError:toXPCArgumentDictionary:", a7, v13);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionVideoPausedDidSucceed", v13, a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 remoteAudioPausedDidChange:(BOOL)a5
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionRemoteAudioPausedDidChange", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("vcSessionRemoteAudioPausedDidChange"), CFSTR("vcServiceType"), a4, CFSTR("vcSessionParticipantID"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5), CFSTR("vcSessionParameterAudioPaused"), 0), a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 remoteVideoPausedDidChange:(BOOL)a5
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionRemoteVideoPausedDidChange", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("vcSessionRemoteVideoPausedDidChange"), CFSTR("vcServiceType"), a4, CFSTR("vcSessionParticipantID"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5), CFSTR("vcSessionParameterVideoPaused"), 0), a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 mediaStateDidChange:(unsigned int)a5 forMediaType:(unsigned int)a6 didSucceed:(BOOL)a7 error:(id)a8
{
  _BOOL8 v9;
  uint64_t v10;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = a7;
  v10 = *(_QWORD *)&a5;
  v13 = (void *)MEMORY[0x1E0C99E08];
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a6);
  v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
  v16 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", CFSTR("vcSessionMediaStateDidChange"), CFSTR("vcServiceType"), a4, CFSTR("vcSessionParticipantID"), v14, CFSTR("vcSessionParameterMediaType"), v15, CFSTR("vcSessionParameterMediaState"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9), CFSTR("vcSessionSucceeded"), 0);
  +[VCSessionManager addNSError:toXPCArgumentDictionary:](VCSessionManager, "addNSError:toXPCArgumentDictionary:", a8, v16);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionMediaStateDidChange", v16, a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 remoteMediaStateDidChange:(unsigned int)a5 forMediaType:(unsigned int)a6
{
  uint64_t v6;
  void *v9;
  uint64_t v10;

  v6 = *(_QWORD *)&a5;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a6);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionRemoteMediaStateDidChange", objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", CFSTR("vcSessionRemoteMediaStateDidChange"), CFSTR("vcServiceType"), a4, CFSTR("vcSessionParticipantID"), v10, CFSTR("vcSessionParameterMediaType"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6), CFSTR("vcSessionParameterMediaState"), 0), a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 mixingDidChangeForMediaType:(unsigned int)a5 mixingMediaType:(unsigned int)a6
{
  uint64_t v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v6 = *(_QWORD *)&a6;
  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("vcServiceType");
  v8[1] = CFSTR("vcSessionParticipantID");
  v9[0] = CFSTR("vcSessionRemoteMixingMediaDidChange");
  v9[1] = a4;
  v8[2] = CFSTR("vcSessionParameterMediaType");
  v9[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a5);
  v8[3] = CFSTR("vcSessionParameterMixingMediaType");
  v9[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionRemoteMixingMediaDidChange", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4), a3);
}

- (void)vcSessionShouldReconnect:(id)a3
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionShouldReconnect", &unk_1E9EFB268, a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 didChangeMediaPriority:(unsigned __int8)a5 description:(id)a6
{
  uint64_t v7;
  id v10;

  v7 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("vcSessionMediaPrioritiesDidChange"), CFSTR("vcServiceType"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", a4, CFSTR("vcSessionParticipantID"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v7), CFSTR("vcSessionParameterParticipantMediaPriority"));
  if (a6)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", a6, CFSTR("vcSessionParameterParticipantMediaPriorityString"));
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionMediaPrioritiesDidChange", v10, a3);

}

- (void)vcSession:(id)a3 participantID:(id)a4 reactionDidStart:(id)a5
{
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("vcSessionReactionDidStart"), CFSTR("vcServiceType"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", a4, CFSTR("vcSessionParticipantID"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", a5, CFSTR("vcSessionParameterReactionType"));
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionReactionDidStart", v8, a3);

}

- (void)vcSession:(id)a3 participantDidStopReacting:(id)a4
{
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("vcSessionReactionDidStopReacting"), CFSTR("vcServiceType"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", a4, CFSTR("vcSessionParticipantID"));
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionReactionDidStopReacting", v6, a3);

}

- (void)vcSession:(id)a3 participantID:(id)a4 didDetectError:(id)a5
{
  uint64_t v7;

  v7 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", a4, CFSTR("vcSessionParticipantID"), 0);
  +[VCSessionManager addNSError:toXPCArgumentDictionary:](VCSessionManager, "addNSError:toXPCArgumentDictionary:", a5, v7);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionDidDetectError", v7, a3);
}

- (void)registerBlocksForService
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__VCSessionManager_registerBlocksForService__block_invoke;
  v8[3] = &unk_1E9E544F0;
  v8[4] = v3;
  v8[5] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionInitialize", v8, self->_xpcCommandQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __44__VCSessionManager_registerBlocksForService__block_invoke_145;
  v7[3] = &unk_1E9E53848;
  v7[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionTerminate", v7, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionRemoveParticipants", &__block_literal_global_149, self->_xpcCommandQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __44__VCSessionManager_registerBlocksForService__block_invoke_2;
  v6[3] = &unk_1E9E53848;
  v6[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionStart", v6, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionStop", &__block_literal_global_156_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionUpdateConfiguration", &__block_literal_global_159, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", v4, 3221225472, __44__VCSessionManager_registerBlocksForService__block_invoke_5, &unk_1E9E53848, v3), "registerBlockForService:block:queue:", "vcSessionAddParticipants", &v5, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetMute", &__block_literal_global_167, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetScreenControlEnabled", &__block_literal_global_172, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetVolume", &__block_literal_global_177, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetAudioPosition", &__block_literal_global_187, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetAudioEnabled", &__block_literal_global_192_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetVideoEnabled", &__block_literal_global_195_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetScreenEnabled", &__block_literal_global_198, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetAudioPaused", &__block_literal_global_201, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetVideoPaused", &__block_literal_global_204, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetMediaState", &__block_literal_global_207, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetOneToOneEnabled", &__block_literal_global_210, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionUpdateParticipantConfiguration", &__block_literal_global_213_0, self->_xpcCommandQueue);
}

void *__44__VCSessionManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  VCSession *v6;
  VCSession *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v13[8];
  _QWORD v14[8];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  VCSession *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v6 = -[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:]([VCSession alloc], "initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionIDSDestination")), objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionConfiguration")), objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantData")), v4, objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID")), "intValue"), 0);
  if (!v6)
    return 0;
  v7 = v6;
  -[VCSession setSharingEnabled:](v6, "setSharingEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 32));
  -[VCSession setScreenAndCameraMixingEnabled:](v7, "setScreenAndCameraMixingEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 33));
  v8 = (void *)objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "newNSDictionaryWidthNSDictionary:", -[VCSessionParticipant participantStreamTokens](-[VCSession localParticipant](v7, "localParticipant"), "participantStreamTokens"));
  objc_msgSend((id)objc_msgSend(v4, "sessions"), "setObject:forKeyedSubscript:", v7, -[VCSession uuid](v7, "uuid"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v16 = v9;
      v17 = 2080;
      v18 = "-[VCSessionManager registerBlocksForService]_block_invoke";
      v19 = 1024;
      v20 = 347;
      v21 = 2048;
      v22 = v7;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sessionInitializeBlock allocated new VCSession[%p]", buf, 0x26u);
    }
  }
  v14[0] = v7;
  v14[1] = -[VCSession uuid](v7, "uuid", CFSTR("CONTEXT"), CFSTR("vcSessionUUID"));
  v14[2] = MEMORY[0x1E0C9AAB0];
  v13[2] = CFSTR("vcSessionSucceeded");
  v13[3] = CFSTR("vcSessionParticipantID");
  v14[3] = -[VCSessionParticipant uuid](-[VCSession localParticipant](v7, "localParticipant"), "uuid");
  v13[4] = CFSTR("vcSessionParticipantData");
  v14[4] = -[VCSessionParticipant opaqueData](-[VCSession localParticipant](v7, "localParticipant"), "opaqueData");
  v13[5] = CFSTR("vcSessionToken");
  v14[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCSession transportSessionID](v7, "transportSessionID"));
  v13[6] = CFSTR("vcSessionCapabilities");
  v13[7] = CFSTR("vcSessionParameterStreamTokens");
  v14[6] = -[VCSession capabilities](v7, "capabilities");
  v14[7] = v8;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 8);
  v11 = v5;

  return v5;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_145(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D80]);
    v4 = objc_msgSend(v5, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
  }
  v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v11 = v7;
        v12 = 2080;
        v13 = "-[VCSessionManager registerBlocksForService]_block_invoke";
        v14 = 1024;
        v15 = 380;
        v16 = 2048;
        v17 = v6;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sessionTerminateBlock releasing old VCSession[%p]", buf, 0x26u);
      }
    }
    objc_msgSend(v6, "stopWithError:", 0);
    objc_msgSend(v3, "releaseSession:", v6);
  }
  return v4;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_148(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantIDs"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "removeParticipant:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      }
      while (v6);
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    objc_msgSend((id)objc_msgSend(v4, "localParticipant"), "updateMediaSettingsWithConfig:", objc_msgSend(*(id *)(a1 + 32), "participantConfigFromXPCDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionLocalParticipantConfig"))));
    objc_msgSend(v4, "start");
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionError"));
    if (v4)
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ERROR_DOMAIN")), (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ERROR_CODE")), "intValue"), objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ERROR_USERINFO")));
    objc_msgSend(v3, "stopWithError:", v4);

  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_4(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "updateConfiguration:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionConfiguration")));
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_5(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantConfigs"));
    v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID")), "intValue");
    v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v4);
          v12 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "participantConfigFromXPCDictionary:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v11));
          objc_msgSend(v12, "setProcessId:", v5);
          objc_msgSend(v7, "addObject:", v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
      }
      while (v9);
    }
    objc_msgSend(v6, "addParticipantConfigurations:", v7);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (v4)
          v15 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
        else
          v15 = "<nil>";
        v17 = 136316162;
        v18 = v13;
        v19 = 2080;
        v20 = "-[VCSessionManager registerBlocksForService]_block_invoke_5";
        v21 = 1024;
        v22 = 462;
        v23 = 2080;
        v24 = v15;
        v25 = 2048;
        v26 = v6;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d adding new VCSessionParticipant(s) with config(s):%s to VCSession[%p]", (uint8_t *)&v17, 0x30u);
      }
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_166(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "participantForID:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantID"))), "setMuted:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterMute")), "BOOLValue"));
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_2_171(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantID"));
    v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterParticipantScreenControlEnabled"));
    v7 = (void *)objc_msgSend(v4, "participantForID:", v5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "setScreenControlEnabled:", objc_msgSend(v6, "BOOLValue"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136316162;
          v13 = v8;
          v14 = 2080;
          v15 = "-[VCSessionManager registerBlocksForService]_block_invoke_2";
          v16 = 1024;
          v17 = 490;
          v18 = 2048;
          v19 = v7;
          v20 = 1024;
          v21 = objc_msgSend(v6, "BOOLValue");
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d changing VCSessionParticipant[%p] screenControlEnabled to %d", (uint8_t *)&v12, 0x2Cu);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v12 = 136316162;
        v13 = v10;
        v14 = 2080;
        v15 = "-[VCSessionManager registerBlocksForService]_block_invoke";
        v16 = 1024;
        v17 = 492;
        v18 = 2048;
        v19 = v7;
        v20 = 1024;
        v21 = objc_msgSend(v6, "BOOLValue");
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d cannot set VCSessionParticipant[%p] screenControlEnabled to %d on a local participant", (uint8_t *)&v12, 0x2Cu);
      }
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_176(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  char v6;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v5 = (void *)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "participantForID:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantID")));
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterVolume")), "floatValue");
    v6 = objc_msgSend(v5, "setVolume:");
    if (a3)
    {
      if ((v6 & 1) == 0)
        *a3 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 11, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionManager.m", 509));
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_2_186(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  char v6;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v5 = (void *)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "participantForID:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantID")));
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterAudioPosition")), "floatValue");
    v6 = objc_msgSend(v5, "setAudioPosition:");
    if (a3)
    {
      if ((v6 & 1) == 0)
        *a3 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 1, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionManager.m", 527));
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_3_191(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantID"));
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterAudioEnabled"));
    v6 = (void *)objc_msgSend(v3, "participantForID:", v4);
    objc_msgSend(v6, "setAudioEnabled:", objc_msgSend(v5, "BOOLValue"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316162;
        v11 = v7;
        v12 = 2080;
        v13 = "-[VCSessionManager registerBlocksForService]_block_invoke_3";
        v14 = 1024;
        v15 = 543;
        v16 = 2048;
        v17 = v6;
        v18 = 1024;
        v19 = objc_msgSend(v5, "BOOLValue");
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d changing VCSessionParticipant[%p] audioEnabled to %d", (uint8_t *)&v10, 0x2Cu);
      }
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_194(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantID"));
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterVideoEnabled"));
    if (objc_msgSend(v3, "oneToOneModeEnabled"))
    {
      if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
        v6 = 1;
      else
        v6 = objc_msgSend(v3, "isUsingPersonaCamera");
      objc_msgSend(v3, "updateOneToOneRateControllerForVideoEnabled:", v6);
    }
    v7 = (void *)objc_msgSend(v3, "participantForID:", v4);
    objc_msgSend(v7, "setVideoEnabled:", objc_msgSend(v5, "BOOLValue"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136316162;
        v12 = v8;
        v13 = 2080;
        v14 = "-[VCSessionManager registerBlocksForService]_block_invoke";
        v15 = 1024;
        v16 = 560;
        v17 = 2048;
        v18 = v7;
        v19 = 1024;
        v20 = objc_msgSend(v5, "BOOLValue");
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d changing VCSessionParticipant[%p] videoEnabled to %d", (uint8_t *)&v11, 0x2Cu);
      }
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_197(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantID"));
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterScreenEnabled"));
    if (objc_msgSend(v3, "oneToOneModeEnabled"))
      objc_msgSend(v3, "updateOneToOneRateControllerForVideoEnabled:screenEnabled:", objc_msgSend(v3, "isOneToOneUsingVideo"), objc_msgSend(v5, "BOOLValue"));
    v6 = (void *)objc_msgSend(v3, "participantForID:", v4);
    objc_msgSend(v6, "setScreenEnabled:", objc_msgSend(v5, "BOOLValue"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316162;
        v11 = v7;
        v12 = 2080;
        v13 = "-[VCSessionManager registerBlocksForService]_block_invoke";
        v14 = 1024;
        v15 = 577;
        v16 = 2048;
        v17 = v6;
        v18 = 1024;
        v19 = objc_msgSend(v5, "BOOLValue");
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d changing VCSessionParticipant[%p] screenEnabled to %d", (uint8_t *)&v10, 0x2Cu);
      }
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_200(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "participantForID:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantID"))), "setAudioPaused:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterAudioPaused")), "BOOLValue"));
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_2_203(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "participantForID:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantID"))), "setVideoPaused:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterVideoPaused")), "BOOLValue"));
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_3_206(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantID"));
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterMediaType"));
    v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterMediaState"));
    v7 = (void *)objc_msgSend(v3, "participantForID:", v4);
    objc_msgSend(v7, "setMediaState:forMediaType:", objc_msgSend(v6, "unsignedIntValue"), objc_msgSend(v5, "unsignedIntValue"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136316418;
        v12 = v8;
        v13 = 2080;
        v14 = "-[VCSessionManager registerBlocksForService]_block_invoke_3";
        v15 = 1024;
        v16 = 618;
        v17 = 2048;
        v18 = v7;
        v19 = 1024;
        v20 = objc_msgSend(v5, "unsignedIntValue");
        v21 = 1024;
        v22 = objc_msgSend(v6, "unsignedIntValue");
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d changing VCSessionParticipant=%p mediaType=%d to state=%d", (uint8_t *)&v11, 0x32u);
      }
    }
    if (objc_msgSend(v3, "oneToOneModeEnabled"))
      objc_msgSend(v3, "updateOneToOneRateControllerForVideoEnabled:", objc_msgSend(v3, "isOneToOneUsingVideo"));
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_209(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "setOneToOneModeEnabled:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionOneOnOneModeEnabled")), "BOOLValue"));
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_2_212(uint64_t a1, void *a2)
{
  const __CFString *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t i;
  void *v9;
  VCSessionParticipantConfig *v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  unsigned int v18;
  unsigned int v19;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  id obj;
  void *v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  int v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  unsigned int v41;
  _BYTE v42[128];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v21 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v22 = a2;
    obj = (id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterParticipantConfiguration"));
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
    if (v27)
    {
      v3 = CFSTR("vcSessionParticipantID");
      v4 = *(_QWORD *)v44;
      v5 = CFSTR("vcSessionParameterVideoQuality");
      v6 = CFSTR("vcSessionParameterVisibilityIndex");
      v7 = CFSTR("vcSessionParameterProminenceIndex");
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v44 != v4)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v10 = objc_alloc_init(VCSessionParticipantConfig);
          -[VCSessionParticipantConfig setUuid:](v10, "setUuid:", objc_msgSend(v9, "objectForKeyedSubscript:", v3));
          -[VCSessionParticipantConfig setVideoQuality:](v10, "setVideoQuality:", objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v5), "integerValue"));
          -[VCSessionParticipantConfig setVisibilityIndex:](v10, "setVisibilityIndex:", objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v6), "unsignedIntegerValue"));
          -[VCSessionParticipantConfig setProminenceIndex:](v10, "setProminenceIndex:", objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v7), "unsignedIntegerValue"));
          -[VCSessionParticipantConfig setPositionalInfo:](v10, "setPositionalInfo:", objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("vcSessionPositionalInfo")));
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v11 = VRTraceErrorLogLevelToCSTR();
            v12 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v24 = -[VCSessionParticipantConfig uuid](v10, "uuid");
              v23 = -[VCSessionParticipantConfig videoQuality](v10, "videoQuality");
              v13 = v7;
              v14 = v6;
              v15 = v5;
              v16 = v4;
              v17 = v3;
              v18 = -[VCSessionParticipantConfig visibilityIndex](v10, "visibilityIndex");
              v19 = -[VCSessionParticipantConfig prominenceIndex](v10, "prominenceIndex");
              *(_DWORD *)buf = 136316674;
              v29 = v11;
              v30 = 2080;
              v31 = "-[VCSessionManager registerBlocksForService]_block_invoke_2";
              v32 = 1024;
              v33 = 650;
              v34 = 2112;
              v35 = v24;
              v36 = 1024;
              v37 = v23;
              v38 = 1024;
              v39 = v18;
              v3 = v17;
              v4 = v16;
              v5 = v15;
              v6 = v14;
              v7 = v13;
              v40 = 1024;
              v41 = v19;
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d participantUUID[%@] videoQuality[%d] visibilityIndex[%d] prominenceIndex[%d]", buf, 0x38u);
            }
          }
          objc_msgSend(v26, "addObject:", v10);

        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
      }
      while (v27);
    }
    objc_msgSend(v21, "updateParticipantConfigurations:", v26);
    objc_msgSend(v21, "updatePresentationInfo:", objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("vcSessionPresentationInfo")));

  }
  return 0;
}

- (void)deregisterBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionInitialize");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionTerminate");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionRemoveParticipants");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionStart");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionStop");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionUpdateConfiguration");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionAddParticipants");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetMute");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetVolume");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetScreenControlEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetAudioPosition");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetAudioEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetVideoEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetScreenEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetAudioPaused");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetVideoPaused");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetOneToOneEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetMediaState");
}

- (id)participantConfigFromXPCDictionary:(id)a3
{
  VCSessionParticipantConfig *v4;

  v4 = objc_alloc_init(VCSessionParticipantConfig);
  -[VCSessionParticipantConfig setIdsParticipantID:](v4, "setIdsParticipantID:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionIDSParticipantID")), "unsignedLongLongValue"));
  -[VCSessionParticipantConfig setUuid:](v4, "setUuid:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantID")));
  -[VCSessionParticipantConfig setParticipantData:](v4, "setParticipantData:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantData")));
  -[VCSessionParticipantConfig setAudioEnabled:](v4, "setAudioEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParameterAudioEnabled")), "BOOLValue"));
  -[VCSessionParticipantConfig setVideoEnabled:](v4, "setVideoEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParameterVideoEnabled")), "BOOLValue"));
  -[VCSessionParticipantConfig setScreenEnabled:](v4, "setScreenEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParameterScreenEnabled")), "BOOLValue"));
  -[VCSessionParticipantConfig setScreenControlEnabled:](v4, "setScreenControlEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParameterParticipantScreenControlEnabled")), "BOOLValue"));
  -[VCSessionParticipantConfig setAudioMuted:](v4, "setAudioMuted:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParameterMute")), "BOOLValue"));
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParameterVolume")), "floatValue");
  -[VCSessionParticipantConfig setVolume:](v4, "setVolume:");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParameterAudioPosition")), "floatValue");
  -[VCSessionParticipantConfig setAudioPosition:](v4, "setAudioPosition:");
  -[VCSessionParticipantConfig setAudioPaused:](v4, "setAudioPaused:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParameterAudioPaused")), "BOOLValue"));
  -[VCSessionParticipantConfig setVideoPaused:](v4, "setVideoPaused:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParameterVideoPaused")), "BOOLValue"));
  -[VCSessionParticipantConfig setVideoQuality:](v4, "setVideoQuality:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParameterVideoQuality")), "unsignedIntegerValue"));
  -[VCSessionParticipantConfig setVisibilityIndex:](v4, "setVisibilityIndex:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParameterVisibilityIndex")), "unsignedIntegerValue"));
  -[VCSessionParticipantConfig setProminenceIndex:](v4, "setProminenceIndex:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParameterProminenceIndex")), "unsignedIntegerValue"));
  -[VCSessionParticipantConfig setPositionalInfo:](v4, "setPositionalInfo:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionPositionalInfo")));
  -[VCSessionParticipantConfig setMediaStates:](v4, "setMediaStates:", +[AVCSessionParticipant unarchiveMediaStatesWithData:](AVCSessionParticipant, "unarchiveMediaStatesWithData:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParameterMediaStates"))));
  return v4;
}

- (void)releaseSession:(id)a3
{
  NSObject *sessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__VCSessionManager_releaseSession___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = a3;
  block[5] = self;
  dispatch_async(sessionQueue, block);
}

void __35__VCSessionManager_releaseSession___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "startDeallocTimer");
  v2 = objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__VCSessionManager_releaseSession___block_invoke_2;
  block[3] = &unk_1E9E52238;
  block[4] = v3;
  block[5] = v2;
  dispatch_async(v4, block);
}

uint64_t __35__VCSessionManager_releaseSession___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sessions"), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (BOOL)screenAndCameraMixingEnabled
{
  return self->_screenAndCameraMixingEnabled;
}

@end
