@implementation AVCPacketRelay

- (AVCPacketRelay)initWithConnection:(id)a3 connection:(id)a4 error:(id *)a5
{
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = a3;
  return -[AVCPacketRelay initWithConnections:multiplexedConnection:error:](self, "initWithConnections:multiplexedConnection:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1), a4, a5);
}

- (AVCPacketRelay)initWithConnections:(id)a3 multiplexedConnection:(id)a4 error:(id *)a5
{
  AVCPacketRelay *v9;
  uint64_t v10;
  NSObject *CustomRootQueue;
  dispatch_queue_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[5];
  objc_super v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  VRTraceReset();
  v27.receiver = self;
  v27.super_class = (Class)AVCPacketRelay;
  v9 = -[AVCPacketRelay init](&v27, sel_init);
  if (!v9)
    return v9;
  v10 = objc_msgSend(a3, "count");
  if (!a4 || !v10)
  {
    v22 = -2144731135;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCPacketRelay initWithConnections:multiplexedConnection:error:].cold.4();
    }
LABEL_23:
    v23 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVCPacketRelayErrorDomain"), v22, 0);
    if (!v23)
      return v9;
    v24 = (void *)v23;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
      -[AVCPacketRelay initWithConnections:multiplexedConnection:error:].cold.1();
      if (!a5)
        goto LABEL_28;
    }
    else if (!a5)
    {
LABEL_28:

      return 0;
    }
    *a5 = v24;
    goto LABEL_28;
  }
  if (!objc_msgSend(a4, "type")
    || !-[AVCPacketRelay isAllConnectionTypeValid:](v9, "isAllConnectionTypeValid:", a3))
  {
    v22 = -2144731135;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCPacketRelay initWithConnections:multiplexedConnection:error:].cold.2();
    }
    goto LABEL_23;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v12 = dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCPacketRelayQueue", 0, CustomRootQueue);
  v9->_queue = (OS_dispatch_queue *)v12;
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
      v22 = -2144731133;
    }
    else
    {
      VRTraceErrorLogLevelToCSTR();
      v22 = -2144731133;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCPacketRelay initWithConnections:multiplexedConnection:error:].cold.3();
    }
    goto LABEL_23;
  }
  v9->_packetDriver = +[AVCPacketRelayDriver sharedInstance](AVCPacketRelayDriver, "sharedInstance");
  v13 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", v9);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke;
  v26[3] = &unk_1E9E57908;
  v26[4] = v13;
  objc_msgSend(a4, "setIsDemuxNeeded:", 1);
  objc_msgSend(a4, "setReadHandler:", v26);
  -[AVCPacketRelay setMultiplexedConnection:](v9, "setMultiplexedConnection:", a4);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(a3);
        v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v18, "setIsDemuxNeeded:", 0);
        objc_msgSend(v18, "setReadHandler:", v26);
      }
      v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
    }
    while (v15);
  }
  -[AVCPacketRelay setConnections:](v9, "setConnections:", a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend((id)-[AVCPacketRelay description](v9, "description"), "UTF8String");
      *(_DWORD *)buf = 136315906;
      v29 = v19;
      v30 = 2080;
      v31 = "-[AVCPacketRelay initWithConnections:multiplexedConnection:error:]";
      v32 = 1024;
      v33 = 567;
      v34 = 2080;
      v35 = v21;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created AVCPacketRelay %s successfully", buf, 0x26u);
    }
  }
  return v9;
}

