@implementation VCVirtualAVCaptureSession

- (VCVirtualAVCaptureSession)init
{
  VCVirtualAVCaptureSession *v2;
  VCVirtualAVCaptureSession *v3;
  NSMutableSet *v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  NSMutableArray *v7;
  NSObject *CustomRootQueue;
  dispatch_queue_t v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCVirtualAVCaptureSession;
  v2 = -[VCVirtualAVCaptureSession init](&v11, sel_init);
  v3 = v2;
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureSession init].cold.1();
    }
    goto LABEL_26;
  }
  v2->_isRunning = 0;
  v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3->_inputs = v4;
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureSession init].cold.2();
    }
    goto LABEL_26;
  }
  v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3->_outputs = v5;
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureSession init].cold.3();
    }
    goto LABEL_26;
  }
  v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3->_connections = v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureSession init].cold.4();
    }
    goto LABEL_26;
  }
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3->_batchedConfigurations = v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureSession init].cold.5();
    }
    goto LABEL_26;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v9 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVirtualAVCaptureSession.stateQueue", 0, CustomRootQueue);
  v3->_stateQueue = (OS_dispatch_queue *)v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureSession init].cold.6();
    }
LABEL_26:

    return 0;
  }
  return v3;
}

- (void)dealloc
{
  NSObject *stateQueue;
  NSObject *v4;
  objc_super v5;
  _QWORD block[6];

  block[5] = *MEMORY[0x1E0C80C00];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__VCVirtualAVCaptureSession_dealloc__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_sync(stateQueue, block);

  v4 = self->_stateQueue;
  if (v4)
  {
    dispatch_release(v4);
    self->_stateQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)VCVirtualAVCaptureSession;
  -[VCVirtualAVCaptureSession dealloc](&v5, sel_dealloc);
}

uint64_t __36__VCVirtualAVCaptureSession_dealloc__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[128];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v6, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5++), "invalidate");
      }
      while (v3 != v5);
      result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v6, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)startRunning
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__VCVirtualAVCaptureSession_startRunning__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_sync(stateQueue, v3);
}

_BYTE *__41__VCVirtualAVCaptureSession_startRunning__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *result;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[16])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315650;
        v7 = v4;
        v8 = 2080;
        v9 = "-[VCVirtualAVCaptureSession startRunning]_block_invoke";
        v10 = 1024;
        v11 = 89;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Session is already running", (uint8_t *)&v6, 0x1Cu);
      }
    }
  }
  else if ((objc_msgSend(v2, "startInputDevices") & 0x80000000) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __41__VCVirtualAVCaptureSession_startRunning__block_invoke_cold_1();
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
    objc_msgSend(*(id *)(a1 + 32), "postNotification:", *MEMORY[0x1E0C8A128]);
  }
  result = *(_BYTE **)(a1 + 32);
  if (!result[16])
  {
    objc_msgSend(result, "stopInputDevices");
    return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "postNotification:", *MEMORY[0x1E0C8A1B8]);
  }
  return result;
}

- (void)stopRunning
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__VCVirtualAVCaptureSession_stopRunning__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_sync(stateQueue, v3);
}

_BYTE *__40__VCVirtualAVCaptureSession_stopRunning__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *result;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[16])
  {
    if ((objc_msgSend(v2, "stopInputDevices") & 0x80000000) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __40__VCVirtualAVCaptureSession_stopRunning__block_invoke_cold_1();
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
      objc_msgSend(*(id *)(a1 + 32), "postNotification:", *MEMORY[0x1E0C8A130]);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCVirtualAVCaptureSession stopRunning]_block_invoke";
      v10 = 1024;
      v11 = 106;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Session is already stopped", (uint8_t *)&v6, 0x1Cu);
    }
  }
  result = *(_BYTE **)(a1 + 32);
  if (result[16])
    return (_BYTE *)objc_msgSend(result, "postNotification:", *MEMORY[0x1E0C8A1B8]);
  return result;
}

