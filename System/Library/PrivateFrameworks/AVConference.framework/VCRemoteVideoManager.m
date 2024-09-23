@implementation VCRemoteVideoManager

void __VCRemoteVideoManager_DefaultManager_block_invoke()
{
  if (!_vcRemoteVideoManager)
    _vcRemoteVideoManager = objc_alloc_init(VCRemoteVideoManager);
}

- (VCRemoteVideoManager)init
{
  VCRemoteVideoManager *v2;
  NSObject *CustomRootQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCRemoteVideoManager;
  v2 = -[VCRemoteVideoManager init](&v5, sel_init);
  if (v2)
  {
    v2->_queuesForStreamTokenDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_stateCacheForStreamTokenDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCRemoteVideoManager.XPCCommandQueue", 0, CustomRootQueue);
    v2->_xpcCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCRemoteVideoManager.XPCNotificationQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  dispatch_release((dispatch_object_t)self->_xpcCallbackQueue);
  -[VCRemoteVideoManager cleanupDictionaries](self, "cleanupDictionaries");

  v3.receiver = self;
  v3.super_class = (Class)VCRemoteVideoManager;
  -[VCRemoteVideoManager dealloc](&v3, sel_dealloc);
}

- (id)newQueueForStreamToken:(int64_t)a3 videoMode:(int)a4
{
  return -[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:](self, "newQueueForStreamToken:videoMode:imageQueueProtected:", a3, *(_QWORD *)&a4, 0);
}

- (id)newQueueForStreamToken:(int64_t)a3 videoMode:(int)a4 imageQueueProtected:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v9;
  NSObject *v10;
  NSObject *dispatchQueue;
  void *v12;
  _QWORD v14[7];
  int v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v5 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__21;
  v21 = __Block_byref_object_dispose__21;
  v22 = 0;
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCRemoteVideoManager-newQueueForStreamToken");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v24 = v9;
      v25 = 2080;
      v26 = "-[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:]";
      v27 = 1024;
      v28 = 155;
      v29 = 2048;
      v30 = a3;
      v31 = 1024;
      v32 = a4;
      v33 = 1024;
      v34 = v5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCRemoteVideoManager-newQueueForStreamToken streamToken=%ld mode=%d imageQueueProtected=%d", buf, 0x32u);
    }
  }
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__VCRemoteVideoManager_newQueueForStreamToken_videoMode_imageQueueProtected___block_invoke;
  v14[3] = &unk_1E9E56AD0;
  v14[4] = self;
  v14[5] = &v17;
  v14[6] = a3;
  v15 = a4;
  v16 = v5;
  dispatch_sync(dispatchQueue, v14);
  v12 = (void *)v18[5];
  _Block_object_dispose(&v17, 8);
  return v12;
}

void __77__VCRemoteVideoManager_newQueueForStreamToken_videoMode_imageQueueProtected___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  int v17;
  VCImageQueue *v18;
  uint64_t v19;
  const void *v20;
  int v21;
  int v22;
  const char *v23;
  char *v24;
  os_log_t *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  char *v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  _BYTE v45[10];
  char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 48);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48))))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      v5 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = *v2;
          *(_DWORD *)buf = 136315906;
          v39 = v3;
          v40 = 2080;
          v41 = "-[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:]_block_invoke";
          v42 = 1024;
          v43 = 166;
          v44 = 2048;
          *(_QWORD *)v45 = v6;
          _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d queuesForStreamToken exists for streamToken %ld", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        __77__VCRemoteVideoManager_newQueueForStreamToken_videoMode_imageQueueProtected___block_invoke_cold_1(v3, v2, v4);
      }
    }
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v7, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48)));

    v8 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48)));

  }
  v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48)));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(v9, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56)));
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v10)
  {
    v11 = v10;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(a1 + 48);
          v16 = *(_DWORD *)(a1 + 56);
          *(_DWORD *)buf = 136316162;
          v39 = v12;
          v40 = 2080;
          v41 = "-[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:]_block_invoke";
          v42 = 1024;
          v43 = 172;
          v44 = 1024;
          *(_DWORD *)v45 = v15;
          *(_WORD *)&v45[4] = 1024;
          *(_DWORD *)&v45[6] = v16;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Queue exists for streamToken %u, videoMode %d", buf, 0x28u);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v34 = *(_QWORD *)(a1 + 48);
        v35 = *(_DWORD *)(a1 + 56);
        *(_DWORD *)buf = 136316162;
        v39 = v12;
        v40 = 2080;
        v41 = "-[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:]_block_invoke";
        v42 = 1024;
        v43 = 172;
        v44 = 1024;
        *(_DWORD *)v45 = v34;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = v35;
        _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Queue exists for streamToken %u, videoMode %d", buf, 0x28u);
      }
    }
  }
  else
  {
    v17 = *(_DWORD *)(a1 + 56);
    v18 = [VCImageQueue alloc];
    if (v17 == 2)
      v19 = 60;
    else
      v19 = 30;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[VCImageQueue initWithFrameRate:imageQueueProtected:](v18, "initWithFrameRate:imageQueueProtected:", v19, *(unsigned __int8 *)(a1 + 60));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56)));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setStreamToken:", *(_QWORD *)(a1 + 48));
    -[VCStreamOutputManager registerStreamOutputSource:forStreamToken:](+[VCStreamOutputManager sharedInstance](VCStreamOutputManager, "sharedInstance"), "registerStreamOutputSource:forStreamToken:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 48));
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v20 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v21 = *(_DWORD *)(a1 + 48);
    v22 = *(_DWORD *)(a1 + 56);
    v23 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys")
        ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys"), "description"), "UTF8String"): "<nil>";
    asprintf(&__str, "Returning queue %p for streamToken %u, video mode %d, _queuesForStreamTokenDict %s", v20, v21, v22, v23);
    if (__str)
    {
      __lasts = 0;
      v24 = strtok_r(__str, "\n", &__lasts);
      v25 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v26 = VRTraceErrorLogLevelToCSTR();
          v27 = *v25;
          if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v39 = v26;
            v40 = 2080;
            v41 = "-[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:]_block_invoke";
            v42 = 1024;
            v43 = 180;
            v44 = 2080;
            *(_QWORD *)v45 = "";
            *(_WORD *)&v45[8] = 2080;
            v46 = v24;
            _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v24 = strtok_r(0, "\n", &__lasts);
      }
      while (v24);
      free(__str);
    }
  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCRemoteVideoManager-newQueueForStreamToken");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v28 = VRTraceErrorLogLevelToCSTR();
    v29 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(char **)(a1 + 48);
      v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v32 = *(_DWORD *)(a1 + 56);
      v33 = *(unsigned __int8 *)(a1 + 60);
      *(_DWORD *)buf = 136316674;
      v39 = v28;
      v40 = 2080;
      v41 = "-[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:]_block_invoke";
      v42 = 1024;
      v43 = 181;
      v44 = 2048;
      *(_QWORD *)v45 = v31;
      *(_WORD *)&v45[8] = 2048;
      v46 = v30;
      v47 = 1024;
      v48 = v32;
      v49 = 1024;
      v50 = v33;
      _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCRemoteVideoManager-newQueueForStreamToken queue=%p streamToken=%ld mode=%d imageQueueProtected=%d", buf, 0x3Cu);
    }
  }
}

