@implementation AVCPacketRelaySocketConnection

- (AVCPacketRelaySocketConnection)initWithSocket:(unsigned __int16)a3 remoteAddress:(id)a4 packetFilter:(id)a5
{
  int v7;
  AVCPacketRelaySocketConnection *v8;
  AVCPacketRelaySocketConnection *v9;
  __int128 v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  objc_super v17;
  _BYTE buf[40];
  uint64_t v19;

  v7 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)AVCPacketRelaySocketConnection;
  v8 = -[AVCPacketRelaySocketConnection init](&v17, sel_init);
  v9 = v8;
  if (!v8)
    return v9;
  v8->_unixSocket = v7;
  v8->_remoteIPPortLength = 16;
  if (a4)
  {
    if (!objc_msgSend((id)objc_msgSend(a4, "ip"), "length"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:].cold.3();
      }
      goto LABEL_18;
    }
    if (!getpeername(v7, &v9->_remoteIPPort, &v9->_remoteIPPortLength))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:].cold.4(v11);
      }
      goto LABEL_18;
    }
    *(_QWORD *)&buf[32] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v10;
    *(_OWORD *)&buf[16] = v10;
    objc_msgSend((id)objc_msgSend(a4, "ip"), "UTF8String");
    objc_msgSend(a4, "port");
    MakeIPPORT();
    if ((buf[0] & 1) != 0)
      IPPORTToSA6();
    else
      IPPORTToSA();
    v9->_isConnectedSocket = 0;
  }
  else
  {
    if (getpeername(v7, &v8->_remoteIPPort, &v8->_remoteIPPortLength) == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:].cold.2();
      }
      goto LABEL_18;
    }
    v9->_isConnectedSocket = 1;
  }
  v9->_type = 1;
  -[AVCPacketRelaySocketConnection setPacketFilter:](v9, "setPacketFilter:", a5);
  v12 = (char *)malloc_type_malloc(0x5C0uLL, 0x29770484uLL);
  v9->dataBuffer = v12;
  if (v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(-[AVCPacketRelaySocketConnection description](v9, "description"), "UTF8String");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 105;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v15;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created AVCPacketRelaySocketConnection %s successfully", buf, 0x26u);
      }
    }
    return v9;
  }
LABEL_18:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:].cold.1();
  }

  return 0;
}

- (int)start
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = v3;
      v10 = 2080;
      v11 = "-[AVCPacketRelaySocketConnection start]";
      v12 = 1024;
      v13 = 117;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelaySocketConnection: starting...", (uint8_t *)&v8, 0x1Cu);
    }
  }
  if (self->_readHandler)
  {
    v5 = (void *)MEMORY[0x1DF088A10]();
    -[AVCPacketRelayDriver startMonitoringFileDescriptor:forConnection:](+[AVCPacketRelayDriver sharedInstance](AVCPacketRelayDriver, "sharedInstance"), "startMonitoringFileDescriptor:forConnection:", self->_unixSocket, self);
    objc_autoreleasePoolPop(v5);
    return 0;
  }
  else
  {
    v6 = -2144731132;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCPacketRelaySocketConnection start].cold.1();
    }
  }
  return v6;
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
      v10 = "-[AVCPacketRelaySocketConnection stop]";
      v11 = 1024;
      v12 = 132;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelaySocketConnection: stopping...", (uint8_t *)&v7, 0x1Cu);
    }
  }
  v5 = (void *)MEMORY[0x1DF088A10]();
  -[AVCPacketRelayDriver stopMonitoringFileDescriptor:](+[AVCPacketRelayDriver sharedInstance](AVCPacketRelayDriver, "sharedInstance"), "stopMonitoringFileDescriptor:", self->_unixSocket);
  objc_autoreleasePoolPop(v5);
  return 0;
}

- (void)readyToRead
{
  -[AVCPacketRelaySocketConnection receiveDataOnSocket:](self, "receiveDataOnSocket:", LOWORD(self->_unixSocket));
}