- (int)startInputDevices
{
  NSMutableSet *inputs;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  int v9;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  inputs = self->_inputs;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(inputs);
        v7 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "device");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = objc_msgSend(v7, "startVirtualCapture");
          if (v8 < 0)
          {
            v9 = v8;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v11 = VRTraceErrorLogLevelToCSTR();
              v12 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                v13 = 136316162;
                v14 = v11;
                v15 = 2080;
                v16 = "-[VCVirtualAVCaptureSession startInputDevices]";
                v17 = 1024;
                v18 = 126;
                v19 = 2048;
                v20 = v7;
                v21 = 1024;
                v22 = v9;
                _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to start virtual device[%p]. result=%d", (uint8_t *)&v13, 0x2Cu);
              }
            }
            return v9;
          }
        }
      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
      if (v4)
        continue;
      break;
    }
  }
  return 0;
}

- (int)stopInputDevices
{
  NSMutableSet *inputs;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  inputs = self->_inputs;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(inputs);
        v7 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v6), "device");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = objc_msgSend(v7, "stopVirtualCapture");
          if (v8 < 0)
          {
            v9 = v8;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v10 = VRTraceErrorLogLevelToCSTR();
              v11 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                v13 = 136316162;
                v14 = v10;
                v15 = 2080;
                v16 = "-[VCVirtualAVCaptureSession stopInputDevices]";
                v17 = 1024;
                v18 = 140;
                v19 = 2048;
                v20 = v7;
                v21 = 1024;
                v22 = v9;
                _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to stop virtual device[%p]. result=%d", (uint8_t *)&v13, 0x2Cu);
              }
            }
            LODWORD(v3) = -2147418113;
            return v3;
          }
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (void)pushConfigurationBlock:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__VCVirtualAVCaptureSession_pushConfigurationBlock___block_invoke;
    block[3] = &unk_1E9E53548;
    block[4] = self;
    block[5] = a3;
    dispatch_sync(stateQueue, block);
  }
}

void __52__VCVirtualAVCaptureSession_pushConfigurationBlock___block_invoke(uint64_t a1)
{
  void (**v2)(void);
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void (***)(void))(a1 + 40);
  if (*(_DWORD *)(v3 + 56))
  {
    v4 = _Block_copy(v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", v4);
    _Block_release(v4);
  }
  else
  {
    v2[2]();
  }
}

- (id)newConnectionWithInputPorts:(id)a3 outputDevice:(id)a4
{
  VCVirtualAVCaptureConnection *v6;
  VCVirtualAVCaptureConnection *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureSession newConnectionWithInputPorts:outputDevice:].cold.2();
    }
    return 0;
  }
  v6 = -[VCVirtualAVCaptureConnection initWithInputPorts:output:]([VCVirtualAVCaptureConnection alloc], "initWithInputPorts:output:", a3, a4);
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureSession newConnectionWithInputPorts:outputDevice:].cold.1();
    }
    return 0;
  }
  v7 = v6;
  objc_msgSend(a4, "addConnection:", v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "addConnection:", v7);
      }
      while (v9 != v11);
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v9);
  }
  -[VCVirtualAVCaptureConnection setActive:](v7, "setActive:", 1);
  return v7;
}

- (BOOL)connectionExists:(id)a3 output:(id)a4
{
  NSMutableSet *connections;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  connections = self->_connections;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(connections);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        if (objc_msgSend((id)objc_msgSend(v12, "inputPorts"), "isEqualToArray:", a3)
          && (id)objc_msgSend(v12, "output") == a4)
        {
          LOBYTE(v8) = 1;
          return v8;
        }
        ++v11;
      }
      while (v9 != v11);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      v9 = v8;
      if (v8)
        continue;
      break;
    }
  }
  return v8;
}

- (void)addConnectionWithInput:(id)a3 output:(id)a4
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (!-[VCVirtualAVCaptureSession connectionExists:output:](self, "connectionExists:output:", objc_msgSend(a3, "ports"), a4))
  {
    v7 = -[VCVirtualAVCaptureSession newConnectionWithInputPorts:outputDevice:](self, "newConnectionWithInputPorts:outputDevice:", objc_msgSend(a3, "ports"), a4);
    if (v7)
    {
      v10 = v7;
      -[NSMutableSet addObject:](self->_connections, "addObject:", v7);

    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v12 = v8;
        v13 = 2080;
        v14 = "-[VCVirtualAVCaptureSession addConnectionWithInput:output:]";
        v15 = 1024;
        v16 = 198;
        v17 = 2048;
        v18 = a3;
        v19 = 2048;
        v20 = a4;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to create connection for input:[%p], output:[%p]", buf, 0x30u);
      }
    }
  }
}