- (void)resetDidReceiveFirstFrameForStreamToken:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *dispatchQueue;
  _QWORD v8[6];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCRemoteVideoManager-resetDidReceiveFirstFrame");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCRemoteVideoManager resetDidReceiveFirstFrameForStreamToken:]";
      v13 = 1024;
      v14 = 189;
      v15 = 2048;
      v16 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCRemoteVideoManager-resetDidReceiveFirstFrame streamToken=%ld", buf, 0x26u);
    }
  }
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__VCRemoteVideoManager_resetDidReceiveFirstFrameForStreamToken___block_invoke;
  v8[3] = &unk_1E9E52960;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(dispatchQueue, v8);
}

uint64_t __64__VCRemoteVideoManager_resetDidReceiveFirstFrameForStreamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40))), "setHasReceivedFirstFrame:", 0);
}

- (BOOL)doesQueueExistForStreamToken:(id)a3
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__VCRemoteVideoManager_doesQueueExistForStreamToken___block_invoke;
  v6[3] = &unk_1E9E527A8;
  v6[5] = a3;
  v6[6] = &v7;
  v6[4] = self;
  dispatch_sync(dispatchQueue, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __53__VCRemoteVideoManager_doesQueueExistForStreamToken___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result != 0;
  return result;
}

- (void)releaseQueueForStreamToken:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VCRemoteVideoManager_releaseQueueForStreamToken___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

void __51__VCRemoteVideoManager_releaseQueueForStreamToken___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int ErrorLogLevelForModule;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v2);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v3)
  {
    v5 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316162;
        v19 = v6;
        v20 = 2080;
        v21 = "-[VCRemoteVideoManager releaseQueueForStreamToken:]_block_invoke";
        v22 = 1024;
        v23 = 236;
        v24 = 1024;
        v25 = v8;
        v26 = 2048;
        v27 = objc_msgSend(v3, "count");
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d will release queues for streamToken=%u, [queuesForVideoMode count]=%lu", buf, 0x2Cu);
      }
    }
    objc_msgSend(v3, "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v2);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 40);
        v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
        *(_DWORD *)buf = 136316162;
        v19 = v9;
        v20 = 2080;
        v21 = "-[VCRemoteVideoManager releaseQueueForStreamToken:]_block_invoke";
        v22 = 1024;
        v23 = 240;
        v24 = 1024;
        v25 = v11;
        v26 = 2048;
        v27 = v12;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d did release for streamToken=%u, [queueDict count]=%lu", buf, 0x2Cu);
      }
    }
    -[VCStreamOutputManager deregisterStreamOutputSourceForStreamToken:](+[VCStreamOutputManager sharedInstance](VCStreamOutputManager, "sharedInstance"), "deregisterStreamOutputSourceForStreamToken:", *(_QWORD *)(a1 + 40));
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__VCRemoteVideoManager_releaseQueueForStreamToken___block_invoke_79;
    block[3] = &unk_1E9E521C0;
    block[4] = v2;
    dispatch_async(v13, block);
  }
  else if (ErrorLogLevelForModule >= 5)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      v19 = v14;
      v20 = 2080;
      v21 = "-[VCRemoteVideoManager releaseQueueForStreamToken:]_block_invoke";
      v22 = 1024;
      v23 = 232;
      v24 = 1024;
      v25 = v16;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d queue doesn't exist for streamToken=%u", buf, 0x22u);
    }
  }

}

uint64_t __51__VCRemoteVideoManager_releaseQueueForStreamToken___block_invoke_79(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:toAllClientsWithContext:", "vcRemoteVideoDidReleaseRemoteVideoQueue", 0, *(_QWORD *)(a1 + 32));
}