- (void)receiveDataOnSocket:(unsigned __int16)a3
{
  int v4;
  __int128 v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int ErrorLogLevelForModule;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  socklen_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  _BYTE v24[54];
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  sockaddr v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self->_isConnectedSocket)
  {
    v4 = recv(a3, self->dataBuffer, 0x5C0uLL, 0);
  }
  else
  {
    *(_QWORD *)&v28.sa_len = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v28.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
    v15 = 16;
    v4 = recvfrom(a3, self->dataBuffer, 0x5C0uLL, 0, &v28, &v15);
    v27 = 0;
    v26 = 0u;
    v25 = 0u;
    *(_QWORD *)&v24[46] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v24[16] = v5;
    *(_OWORD *)&v24[32] = v5;
    *(_OWORD *)v24 = v5;
    SAToIPPORT();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = IPPORTToStringWithSize();
          *(_DWORD *)buf = 136315906;
          v17 = v6;
          v18 = 2080;
          v19 = "-[AVCPacketRelaySocketConnection receiveDataOnSocket:]";
          v20 = 1024;
          v21 = 159;
          v22 = 2080;
          v23 = v9;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelaySocketConnection: received from %s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v14 = IPPORTToStringWithSize();
        *(_DWORD *)buf = 136315906;
        v17 = v6;
        v18 = 2080;
        v19 = "-[AVCPacketRelaySocketConnection receiveDataOnSocket:]";
        v20 = 1024;
        v21 = 159;
        v22 = 2080;
        v23 = v14;
        _os_log_debug_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEBUG, " [%s] %s:%d AVCPacketRelaySocketConnection: received from %s", buf, 0x26u);
      }
    }
  }
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 < 0)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCPacketRelaySocketConnection receiveDataOnSocket:].cold.1();
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 8)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      v13 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v24 = 136315906;
          *(_QWORD *)&v24[4] = v11;
          *(_WORD *)&v24[12] = 2080;
          *(_QWORD *)&v24[14] = "-[AVCPacketRelaySocketConnection receiveDataOnSocket:]";
          *(_WORD *)&v24[22] = 1024;
          *(_DWORD *)&v24[24] = 166;
          *(_WORD *)&v24[28] = 1024;
          *(_DWORD *)&v24[30] = v4;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelaySocketConnection: received %d bytes of data", v24, 0x22u);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[AVCPacketRelaySocketConnection receiveDataOnSocket:].cold.2();
      }
    }
    (*((void (**)(void))self->_readHandler + 2))();
  }
}

