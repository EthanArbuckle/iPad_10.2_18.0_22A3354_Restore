@implementation GKAsyncSocketInternal

- (GKAsyncSocketInternal)init
{
  GKAsyncSocketInternal *v2;
  NSMutableData *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKAsyncSocketInternal;
  v2 = -[GKAsyncSocketInternal init](&v5, sel_init);
  if (v2)
  {
    v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v2->_dataToSend = v3;
    if (v3)
    {
      v2->_connectionSocket = -1;
      v2->_syncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.GameKitServices.GKAsyncSocket", 0);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)setTargetQueue:(id)a3
{
  NSObject *targetQueue;

  if (a3)
    dispatch_retain((dispatch_object_t)a3);
  targetQueue = self->_targetQueue;
  if (targetQueue)
    dispatch_release(targetQueue);
  self->_targetQueue = (OS_dispatch_queue *)a3;
}

- (BOOL)setupSourcesWithSocket:(int)a3 receiveEventHandler:(id)a4 sendEventHandler:(id)a5
{
  int v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *v11;
  NSObject *receiveSource;
  uint64_t v13;
  NSObject *sendSource;
  uint64_t v15;
  NSObject *v16;
  int connectionSocket;
  NSString *v18;
  const char *v19;
  _BOOL4 v20;
  uint64_t v21;
  NSObject *v22;
  NSString *socketName;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  NSString *v27;
  const char *v28;
  _QWORD v30[5];
  _QWORD handler[4];
  int v32;
  int v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  GKAsyncSocketInternal *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v9 = fcntl(a3, 3, 0);
  if (v9 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v20 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR);
      if (!v20)
        return v20;
      -[GKAsyncSocketInternal setupSourcesWithSocket:receiveEventHandler:sendEventHandler:].cold.1();
    }
LABEL_27:
    LOBYTE(v20) = 0;
    return v20;
  }
  if (fcntl(a3, 4, v9 | 4u) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v20 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR);
      if (!v20)
        return v20;
      -[GKAsyncSocketInternal setupSourcesWithSocket:receiveEventHandler:sendEventHandler:].cold.2();
    }
    goto LABEL_27;
  }
  v33 = 1;
  if (setsockopt(a3, 0xFFFF, 4130, &v33, 4u) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v20 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR);
      if (!v20)
        return v20;
      -[GKAsyncSocketInternal setupSourcesWithSocket:receiveEventHandler:sendEventHandler:].cold.3();
    }
    goto LABEL_27;
  }
  v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA00], a3, 0, (dispatch_queue_t)self->_syncQueue);
  self->_receiveSource = v10;
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      {
        socketName = self->_socketName;
        if (socketName)
          v24 = -[NSString UTF8String](-[NSString description](socketName, "description"), "UTF8String");
        else
          v24 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v35 = v21;
        v36 = 2080;
        v37 = "-[GKAsyncSocketInternal setupSourcesWithSocket:receiveEventHandler:sendEventHandler:]";
        v38 = 1024;
        v39 = 148;
        v40 = 2048;
        v41 = self;
        v42 = 1024;
        v43 = a3;
        v44 = 2080;
        v45 = v24;
        _os_log_error_impl(&dword_215C5C000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] sd [%d] name [%s] cannot create dispatch source for reading socket", buf, 0x36u);
      }
    }
    goto LABEL_26;
  }
  v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA30], a3, 0, (dispatch_queue_t)self->_syncQueue);
  self->_sendSource = v11;
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      {
        v27 = self->_socketName;
        if (v27)
          v28 = -[NSString UTF8String](-[NSString description](v27, "description"), "UTF8String");
        else
          v28 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v35 = v25;
        v36 = 2080;
        v37 = "-[GKAsyncSocketInternal setupSourcesWithSocket:receiveEventHandler:sendEventHandler:]";
        v38 = 1024;
        v39 = 155;
        v40 = 2048;
        v41 = self;
        v42 = 1024;
        v43 = a3;
        v44 = 2080;
        v45 = v28;
        _os_log_error_impl(&dword_215C5C000, v26, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] sd [%d] name [%s] cannot create dispatch source for writing socket", buf, 0x36u);
      }
    }
    dispatch_release((dispatch_object_t)self->_receiveSource);