void __VCRemoteVideoManager_DidReceiveFirstRemoteFrameForStreamToken_block_invoke(uint64_t a1)
{
  _VCRemoteVideoManager_DispatchedDidReceiveFirstRemoteFrameForStreamToken(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __VCRemoteVideoManager_RemoteScreenAttributesDidChange_block_invoke(uint64_t a1)
{
  _VCRemoteVideoManager_DispatchedRemoteScreenAttributesDidChange(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __VCRemoteVideoManager_RemoteVideoAttributesDidChange_block_invoke(uint64_t a1)
{
  _VCRemoteVideoManager_DispatchedRemoteVideoAttributesDidChange(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)dispatchedRemoteVideoDidPause:(BOOL)a3 streamToken:(int64_t)a4
{
  _BOOL8 v5;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *xpcCallbackQueue;
  _QWORD block[6];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v5 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v15 = v7;
      v16 = 2080;
      v17 = "-[VCRemoteVideoManager dispatchedRemoteVideoDidPause:streamToken:]";
      v18 = 1024;
      v19 = 361;
      v20 = 1024;
      v21 = a4;
      v22 = 1024;
      v23 = v5;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken[%u] didPause[%d]", buf, 0x28u);
    }
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a4);
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateCacheForStreamTokenDict, "objectForKeyedSubscript:", v9), "setIsVideoPaused:", v5);
  -[VCStreamOutputManager remoteVideoDidPause:streamToken:](+[VCStreamOutputManager sharedInstance](VCStreamOutputManager, "sharedInstance"), "remoteVideoDidPause:streamToken:", v5, a4);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v5);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("conferenceVideoPause"), 0);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VCRemoteVideoManager_dispatchedRemoteVideoDidPause_streamToken___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = v11;
  block[5] = v9;
  dispatch_async(xpcCallbackQueue, block);

}

uint64_t __66__VCRemoteVideoManager_dispatchedRemoteVideoDidPause_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:toAllClientsWithContext:", "vcRemoteVideoDidRemoteVideoPause", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)remoteVideoDidPause:(BOOL)a3 streamToken:(int64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__VCRemoteVideoManager_remoteVideoDidPause_streamToken___block_invoke;
  v5[3] = &unk_1E9E529D8;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __56__VCRemoteVideoManager_remoteVideoDidPause_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedRemoteVideoDidPause:streamToken:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)dispatchedRemoteMediaDidStall:(BOOL)a3 streamToken:(int64_t)a4
{
  _BOOL8 v5;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *xpcCallbackQueue;
  _QWORD block[6];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v5 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v15 = v7;
      v16 = 2080;
      v17 = "-[VCRemoteVideoManager dispatchedRemoteMediaDidStall:streamToken:]";
      v18 = 1024;
      v19 = 394;
      v20 = 1024;
      v21 = a4;
      v22 = 1024;
      v23 = v5;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken[%u] didStall[%d]", buf, 0x28u);
    }
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a4);
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateCacheForStreamTokenDict, "objectForKeyedSubscript:", v9), "setIsMediaStalled:", v5);
  -[VCStreamOutputManager remoteMediaDidStall:streamToken:](+[VCStreamOutputManager sharedInstance](VCStreamOutputManager, "sharedInstance"), "remoteMediaDidStall:streamToken:", v5, a4);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v5);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("conferenceIsRemoteMediaStalled"), 0);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VCRemoteVideoManager_dispatchedRemoteMediaDidStall_streamToken___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = v11;
  block[5] = v9;
  dispatch_async(xpcCallbackQueue, block);

}

uint64_t __66__VCRemoteVideoManager_dispatchedRemoteMediaDidStall_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:toAllClientsWithContext:", "vcRemoteVideoDidRemoteMediaStall", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)remoteMediaDidStall:(BOOL)a3 streamToken:(int64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__VCRemoteVideoManager_remoteMediaDidStall_streamToken___block_invoke;
  v5[3] = &unk_1E9E529D8;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __56__VCRemoteVideoManager_remoteMediaDidStall_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedRemoteMediaDidStall:streamToken:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)dispatchedRemoteVideoDidDegrade:(BOOL)a3 streamToken:(int64_t)a4
{
  _BOOL8 v5;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *xpcCallbackQueue;
  _QWORD block[6];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v5 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v15 = v7;
      v16 = 2080;
      v17 = "-[VCRemoteVideoManager dispatchedRemoteVideoDidDegrade:streamToken:]";
      v18 = 1024;
      v19 = 428;
      v20 = 1024;
      v21 = a4;
      v22 = 1024;
      v23 = v5;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken[%u] isDegraded[%d]", buf, 0x28u);
    }
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a4);
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateCacheForStreamTokenDict, "objectForKeyedSubscript:", v9), "setIsVideoDegraded:", v5);
  -[VCStreamOutputManager remoteVideoDidDegrade:streamToken:](+[VCStreamOutputManager sharedInstance](VCStreamOutputManager, "sharedInstance"), "remoteVideoDidDegrade:streamToken:", v5, a4);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v5);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("conferenceIsVideoDegraded"), 0);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VCRemoteVideoManager_dispatchedRemoteVideoDidDegrade_streamToken___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = v11;
  block[5] = v9;
  dispatch_async(xpcCallbackQueue, block);

}