- (void)addConnection:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (self->_stateQueue)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __43__VCVirtualAVCaptureSession_addConnection___block_invoke;
      v5[3] = &unk_1E9E52238;
      v5[4] = self;
      v5[5] = a3;
      -[VCVirtualAVCaptureSession pushConfigurationBlock:](self, "pushConfigurationBlock:", v5);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCVirtualAVCaptureSession addConnection:]";
      v10 = 1024;
      v11 = 207;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add nil connection", buf, 0x1Cu);
    }
  }
}

void __43__VCVirtualAVCaptureSession_addConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 40);
        v5 = 136315906;
        v6 = v2;
        v7 = 2080;
        v8 = "-[VCVirtualAVCaptureSession addConnection:]_block_invoke";
        v9 = 1024;
        v10 = 212;
        v11 = 2048;
        v12 = v4;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add connection[%p] that already exists", (uint8_t *)&v5, 0x26u);
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  }
}

- (BOOL)canAddInput:(id)a3
{
  return a3 != 0;
}

- (BOOL)canAddOutput:(id)a3
{
  return a3 != 0;
}

- (void)addInput:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__VCVirtualAVCaptureSession_addInput___block_invoke;
    v5[3] = &unk_1E9E52238;
    v5[4] = self;
    v5[5] = a3;
    -[VCVirtualAVCaptureSession pushConfigurationBlock:](self, "pushConfigurationBlock:", v5);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCVirtualAVCaptureSession addInput:]";
      v10 = 1024;
      v11 = 230;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add nil input device", buf, 0x1Cu);
    }
  }
}

void __38__VCVirtualAVCaptureSession_addInput___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(void **)(a1 + 40);
        v16 = 136315906;
        v17 = v2;
        v18 = 2080;
        v19 = "-[VCVirtualAVCaptureSession addInput:]_block_invoke";
        v20 = 1024;
        v21 = 233;
        v22 = 2048;
        v23 = v4;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add input[%p] that already exists", (uint8_t *)&v16, 0x26u);
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 32), "addConnectionWithInput:output:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      }
      while (v7);
    }
    v10 = objc_msgSend(*(id *)(a1 + 40), "device");
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
    {
      v11 = (void *)v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_msgSend(v11, "startVirtualCapture");
        if (v12 < 0)
        {
          v13 = v12;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v14 = VRTraceErrorLogLevelToCSTR();
            v15 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              v16 = 136316162;
              v17 = v14;
              v18 = 2080;
              v19 = "-[VCVirtualAVCaptureSession addInput:]_block_invoke";
              v20 = 1024;
              v21 = 247;
              v22 = 2048;
              v23 = v11;
              v24 = 1024;
              v25 = v13;
              _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to start virtual device[%p]. result=%d", (uint8_t *)&v16, 0x2Cu);
            }
          }
        }
      }
    }
  }
}

- (void)addOutput:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__VCVirtualAVCaptureSession_addOutput___block_invoke;
    v5[3] = &unk_1E9E52238;
    v5[4] = self;
    v5[5] = a3;
    -[VCVirtualAVCaptureSession pushConfigurationBlock:](self, "pushConfigurationBlock:", v5);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCVirtualAVCaptureSession addOutput:]";
      v10 = 1024;
      v11 = 256;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add nil output", buf, 0x1Cu);
    }
  }
}

void __39__VCVirtualAVCaptureSession_addOutput___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v16 = v2;
        v17 = 2080;
        v18 = "-[VCVirtualAVCaptureSession addOutput:]_block_invoke";
        v19 = 1024;
        v20 = 260;
        v21 = 2048;
        v22 = v4;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add output[%p] that already exists", buf, 0x26u);
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 32), "addConnectionWithInput:output:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), *(_QWORD *)(a1 + 40));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      }
      while (v7);
    }
  }
}

- (void)removeInput:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__VCVirtualAVCaptureSession_removeInput___block_invoke;
    v5[3] = &unk_1E9E52238;
    v5[4] = self;
    v5[5] = a3;
    -[VCVirtualAVCaptureSession pushConfigurationBlock:](self, "pushConfigurationBlock:", v5);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCVirtualAVCaptureSession removeInput:]";
      v10 = 1024;
      v11 = 275;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to remove nil input", buf, 0x1Cu);
    }
  }
}