void __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = a5;
  if (a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke_cold_3();
    }
    return;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "weak"))
  {
    v9 = (void *)MEMORY[0x1DF086F1C](objc_msgSend(*(id *)(a1 + 32), "weak"));
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "healthPrint:isSend:", a3, 0);
      if (a4)
      {
        v11 = (void *)objc_msgSend(v10, "findConnectionToForwardData:size:", a2, a3);
        v12 = (void *)objc_msgSend(v11, "packetFilter");
        if (objc_msgSend(v12, "isRTPFilter"))
          objc_msgSend(v10, "updateDemuxPacketStatsWithPacketFilterPacketType:", objc_msgSend(v12, "type"));
        if (!v11)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke_cold_1();
          }
          goto LABEL_24;
        }
        v13 = v11;
      }
      else
      {
        v13 = (void *)objc_msgSend(v10, "multiplexedConnection");
      }
      objc_msgSend(v13, "sendData:size:error:", a2, a3, &v16);
      if (v16)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke_cold_2();
        }
      }
      else
      {
        objc_msgSend(v10, "healthPrint:isSend:", a3, 1);
      }
LABEL_24:
      CFRelease(v10);
      return;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v18 = v14;
      v19 = 2080;
      v20 = "-[AVCPacketRelay initWithConnections:multiplexedConnection:error:]_block_invoke";
      v21 = 1024;
      v22 = 529;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelay has been dealloced", buf, 0x1Cu);
    }
  }
}

- (AVCPacketRelayDelegate)delegate
{
  return (AVCPacketRelayDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)start
{
  NSObject *queue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __23__AVCPacketRelay_start__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(queue, v3);
}

uint64_t __23__AVCPacketRelay_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = v2;
      v15 = 2080;
      v16 = "-[AVCPacketRelay start]_block_invoke";
      v17 = 1024;
      v18 = 594;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelay: starting...", (uint8_t *)&v13, 0x1Cu);
    }
  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "startAllConnections");
  v5 = *(void **)(a1 + 32);
  if (v4 < 0)
  {
    objc_msgSend(v5, "stopAllConnections");
    v11 = objc_msgSend(*(id *)(a1 + 32), "delegate");
    v12 = *(_QWORD *)(a1 + 32);
    v9 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVCPacketRelayErrorDomain"), v4, 0);
    v6 = (void *)v11;
    v7 = v12;
    v8 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(v5, "delegate");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 1;
    v9 = 0;
  }
  return objc_msgSend(v6, "packetRelay:didStart:error:", v7, v8, v9);
}

- (void)stop
{
  NSObject *queue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __22__AVCPacketRelay_stop__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(queue, v3);
}

uint64_t __22__AVCPacketRelay_stop__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
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
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v2;
      v7 = 2080;
      v8 = "-[AVCPacketRelay stop]_block_invoke";
      v9 = 1024;
      v10 = 613;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelay: stopping...", (uint8_t *)&v5, 0x1Cu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "stopAllConnections");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "packetRelay:didStop:error:", *(_QWORD *)(a1 + 32), 1, 0);
  return result;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSObject *queue;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v8 = v3;
      v9 = 2080;
      v10 = "-[AVCPacketRelay dealloc]";
      v11 = 1024;
      v12 = 632;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelay: dealloc", buf, 0x1Cu);
    }
  }

  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  objc_storeWeak((id *)&self->_delegate, 0);
  v6.receiver = self;
  v6.super_class = (Class)AVCPacketRelay;
  -[AVCPacketRelay dealloc](&v6, sel_dealloc);
}

- (BOOL)isAllConnectionTypeValid:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(a3);
      v8 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "type");
      if (!v8)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (int)startAllConnections
{
  NSArray *connections;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  int v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  connections = self->_connections;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(connections);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "start");
        if (v8 < 0)
        {
          v9 = v8;
          goto LABEL_12;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = -[AVCPacketRelayConnectionProtocol start](self->_multiplexedConnection, "start");
  if (v9 < 0)
  {
LABEL_12:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCPacketRelay startAllConnections].cold.1();
    }
  }
  return v9;
}