uint64_t __68__VCRemoteVideoManager_dispatchedRemoteVideoDidDegrade_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:toAllClientsWithContext:", "vcRemoteVideoDidVideoDegrade", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)remoteVideoDidDegrade:(BOOL)a3 streamToken:(int64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__VCRemoteVideoManager_remoteVideoDidDegrade_streamToken___block_invoke;
  v5[3] = &unk_1E9E529D8;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __58__VCRemoteVideoManager_remoteVideoDidDegrade_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedRemoteVideoDidDegrade:streamToken:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)dispatchNetworkQualityDidDegrade:(BOOL)a3 isLocalNetworkQualityDegraded:(BOOL)a4 streamToken:(int64_t)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *xpcCallbackQueue;
  _QWORD block[6];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v6 = a4;
  v7 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v19 = v9;
      v20 = 2080;
      v21 = "-[VCRemoteVideoManager dispatchNetworkQualityDidDegrade:isLocalNetworkQualityDegraded:streamToken:]";
      v22 = 1024;
      v23 = 463;
      v24 = 1024;
      v25 = a5;
      v26 = 1024;
      v27 = v7;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%u isDegraded=%d", buf, 0x28u);
    }
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a5);
  v12 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateCacheForStreamTokenDict, "objectForKeyedSubscript:", v11);
  objc_msgSend(v12, "setIsNetworkDegraded:", v7);
  objc_msgSend(v12, "setIsLocalNetworkDegraded:", v6);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v7);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v6);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v13, CFSTR("conferenceIsNetworkDegraded"), v14, CFSTR("conferenceIsNetworkDegradedLocal"), 0);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__VCRemoteVideoManager_dispatchNetworkQualityDidDegrade_isLocalNetworkQualityDegraded_streamToken___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = v15;
  block[5] = v11;
  dispatch_async(xpcCallbackQueue, block);

}

uint64_t __99__VCRemoteVideoManager_dispatchNetworkQualityDidDegrade_isLocalNetworkQualityDegraded_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:toAllClientsWithContext:", "vcRemoteVideoDidNetworkDegrade", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)networkQualityDidDegrade:(BOOL)a3 isLocalNetworkQualityDegraded:(BOOL)a4 streamToken:(int64_t)a5
{
  NSObject *dispatchQueue;
  _QWORD v6[6];
  BOOL v7;
  BOOL v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__VCRemoteVideoManager_networkQualityDidDegrade_isLocalNetworkQualityDegraded_streamToken___block_invoke;
  v6[3] = &unk_1E9E556B8;
  v7 = a3;
  v8 = a4;
  v6[4] = self;
  v6[5] = a5;
  dispatch_async(dispatchQueue, v6);
}

uint64_t __91__VCRemoteVideoManager_networkQualityDidDegrade_isLocalNetworkQualityDegraded_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchNetworkQualityDidDegrade:isLocalNetworkQualityDegraded:streamToken:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
}

- (void)dispatchedRemoteVideoDidSuspend:(BOOL)a3 streamToken:(int64_t)a4
{
  _BOOL8 v5;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *xpcCallbackQueue;
  _QWORD block[6];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v5 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v15 = v7;
      v16 = 2080;
      v17 = "-[VCRemoteVideoManager dispatchedRemoteVideoDidSuspend:streamToken:]";
      v18 = 1024;
      v19 = 493;
      v20 = 1024;
      v21 = a4;
      v22 = 1024;
      v23 = v5;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken[%u] isSuspended[%d]", buf, 0x28u);
    }
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a4);
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateCacheForStreamTokenDict, "objectForKeyedSubscript:", v9), "setIsVideoSuspended:", v5);
  -[VCStreamOutputManager remoteVideoDidSuspend:streamToken:](+[VCStreamOutputManager sharedInstance](VCStreamOutputManager, "sharedInstance"), "remoteVideoDidSuspend:streamToken:", v5, a4);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v5);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("conferenceIsVideoSuspended"), 0);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VCRemoteVideoManager_dispatchedRemoteVideoDidSuspend_streamToken___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = v11;
  block[5] = v9;
  dispatch_async(xpcCallbackQueue, block);

}

uint64_t __68__VCRemoteVideoManager_dispatchedRemoteVideoDidSuspend_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:toAllClientsWithContext:", "vcRemoteVideoDidVideoSuspend", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)remoteVideoDidSuspend:(BOOL)a3 streamToken:(int64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__VCRemoteVideoManager_remoteVideoDidSuspend_streamToken___block_invoke;
  v5[3] = &unk_1E9E529D8;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __58__VCRemoteVideoManager_remoteVideoDidSuspend_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedRemoteVideoDidSuspend:streamToken:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)dispatchedConnectionDidChangeWithLocalInterfaceType:(id)a3 remoteInterfaceType:(id)a4 streamToken:(int64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  NSObject *xpcCallbackQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a5);
  v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateCacheForStreamTokenDict, "objectForKeyedSubscript:", v8);
  objc_msgSend(v9, "setLocalInterfaceType:", a3);
  objc_msgSend(v9, "setRemoteInterfaceType:", a4);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a3, CFSTR("conferenceConnectionTypeLocal"), a4, CFSTR("conferenceConnectionTypeRemote"), 0);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__VCRemoteVideoManager_dispatchedConnectionDidChangeWithLocalInterfaceType_remoteInterfaceType_streamToken___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = v10;
  block[5] = v8;
  dispatch_async(xpcCallbackQueue, block);

}