LABEL_26:
    close(a3);
    goto LABEL_27;
  }
  self->_connectionSocket = a3;
  dispatch_source_set_event_handler((dispatch_source_t)self->_receiveSource, a4);
  receiveSource = self->_receiveSource;
  v13 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __85__GKAsyncSocketInternal_setupSourcesWithSocket_receiveEventHandler_sendEventHandler___block_invoke;
  handler[3] = &__block_descriptor_36_e5_v8__0l;
  v32 = a3;
  dispatch_source_set_cancel_handler(receiveSource, handler);
  dispatch_source_set_event_handler((dispatch_source_t)self->_sendSource, a5);
  sendSource = self->_sendSource;
  v30[0] = v13;
  v30[1] = 3221225472;
  v30[2] = __85__GKAsyncSocketInternal_setupSourcesWithSocket_receiveEventHandler_sendEventHandler___block_invoke_2;
  v30[3] = &unk_24D466170;
  v30[4] = self;
  dispatch_source_set_cancel_handler(sendSource, v30);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      connectionSocket = self->_connectionSocket;
      v18 = self->_socketName;
      if (v18)
        v19 = -[NSString UTF8String](-[NSString description](v18, "description"), "UTF8String");
      else
        v19 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v35 = v15;
      v36 = 2080;
      v37 = "-[GKAsyncSocketInternal setupSourcesWithSocket:receiveEventHandler:sendEventHandler:]";
      v38 = 1024;
      v39 = 172;
      v40 = 2048;
      v41 = self;
      v42 = 1024;
      v43 = connectionSocket;
      v44 = 2080;
      v45 = v19;
      _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] set up socket", buf, 0x36u);
    }
  }
  dispatch_resume((dispatch_object_t)self->_receiveSource);
  self->_sendSourceSuspended = 0;
  dispatch_resume((dispatch_object_t)self->_sendSource);
  LOBYTE(v20) = 1;
  return v20;
}

uint64_t __85__GKAsyncSocketInternal_setupSourcesWithSocket_receiveEventHandler_sendEventHandler___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __85__GKAsyncSocketInternal_setupSourcesWithSocket_receiveEventHandler_sendEventHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  }
}

- (void)tcpAttachSocketDescriptor:(int)a3
{
  uint64_t v4;
  id connectedHandler;
  NSObject *targetQueue;
  _QWORD block[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = MEMORY[0x24BDAC760];
  v8[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__GKAsyncSocketInternal_tcpAttachSocketDescriptor___block_invoke;
  v9[3] = &unk_24D466170;
  v9[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__GKAsyncSocketInternal_tcpAttachSocketDescriptor___block_invoke_2;
  v8[3] = &unk_24D466170;
  if (!-[GKAsyncSocketInternal setupSourcesWithSocket:receiveEventHandler:sendEventHandler:](self, "setupSourcesWithSocket:receiveEventHandler:sendEventHandler:", *(_QWORD *)&a3, v9, v8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKAsyncSocketInternal tcpAttachSocketDescriptor:].cold.1();
    }
    connectedHandler = self->_connectedHandler;
    if (connectedHandler)
    {
      if (self->_targetQueue)
        targetQueue = self->_targetQueue;
      else
        targetQueue = MEMORY[0x24BDAC9B8];
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __51__GKAsyncSocketInternal_tcpAttachSocketDescriptor___block_invoke_39;
      block[3] = &unk_24D466AC0;
      block[4] = connectedHandler;
      dispatch_async(targetQueue, block);
      -[GKAsyncSocketInternal setConnectedHandler:](self, "setConnectedHandler:", 0);
    }
  }
}

uint64_t __51__GKAsyncSocketInternal_tcpAttachSocketDescriptor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiveData");
}

uint64_t __51__GKAsyncSocketInternal_tcpAttachSocketDescriptor___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendData");
}