- (BOOL)stopAllConnections
{
  NSArray *connections;
  uint64_t v3;
  uint64_t v4;
  int v5;
  os_log_t *v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  connections = self->_connections;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = (os_log_t *)MEMORY[0x1E0CF2758];
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(connections);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "stop");
        if (v9 < 0)
        {
          v10 = v9;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v11 = VRTraceErrorLogLevelToCSTR();
            v12 = *v6;
            if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              v18 = v11;
              v19 = 2080;
              v20 = "-[AVCPacketRelay stopAllConnections]";
              v21 = 1024;
              v22 = 678;
              v23 = 1024;
              v24 = v10;
              _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCPacketRelay: stop connection failed with result %08X", buf, 0x22u);
            }
          }
          v5 = v10;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  v13 = -[AVCPacketRelayConnectionProtocol stop](self->_multiplexedConnection, "stop");
  if (v13 < 0)
  {
    v14 = v13;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCPacketRelay stopAllConnections].cold.2();
    }
    v5 = v14;
  }
  else if ((v5 & 0x80000000) == 0)
  {
    return v5 != 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVCPacketRelay stopAllConnections].cold.1();
  }
  return v5 != 0;
}

- (id)findConnectionToForwardData:(const void *)a3 size:(int)a4
{
  uint64_t v4;
  NSArray *connections;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a4;
  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  connections = self->_connections;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v15;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v9)
      objc_enumerationMutation(connections);
    v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
    if (!objc_msgSend(v11, "packetFilter")
      || (objc_msgSend((id)objc_msgSend(v11, "packetFilter"), "isMatchedPacket:size:", a3, v4) & 1) != 0)
    {
      return v11;
    }
    if (v8 == ++v10)
    {
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      v11 = 0;
      if (v8)
        goto LABEL_3;
      return v11;
    }
  }
}

- (void)healthPrint:(unint64_t)a3 isSend:(BOOL)a4
{
  _BOOL4 v4;
  int v5;
  double v7;
  double v8;
  unsigned int v9;
  double v10;
  uint64_t v12;
  NSObject *v13;
  unsigned int sendPacketCount;
  unsigned int sendByteCount;
  unsigned int v16;
  double v17;
  uint64_t v19;
  NSObject *v20;
  unsigned int receivePacketCount;
  unsigned int receiveByteCount;
  unsigned int rtpAndRTCPPacketCount;
  unsigned int rtpPacketCount;
  unsigned int rtcpPacketCount;
  unsigned int droppedPacketCount;
  int v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  unsigned int v44;
  __int16 v45;
  unsigned int v46;
  __int16 v47;
  unsigned int v48;
  uint64_t v49;

  v4 = a4;
  v5 = a3;
  v49 = *MEMORY[0x1E0C80C00];
  v7 = micro();
  v8 = v7;
  if (v4)
  {
    v9 = self->_healthStats.sendByteCount + v5;
    ++self->_healthStats.sendPacketCount;
    self->_healthStats.sendByteCount = v9;
    v10 = v7 - self->_healthStats.lastSendTimePrint;
    if (v10 > 0.0 && v10 > 5.0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          sendPacketCount = self->_healthStats.sendPacketCount;
          sendByteCount = self->_healthStats.sendByteCount;
          v27 = 136316674;
          v28 = v12;
          v29 = 2080;
          v30 = "-[AVCPacketRelay healthPrint:isSend:]";
          v31 = 1024;
          v32 = 720;
          v33 = 1024;
          v34 = sendPacketCount;
          v35 = 1024;
          v36 = sendByteCount;
          v37 = 2048;
          v38 = v10;
          v39 = 2048;
          v40 = (double)(8 * sendByteCount) / v10 / 1000.0;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: AVCPacketRelay Health Monitor for AVCPacketRelay Send packet count=%d, byte count=%d, interval=%.3fs, rate=%.3fkbps", (uint8_t *)&v27, 0x3Cu);
        }
      }
      self->_healthStats.lastSendTimePrint = v8;
      *(_QWORD *)&self->_healthStats.sendPacketCount = 0;
    }
  }
  else
  {
    v16 = self->_healthStats.receiveByteCount + v5;
    ++self->_healthStats.receivePacketCount;
    self->_healthStats.receiveByteCount = v16;
    v17 = v7 - self->_healthStats.lastReceiveTimePrint;
    if (v17 > 0.0 && v17 > 5.0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          receivePacketCount = self->_healthStats.receivePacketCount;
          receiveByteCount = self->_healthStats.receiveByteCount;
          v27 = 136317698;
          rtpAndRTCPPacketCount = self->_healthStats.demuxPacketStats.rtpAndRTCPPacketCount;
          rtpPacketCount = self->_healthStats.demuxPacketStats.rtpPacketCount;
          rtcpPacketCount = self->_healthStats.demuxPacketStats.rtcpPacketCount;
          droppedPacketCount = self->_healthStats.demuxPacketStats.droppedPacketCount;
          v28 = v19;
          v29 = 2080;
          v30 = "-[AVCPacketRelay healthPrint:isSend:]";
          v31 = 1024;
          v32 = 739;
          v33 = 1024;
          v34 = receivePacketCount;
          v35 = 1024;
          v36 = receiveByteCount;
          v37 = 2048;
          v38 = v17;
          v39 = 2048;
          v40 = (double)(8 * receiveByteCount) / v17 / 1000.0;
          v41 = 1024;
          v42 = rtpAndRTCPPacketCount;
          v43 = 1024;
          v44 = rtpPacketCount;
          v45 = 1024;
          v46 = rtcpPacketCount;
          v47 = 1024;
          v48 = droppedPacketCount;
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: AVCPacketRelay Health Monitor for AVCPacketRelay Recv packet count=%d, byte count=%d, interval=%.3fs, rate:%.3fkbps, demuxPackets:[rtpAndRTCPPacketCount=%u, rtpPacketCount=%u, rtcpPacketCount=%u, droppedPacketCount=%u]", (uint8_t *)&v27, 0x54u);
        }
      }
      self->_healthStats.lastReceiveTimePrint = v8;
      *(_QWORD *)&self->_healthStats.receivePacketCount = 0;
      *(_QWORD *)&self->_healthStats.demuxPacketStats.rtpAndRTCPPacketCount = 0;
      *(_QWORD *)&self->_healthStats.demuxPacketStats.rtcpPacketCount = 0;
    }
  }
}

