@implementation AVCPacketRelayIDSConnection

- (AVCPacketRelayIDSConnection)initWithIDSSocketDescriptor:(unsigned __int16)a3
{
  uint64_t v3;
  AVCPacketRelayIDSConnection *v4;
  AVCPacketRelayIDSConnection *v5;
  IDSService *v6;
  IDSDatagramChannel *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  objc_super v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)AVCPacketRelayIDSConnection;
  v13 = 0;
  v4 = -[AVCPacketRelayIDSConnection init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = 2;
    v6 = (IDSService *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.willow.stream"));
    v5->_packetRelayService = v6;
    if (v6
      && (v7 = (IDSDatagramChannel *)(id)-[IDSService datagramChannelForSocketDescriptor:error:](v6, "datagramChannelForSocketDescriptor:error:", v3, &v13), (v5->_datagramChannel = v7) != 0))
    {
      -[AVCPacketRelayIDSConnection setPacketFilter:](v5, "setPacketFilter:", 0);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_msgSend((id)-[AVCPacketRelayIDSConnection description](v5, "description"), "UTF8String");
          *(_DWORD *)buf = 136315906;
          v15 = v8;
          v16 = 2080;
          v17 = "-[AVCPacketRelayIDSConnection initWithIDSSocketDescriptor:]";
          v18 = 1024;
          v19 = 264;
          v20 = 2080;
          v21 = v10;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created AVCPacketRelayIDSConnection %s successfully", buf, 0x26u);
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCPacketRelayIDSConnection initWithIDSSocketDescriptor:].cold.1();
      }

      return 0;
    }
  }
  return v5;
}

- (AVCPacketRelayIDSConnection)initWithIDSDestination:(id)a3
{
  AVCPacketRelayIDSConnection *v4;
  AVCPacketRelayIDSConnection *v5;
  IDSService *v6;
  IDSDatagramChannel *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  objc_super v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)AVCPacketRelayIDSConnection;
  v13 = 0;
  v4 = -[AVCPacketRelayIDSConnection init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = 2;
    v6 = (IDSService *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.willow.stream"));
    v5->_packetRelayService = v6;
    if (v6
      && (v7 = (IDSDatagramChannel *)(id)-[IDSService datagramChannelForSessionDestination:error:](v6, "datagramChannelForSessionDestination:error:", a3, &v13), (v5->_datagramChannel = v7) != 0))
    {
      -[AVCPacketRelayIDSConnection setPacketFilter:](v5, "setPacketFilter:", 0);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_msgSend((id)-[AVCPacketRelayIDSConnection description](v5, "description"), "UTF8String");
          *(_DWORD *)buf = 136315906;
          v15 = v8;
          v16 = 2080;
          v17 = "-[AVCPacketRelayIDSConnection initWithIDSDestination:]";
          v18 = 1024;
          v19 = 289;
          v20 = 2080;
          v21 = v10;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created AVCPacketRelayIDSConnection %s successfully", buf, 0x26u);
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCPacketRelayIDSConnection initWithIDSDestination:].cold.1();
      }

      return 0;
    }
  }
  return v5;
}

- (int)start
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  id readHandler;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[AVCPacketRelayIDSConnection isResumed](self, "isResumed"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 0;
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    v5 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v15 = v3;
      v16 = 2080;
      v17 = "-[AVCPacketRelayIDSConnection start]";
      v18 = 1024;
      v19 = 302;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayIDSConnection: already started", buf, 0x1Cu);
      return 0;
    }
  }
  else
  {
    readHandler = self->_readHandler;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (readHandler)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v15 = v8;
          v16 = 2080;
          v17 = "-[AVCPacketRelayIDSConnection start]";
          v18 = 1024;
          v19 = 311;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayIDSConnection: starting...", buf, 0x1Cu);
        }
      }
      v10 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __36__AVCPacketRelayIDSConnection_start__block_invoke;
      v13[3] = &unk_1E9E578C0;
      v13[4] = v10;
      -[IDSDatagramChannel setReadHandler:](self->_datagramChannel, "setReadHandler:", v13);
      v11 = (void *)MEMORY[0x1DF088A10](-[IDSDatagramChannel setEventHandler:](self->_datagramChannel, "setEventHandler:", &__block_literal_global_82));
      -[AVCPacketRelayDriver startMonitoringFileDescriptor:forConnection:](+[AVCPacketRelayDriver sharedInstance](AVCPacketRelayDriver, "sharedInstance"), "startMonitoringFileDescriptor:forConnection:", -[IDSDatagramChannel underlyingFileDescriptor](self->_datagramChannel, "underlyingFileDescriptor"), self);
      objc_autoreleasePoolPop(v11);
      -[AVCPacketRelayIDSConnection setIsResumed:](self, "setIsResumed:", 1);
      return 0;
    }
    v5 = -2144731132;
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCPacketRelayIDSConnection start].cold.1();
    }
  }
  return v5;
}