uint64_t __51__GKAsyncSocketInternal_tcpAttachSocketDescriptor___block_invoke_39(uint64_t a1)
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDD0FC8];
  v4[0] = CFSTR("Failed to setup sources for socket");
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKAsyncSocket"), -1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)tcpConnectSockAddr:(const sockaddr *)a3 port:(unsigned __int16)a4
{
  unsigned int v4;
  __int128 v6;
  int sa_family;
  const sockaddr *v8;
  uint64_t v9;
  socklen_t v10;
  int ErrorLogLevelForModule;
  uint64_t v12;
  NSObject *v13;
  int connectionSocket;
  NSString *socketName;
  const char *v16;
  id connectedHandler;
  NSObject *targetQueue;
  _QWORD *v19;
  id v20;
  int v21;
  uint64_t v22;
  id v23;
  id v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD block[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _OWORD v31[2];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  GKAsyncSocketInternal *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  char *v45;
  __int16 v46;
  unsigned int v47;
  char v48[16];
  _OWORD v49[2];
  sockaddr v50;
  uint64_t v51;

  v4 = a4;
  v51 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v50.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v50.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  memset(v31, 170, 28);
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)v49 + 14) = v6;
  *(_OWORD *)v48 = v6;
  v49[0] = v6;
  sa_family = a3->sa_family;
  if (sa_family == 30)
  {
    v31[0] = *a3;
    *(sockaddr *)((char *)v31 + 12) = *(sockaddr *)&a3->sa_data[10];
    WORD1(v31[0]) = a4;
    v9 = socket(30, 1, 0);
    inet_ntop(30, (char *)v31 + 8, v48, 0x2Eu);
    v10 = 28;
    v8 = (const sockaddr *)v31;
  }
  else
  {
    if (sa_family != 2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          -[GKAsyncSocketInternal tcpConnectSockAddr:port:].cold.1();
      }
      connectedHandler = self->_connectedHandler;
      if (connectedHandler)
      {
        if (self->_targetQueue)
          targetQueue = self->_targetQueue;
        else
          targetQueue = MEMORY[0x24BDAC9B8];
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke;
        v30[3] = &unk_24D466AC0;
        v30[4] = connectedHandler;
        v19 = v30;
        goto LABEL_48;
      }
      return;
    }
    v8 = &v50;
    v50 = *a3;
    *(_WORD *)v50.sa_data = a4;
    v9 = socket(2, 1, 0);
    v10 = 16;
    inet_ntop(2, &v50.sa_data[2], v48, 0x10u);
  }
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((_DWORD)v9 == -1)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKAsyncSocketInternal tcpConnectSockAddr:port:].cold.2();
    }
    v20 = self->_connectedHandler;
    if (v20)
    {
      if (self->_targetQueue)
        targetQueue = self->_targetQueue;
      else
        targetQueue = MEMORY[0x24BDAC9B8];
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_47;
      v29[3] = &unk_24D466AC0;
      v29[4] = v20;
      v19 = v29;
      goto LABEL_48;
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        connectionSocket = self->_connectionSocket;
        socketName = self->_socketName;
        if (socketName)
          v16 = -[NSString UTF8String](-[NSString description](socketName, "description"), "UTF8String");
        else
          v16 = "<nil>";
        *(_DWORD *)buf = 136316930;
        v33 = v12;
        v34 = 2080;
        v35 = "-[GKAsyncSocketInternal tcpConnectSockAddr:port:]";
        v36 = 1024;
        v37 = 258;
        v38 = 2048;
        v39 = self;
        v40 = 1024;
        v41 = connectionSocket;
        v42 = 2080;
        v43 = v16;
        v44 = 2080;
        v45 = v48;
        v46 = 1024;
        v47 = __rev16(v4);
        _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] connecting to %s:%u", buf, 0x46u);
      }
    }
    v21 = fcntl(v9, 3, 0);
    if (v21 != -1)
    {
      fcntl(v9, 4, v21 | 4u);
      *(_DWORD *)buf = 1;
      setsockopt(v9, 0xFFFF, 4130, buf, 4u);
      if (connect(v9, v8, v10) == -1 && *__error() != 36)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            -[GKAsyncSocketInternal tcpConnectSockAddr:port:].cold.4();
        }
        close(v9);
        v24 = self->_connectedHandler;
        if (v24)
        {
          if (self->_targetQueue)
            targetQueue = self->_targetQueue;
          else
            targetQueue = MEMORY[0x24BDAC9B8];
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_50;
          block[3] = &unk_24D466AC0;
          block[4] = v24;
          v19 = block;
          goto LABEL_48;
        }
      }
      else
      {
        v22 = MEMORY[0x24BDAC760];
        v26[4] = self;
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_2;
        v27[3] = &unk_24D466170;
        v27[4] = self;
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_3;
        v26[3] = &unk_24D466170;
        if (!-[GKAsyncSocketInternal setupSourcesWithSocket:receiveEventHandler:sendEventHandler:](self, "setupSourcesWithSocket:receiveEventHandler:sendEventHandler:", v9, v27, v26))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
              -[GKAsyncSocketInternal tcpConnectSockAddr:port:].cold.3();
          }
          v23 = self->_connectedHandler;
          if (v23)
          {
            if (self->_targetQueue)
              targetQueue = self->_targetQueue;
            else
              targetQueue = MEMORY[0x24BDAC9B8];
            v25[0] = v22;
            v25[1] = 3221225472;
            v25[2] = __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_53;
            v25[3] = &unk_24D466AC0;
            v25[4] = v23;
            v19 = v25;
LABEL_48:
            dispatch_async(targetQueue, v19);
            -[GKAsyncSocketInternal setConnectedHandler:](self, "setConnectedHandler:", 0);
          }
        }
      }
    }
  }
}