- (void)updateDemuxPacketStatsWithPacketFilterPacketType:(unsigned __int8)a3
{
  if (a3 == 2)
  {
    ++self->_healthStats.demuxPacketStats.rtcpPacketCount;
  }
  else if (a3 == 1)
  {
    ++self->_healthStats.demuxPacketStats.rtpPacketCount;
  }
  else if (a3)
  {
    ++self->_healthStats.demuxPacketStats.droppedPacketCount;
  }
  else
  {
    ++self->_healthStats.demuxPacketStats.rtpAndRTCPPacketCount;
  }
}

- (NSArray)connections
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (AVCPacketRelayConnectionProtocol)multiplexedConnection
{
  return (AVCPacketRelayConnectionProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMultiplexedConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)initWithConnections:multiplexedConnection:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  objc_msgSend((id)OUTLINED_FUNCTION_10_1(v0, *MEMORY[0x1E0C80C00]), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d AVCPacketRelay: init failed with error %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithConnections:multiplexedConnection:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelay: init connection has wrong type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConnections:multiplexedConnection:error:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelay: failed to create AVCPacketRelayQueue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConnections:multiplexedConnection:error:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelay: init connection is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelay: doesn't know how to forward packet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke_cold_2()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  if (*v0)
    objc_msgSend((id)objc_msgSend(*v0, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d AVCPacketRelay: forwarding packet failed with error %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

void __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  objc_msgSend((id)OUTLINED_FUNCTION_10_1(v0, *MEMORY[0x1E0C80C00]), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d AVCPacketRelay: readHandler failed with error %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)startAllConnections
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCPacketRelay startAllConnections]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelay: start failed with result %08X", v2, *(const char **)v3, (unint64_t)"-[AVCPacketRelay startAllConnections]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)stopAllConnections
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCPacketRelay stopAllConnections]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelay: stop multiplexed connection failed with result %08X", v2, *(const char **)v3, (unint64_t)"-[AVCPacketRelay stopAllConnections]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

@end
