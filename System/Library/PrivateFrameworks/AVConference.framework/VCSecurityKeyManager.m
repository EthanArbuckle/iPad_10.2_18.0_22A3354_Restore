@implementation VCSecurityKeyManager

- (VCSecurityKeyManager)initWithDelegate:(id)a3 options:(const tagVCSecurityKeyManagerOptions *)a4
{
  VCSecurityKeyManager *v6;
  VCSecurityKeyManager *v7;
  NSObject *CustomRootQueue;
  double v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  VCSecurityKeyManager *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)VCSecurityKeyManager;
  v6 = -[VCSecurityKeyManager init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak(&v6->_delegate, a3);
    v7->_sendKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7->_receiveKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7->_prunePendingReceiveKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7->_latestSendKeyIndex = 0;
    v7->_latestReceiveKeyIndex = 0;
    v7->_keyIndexNotReceived = 0;
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v7->_keyManagerQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSecurityKeyManager.keyManagerQueue", 0, CustomRootQueue);
    v7->_unknownKeyIndexList = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a4)
    {
      v7->_shortMKIForOneToOneEnabled = a4->var0;
      v7->_shortMKIForGFTEnabled = a4->var1;
    }
    v7->_forceRemoteMKMMissing = +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("forceRemoteMKMMissing"), 0);
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("keyMaterialNotUsedTimeout"), 35.0);
    v7->_keyMaterialNotUsedTimeout = v9;
    if ((VCSecurityKeyManager *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v21 = v11;
          v22 = 2080;
          v23 = "-[VCSecurityKeyManager initWithDelegate:options:]";
          v24 = 1024;
          v25 = 121;
          v26 = 2048;
          v27 = a3;
          v13 = " [%s] %s:%d security delegate %p";
          v14 = v12;
          v15 = 38;
LABEL_14:
          _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCSecurityKeyManager performSelector:](v7, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v21 = v16;
          v22 = 2080;
          v23 = "-[VCSecurityKeyManager initWithDelegate:options:]";
          v24 = 1024;
          v25 = 121;
          v26 = 2112;
          v27 = (id)v10;
          v28 = 2048;
          v29 = v7;
          v30 = 2048;
          v31 = a3;
          v13 = " [%s] %s:%d %@(%p) security delegate %p";
          v14 = v17;
          v15 = 58;
          goto LABEL_14;
        }
      }
    }
  }
  return v7;
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
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCSecurityKeyManager *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((VCSecurityKeyManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v4;
        v14 = 2080;
        v15 = "-[VCSecurityKeyManager dealloc]";
        v16 = 1024;
        v17 = 127;
        v6 = " [%s] %s:%d deallocating";
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
      v3 = (const __CFString *)-[VCSecurityKeyManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCSecurityKeyManager dealloc]";
        v16 = 1024;
        v17 = 127;
        v18 = 2112;
        v19 = v3;
        v20 = 2048;
        v21 = self;
        v6 = " [%s] %s:%d %@(%p) deallocating";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  -[VCSecurityKeyManager releaseTimers](self, "releaseTimers");
  objc_storeWeak(&self->_delegate, 0);
  objc_storeWeak(&self->_reportingAgentWeak, 0);

  dispatch_release((dispatch_object_t)self->_keyManagerQueue);
  v11.receiver = self;
  v11.super_class = (Class)VCSecurityKeyManager;
  -[VCSecurityKeyManager dealloc](&v11, sel_dealloc);
}

- (id)delegate
{
  if (self->_isRunning)
    return objc_loadWeak(&self->_delegate);
  else
    return 0;
}

- (int64_t)getNotUsedTimeout
{
  return (uint64_t)self->_keyMaterialNotUsedTimeout;
}

- (id)logPrefix
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("instance=%p"), self);
}

- (void)start
{
  NSObject *keyManagerQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  keyManagerQueue = self->_keyManagerQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__VCSecurityKeyManager_start__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(keyManagerQueue, v3);
}

void __29__VCSecurityKeyManager_start__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[136])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = v3;
        v13 = 2080;
        v14 = "-[VCSecurityKeyManager start]_block_invoke";
        v15 = 1024;
        v16 = 162;
        v5 = " [%s] %s:%d Security key manager is already started";
        v6 = v4;
        v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, v7);
      }
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = objc_msgSend(v2, "startTimers");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 136))
          v10 = CFSTR("started");
        else
          v10 = CFSTR("failed to start");
        v11 = 136315906;
        v12 = v8;
        v13 = 2080;
        v14 = "-[VCSecurityKeyManager start]_block_invoke";
        v15 = 1024;
        v16 = 160;
        v17 = 2112;
        v18 = v10;
        v5 = " [%s] %s:%d Security key manager start result=[%@]";
        v6 = v9;
        v7 = 38;
        goto LABEL_11;
      }
    }
  }
}

- (void)stop
{
  NSObject *keyManagerQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  keyManagerQueue = self->_keyManagerQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__VCSecurityKeyManager_stop__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(keyManagerQueue, v3);
}

void __28__VCSecurityKeyManager_stop__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 136))
  {
    *(_BYTE *)(v1 + 136) = 0;
    objc_msgSend(*(id *)(a1 + 32), "stopTimers");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315650;
        v7 = v2;
        v8 = 2080;
        v9 = "-[VCSecurityKeyManager stop]_block_invoke";
        v10 = 1024;
        v11 = 172;
        v4 = " [%s] %s:%d Security key manager stopped";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v6, 0x1Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = v5;
      v8 = 2080;
      v9 = "-[VCSecurityKeyManager stop]_block_invoke";
      v10 = 1024;
      v11 = 174;
      v4 = " [%s] %s:%d MW control channel already stopped";
      goto LABEL_8;
    }
  }
}

- (void)releaseTimers
{
  NSObject *pruneTimer;
  NSObject *v4;
  NSObject *encryptionKeyRollTimer;
  NSObject *v6;

  pruneTimer = self->_pruneTimer;
  if (pruneTimer)
  {
    dispatch_source_cancel(pruneTimer);
    v4 = self->_pruneTimer;
    if (v4)
    {
      dispatch_release(v4);
      self->_pruneTimer = 0;
    }
  }
  encryptionKeyRollTimer = self->_encryptionKeyRollTimer;
  if (encryptionKeyRollTimer)
  {
    dispatch_source_cancel(encryptionKeyRollTimer);
    v6 = self->_encryptionKeyRollTimer;
    if (v6)
    {
      dispatch_release(v6);
      self->_encryptionKeyRollTimer = 0;
    }
  }
}

- (BOOL)startTimers
{
  OS_dispatch_source *v3;
  uint64_t v4;
  NSObject *pruneTimer;
  OS_dispatch_source *v6;
  NSObject *encryptionKeyRollTimer;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  VCSecurityKeyManager *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_keyManagerQueue);
  self->_pruneTimer = v3;
  if (!v3)
  {
    if ((VCSecurityKeyManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSecurityKeyManager startTimers].cold.1();
      }
      goto LABEL_23;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCSecurityKeyManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_23;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_DWORD *)buf = 136316162;
    v20 = v11;
    v21 = 2080;
    v22 = "-[VCSecurityKeyManager startTimers]";
    v23 = 1024;
    v24 = 196;
    v25 = 2112;
    v26 = v9;
    v27 = 2048;
    v28 = self;
    v13 = " [%s] %s:%d %@(%p) Failed to create pruneTimer";
LABEL_25:
    _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x30u);
    goto LABEL_23;
  }
  v4 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __35__VCSecurityKeyManager_startTimers__block_invoke;
  handler[3] = &unk_1E9E521C0;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v3, handler);
  pruneTimer = self->_pruneTimer;
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __35__VCSecurityKeyManager_startTimers__block_invoke_2;
  v17[3] = &unk_1E9E521C0;
  v17[4] = self;
  dispatch_source_set_cancel_handler(pruneTimer, v17);
  dispatch_resume((dispatch_object_t)self->_pruneTimer);
  v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_keyManagerQueue);
  self->_encryptionKeyRollTimer = v6;
  if (v6)
  {
    v16[0] = v4;
    v16[1] = 3221225472;
    v16[2] = __35__VCSecurityKeyManager_startTimers__block_invoke_41;
    v16[3] = &unk_1E9E521C0;
    v16[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v6, v16);
    encryptionKeyRollTimer = self->_encryptionKeyRollTimer;
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __35__VCSecurityKeyManager_startTimers__block_invoke_42;
    v15[3] = &unk_1E9E521C0;
    v15[4] = self;
    dispatch_source_set_cancel_handler(encryptionKeyRollTimer, v15);
    dispatch_resume((dispatch_object_t)self->_encryptionKeyRollTimer);
    return 1;
  }
  if ((VCSecurityKeyManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSecurityKeyManager startTimers].cold.2();
    }
    goto LABEL_23;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = (const __CFString *)-[VCSecurityKeyManager performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v10 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = v14;
      v21 = 2080;
      v22 = "-[VCSecurityKeyManager startTimers]";
      v23 = 1024;
      v24 = 208;
      v25 = 2112;
      v26 = v10;
      v27 = 2048;
      v28 = self;
      v13 = " [%s] %s:%d %@(%p) Failed to create encryptionKeyRollTimer";
      goto LABEL_25;
    }
  }