uint64_t __108__VCRemoteVideoManager_dispatchedConnectionDidChangeWithLocalInterfaceType_remoteInterfaceType_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:toAllClientsWithContext:", "vcRemoteVideoDidConnectionChange", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)connectionDidChangeWithLocalInterfaceType:(id)a3 remoteInterfaceType:(id)a4 streamToken:(int64_t)a5
{
  NSObject *dispatchQueue;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__VCRemoteVideoManager_connectionDidChangeWithLocalInterfaceType_remoteInterfaceType_streamToken___block_invoke;
  block[3] = &unk_1E9E54B40;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  dispatch_async(dispatchQueue, block);
}

uint64_t __98__VCRemoteVideoManager_connectionDidChangeWithLocalInterfaceType_remoteInterfaceType_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedConnectionDidChangeWithLocalInterfaceType:remoteInterfaceType:streamToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (unsigned)slotForStreamToken:(int64_t)a3 videoMode:(int)a4
{
  uint64_t v4;
  void *QueueForStreamToken;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v4 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x1E0C80C00];
  if (VCRemoteVideoManager_DefaultManager_onceToken != -1)
    dispatch_once(&VCRemoteVideoManager_DefaultManager_onceToken, &__block_literal_global_59);
  QueueForStreamToken = (void *)_VCRemoteVideoManager_GetQueueForStreamToken(_vcRemoteVideoManager, a3, v4);
  v7 = objc_msgSend(QueueForStreamToken, "setVideoDestination:", 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (QueueForStreamToken)
        v10 = (const char *)objc_msgSend((id)objc_msgSend(QueueForStreamToken, "description"), "UTF8String");
      else
        v10 = "<nil>";
      v12 = 136316674;
      v13 = v8;
      v14 = 2080;
      v15 = "-[VCRemoteVideoManager slotForStreamToken:videoMode:]";
      v16 = 1024;
      v17 = 566;
      v18 = 2080;
      v19 = v10;
      v20 = 2048;
      v21 = v7;
      v22 = 1024;
      v23 = a3;
      v24 = 1024;
      v25 = v4;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCRemoteVideoManager: queue %s --> get slot# %lu for streamToken %u(%d)", (uint8_t *)&v12, 0x3Cu);
    }
  }
  return v7;
}

- (void)cleanupDictionaries
{
  -[NSMutableDictionary removeAllObjects](self->_queuesForStreamTokenDict, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_stateCacheForStreamTokenDict, "removeAllObjects");
}

- (id)contextIdForStreamTokenWithArguments:(id)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  BOOL v9;
  NSString *v10;
  uint64_t v11;
  int v12;
  void *QueueForStreamToken;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[3];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;
  NSRect v42;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("conferenceVisualRectangle"));
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRemoteVideoManager contextIdForStreamTokenWithArguments:error:].cold.1();
    }
    v21 = -1;
    goto LABEL_22;
  }
  v10 = (NSString *)v8;
  if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_queuesForStreamTokenDict, "objectForKeyedSubscript:", v7))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRemoteVideoManager contextIdForStreamTokenWithArguments:error:].cold.2(v22, v7, v23);
    }
    v21 = -2;
LABEL_22:
    if (a4)
    {
      v24 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCRemoteVideoManager"), v21, 0);
      v19 = 0;
      *a4 = v24;
    }
    else
    {
      v19 = 0;
    }
    return v19;
  }
  v11 = objc_msgSend(v7, "unsignedIntValue");
  v12 = v11;
  QueueForStreamToken = (void *)_VCRemoteVideoManager_GetQueueForStreamToken((uint64_t)self, v11, 0);
  v42 = NSRectFromString(v10);
  v14 = objc_msgSend(QueueForStreamToken, "createCAContextWithSize:", v42.origin.x, v42.origin.y, v42.size.width, v42.size.height);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (QueueForStreamToken)
        v17 = (const char *)objc_msgSend((id)objc_msgSend(QueueForStreamToken, "description"), "UTF8String");
      else
        v17 = "<nil>";
      *(_DWORD *)buf = 136316674;
      v28 = v15;
      v29 = 2080;
      v30 = "-[VCRemoteVideoManager contextIdForStreamTokenWithArguments:error:]";
      v31 = 1024;
      v32 = 594;
      v33 = 2080;
      v34 = v17;
      v35 = 2048;
      v36 = v14;
      v37 = 1024;
      v38 = v12;
      v39 = 1024;
      v40 = 0;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCRemoteVideoManager: queue=%s --> get context=%lu for streamToken=%u(mode=%d)", buf, 0x3Cu);
    }
  }
  v25[0] = objc_msgSend(&unk_1E9EF5618, "stringValue");
  v26[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
  v25[1] = objc_msgSend(&unk_1E9EF5630, "stringValue");
  v26[1] = &unk_1E9EF5618;
  v25[2] = objc_msgSend(&unk_1E9EF5648, "stringValue");
  v26[2] = &unk_1E9EF5618;
  v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("CONTEXT"), v18, CFSTR("vcRemoteVideoSlotsForModes"), 0);
  return v19;
}