void __36__AVCPacketRelayIDSConnection_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, void *a6)
{
  uint64_t v8;
  NSObject *v9;
  uint64_t v13;
  void *v14;
  int ErrorLogLevelForModule;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v23 = 136316162;
        v24 = v8;
        v25 = 2080;
        v26 = "-[AVCPacketRelayIDSConnection start]_block_invoke";
        v27 = 1024;
        v28 = 316;
        v29 = 1024;
        v30 = a4;
        v31 = 2080;
        v32 = objc_msgSend((id)objc_msgSend(a6, "description"), "UTF8String");
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCPacketRelayIDSConnection: Datagram channel link %d failed to read with error %s", (uint8_t *)&v23, 0x2Cu);
      }
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "weak")
         && (v13 = MEMORY[0x1DF086F1C](objc_msgSend(*(id *)(a1 + 32), "weak"))) != 0)
  {
    v14 = (void *)v13;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if ((_DWORD)a3)
    {
      if (ErrorLogLevelForModule >= 8)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        v18 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v23 = 136315906;
            v24 = v16;
            v25 = 2080;
            v26 = "-[AVCPacketRelayIDSConnection start]_block_invoke";
            v27 = 1024;
            v28 = 333;
            v29 = 1024;
            v30 = a3;
            _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayIDSConnection: reading %u bytes", (uint8_t *)&v23, 0x22u);
          }
        }
        else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          __36__AVCPacketRelayIDSConnection_start__block_invoke_cold_2();
        }
      }
      v22 = objc_msgSend(v14, "readHandler");
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v22 + 16))(v22, a2, a3, objc_msgSend(v14, "isDemuxNeeded"), 0);
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __36__AVCPacketRelayIDSConnection_start__block_invoke_cold_1(v21);
    }
    CFRelease(v14);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136315650;
      v24 = v19;
      v25 = 2080;
      v26 = "-[AVCPacketRelayIDSConnection start]_block_invoke";
      v27 = 1024;
      v28 = 322;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayConnection has been dealloced", (uint8_t *)&v23, 0x1Cu);
    }
  }
}

void __36__AVCPacketRelayIDSConnection_start__block_invoke_75(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D33EB8]);
  if (v2)
  {
    v3 = v2;
    if (objc_msgSend(v2, "unsignedIntValue") == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = 136315650;
          v9 = v4;
          v10 = 2080;
          v11 = "-[AVCPacketRelayIDSConnection start]_block_invoke";
          v12 = 1024;
          v13 = 347;
          v6 = " [%s] %s:%d AVCPacketRelayIDSConnection: IDS channel connected";
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0x1Cu);
        }
      }
    }
    else if (objc_msgSend(v3, "unsignedIntValue") == 2 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315650;
        v9 = v7;
        v10 = 2080;
        v11 = "-[AVCPacketRelayIDSConnection start]_block_invoke";
        v12 = 1024;
        v13 = 349;
        v6 = " [%s] %s:%d AVCPacketRelayIDSConnection: IDS channel disconnected";
        goto LABEL_13;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __36__AVCPacketRelayIDSConnection_start__block_invoke_75_cold_1();
  }
}

- (int)stop
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = v3;
      v9 = 2080;
      v10 = "-[AVCPacketRelayIDSConnection stop]";
      v11 = 1024;
      v12 = 366;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayIDSConnection: stopping...", (uint8_t *)&v7, 0x1Cu);
    }
  }
  v5 = (void *)MEMORY[0x1DF088A10](-[AVCPacketRelayIDSConnection setIsResumed:](self, "setIsResumed:", 0));
  -[AVCPacketRelayDriver stopMonitoringFileDescriptor:](+[AVCPacketRelayDriver sharedInstance](AVCPacketRelayDriver, "sharedInstance"), "stopMonitoringFileDescriptor:", -[IDSDatagramChannel underlyingFileDescriptor](self->_datagramChannel, "underlyingFileDescriptor"));
  objc_autoreleasePoolPop(v5);
  return 0;
}

- (void)readyToRead
{
  if (-[AVCPacketRelayIDSConnection isResumed](self, "isResumed"))
    -[IDSDatagramChannel readyToRead](self->_datagramChannel, "readyToRead");
}

- (BOOL)sendData:(const void *)a3 size:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  BOOL v9;
  IDSDatagramChannel *datagramChannel;
  _QWORD v12[4];
  int v13;
  uint64_t v14;

  v6 = *(_QWORD *)&a4;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = -[AVCPacketRelayIDSConnection isResumed](self, "isResumed");
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
      -[AVCPacketRelayIDSConnection sendData:size:error:].cold.1();
      if (!a5)
        return v9;
    }
    else if (!a5)
    {
      return v9;
    }
    *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVCPacketRelayErrorDomain"), -2144731132, 0);
    return v9;
  }
  datagramChannel = self->_datagramChannel;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__AVCPacketRelayIDSConnection_sendData_size_error___block_invoke;
  v12[3] = &__block_descriptor_36_e17_v16__0__NSError_8l;
  v13 = v6;
  -[IDSDatagramChannel writeDatagram:datagramSize:flags:completionHandler:](datagramChannel, "writeDatagram:datagramSize:flags:completionHandler:", a3, v6, 45875200, 0, v12);
  return v9;
}