LABEL_23:
  -[VCSecurityKeyManager releaseTimers](self, "releaseTimers");
  return 0;
}

uint64_t __35__VCSecurityKeyManager_startTimers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePruneTimerEventAndReschedule");
}

void __35__VCSecurityKeyManager_startTimers__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
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
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 120);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCSecurityKeyManager startTimers]_block_invoke_2";
      v9 = 1024;
      v10 = 202;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d pruneTimer cancelled", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

uint64_t __35__VCSecurityKeyManager_startTimers__block_invoke_41(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v2;
      v7 = 2080;
      v8 = "-[VCSecurityKeyManager startTimers]_block_invoke";
      v9 = 1024;
      v10 = 210;
      v11 = 1024;
      v12 = 30;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Encryption key material has failed to roll at boundary=%d seconds, calling didEncryptionKeyRollTimeout", (uint8_t *)&v5, 0x22u);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didEncryptionKeyRollTimeout");
}

void __35__VCSecurityKeyManager_startTimers__block_invoke_42(uint64_t a1)
{
  NSObject *v2;
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
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 128);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCSecurityKeyManager startTimers]_block_invoke";
      v9 = 1024;
      v10 = 215;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Encryption roll timer cancelled", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)stopTimers
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_pruneTimer)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315650;
        v8 = v3;
        v9 = 2080;
        v10 = "-[VCSecurityKeyManager stopTimers]";
        v11 = 1024;
        v12 = 230;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cancelling pruneTimer", (uint8_t *)&v7, 0x1Cu);
      }
    }
    dispatch_source_cancel((dispatch_source_t)self->_pruneTimer);
  }
  if (self->_encryptionKeyRollTimer)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315650;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCSecurityKeyManager stopTimers]";
        v11 = 1024;
        v12 = 234;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cancelling encryption key roll timer", (uint8_t *)&v7, 0x1Cu);
      }
    }
    dispatch_source_cancel((dispatch_source_t)self->_encryptionKeyRollTimer);
  }
}

- (BOOL)addSecurityKeyMaterial:(id)a3
{
  return -[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:](self, "addSecurityKeyMaterial:securityKeyMode:", a3, 2);
}

- (BOOL)addSecurityKeyMaterial:(id)a3 securityKeyMode:(char)a4
{
  uint64_t v7;
  uint64_t v8;
  NSObject *keyManagerQueue;
  _QWORD block[7];
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SecurityKeyIndex"));
  if (v7)
  {
    v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SecurityKeyIndex"));
    keyManagerQueue = self->_keyManagerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__VCSecurityKeyManager_addSecurityKeyMaterial_securityKeyMode___block_invoke;
    block[3] = &unk_1E9E53608;
    block[4] = self;
    block[5] = v8;
    block[6] = a3;
    v12 = a4;
    dispatch_sync(keyManagerQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:].cold.1();
  }
  return v7 != 0;
}

void __63__VCSecurityKeyManager_addSecurityKeyMaterial_securityKeyMode___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  __CFNotificationCenter *LocalCenter;
  const __CFString *v22;
  __CFNotificationCenter *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[24];
  __int128 v50;
  uint64_t v51;
  _BYTE v52[32];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40))
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v6 = *(_QWORD *)(a1 + 32);
          v5 = *(_QWORD *)(a1 + 40);
          v8 = *(_QWORD *)(v6 + 40);
          v7 = *(_QWORD *)(v6 + 48);
          *(_DWORD *)v49 = 136316418;
          *(_QWORD *)&v49[4] = v3;
          *(_WORD *)&v49[12] = 2080;
          *(_QWORD *)&v49[14] = "-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]_block_invoke";
          *(_WORD *)&v49[22] = 1024;
          LODWORD(v50) = 255;
          WORD2(v50) = 2112;
          *(_QWORD *)((char *)&v50 + 6) = v5;
          HIWORD(v50) = 2112;
          v51 = v8;
          *(_WORD *)v52 = 2112;
          *(_QWORD *)&v52[2] = v7;
          v9 = " [%s] %s:%d Found duplicate key index '%@': sendKeys (%@), receiveKeys (%@) passed down from IDS. Updating key material";
          v10 = v4;
          v11 = 58;
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v49, v11);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v2 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(_QWORD *)(a1 + 32);
          v15 = *(_QWORD *)(a1 + 40);
          v16 = *(_QWORD *)(v14 + 40);
          v17 = *(_QWORD *)(v14 + 48);
          *(_DWORD *)v49 = 136316930;
          *(_QWORD *)&v49[4] = v12;
          *(_WORD *)&v49[12] = 2080;
          *(_QWORD *)&v49[14] = "-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]_block_invoke";
          *(_WORD *)&v49[22] = 1024;
          LODWORD(v50) = 255;
          WORD2(v50) = 2112;
          *(_QWORD *)((char *)&v50 + 6) = v2;
          HIWORD(v50) = 2048;
          v51 = v14;
          *(_WORD *)v52 = 2112;
          *(_QWORD *)&v52[2] = v15;
          *(_WORD *)&v52[10] = 2112;
          *(_QWORD *)&v52[12] = v16;
          *(_WORD *)&v52[20] = 2112;
          *(_QWORD *)&v52[22] = v17;
          v9 = " [%s] %s:%d %@(%p) Found duplicate key index '%@': sendKeys (%@), receiveKeys (%@) passed down from IDS. "
               "Updating key material";
          v10 = v13;
          v11 = 78;
          goto LABEL_13;
        }
      }
    }
  }
  v18 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v18 + 90))
  {
    objc_msgSend(*(id *)(v18 + 48), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
LABEL_20:
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("SecurityLocallyGenerated"), *(_OWORD *)v49, *(_QWORD *)&v49[16], v50, v51, *(_OWORD *)v52, *(_OWORD *)&v52[16]), "BOOLValue"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      if (!VCMediaKeyIndex_isEqual(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(a1 + 40)))
      {
        objc_msgSend(*(id *)(a1 + 32), "notifyEncryptionInfoChange:securityKeyMode:", *(_QWORD *)(a1 + 48), *(char *)(a1 + 56));
        VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)(*(_QWORD *)(a1 + 32) + 64), *(void **)(a1 + 40));
        LocalCenter = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(LocalCenter, CFSTR("VCSecurityKeyManagerNotification_SendKeyMaterialChanged"), *(const void **)(a1 + 32), *(CFDictionaryRef *)(a1 + 48), 1u);
        if (objc_opt_class() == *(_QWORD *)(a1 + 32))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_45;
          v39 = VRTraceErrorLogLevelToCSTR();
          v40 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_45;
          v41 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)v49 = 136315906;
          *(_QWORD *)&v49[4] = v39;
          *(_WORD *)&v49[12] = 2080;
          *(_QWORD *)&v49[14] = "-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]_block_invoke";
          *(_WORD *)&v49[22] = 1024;
          LODWORD(v50) = 278;
          WORD2(v50) = 2112;
          *(_QWORD *)((char *)&v50 + 6) = v41;
          v42 = " [%s] %s:%d Received keyIndex '%@', calling scheduleEncryptionRollTimer";
          v43 = v40;
          v44 = 38;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v22 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
          else
            v22 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_45;
          v45 = VRTraceErrorLogLevelToCSTR();
          v46 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_45;
          v47 = *(_QWORD *)(a1 + 32);
          v48 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)v49 = 136316418;
          *(_QWORD *)&v49[4] = v45;
          *(_WORD *)&v49[12] = 2080;
          *(_QWORD *)&v49[14] = "-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]_block_invoke";
          *(_WORD *)&v49[22] = 1024;
          LODWORD(v50) = 278;
          WORD2(v50) = 2112;
          *(_QWORD *)((char *)&v50 + 6) = v22;
          HIWORD(v50) = 2048;
          v51 = v47;
          *(_WORD *)v52 = 2112;
          *(_QWORD *)&v52[2] = v48;
          v42 = " [%s] %s:%d %@(%p) Received keyIndex '%@', calling scheduleEncryptionRollTimer";
          v43 = v46;
          v44 = 58;
        }
        _os_log_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_DEFAULT, v42, v49, v44);
LABEL_45:
        objc_msgSend(*(id *)(a1 + 32), "scheduleEncryptionRollTimerWithDelay:", 1230.0, *(_QWORD *)v49, *(_OWORD *)&v49[8], v50, v51, *(_QWORD *)v52, *(_QWORD *)&v52[8]);
      }