uint64_t __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke(uint64_t a1)
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDD0FC8];
  v4[0] = CFSTR("Unknown socket address");
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKAsyncSocket"), -2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_47(uint64_t a1)
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDD0FC8];
  v4[0] = CFSTR("Socket failed");
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKAsyncSocket"), -3, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_50(uint64_t a1)
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDD0FC8];
  v4[0] = CFSTR("Connect failed");
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKAsyncSocket"), -4, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiveData");
}

uint64_t __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendData");
}

uint64_t __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_53(uint64_t a1)
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDD0FC8];
  v4[0] = CFSTR("Failed to setup sources for socket");
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKAsyncSocket"), -1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  int connectionSocket;
  NSString *socketName;
  const char *v7;
  NSObject *syncQueue;
  NSObject *targetQueue;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  GKAsyncSocketInternal *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      connectionSocket = self->_connectionSocket;
      socketName = self->_socketName;
      if (socketName)
        v7 = -[NSString UTF8String](-[NSString description](socketName, "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v12 = v3;
      v13 = 2080;
      v14 = "-[GKAsyncSocketInternal dealloc]";
      v15 = 1024;
      v16 = 311;
      v17 = 2048;
      v18 = self;
      v19 = 1024;
      v20 = connectionSocket;
      v21 = 2080;
      v22 = v7;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] dealloc", buf, 0x36u);
    }
  }

  syncQueue = self->_syncQueue;
  if (syncQueue)
    dispatch_release(syncQueue);
  targetQueue = self->_targetQueue;
  if (targetQueue)
    dispatch_release(targetQueue);
  v10.receiver = self;
  v10.super_class = (Class)GKAsyncSocketInternal;
  -[GKAsyncSocketInternal dealloc](&v10, sel_dealloc);
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  int connectionSocket;
  NSString *socketName;
  const char *v7;
  NSObject *syncQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  GKAsyncSocketInternal *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      connectionSocket = self->_connectionSocket;
      socketName = self->_socketName;
      if (socketName)
        v7 = -[NSString UTF8String](-[NSString description](socketName, "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v11 = v3;
      v12 = 2080;
      v13 = "-[GKAsyncSocketInternal invalidate]";
      v14 = 1024;
      v15 = 326;
      v16 = 2048;
      v17 = self;
      v18 = 1024;
      v19 = connectionSocket;
      v20 = 2080;
      v21 = v7;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] invalidate", buf, 0x36u);
    }
  }
  self->_invalidated = 1;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__GKAsyncSocketInternal_invalidate__block_invoke;
  block[3] = &unk_24D466170;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __35__GKAsyncSocketInternal_invalidate__block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "closeConnectionNow");
}

- (void)sendData:(id)a3 withCompletionHandler:(id)a4
{
  NSObject *syncQueue;
  _QWORD block[7];

  if (self->_invalidated || self->_connectionSocket == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKAsyncSocketInternal sendData:withCompletionHandler:].cold.1();
    }
  }
  else
  {
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__GKAsyncSocketInternal_sendData_withCompletionHandler___block_invoke;
    block[3] = &unk_24D466AE8;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(syncQueue, block);
  }
}