void __51__AVCPacketRelayIDSConnection_sendData_size_error___block_invoke(uint64_t a1, void *a2)
{
  int ErrorLogLevelForModule;
  uint64_t v5;
  char IsOSFaultDisabled;
  NSObject *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (a2)
  {
    if (ErrorLogLevelForModule >= 2)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v7 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v8 = *(_DWORD *)(a1 + 32);
          v14 = 136316162;
          v15 = v5;
          v16 = 2080;
          v17 = "-[AVCPacketRelayIDSConnection sendData:size:error:]_block_invoke";
          v18 = 1024;
          v19 = 398;
          v20 = 1024;
          v21 = v8;
          v22 = 2080;
          v23 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
          _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCPacketRelayIDSConnection: write %u bytes failed with error %s", (uint8_t *)&v14, 0x2Cu);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        v13 = *(_DWORD *)(a1 + 32);
        v14 = 136316162;
        v15 = v5;
        v16 = 2080;
        v17 = "-[AVCPacketRelayIDSConnection sendData:size:error:]_block_invoke";
        v18 = 1024;
        v19 = 398;
        v20 = 1024;
        v21 = v13;
        v22 = 2080;
        v23 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
        _os_log_fault_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_FAULT, " [%s] %s:%d AVCPacketRelayIDSConnection: write %u bytes failed with error %s", (uint8_t *)&v14, 0x2Cu);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 8)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    v11 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_DWORD *)(a1 + 32);
        v14 = 136315906;
        v15 = v9;
        v16 = 2080;
        v17 = "-[AVCPacketRelayIDSConnection sendData:size:error:]_block_invoke";
        v18 = 1024;
        v19 = 400;
        v20 = 1024;
        v21 = v12;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayIDSConnection: write %u bytes successfully", (uint8_t *)&v14, 0x22u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __51__AVCPacketRelayIDSConnection_sendData_size_error___block_invoke_cold_1(v9);
    }
  }
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[AVCPacketRelayIDSConnection dealloc]";
      v10 = 1024;
      v11 = 407;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayIDSConnection: dealloc", buf, 0x1Cu);
    }
  }
  -[IDSDatagramChannel invalidate](self->_datagramChannel, "invalidate");

  self->_datagramChannel = 0;
  -[AVCPacketRelayIDSConnection setPacketFilter:](self, "setPacketFilter:", 0);
  -[AVCPacketRelayIDSConnection setReadHandler:](self, "setReadHandler:", 0);
  v5.receiver = self;
  v5.super_class = (Class)AVCPacketRelayIDSConnection;
  -[AVCPacketRelayIDSConnection dealloc](&v5, sel_dealloc);
}

- (BOOL)isResumed
{
  return self->_isResumed;
}

- (void)setIsResumed:(BOOL)a3
{
  self->_isResumed = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (id)readHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setReadHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)isDemuxNeeded
{
  return self->_isDemuxNeeded;
}

- (void)setIsDemuxNeeded:(BOOL)a3
{
  self->_isDemuxNeeded = a3;
}

- (AVCPacketFilter)packetFilter
{
  return (AVCPacketFilter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPacketFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)initWithIDSSocketDescriptor:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCPacketRelayIDSConnection initWithIDSSocketDescriptor:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelayIDSConnection: init error %08X", v2, *(const char **)v3, (unint64_t)"-[AVCPacketRelayIDSConnection initWithIDSSocketDescriptor:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)initWithIDSDestination:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCPacketRelayIDSConnection initWithIDSDestination:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelayIDSConnection: init error %08X", v2, *(const char **)v3, (unint64_t)"-[AVCPacketRelayIDSConnection initWithIDSDestination:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)start
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelayIDSConnection: cannot start without setting read handler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __36__AVCPacketRelayIDSConnection_start__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;
  int v4;
  int v5;

  LODWORD(v3) = 136315906;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d AVCPacketRelayIDSConnection: Datagram channel link %d returned empty datagram", (const char *)v3, *((const char **)&v3 + 1), v4, v5);
  OUTLINED_FUNCTION_3();
}

void __36__AVCPacketRelayIDSConnection_start__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCPacketRelayIDSConnection start]_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelayIDSConnection: reading %u bytes", v2, *(const char **)v3, (unint64_t)"-[AVCPacketRelayIDSConnection start]_block_invoke" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

void __36__AVCPacketRelayIDSConnection_start__block_invoke_75_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelayIDSConnection: IDS eventHandler called without event type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendData:size:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelayIDSConnection: resume the connection and wait to be connected before sending data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__AVCPacketRelayIDSConnection_sendData_size_error___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;
  int v4;
  int v5;

  LODWORD(v3) = 136315906;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v1, v2, " [%s] %s:%d AVCPacketRelayIDSConnection: write %u bytes successfully", (const char *)v3, *((const char **)&v3 + 1), v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