LABEL_46:
      VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)(*(_QWORD *)(a1 + 32) + 72), *(void **)(a1 + 40));
      return;
    }
    v23 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v23, CFSTR("VCSecurityKeyManagerNotification_ReceiveKeyMaterialChanged"), *(const void **)(a1 + 32), *(CFDictionaryRef *)(a1 + 48), 1u);
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_36;
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      v27 = *(_QWORD *)(a1 + 40);
      v28 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("SecurityIDSParticipantID"));
      v29 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("SecurityShortKeyIndexLength"));
      *(_DWORD *)v49 = 136316418;
      *(_QWORD *)&v49[4] = v25;
      *(_WORD *)&v49[12] = 2080;
      *(_QWORD *)&v49[14] = "-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]_block_invoke";
      *(_WORD *)&v49[22] = 1024;
      LODWORD(v50) = 285;
      WORD2(v50) = 2112;
      *(_QWORD *)((char *)&v50 + 6) = v27;
      HIWORD(v50) = 2112;
      v51 = v28;
      *(_WORD *)v52 = 2112;
      *(_QWORD *)&v52[2] = v29;
      v30 = " [%s] %s:%d Received keyIndex '%@' for participantID '%@' with shortMKILength '%@', calling resetDecryptionTimeout";
      v31 = v26;
      v32 = 58;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v24 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_36;
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      v35 = *(_QWORD *)(a1 + 32);
      v36 = *(_QWORD *)(a1 + 40);
      v37 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("SecurityIDSParticipantID"));
      v38 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("SecurityShortKeyIndexLength"));
      *(_DWORD *)v49 = 136316930;
      *(_QWORD *)&v49[4] = v33;
      *(_WORD *)&v49[12] = 2080;
      *(_QWORD *)&v49[14] = "-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]_block_invoke";
      *(_WORD *)&v49[22] = 1024;
      LODWORD(v50) = 285;
      WORD2(v50) = 2112;
      *(_QWORD *)((char *)&v50 + 6) = v24;
      HIWORD(v50) = 2048;
      v51 = v35;
      *(_WORD *)v52 = 2112;
      *(_QWORD *)&v52[2] = v36;
      *(_WORD *)&v52[10] = 2112;
      *(_QWORD *)&v52[12] = v37;
      *(_WORD *)&v52[20] = 2112;
      *(_QWORD *)&v52[22] = v38;
      v30 = " [%s] %s:%d %@(%p) Received keyIndex '%@' for participantID '%@' with shortMKILength '%@', calling resetDecryptionTimeout";
      v31 = v34;
      v32 = 78;
    }
    _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, v30, v49, v32);
LABEL_36:
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_QWORD *)v49, *(_OWORD *)&v49[8], v50, v51, *(_QWORD *)v52, *(_QWORD *)&v52[8], *(_QWORD *)&v52[16], *(_QWORD *)&v52[24]), "resetDecryptionTimeout");
    goto LABEL_46;
  }
  if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("SecurityLocallyGenerated")), "BOOLValue") & 1) != 0)goto LABEL_20;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v49 = 136315650;
      *(_QWORD *)&v49[4] = v19;
      *(_WORD *)&v49[12] = 2080;
      *(_QWORD *)&v49[14] = "-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]_block_invoke";
      *(_WORD *)&v49[22] = 1024;
      LODWORD(v50) = 259;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Will not add remote MKM per default override.", v49, 0x1Cu);
    }
  }
}

- (id)getSendKeyMaterialWithIndex:(id)a3
{
  NSObject *keyManagerQueue;
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
  v10 = __Block_byref_object_copy__26;
  v11 = __Block_byref_object_dispose__26;
  v12 = 0;
  keyManagerQueue = self->_keyManagerQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__VCSecurityKeyManager_getSendKeyMaterialWithIndex___block_invoke;
  v6[3] = &unk_1E9E550C8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = &v7;
  dispatch_sync(keyManagerQueue, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __52__VCSecurityKeyManager_getSendKeyMaterialWithIndex___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  int v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      v16 = *(const __CFString **)(a1 + 40);
      v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
      v26 = 136316162;
      v27 = v14;
      v28 = 2080;
      v29 = "-[VCSecurityKeyManager getSendKeyMaterialWithIndex:]_block_invoke";
      v30 = 1024;
      v31 = 302;
      v32 = 2112;
      v33 = v16;
      v34 = 1024;
      LODWORD(v35) = v17;
      v18 = " [%s] %s:%d Cannot find keyIndex '%@' in send keys array of %d elements";
      v19 = v15;
      v20 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      v24 = *(_QWORD *)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 40);
      v25 = objc_msgSend(*(id *)(v24 + 40), "count");
      v26 = 136316674;
      v27 = v21;
      v28 = 2080;
      v29 = "-[VCSecurityKeyManager getSendKeyMaterialWithIndex:]_block_invoke";
      v30 = 1024;
      v31 = 302;
      v32 = 2112;
      v33 = v3;
      v34 = 2048;
      v35 = v24;
      v36 = 2112;
      v37 = v23;
      v38 = 1024;
      v39 = v25;
      v18 = " [%s] %s:%d %@(%p) Cannot find keyIndex '%@' in send keys array of %d elements";
      v19 = v22;
      v20 = 64;
    }
    _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v26, v20);
    return;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(const __CFString **)(a1 + 40);
        v26 = 136315906;
        v27 = v4;
        v28 = 2080;
        v29 = "-[VCSecurityKeyManager getSendKeyMaterialWithIndex:]_block_invoke";
        v30 = 1024;
        v31 = 300;
        v32 = 2112;
        v33 = v6;
        v7 = " [%s] %s:%d Found keyIndex '%@' in send keys in key manager";
        v8 = v5;
        v9 = 38;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v26, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        v26 = 136316418;
        v27 = v10;
        v28 = 2080;
        v29 = "-[VCSecurityKeyManager getSendKeyMaterialWithIndex:]_block_invoke";
        v30 = 1024;
        v31 = 300;
        v32 = 2112;
        v33 = v2;
        v34 = 2048;
        v35 = v12;
        v36 = 2112;
        v37 = v13;
        v7 = " [%s] %s:%d %@(%p) Found keyIndex '%@' in send keys in key manager";
        v8 = v11;
        v9 = 58;
        goto LABEL_15;
      }
    }
  }
}

- (id)getRecvKeyMaterialWithIndex:(id)a3
{
  NSObject *keyManagerQueue;
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
  v10 = __Block_byref_object_copy__26;
  v11 = __Block_byref_object_dispose__26;
  v12 = 0;
  keyManagerQueue = self->_keyManagerQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__VCSecurityKeyManager_getRecvKeyMaterialWithIndex___block_invoke;
  v6[3] = &unk_1E9E550C8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = &v7;
  dispatch_sync(keyManagerQueue, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __52__VCSecurityKeyManager_getRecvKeyMaterialWithIndex___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v6 = *(const __CFString **)(a1 + 32);
          v5 = *(_QWORD *)(a1 + 40);
          v7 = objc_msgSend(v6[1].data, "count");
          v16 = 136316418;
          v17 = v3;
          v18 = 2080;
          v19 = "-[VCSecurityKeyManager getRecvKeyMaterialWithIndex:]_block_invoke";
          v20 = 1024;
          v21 = 314;
          v22 = 2048;
          v23 = v6;
          v24 = 2112;
          v25 = v5;
          v26 = 1024;
          LODWORD(v27) = v7;
          v8 = " [%s] %s:%d %p Found keyIndex '%@' in receive keys array of %d elements";
          v9 = v4;
          v10 = 54;
LABEL_12:
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v16, v10);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v2 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(_QWORD *)(a1 + 32);
          v13 = *(_QWORD *)(a1 + 40);
          v15 = objc_msgSend(*(id *)(v14 + 48), "count");
          v16 = 136316930;
          v17 = v11;
          v18 = 2080;
          v19 = "-[VCSecurityKeyManager getRecvKeyMaterialWithIndex:]_block_invoke";
          v20 = 1024;
          v21 = 314;
          v22 = 2112;
          v23 = v2;
          v24 = 2048;
          v25 = v14;
          v26 = 2048;
          v27 = v14;
          v28 = 2112;
          v29 = v13;
          v30 = 1024;
          v31 = v15;
          v8 = " [%s] %s:%d %@(%p) %p Found keyIndex '%@' in receive keys array of %d elements";
          v9 = v12;
          v10 = 74;
          goto LABEL_12;
        }
      }
    }
  }
}

- (void)notifyEncryptionInfoChange:(id)a3 securityKeyMode:(char)a4
{
  uint64_t v4;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  -[VCSecurityKeyManager adjustMKILength:securityKeyMode:](self, "adjustMKILength:securityKeyMode:", v6, v4);
  objc_msgSend(-[VCSecurityKeyManager delegate](self, "delegate"), "handleEncryptionInfoChange:", v6);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316162;
      v10 = v7;
      v11 = 2080;
      v12 = "-[VCSecurityKeyManager notifyEncryptionInfoChange:securityKeyMode:]";
      v13 = 1024;
      v14 = 324;
      v15 = 1024;
      v16 = 324;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSecurityKeyManager.m:%d: Notified of new keyMaterial '%@'", (uint8_t *)&v9, 0x2Cu);
    }
  }

}