- (BOOL)setLayerBoundsForStreamTokenWithArguments:(id)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  BOOL v9;
  NSString *v10;
  uint64_t v11;
  unint64_t v12;
  void *QueueForStreamToken;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  int v28;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  VCRemoteVideoManager *v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  uint64_t v49;
  NSRect v50;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("conferenceVisualRectangle"));
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:].cold.1();
    }
    goto LABEL_40;
  }
  v10 = (NSString *)v8;
  v11 = objc_msgSend(v7, "unsignedIntValue");
  v12 = v11;
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_queuesForStreamTokenDict, "objectForKeyedSubscript:", v7))
  {
    QueueForStreamToken = (void *)_VCRemoteVideoManager_GetQueueForStreamToken((uint64_t)self, v11, 0);
    v50 = NSRectFromString(v10);
    x = v50.origin.x;
    y = v50.origin.y;
    width = v50.size.width;
    height = v50.size.height;
    if (VideoUtil_LayerBoundsAreValid(v50.origin.x, v50.origin.y, v50.size.width, v50.size.height))
    {
      v18 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("USERXPCARGUMENTS"));
      v19 = objc_msgSend(MEMORY[0x1E0CD2778], "handleFromXPCRepresentation:", v18);
      if (v19)
      {
        v20 = (void *)v19;
        v21 = VCImageQueue_setCALayerSize((uint64_t)QueueForStreamToken, v19, x, y, width, height);
        if ((v21 & 1) != 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            v22 = VRTraceErrorLogLevelToCSTR();
            v23 = *MEMORY[0x1E0CF2758];
            v24 = *MEMORY[0x1E0CF2758];
            if (*MEMORY[0x1E0CF2748])
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                if (QueueForStreamToken)
                  v25 = (const char *)objc_msgSend((id)objc_msgSend(QueueForStreamToken, "description"), "UTF8String");
                else
                  v25 = "<nil>";
                v33 = 136316930;
                v34 = v22;
                v35 = 2080;
                v36 = "-[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:]";
                v37 = 1024;
                v38 = 627;
                v39 = 2080;
                v40 = (void *)v25;
                v41 = 2112;
                v42 = (VCRemoteVideoManager *)v10;
                v43 = 2048;
                v44 = (unint64_t)v20;
                v45 = 1024;
                v46 = v11;
                v47 = 1024;
                v48 = 0;
                _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCRemoteVideoManager: queue=%s --> set layer bounds=%@ caFenceHandle=%p for streamToken=%u(mode=%d)", (uint8_t *)&v33, 0x46u);
              }
            }
            else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              if (QueueForStreamToken)
                v26 = (const char *)objc_msgSend((id)objc_msgSend(QueueForStreamToken, "description"), "UTF8String");
              else
                v26 = "<nil>";
              v33 = 136316930;
              v34 = v22;
              v35 = 2080;
              v36 = "-[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:]";
              v37 = 1024;
              v38 = 627;
              v39 = 2080;
              v40 = (void *)v26;
              v41 = 2112;
              v42 = (VCRemoteVideoManager *)v10;
              v43 = 2048;
              v44 = (unint64_t)v20;
              v45 = 1024;
              v46 = v11;
              v47 = 1024;
              v48 = 0;
              _os_log_debug_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCRemoteVideoManager: queue=%s --> set layer bounds=%@ caFenceHandle=%p for streamToken=%u(mode=%d)", (uint8_t *)&v33, 0x46u);
            }
          }
          v27 = 0;
        }
        else
        {
          if ((VCRemoteVideoManager *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:].cold.4();
            }
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v30 = (const __CFString *)-[VCRemoteVideoManager performSelector:](self, "performSelector:", sel_logPrefix);
            else
              v30 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v31 = VRTraceErrorLogLevelToCSTR();
              v32 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                v33 = 136316418;
                v34 = v31;
                v35 = 2080;
                v36 = "-[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:]";
                v37 = 1024;
                v38 = 626;
                v39 = 2112;
                v40 = (void *)v30;
                v41 = 2048;
                v42 = self;
                v43 = 2048;
                v44 = v12;
                _os_log_error_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid CALayer for queue wiht streamToken=%ld", (uint8_t *)&v33, 0x3Au);
              }
            }
          }
          v27 = -3;
        }
        v28 = v21 ^ 1;
        objc_msgSend(v20, "invalidate");
        goto LABEL_21;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:].cold.5();
    }
LABEL_40:
    LOBYTE(v21) = 0;
    v28 = 1;
    v27 = -1;
    goto LABEL_21;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:].cold.2();
  }
  LOBYTE(v21) = 0;
  v28 = 1;
  v27 = -2;
LABEL_21:
  if (a4 && v28)
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCRemoteVideoManager"), v27, 0);
  return v21;
}

- (BOOL)setTransformForRemoteVideoOrientationEnabledWithArguments:(id)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *QueueForStreamToken;
  uint64_t v13;
  NSObject *v14;
  BOOL result;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("conferenceTransformForRemoteVideoOrientationEnabled"));
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRemoteVideoManager setTransformForRemoteVideoOrientationEnabledWithArguments:error:].cold.1();
    }
    v16 = -1;
    goto LABEL_18;
  }
  v10 = (void *)v8;
  v11 = objc_msgSend(v7, "unsignedIntValue");
  if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_queuesForStreamTokenDict, "objectForKeyedSubscript:", v7))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRemoteVideoManager setTransformForRemoteVideoOrientationEnabledWithArguments:error:].cold.2();
    }
    v16 = -2;
LABEL_18:
    if (!a4)
      return 0;
    v17 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCRemoteVideoManager"), v16, 0);
    result = 0;
    *a4 = v17;
    return result;
  }
  QueueForStreamToken = (void *)_VCRemoteVideoManager_GetQueueForStreamToken((uint64_t)self, v11, 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136316162;
      v19 = v13;
      v20 = 2080;
      v21 = "-[VCRemoteVideoManager setTransformForRemoteVideoOrientationEnabledWithArguments:error:]";
      v22 = 1024;
      v23 = 651;
      v24 = 2112;
      v25 = v10;
      v26 = 2048;
      v27 = v11;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting transformForRemoteVideoOrientationEnabled=%@ for streamToken=%ld", (uint8_t *)&v18, 0x30u);
    }
  }
  objc_msgSend(QueueForStreamToken, "setTransformForRemoteVideoOrientationEnabled:", objc_msgSend(v10, "BOOLValue"));
  return 1;
}