uint64_t __56__GKAsyncSocketInternal_sendData_withCompletionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  void *v6;
  const char *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  void *v13;
  const char *v14;
  uint64_t result;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 32), "appendData:", a1[5]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v4 = a1[4];
      v5 = *(_DWORD *)(v4 + 28);
      v6 = *(void **)(v4 + 72);
      if (v6)
        v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
      else
        v7 = "<nil>";
      v8 = objc_msgSend(*(id *)(a1[4] + 32), "length");
      v16 = 136316674;
      v17 = v2;
      v18 = 2080;
      v19 = "-[GKAsyncSocketInternal sendData:withCompletionHandler:]_block_invoke";
      v20 = 1024;
      v21 = 344;
      v22 = 2048;
      v23 = v4;
      v24 = 1024;
      v25 = v5;
      v26 = 2080;
      v27 = v7;
      v28 = 1024;
      v29 = v8;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] appending data [%u]", (uint8_t *)&v16, 0x3Cu);
    }
  }
  if (*(_BYTE *)(a1[4] + 24))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v11 = a1[4];
        v12 = *(_DWORD *)(v11 + 28);
        v13 = *(void **)(v11 + 72);
        if (v13)
          v14 = (const char *)objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
        else
          v14 = "<nil>";
        v16 = 136316418;
        v17 = v9;
        v18 = 2080;
        v19 = "-[GKAsyncSocketInternal sendData:withCompletionHandler:]_block_invoke";
        v20 = 1024;
        v21 = 347;
        v22 = 2048;
        v23 = v11;
        v24 = 1024;
        v25 = v12;
        v26 = 2080;
        v27 = v14;
        _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] resuming sendSource", (uint8_t *)&v16, 0x36u);
      }
    }
    dispatch_resume(*(dispatch_object_t *)(a1[4] + 16));
    *(_BYTE *)(a1[4] + 24) = 0;
  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)closeConnectionNow
{
  uint64_t v3;
  NSObject *v4;
  int connectionSocket;
  NSString *socketName;
  const char *v7;
  NSObject *sendSource;
  uint64_t v9;
  NSObject *v10;
  int v11;
  NSString *v12;
  const char *v13;
  int *p_connectionSocket;
  uint64_t v15;
  NSObject *v16;
  int v17;
  NSString *v18;
  const char *v19;
  NSObject *v20;
  id connectedHandler;
  NSObject *targetQueue;
  id receiveDataHandler;
  NSObject *v24;
  _QWORD v25[5];
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  GKAsyncSocketInternal *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      connectionSocket = self->_connectionSocket;
      socketName = self->_socketName;
      if (socketName)
        v7 = -[NSString UTF8String](-[NSString description](socketName, "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v28 = v3;
      v29 = 2080;
      v30 = "-[GKAsyncSocketInternal closeConnectionNow]";
      v31 = 1024;
      v32 = 360;
      v33 = 2048;
      v34 = self;
      v35 = 1024;
      v36 = connectionSocket;
      v37 = 2080;
      v38 = v7;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] closing down connections...", buf, 0x36u);
    }
  }
  sendSource = self->_sendSource;
  if (sendSource)
  {
    dispatch_source_cancel(sendSource);
    if (self->_sendSourceSuspended)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v11 = self->_connectionSocket;
          v12 = self->_socketName;
          if (v12)
            v13 = -[NSString UTF8String](-[NSString description](v12, "description"), "UTF8String");
          else
            v13 = "<nil>";
          *(_DWORD *)buf = 136316418;
          v28 = v9;
          v29 = 2080;
          v30 = "-[GKAsyncSocketInternal closeConnectionNow]";
          v31 = 1024;
          v32 = 365;
          v33 = 2048;
          v34 = self;
          v35 = 1024;
          v36 = v11;
          v37 = 2080;
          v38 = v13;
          _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] resuming sendSource", buf, 0x36u);
        }
      }
      dispatch_resume((dispatch_object_t)self->_sendSource);
      self->_sendSourceSuspended = 0;
    }
    v20 = self->_sendSource;
    if (v20)
    {
      dispatch_release(v20);
      self->_sendSource = 0;
    }
    p_connectionSocket = &self->_connectionSocket;
  }
  else
  {
    p_connectionSocket = &self->_connectionSocket;
    if (self->_connectionSocket == -1)
      goto LABEL_28;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v17 = *p_connectionSocket;
        v18 = self->_socketName;
        if (v18)
          v19 = -[NSString UTF8String](-[NSString description](v18, "description"), "UTF8String");
        else
          v19 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v28 = v15;
        v29 = 2080;
        v30 = "-[GKAsyncSocketInternal closeConnectionNow]";
        v31 = 1024;
        v32 = 373;
        v33 = 2048;
        v34 = self;
        v35 = 1024;
        v36 = v17;
        v37 = 2080;
        v38 = v19;
        _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] closing socket", buf, 0x36u);
      }
    }
    close(*p_connectionSocket);
  }
  *p_connectionSocket = -1;