- (void)replaceMKIWithShortMKI:(id)a3
{
  void *v4;
  VCMediaKeyIndex *v5;
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
  __int16 v16;
  VCMediaKeyIndex *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SecurityShortKeyIndexLength"));
  v18[0] = 0;
  v18[1] = 0;
  VCMediaKeyIndex_FullKeyBytes((void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SecurityKeyIndex")), (const char *)v18);
  v5 = -[VCMediaKeyIndex initWithBytes:bufferSize:uniquePrefixLength:]([VCMediaKeyIndex alloc], "initWithBytes:bufferSize:uniquePrefixLength:", v18, 16, objc_msgSend(v4, "unsignedLongLongValue"));
  objc_msgSend(a3, "setObject:forKeyedSubscript:", v5, CFSTR("SecurityKeyIndex"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCSecurityKeyManager replaceMKIWithShortMKI:]";
      v12 = 1024;
      v13 = 334;
      v14 = 1024;
      v15 = 334;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSecurityKeyManager.m:%d: Adjusted mediaKeyIndex to '%@'", (uint8_t *)&v8, 0x2Cu);
    }
  }

}

- (void)adjustMKILength:(id)a3 securityKeyMode:(char)a4
{
  int v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  switch(a4)
  {
    case -1:
    case 3:
      v6 = a4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v9 = 136316162;
          v10 = v7;
          v11 = 2080;
          v12 = "-[VCSecurityKeyManager adjustMKILength:securityKeyMode:]";
          v13 = 1024;
          v14 = 355;
          v15 = 1024;
          v16 = v6;
          v17 = 2112;
          v18 = a3;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d MKI length adjustment for invalid key mode=%d requested for keyMaterial=%@", (uint8_t *)&v9, 0x2Cu);
        }
      }
      break;
    case 0:
      if (self->_shortMKIForGFTEnabled && VCFeatureFlagManager_UseTLE())
        goto LABEL_10;
      break;
    case 1:
      if (self->_shortMKIForOneToOneEnabled && VCFeatureFlagManager_U1AuthTagEnabled())
      {
LABEL_10:
        if (VCFeatureFlagManager_UseShortMKI())
          -[VCSecurityKeyManager replaceMKIWithShortMKI:](self, "replaceMKIWithShortMKI:", a3);
      }
      break;
    default:
      return;
  }
}

- (id)latestSendKeyMaterialWithSecurityKeyMode:(char)a3
{
  NSObject *keyManagerQueue;
  void *v4;
  _QWORD v6[6];
  char v7;
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
  v11 = __Block_byref_object_copy__26;
  v12 = __Block_byref_object_dispose__26;
  v13 = 0;
  keyManagerQueue = self->_keyManagerQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__VCSecurityKeyManager_latestSendKeyMaterialWithSecurityKeyMode___block_invoke;
  v6[3] = &unk_1E9E56258;
  v6[4] = self;
  v6[5] = &v8;
  v7 = a3;
  dispatch_sync(keyManagerQueue, v6);
  v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __65__VCSecurityKeyManager_latestSendKeyMaterialWithSecurityKeyMode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 8) + 8) + 40) = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32)+ 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64)), "mutableCopy");
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 8) + 8) + 40);
  if (v3
    && (objc_msgSend(*(id *)(a1 + 32), "adjustMKILength:securityKeyMode:", v3, *(char *)(a1 + 48)),
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)))
  {
    if (objc_opt_class() == *(_QWORD *)v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("SecurityKeyIndex"));
          v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
          v24 = 136316162;
          v25 = v6;
          v26 = 2080;
          v27 = "-[VCSecurityKeyManager latestSendKeyMaterialWithSecurityKeyMode:]_block_invoke";
          v28 = 1024;
          v29 = 370;
          v30 = 2112;
          v31 = v8;
          v32 = 1024;
          LODWORD(v33) = v9;
          v10 = " [%s] %s:%d Found _latestSendKeyIndex '%@' in send keys array of %d elements";
          v11 = v7;
          v12 = 44;
LABEL_16:
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v24, v12);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*(id *)v2, "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(void **)(a1 + 32);
          v16 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("SecurityKeyIndex"));
          v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
          v24 = 136316674;
          v25 = v13;
          v26 = 2080;
          v27 = "-[VCSecurityKeyManager latestSendKeyMaterialWithSecurityKeyMode:]_block_invoke";
          v28 = 1024;
          v29 = 370;
          v30 = 2112;
          v31 = (uint64_t)v4;
          v32 = 2048;
          v33 = v15;
          v34 = 2112;
          v35 = v16;
          v36 = 1024;
          v37 = v17;
          v10 = " [%s] %s:%d %@(%p) Found _latestSendKeyIndex '%@' in send keys array of %d elements";
          v11 = v14;
          v12 = 64;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    if (objc_opt_class() == *(_QWORD *)v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __65__VCSecurityKeyManager_latestSendKeyMaterialWithSecurityKeyMode___block_invoke_cold_1(v18, v2);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)objc_msgSend(*(id *)v2, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v21 = *(id *)v2;
          v22 = *(_QWORD *)(*(_QWORD *)v2 + 64);
          v23 = objc_msgSend(*(id *)(*(_QWORD *)v2 + 40), "count");
          v24 = 136316674;
          v25 = v19;
          v26 = 2080;
          v27 = "-[VCSecurityKeyManager latestSendKeyMaterialWithSecurityKeyMode:]_block_invoke";
          v28 = 1024;
          v29 = 372;
          v30 = 2112;
          v31 = (uint64_t)v5;
          v32 = 2048;
          v33 = v21;
          v34 = 2112;
          v35 = v22;
          v36 = 1024;
          v37 = v23;
          _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Cannot find _latestSendKeyIndex '%@' in receive keys array of %d elements. Invalidating it...", (uint8_t *)&v24, 0x40u);
        }
      }
    }
    VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)(*(_QWORD *)v2 + 64), 0);
  }
}

- (id)getLatestRecvKeyMaterial
{
  NSObject *keyManagerQueue;
  void *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  v11 = 0;
  keyManagerQueue = self->_keyManagerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__VCSecurityKeyManager_getLatestRecvKeyMaterial__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(keyManagerQueue, block);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __48__VCSecurityKeyManager_getLatestRecvKeyMaterial__block_invoke(uint64_t a1)
{
  id *v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  id *v7;
  const __CFString *v8;
  int v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)objc_msgSend(*((id *)*v2 + 6), "objectForKeyedSubscript:", *((_QWORD *)*v2 + 9));
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v7 = (id *)*v2;
          v8 = (const __CFString *)*((_QWORD *)*v2 + 9);
          v9 = objc_msgSend(v7[6], "count");
          v24 = 136316162;
          v25 = v5;
          v26 = 2080;
          v27 = "-[VCSecurityKeyManager getLatestRecvKeyMaterial]_block_invoke";
          v28 = 1024;
          v29 = 385;
          v30 = 2112;
          v31 = v8;
          v32 = 1024;
          LODWORD(v33) = v9;
          v10 = " [%s] %s:%d Found keyIndex '%@' in receive keys array of %d elements";
          v11 = v6;
          v12 = 44;
LABEL_15:
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v24, v12);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v15 = *v2;
          v16 = *((_QWORD *)v15 + 9);
          v17 = objc_msgSend(*((id *)v15 + 6), "count");
          v24 = 136316674;
          v25 = v13;
          v26 = 2080;
          v27 = "-[VCSecurityKeyManager getLatestRecvKeyMaterial]_block_invoke";
          v28 = 1024;
          v29 = 385;
          v30 = 2112;
          v31 = v3;
          v32 = 2048;
          v33 = v15;
          v34 = 2112;
          v35 = v16;
          v36 = 1024;
          v37 = v17;
          v10 = " [%s] %s:%d %@(%p) Found keyIndex '%@' in receive keys array of %d elements";
          v11 = v14;
          v12 = 64;
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    if ((id)objc_opt_class() == *v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __48__VCSecurityKeyManager_getLatestRecvKeyMaterial__block_invoke_cold_1(v18, (uint64_t)v2);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v21 = *v2;
          v22 = *((_QWORD *)*v2 + 9);
          v23 = objc_msgSend(*((id *)*v2 + 6), "count");
          v24 = 136316674;
          v25 = v19;
          v26 = 2080;
          v27 = "-[VCSecurityKeyManager getLatestRecvKeyMaterial]_block_invoke";
          v28 = 1024;
          v29 = 387;
          v30 = 2112;
          v31 = v4;
          v32 = 2048;
          v33 = v21;
          v34 = 2112;
          v35 = v22;
          v36 = 1024;
          v37 = v23;
          _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Cannot find _latestReceiveKeyIndex '%@' in receive keys array of %d elements. Invalidating it...", (uint8_t *)&v24, 0x40u);
        }
      }
    }
    VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)*v2 + 9, 0);
  }
}

- (void)pruneSendKeyMaterialWithDelay:(double)a3
{
  double v5;
  dispatch_time_t v6;
  NSObject *keyManagerQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v5 = micro();
  self->_isSendKeysCleanUpPending = 1;
  v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  keyManagerQueue = self->_keyManagerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VCSecurityKeyManager_pruneSendKeyMaterialWithDelay___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  *(double *)&block[5] = v5;
  dispatch_after(v6, keyManagerQueue, block);
}

uint64_t __54__VCSecurityKeyManager_pruneSendKeyMaterialWithDelay___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  const __CFString *v18;
  double v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t result;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  __int128 v39;
  id obj;
  _BYTE v41[128];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  const __CFString *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  obj = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allKeys");
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v5 = *(const __CFString **)(*(_QWORD *)(a1 + 32) + 40);
    *(_DWORD *)buf = 136315906;
    v47 = v3;
    v48 = 2080;
    v49 = "-[VCSecurityKeyManager pruneSendKeyMaterialWithDelay:]_block_invoke";
    v50 = 1024;
    v51 = 401;
    v52 = 2112;
    v53 = v5;
    v6 = " [%s] %s:%d Pruning obsolete send keys (%@)";
    v7 = v4;
    v8 = 38;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(const __CFString **)(v11 + 40);
    *(_DWORD *)buf = 136316418;
    v47 = v9;
    v48 = 2080;
    v49 = "-[VCSecurityKeyManager pruneSendKeyMaterialWithDelay:]_block_invoke";
    v50 = 1024;
    v51 = 401;
    v52 = 2112;
    v53 = v2;
    v54 = 2048;
    v55 = v11;
    v56 = 2112;
    v57 = v12;
    v6 = " [%s] %s:%d %@(%p) Pruning obsolete send keys (%@)";
    v7 = v10;
    v8 = 58;
  }
  _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