uint64_t __41__VCVirtualAVCaptureSession_removeInput___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(a1 + 40))
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "disconnect");
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeOutput:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__VCVirtualAVCaptureSession_removeOutput___block_invoke;
    v5[3] = &unk_1E9E52238;
    v5[4] = self;
    v5[5] = a3;
    -[VCVirtualAVCaptureSession pushConfigurationBlock:](self, "pushConfigurationBlock:", v5);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCVirtualAVCaptureSession removeOutput:]";
      v10 = 1024;
      v11 = 287;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to remove nil output", buf, 0x1Cu);
    }
  }
}

uint64_t __42__VCVirtualAVCaptureSession_removeOutput___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", *(_QWORD *)(a1 + 40))
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "disconnect");
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)connections
{
  NSObject *stateQueue;
  void *v4;
  _QWORD block[6];
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
  v10 = __Block_byref_object_copy__34;
  v11 = __Block_byref_object_dispose__34;
  v12 = 0xAAAAAAAAAAAAAAAALL;
  v12 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__VCVirtualAVCaptureSession_connections__block_invoke;
    block[3] = &unk_1E9E52938;
    block[4] = self;
    block[5] = &v7;
    dispatch_sync(stateQueue, block);
  }
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__VCVirtualAVCaptureSession_connections__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allObjects");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)inputs
{
  NSObject *stateQueue;
  void *v4;
  _QWORD block[6];
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
  v10 = __Block_byref_object_copy__34;
  v11 = __Block_byref_object_dispose__34;
  v12 = 0xAAAAAAAAAAAAAAAALL;
  v12 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__VCVirtualAVCaptureSession_inputs__block_invoke;
    block[3] = &unk_1E9E52938;
    block[4] = self;
    block[5] = &v7;
    dispatch_sync(stateQueue, block);
  }
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __35__VCVirtualAVCaptureSession_inputs__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)outputs
{
  NSObject *stateQueue;
  void *v4;
  _QWORD block[6];
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
  v10 = __Block_byref_object_copy__34;
  v11 = __Block_byref_object_dispose__34;
  v12 = 0xAAAAAAAAAAAAAAAALL;
  v12 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__VCVirtualAVCaptureSession_outputs__block_invoke;
    block[3] = &unk_1E9E52938;
    block[4] = self;
    block[5] = &v7;
    dispatch_sync(stateQueue, block);
  }
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __36__VCVirtualAVCaptureSession_outputs__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allObjects");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)postNotification:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", a3, self);
}

- (BOOL)supportsAVCaptureSessionPreset
{
  return 0;
}

- (void)beginConfiguration
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __47__VCVirtualAVCaptureSession_beginConfiguration__block_invoke;
    v3[3] = &unk_1E9E521C0;
    v3[4] = self;
    dispatch_sync(stateQueue, v3);
  }
}

uint64_t __47__VCVirtualAVCaptureSession_beginConfiguration__block_invoke(uint64_t result)
{
  ++*(_DWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (void)commitConfiguration
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __48__VCVirtualAVCaptureSession_commitConfiguration__block_invoke;
    v3[3] = &unk_1E9E521C0;
    v3[4] = self;
    dispatch_sync(stateQueue, v3);
  }
}

uint64_t __48__VCVirtualAVCaptureSession_commitConfiguration__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v1 = result;
  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(result + 32);
  v3 = *(unsigned int *)(v2 + 56);
  v4 = *(_QWORD *)(v2 + 48);
  if (!(_DWORD)v3 || !v4)
  {
    result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("commitConfiguration invalid state. _configurationCount=%d, _batchedConfigurations=%@"), v3, v4);
    v2 = *(_QWORD *)(v1 + 32);
    LODWORD(v3) = *(_DWORD *)(v2 + 56);
  }
  *(_DWORD *)(v2 + 56) = v3 - 1;
  v5 = *(_QWORD *)(v1 + 32);
  if (!*(_DWORD *)(v5 + 56))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = *(void **)(v5 + 48);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i) + 16))();
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      }
      while (v8);
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 48), "removeAllObjects");
  }
  return result;
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create state queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __41__VCVirtualAVCaptureSession_startRunning__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Session failed to stop input devices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __40__VCVirtualAVCaptureSession_stopRunning__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Session failed to stop input devices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newConnectionWithInputPorts:outputDevice:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newConnectionWithInputPorts:outputDevice:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid virtual IO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