LABEL_28:
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    connectedHandler = self->_connectedHandler;
    if (connectedHandler)
    {
      if (self->_targetQueue)
        targetQueue = self->_targetQueue;
      else
        targetQueue = MEMORY[0x24BDAC9B8];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __43__GKAsyncSocketInternal_closeConnectionNow__block_invoke;
      block[3] = &unk_24D466AC0;
      block[4] = connectedHandler;
      dispatch_async(targetQueue, block);
      -[GKAsyncSocketInternal setConnectedHandler:](self, "setConnectedHandler:", 0);
    }
    else
    {
      receiveDataHandler = self->_receiveDataHandler;
      if (self->_targetQueue)
        v24 = self->_targetQueue;
      else
        v24 = MEMORY[0x24BDAC9B8];
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __43__GKAsyncSocketInternal_closeConnectionNow__block_invoke_2;
      v25[3] = &unk_24D466AC0;
      v25[4] = receiveDataHandler;
      dispatch_async(v24, v25);

      self->_receiveDataHandler = 0;
    }
  }
}

uint64_t __43__GKAsyncSocketInternal_closeConnectionNow__block_invoke(uint64_t a1)
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDD0FC8];
  v4[0] = CFSTR("Connection closed prematurely");
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKAsyncSocket"), -5, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __43__GKAsyncSocketInternal_closeConnectionNow__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, double))(result + 16))(result, 0, 0, 0.0);
  return result;
}

- (void)receiveData
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  v1 = *(void **)(v0 + 72);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_215C5C000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] invalidated", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_20();
}

uint64_t __36__GKAsyncSocketInternal_receiveData__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(a1 + 40), *(int *)(a1 + 56), 1), 0, *(double *)(a1 + 48));
}

- (void)sendData
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  v1 = *(void **)(v0 + 72);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_215C5C000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] invalidated", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_20();
}

uint64_t __33__GKAsyncSocketInternal_sendData__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (id)receiveDataHandler
{
  return self->_receiveDataHandler;
}

- (void)setReceiveDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)connectedHandler
{
  return self->_connectedHandler;
}

- (void)setConnectedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)socketName
{
  return self->_socketName;
}

- (void)setSocketName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (void)setupSourcesWithSocket:receiveEventHandler:sendEventHandler:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  v1 = *(void **)(v0 + 72);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  __error();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_1(&dword_215C5C000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] fcntl get failed (errno=%d)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4_2();
}

- (void)setupSourcesWithSocket:receiveEventHandler:sendEventHandler:.cold.2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  v1 = *(void **)(v0 + 72);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  __error();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_1(&dword_215C5C000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] fcntl set failed (errno=%d)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4_2();
}

- (void)setupSourcesWithSocket:receiveEventHandler:sendEventHandler:.cold.3()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  v1 = *(void **)(v0 + 72);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  __error();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_1(&dword_215C5C000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] setsockopt set failed (errno=%d)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4_2();
}

- (void)tcpAttachSocketDescriptor:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  v1 = *(void **)(v0 + 72);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_215C5C000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] failed to attach socket", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_20();
}

- (void)tcpConnectSockAddr:port:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  v1 = *(void **)(v0 + 72);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_215C5C000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] unknown sockaddr??", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_20();
}

- (void)tcpConnectSockAddr:port:.cold.2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  v1 = *(void **)(v0 + 72);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  __error();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_1(&dword_215C5C000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] socket failed (errno=%d)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4_2();
}

- (void)tcpConnectSockAddr:port:.cold.3()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  v1 = *(void **)(v0 + 72);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_215C5C000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] failed to attach to socket", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_20();
}

- (void)tcpConnectSockAddr:port:.cold.4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  v1 = *(void **)(v0 + 72);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  __error();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_1(&dword_215C5C000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] connect failed (errno=%d)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4_2();
}

- (void)sendData:withCompletionHandler:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  v1 = *(void **)(v0 + 72);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_215C5C000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] invalidated", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_20();
}

@end