LABEL_12:
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
  if (!v13)
    goto LABEL_31;
  v15 = v13;
  v16 = *(_QWORD *)v43;
  *(_QWORD *)&v14 = 136315906;
  v39 = v14;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v43 != v16)
        objc_enumerationMutation(obj);
      v18 = *(const __CFString **)(*((_QWORD *)&v42 + 1) + 8 * i);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", v18, v39), "objectForKeyedSubscript:", CFSTR("SecurityKeySetTime")), "doubleValue");
      if (v19 < *(double *)(a1 + 40))
      {
        if (objc_opt_class() == *(_QWORD *)(a1 + 32))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v27 = VRTraceErrorLogLevelToCSTR();
            v28 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v39;
              v47 = v27;
              v48 = 2080;
              v49 = "-[VCSecurityKeyManager pruneSendKeyMaterialWithDelay:]_block_invoke";
              v50 = 1024;
              v51 = 406;
              v52 = 2112;
              v53 = v18;
              v24 = v28;
              v25 = " [%s] %s:%d Pruned keyIndex '%@'";
              v26 = 38;
LABEL_27:
              _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
            }
          }
        }
        else
        {
          v20 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v20 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v21 = VRTraceErrorLogLevelToCSTR();
            v22 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v23 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 136316418;
              v47 = v21;
              v48 = 2080;
              v49 = "-[VCSecurityKeyManager pruneSendKeyMaterialWithDelay:]_block_invoke";
              v50 = 1024;
              v51 = 406;
              v52 = 2112;
              v53 = v20;
              v54 = 2048;
              v55 = v23;
              v56 = 2112;
              v57 = v18;
              v24 = v22;
              v25 = " [%s] %s:%d %@(%p) Pruned keyIndex '%@'";
              v26 = 58;
              goto LABEL_27;
            }
          }
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", v18);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", v18);
        continue;
      }
    }
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
  }
  while (v15);
LABEL_31:
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  if (!result)
  {
    VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)(*(_QWORD *)(a1 + 32) + 64), 0);
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v47 = v31;
          v48 = 2080;
          v49 = "-[VCSecurityKeyManager pruneSendKeyMaterialWithDelay:]_block_invoke";
          v50 = 1024;
          v51 = 414;
          v33 = " [%s] %s:%d Pruned last uplink MKM from sendKeys. calling scheduleEncryptionRollTimer";
          v34 = v32;
          v35 = 28;
          goto LABEL_42;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v30 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v36 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v38 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          v47 = v36;
          v48 = 2080;
          v49 = "-[VCSecurityKeyManager pruneSendKeyMaterialWithDelay:]_block_invoke";
          v50 = 1024;
          v51 = 414;
          v52 = 2112;
          v53 = v30;
          v54 = 2048;
          v55 = v38;
          v33 = " [%s] %s:%d %@(%p) Pruned last uplink MKM from sendKeys. calling scheduleEncryptionRollTimer";
          v34 = v37;
          v35 = 48;
LABEL_42:
          _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
        }
      }
    }
    result = objc_msgSend(*(id *)(a1 + 32), "scheduleEncryptionRollTimerWithDelay:", 30.0);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  return result;
}

- (void)pruneRecvKeyMaterialWithDelay:(double)a3
{
  double v5;
  dispatch_time_t v6;
  NSObject *keyManagerQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v5 = micro();
  self->_isReceiveKeysCleanUpPending = 1;
  v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  keyManagerQueue = self->_keyManagerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VCSecurityKeyManager_pruneRecvKeyMaterialWithDelay___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  *(double *)&block[5] = v5;
  dispatch_after(v6, keyManagerQueue, block);
}

uint64_t __54__VCSecurityKeyManager_pruneRecvKeyMaterialWithDelay___block_invoke(uint64_t a1)
{
  id *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  const __CFString *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const __CFString *v19;
  double v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t result;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  const __CFString *v37;
  uint64_t v38;
  __int128 v39;
  id obj;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  uint64_t v54;
  _BYTE v55[128];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  obj = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allKeys");
  if ((id)objc_opt_class() == *v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v6 = (const __CFString *)*((_QWORD *)*v2 + 6);
    *(_DWORD *)buf = 136315906;
    v42 = v4;
    v43 = 2080;
    v44 = "-[VCSecurityKeyManager pruneRecvKeyMaterialWithDelay:]_block_invoke";
    v45 = 1024;
    v46 = 429;
    v47 = 2112;
    v48 = v6;
    v7 = " [%s] %s:%d Pruning obsolete receive keys (%@)";
    v8 = v5;
    v9 = 38;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v12 = *v2;
    v13 = (const __CFString *)*((_QWORD *)*v2 + 6);
    *(_DWORD *)buf = 136316418;
    v42 = v10;
    v43 = 2080;
    v44 = "-[VCSecurityKeyManager pruneRecvKeyMaterialWithDelay:]_block_invoke";
    v45 = 1024;
    v46 = 429;
    v47 = 2112;
    v48 = v3;
    v49 = 2048;
    v50 = v12;
    v51 = 2112;
    v52 = v13;
    v7 = " [%s] %s:%d %@(%p) Pruning obsolete receive keys (%@)";
    v8 = v11;
    v9 = 58;
  }
  _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
LABEL_12:
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v55, 16);
  if (!v14)
    goto LABEL_31;
  v16 = v14;
  v17 = *(_QWORD *)v57;
  *(_QWORD *)&v15 = 136315906;
  v39 = v15;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v57 != v17)
        objc_enumerationMutation(obj);
      v19 = *(const __CFString **)(*((_QWORD *)&v56 + 1) + 8 * i);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", v19, v39), "objectForKeyedSubscript:", CFSTR("SecurityKeySetTime")), "doubleValue");
      if (v20 < *(double *)(a1 + 40))
      {
        if ((id)objc_opt_class() == *v2)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v28 = VRTraceErrorLogLevelToCSTR();
            v29 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v39;
              v42 = v28;
              v43 = 2080;
              v44 = "-[VCSecurityKeyManager pruneRecvKeyMaterialWithDelay:]_block_invoke";
              v45 = 1024;
              v46 = 434;
              v47 = 2112;
              v48 = v19;
              v25 = v29;
              v26 = " [%s] %s:%d Pruned keyIndex '%@'";
              v27 = 38;
LABEL_27:
              _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
            }
          }
        }
        else
        {
          v21 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v21 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v22 = VRTraceErrorLogLevelToCSTR();
            v23 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v24 = *v2;
              *(_DWORD *)buf = 136316418;
              v42 = v22;
              v43 = 2080;
              v44 = "-[VCSecurityKeyManager pruneRecvKeyMaterialWithDelay:]_block_invoke";
              v45 = 1024;
              v46 = 434;
              v47 = 2112;
              v48 = v21;
              v49 = 2048;
              v50 = v24;
              v51 = 2112;
              v52 = v19;
              v25 = v23;
              v26 = " [%s] %s:%d %@(%p) Pruned keyIndex '%@'";
              v27 = 58;
              goto LABEL_27;
            }
          }
        }
        objc_msgSend(*((id *)*v2 + 6), "removeObjectForKey:", v19);
        continue;
      }
    }
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v55, 16);
  }
  while (v16);
LABEL_31:
  result = objc_msgSend(*((id *)*v2 + 6), "objectForKeyedSubscript:", *((_QWORD *)*v2 + 9));
  if (!result)
  {
    if ((id)objc_opt_class() == *v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __54__VCSecurityKeyManager_pruneRecvKeyMaterialWithDelay___block_invoke_cold_1(v32, (uint64_t)v2, v33);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v31 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
      else
        v31 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v34 = VRTraceErrorLogLevelToCSTR();
        v35 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v36 = *v2;
          v37 = (const __CFString *)*((_QWORD *)*v2 + 9);
          v38 = *((_QWORD *)*v2 + 6);
          *(_DWORD *)buf = 136316674;
          v42 = v34;
          v43 = 2080;
          v44 = "-[VCSecurityKeyManager pruneRecvKeyMaterialWithDelay:]_block_invoke";
          v45 = 1024;
          v46 = 441;
          v47 = 2112;
          v48 = v31;
          v49 = 2048;
          v50 = v36;
          v51 = 2112;
          v52 = v37;
          v53 = 2112;
          v54 = v38;
          _os_log_error_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Pruned _latestReceiveKeyIndex '%@‘ from receiveKeys (%@). Nullifying it", buf, 0x44u);
        }
      }
    }
    result = VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)*v2 + 9, 0);
  }
  *((_BYTE *)*v2 + 89) = 0;
  return result;
}