- (void)notifyCachedStateForStreamToken:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__VCRemoteVideoManager_notifyCachedStateForStreamToken___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

uint64_t __56__VCRemoteVideoManager_notifyCachedStateForStreamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedNotifyCachedStateForStreamToken:", *(_QWORD *)(a1 + 40));
}

- (void)dispatchedNotifyCachedStateForStreamToken:(id)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateCacheForStreamTokenDict, "objectForKeyedSubscript:", a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(a3, "unsignedIntegerValue");
      if (v5)
        v9 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      else
        v9 = "<nil>";
      v11 = 136316418;
      v12 = v6;
      v13 = 2080;
      v14 = "-[VCRemoteVideoManager dispatchedNotifyCachedStateForStreamToken:]";
      v15 = 1024;
      v16 = 671;
      v17 = 1024;
      v18 = 671;
      v19 = 2048;
      v20 = v8;
      v21 = 2080;
      v22 = v9;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCRemoteVideoManager.m:%d: token[%ld] state[%s]", (uint8_t *)&v11, 0x36u);
    }
  }
  if (v5)
  {
    v10 = objc_msgSend(a3, "unsignedIntegerValue");
    if (objc_msgSend(v5, "isMediaStalled"))
      -[VCRemoteVideoManager dispatchedRemoteMediaDidStall:streamToken:](self, "dispatchedRemoteMediaDidStall:streamToken:", objc_msgSend(v5, "isMediaStalled"), v10);
    if (objc_msgSend(v5, "isVideoPaused"))
      -[VCRemoteVideoManager dispatchedRemoteVideoDidPause:streamToken:](self, "dispatchedRemoteVideoDidPause:streamToken:", objc_msgSend(v5, "isVideoPaused"), v10);
    if (objc_msgSend(v5, "isVideoDegraded"))
      -[VCRemoteVideoManager dispatchedRemoteVideoDidDegrade:streamToken:](self, "dispatchedRemoteVideoDidDegrade:streamToken:", objc_msgSend(v5, "isVideoDegraded"), v10);
    if (objc_msgSend(v5, "isVideoSuspended"))
      -[VCRemoteVideoManager dispatchedRemoteVideoDidSuspend:streamToken:](self, "dispatchedRemoteVideoDidSuspend:streamToken:", objc_msgSend(v5, "isVideoSuspended"), v10);
    if (objc_msgSend(v5, "isNetworkDegraded") && objc_msgSend(v5, "isLocalNetworkDegraded"))
      -[VCRemoteVideoManager dispatchNetworkQualityDidDegrade:isLocalNetworkQualityDegraded:streamToken:](self, "dispatchNetworkQualityDidDegrade:isLocalNetworkQualityDegraded:streamToken:", objc_msgSend(v5, "isNetworkDegraded"), objc_msgSend(v5, "isLocalNetworkDegraded"), v10);
    if (objc_msgSend(v5, "remoteVideoAttributes"))
      _VCRemoteVideoManager_DispatchedRemoteVideoAttributesDidChange((uint64_t)self, (void *)objc_msgSend(v5, "remoteVideoAttributes"), v10);
    if (objc_msgSend(v5, "remoteScreenAttributes"))
      _VCRemoteVideoManager_DispatchedRemoteScreenAttributesDidChange((uint64_t)self, (void *)objc_msgSend(v5, "remoteScreenAttributes"), v10);
    if (objc_msgSend(v5, "hasReceivedFirstFrame"))
      _VCRemoteVideoManager_DispatchedDidReceiveFirstRemoteFrameForStreamToken((uint64_t)self, v10);
    if (objc_msgSend(v5, "localInterfaceType"))
    {
      if (objc_msgSend(v5, "remoteInterfaceType"))
        -[VCRemoteVideoManager dispatchedConnectionDidChangeWithLocalInterfaceType:remoteInterfaceType:streamToken:](self, "dispatchedConnectionDidChangeWithLocalInterfaceType:remoteInterfaceType:streamToken:", objc_msgSend(v5, "localInterfaceType"), objc_msgSend(v5, "remoteInterfaceType"), v10);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCRemoteVideoManager dispatchedNotifyCachedStateForStreamToken:].cold.1();
  }
}

- (void)registerBlocksForService
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__VCRemoteVideoManager_registerBlocksForService__block_invoke;
  v9[3] = &unk_1E9E53848;
  v9[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcRemoteVideoInitializeRemoteVideoForStreamToken", v9, self->_dispatchQueue);
  v4 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_133;
  v8[3] = &unk_1E9E53848;
  v8[4] = v4;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcRemoteVideoGetContextIdForStreamToken", v8, self->_dispatchQueue);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_2;
  v7[3] = &unk_1E9E53848;
  v7[4] = v4;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcRemoteVideoSetLayerBoundsForStreamToken", v7, self->_dispatchQueue);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_3;
  v6[3] = &unk_1E9E53848;
  v6[4] = v4;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcRemoteVideoSetTransformForRemoteVideoOrientationEnabled", v6, self->_dispatchQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcRemoteVideoTerminate", &__block_literal_global_137, self->_dispatchQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", v3, 3221225472, __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_140, &unk_1E9E53848, self), "registerBlockForService:block:queue:", "vcRemoteVideoGetCachedNotifications", &v5, self->_dispatchQueue);
}