- (BOOL)sendData:(const void *)a3 size:(unsigned int)a4 error:(id *)a5
{
  int unixSocket;
  int *p_unixSocket;
  ssize_t v10;
  ssize_t v11;
  ssize_t v12;
  int ErrorLogLevelForModule;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  BOOL result;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  ssize_t v30;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  p_unixSocket = &self->_unixSocket;
  unixSocket = self->_unixSocket;
  v10 = a4;
  if (*((_BYTE *)p_unixSocket + 4))
    v11 = send(unixSocket, a3, a4, 0);
  else
    v11 = sendto(unixSocket, a3, a4, 0, &self->_remoteIPPort, self->_remoteIPPortLength);
  v12 = v11;
  if (v11 == -1)
  {
    if (*__error() == 35 || *__error() == 55)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[AVCPacketRelaySocketConnection sendData:size:error:].cold.1();
          if (!a5)
            return 0;
LABEL_23:
          v16 = (void *)MEMORY[0x1E0CB35C8];
          v17 = -2144731103;
          goto LABEL_24;
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        -[AVCPacketRelaySocketConnection sendData:size:error:].cold.2();
        if (a5)
          goto LABEL_23;
        return 0;
      }
    }
    if (a5)
      goto LABEL_23;
    return 0;
  }
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v12 < v10)
  {
    if (ErrorLogLevelForModule >= 3
      && (v14 = VRTraceErrorLogLevelToCSTR(),
          v15 = *MEMORY[0x1E0CF2758],
          os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
      v23 = 136316162;
      v24 = v14;
      v25 = 2080;
      v26 = "-[AVCPacketRelaySocketConnection sendData:size:error:]";
      v27 = 1024;
      v28 = 195;
      v29 = 2048;
      v30 = v12;
      v31 = 1024;
      v32 = a4;
      _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCPacketRelaySocketConnection: sent %zu bytes < %u total bytes", (uint8_t *)&v23, 0x2Cu);
      if (a5)
        goto LABEL_9;
    }
    else if (a5)
    {
LABEL_9:
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = -2144731122;
LABEL_24:
      v21 = (void *)objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("AVCPacketRelayErrorDomain"), v17, 0);
      result = 0;
      *a5 = v21;
      return result;
    }
    return 0;
  }
  if (ErrorLogLevelForModule >= 8)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    v20 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315906;
        v24 = v18;
        v25 = 2080;
        v26 = "-[AVCPacketRelaySocketConnection sendData:size:error:]";
        v27 = 1024;
        v28 = 201;
        v29 = 2048;
        v30 = v12;
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelaySocketConnection: sent %zu bytes", (uint8_t *)&v23, 0x26u);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      -[AVCPacketRelaySocketConnection sendData:size:error:].cold.3();
    }
  }
  return 1;
}

- (id)description
{
  SAToIPPORT();
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("socket connection with remote IPPort %s, socket %d (connected %d)"), IPPORTToStringWithSize(), self->_unixSocket, self->_isConnectedSocket);
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
      v10 = "-[AVCPacketRelaySocketConnection dealloc]";
      v11 = 1024;
      v12 = 216;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelaySocketConnection: dealloc", buf, 0x1Cu);
    }
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  free(self->dataBuffer);

  v6.receiver = self;
  v6.super_class = (Class)AVCPacketRelaySocketConnection;
  -[AVCPacketRelaySocketConnection dealloc](&v6, sel_dealloc);
}

- (unsigned)type
{
  return self->_type;
}

- (id)readHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setReadHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
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
  return (AVCPacketFilter *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPacketFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)initWithSocket:remoteAddress:packetFilter:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: init error %08X", v2, *(const char **)v3, (unint64_t)"-[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)initWithSocket:remoteAddress:packetFilter:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_4_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: getpeername failed on connected socket %d with errno %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9_5();
}

- (void)initWithSocket:remoteAddress:packetFilter:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: invalid remote IPPort", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithSocket:(uint64_t)a1 remoteAddress:packetFilter:.cold.4(uint64_t a1)
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
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d AVCPacketRelaySocketConnection: socket %d is connected. Expected an unconnected socket", (const char *)v3, *((const char **)&v3 + 1), v4, v5);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: cannot start without setting read handler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receiveDataOnSocket:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_15_9();
  OUTLINED_FUNCTION_4_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: receive failed with error %d on socket %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9_5();
}

- (void)receiveDataOnSocket:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCPacketRelaySocketConnection receiveDataOnSocket:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: received %d bytes of data", v2, *(const char **)v3, (unint64_t)"-[AVCPacketRelaySocketConnection receiveDataOnSocket:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)sendData:size:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_15_9();
  OUTLINED_FUNCTION_4_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: send failed with error %d on socket %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9_5();
}

- (void)sendData:size:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_4_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: send failed with broken pipe (socket %d), error %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9_5();
}

- (void)sendData:size:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[AVCPacketRelaySocketConnection sendData:size:error:]";
  OUTLINED_FUNCTION_4();
  v4 = 201;
  v5 = 2048;
  v6 = v0;
  _os_log_debug_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d AVCPacketRelaySocketConnection: sent %zu bytes", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

@end