- (double)pruneAllExpiredKeys
{
  double v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const __CFString *v13;
  void *v14;
  double v15;
  double v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  VCSecurityKeyManager *v40;
  __int16 v41;
  const __CFString *v42;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = micro();
  if (-[NSMutableDictionary count](self->_prunePendingReceiveKeys, "count"))
  {
    v4 = (void *)-[NSMutableDictionary allKeys](self->_prunePendingReceiveKeys, "allKeys");
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v4;
    v28 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
    if (v28)
    {
      v5 = 1.79769313e308;
      v27 = *(_QWORD *)v50;
      while (1)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v50 != v27)
            objc_enumerationMutation(obj);
          v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_prunePendingReceiveKeys, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v6));
          v29 = v6;
          if (objc_msgSend(v7, "count"))
          {
            v8 = (void *)objc_msgSend(v7, "allKeys");
            v44 = 0u;
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v30 = v8;
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
            if (v9)
            {
              v10 = v9;
              v11 = *(_QWORD *)v45;
              do
              {
                for (i = 0; i != v10; ++i)
                {
                  if (*(_QWORD *)v45 != v11)
                    objc_enumerationMutation(v30);
                  v13 = *(const __CFString **)(*((_QWORD *)&v44 + 1) + 8 * i);
                  v14 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", v13);
                  objc_msgSend(v14, "doubleValue");
                  if (v15 <= v3)
                  {
                    if ((VCSecurityKeyManager *)objc_opt_class() == self)
                    {
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                      {
                        v23 = VRTraceErrorLogLevelToCSTR();
                        v24 = *MEMORY[0x1E0CF2758];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 136315906;
                          v32 = v23;
                          v33 = 2080;
                          v34 = "-[VCSecurityKeyManager pruneAllExpiredKeys]";
                          v35 = 1024;
                          v36 = 475;
                          v37 = 2112;
                          v38 = v13;
                          v20 = v24;
                          v21 = " [%s] %s:%d Pruned keyIndex '%@'";
                          v22 = 38;
LABEL_26:
                          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
                        }
                      }
                    }
                    else
                    {
                      v17 = &stru_1E9E58EE0;
                      if ((objc_opt_respondsToSelector() & 1) != 0)
                        v17 = (const __CFString *)-[VCSecurityKeyManager performSelector:](self, "performSelector:", sel_logPrefix);
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                      {
                        v18 = VRTraceErrorLogLevelToCSTR();
                        v19 = *MEMORY[0x1E0CF2758];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 136316418;
                          v32 = v18;
                          v33 = 2080;
                          v34 = "-[VCSecurityKeyManager pruneAllExpiredKeys]";
                          v35 = 1024;
                          v36 = 475;
                          v37 = 2112;
                          v38 = v17;
                          v39 = 2048;
                          v40 = self;
                          v41 = 2112;
                          v42 = v13;
                          v20 = v19;
                          v21 = " [%s] %s:%d %@(%p) Pruned keyIndex '%@'";
                          v22 = 58;
                          goto LABEL_26;
                        }
                      }
                    }
                    -[NSMutableDictionary removeObjectForKey:](self->_receiveKeys, "removeObjectForKey:", v13);
                    objc_msgSend(v7, "removeObjectForKey:", v13);
                    continue;
                  }
                  objc_msgSend(v14, "doubleValue");
                  if (v16 < v5)
                    v5 = v16;
                }
                v10 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
              }
              while (v10);
            }
          }
          ++v6;
        }
        while (v29 + 1 != v28);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
        if (!v28)
          return v5;
      }
    }
  }
  return 1.79769313e308;
}

- (double)firstExpirationTime
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  double v15;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableDictionary allKeys](self->_prunePendingReceiveKeys, "allKeys");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (!v4)
    return 1.79769313e308;
  v5 = v4;
  v6 = *(_QWORD *)v24;
  v7 = 1.79769313e308;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v24 != v6)
        objc_enumerationMutation(v3);
      v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_prunePendingReceiveKeys, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      v10 = (void *)objc_msgSend(v9, "allKeys");
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j)), "doubleValue");
            if (v15 < v7)
              v7 = v15;
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
        }
        while (v12);
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  }
  while (v5);
  return v7;
}

- (void)schedulePruneTimer:(double)a3
{
  double v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *pruneTimer;
  dispatch_time_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (self->_isRunning)
  {
    v5 = micro();
    if ((VCSecurityKeyManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (v9 = VRTraceErrorLogLevelToCSTR(),
            v10 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_16:
        if (a3 != 1.79769313e308 && v5 < a3)
        {
          dispatch_suspend((dispatch_object_t)self->_pruneTimer);
          pruneTimer = self->_pruneTimer;
          v17 = dispatch_time(0, (uint64_t)((a3 - v5) * 1000000000.0));
          dispatch_source_set_timer(pruneTimer, v17, 0xFFFFFFFFFFFFFFFFLL, 0);
          dispatch_resume((dispatch_object_t)self->_pruneTimer);
        }
        return;
      }
      v18 = 136316162;
      v19 = v9;
      v20 = 2080;
      v21 = "-[VCSecurityKeyManager schedulePruneTimer:]";
      v22 = 1024;
      v23 = 517;
      v24 = 2048;
      v25 = v5;
      v26 = 2048;
      v27 = a3;
      v11 = " [%s] %s:%d schedulePruneTimer: currentTime=%f, firstExpirationTime=%f";
      v12 = v10;
      v13 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCSecurityKeyManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_16;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v18 = 136316674;
      v19 = v14;
      v20 = 2080;
      v21 = "-[VCSecurityKeyManager schedulePruneTimer:]";
      v22 = 1024;
      v23 = 517;
      v24 = 2112;
      v25 = *(double *)&v6;
      v26 = 2048;
      v27 = *(double *)&self;
      v28 = 2048;
      v29 = v5;
      v30 = 2048;
      v31 = a3;
      v11 = " [%s] %s:%d %@(%p) schedulePruneTimer: currentTime=%f, firstExpirationTime=%f";
      v12 = v15;
      v13 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, v13);
    goto LABEL_16;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315650;
      v19 = v7;
      v20 = 2080;
      v21 = "-[VCSecurityKeyManager schedulePruneTimer:]";
      v22 = 1024;
      v23 = 513;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempt to schedulePrineTimer when VCSecurityManager is stopped", (uint8_t *)&v18, 0x1Cu);
    }
  }
}

- (void)handlePruneTimerEventAndReschedule
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  VCSecurityKeyManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[VCSecurityKeyManager pruneAllExpiredKeys](self, "pruneAllExpiredKeys");
  -[VCSecurityKeyManager schedulePruneTimer:](self, "schedulePruneTimer:");
  if ((VCSecurityKeyManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = v4;
        v13 = 2080;
        v14 = "-[VCSecurityKeyManager handlePruneTimerEventAndReschedule]";
        v15 = 1024;
        v16 = 529;
        v6 = " [%s] %s:%d pruneTimerEvent fired";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCSecurityKeyManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136316162;
        v12 = v9;
        v13 = 2080;
        v14 = "-[VCSecurityKeyManager handlePruneTimerEventAndReschedule]";
        v15 = 1024;
        v16 = 529;
        v17 = 2112;
        v18 = v3;
        v19 = 2048;
        v20 = self;
        v6 = " [%s] %s:%d %@(%p) pruneTimerEvent fired";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
}

- (void)scheduleEncryptionRollTimerWithDelay:(double)a3
{
  NSObject *encryptionKeyRollTimer;
  dispatch_time_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_isRunning)
  {
    dispatch_suspend((dispatch_object_t)self->_encryptionKeyRollTimer);
    encryptionKeyRollTimer = self->_encryptionKeyRollTimer;
    v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(encryptionKeyRollTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_encryptionKeyRollTimer);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315906;
        v15 = v7;
        v16 = 2080;
        v17 = "-[VCSecurityKeyManager scheduleEncryptionRollTimerWithDelay:]";
        v18 = 1024;
        v19 = 540;
        v20 = 2048;
        v21 = a3;
        v9 = " [%s] %s:%d Scheduled encryption roll timeout delta=%f seconds";
        v10 = v8;
        v11 = 38;
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = v12;
      v16 = 2080;
      v17 = "-[VCSecurityKeyManager scheduleEncryptionRollTimerWithDelay:]";
      v18 = 1024;
      v19 = 534;
      v9 = " [%s] %s:%d Security key manager has not been started, yet";
      v10 = v13;
      v11 = 28;
      goto LABEL_8;
    }
  }
}

- (BOOL)associateMKI:(id)a3 withParticipantID:(unint64_t)a4
{
  NSObject *keyManagerQueue;
  _BOOL4 v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCSecurityKeyManager *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      keyManagerQueue = self->_keyManagerQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__VCSecurityKeyManager_associateMKI_withParticipantID___block_invoke;
      block[3] = &unk_1E9E53820;
      block[5] = a3;
      block[6] = a4;
      block[4] = self;
      dispatch_async(keyManagerQueue, block);
      LOBYTE(v6) = 1;
      return v6;
    }
    if ((VCSecurityKeyManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v6)
          return v6;
        -[VCSecurityKeyManager associateMKI:withParticipantID:].cold.2();
      }
      goto LABEL_26;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCSecurityKeyManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      *(_DWORD *)buf = 136316162;
      v16 = v12;
      v17 = 2080;
      v18 = "-[VCSecurityKeyManager associateMKI:withParticipantID:]";
      v19 = 1024;
      v20 = 546;
      v21 = 2112;
      v22 = v8;
      v23 = 2048;
      v24 = self;
      v11 = " [%s] %s:%d %@(%p) participantID is invalid";