uint64_t __48__VCRemoteVideoManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v6))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_cold_1(v11, v6, v12);
    }
    return 0;
  }
  v7 = objc_msgSend(v6, "unsignedIntValue");
  v21[0] = objc_msgSend(&unk_1E9EF5618, "stringValue");
  v22[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "slotForStreamToken:videoMode:", v7, 0));
  v21[1] = objc_msgSend(&unk_1E9EF5630, "stringValue");
  v22[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "slotForStreamToken:videoMode:", v7, 1));
  v21[2] = objc_msgSend(&unk_1E9EF5648, "stringValue");
  v22[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "slotForStreamToken:videoMode:", v7, 2));
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("CONTEXT"), v8, CFSTR("vcRemoteVideoSlotsForModes"), 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v14 = v9;
      v15 = 2080;
      v16 = "-[VCRemoteVideoManager registerBlocksForService]_block_invoke";
      v17 = 1024;
      v18 = 725;
      v19 = 2048;
      v20 = v7;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCRemoteVideoManager: new client initialized for streamToken=%ld", buf, 0x26u);
    }
  }
  return v4;
}

id __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_133(uint64_t a1, void *a2, uint64_t a3)
{
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  else
    return (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "contextIdForStreamTokenWithArguments:error:", a2, a3);
}

uint64_t __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "setLayerBoundsForStreamTokenWithArguments:error:", a2, a3);
  return 0;
}

uint64_t __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "setTransformForRemoteVideoOrientationEnabledWithArguments:error:", a2, a3);
  return 0;
}

uint64_t __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D80]);
    v3 = objc_msgSend(v4, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
  }
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v6;
      v11 = 2080;
      v12 = "-[VCRemoteVideoManager registerBlocksForService]_block_invoke_4";
      v13 = 1024;
      v14 = 774;
      v15 = 1024;
      v16 = objc_msgSend(v5, "unsignedIntValue");
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCRemoteVideoManager: Terminate connection for streamToken=%u", buf, 0x22u);
    }
  }
  return v3;
}

uint64_t __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_140(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend(*(id *)(a1 + 32), "dispatchedNotifyCachedStateForStreamToken:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID")));
  return 0;
}

uint64_t ___VCRemoteVideoManager_DispatchedDidReceiveFirstRemoteFrameForStreamToken_block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:toAllClientsWithContext:", "vcRemoteVideoDidReceiveRemoteFrame", 0, *(_QWORD *)(a1 + 32));
}

uint64_t ___VCRemoteVideoManager_DispatchedRemoteScreenAttributesDidChange_block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:toAllClientsWithContext:", "vcRemoteVideoDidRemoteScreenAttributesChange", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t ___VCRemoteVideoManager_DispatchedRemoteVideoAttributesDidChange_block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:toAllClientsWithContext:", "vcRemoteVideoDidRemoteAttributesChange", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __77__VCRemoteVideoManager_newQueueForStreamToken_videoMode_imageQueueProtected___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:]_block_invoke";
  v8 = 1024;
  v9 = 166;
  v10 = 2048;
  v11 = v3;
  _os_log_debug_impl(&dword_1D8A54000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d queuesForStreamToken exists for streamToken %ld", (uint8_t *)&v4, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)contextIdForStreamTokenWithArguments:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid streamToken and frameRect arguments", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)contextIdForStreamTokenWithArguments:(NSObject *)a3 error:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v4;
  int v5;
  uint64_t v6;
  uint8_t v7[24];
  int v8;
  __int16 v9;
  int v10;

  OUTLINED_FUNCTION_10_13(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  v8 = 586;
  v9 = v4;
  v10 = v5;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, a3, v6, " [%s] %s:%d VCRemoteVideoManager: video queue does not exist for streamToken=%u", v7);
  OUTLINED_FUNCTION_19();
}

- (void)setLayerBoundsForStreamTokenWithArguments:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid streamToken and frameRect arguments", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setLayerBoundsForStreamTokenWithArguments:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCRemoteVideoManager: video queue does not exist for streamToken=%ld", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setLayerBoundsForStreamTokenWithArguments:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid fenceHandle value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setLayerBoundsForStreamTokenWithArguments:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid CALayer for queue wiht streamToken=%ld", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setLayerBoundsForStreamTokenWithArguments:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid frameRect value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setTransformForRemoteVideoOrientationEnabledWithArguments:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid streamToken and transformEnabled arguments", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setTransformForRemoteVideoOrientationEnabledWithArguments:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCRemoteVideoManager: video queue does not exist for streamToken=%ld", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedNotifyCachedStateForStreamToken:.cold.1()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VCRemoteVideoManager dispatchedNotifyCachedStateForStreamToken:]";
  v4 = 1024;
  v5 = 707;
  v6 = 1024;
  v7 = 707;
  v8 = v0;
  v9 = "-[VCRemoteVideoManager dispatchedNotifyCachedStateForStreamToken:]";
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCRemoteVideoManager.m:%d: %s Error no VCRemoteVideoState for this stream token", v2, 0x2Cu);
  OUTLINED_FUNCTION_19();
}

void __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v4;
  int v5;
  uint64_t v6;
  uint8_t v7[24];
  int v8;
  __int16 v9;
  int v10;

  OUTLINED_FUNCTION_10_13(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  v8 = 727;
  v9 = v4;
  v10 = v5;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, a3, v6, " [%s] %s:%d VCRemoteVideoManager: ERROR video queue does not exist for streamToken=%u", v7);
  OUTLINED_FUNCTION_19();
}

@end