LABEL_25:
      _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x30u);
    }
  }
  else
  {
    if ((VCSecurityKeyManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v6)
          return v6;
        -[VCSecurityKeyManager associateMKI:withParticipantID:].cold.1();
      }
      goto LABEL_26;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSecurityKeyManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      *(_DWORD *)buf = 136316162;
      v16 = v9;
      v17 = 2080;
      v18 = "-[VCSecurityKeyManager associateMKI:withParticipantID:]";
      v19 = 1024;
      v20 = 545;
      v21 = 2112;
      v22 = v7;
      v23 = 2048;
      v24 = self;
      v11 = " [%s] %s:%d %@(%p) keyIndex must not be nil";
      goto LABEL_25;
    }
  }
LABEL_26:
  LOBYTE(v6) = 0;
  return v6;
}

uint64_t __55__VCSecurityKeyManager_associateMKI_withParticipantID___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t i;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BYTE v24[24];
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = micro();
  v3 = objc_msgSend(*(id *)(a1 + 32), "getNotUsedTimeout");
  v4 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48)));
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", v4, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48)));

  }
  v5 = (void *)objc_msgSend(v4, "allKeys");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = v2 + (double)v3;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8), *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    }
    while (v7);
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", micro() + 1200.0), *(_QWORD *)(a1 + 40));
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v24 = 136316162;
        *(_QWORD *)&v24[4] = v12;
        *(_WORD *)&v24[12] = 2080;
        *(_QWORD *)&v24[14] = "-[VCSecurityKeyManager associateMKI:withParticipantID:]_block_invoke";
        *(_WORD *)&v24[22] = 1024;
        LODWORD(v25) = 565;
        WORD2(v25) = 2112;
        *(_QWORD *)((char *)&v25 + 6) = v14;
        HIWORD(v25) = 1024;
        LODWORD(v26) = 1200;
        v15 = " [%s] %s:%d Reset pruning timeout for keyIndex '%@' to default value '%d'";
        v16 = v13;
        v17 = 44;
LABEL_20:
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, v24, v17);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v24 = 136316674;
        *(_QWORD *)&v24[4] = v18;
        *(_WORD *)&v24[12] = 2080;
        *(_QWORD *)&v24[14] = "-[VCSecurityKeyManager associateMKI:withParticipantID:]_block_invoke";
        *(_WORD *)&v24[22] = 1024;
        LODWORD(v25) = 565;
        WORD2(v25) = 2112;
        *(_QWORD *)((char *)&v25 + 6) = v11;
        HIWORD(v25) = 2048;
        v26 = v20;
        LOWORD(v27) = 2112;
        *(_QWORD *)((char *)&v27 + 2) = v21;
        WORD5(v27) = 1024;
        HIDWORD(v27) = 1200;
        v15 = " [%s] %s:%d %@(%p) Reset pruning timeout for keyIndex '%@' to default value '%d'";
        v16 = v19;
        v17 = 64;
        goto LABEL_20;
      }
    }
  }
  v22 = *(void **)(a1 + 32);
  objc_msgSend(v22, "firstExpirationTime", *(_OWORD *)v24, *(_QWORD *)&v24[16], v25, v26, v27);
  return objc_msgSend(v22, "schedulePruneTimer:");
}

- (void)detectInabilityToDecryptSymptom:(id)a3 prefix:(id)a4
{
  uint64_t v6;
  NSMutableArray *unknownKeyIndexList;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  double lastKeyIndexNotReceived;
  double v28;
  int v29;
  _BYTE v30[24];
  __int128 v31;
  VCSecurityKeyManager *v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "count");
  unknownKeyIndexList = self->_unknownKeyIndexList;
  if (v6)
  {
    -[NSMutableArray removeObject:](unknownKeyIndexList, "removeObject:", a4);
    if ((VCSecurityKeyManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_17;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v12 = -[NSMutableDictionary count](self->_receiveKeys, "count");
      *(_DWORD *)v30 = 136316162;
      *(_QWORD *)&v30[4] = v10;
      *(_WORD *)&v30[12] = 2080;
      *(_QWORD *)&v30[14] = "-[VCSecurityKeyManager detectInabilityToDecryptSymptom:prefix:]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 587;
      WORD2(v31) = 2112;
      *(_QWORD *)((char *)&v31 + 6) = a4;
      HIWORD(v31) = 1024;
      LODWORD(v32) = v12;
      v13 = " [%s] %s:%d Found prefix '%@' in receive keys array of %d elements";
      v14 = v11;
      v15 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCSecurityKeyManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_17;
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v18 = -[NSMutableDictionary count](self->_receiveKeys, "count");
      *(_DWORD *)v30 = 136316674;
      *(_QWORD *)&v30[4] = v16;
      *(_WORD *)&v30[12] = 2080;
      *(_QWORD *)&v30[14] = "-[VCSecurityKeyManager detectInabilityToDecryptSymptom:prefix:]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 587;
      WORD2(v31) = 2112;
      *(_QWORD *)((char *)&v31 + 6) = v8;
      HIWORD(v31) = 2048;
      v32 = self;
      LOWORD(v33) = 2112;
      *(_QWORD *)((char *)&v33 + 2) = a4;
      WORD5(v33) = 1024;
      HIDWORD(v33) = v18;
      v13 = " [%s] %s:%d %@(%p) Found prefix '%@' in receive keys array of %d elements";
      v14 = v17;
      v15 = 64;
    }
    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, v30, v15);
LABEL_17:
    self->_lastKeyIndexNotReceived = 0.0;
    return;
  }
  if ((-[NSMutableArray containsObject:](unknownKeyIndexList, "containsObject:", a4) & 1) == 0)
  {
    if ((VCSecurityKeyManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_24;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      v21 = -[NSMutableDictionary count](self->_receiveKeys, "count");
      *(_DWORD *)v30 = 136316162;
      *(_QWORD *)&v30[4] = v19;
      *(_WORD *)&v30[12] = 2080;
      *(_QWORD *)&v30[14] = "-[VCSecurityKeyManager detectInabilityToDecryptSymptom:prefix:]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 577;
      WORD2(v31) = 2112;
      *(_QWORD *)((char *)&v31 + 6) = a4;
      HIWORD(v31) = 1024;
      LODWORD(v32) = v21;
      v22 = " [%s] %s:%d Cannot find prefix '%@' in receive keys array of %d elements";
      v23 = v20;
      v24 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCSecurityKeyManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_24;
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      v29 = -[NSMutableDictionary count](self->_receiveKeys, "count");
      *(_DWORD *)v30 = 136316674;
      *(_QWORD *)&v30[4] = v25;
      *(_WORD *)&v30[12] = 2080;
      *(_QWORD *)&v30[14] = "-[VCSecurityKeyManager detectInabilityToDecryptSymptom:prefix:]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 577;
      WORD2(v31) = 2112;
      *(_QWORD *)((char *)&v31 + 6) = v9;
      HIWORD(v31) = 2048;
      v32 = self;
      LOWORD(v33) = 2112;
      *(_QWORD *)((char *)&v33 + 2) = a4;
      WORD5(v33) = 1024;
      HIDWORD(v33) = v29;
      v22 = " [%s] %s:%d %@(%p) Cannot find prefix '%@' in receive keys array of %d elements";
      v23 = v26;
      v24 = 64;
    }
    _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v22, v30, v24);
LABEL_24:
    -[NSMutableArray addObject:](self->_unknownKeyIndexList, "addObject:", a4, *(_OWORD *)v30, *(_QWORD *)&v30[16], v31, v32, v33);
  }
  lastKeyIndexNotReceived = self->_lastKeyIndexNotReceived;
  v28 = micro();
  if (lastKeyIndexNotReceived == 0.0)
  {
    self->_lastKeyIndexNotReceived = v28;
  }
  else if (v28 - self->_lastKeyIndexNotReceived >= 30.0)
  {
    -[VCSecurityKeyManager reportingAgent](self, "reportingAgent");
    reportingSymptom();
  }
}

- (id)copyMKMWithPrefix:(id)a3 forParticipantID:(unint64_t)a4
{
  NSObject *keyManagerQueue;
  void *v8;
  _QWORD block[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__26;
  v15 = __Block_byref_object_dispose__26;
  v16 = (id)0xAAAAAAAAAAAAAAAALL;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  keyManagerQueue = self->_keyManagerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__VCSecurityKeyManager_copyMKMWithPrefix_forParticipantID___block_invoke;
  block[3] = &unk_1E9E56F18;
  block[4] = a3;
  block[5] = self;
  block[6] = &v11;
  block[7] = a4;
  dispatch_sync(keyManagerQueue, block);
  v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

void __59__VCSecurityKeyManager_copyMKMWithPrefix_forParticipantID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char **v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint32_t v37;
  const __CFString *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  __CFString *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  __CFString *v51;
  const __CFString *v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  __int128 v56;
  id obj;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  const __CFString *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  __CFString *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_opt_class();
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v5 = &selRef_load;
    if (v3 == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v9 = *(const __CFString **)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 136316162;
      v59 = v7;
      v60 = 2080;
      v61 = "-[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:]_block_invoke";
      v62 = 1024;
      v63 = 597;
      v64 = 2112;
      v65 = v9;
      v66 = 2048;
      v67 = v10;
      v11 = " [%s] %s:%d Searching for key material with prefix=%@ for participantID=%llu";
      v12 = v8;
      v13 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v17 = *(__CFString **)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      v18 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 136316674;
      v59 = v14;
      v60 = 2080;
      v61 = "-[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:]_block_invoke";
      v62 = 1024;
      v63 = 597;
      v64 = 2112;
      v65 = v6;
      v66 = 2048;
      v67 = v16;
      v68 = 2112;
      v69 = v17;
      v70 = 2048;
      v71 = v18;
      v11 = " [%s] %s:%d %@(%p) Searching for key material with prefix=%@ for participantID=%llu";
      v12 = v15;
      v13 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_13:
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = *(id *)(*(_QWORD *)(a1 + 40) + 48);
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v76, 16);
    if (!v19)
      goto LABEL_42;
    v21 = v19;
    v22 = *(_QWORD *)v78;
    *(_QWORD *)&v20 = 136316674;
    v56 = v20;
    while (1)
    {
      v23 = 0;
      v24 = v5[73];
      do
      {
        if (*(_QWORD *)v78 != v22)
          objc_enumerationMutation(obj);
        v25 = *(__CFString **)(*((_QWORD *)&v77 + 1) + 8 * v23);
        if (-[__CFString isStartingWithPrefix:](v25, "isStartingWithPrefix:", *(_QWORD *)(a1 + 32), v56))
        {
          v26 = (__CFString *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", v25);
          v27 = (void *)-[__CFString objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", CFSTR("SecurityIDSParticipantID"));
          if (*(_QWORD *)(a1 + 56) && (v28 = v27, objc_msgSend(v27, "unsignedLongLongValue") != *(_QWORD *)(a1 + 56)))
          {
            if (objc_opt_class() == *(_QWORD *)(a1 + 40))
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
              {
                v48 = VRTraceErrorLogLevelToCSTR();
                v49 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  v50 = *(_QWORD *)(a1 + 32);
                  v51 = *(__CFString **)(a1 + 56);
                  *(_DWORD *)buf = v56;
                  v59 = v48;
                  v60 = 2080;
                  v61 = "-[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:]_block_invoke";
                  v62 = 1024;
                  v63 = 609;
                  v64 = 2112;
                  v65 = v25;
                  v66 = 2112;
                  v67 = v50;
                  v68 = 2048;
                  v69 = v51;
                  v70 = 2112;
                  v71 = v28;
                  v35 = v49;
                  v36 = " [%s] %s:%d Skipping keyIndex=%@ for prefix=%@ due to mismatched participantID: expected partici"
                        "pantID=%llu, actual participantID=%@";
                  v37 = 68;
                  goto LABEL_39;
                }
              }
            }
            else
            {
              v38 = &stru_1E9E58EE0;
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v38 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", v24);
              if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
              {
                v39 = VRTraceErrorLogLevelToCSTR();
                v40 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  v42 = *(void **)(a1 + 32);
                  v41 = *(_QWORD *)(a1 + 40);
                  v43 = *(_QWORD *)(a1 + 56);
                  *(_DWORD *)buf = 136317186;
                  v59 = v39;
                  v60 = 2080;
                  v61 = "-[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:]_block_invoke";
                  v62 = 1024;
                  v63 = 609;
                  v64 = 2112;
                  v65 = v38;
                  v66 = 2048;
                  v67 = v41;
                  v68 = 2112;
                  v69 = v25;
                  v70 = 2112;
                  v71 = v42;
                  v72 = 2048;
                  v73 = v43;
                  v74 = 2112;
                  v75 = v28;
                  v35 = v40;
                  v36 = " [%s] %s:%d %@(%p) Skipping keyIndex=%@ for prefix=%@ due to mismatched participantID: expected "
                        "participantID=%llu, actual participantID=%@";
                  v37 = 88;
                  goto LABEL_39;
                }
              }
            }
          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", v25));
            if (objc_opt_class() == *(_QWORD *)(a1 + 40))
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v44 = VRTraceErrorLogLevelToCSTR();
                v45 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  v46 = *(_QWORD *)(a1 + 32);
                  v47 = *(__CFString **)(a1 + 56);
                  *(_DWORD *)buf = 136316418;
                  v59 = v44;
                  v60 = 2080;
                  v61 = "-[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:]_block_invoke";
                  v62 = 1024;
                  v63 = 607;
                  v64 = 2112;
                  v65 = v26;
                  v66 = 2112;
                  v67 = v46;
                  v68 = 2048;
                  v69 = v47;
                  v35 = v45;
                  v36 = " [%s] %s:%d Added keyMaterial=%@ for prefix=%@ with participantID=%llu";
                  v37 = 58;
                  goto LABEL_39;
                }
              }
            }
            else
            {
              v29 = &stru_1E9E58EE0;
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v29 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", v24);
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v30 = VRTraceErrorLogLevelToCSTR();
                v31 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  v33 = *(void **)(a1 + 32);
                  v32 = *(_QWORD *)(a1 + 40);
                  v34 = *(_QWORD *)(a1 + 56);
                  *(_DWORD *)buf = 136316930;
                  v59 = v30;
                  v60 = 2080;
                  v61 = "-[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:]_block_invoke";
                  v62 = 1024;
                  v63 = 607;
                  v64 = 2112;
                  v65 = v29;
                  v66 = 2048;
                  v67 = v32;
                  v68 = 2112;
                  v69 = v26;
                  v70 = 2112;
                  v71 = v33;
                  v72 = 2048;
                  v73 = v34;
                  v35 = v31;
                  v36 = " [%s] %s:%d %@(%p) Added keyMaterial=%@ for prefix=%@ with participantID=%llu";
                  v37 = 78;
LABEL_39:
                  _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, v37);
                }
              }
            }
          }
        }
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v76, 16);
      v5 = &selRef_load;
      if (!v21)
        goto LABEL_42;
    }
  }
  if (v3 == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __59__VCSecurityKeyManager_copyMKMWithPrefix_forParticipantID___block_invoke_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v52 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
    else
      v52 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v53 = VRTraceErrorLogLevelToCSTR();
      v54 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v55 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316162;
        v59 = v53;
        v60 = 2080;
        v61 = "-[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:]_block_invoke";
        v62 = 1024;
        v63 = 596;
        v64 = 2112;
        v65 = v52;
        v66 = 2048;
        v67 = v55;
        _os_log_error_impl(&dword_1D8A54000, v54, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) keyPrefix must not be nil", buf, 0x30u);
      }
    }
  }
LABEL_42:
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = 0;
  }
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "detectInabilityToDecryptSymptom:prefix:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

- (id)copyMKMWithPrefix:(id)a3
{
  return -[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:](self, "copyMKMWithPrefix:forParticipantID:", a3, 0);
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  objc_storeWeak(&self->_reportingAgentWeak, a3);
}

- (opaqueRTCReporting)reportingAgent
{
  return (opaqueRTCReporting *)objc_loadWeak(&self->_reportingAgentWeak);
}

- (void)startTimers
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create encryptionKeyRollTimer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addSecurityKeyMaterial:securityKeyMode:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  OUTLINED_FUNCTION_4_0();
  v5 = 245;
  v6 = 2112;
  v7 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d kVCSecurityKeyIndex is missing in key material dictionary '%@'", v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

void __65__VCSecurityKeyManager_latestSendKeyMaterialWithSecurityKeyMode___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)a2 + 40), "count");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_4_8(&dword_1D8A54000, v2, v3, " [%s] %s:%d Cannot find _latestSendKeyIndex '%@' in receive keys array of %d elements. Invalidating it...", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_9_1();
}

void __48__VCSecurityKeyManager_getLatestRecvKeyMaterial__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)a2 + 48), "count");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_4_8(&dword_1D8A54000, v2, v3, " [%s] %s:%d Cannot find _latestReceiveKeyIndex '%@' in receive keys array of %d elements. Invalidating it...", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_9_1();
}

void __54__VCSecurityKeyManager_pruneRecvKeyMaterialWithDelay___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 72);
  v4 = *(_QWORD *)(*(_QWORD *)a2 + 48);
  v5 = 136316162;
  v6 = a1;
  v7 = 2080;
  v8 = "-[VCSecurityKeyManager pruneRecvKeyMaterialWithDelay:]_block_invoke";
  v9 = 1024;
  v10 = 441;
  v11 = 2112;
  v12 = v3;
  v13 = 2112;
  v14 = v4;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Pruned _latestReceiveKeyIndex '%@‘ from receiveKeys (%@). Nullifying it", (uint8_t *)&v5, 0x30u);
}

- (void)associateMKI:withParticipantID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d keyIndex must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)associateMKI:withParticipantID:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d participantID is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __59__VCSecurityKeyManager_copyMKMWithPrefix_forParticipantID___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d keyPrefix must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
